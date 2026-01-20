<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<style type="text/css">
html,body {
	margin: 0;
	padding: 0;
	border: 0;
	width: 100%;
	height: 100%;
	overflow: hidden;
}
</style>
<head>
<title>客户信息 - 维护</title>
</head>
<body>
	<div class="nui-fit" style="padding: 5px;">
		<fieldset id="field1" style="border: solid 1px #aaa; padding: 5px;">
			<legend>客户信息</legend>
			<form id="khxxForm" method="post">
				<input id="custid" name="custid" class="nui-hidden" />
				<div style="padding: 5px;">
					<table style="table-layout: fixed;">
						<tr>
							<td align="right" style="width: 70px">客户名称：</td>
							<td>
								<input id="custname" name="custname" class="nui-textbox" style="width: 400px" required="true" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 70px">客户类型：</td>
							<td>
								<input id="custtype" name="custtype" class="nui-dictcombobox" dictTypeId="CUSTOMER_TYPE" style="width: 400px" required="true" onvaluechanged="changeCustType" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 110px">统一社会信用代码：</td>
							<td>
								<input id="custnum" name="custnum" class="nui-textbox" style="width: 400px" required="true" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 70px">所属省份：</td>
							<td>
								<input name="provinces" class="nui-dictcombobox" dictTypeId="AME_PROVINCE" style="width: 400px" required="true" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 70px">集团内/外：</td>
							<td>
								<input name="outsideGroup" class="nui-dictcombobox" dictTypeId="ZH_GROUP_NEW" style="width: 400px" required="true" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 70px">境内/外：</td>
							<td>
								<input name="overseasCustomer" class="nui-dictcombobox" dictTypeId="ZH_OVERSEAS" style="width: 400px" required="true" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 70px">备注：</td>
							<td>
								<input name="remarks" class="nui-textarea" style="width: 400px; height: 100px" />
							</td>
						</tr>
					</table>
				</div>
			</form>
		</fieldset>
	</div>

	<div style="text-align: center; padding: 5px; margin-bottom: 1px" class="nui-toolbar">
		<a id="saveBtn" class="nui-button" onclick="save()" style="width: 60px; margin-right: 20px;" iconCls="icon-save">保存</a>
		<a id="closeBtn" class="nui-button" onclick="closeCancel()" style="width: 60px;" iconCls="icon-close">关闭</a>
	</div>

	<script type="text/javascript">
		nui.parse();
		var khxxForm = new nui.Form("khxxForm");

		function setEditData(data) {
			khxxForm.setData(data);
			changeCustType();
		}

		function save() {
			var custnum = nui.get("custnum").getValue();
			if (checkCustNum(custnum) == false) {
				showTips("您录入的【统一社会信用代码】已被使用，可能该客户已被录入！", "danger");
				return;
			}
			var custName = nui.get("custname").getValue();
			if (checkCustName(custName) == false) {
				showTips("您录入的【客户名称】已被使用！", "danger");
				return;
			}
			if (confirm("确定执行【保存】操作吗？")) {
				var data = khxxForm.getData();
				data.custname = nui.get("custname").getValue().trim();
				data.custnum = nui.get("custnum").getValue().trim();
				var json = nui.encode({
					'custData' : data
				});
				ajaxCommon({
					"url" : "com.zhonghe.ame.marketInfo.marketinfo.khxx.newCustomers.saveNewCustInfo.biz.ext",
					data : json,
					success : function(data) {
						if (data.result == "1") {
							showTips("客户信息保存成功");
							closeOk();
						} else {
							showTips("客户信息保存失败，请联系管理员！", "danger");
						}
					}
				});
			} else {
				return;
			}
		}

		function changeCustType() {
			var custtype = nui.get("custtype").getValue();
			if (custtype == "11" || custtype == "12" || custtype == "13" || custtype == "14") {
				nui.get("custnum").setRequired(false);
			} else {
				nui.get("custnum").setRequired(true);
			}
		}

		function checkCustNum(custnum) {
			var result = true;
			var custid = nui.get("custid").getValue();
			if (isStrEmpty(custnum)) {
				return result;
			} else {
				var json = nui.encode({
					'custnum' : custnum.trim(),
					'custid' : custid
				});
				ajaxCommon({
					url : "com.zhonghe.ame.marketInfo.marketinfo.khxx.newCustomers.checkCustNumById.biz.ext",
					data : json,
					async : false,
					success : function(data) {
						result = data.result;
					}
				});
				return result;
			}
		}

		function checkCustName(custName) {
			var result = true;
			var custid = nui.get("custid").getValue();
			if (isStrEmpty(custName)) {
				return result;
			} else {
				var json = nui.encode({
					'custName' : custName.trim(),
					'custid' : custid
				});
				ajaxCommon({
					url : "com.zhonghe.ame.marketInfo.marketinfo.khxx.newCustomers.checkCustNameById.biz.ext",
					data : json,
					async : false,
					success : function(data) {
						result = data.result;
					}
				});
				return result;
			}
		}

		function isStrEmpty(obj) {
			if (typeof obj == "undefined" || obj == null || obj == "") {
				return true;
			} else {
				return false;
			}
		}
	</script>

</body>
</html>