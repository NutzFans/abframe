<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<head>
<title>开具发票信息维护</title>
<style type="text/css">
body {
	margin: 0;
	padding: 0;
	border: 0;
	width: 100%;
	height: 100%;
	overflow: hidden;
}
</style>
</head>
<body>
	<div class="nui-fit" style="padding: 5px;">
		<fieldset id="field1" style="border: solid 1px #aaa;">
			<legend>原 - 开票信息</legend>
			<form>
				<div style="padding: 5px;">
					<table style="table-layout: fixed;">
						<tr>
							<td align="right">申请人</td>
							<td>
								<input id="historyCreateUsername" class="nui-textbox" enabled="false" style="width: 300px" required="true" />
							</td>
							<td align="right" style="width: 160px">申请单位：</td>
							<td>
								<input id="historyImplementOrg" shownullItem=ture class="nui-treeselect" textField="orgname" valueField="orgid" parentField="omOrganization.orgid" dataField="orgs" showTreeIcon="true"
									valueFromSelect="true" style="width: 100%;" url="com.zhonghe.ame.imptask.keytask.getAllRunOrgsforzdrw.biz.ext" allowInput="true" required="true" multiSelect="false" checkRecursive="false"
									expandOnLoad="0" enabled="false" showFolderCheckBox="true" />
							</td>
							<td align="right" style="width: 160px">申请日期：</td>
							<td>
								<input id="historyCreateTime" enabled="false" class="nui-datepicker" style="width: 300px" required="true" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 160px">合同编号：</td>
							<td>
								<input id="historyContractNo" onbuttonclick="onButtonEdit" class="nui-buttonedit" style="width: 300px" required="true" enabled="false" />
							</td>
							<td align="right" style="width: 160px">合同名称：</td>
							<td colspan="3">
								<input id="historyContractName" class="nui-textbox" style="width: 100%" required="true" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 100px">专业类别：</td>
							<td>
								<input id="historyMajor" class="nui-dictcombobox" dictTypeId="ZH_MAJOR_TYPE" style="width: 300px" required="true" enabled="false" />
							</td>
							<td align="right" style="width: 160px">工程类别：</td>
							<td>
								<input id="historyProjectType" class="nui-dictcombobox" dictTypeId="ZH_PROJECT_TYPE" style="width: 300px" required="true" enabled="false" />
							</td>
							<td align="right" style="width: 160px">集团内外：</td>
							<td>
								<input id="historyHeadquarterGroup" class="nui-dictcombobox" dictTypeId="ZH_GROUP" style="width: 300px" required="true" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 160px">发票抬头类别：</td>
							<td>
								<input id="historyInvoiceNameType" class="nui-dictcombobox" dictTypeId="ZH_INVOICE_NAME_TYPE" style="width: 300px" required="true" enabled="false" />
							</td>
							<td align="right" style="width: 160px">发票类型：</td>
							<td>
								<input id="historyInvoiceType" class="nui-dictcombobox" dictTypeId="MIS_MA_INVOICETYPE" style="width: 300px" required="true" enabled="false" onvaluechanged="invoiceType" />
							</td>
							<td align="right" style="width: 160px">税率（%）：</td>
							<td>
								<input id="historyInvoiceRate" class="nui-textbox" style="width: 300px" required="true" onvaluechanged="editContractSum" value="6" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 160px">用途：</td>
							<td>
								<input id="historyInvoiceUsed" class="nui-dictcombobox" dictTypeId="INVOICE_USED" style="width: 300px" required="true" enabled="false" />
							</td>
							<td align="right" style="width: 160px">本次收款进度：</td>
							<td>
								<input id="historyPayType" class="nui-dictcombobox" dictTypeId="payType" style="width: 300px" required="true" enabled="false" />
							</td>
							<td align="right" style="width: 160px">合同金额（元）：</td>
							<td>
								<input id="historyInvoiceSumCapital" class="nui-textbox" vtype="float" style="width: 300px" required="true" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 160px">开票金额（元）：</td>
							<td>
								<input id="historyInvoiceSum" id="invoiceSum" class="nui-textbox" vtype="float" style="width: 300px" required="true" onvaluechanged="editContractSum" enabled="false" />
							</td>
							<td align="right" style="width: 160px">账面收入（元）：</td>
							<td>
								<input id="historyBookIncome" class="nui-textbox" style="width: 300px" required="true" enabled="false" onvaluechanged="editInvoiceTax" />
							</td>
							<td align="right" style="width: 160px">税额：</td>
							<td>
								<input id="historyInvoiceTax" class="nui-textbox" style="width: 300px" required="true" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 160px">开票金额大写：</td>
							<td colspan="3">
								<input id="historyInvoiceSumChinese" class="nui-textbox" style="width: 100%" required="true" enabled="false" />
							</td>
							<td align="right" style="width: 160px">是否有产值分配：</td>
							<td>
								<input id="historyAllotFlag" class="nui-dictcombobox" dictTypeId="ZH_YN" style="width: 100%" required="true" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 160px">名称：</td>
							<td colspan="5">
								<input id="historyPayerName" class="nui-textbox" style="width: 100%" required="true" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 160px">纳税人识别号：</td>
							<td colspan="5">
								<input id="historyTaxpayerNumber" class="nui-textbox" style="width: 100%" required="true" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 160px">地址、电话：</td>
							<td colspan="5">
								<input id="historyUnitAddress" class="nui-textbox" style="width: 100%" required="true" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 160px">开户行及账号：</td>
							<td colspan="5">
								<input id="historyAccount" class="nui-textbox" style="width: 100%" required="true" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 160px">发票备注：</td>
							<td colspan="5">
								<input id="historyInvoiceRemark" class="nui-textbox" style="width: 100%" required="false" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 160px">开票是否邮寄：</td>
							<td>
								<input id="historyPostFlag" class="nui-dictcombobox" onvaluechanged="setAttribute" dictTypeId="ZH_POST" style="width: 300px" required="true" enabled="false" />
							</td>
							<td align="right" style="width: 160px">发票领取人：</td>
							<td colspan="3">
								<input id="historyInvoiceUser" class="nui-textbox" style="width: 100%" required="true" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 160px">邮寄姓名：</td>
							<td>
								<input id="historyMailName" class="nui-textbox" style="width: 300px" required="true" enabled="false" />
							</td>
							<td align="right" style="width: 160px">邮寄电话：</td>
							<td>
								<input id="historyMailPhone" class="nui-textbox" style="width: 300px" required="true" enabled="false" />
							</td>

						</tr>
						<tr>
							<td align="right" style="width: 160px">邮寄地址：</td>
							<td colspan="5">
								<input id="historyMailAddress" class="nui-textbox" style="width: 100%" required="true" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 160px">备注：</td>
							<td colspan="5">
								<input id="historyRemark" class="nui-textarea" style="width: 100%; height: 100px" required="false" enabled="false" />
							</td>
						</tr>
					</table>
				</div>
			</form>
		</fieldset>
		<fieldset id="field2" style="border: solid 1px #aaa;">
			<legend>红冲/作废 - 开票信息</legend>
			<form id="form1" method="post">
				<input name="files" id="fileids" class="nui-hidden" />
				<input name="id" id="id" class="nui-hidden" />
				<input class="nui-hidden" name="processid" />
				<input class="nui-hidden" name="invoiceNameType" />
				<input name="relateCont" id="relateCont" class="nui-hidden" />
				<div style="padding: 5px;">
					<table style="table-layout: fixed;">
						<tr>
							<td align="right">申请人</td>
							<td>
								<input name="createUserid" id="createUserid" class="nui-hidden" style="width: 300px" />
								<input id="createUsername" name="createUsername" class="nui-textbox" enabled="false" style="width: 300px" required="true" />
							</td>
							<td align="right" style="width: 160px">申请单位：</td>
							<td>
								<input name="implementOrg" id="implementOrg" shownullItem=ture class="nui-treeselect" textField="orgname" valueField="orgid" parentField="omOrganization.orgid" dataField="orgs"
									showTreeIcon="true" valueFromSelect="true" style="width: 100%;" url="com.zhonghe.ame.imptask.keytask.getAllRunOrgsforzdrw.biz.ext" allowInput="true" required="true" multiSelect="false"
									checkRecursive="false" expandOnLoad="0" enabled="false" showFolderCheckBox="true" />
								<input name="implementOrgname" id="implementOrgname" class="nui-hidden" readonly="readonly" />
							</td>
							<td align="right" style="width: 160px">申请日期：</td>
							<td>
								<input id="createTime" name="createTime" class="nui-datepicker" style="width: 300px" enabled="false" required="true" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 160px">合同编号：</td>
							<td>
								<input id="contractNo" name="contractNo" onbuttonclick="onButtonEdit" class="nui-buttonedit" style="width: 300px" required="true" enabled="false" />
							</td>
							<td align="right" style="width: 160px">合同名称：</td>
							<td colspan="3">
								<input id="contractName" name="contractName" class="nui-textbox" style="width: 100%" required="true" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 100px">申请红冲/作废：</td>
							<td>
								<input id="redInkType" name="redInkType" class="nui-dictcombobox" dictTypeId="ZH_RED_INK_TYPE" style="width: 300px" required="true" />
							</td>
							<td align="right" style="width: 160px">红冲/作废金额大写：</td>
							<td colspan="3">
								<input id="invoiceSumChinese" class="nui-textbox" style="width: 100%" required="true" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 160px">红冲/作废金额（元）：</td>
							<td>
								<input id="invoiceSum" name="invoiceSum" class="nui-textbox" vtype="float" style="width: 300px" required="true" onvaluechanged="editContractSum" emptyText="数字格式、只能为负数" />
							</td>
							<td align="right" style="width: 160px">账面收入（元）：</td>
							<td>
								<input id="bookIncome" name="bookIncome" class="nui-textbox" style="width: 300px" required="true" enabled="false" />
							</td>
							<td align="right" style="width: 160px">税额：</td>
							<td>
								<input name="invoiceTax" id="invoiceTax" class="nui-textbox" style="width: 300px" required="true" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 160px">红冲/作废原因：</td>
							<td colspan="5">
								<input name="remark" class="nui-textarea" style="width: 100%; height: 200px" required="true" />
							</td>
						</tr>
					</table>
				</div>
			</form>
		</fieldset>
		<fieldset id="field3" style="border: solid 1px #aaa;">
			<legend>原 - 开票信息附件</legend>
			<jsp:include page="/ame_common/detailFile.jsp" />
		</fieldset>
		<fieldset id="field4" style="border: solid 1px #aaa;">
			<legend>红冲/作废 - 上传附件</legend>
			<jsp:include page="/ame_common/inputFileExpand.jsp" />
		</fieldset>
	</div>

	<div style="text-align: center; padding: 10px; border-width: 1px 0px 0px 0px;" class="nui-toolbar">
		<a class="nui-button" onclick="onOk()" id="creatReimbProcess" style="width: 80px; margin-right: 20px;">提交</a>
		<a class="nui-button" onclick="onCancel" id="saveReimbProcess" style="width: 80px; margin-right: 140px;">关闭</a>
	</div>

	<script type="text/javascript">
		nui.parse();
		var form = new nui.Form("#form1");

		function setEditData(data) {
			form.setData(data);
			nui.get("contractNo").setText(data.contractNo);
			nui.get("invoiceSumChinese").setValue(functiondigitUppercase(nui.get("invoiceSum").getValue()));
			queryHistory(data.relateCont);
			var inputFileExpandGrid = nui.get("inputFileExpandGrid");
			inputFileExpandGrid.load({
				"groupid" : "INVOICE",
				"relationid" : data.id
			});
			inputFileExpandGrid.sortBy("fileTime", "desc");
		}

		function functiondigitUppercase(price) {
			if (price.substr(0, 1) == "-") {
				price = price.slice(1);
			}
			price = price * 1.0;
			if (price === 0) {
				return "零";
			}
			var unit = "仟佰拾亿仟佰拾万仟佰拾元角分", str = "";
			price += "00";
			var point = price.indexOf('.');
			if (point >= 0) {
				price = price.substring(0, point) + price.substr(point + 1, 2);
			}
			unit = unit.substr(unit.length - price.length);
			for (var i = 0; i < price.length; i++) {
				str += '零壹贰叁肆伍陆柒捌玖'.charAt(price.charAt(i)) + unit.charAt(i);
			}
			var result = str.replace(/零(仟|佰|拾|角)/g, "零").replace(/(零)+/g, "零").replace(/零(万|亿|元)/g, "$1").replace(/(亿)万/g, "$1$2").replace(/^元零?|零分/g, "").replace(/元$/g, "元整");
			return result;
		}

		function queryHistory(str) {
			var json = {
				"id" : str
			};
			nui.ajax({
				url : "com.zhonghe.ame.invoice.invoice.queryInvoiceById.biz.ext",
				type : "post",
				contentType : 'text/json',
				data : json,
				success : function(result) {
					var data = result.data;
					nui.get("historyCreateUsername").setValue(data.createUsername);
					nui.get("historyImplementOrg").setValue(data.implementOrg);
					nui.get("historyCreateTime").setValue(data.createTime);
					nui.get("historyContractNo").setText(data.contractNo);
					nui.get("historyContractName").setValue(data.contractName);
					nui.get("historyMajor").setValue(data.major);
					nui.get("historyProjectType").setValue(data.projectType);
					nui.get("historyHeadquarterGroup").setValue(data.headquarterGroup);
					nui.get("historyInvoiceNameType").setValue(data.invoiceNameType);
					nui.get("historyInvoiceType").setValue(data.invoiceType);
					nui.get("historyInvoiceRate").setValue(data.invoiceRate);
					nui.get("historyInvoiceUsed").setValue(data.invoiceUsed);
					nui.get("historyPayType").setValue(data.payType);
					nui.get("historyInvoiceSumCapital").setValue(data.invoiceSumCapital);
					nui.get("historyInvoiceSum").setValue(data.invoiceSum);
					nui.get("historyBookIncome").setValue(data.bookIncome);
					nui.get("historyInvoiceTax").setValue(data.invoiceTax);
					nui.get("historyAllotFlag").setValue(data.allotFlag);
					nui.get("historyPayerName").setValue(data.payerName);
					nui.get("historyTaxpayerNumber").setValue(data.taxpayerNumber);
					nui.get("historyUnitAddress").setValue(data.unitAddress);
					nui.get("historyAccount").setValue(data.account);
					nui.get("historyInvoiceRemark").setValue(data.invoiceRemark);
					nui.get("historyPostFlag").setValue(data.postFlag);
					nui.get("historyInvoiceUser").setValue(data.invoiceUser);
					nui.get("historyMailName").setValue(data.mailName);
					nui.get("historyMailPhone").setValue(data.mailPhone);
					nui.get("historyMailAddress").setValue(data.mailAddress);
					nui.get("historyRemark").setValue(data.remark);
					nui.get("historyInvoiceSumChinese").setValue(functiondigitUppercase(nui.get("historyInvoiceSum").getValue()));

					var grid_0 = nui.get("grid_0");
					grid_0.load({
						"groupid" : "INVOICE",
						"relationid" : data.id
					});
					grid_0.sortBy("fileTime", "desc");

				}
			})
		}

		function onCancel(e) {
			CloseWindow("cancel");
		}

		function CloseWindow(action) {
			if (window.CloseOwnerWindow)
				return window.CloseOwnerWindow(action);
			else
				window.close();
		}

		function isNegative(num) {
			if (num < 0) {
				return true;
			} else {
				return false;
			}
		}

		function editContractSum() {
			var rate = nui.get("historyInvoiceRate").getValue();
			var invoiceSum = nui.get("invoiceSum").getValue();
			var c = rate / 100;
			var s = 1 + c;
			var bookIncome = invoiceSum / s;
			abs = function(val) {
				var str = (val).toFixed(2) + '';
				var intSum = str.substring(0, str.indexOf(".")).replace(/\B(?=(?:\d{3})+$)/g, '');
				var dot = str.substring(str.length, str.indexOf("."))
				var ret = intSum + dot;
				return ret;
			}
			nui.get("bookIncome").setValue(abs(bookIncome));
			nui.get("invoiceTax").setValue(abs(invoiceSum - abs(bookIncome)));
			nui.get("invoiceSumChinese").setValue(functiondigitUppercase(invoiceSum));
		}

		function onOk() {
			if (!form.validate()) {
				showTips("请检查表单的完整性!", "danger");
				return;
			}
			var invoiceSum = nui.get("invoiceSum").getValue();
			if (!isNegative(invoiceSum)) {
				showTips("红冲/作废金额只能为负数!", "danger");
				return;
			}
			document.getElementById("fileCatalog").value = "invoiceinfo";
			inputFileExpandForm.submit();
		}
		
		function SaveData() {
			var data = form.getData();
			var json = nui.encode({
				'data' : data
			});
			if (!confirm("是否保存？")) {
				return;
			} else {
				nui.ajax({
					url : "com.zhonghe.ame.invoice.invoice.updateInvoice.biz.ext",
					data : json,
					type : 'POST',
					cache : false,
					contentType : 'text/json',
					success : function(text) {
						if (text.result == 1) {
							nui.alert("编辑成功", null, function() {
								window.CloseOwnerWindow("save");
							});
						} else {
							nui.alert("编辑失败")
						}
					},
					error : function(jqXHR, textStatus, errorThrown) {
						alert(jqXHR.responseText);
					}
				});
			}
		}		
		
	</script>

</body>
</html>