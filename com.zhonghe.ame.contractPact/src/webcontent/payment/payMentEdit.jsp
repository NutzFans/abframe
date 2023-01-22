<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<head>
	<title>发起付款流程 </title>
	<style type="text/css">
	    body{
	        margin: 0;padding: 0;border: 0;width: 100%;height: 100%;overflow: hidden;	
	    } 
    </style>
</head>
<body>
<div class="nui-fit">
	<fieldset id="field1" style="border: solid 1px #aaa;padding: 3px;width: 98%;">
				<legend>发起付款流程信息</legend>
				<form id="form1" method="post">
					<input name="files" id="fileids" class="nui-hidden"/>
					<input name="implementOrg" id="implementOrg" class="nui-hidden"/>
					<input class="nui-hidden" name="id"/>
					<input class="nui-hidden" name="processid"/>

					<div style="padding: 1px;">
				<table style="table-layout: fixed;">
					<tr>
					<tr>
						<td align="right" style="width: 160px">合同名称：</td>
						<td colspan="6">
							<input id="contractName" name="contractName"  class="nui-textbox" style="width: 100%" required="true" enabled="false"/>
						</td>
						</tr>
						<tr>
						<td class="form_label" align = "right">经办人</td>
							<td>
								<input name="createUserid" id="createUserid" class="nui-hidden" style="width: 200px"/>
								<input id="createUsername" name="createUsername" class="nui-textbox" enabled="false" style="width: 200px" required="true"/>
							</td>
						<td align="right" style="width:160px">申请日期：</td>
							<td><input id="createTime" name="createTime"  class="nui-datepicker" style="width: 200px" readonly="readonly"/></td>
						<td align="right" style="width: 160px">签约方：</td>
							<td><input id="signatoryname" name="signatoryname"  class="nui-textbox" style="width: 200px" required="true" enabled="false"/>
							<input id="signatory" name="signatory"  class="nui-hidden"/>
							</td>
						</tr>
					<tr>
						<td align="right" style="width: 160px">付款方：</td>
						    <td><input id="payer" name="payer"  class="nui-dictcombobox" dictTypeId="ZH_INVOICE_NAME_TYPE" style="width: 100%"  required="true" enabled="false"/></td>
						<td align="right" style="width: 160px">合同编号：</td>
							<td><input id="contractId" name="contractId"  class="nui-textbox" style="width: 100%" required="true" enabled="false"/></td>
						<td align="right" style="width: 160px">合同实施部门：</td>
								<td><input id="implementOrgname" name="implementOrgname"  class="nui-textbox" style="width: 200px" required="true" enabled="false"/></td>
					</tr>
					<tr>
						<td align="right" style="width: 160px">实际合同金额(元)：</td>
							<td><input id="actContractSum" name="actContractSum"  class="nui-textbox" style="width: 100%" required="true" enabled="false"/></td>
						<td align="right" style="width: 160px">实际合同金额大写：</td>
							<td><input id="actContractSumCapital" name="actContractSumCapital"  class="nui-textbox" style="width: 100%" required="true" enabled="false"/></td>
						<td align="right" style="width: 160px">累计已付金额(元)：</td>
							<td><input id="paidContractSum" name="paidContractSum"  class="nui-textbox" onvaluechanged="editPaidContractSum" style="width: 100%" required="true" enabled="false"/></td>
					</tr>
					<tr>
						<td align="right" style="width: 160px">累计已付金额大写：</td>
							<td><input id="paidContractSumCapital" name="paidContractSumCapital"  class="nui-textbox" style="width: 100%" required="true" enabled="false"/></td>
						<td align="right" style="width: 160px">本次申请支付金额(元)：</td>
							<td><input id="applyPayContractSum" name="applyPayContractSum" onvaluechanged="editApplyPayContractSum" class="nui-textbox" style="width: 100%" readonly="readonly" required="true"/></td>
						<td align="right" style="width: 160px">本次申请支付金额大写：</td>
							<td><input id="applyPayContractSumCapital" name="applyPayContractSumCapital"  class="nui-textbox" style="width: 100%" required="true"/></td>
					</tr>
					<tr>
						<td align="right" style="width:160px">最晚付款日期：</td>
							<td><input id="endTime" name="endTime"  class="nui-datepicker" style="width: 100%" required="true"/></td>
						<td align="right" style="width: 160px">收款单位开户行名称：</td>
							<td><input id="accountName" name="accountName"  class="nui-textbox" style="width: 100%" required="true"/></td>
						<td align="right" style="width: 160px">开户行账号：</td>
							<td><input id="account" name="account"  class="nui-textbox" style="width: 100%" required="true"/></td>
					</tr>
					<tr>
