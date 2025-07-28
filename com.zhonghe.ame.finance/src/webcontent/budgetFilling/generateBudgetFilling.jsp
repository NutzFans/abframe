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

.mini-grid-cell-nowrap {
	white-space: nowrap;
}
</style>
<head>
<title>生成预算填报 - 年度</title>
</head>
<body>
	<div class="nui-fit" style="padding: 5px;">
		<fieldset id="field1" style="border: solid 1px #aaa;">
			<legend>生成预算填报 - 年度</legend>
			<form id="scystbForm" method="post">
				<div style="padding: 5px;">
					<table style="table-layout: fixed;">
						<tr>
							<td align="right" style="width: 80px">预算主体：</td>
							<td>
								<div id="budgetAccounts" class="nui-combobox" textField="name" valueField="id" multiSelect="true" style="width: 300px" required="true">
									<div property="columns">
										<div header="预算主体" field="name"></div>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 80px">预算年份：</td>
							<td>
								<input id="years" class="nui-combobox" style="width: 300px" required="true" />
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<span style="color: red;">
									备注：
									<br>
									1、若选定的预算单位及年份已存在预算填报数据，新生成的预算填报将自动覆盖原有数据。
									<br>
									2、因此在生成预算填报时请谨慎操作，防止覆盖已经填报的预算数据。
								</span>
							</td>
						</tr>
					</table>
				</div>
			</form>
		</fieldset>
	</div>

	<div style="text-align: center; padding: 5px; margin-bottom: 1px" class="nui-toolbar">
		<a id="saveBtn" class="nui-button" onclick="save()" style="width: 60px; margin-right: 20px;" iconCls="icon-save">生成</a>
		<a id="closeBtn" class="nui-button" onclick="closeCancel()" style="width: 60px;" iconCls="icon-close">关闭</a>
	</div>

	<script type="text/javascript">
		nui.parse();
		var form = new nui.Form("#scystbForm");

		initBudgetAccountCombobox();
		initYearCombobox();

		function initBudgetAccountCombobox() {
			ajaxCommon({
				"url" : "com.zhonghe.ame.finance.common.getBudgetAccountList.biz.ext",
				contentType : 'text/json',
				async : false,
				success : function(result) {
					var datas = result.budgetAccountList;
					nui.get("budgetAccounts").setData(datas);
				}
			});
		}

		function initYearCombobox() {
			var year = new Date().getFullYear();
			var yeariterm = [];
			for (var i = -2; i < 5; i++) {
				yeariterm.push({
					"id" : year + i,
					"text" : year + i
				});
			}
			nui.get("years").setData(yeariterm);
		}

		function save() {
			if (!form.validate()) {
				showTips("请检查表单的完整性!", "danger");
				return;
			}
			nui.confirm("确定生成预算填报数据吗？", "系统提示", function(action) {
				if (action == "ok") {
					nui.get("saveBtn").disable();
					nui.get("closeBtn").disable();
					nui.mask({
						el : document.body,
						cls : 'mini-mask-loading',
						html : '预算填报数据生成中...'
					});
					setTimeout(function() {
						var budgetAccounts = nui.get("budgetAccounts").getValue();
						var years = nui.get("years").getValue();
						var json = nui.encode({
							"budgetAccounts" : budgetAccounts,
							"year" : years
						});
						ajaxCommon({
							"url" : "com.zhonghe.ame.finance.budgetFilling.generateBudgetFilling.biz.ext",
							data : json,
							contentType : 'text/json',
							success : function(text) {
								nui.unmask(document.body);
								if (text.result == "1") {
									showTips("预算填报数据生成成功");
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