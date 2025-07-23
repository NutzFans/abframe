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
<title>预算主体 - 新增</title>
</head>
<body>
	<div class="nui-fit" style="padding: 5px;">
		<fieldset id="field1" style="border: solid 1px #aaa;">
			<legend>预算主体 - 新增</legend>
			<form id="addForm" method="post">
				<div style="padding: 5px;">
					<table style="table-layout: fixed;">
						<tr>
							<td align="right" style="width: 80px">预算主体：</td>
							<td>
								<input name="name" class="nui-textbox" style="width: 260px" required="true" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 80px">主体代码：</td>
							<td>
								<input name="code" class="nui-textbox" style="width: 260px" required="true" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 100px">预算填报组织：</td>
							<td>
								<input id="fillingInOrg" name="fillingInOrg" class="nui-combobox" textField="secOrgname" valueField="secOrg" style="width: 260px" required="true" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 80px">主体排序：</td>
							<td>
								<input name="sorting" class="mini-spinner" style="width: 260px" required="true" minValue="1" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 100px">备注：</td>
							<td>
								<input id="remark" name="remark" class="nui-textarea" style="width: 260px; height: 120px" />
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
		var form = new nui.Form("addForm");

		initSecOrgCombobox();

		function initSecOrgCombobox() {
			ajaxCommon({
				"url" : "com.zhonghe.ame.kaohe.common.getBusSecOrgList.biz.ext",
				contentType : 'text/json',
				success : function(result) {
					var datas = result.secOrgList;
					nui.get("fillingInOrg").setData(datas);
				}
			});
		}

		function save() {
			if (!form.validate()) {
				showTips("请检查表单的完整性!", "danger");
				return;
			}
			nui.confirm("确定保存数据吗？", "系统提示", function(action) {
				if (action == "ok") {
					nui.get("saveBtn").disable();
					nui.get("closeBtn").disable();
					nui.mask({
						el : document.body,
						cls : 'mini-mask-loading',
						html : '表单保存中...'
					});
					setTimeout(function() {
						nui.unmask(document.body);
						var formData = form.getData();
						var json = nui.encode({
							"budgetAccount" : formData
						});
						ajaxCommon({
							"url" : "com.zhonghe.ame.finance.budgetAccount.addBudgetAccount.biz.ext",
							data : json,
							contentType : 'text/json',
							success : function(text) {
								if (text.result == "1") {
									showTips("保存成功");
									closeOk();
								} else {
									nui.get("saveBtn").enable();
									nui.get("closeBtn").enable();
								}
							}
						});
					}, 2000);
				}
			});
		}
	</script>

</body>
</html>