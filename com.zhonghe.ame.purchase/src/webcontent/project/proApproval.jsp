<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<head>
	<title>采购计划立项申请 </title>
	<style type="text/css">
	    body{
	        margin: 0;padding: 0;border: 0;width: 100%;height: 100%;overflow: hidden;	
	    }
	    form td {
			  padding:2px;
			}
			
			.mini-textbox-border,
	    .mini-textbox-input,
	    .mini-buttonedit-border,
	    .mini-buttonedit-input,
	    .mini-textboxlist-border
	    .mini-buttonedit-buttons,
	    .mini-buttonedit-button,
	    .mini-textboxlist-close
	    .mini-textboxlist-item
	    {
/* 	        border:0;background:none;cursor:default;font-size: 12pt;padding-right:6px; */
	    }
    </style>
</head>
<body>
 <%long workitemid = (Long)request.getAttribute("workItemID");%> 
	<div class="nui-fit">
		<div class="mini-panel" title="" style="width: 100%;">
			<fieldset id="field1" style="border: solid 1px #aaa;padding: 0px;width: 98%;">
				<legend>采购立项 </legend>
				<form id="form1" method="post" >
					<input name="files" id="fileids" class="nui-hidden"/>
					<input name="files1" id="fileids1" class="nui-hidden"/>
					<input class="nui-hidden" name="id"/>
					<div style="padding: 5px; ">
						<table style="table-layout: fixed;width: 100%;">
							<tr>
								<td colspan="1" align = "right" style="width: 100px">立项名称：</td>
								<td colspan="3">
									<input name="proAppName"  class="nui-textbox" style="width: 100%"/>
									<input name="putunder" id="putunder" class="nui-hidden"/> 
								</td>
								<td colspan="1" align="right" style="width:80px">立项编号：</td>
								<td colspan="2">
									<input name="proAppCode"  class="nui-textbox" style="width: 100%"/>
								</td>
								<td colspan="1" align="right" style="width: 100px">立项金额(万元)：</td>
								<td colspan="1">
									<input name="proAppApplyPrice"  id="proAppApplyPrice" class="nui-textbox" readonly="readonly" style="width: 100%" emptyText="系统自动计算"/>
								</td>
								<td colspan="1" align="right" style="width: 90px">申请单位：</td>
								<td colspan="2">
									<input
										name="proAppOrgName" id="proAppOrgName" class="nui-textbox" style="width:100%;"/>
								</td>

							</tr>
							<tr>
								<td colspan="1" align="right" style="width: 110px">涉密协作配套：</td>
								<td colspan="1">
									<input id="isSmpt" name="isSmpt" class="nui-dictcombobox" dictTypeId="ZH_YN" style="width:100%;"/>
								</td>
