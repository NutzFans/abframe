<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<head>
<title>付款信息维护</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%=request.getContextPath()%>/common/nui/nui.js" type="text/javascript"></script>
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
	<div class="nui-fit">
		<div class="mini-panel" title="" style="width: 100%;">
			<fieldset id="field1" style="border: solid 1px #aaa; padding: 3px; width: 100%;">
				<legend>付款基本信息</legend>
				<form id="form1" method="post">
					<input name="files" id="fileids" class="nui-hidden" />
					<input class="nui-hidden" name="id" />
					<input id="payId" name="payId" class="nui-hidden" />
					<input id="historyApplyPayContractSum" name="historyApplyPayContractSum" class="nui-hidden" />
					<div style="padding: 5px;">
						<table style="table-layout: fixed;">
							<tr>
								<td class="form_label" align="right">申请人</td>
								<td>
									<input name="createUserid" id="createUserid" class="nui-hidden" />
									<input id="createUsername" name="createUsername" class="nui-textbox" enabled="false" style="width: 300px" required="true" />
								</td>
								<td align="right" style="width: 160px">申请部门：</td>
								<td>
									<input name="createdOrgid" id="createdOrgid" class="nui-hidden" style="width: 300px;" />
									<input name="implementOrgname" id="implementOrgname" class="nui-textbox" enabled="false" style="width: 300px" required="true" />
								</td>
								<td align="right" style="width: 160px">申请日期：</td>
								<td>
									<input id="createTime" name="createTime" class="nui-datepicker" style="width: 300px" enabled="false" />
								</td>
							</tr>
							<tr>
								<td align="right" style="width: 160px">合同编号：</td>
								<td>
									<input id="contractId" name="contractId" class="nui-buttonedit" onbuttonclick="onButtonEdit" style="width: 300px" required="true" enabled="true" allowInput="false" />
								</td>
								<td align="right" style="width: 160px">合同名称：</td>
								<td colspan="6">
									<input id="contractName" name="contractName" class="nui-textbox" style="width: 100%" required="true" enabled="false" />
								</td>
							</tr>
							<tr>
								<td align="right" style="width: 160px">合同性质：</td>
								<td>
									<input id="contractNature" name="contractNature" class="nui-dictcombobox" dictTypeId="CONTRACT_NATURE" style="width: 100%" required="true" enabled="false" />
								</td>

								<td align="right" style="width: 160px">合同类型：</td>
								<td>
									<input id="contractType" name="contractType" class="nui-dictcombobox" dictTypeId="ZH_CONTRACT_TYPE" style="width: 100%" required="true" enabled="false" />
								</td>

								<td align="right" style="width: 160px">付款方：</td>
								<td>
									<input id="payer" name="payer" class="nui-dictcombobox" dictTypeId="ZH_INVOICE_NAME_TYPE" style="width: 100%" required="true" enabled="false" />
								</td>

							</tr>
							<tr>
								<td align="right" style="width: 160px">合同金额(元)：</td>
								<td>
									<input id="contractSum" name="contractSum" class="nui-textbox" style="width: 300px" required="true" enabled="false" />
								</td>
								<td align="right" style="width: 160px">累计已付金额(元)：</td>
								<td>
									<input id="paidContractSum" name="paidContractSum" class="nui-textbox" onvaluechanged="editPaidContractSum" style="width: 300px" required="false" enabled="false" />
								</td>
								<td align="right" style="width: 160px">本次支付金额(元)：</td>
								<td>
									<input id="applyPayContractSum" name="applyPayContractSum" class="nui-textbox" style="width: 300px" required="true" />
								</td>
							</tr>
							<tr>
								<td align="right" style="width: 160px">发票类型：</td>
								<td>
									<input id="invoiceType" name="invoiceType" class="nui-dictcombobox" dictTypeId="MIS_MA_INVOICETYPE" style="width: 300px" required="true" enabled="true" />
								</td>
								<td align="right" style="width: 160px">本次付款进度：</td>
								<td>
									<input id="payType" name="payType" class="nui-dictcombobox" dictTypeId="payType" style="width: 300px" required="true" enabled="true" />
								</td>
								<td align="right" style="width: 160px">最晚付款日期：</td>
								<td>
									<input id="endTime" name="endTime" class="nui-datepicker" style="width: 300px" required="true" />
								</td>
							</tr>
							<tr>
								<td align="right">收款单位：</td>
								<td colspan="8">
									<input name="signatory" id="signatory" class="nui-hidden" style="width: 300px" />
									<input id="signatoryName" name="signatoryName" class="nui-textbox" style="width: 100%" required="true" enabled="false" />
								</td>
							</tr>
							<tr>
								<td align="right">收款单位开户行名称：</td>
								<td colspan="8">
									<input id="accountName" name="accountName" class="nui-textbox" style="width: 100%" required="true" />
								</td>
							</tr>
							<tr>
								<td align="right">收款单位开户行账号：</td>
								<td colspan="8">
									<input id="account" name="account" class="nui-textbox" style="width: 100%" required="true" />
								</td>
							</tr>
							<tr>
								<td align="right">支付依据及情况说明：</td>
								<td colspan="8">
									<input id="remark" name="remark" class="nui-textarea" style="width: 100%; height: 150px" required="true" />
								</td>
							</tr>
						</table>
					</div>
				</form>
			</fieldset>
			<fieldset id="field2" style="border: solid 1px #aaa; padding: 3px;">
				<legend>上传附件</legend>
				<jsp:include page="/ame_common/inputFile.jsp" />
			</fieldset>
		</div>
	</div>

	<div style="text-align: center; padding: 10px;" class="nui-toolbar">
		<a class="nui-button" onclick="onOk()" id="creatReimbProcess" style="width: 80px; margin-right: 20px;">提交</a>
		<a class="nui-button" onclick="closeCancel" id="saveReimbProcess" style="width: 80px; margin-right: 140px;">关闭</a>
	</div>

	<script type="text/javascript">
		nui.parse();
		var form = new nui.Form("form1");

		function onOk() {
			//定义变量接受form表单数据
			var form = new nui.Form("#form1");
			form.validate();
			if (form.isValid() == false) {
				showTips("请检查表单的完整性!", "danger");
				return;
			}
			var checkPayPaid = "";
			ajaxCommon({
				"async" : false,
				"url" : "com.zhonghe.ame.payment.payMent.checkPayPaid.biz.ext",
				"data" : nui.encode({
					"payId" : nui.get("payId").getValue(),
					"applyPayContractSum" : nui.get("applyPayContractSum").getValue()
				}),
				"success" : function(data) {
					checkPayPaid = data.result;
				}
			});
			if (checkPayPaid == "2") {
				alert("当前付款金额已【超过】关联付费合同付款计划里对应本季度应付款总额！");
				return;
			}
			if (checkPayPaid == "3") {
				alert("关联的付费合同中未设置付款计划，无法提交付款流程！");
				return;
			}
			if (checkPayPaid == "4") {
				alert("检查本次支付金额合法性异常，请联系管理员！");
				return;
			}
			document.getElementById("fileCatalog").value = "payContractinfo";
			form2.submit();
		}

		function SaveData() {
			var form = new nui.Form("#form1");
			var data = form.getData();
			data.files = nui.get("fileids").getValue();
			var json = nui.encode({
				'data' : data
			});
			if (!confirm("是否保存？")) {
				return;
			} else {
				nui.ajax({
					url : "com.zhonghe.ame.payment.payMent.updatePayMen.biz.ext",
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

		function setEditData(data) {
			var form = new nui.Form("form1");
			form.setData(data)
			nui.get("contractId").setText(data.contractId);
			nui.get("contractId").setValue(data.contractId);
			nui.get("historyApplyPayContractSum").setValue(data.applyPayContractSum);
			var grid_0 = nui.get("grid_0");
			grid_0.load({
				"groupid" : "PAY_MENT",
				"relationid" : data.id
			});
			grid_0.sortBy("fileTime", "desc");
		}
		
		function onButtonEdit(e) {
			var btnEdit = this;
			mini.open({
				url : "/default/contractPact/payment/payMentContracList.jsp",
				title : "选择合同 - 付费合同信息",
				width : '1200',
				height : '610',
				ondestroy : function(action) {
					if (action == "ok") {
						var iframe = this.getIFrameEl();
						var data = iframe.contentWindow.GetData();
						data = mini.clone(data); //必须
						if (data) {
							btnEdit.setValue(data.contractNo);
							btnEdit.setText(data.contractNo);
							nui.get("contractName").setValue(data.contractName);
							nui.get("contractSum").setValue(data.finalSum);
							nui.get("signatory").setValue(data.signatory);
							nui.get("contractType").setValue(data.contractType);
							nui.get("contractNature").setValue(data.contractNature);
							nui.get("payer").setValue(data.payer);
							nui.get("payId").setValue(data.id);
							setPaidContractSum(data.finalSum, data.contractBalance);
							btnEdit.doValueChanged();
						}
					}

				}
			});
		}

		function setPaidContractSum(finalSum, contractBalance) {
			abs = function(val) {
				var str = (val).toFixed(2) + '';
				var intSum = str.substring(0, str.indexOf(".")).replace(/\B(?=(?:\d{3})+$)/g, '');
				var dot = str.substring(str.length, str.indexOf("."))
				var ret = intSum + dot;
				return ret;
			}
			nui.get("paidContractSum").setValue(abs(finalSum - contractBalance));
		}
	</script>
</body>
</html>