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

.mini-grid-summaryCell {
	text-align: center;
}
</style>
<head>
<title>生成 - 任务责任单位</title>
</head>
<body>
	<div class="nui-fit" style="padding: 5px;">
		<fieldset id="field1" style="border: solid 1px #aaa;">
			<legend>重点任务 - 任务年份及责任单位</legend>
			<form id="rwzrdwForm" method="post">
				<div style="padding: 5px;">
					<table style="table-layout: fixed;">
						<tr>
							<td align="right" style="width: 90px">任务责任单位：</td>
							<td>
								<div id="taskSecOrgs" class="nui-combobox" textField="secOrgname" valueField="secOrg" multiSelect="true" style="width: 300px" required="true">
									<div property="columns">
										<div header="任务责任单位" field="secOrgname"></div>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 90px">任务年份：</td>
							<td>
								<input id="taskYear" class="nui-combobox" style="width: 300px" required="true" />
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<span style="color: red;">
									备注：
									<br>
									1、若选定的任务责任单位及任务年份已存在任务数据，新生成的将自动覆盖原有任务数据。
									<br>
									2、因此在生成时请谨慎操作，防止覆盖已有的数据。
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
		var rwzrdwForm = new nui.Form("#rwzrdwForm");

		initTaskSecOrgsCombobox();
		initYearCombobox();

		function initTaskSecOrgsCombobox() {
			ajaxCommon({
				url : "com.zhonghe.ame.kaohe.common.getBusSecOrgList.biz.ext",
				contentType : 'text/json',
				async : false,
				success : function(result) {
					var datas = result.secOrgList;
					nui.get("taskSecOrgs").setData(datas);
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
			nui.get("taskYear").setData(yeariterm);
		}

		function save() {
			if (!rwzrdwForm.validate()) {
				showTips("请检查表单的完整性!", "danger");
				return;
			}
			nui.confirm("确定生成责任单位数据吗？", "系统提示", function(action) {
				if (action == "ok") {
					nui.get("saveBtn").disable();
					nui.mask({
						el : document.body,
						cls : 'mini-mask-loading',
						html : '表单提交中...'
					});
					var taskSecOrgs = nui.get("taskSecOrgs").getValue();
					var taskSecOrgnames = nui.get("taskSecOrgs").getText();
					var taskYear = nui.get("taskYear").getValue();
					var json = nui.encode({
						"taskSecOrgs" : taskSecOrgs,
						"taskSecOrgnames" : taskSecOrgnames,
						"taskYear" : taskYear
					});
					ajaxCommon({
						"url" : "com.zhonghe.ame.keyTask.company.addRwzrdw.biz.ext",
						data : json,
						contentType : 'text/json',
						success : function(text) {
							nui.unmask(document.body);
							if (text.result == "1") {
								showTips("任务责任单位数据生成成功");
								closeOk();
							} else {
								nui.get("saveBtn").enable();
							}
						}
					});
				}
			});
		}
	</script>

</body>
</html>