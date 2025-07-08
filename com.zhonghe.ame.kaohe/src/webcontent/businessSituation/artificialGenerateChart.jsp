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
<title>经营情况推送 - 生成统计图表</title>
</head>
<body>
	<div class="nui-fit" style="padding: 5px;">
		<fieldset id="field1" style="border: solid 1px #aaa;">
			<legend>经营情况推送 - 生成统计图表</legend>
			<form id="sctjtbForm" method="post">
				<div style="padding: 5px;">
					<table style="table-layout: fixed;">
						<tr>
							<td align="right" style="width: 80px">考核年月：</td>
							<td>
								<input id="yearMonth" class="nui-combobox" style="width: 300px" required="true" />
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<span style="color: red;">
									备注：
									<br>
									1、建议在次月初生成当月快照，以确保数据准确性。
									<br>
									2、若选定考核年月统计图表已存在(未推送情况下)，新生成的统计图表将自动覆盖原有数据。
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
		var form = new nui.Form("sctjtbForm");

		initYearMonth();

		function initYearMonth() {
			var currentDate = new Date();
			var yearMonthIterm = [];
			for (var i = 0; i < 12; i++) {
				var date = new Date(currentDate);
				date.setMonth(date.getMonth() - i);
				var year = date.getFullYear();
				var month = date.getMonth() + 1;
				var monthStr = String(date.getMonth() + 1).padStart(2, '0');
				yearMonthIterm.push({
					"id" : year + '-' + month,
					"text" : year + '年' + monthStr + '月'
				});
			}
			nui.get("yearMonth").setData(yearMonthIterm);
		}

		function save() {
			if (!form.validate()) {
				showTips("请检查表单的完整性!", "danger");
				return;
			}
			nui.confirm("确定生成统计图表吗？", "系统提示", function(action) {
				if (action == "ok") {
					nui.get("saveBtn").disable();
					nui.get("closeBtn").disable();
					nui.mask({
						el : document.body,
						cls : 'mini-mask-loading',
						html : '统计图表生成中...'
					});
					setTimeout(function() {
						nui.unmask(document.body);
						var yearMonth = nui.get("yearMonth").getValue();
						var arr = yearMonth.split('-');
						var json = nui.encode({
							"year" : arr[0],
							"month" : arr[1]
						});
						ajaxCommon({
							"url" : "com.zhonghe.ame.kaohe.businessSituation.artificialGenerateChart.biz.ext",
							data : json,
							contentType : 'text/json',
							success : function(text) {
								if (text.result == "1") {
									showTips("统计图表生成成功");
									closeOk();
								} else if (text.result == "2") {
									showTips("选定考核年月统计图表已存在并进行了推送，无法重新生成", "danger");
									nui.get("saveBtn").enable();
									nui.get("closeBtn").enable();
								} else {
									nui.get("saveBtn").enable();
									nui.get("closeBtn").enable();
								}
							}
						});
					}, 3000);
				}
			});
		}
	</script>

</body>
</html>