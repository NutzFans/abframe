<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<head>
    <title>采购计划审批</title>
    <style type="text/css">
    	html, body{font-size:12px;padding:0;margin:0;border:0;height:100%;overflow:hidden;width:100%;}
    </style>
</head>
<body>
 <%long workitemid = (Long)request.getAttribute("workItemID");%> 
<div class="nui-fit">
    <div>
        <fieldset style="border:solid 1px #aaa;padding:1px;width: 98%">
            <legend>采购计划信息</legend>
            <form id="form1" method="post">
				<div style="padding: 5px;  ">
					<table style="table-layout: fixed; width: 100%" id="table_file">
		        	<tr>
		        		<td colspan="1" class="form_label" align="right" style="width:120px;">年度采购计划名称：</td>
		                <td colspan="5">
		                	<input id="id" name="id" class="nui-hidden"readonly="readonly"/>
		                    <input id="name" name="name" class="nui-textbox" style="width:100%;" readonly="readonly"/>
		                </td>
		        	</tr>
		        	<tr>
		                <td colspan="1" class="form_label" align="right" style="width:100px;">提报人姓名：</td>
	                    <td colspan="1">
	                        <input class="nui-textbox"  name="infomantUser" id="infomantUser" style="width:100%;" readonly="readonly"/>
	                    </td>
		                <td colspan="1" class="form_label" align="right" style="width:100px;">采购单位：</td>
	                    <td colspan="3">
	                    	<input id="needOrgName" name="needOrgName" class="nui-textbox" style="width:100%;" readonly="readonly"/>
						</td>
	            	</tr>
	            	<tr>
	               		<td class="form_label" align="right" style="width:120px;">计划年度：</td>
		                <td colspan="1">
		                    <input id="year" name="year" style="width:100%;" class="nui-textbox" style="width:100%;" readonly="readonly"//>   
		                </td>
	                    <td class="form_label" align="right" style="width:100px;">采购类型：</td>
	                    <td colspan="1">    
	                        <input class="nui-dictcombobox" name="type" id="type" dictTypeId="ZH_PURCHASE" readonly="readonly"  style="width:100%;"/>
	                    </td>
	                    <td class="form_label" align="right" style="width:120px;">计划总金额(万元)：</td>
		                <td colspan="1">
		                    <input id="budgetAmount" name="budgetAmount" class="nui-textbox" readonly="readonly" style="width:100%;" />
		                </td>
	                 </tr>
	               	<tr>
	               		<td class="form_label" align="right" style="width:120px;">物项归口部门：</td>
		                <td colspan="3">
		                    <input id="putunder" name="putunder" class="nui-dictcombobox"  dictTypeId="ZH_PUTUNDER"  multiSelect="true"  readonly="readonly" style="width:100%;" />
		                </td>
		                <td class="form_label" align="right" style="width:120px;">财务年度预算科目：</td>
		                <td colspan="1">
		                    <input id="SUBJECT" name="subject" class="nui-textbox"  style="width:100%;" readonly="readonly"/>
		                </td>
	               	</tr>
	                 <!-- <tr>
	              		<td class="form_label" style="width:120px;" align="right">归口部门下可采购物项：</td>
	                    <td  colspan="6">    
	                        <input style="width:100%;height:60px;" id="items" type="checkbox" class="nui-textarea" readonly="readonly"/>
	                    </td>
	              	</tr> -->
	              	<tr>
	              		<td class="form_label" style="width:120px;" align="right">备注：</td>
	                    <td  colspan="6">    
	                        <input style="width:100%;height:120px;" name="remark" class="nui-textarea" id="remark"/>
	                    </td>
	              	</tr>
		        </table>
		    </div>
    	</form>
    	</fieldset>
        <fieldset style="border:solid 1px #aaa;padding:1px;width: 98%">
	    	<legend>采购预算明细</legend>
	    	<div id="grid_traveldetail" class="nui-datagrid" style="width: 100%;height: auto;" allowCellSelect="true" 
	    		showPager="false" allowCellEdit="false" multiSelect="true" dataField="purPlanItem"  
	    		url="com.zhonghe.ame.purchase.purchaseItems.queryPurPlanItem.biz.ext">
	            <div property="columns">
	           		<div type="checkcolumn"></div>
	           		<div type="indexcolumn" align="center" headerAlign="center">序号</div>
	           			<div field="code" width="110" align="center" headerAlign="center" >计划编号</div>
	                <div field="purchaseFirstCode" width="110" align="center" headerAlign="center"  visible="false">物项大类编码</div>
	                <div field=purchaseFirstName width="100" align="center" headerAlign="center"  >物项大类名称  </div> 
	                <div field="purchaseTwoCode" width="110" align="center" headerAlign="center" visible="false">中类编码</div>
	                <div field="purchaseTwoName" width="110" align="center" headerAlign="center"  >中类名称 </div> 
	                <!-- <div field="purchaseThreeCode" width="110" align="center" headerAlign="center"  readOnly="true"  visible="false">小类编码</div>
	                <div field="purchaseThreeName"  width="100" align="center" headerAlign="center"  readOnly="true" >小类名称</div> -->
	                <div field="materialName"  width="110" align="center" headerAlign="center" vtype="required" headerStyle="color:red">采购物项名称 
	                	<input property="editor" class="nui-textbox" name="materialName"  width="100%"  height="100%" required="true"/>
	                </div>
	                <div field="unit"  width="60" align="center" headerAlign="center" renderer="unitValue">单位
	                	<input property="editor" class="nui-dictcombobox" width="100%" dictTypeId="ZH_UNIT"   name="unit"/>
	                </div> 
	                <div  field="onePrice" width="100"  align="center" headerAlign="center" vtype="required" headerStyle="color:red">单价(万元)
										<input id="supplierName" name="onePrice" width="100%" property="editor"  class="nui-textbox" />
	                </div>
	                <div  field="number" width="100"  align="center" headerAlign="center"  vtype="required" headerStyle="color:red">数量
										<input id="number" name="onePrice" property="editor" width="100%"  class="nui-textbox"/>
	                </div>
	                <div field="budgetAmount"  width="100" align="center" headerAlign="center" headerStyle="color:red" vtype="required">预算金额(万元)
	                	<input property="editor" class="nui-spinner" minValue="0" width="100%" maxValue="999999999" name="budgetAmount" readonly="readonly" visible="true"/>
	                </div>
	                <div field="remark"  width="100" align="center" headerAlign="center"  >备注
	                	<input property="editor" class="nui-textarea" name="remark" width="100%" />
	                </div>
	                <div field="centralizedDept"  width="100" align="center" headerAlign="center"  renderer="zhPutUnder">物项归口部门</div>
	            </div>
        	</div>
         </fieldset>
		<fieldset id="field2" style="border:solid 1px #aaa;padding:1px;width: 98%">
		   <jsp:include page="/ame_common/inputFile.jsp"/>
	     <jsp:include page="/ame_common/misOpinion_Freeflow.jsp"/>
		</fieldset>
	</div>