<!-- 								<td colspan="1" align="right" style="width: 110px">采购密级：</td> -->
<!-- 								<td colspan="1"> -->
<!-- 									<input id="classified" name="classified" class="nui-dictcombobox" dictTypeId="ZH_CLASSIFIED"  style="width:100%;"/> -->
<!-- 								</td> -->
								<td colspan="1" align="right">费用来源：</td>
								<td colspan="2">
									<input name="costFrom" class="nui-dictcombobox" dictTypeId="ZH_COST_FROM" style="width:100%;"/>
								</td>
								<td colspan="1" align="right">所属项目名称：</td>
								<td colspan="4">
									<input name="projectId"  class="nui-textbox" style="width: 100%" />
								</td>
								
							</tr>
							<tr >
								<td colspan="1" align="right">集采类型：</td>
								<td colspan="1">    
									<input class="nui-dictcombobox" name="type" id="type" dictTypeId="ZH_PURCHASE" visible="true" style="width:100%;"/>
								</td>
								<td colspan="1" align="right">物项类别：</td>
								<td colspan="1">
									<input id="proAppObjType" name="proAppObjType"  class="nui-dictcombobox" dictTypeId="MIS_APPOBJTYPE" style="width:100%;" />
								</td>
								<td colspan="1" align="right">采购方式：</td>
		            <td colspan="2">    
		                <input id="purchasMode" name="purchasMode" class="nui-dictcombobox" dictTypeId="ZH_CGFS" style="width:100%;"/>
		            </td>
		            <td colspan="1" align="right" style="width:120px;">是否招标限价：</td>
	            	<td colspan="1" >    
	                <input id="tenderLimit" name="tenderLimit" class="nui-dictcombobox"  dictTypeId="ZH_YN" style="width:100%;"/>
	            	</td>
								<td colspan="1" align="right" style="width: 100px">招标限价金额：</td>
								<td colspan="1">
									<input id="limit" name="limit" class="nui-textbox" required="ture"  style="width:100%;"/>
								</td>
							</tr>
							<tr>
								<td colspan="1" align="right">采购方式理由：</td>
	            	<td colspan="5">   
	            		<input id="wayReason" name="wayReason"  class="nui-textarea" style="width:100%;" emptyText="若为一级集采，则此项非必填"/>
	        			</td>
	        			<td colspan="1" align="right" style="width:120px;">立项范围：</td>
                <td colspan="5">    
                    <input name="proAppRange" style="width:100%;"  class="nui-textarea"  />
                </td>
							</tr>
							<tr>
									<td colspan="1" align="right" style="width: 100px">是否电子采购：</td>
									<td colspan="1">      
                    <input id="isDzcg" name="isDzcg" class="nui-dictcombobox"  dictTypeId="ZH_YN" style="width:100%;"/>
                	</td>
									<td colspan="1" align="right" style="width: 100px">电采平台发布公告：</td>
									<td colspan="1">    
                    <input id="isGb" name="isGb" class="nui-dictcombobox"  dictTypeId="ZH_YN" style="width:100%;"/>
                	</td>
                	<td align="right" style="width: 120px">合同/订单性质：</td>
									<td>
		                <input id="nature" name="nature" class="nui-dictcombobox" dictTypeId="ZH_NATURE" onvaluechanged="isSupplierScope" required="true"  style="width:100%;"/>
		              </td>
                	<td colspan="1" align="right" style="width: 100px">供应商选取范围：</td>
									<td colspan="1">
		                <input id="supplierScope" name="supplierScope" class="nui-dictcombobox" dictTypeId="ZH_SUPPLIER_SCOPE"  style="width:100%;"/>
		              </td>
									<td colspan="1" align="right" style="width: 100px">供应商信息：</td>
									<td colspan="3">
										<input id="supplierName" name="supplierName" class="nui-textbox" required="ture"  style="width:100%;"/>
									</td>
							</tr>
							<tr>
								<td align="right" colspan="1" >选择上述供应商原因：</td>
								<td colspan="5">
									<input id="supplierReason" name="supplierReason"  class="nui-textarea"  required="ture" style="width:100%;"/>
								</td>
                <td align="right" style="width:160px">相关情况说明：</td>
								<td colspan="5">
									<input name="remark"  class="nui-textarea" style="width:100%;"/>
								</td>
							</tr>
					</table>
				</div>
			</form>
		</fieldset>
    <fieldset  style="height:80%; border:solid 1px #aaa;padding:1px;width: 98%">
	     <div class="fieldset-body"  style="width:100%; height:100%; margin: 0px auto">
	    	<div id="grid_detail" class="nui-datagrid" style="width: 100%;height: auto;" allowCellSelect="true" 
		    	url="com.zhonghe.ame.purchase.dao.projectApproval.queryProAppDtl.biz.ext" dataField="datas" showPager="false" multiSelect="true"  >
		           <div property="columns">
		           		<div type="indexcolumn" align="center" headerAlign="center"  visible="false"></div>
		           			<div  field="planName" width="110" align="left" headerAlign="center" >计划名称</div>
		           			<div  field="planCode" width="110" align="center" headerAlign="center" >计划编号</div>
		                <div field="materialName"  width="110" align="center" headerAlign="center" vtype="required"  >采购物项名称 </div>
		                <div field="budgetAmount"  width="110" align="center" headerAlign="center" vtype="required">预算金额(万元)</div>
		                
		                <div field="amount"  width="110" align="center" headerAlign="center" vtype="required" headerStyle="color:red">立项金额(万元)
		                </div>
		                <div field="sumamount"  width="110" align="center" headerAlign="center" vtype="required">剩余可立项金额(万元)</div>
		                <div field="needOrgName"  width="60" align="center" headerAlign="center" >采购单位</div> 
		                <div field="contractamount"  width="100" align="center" headerAlign="center" vtype="true" visible="false">拟签合同金额(元)
		                	<input property="editor"   class="nui-spinner"  minValue="0"  maxValue="999999999"  id="contractamount" name="contractamount" />
		                </div>
		            </div>
		        </div>
			</div>
		</fieldset>
		<fieldset id="field2" style="border:solid 1px #aaa;padding:1px;width: 98%">
			<legend>估算表、采购方案和支撑材料</legend>
			<jsp:include page="/ame_common/detailFile.jsp"/>
