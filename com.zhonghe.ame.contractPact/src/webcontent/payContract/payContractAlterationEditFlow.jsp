<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<head>
<title>付费合同签订申请</title>
<style type="text/css">
	body {
		margin: 0;padding: 0;border: 0;width: 100%;height: 100%;overflow: hidden;
	}
</style>
</head>
<body>
	<%
		long workitemid = (Long)request.getAttribute("workItemID");
	%>
	<div class="nui-fit" style="padding: 5px;">
		<fieldset id="field1" style="border: solid 1px #aaa;">
			<legend>原 - 付费合同信息</legend>
			<form>
				<input id="historyFinalSum" name="historyFinalSum" class="nui-hidden" />
				<input id="historyContractBalance" name="historyContractBalance" class="nui-hidden" />
				<div style="padding: 5px;">
					<table style="table-layout: fixed;">
						<tr>
							<td align="right" style="width: 130px">合同名称：</td>
							<td colspan="5">
								<input id="historyContractName" enabled="false" class="nui-textbox" style="width: 100%" />
							</td>							
						</tr>
						<tr>
							<td align="right" style="width: 130px">经办人：</td>
							<td>
								<input id="historyCreateUsername" class="nui-textbox" enabled="false" style="width: 200px" />
							</td>
							<td align="right" style="width: 130px">合同承办部门：</td>
							<td>
								<input id="historyImplementOrgname" class="nui-textbox" enabled="false" style="width: 200px" />
							</td>
							<td align="right" style="width: 130px">申请日期：</td>
							<td>
								<input id="historyCreateTime" enabled="false" class="nui-textbox" style="width: 200px" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 130px">签约方：</td>
							<td colspan="3">
								<span class="mini-buttonedit-border" style="padding-left: 0px; padding-right: 0px">
									<input name="historyCustInfo" id="historyCustInfo" class="nui-textboxlist" style="width: 515px" dataField="purSuppliers" url="com.zhonghe.ame.payContract.payContract.queryPurSuppliersByNameInfo.biz.ext"
										valueField="custid" textField="custname" allowInput="false" enabled="false" />
									<span class="mini-buttonedit-buttons">
										<span class="mini-buttonedit-close"></span>
										<span class="mini-buttonedit-button" onmouseover="mini.addClass(this, 'mini-buttonedit-button-hover');"
											onmouseout="mini.removeClass(this, 'mini-buttonedit-button-hover');">
											<span class="mini-buttonedit-icon"></span>
										</span>
									</span>
								</span>
							</td>
							<td align="right" style="width: 130px">付款方：</td>
							<td>
								<input id="historyPayer" class="nui-dictcombobox" dictTypeId="ZH_INVOICE_NAME_TYPE" style="width: 200px" enabled="false" />
							</td>						
						</tr>
						<tr>
							<td align="right" style="width: 130px">合同编号：</td>
							<td>
								<input id="historyContractNo" enabled="false" class="nui-textbox" style="width: 200px" />
							</td>
							<td align="right" style="width: 130px">合同金额(元)：</td>
							<td>
								<input id="historyContractSum" class="nui-textbox" style="width: 200px" enabled="false" />
							</td>
							<td align="right" style="width: 130px">签订日期：</td>
							<td>
								<input id="historySigningDate" class="nui-textbox" style="width: 200px" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 130px">备注：</td>
							<td colspan="6">
								<input id="historyRemark" class="nui-textarea" style="width: 100%; height: 235px" enabled="false" />
							</td>
						</tr>
					</table>
				</div>
			</form>
		</fieldset>
		
		<fieldset id="field2" style="border: solid 1px #aaa;">
			<legend>补充协议 - 付费合同信息</legend>
			<form id="form1" method="post">
				<input name="files" id="fileids1" class="nui-hidden" />
				<input name="id" id="id" class="nui-hidden" />
				<input name="relateCont" id="relateCont" class="nui-hidden" />
				<div style="padding: 5px;">
					<table style="table-layout: fixed;">
						<tr>
							<td align="right" style="width: 130px">补充协议名称：</td>
							<td colspan="5">
								<input id="contractName" name="contractName" class="nui-textbox" style="width: 100%" required="true" enabled="false"/>
							</td>						
						</tr>
						<tr>
							<td align="right" style="width: 130px">经办人：</td>
							<td>
								<input name="createUserid" id="createUserid" class="nui-hidden"/>
								<input id="createUsername" name="createUsername" class="nui-textbox" enabled="false" style="width: 200px" required="true" enabled="false" />
							</td>
							<td align="right" style="width: 130px">合同承办部门：</td>
							<td>
								<input name="implementOrg" id="implementOrg" class="nui-hidden" style="width: 300px;" />
								<input name="implementOrgname" id="implementOrgname" class="nui-textbox" enabled="false" style="width: 200px" required="true" enabled="false" />
							</td>
							<td align="right" style="width: 130px">申请日期：</td>
							<td>
								<input id="createTime" name="createTime" class="nui-datepicker" style="width: 200px" required="true" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 130px">签约方：</td>
							<td colspan="3">
								<span class="mini-buttonedit-border" style="padding-left: 0px; padding-right: 0px">
									<input name="custInfo" id="custInfo" class="nui-textboxlist" style="width: 515px" dataField="purSuppliers" url="com.zhonghe.ame.payContract.payContract.queryPurSuppliersByNameInfo.biz.ext"
										valueField="custid" textField="custname" allowInput="false" enabled="false"/>
									<span class="mini-buttonedit-buttons">
										<span class="mini-buttonedit-close"></span>
										<span class="mini-buttonedit-button" onmouseover="mini.addClass(this, 'mini-buttonedit-button-hover');"
											onmouseout="mini.removeClass(this, 'mini-buttonedit-button-hover');">
											<span class="mini-buttonedit-icon"></span>
										</span>
									</span>
								</span>
							</td>
							<td align="right" style="width: 130px">付款方：</td>
							<td>
								<input id="payer" name="payer" class="nui-dictcombobox" dictTypeId="ZH_INVOICE_NAME_TYPE" style="width: 200px" required="true" enabled="false"/>
							</td>						
						</tr>
						<tr>
							<td align="right" style="width: 130px">变更金额(元)：</td>
							<td>
								<input id="contractSum" name="contractSum" class="nui-textbox" vtype="float" style="width: 200px" required="true" enabled="false" />
							</td>
							<td align="right" style="width: 130px">不含税金额(元)：</td>
							<td>
								<input name="noTaxSum" id="noTaxSum" class="nui-textbox" vtype="float" style="width: 200px" required="true" enabled="false"/>
							</td>
							<td align="right" style="width: 130px">税额(元):</td>
							<td>
								<input name="payTax" id="payTax" class="nui-textbox" vtype="float" style="width: 200px" required="true" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 130px">补充协议说明：</td>
							<td colspan="6">
								<input id="remark" name="remark" class="nui-textarea" style="width: 100%; height: 235px" required="true" enabled="false" />
							</td>
						</tr>
					</table>
				</div>
				<fieldset id="field6" style="border: solid 1px #aaa;">
					<legend style="color: red;">请补充合同信息</legend>
					<div style="padding: 5px; padding-left: 25px;">
						<table style="table-layout: fixed;">
							<tr>
								<td align="right" style="width: 100px">合同编号：</td>
								<td>
									<input id="contractNo" name="contractNo" class="nui-textbox" style="width: 200px" required="true" />
								</td>
								<td align="right" style="width: 100px">签订日期：</td>
								<td>
									<input id="signingDate" name="signingDate" class="nui-datepicker" style="width: 200px" required="true" />
								</td>
							</tr>
						</table>
					</div>
				</fieldset>
			</form>
		</fieldset>
		
		<fieldset id="field3" style="border: solid 1px #aaa;">
			<legend>原 - 付费合同附件</legend>
			<jsp:include page="/ame_common/detailFile.jsp" />
		</fieldset>
		
		<fieldset id="field4" style="border: solid 1px #aaa;">
			<legend>补充协议 - 相关附件</legend>
			<jsp:include page="/ame_common/detailFileExpand.jsp" />
		</fieldset>
		
		<fieldset id="field5" style="border: solid 1px #aaa;">
			<legend style="color: red;">请上传签字盖章版合同</legend>
			<jsp:include page="/ame_common/addFiles1.jsp" />
			<div style="color: red; font-size: 14px;">此项为必填项</div>
		</fieldset>

		<jsp:include page="/ame_common/misOpinion.jsp" />
	</div>
	
	<div style="text-align: center; padding: 10px;" class="nui-toolbar">
		<a class="nui-button" onclick="submit()" id="creatReimbProcess" iconCls="icon-ok" style="width: 80px; margin-right: 20px;">提交</a>
		<a class="nui-button" onclick="closeCancel()" id="saveReimbProcess" iconCls="icon-close" style="width: 80px; margin-right: 0px;">关闭</a>
	</div>
	
	<script type="text/javascript">
		nui.parse();
		var form = new nui.Form("#form1");
		var opioionform = new nui.Form("#opioionform");
		var workItemID = <%=request.getParameter("workItemID")%>;
		
		$("input[name='historyCustInfo']").parent("td").attr("style", "border: 0px; background: #f0f0f0;")
		$("input[name='custInfo']").parent("td").attr("style", "border: 0px; background: #f0f0f0;")
		
		init();

		function init() {
			var data = {workitemid:<%=workitemid%>};
			var json = nui.encode(data);
			nui.ajax({
				url : "com.zhonghe.ame.payContract.payContract.queryPayContractInfo.biz.ext",
				type : "post",
				data : json,
				contentType : 'text/json',
				success : function(o) {
					form.setData(o.data);
					nui.get("custInfo").setValue(o.data.signatory);
					nui.get("custInfo").setText(o.data.signatoryname);
					queryHistory(o.data.relateCont);
					var detailFileExpandGrid = nui.get("detailFileExpandGrid");
					detailFileExpandGrid.load({
						"groupid" : "PAY_CONTRACT",
						"relationid" : o.data.id
					});
					detailFileExpandGrid.sortBy("fileTime", "desc");
					var misOpinionGrid = nui.get("datagrid1");
					misOpinionGrid.load({
						processInstID : o.data.processid
					});
					misOpinionGrid.sortBy("time", "desc");
					setTimeout(function() {
						//注销掉删除操作
						$(".Delete_Button").hide();
					}, 300);
					//初始化审核意见
					nui.get("auditstatus").setValue(1);//1：通过,0：退回，2：终止流程，3:发起
					document.getElementById("salesEdit").style.display = "none";				
				}
			});
		}
		
		function queryHistory(str) {
			var json = {"id": str};
			nui.ajax({
				url : "com.zhonghe.ame.payContract.payContract.queryPayContractById.biz.ext",
				type : "post",
				contentType : 'text/json',
				data : json,
				success : function(result) {
					var data = result.data;
					nui.get("historyCreateUsername").setValue(data.createUsername);
					nui.get("historyImplementOrgname").setValue(data.implementOrgname);
					nui.get("historyCreateTime").setValue(data.createTime);
					nui.get("historyContractNo").setValue(data.contractNo);
					nui.get("historyContractName").setValue(data.contractName);
					nui.get("historyContractSum").setValue(data.contractSum);
					nui.get("historyFinalSum").setValue(data.finalSum);
					nui.get("historyContractBalance").setValue(data.contractBalance);
					nui.get("historySigningDate").setValue(data.signingDate);
					nui.get("historyCustInfo").setValue(data.signatory);
					nui.get("historyCustInfo").setText(data.signatoryname);
					nui.get("historyPayer").setValue(data.payer);
					nui.get("historyRemark").setValue(data.remark);
					var grid_0 = nui.get("grid_0");
					grid_0.load({
						"groupid" : "PAY_CONTRACT",
						"relationid" : data.id
					});
					grid_0.sortBy("fileTime", "desc");
				}
			})
		}
		
		function changeOrgForm(e) {
			nui.get("implementOrgname").setValue(e.source.text);
		}
		
		function submit() {
			form.validate();
			if (form.isValid() == false) {
				showTips("请检查表单的完整性!", "danger");
				return;
			}
			var filePaths = document.getElementsByName("uploadfile1").length;
			if (filePaths == 0) {
				showTips("请上传'签字盖章版合同'", "danger");
				return;
			} else {
				for (var j = 0; j < filePaths; j++) {
					var a = document.getElementsByName("remarkList1")[j].value;
					if (a == null || a == "") {
						showTips("请上传'签字盖章版合同'", "danger");
						return;
					}
				}
			}
			var auditstatus = nui.get("auditstatus").getValue();
			if (auditstatus == "2") { //终止流程
				titleText = "终止";
				submitProcess("终止");
			} else if (auditstatus == "0") { //退回流程
				if (!nui.get("backTo").getValue()) {
					showTips("退回环节不能为空！", "danger");
					return;
				}
				titleText = "退回";
				submitProcess("退回");
			} else if (auditstatus == "1") { //提交流程
				document.getElementById("fileCatalog1").value = "payContractinfo";
				titleText = "提交";
				submitProcess("提交");
			}
		}
		
		function submitProcess(title) {
			nui.confirm("确定" + title + "流程吗？", "操作提示", function(action) {
				if (action == "ok") {
					document.getElementById("fileCatalog1").value = "payContractinfo";
					form4.submit();
				}
			});
		}
		
		function SaveData1() {
			var misOpinion = opioionform.getData().misOpinion;//审核意见
			var data = form.getData();
			var historyFinalSum = nui.get("historyFinalSum").getValue() * 1;
			var historyContractBalance = nui.get("historyContractBalance").getValue() * 1;
			var contractSum = nui.get("contractSum").getValue() * 1;
			var finalSum = (historyFinalSum + contractSum).toFixed(2);
			var contractBalance = (historyContractBalance + contractSum).toFixed(2);
			data.finalSum = finalSum;
			data.contractBalance = contractBalance;
			var json = {
				"cpData" : data,
				"misOpinion" : misOpinion,
				"workItemID" : <%=workitemid%>
			};
			ajaxCommon({
				url : "com.zhonghe.ame.payContract.payContract.payContractAlterationReview.biz.ext",
				data : json,
				success : function(o) {
					if (o.result == "success") {
						showTips(titleText + "成功")
						closeOk();
					} else {
						showTips("提交失败，请联系信息技术部人员！", "danger")
						closeOk();
					}
				}
			})
		}
	</script>
</body>
</html>