<!-- 								<td align="right" style="width: 160px">采购计划编号：</td> -->
<!-- 									<td><input id="purchasePlan" name="purchasePlan"  class="nui-textbox" style="width: 100%" required="true"/></td> -->
					<!--	<td align="right" style="width: 130px">是否为人力劳务派遣：</td>
							<td><input id="laborDispatchingFlag" name="laborDispatchingFlag"  class="nui-dictcombobox" dictTypeId="ZH_LABOR_DISPATCHING_FLAG" style="width: 100%" required="true"/></td>-->
						<td align="right" style="width: 100px">分公司归口部门经办人：</td>
						<td  style="width: 20%;">
								<input id="countersign0" name="countersign0"  class="nui-buttonedit" 
							onbuttonclick="selectOmEmployee" style="width: 100%"/>
							</td>
						<td align="right" style="width: 100px">本部归口部门经办人：</td>
						<td  style="width: 20%;">
								<input id="countersign1" name="countersign1"   class="nui-buttonedit" 
							onbuttonclick="selectOmEmployee" style="width: 100%"/>
						</td>
					</tr>
					<tr>
						<td align="right" >说明：</td>
							<td colspan="8">
								<input id="remark" name="remark"  class="nui-textarea" style="width:100%;height: 50px" required="true"/>
									</td>
							</tr>
						</table>
					</div>
				</form>
			</fieldset>

			<fieldset id="field2" style="border:solid 1px #aaa;padding:3px;">
		<legend>上传附件</legend>
		<jsp:include page="/ame_common/inputFile.jsp"/>
	</fieldset>
	<jsp:include page="/ame_common/misOpinion.jsp"/>
