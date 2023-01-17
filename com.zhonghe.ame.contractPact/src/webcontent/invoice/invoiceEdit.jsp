<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<head>
	<title>开具发票信息 </title>
	<style type="text/css">
	    body{
	        margin: 0;padding: 0;border: 0;width: 100%;height: 100%;overflow: hidden;	
	    } 
    </style>
</head>
<body>
	<div class="nui-fit">
			<fieldset id="field1" style="border: solid 1px #aaa;padding: 3px;width: 97%;">
				<legend>开具发票信息</legend>
				<form id="form1" method="post">
					<input name="files" id="fileids" class="nui-hidden"/>
					<input class="nui-hidden" name="id"/>
					<input class="nui-hidden" name="processid"/>
					<div style="padding: 5px;">
						<table style="table-layout: fixed;">
							<tr>
							<td class="form_label" align = "right"> 申请人</td>
								<td>
									<input name="createUserid" id="createUserid" class="nui-hidden" style="width: 100%"/>
									<input id="createUsername" name="createUsername" class="nui-textbox" enabled="false" style="width: 100%" required="true"/>
								</td>
							<td align="right" style="width:130px">申请日期：</td>
								<td><input id="createTime" name="createTime"  class="nui-datepicker" style="width: 100%" required="true"/></td>
							<td align="right" style="width: 120px">申请单位：</td>
									<td  style="width: 20%;">
										<input name="implementOrg" id="implementOrg" class="nui-combobox" valueField="orgid" textField="orgname" 
										style="width: 100%" shownullitem="false" allowinput="true" required="true" readonly="readonly"/>
							     	</td>
							</tr>
							<tr>
								<td align="right" style="width:130px">合同名称：</td>
									<td><input id="contractName" name="contractName"  class="nui-textbox" style="width: 100%" required="true" enabled="false"/></td>
								<td align="right" style="width:130px">合同编号：</td>
									<td><input id="contractNo" name="contractNo"  class="nui-textbox" style="width: 100%" required="true" enabled="false"/></td>
								<td align="right" style="width:130px">增值税发票类型：</td>
									<td><input name="invoiceType" class="nui-dictcombobox" dictTypeId="MIS_MA_INVOICETYPE" style="width: 100%" required="true"/></td>
							</tr>
							<tr>
								<td align="right" style="width:130px">集团内外：</td>
									<td><input name="headquarterGroup"  class="nui-dictcombobox" dictTypeId="ZH_GROUP" style="width: 100%"  enabled="false"/></td>
								<td align="right" style="width:130px">开票金额（小写）：</td>
									<td><input id="invoiceSum" name="invoiceSum"  class="nui-textbox" style="width: 100%" required="true" onvaluechanged="editContractSum"/></td>
								<td align="right" style="width:130px">开票金额（大写）：</td>
									<td><input id="invoiceSumCapital" name="invoiceSumCapital"  class="nui-textbox" style="width: 100%" required="true"/></td>
							</tr>
							<tr>
							<td align="right" style="width:130px">付款单位：</td>
								<td><input name="payerName" id="payerName" class="nui-textbox" style="width: 100%" required="true" enabled="false"/></td>
								<td align="right" style="width:130px">纳税人识别号：</td>
									<td><input name="taxpayerNumber"  class="nui-textbox" style="width: 100%" required="true"/></td>
								<td align="right" style="width:130px">开户行账号：</td>
									<td><input name="account"  class="nui-textbox" style="width: 100%" required="true"/></td>
							</tr>
							<tr>
								<td align="right" style="width:130px">单位地址：</td>
									<td><input name="unitAddress"  class="nui-textbox" style="width: 100%" required="true"/></td>
								<td align="right" style="width:130px">单位电话：</td>
									<td><input name="unitPhone"  class="nui-textbox" style="width: 100%" required="true"/></td>
								<td align="right" style="width:130px">开票是否邮寄：</td>
									<td><input name="postFlag"  class="nui-dictcombobox" dictTypeId="ZH_POST" style="width: 100%" required="true"/></td>
							</tr>
							<tr>
								<td align="right" style="width:130px">开票内容：</td>
									<td><input name="content"  class="nui-dictcombobox" dictTypeId="ZH_INVOICE_CONTENT" style="width: 100%" required="true"/></td>
								<td align="right" style="width:130px">工程类别：</td>
									<td><input name="projectType"  class="nui-dictcombobox" dictTypeId="ZH_PROJECT_TYPE" style="width: 100%" required="true" enabled="false"/></td> 
								<td align="right" style="width:130px">开票内容情况说明：</td>
									<td><input name="contentInfo"  class="nui-textbox" style="width: 100%" required="true"/></td>
							</tr>
							<tr>
								<td align="right" style="width:130px">预计到账时间：</td>
									<td><input name="scheduledTime"  class="nui-datepicker" style="width: 100%" /></td>
								<td align="right" style="width:130px">发票邮寄地址：</td>
									<td><input name="mailingAddress"  class="nui-textbox" style="width: 100%" required="true"/></td>
								<td align="right" style="width:130px">发票领取人：</td>
									<td><input name="invoiceUser"  class="nui-textbox" style="width: 100%" /></td>
							</tr>
							<tr>
								<td align="right" style="width:130px">发票邮寄日期：</td>
									<td><input name="invoicePostTime"  class="nui-datepicker" style="width: 100%" /></td>
								<td align="right" style="width:130px">发票不含税金额：</td>
									<td><input name="invoicePriceExcludingTax"  class="nui-textbox"  style="width: 100%" required="true"/></td>
								<td align="right" style="width:130px">发票税额：</td>
									<td><input name="invoiceTax"  class="nui-textbox" style="width: 100%" required="true"/></td>
							</tr>
							<tr>
								<td align="right" style="width: 100px">专业类别：</td>
									<td><input id="major" name="major"  class="nui-dictcombobox" dictTypeId="ZH_MAJOR_TYPE" style="width: 100%" required="true" enabled="false"/></td>
								<td align="right" style="width:130px">发票抬头类别：</td>
									<td><input name="invoiceNameType"  class="nui-dictcombobox" dictTypeId="ZH_INVOICE_NAME_TYPE" style="width: 100%" required="true"/></td>
							</tr>
							<tr>
								<td align="right" style="width:130px">备注：</td>
									<td colspan="8"><input name="invoiceRemark"  class="nui-textarea" style="width:100%;height: 50px" required="true"/></td>
							</tr>
						</table>
					</div>
				</form>
			</fieldset>
				<jsp:include page="/ame_common/inputFile.jsp"/>
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
    	<%  long workItemID=(Long)request.getAttribute("workItemID"); %>
		var form = new nui.Form("form1");
		var type;
       init()
		function init(){
			var data={workItemID:<%=workItemID %>};
			var json=nui.encode(data);
			ajaxCommon({
	                url: "com.zhonghe.ame.invoice.invoice.getInvoiceProcess.biz.ext",
	                data: json,
	                success: function (o) {
	               		form.setData(o.invoice);
	               		nui.get("implementOrg").setText(o.invoice.implementOrgName);
						//附件查询
						var grid_0 = nui.get("grid_0");
			        	grid_0.load({"groupid":"INVOICE","relationid":o.invoice.id});
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
	                }
	            });
		}
    	function onOk(e){
			//定义变量接受form表单数据
			var form = new nui.Form("#form1");
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
		  	document.getElementById("fileCatalog").value="invoiceinfo";
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
			data.implementOrgName = nui.get("implementOrg").getText();
			var data_opioion = opioionform.getData();
			data.files = nui.get("fileids").getValue();
			var json = nui.encode({'cpData':data,"misOpinion":data_opioion.misOpinion});
			if(!confirm(info)){
					nui.get("saveFeame").enable();
	       		 	nui.get("creatFeame").enable();
	       		 	nui.get("zzFeame").enable();
					return;
			}else{	
	    		ajaxCommon({
	                url: "com.zhonghe.ame.invoice.invoice.editinvoice.biz.ext",
	                data: json,
	                success: function (text) {
	               		if(text.result=="1"){
	               		 if(type==1){
		               		 showTips("开票申请流程提交成功");
		               		 closeOk();
	               		 }else if(type==0){
	               			 showTips("开票申请流程暂时保存成功")
	               			 closeOk();
	               		 }else{
	               		 	showTips("中止成功")
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
    	
		function editContractSum(e){
			var money = e.value;
			nui.get("invoiceSumCapital").setValue(numberParseChina(money));
		}
		
    </script></body>
</html>