<!-- 			<legend>立项支持材料附件</legend> -->
<%-- 			<jsp:include page="/ame_common/detailFile2.jsp"/> --%>
			<jsp:include page="/ame_common/misOpinion_Freeflow.jsp" />
		</fieldset>
	</div>
</div>
	<div style="text-align: center;padding: 10px;" class="nui-toolbar ">
			<a class="nui-button" onclick="countersign()" id="countersign" iconCls="icon-user" style="width: 80px;margin-right: 20px;">加签</a> 
			<a class="nui-button" onclick="submit" id="creatReimbProcess" style="width: 80px;margin-right: 20px;">提交</a>
			<a class="nui-button" onclick="closeCancel()" id="saveReimbProcess" style="width: 80px;margin-right: 140px;">关闭</a>
		</div>
	<script type="text/javascript">
    nui.parse();
		var form = new nui.Form("form1");
		var gridDtl = nui.get("grid_detail");
		var countersignUsers;
		init();
    function init(){
    	var json = nui.encode({"workitemid":<%=workitemid%>});
    	form.setEnabled(false);
   			ajaxCommon({	
				url: "com.zhonghe.ame.purchase.purchaseProApp.queryProApp.biz.ext",
		        data: json,
		        success: function (o) {
						 	var result=o.proApp[0]
						 	form.setData(result);
						 	gridDtl.load({"pid":result.id})
						 	//设置审核意见基本信息
            	//查询审核意见
        		var grid1 = nui.get("datagrid1");
							nui.get("backTo").setData(o.backList);
	       			var grid1 = nui.get("datagrid1");
							grid1.load({processInstID:result.processid});
							grid1.sortBy("time", "desc");
						 	//初始化处理意见
							initMisOpinion({auditstatus:"1"});
							var grid_0 = nui.get("grid_0");
					 		grid_0.load({"groupid":"proAppCost","relationid":result.id});
							grid_0.sortBy("fileTime","desc");
// 							var grid_1 = nui.get("grid_1");
// 					 		grid_1.load({"groupid":"proAppSup","relationid":result.id});
// 							grid_1.sortBy("fileTime","desc");
		        }
		    }); 
		}
		function submit(){
    	var auditstatus = nui.get("auditstatus").getValue();
    	if(auditstatus == "2"){	//终止流程
    		titleText = "终止";
    		submitProcess("终止");
    	}else if(auditstatus == "0"){	//退回流程
    		if(!nui.get("backTo").getValue()){
    			showTips("退回环节不能为空！");
    			return;
    		}
    		titleText = "退回";
    		submitProcess("退回");
    	}else if(auditstatus == "1"){	//提交流程
    		titleText = "提交";
    		submitProcess("提交");
    		
    	}
    }
    
    function submitProcess(title){
    		nui.confirm("确定" + title + "流程吗？", "操作提示",function (action) {            
            if (action == "ok") {
            	nui.get("creatReimbProcess").disable();
            	var data = form.getData();
							var misOpinion = opioionform.getData().misOpinion;//审核意见
            	/* nui.get("appButton").setEnabled(false); */
            	var json = {"param":data,misOpinion:misOpinion,workItemID: <%=workitemid %>,"countersignUsers":countersignUsers};
            	saveData(json);
            }
        });
	   }
	   
	   function saveData(json){
	   	 nui.ajax({
        url: "com.zhonghe.ame.purchase.purchaseProApp.proAppApproval.biz.ext",
				data: json,
        type: 'POST',
        cache: false,
        contentType: 'text/json',
        success: function (o) {
           	if(o.result == "success"){
		        	showTips("提交成功")
	        			closeOk();			
							}else{
								showTips("提交失败，请联系信息技术部人员！","danger")
								nui.get("creatReimbProcess").enable();
								/* closeOk();	 */					
							}
        },
        error: function (jqXHR, textStatus, errorThrown) {
            alert(jqXHR.responseText);
        }
    });
	}
	
	function onSumamount(e){
		var sumamount = addFloat(e.row.amount,e.row.sumamount);
		if(e.row._state){
			return e.row.sumamount;
		}else{
			return sumamount;
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
	                    submitProcess(titleText);
                       }
                    }

                }
            });
        }
    </script></body>
</html>
