<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
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
<head>
<title>开票管理-产值分配</title>
</head>
<body>
	<div class="nui-fit" style="padding: 5px;">
		<fieldset id="field1" style="border: solid 1px #aaa;">
			<legend>当前待分配产值</legend>
			<form>
				<div style="padding: 5px;">
					<table style="table-layout: fixed;">
						<tr>
							<td align="right" style="width: 120px">开票金额（元）：</td>
							<td>
								<input id="historyInvoiceSum" class="nui-textbox" vtype="float" enabled="false" />
							</td>
							<td align="right" style="width: 120px">账面收入（元）：</td>
							<td>
								<input id="historyBookIncome" class="nui-textbox" vtype="float" enabled="false" />
							</td>
							<td align="right" style="width: 120px">税额：</td>
							<td>
								<input id="historyInvoiceTax" class="nui-textbox" vtype="float" enabled="false" />
							</td>
							<td align="right" style="width: 120px">回款金额（元）：</td>
							<td>
								<input id="historyReceivableSum" class="nui-textbox" vtype="float" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 120px">余额（元）：</td>
							<td>
								<input id="historyBalanceSum" class="nui-textbox" vtype="float" enabled="false" />
							</td>
							<td align="right" style="width: 120px">核查（元）：</td>
							<td>
								<input id="historyVerification" class="nui-textbox" vtype="float" enabled="false" />
							</td>
							<td align="right" style="width: 120px">回款时间：</td>
							<td>
								<input id="historyReceivableData" class="nui-datepicker" enabled="false" />
							</td>
						</tr>
					</table>
				</div>
			</form>
		</fieldset>

		<fieldset id="field2" style="border: solid 1px #aaa;">
			<legend>产值分配</legend>
			<form id="form1" method="post">
				<input class="nui-hidden" name="id" id="invoiceId" />
				<div style="padding: 5px;">
					<table style="table-layout: fixed;">
						<tr>
							<td align="right" style="width: 120px">申请人：</td>
							<td>
								<input id="createUsername" class="nui-textbox" enabled="false" />
							</td>
							<td align="right" style="width: 120px">承办部门：</td>
							<td>
								<input id="implementOrgname" class="nui-textbox" enabled="false" />
							</td>
							<td align="right" style="width: 120px">开票金额（元）：</td>
							<td>
								<input id="invoiceSum" name="invoiceSum" class="nui-textbox" vtype="float" required="true" onvaluechanged="editContractSum" />
							</td>
							<td align="right" style="width: 120px">账面收入（元）：</td>
							<td>
								<input id="bookIncome" name="bookIncome" class="nui-textbox" vtype="float" required="true" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 120px">税额：</td>
							<td>
								<input name="invoiceTax" id="invoiceTax" class="nui-textbox" vtype="float" required="true" />
							</td>
							<td align="right" style="width: 120px">回款金额（元）：</td>
							<td>
								<input id="receivableSum" name="receivableSum" class="nui-textbox" vtype="float" onvaluechanged="receivableSum" />
							</td>
							<td align="right" style="width: 120px">余额（元）：</td>
							<td>
								<input id="balanceSum" name="balanceSum" class="nui-textbox" vtype="float" />
							</td>
							<td align="right" style="width: 120px">核查（元）：</td>
							<td>
								<input id="verification" name="verification" class="nui-textbox" vtype="float" />
							</td>
						</tr>
					</table>
				</div>
			</form>
		</fieldset>

		<fieldset id="field3" style="border: solid 1px #aaa;">
			<legend>产值分配</legend>
			<form id="form2" method="post">
				<div style="padding: 5px;">
					<table style="table-layout: fixed;">
						<tr>
							<td align="right" style="width: 120px">申请人：</td>
							<td>
								<input id="newCreateUserid" name="newCreateUserid" class="nui-buttonedit" onbuttonclick="czfpUserSelect" required="true" enabled="true" allowInput="false" />
							</td>
							<td align="right" style="width: 120px">承办部门：</td>
							<td>
								<input id="newImplementOrg" name="newImplementOrg" class="nui-hidden" />
								<input id="newImplementOrgname" class="nui-textbox" enabled="false" />
							</td>
							<td align="right" style="width: 120px">开票金额（元）：</td>
							<td>
								<input id="newInvoiceSum" name="newInvoiceSum" class="nui-textbox" vtype="float" required="true" onvaluechanged="newEditContractSum" />
							</td>
							<td align="right" style="width: 120px">账面收入（元）：</td>
							<td>
								<input id="newBookIncome" name="newBookIncome" class="nui-textbox" vtype="float" required="true" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 120px">税额：</td>
							<td>
								<input name="newInvoiceTax" id="newInvoiceTax" class="nui-textbox" vtype="float" required="true" />
							</td>
							<td align="right" style="width: 120px">回款金额（元）：</td>
							<td>
								<input id="newReceivableSum" name="newReceivableSum" class="nui-textbox" vtype="float" onvaluechanged="newReceivableSum" />
							</td>
							<td align="right" style="width: 120px">余额（元）：</td>
							<td>
								<input id="newBalanceSum" name="newBalanceSum" class="nui-textbox" vtype="float" />
							</td>
							<td align="right" style="width: 120px">核查（元）：</td>
							<td>
								<input id="newVerification" name="newVerification" class="nui-textbox" vtype="float" />
							</td>
						</tr>
					</table>
				</div>
			</form>
		</fieldset>

		<div style="padding: 5px; border: solid 1px #aaa; text-align: center; margin: 2px" class="nui-toolbar">
			<a class="nui-button" onclick="onOk()" id="creatReimbProcess" style="width: 80px;" iconCls="icon-ok">确定</a>
			<a class="nui-button" onclick="onCancel()" id="saveReimbProcess" style="width: 80px; margin-left: 56px" iconCls="icon-close">关闭</a>
		</div>

	</div>

	<script type="text/javascript">
		nui.parse();
		var form1 = new nui.Form("form1");
		var form2 = new nui.Form("form2");

		function setEditData(data) {
			nui.get("historyInvoiceSum").setValue(data.invoiceSum);
			nui.get("historyBookIncome").setValue(data.bookIncome);
			nui.get("historyInvoiceTax").setValue(data.invoiceTax);
			nui.get("historyReceivableSum").setValue(data.receivableSum);
			nui.get("historyBalanceSum").setValue(data.balanceSum);
			nui.get("historyVerification").setValue(data.verification);
			nui.get("historyReceivableData").setValue(data.receivableData);
			nui.get("invoiceId").setValue(data.id);
			nui.get("createUsername").setValue(data.createUsername);
			nui.get("implementOrgname").setValue(data.implementOrgname);
		}

		function czfpUserSelect() {
			mini.open({
				url : "/default/contractPact/invoice/selectCzfpUser.jsp",
				title : "产值分配 - 选择经办人",
				width : '500',
				height : '350',
				ondestroy : function(action) {
					if (action == "ok") {
						var iframe = this.getIFrameEl();
						var data = iframe.contentWindow.GetData();
						data = mini.clone(data); //必须
						nui.get("newCreateUserid").setValue(data.userid);
						nui.get("newCreateUserid").setText(data.empname);
						nui.get("newImplementOrg").setValue(data.orgid);
						nui.get("newImplementOrgname").setValue(data.orgname);
					}
				}
			});
		}

		function editContractSum() {
			var rate = 6;
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
		}

		function newEditContractSum() {
			var rate = 6;
			var invoiceSum = nui.get("newInvoiceSum").getValue();
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
			nui.get("newBookIncome").setValue(abs(bookIncome));
			nui.get("newInvoiceTax").setValue(abs(invoiceSum - abs(bookIncome)));
		}

		function receivableSum() {
			var receivableSum = nui.get("receivableSum").getValue();
			var invoiceSum = nui.get("invoiceSum").getValue();
			abs = function(val) {
				var str = (val).toFixed(2) + '';
				var intSum = str.substring(0, str.indexOf(".")).replace(/\B(?=(?:\d{3})+$)/g, '');
				var dot = str.substring(str.length, str.indexOf("."))
				var ret = intSum + dot;
				return ret;
			}
			nui.get("balanceSum").setValue(abs(invoiceSum - receivableSum));
		}

		function newReceivableSum() {
			var receivableSum = nui.get("newReceivableSum").getValue();
			var invoiceSum = nui.get("newInvoiceSum").getValue();
			abs = function(val) {
				var str = (val).toFixed(2) + '';
				var intSum = str.substring(0, str.indexOf(".")).replace(/\B(?=(?:\d{3})+$)/g, '');
				var dot = str.substring(str.length, str.indexOf("."))
				var ret = intSum + dot;
				return ret;
			}
			nui.get("newBalanceSum").setValue(abs(invoiceSum - receivableSum));
		}

		function onCancel(e) {
			CloseWindow("cancel");
		}

		//标准方法接口定义
		function CloseWindow(action) {
			if (window.CloseOwnerWindow) {
				return window.CloseOwnerWindow(action);
			} else {
				window.close();
			}
		}

		function onOk() {
			if (!form1.validate() || !form2.validate()) {
				showTips("请检查表单的完整性!", "danger");
				return;
			}
			var historyInvoiceSum = nui.get("historyInvoiceSum").getValue();
			var invoiceSum = nui.get("invoiceSum").getValue();
			var newInvoiceSum = nui.get("newInvoiceSum").getValue();
			var sum = eval(invoiceSum) + eval(newInvoiceSum);
			console.log(sum);
			if (sum != historyInvoiceSum) {
				showTips("产值分配后的开票金额之和，应等于待产值分配时的开票金额！", "danger");
				return;
			}
			var invoiceData = form1.getData();
			var newInvoiceData = form2.getData();
			var json = nui.encode({
				'invoice' : invoiceData,
				'newInvoice' : newInvoiceData
			});
			nui.ajax({
				url : "com.zhonghe.ame.invoice.invoice.czfpInvoice.biz.ext",
				type : 'POST',
				data : json,
				contentType : 'text/json',
				success : function(o) {
					if (o.result == 1) {
						showTips("产值分配成功");
						CloseWindow("ok");
					} else {
						showTips("产值分配失败，请联系信息技术部人员！", "danger");
					}
				}
			});
		}
	</script>

</body>
</html>