</div>
	<div style="text-align: center;padding: 10px;" class="nui-toolbar">
		<a class="nui-button" onclick="onOk(0)" id="saveFeame" iconCls="icon-save" style="width: 80px;margin-right: 20px;">保存</a>
		<a class="nui-button" onclick="onOk(1)" id="creatFeame" iconCls="icon-ok" style="width: 80px;margin-right: 20px;">提交</a>
		<a class="nui-button" onclick="onOk(2)" id="zzFeame" iconCls="icon-split" style="width: 80px;margin-right: 20px;">中止</a>
		<a class="nui-button" onclick="closeCancel" iconCls="icon-close" style="width: 80px;">关闭</a>
	</div>
	<script type="text/javascript">
        nui.parse();
	<% 
		long workItemID=(Long)request.getAttribute("workItemID");
	%>
		var form = new nui.Form("form1");
		var type;
    	function onOk(e){
			//定义变量接受form表单数据
			var form = new nui.Form("#form1");
		    if(nui.get("actContractSum").getValue()-nui.get("paidContractSum").getValue()<nui.get("applyPayContractSum").getValue()){
		     	showTips("本次申请支付金额不能大于剩余金额");
		     	return;
		    }
		    type=e;
		    if(type==1){form.validate();
				if(form.isValid()==false){
					showTips("请检查必填项");
					return;
				}
			}	
  			 var filePaths = document.getElementsByName("uploadfile").length;
		     for(var j=0;j<filePaths;j++){
		      var a=document.getElementsByName("remarkList")[j].value;
		      if(a==null||a==""){
		       showTips("新增附件不可以为空");
		       return;
		      }
		     }
			nui.get("saveFeame").disable();
			nui.get("creatFeame").disable();
			nui.get("zzFeame").disable();
			var data = form.getData(); 
		  	document.getElementById("fileCatalog").value="payMentinfo";
			form2.submit();
	    }
    	function SaveData(){
			var form = new nui.Form("#form1");
			var data = form.getData();
			var info="";
			data.type = type;
			if(type==1){
				info="是否提交？"
			}else if(type==0){
				info="是否暂时保存？"
			}else{
				info="是否中止流程？"
				nui.get("auditstatus").setValue(2);
			}
			var data_opioion = opioionform.getData();
			data.files = nui.get("fileids").getValue();
			data.countersign0name = nui.get("countersign0").getText();
			data.countersign1name = nui.get("countersign1").getText();
			var json = nui.encode({'cpData':data,"misOpinion":data_opioion.misOpinion});
			if(!confirm(info)){
				nui.get("saveFeame").enable();
       		 	nui.get("creatFeame").enable();
       		 	nui.get("zzFeame").enable();
       		 	nui.get("auditstatus").setValue("4");
				return;
			}else{	
	    		ajaxCommon({
	                url: "com.zhonghe.ame.payment.payMent.editPayMent.biz.ext",
	                data: json,
	                type: 'POST',
	                cache: false,
	                contentType: 'text/json',
	                success: function (text) {
	               		 if(text.result=="1"){
	               		 if(type==1){
		               		 showTips("付款流程提交成功");
		               		 closeOk();
	               		 }else if(type==0){
	               			 showTips("付款流程暂时保存成功");
	               			 closeOk();
	               		 }else{
	               		 	showTips("中止成功");
	               		 	closeOk();
	               		 }
               		 }else{
               		 	showTips("提交失败！");
               		 	nui.get("saveFeame").enable();
               		 	nui.get("creatFeame").enable();
               		 	nui.get("zzFeame").enable();
               		 }
	                
	                }
	            }); 
            }
    	}
    	init()
		function init(){
			var data={workItemID:<%=workItemID %>};
			var json=nui.encode(data);
			nui.ajax({
	                url: "com.zhonghe.ame.payment.payMent.getPayMentProcess.biz.ext",
	                data: json,
	                type: 'POST',
	                cache: false,
	                contentType: 'text/json',
	                success: function (o) {
	               		form.setData(o.payment);
	               		nui.get("countersign0").setText(o.payment.countersign0name);
						nui.get("countersign1").setText(o.payment.countersign1name); 
						//附件查询
						var grid_0 = nui.get("grid_0");
			        	grid_0.load({"groupid":"PAY_MENT","relationid":o.payment.id});
						grid_0.sortBy("fileTime","desc");
						//设置审核意见基本信息
						nui.get("processinstid").setValue(o.workitem.processInstID);
		               	nui.get("processinstname").setValue(o.workitem.processInstName);
		               	nui.get("activitydefid").setValue(o.workitem.activityDefID);
		               	nui.get("workitemname").setValue(o.workitem.workItemName);
						nui.get("workitemid").setValue(<%=workItemID %>);
		               	nui.get("isshow").setValue("1");
		               	nui.get("auditstatus").setValue("4");
		               	document.getElementById("salesEdit").style.display="none";
		               	nui.get("auditopinion").setValue("");
		            	//查询审核意见
						var grid = nui.get("datagrid1");
						if(o.workitem.processInstID!=null||o.workitem.processInstID!=""){
							grid.load({processInstID:o.workitem.processInstID});
							grid.sortBy("time", "desc");
						}
	               		
	                },
	                error: function (jqXHR, textStatus, errorThrown) {
	                    alert(jqXHR.responseText);
	                }
	            });
		}
		
		
		 function editPaidContractSum(e){
			var money = e.value;
			nui.get("paidContractSumCapital").setValue(numberParseChina(money));
		} 
		
		function editApplyPayContractSum(e){
			var money = e.value;
			nui.get("applyPayContractSumCapital").setValue(numberParseChina(money));
		}
    	 function onCancel(e) {
            CloseWindow("cancel");
        }
        //标准方法接口定义
        function CloseWindow(action) {           
            if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
            else window.close();            
        }
        
        function selectOmEmployee(){
	    	var btnEdit = this;
	        nui.open({
	            url: "/default/machine/SelectEmployee.jsp",
	            title: "选择经办人",
	            width: 430,
	            height: 400,
	            ondestroy: function (action) {
	                if (action == "ok") {
	                    var iframe = this.getIFrameEl();
	                    var data = iframe.contentWindow.GetData();
	                    data = nui.clone(data);    //必须
	                    if (data) {
	                        btnEdit.setValue(data.userid);
	                        btnEdit.setText(data.empname);
                        }
                    }
	
                }
            });
        }

    </script></body>
</html>