</div>
<div style="text-align:center;padding:8px;border-width:1px 0px 0px 0px;" class="nui-toolbar">          
	<a class="nui-button" onclick="countersign()" id="countersign" iconCls="icon-user" style="width: 80px;margin-right: 20px;">加签</a>     
    <a class="nui-button"  onclick="submit()" iconCls="icon-ok" style="width:60px;margin-right:20px;">提交</a>       
    <a class="nui-button" onclick="closeCancel" iconCls="icon-close" style="width:60px;">关闭</a>
</div>        
</body>	
<script type="text/javascript">
	    nui.parse();
	    var workItemID = <%=request.getParameter("workItemID")%>;
	    var form = new nui.Form("#form1");
	    var grid = nui.get("grid_traveldetail");
	    var opioionform = new nui.Form("opioionform");
	    var purType,orgid; //采购类型,归口部门ID
	   	var istype,titleText;
	   	var countersignUsers;
	   	init();
	   	
	   	function init(){
	   		var data = {workitemid:<%=workitemid%>};
	   		var json = nui.encode(data);
	   		nui.ajax({	
					url: "com.zhonghe.ame.purchase.purchaseItems.queryPurPlanDetail.biz.ext",
				    type: 'POST',
			        data: json,
			        success: function (o) {
			        	form.setData(o.purPlan);
			        	if(o.purPlan.type!=2){
		   						grid.hideColumns([13,14])
			        	}
			        	if(o.purPlan.type==3){
			        		grid.hideColumns([4,6])
			        	}
			       		 nui.get("backTo").setData(o.purPlan.backList);
			       		 
			       		  var grid_0 = nui.get("grid_0");
        				 grid_0.load({"groupid":"PurchasePlan","relationid":o.purPlan.id});
						 grid_0.sortBy("fileTime","desc");
			       		 
			       		 var grid1 = nui.get("datagrid1");
						 grid1.load({processInstID:o.purPlan.processid});
						 grid1.sortBy("time", "desc");
						 //初始化处理意见
						 initMisOpinion({auditstatus:"1"});
						 var jsonData = {"planId":o.purPlan.id}
			       		 grid.load(jsonData);
			        },
				    error: function (jqXHR, textStatus, errorThrown) {
				        alert(jqXHR.responseText);
				    }
			    }); 
	   	}
	   	
       	function countersign(){
        	selectOmEmployee();
        }
       	
       	function selectOmEmployee(){
	    	var btnEdit = this;
	        nui.open({
	            url: "<%=request.getContextPath() %>/contractPact/selectUsers.jsp",
	            title: "立项单位经办人",
	            width: 430,
	            height: 400,
	            ondestroy: function (action) {
	            	console.log(action)
	            	var user,users = "【";
	            	countersignUsers =[];
	                if (action == "ok") {
	                    var iframe = this.getIFrameEl();
	                    var data = iframe.contentWindow.GetData();
	                    data = nui.clone(data);    //必须
	                    if (data) {
	                    	console.log(data)
                        	for(var i = 0;i<data.length ;i++){
                        		user = {};
                        		user.id = data[i].userid
                        		user.name = data[i].empname
                        		user.typeCode = "person"
                        		countersignUsers.push(user);
                        		if(i==0){
                        			users = users +data[i].empname;
                        		}else{
                        		
	                        		users = users +","+data[i].empname;
                        		}
                        	}
                        	users = users+"】";
                        	titleText ="增加审批人员"+ users +"并提交";
		                    form2.submit();
	                       }
	                    }
	
	                }
	            });
	        }
       	 
	   	function submit(){
	    	var auditstatus = nui.get("auditstatus").getValue();
	    	if(auditstatus == "2"){	//终止流程
	    		titleText = "终止";
	    	}else if(auditstatus == "0"){	//退回流程
	    		if(!nui.get("backTo").getValue()){
	    			showTips("退回环节不能为空！");
	    			return;
	    		}
	    		titleText = "退回";
	    	}else if(auditstatus == "1"){	//提交流程
	    		titleText = "提交";
	    	}
	    	form2.submit();
    	}
    	// 提交 
	    function SaveData(){
	    	saveData();
	    }
   		function saveData(json){
   			nui.confirm("确定" + titleText + "流程吗？", "操作提示",function (action) {            
	            if (action == "ok") {
					var misOpinion = opioionform.getData().misOpinion;//审核意见
	            	/* nui.get("appButton").setEnabled(false); */
	            	var json = {misOpinion:misOpinion,workItemID: <%=workitemid %>,"countersignUsers":countersignUsers};
	            	var msgBoxId = form.loading("正在处理...", "请稍后");
	            	ajaxCommon({
			  			url: "com.zhonghe.ame.purchase.purchaseItems.approvalPurPlan.biz.ext",
						data: json,
						success: function (o){
						nui.unmask(document.body);
						if(o.result == "success"){
				        	showTips(titleText + "成功","系统提示")
				        		closeOk();
						}else{
							showTips("提交失败，请联系信息技术部人员！","danger" )
					    	closeOk();
						}
					}
	  				}) 
	            }
	        });
	    	 
		}
		
		function unitValue(e){
	   		return nui.getDictText("ZH_UNIT",e.value);
		}	   		
	   	function onYn(e){
	   		return nui.getDictText("MIS_YN",e.value);
		}
		
	function zhPutUnder(e) {
		return nui.getDictText('ZH_PUTUNDER',e.value);//设置业务字典值
	}
</script>
</html>