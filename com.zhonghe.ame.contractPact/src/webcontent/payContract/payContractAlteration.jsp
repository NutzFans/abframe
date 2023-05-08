<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<style type="text/css">
	body {
		margin: 0;padding: 0;border: 0;width: 100%;height: 100%;overflow: hidden;
	}
</style>
<head>
<title>付费合同补充协议申请</title>
</head>
<body>
	<div class="nui-fit" style="padding: 5px;">
		<fieldset id="field1" style="border: solid 1px #aaa;">
			<legend>原 - 付费合同信息</legend>
			<form>
				<div style="padding: 5px;">
					<table style="table-layout: fixed;">
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
							<td align="right" style="width: 130px">合同编号：</td>
							<td>
								<input id="historyContractNo" enabled="false" class="nui-textbox" style="width: 200px" />
							</td>
							<td align="right" style="width: 130px">合同名称：</td>
							<td>
								<input id="historyContractName" enabled="false" class="nui-textbox" style="width: 200px" />
							</td>
							<td align="right" style="width: 130px">合同金额(元)：</td>
							<td>
								<input id="historyContractSum" class="nui-textbox" style="width: 200px" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 130px">签订日期：</td>
							<td>
								<input id="historySigningDate" class="nui-textbox" style="width: 200px" enabled="false" />
							</td>
							<td align="right" style="width: 130px">签约方：</td>
							<td>
								<input id="historySignatoryname" class="nui-textbox" style="width: 200px" enabled="false" />
							</td>
							<td align="right" style="width: 130px">付款方：</td>
							<td>
								<input id="historyPayer" class="nui-dictcombobox" dictTypeId="ZH_INVOICE_NAME_TYPE" style="width: 200px" enabled="false" />
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
				<input name="files" id="fileids" class="nui-hidden" />
				<input name="relateCont" id="relateCont" class="nui-hidden" />
				<div style="padding: 5px;">
					<table style="table-layout: fixed;">
						<tr>
							<td align="right" style="width: 130px">经办人：</td>
							<td>
								<input name="createUserid" id="createUserid" class="nui-hidden"/>
								<input id="createUsername" name="createUsername" class="nui-textbox" enabled="false" style="width: 200px" required="true" />
							</td>
							<td align="right" style="width: 130px">合同承办部门：</td>
							<td>
								<input name="implementOrg" id="implementOrg" shownullItem=ture class="nui-treeselect" textField="orgname" valueField="orgid" parentField="omOrganization.orgid" dataField="orgs"
									showTreeIcon="true" valueFromSelect="true" style="width: 200px;" url="com.zhonghe.ame.imptask.keytask.getAllRunOrgsforzdrw.biz.ext" allowInput="true" required="true"
									onvaluechanged="changeOrgForm(e)" multiSelect="false" checkRecursive="false" expandOnLoad="0" showFolderCheckBox="true" enabled="false" />
								<input name="implementOrgname" id="implementOrgname" class="nui-hidden"/>
							</td>
							<td align="right" style="width: 130px">申请日期：</td>
							<td>
								<input id="createTime" name="createTime" class="nui-datepicker" style="width: 200px" required="true" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 130px">补充协议名称：</td>
							<td>
								<input id="contractName" name="contractName" class="nui-textbox" style="width: 200px" required="true" />
							</td>
							<td align="right" style="width: 130px">签约方：</td>
							<td>
								<input name="signatory" id="custId" class="nui-combobox" required="true" valueField="custid" url="com.zhonghe.ame.payContract.payContract.queryPurSuppliersIsqualified.biz.ext" filterType="like"
									textField="custname" dataField="pursuppliers" valueFromSelect="true" allowInput="true" style="width: 200px" />
							</td>
							<td align="right" style="width: 130px">付款方：</td>
							<td>
								<input id="payer" name="payer" class="nui-dictcombobox" dictTypeId="ZH_INVOICE_NAME_TYPE" style="width: 200px" required="true" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 130px">变更金额(元)：</td>
							<td>
								<input id="contractSum" name="contractSum" class="nui-textbox" vtype="float" style="width: 200px" required="true" emptyText="增加正数，减少负数，无变化0" onvaluechanged="onvaluechanged" />
							</td>
							<td align="right" style="width: 130px">不含税金额(元)：</td>
							<td>
								<input name="noTaxSum" id="noTaxSum" class="nui-textbox" vtype="float" style="width: 200px" required="true" emptyText="增加正数，减少负数，无变化0" onvaluechanged="onvaluechanged"/>
							</td>
							<td align="right" style="width: 130px">税额(元):</td>
							<td>
								<input name="payTax" id="payTax" class="nui-textbox" vtype="float" style="width: 200px" required="true" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 130px">补充协议说明：</td>
							<td colspan="6">
								<input id="remark" name="remark" class="nui-textarea" style="width: 100%; height: 235px" required="true" />
							</td>
						</tr>
					</table>
				</div>
			</form>
		</fieldset>

		<fieldset id="field3" style="border: solid 1px #aaa;">
			<legend>原 - 付费合同附件</legend>
			<jsp:include page="/ame_common/detailFile.jsp" />
		</fieldset>

		<fieldset id="field4" style="border: solid 1px #aaa;">
			<legend>补充协议 - 上传附件</legend>
			<jsp:include page="/ame_common/inputFileExpand.jsp" />
		</fieldset>

		<form id="opioionform" method="post" style="display: none">
			<div style="padding: 5px;" id="opinionHide">
				<table style="table-layout: fixed;">
					<tr id="salesEdit">
						<td style="width: 150px;" align="right">审核结果：</td>
						<td style="width: 250px;">
							<input name="misOpinion.auditstatus" id="auditstatus" class="nui-dictradiogroup" style="width: 250px;" required="true" dictTypeId="MIS_AUDITSTATUS" onvaluechanged="show()" value="1" />
						</td>
					</tr>
					<tr>
						<td colspan="3">
							<input name="misOpinion.auditopinion" id="auditopinion" class="nui-hidden" style="width: 600px; height: 40px;" value="" />
						</td>
					</tr>
				</table>
			</div>
		</form>
	</div>

	<div style="text-align: center; position: relative; bottom: 10px" class="nui-toolbar">
		<a class="nui-button" onclick="onOk(0)" id="saveReimb" iconCls="icon-save" style="width: 80px; margin-right: 20px;">保存</a>
		<a class="nui-button" onclick="onOk(1)" id="creatReimbProcess" iconCls="icon-ok" style="width: 80px; margin-right: 20px;">提交</a>
		<a class="nui-button" onclick="closeCancel()" id="saveReimbProcess" iconCls="icon-close" style="width: 80px; margin-right: 140px;">关闭</a>
	</div>

	<script type="text/javascript">
		nui.parse();
		var form = new nui.Form("#form1");
		var opioionform = new nui.Form("#opioionform");
		var type;

		function setEditData(data) {
			nui.get("historyCreateUsername").setValue(data.createUsername);
			nui.get("historyImplementOrgname").setValue(data.implementOrgname);
			nui.get("historyCreateTime").setValue(data.createTime);
			nui.get("historyContractNo").setValue(data.contractNo);
			nui.get("historyContractName").setValue(data.contractName);
			nui.get("historyContractSum").setValue(data.contractSum);
			nui.get("historySigningDate").setValue(data.signingDate);
			nui.get("historySignatoryname").setValue(data.signatoryname);
			nui.get("historyPayer").setValue(data.payer);
			nui.get("historyRemark").setValue(data.remark);
			var grid_0 = nui.get("grid_0");
			grid_0.load({
				"groupid" : "PAY_CONTRACT",
				"relationid" : data.id
			});
			grid_0.sortBy("fileTime", "desc");
			
			nui.get("relateCont").setValue(data.id);
			nui.get("createUserid").setValue(userId);
			nui.get("createUsername").setValue(userName);
			nui.get("implementOrg").setValue(userOrgId);
			nui.get("implementOrgname").setValue(userOrgName);
			nui.get("custId").setValue(data.signatory);
			nui.get("custId").setText(data.signatoryname);
			nui.get("payer").setValue(data.payer);
			nui.get("createTime").setValue(new Date());
			nui.get("auditstatus").setValue(3);//1：通过,0：退回，2：终止流程，3:发起
		}
		
		function changeOrgForm(e) {
			nui.get("implementOrgname").setValue(e.source.text);
		}
		
		function onOk(e) {
			type = e;
			if (type == 1) {
				if (!form.validate()) {
					showTips("请检查表单的完整性!", "danger");
					return;
				}
				var filePaths = document.getElementsByName("uploadfile").length;
				if (filePaths == 0) {
					showTips("请上传补充协议相关附件", "danger");
					return;
				} else {
					for (var j = 0; j < filePaths; j++) {
						var a = document.getElementsByName("remarkList")[j].value;
						if (a == null || a == "") {
							showTips("请上传补充协议相关附件", "danger");
							return;
						}
					}
				}
			}
			document.getElementById("fileCatalog").value = "payContractinfo";
			nui.get("saveReimb").disable();
			nui.get("creatReimbProcess").disable();
			inputFileExpandForm.submit();
		}
		
		function SaveData() {
			var data = form.getData();
			var data_opioion = opioionform.getData();
			data.type = type;
			var info = "";
			if (type == 1) {
				info = "是否提交？"
			} else {
				info = "是否暂时保存？"
			}
			data.files = nui.get("fileids").getValue();
			delete data.criteria;
			data.issupagreement = "y";
			var json = nui.encode({
				'cpData' : data,
				"misOpinion" : data_opioion.misOpinion
			});
			if (!confirm(info)) {
				nui.get("saveReimb").enable();
				nui.get("creatReimbProcess").enable();
				return;
			} else {
				ajaxCommon({
					"url" : "com.zhonghe.ame.payContract.payContract.addAlterationInfoNew.biz.ext",
					"data" : json,
					"success" : function(data) {
						if (data.result == "1") {
							if (type == 1) {
								showTips("付费合同补充协议提交成功");
								closeOk();
							} else {
								showTips("付费合同补充协议保存成功");
								closeOk();
							}
						} else {
							showTips("付费合同提交失败！", "danger");
							nui.get("saveReimb").enable();
							nui.get("creatReimbProcess").enable();
						}
					}
				});
			}
		}
		
		function onvaluechanged() {
			var contractSum = nui.get("contractSum").getValue();
			var noTaxSum = nui.get("noTaxSum").getValue();
			abs = function(val) {
				var str = (val).toFixed(2) + '';
				var intSum = str.substring(0, str.indexOf(".")).replace(/\B(?=(?:\d{3})+$)/g, '');
				var dot = str.substring(str.length, str.indexOf("."))
				var ret = intSum + dot;
				return ret;
			}
			nui.get("payTax").setValue(abs(contractSum - noTaxSum));
		}		
		
	</script>
</body>
</html>