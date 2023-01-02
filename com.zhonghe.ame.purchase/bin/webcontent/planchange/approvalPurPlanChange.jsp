<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<head>
    <title>合同维护</title>
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
					<table style="table-layout: fixed;" id="table_file">
		        	<tr>
		        		<td class="form_label" align="right" style="width:100px;">年度采购计划名称：</td>
		                <td colspan="3">
		                	<input id="id" name="id" class="nui-hidden"readonly="readonly"/>
		                    <input id="name" name="name" class="nui-textbox" required="true"  style="width:100%;" readonly="readonly"/>
		                </td>
		        	</tr>
		        	<tr>
		        		<td  class="form_label" align="right" style="width:100px;">计划年度：</td>
		                <td colspan="1">
		                    <input id="year" name="year" style="width:100%;" class="nui-textbox" style="width:150px;" readonly="readonly"/>   
		                </td>
		                <td class="form_label" align="right" style="width:100px;">提报人姓名：</td>
		                <td>
		                    <input class="nui-textbox"  name="infomantUser" id="infomantUser" required="true" style="width:100%;"    readonly="readonly"/>
		                </td>
		                <td class="form_label" align="right" style="width:80px;">采购单位：</td>
		                <td>
		                <input id="needOrgName" name="needOrgName" class="nui-textbox" required="true" style="width:100%;"  readonly="readonly"/>
		        	</tr>
		           	<tr>
		                <td class="form_label" align="right" style="width:100px;">采购类型：</td>
		                <td >    
		                    <input class="nui-dictcombobox" name="type" id="type" dictTypeId="ZH_PURCHASE" required="true" onvaluechanged="loadItem()" style="width:100%;" readonly="readonly"/>
		                </td>
		                <td class="form_label" align="right" style="width:120px;">计划总金额(万元)：</td>
		                <td >
		                    <input id="budgetAmount" name="budgetAmount" class="nui-textbox" required="true"   readOnly="readOnly"  style="width:100%;" />
		                </td>
		                 <td class="form_label" align="right" style="width:100px;">物项归口部门：</td>
		                <td >
		                    <input id="putunder" name="putunder" class="nui-dictcombobox"  dictTypeId="ZH_PUTUNDER"  onvaluechanged="loadItem()"  style="width:100%;" readonly="readonly"/>
		                </td>
		             </tr>
		          	<tr>
		          		<td class="form_label" style="width:120px;" align="right">备注：</td>
		                <td  colspan="7">    
		                    <input style="width:100%;height:60px;" name="remark" class="nui-textarea" id="remark" readonly="readonly"/>
		                </td>
		          	</tr>
		        </table>
		    </div>
    	</form>
    	</fieldset>
        <fieldset style="border:solid 1px #aaa;padding:3px;width: 98%">
	    	<legend>采购预算明细</legend>
	    	<div id="grid_traveldetail" class="nui-datagrid" style="width: 100%;height: auto;" allowCellSelect="true" 
	    		showPager="false" allowCellEdit="false" multiSelect="true" dataField="purPlanItem"  onshowrowdetail="onShowRowDetail" allowCellwrap="true"
	    		url="com.zhonghe.ame.purchase.planchange.queryPurPlanItemChange.biz.ext">
	            <div property="columns">
	           		<div type="indexcolumn" align="center" headerAlign="center">序号</div>
	           		<div type="expandcolumn" width="40">原计划</div>
	           		<div  field="code"  align="center" headerAlign="center"  visible="false" >计划编号
							<input  name="code"  property="editor"  enabled="true" class="nui-textbox" readOnly="true" >
	                </div>
	                <div  field="purchaseFirstCode"  align="center" headerAlign="center"  visible="false">物项大类编码
							<input  name="purchaseFirstCode"  property="editor"  enabled="true" class="nui-textbox" readOnly="true" onbuttonclick="onButtonEdit123" />
	                </div>
	                <div field=purchaseFirstName  align="center" headerAlign="center"  >物项大类名称 
	                	<input  name="purchaseFirstName" property="editor" class="nui-textbox"   readOnly="true"  vtype="maxLength:100"/>
	                </div> 
	                <div  field="purchaseTwoCode"  align="center" headerAlign="center" visible="false">物项中类编码
							<input  property="editor"  name="purchaseTwoCode" class="nui-textbox"   enabled="false" />
	                </div>
	                <div  field="purchaseTwoName"  align="center" headerAlign="center" renderer="onViewL" >物项中类名称 
	                	<input  property="editor"  name="purchaseTwoName" class="nui-textbox"   readOnly="true"  vtype="maxLength:100" />
	                </div> 
	                <div field="purchaseThreeCode" id="purchaseThreeCode"  align="center" headerAlign="center"  readOnly="true"  visible="false">物项小类编码
								<input  property="editor"  name="purchaseThreeCode" class="nui-textbox" enabled="false" />
	                </div>
	                <div field="purchaseThreeName"   align="center" headerAlign="center" renderer="onViewL" visible="false">物项小类名称 
	                	<input   property="editor" class="nui-textbox"  name="purchaseThreeName"  />
	                </div>
	                <div field="materialName"   align="center" headerAlign="center" vtype="required"  renderer="onViewL" >采购物项名称 
	                	<input   property="editor" class="nui-textbox" name="materialName"  required="true"/>
	                </div>
	                <div field="unit"  width="80" align="center" headerAlign="center" renderer="unitValue">单位
	                	<input property="editor" class="nui-dictcombobox" dictTypeId="ZH_UNIT"   name="unit"/>
	                </div> 
	                <div field="oldBudgetAmount"  width="100" align="center" headerAlign="center"  vtype="required">原预算金额(万元)
	                </div>
	                <div field="budgetAmount"  width="100" align="center" headerAlign="center"  vtype="required">变更后金额(万元)
	                	<input property="editor" class="nui-spinner" minValue="0"  maxValue="999999999" name="budgetAmount" visible="true"/>
	                </div>
	                <div field="remark"  width="100" align="center" headerAlign="center"  vtype="required">调整原因
	                	<input property="editor" class="nui-textarea" name="remark" />
	                </div>
	                
	                <div field="technologyNeed"  width="100" align="center" headerAlign="center" >技术要求
	                	<input property="editor" class="nui-textbox"   name="technologyNeed" />
	                </div>
	                <div field="keyIssus"  width="100" align="center" headerAlign="center"  renderer="onYn" visible="false">是否关键事项
	                	<input property="editor"  class="nui-dictcombobox" name="keyIssus"  dictTypeId="MIS_YN" required="true"  style="width:100%;"/>
	                </div>
	                <div field="isProject"  width="100" align="center" headerAlign="center" value="1" renderer="onYn" visible="false"> 是否工程建设下项目采购
	                	<input property="editor" class="nui-dictcombobox" name="isProject" dictTypeId="MIS_YN" onvaluechanged="isProject(e)"  required="true" style="width:100%;"/>
	                </div>
	                <div field="projectname"  width="100" align="center" headerAlign="center" visible="false">所属项目
	                	<input property="editor" class="nui-textbox"  name="projectname" />
	                </div>
	                <div field="number"  width="80" align="center" headerAlign="center" visible="false" vtype="required" >数量
	                	<input property="editor"  class="nui-spinner" minValue="0"  maxValue="999999999"  id="number" name="number" />
	                </div> 
	                <div field="contractname"  width="100" align="center" headerAlign="center" renderer="onViewL" visible="false">拟签合同名称
	                	<input property="editor" class="nui-textbox" id="contractname" name="contractname" />
	                </div>
	                <div field="plansimplementtime"  width="100" align="center" headerAlign="center"  visible="false" vtype="required">拟实施采购时间
	                	<input property="editor" class="nui-datepicker" id="plansimplementtime" name="plansimplementtime"/>
	                </div>
	                <div field="contractamount"  width="100" align="center" headerAlign="center" renderer="onViewL" visible="false">拟签合同金额(元)
	                	<input property="editor"   class="nui-spinner"  minValue="0"  maxValue="999999999"  id="contractamount" name="contractamount" />
	                </div>
	            </div>
        	</div>
         </fieldset>
		<fieldset id="field2" style="border:solid 1px #aaa;padding:1px;width: 98%">
			
			<div style="visibility: hidden;display: none;">	
				<jsp:include page="/ame_common/detailFile.jsp"/>
			</div>
			<jsp:include page="/ame_common/inputFile.jsp"/>
			<jsp:include page="/ame_common/misOpinion_Freeflow.jsp"/>
		</fieldset>
       
	</div>
</div>
<div id="detailGrid_Form" style="display:none;width:99%">
	    <div id="reve_grid" class="nui-datagrid" dataField="purPlanItem" showSummaryRow="true" allowCellwrap="true"
	    	url="com.zhonghe.ame.purchase.planchange.queryOldPurPlanItem.biz.ext" showPager="false" allowCellEdit="false" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true">			            
	        <div property="columns">
	           	<div type="indexcolumn" align="center" headerAlign="center">序号</div>
           		<div  field="code" width="110" align="center" headerAlign="center"  visible="false" >计划编号
						<input  name="code"  property="editor"  enabled="true" class="nui-textbox" readOnly="true" >
                </div>
                <div field=purchaseFirstName width="90" align="center" headerAlign="center"  >物项大类名称 
                	<input  name="purchaseFirstName" property="editor" class="nui-textbox"   readOnly="true" />
                </div> 
                <div  field="purchaseTwoName" width="130" align="center" headerAlign="center" >物项中类名称 
                	<input  property="editor"  name="purchaseTwoName" class="nui-textbox"   readOnly="true"  />
                </div> 
                <div field="purchaseThreeName"  width="110" align="center" headerAlign="center" visible="false">物项小类名称 
                	<input   property="editor" class="nui-textbox"  name="purchaseThreeName" readOnly="true"/>
                </div>
                <div field="materialName"  width="110" align="center" headerAlign="center" vtype="required">采购物项名称 
                	<input   property="editor" class="nui-textbox" name="materialName"  required="true"/>
                </div>
                <div field="unit"  width="80" align="center" headerAlign="center" renderer="unitValue">单位
                	<input property="editor" class="nui-dictcombobox" dictTypeId="ZH_UNIT"   name="unit"/>
                </div> 
               
                <div field="budgetAmount"  width="100" align="center" headerAlign="center"  vtype="required">预算金额(万元)
                </div>
                <div field="remark"  width="100" align="center" headerAlign="center"  vtype="required">调整原因
                	<input property="editor" class="nui-textarea" name="remark" />
                </div>
                <div field="technologyNeed"  width="100" align="center" headerAlign="center" >技术要求
                	<input property="editor" class="nui-textbox"   name="technologyNeed" />
                </div>
	        </div>
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
    	var reve_grid = nui.get("reve_grid");
	    var grid = nui.get("grid_traveldetail");
	    var opioionform = new nui.Form("opioionform");
	    var purType,orgid; //采购类型,归口部门ID
	   	var istype,titleText,countersignUsers;
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
			        	/* if(o.purPlan.type!=2){
		   					grid.hideColumns([13,14,12])
			        	}
			        	if(o.purPlan.type==3){
			        		grid.hideColumns([4,6,8])
			        	} */
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
	   	
	   	 function getHTZQ(e){
        	if(e.field == "budgetAmount"){
	        	var tempData = nui.get(grid_traveldetail).data;
	        	var a=tempData.length;
	        	var b=0;
	        	  debugger
	        	for(var i=0;i<a;i++){
	        		if(tempData[i].budgetAmount!=undefined){
			    		b+=parseInt(tempData[i].budgetAmount);
	        		}else{
	        			var x = 0;
	        			b+=x;
	        		}
		    	}
		    	 nui.get("totalPrice").setValue(b)
        	}
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
		
			//展示明细
	function onShowRowDetail(e) {

	 	var grid = e.sender;
    	var row = e.record;
        var td = grid.getRowDetailCellEl(row);
        td.appendChild(detailGrid_Form);
        detailGrid_Form.style.display = "block";
        clog(row.oldItemId)
        reve_grid.load({ id: row.oldItemId });
	}
</script>
</html>