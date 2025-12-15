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
<title>创建 - 任务</title>
</head>
<body>
	<div class="nui-fit" style="padding: 5px;">
		<fieldset id="field1" style="border: solid 1px #aaa;">
			<legend>集团重点任务 - 任务信息及责任单位</legend>
			<form id="cjrwForm" method="post">
				<div style="padding: 5px;">
					<table style="table-layout: fixed;">
						<tr>
							<td align="right" style="width: 70px">任务年份：</td>
							<td>
								<input id="taskYear" name="taskYear" class="nui-combobox" style="width: 150px" required="true" />
							</td>
							<td align="right" style="width: 70px">领域：</td>
							<td>
								<input name="taskDomain" class="nui-textbox" style="width: 300px" required="true" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 70px">任务名称：</td>
							<td colspan="3">
								<input name="taskName" class="nui-textbox" style="width: 100%" required="true" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 70px">行动计划：</td>
							<td colspan="3">
								<input name="actionPlan" class="nui-textbox" style="width: 100%" required="true" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 90px">任务责任单位：</td>
							<td colspan="3">
								<div id="taskSecOrgs" class="nui-combobox" textField="secOrgname" valueField="secOrg" multiSelect="true" style="width: 100%" required="true">
									<div property="columns">
										<div header="任务责任单位" field="secOrgname"></div>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 70px">衡量标准：</td>
							<td colspan="3">
								<input name="measureStandard" class="nui-textarea" style="width: 100%; height: 100px" required="true" />
							</td>
						</tr>
						<tr>
							<td colspan="4">
								<span style="color: red;">
									备注：
									<br>
									1、集团重点任务通过任务年份、任务名称、行动计划三个字段组合唯一标识，该组合不可重复。
									<br>
									2、若新增任务时上述三个字段组合与已有任务完全一致，可能导致原有任务数据被覆盖，请务必谨慎核对。
									<br>
									3、同一任务需分配给多个责任单位时，无需重复创建任务，可在对应任务下直接选择多个责任单位。
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
		var cjrwForm = new nui.Form("#cjrwForm");

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
			if (!cjrwForm.validate()) {
				showTips("请检查表单的完整性!", "danger");
				return;
			}
			nui.confirm("确定生成集团任务及任务职责单位吗？", "系统提示", function(action) {
				if (action == "ok") {
					nui.get("saveBtn").disable();
					nui.mask({
						el : document.body,
						cls : 'mini-mask-loading',
						html : '表单提交中...'
					});
					var formData = cjrwForm.getData();
					var taskSecOrgs = nui.get("taskSecOrgs").getValue();
					var taskSecOrgnames = nui.get("taskSecOrgs").getText();
					var json = nui.encode({
						"taskSecOrgs" : taskSecOrgs,
						"taskSecOrgnames" : taskSecOrgnames,
						"taskYear" : formData.taskYear,
						"taskDomain" : formData.taskDomain,
						"taskName" : formData.taskName,
						"actionPlan" : formData.actionPlan,
						"measureStandard" : formData.measureStandard
					});
					ajaxCommon({
						"url" : "com.zhonghe.ame.keyTask.group.addTask.biz.ext",
						data : json,
						contentType : 'text/json',
						success : function(text) {
							nui.unmask(document.body);
							if (text.result == "1") {
								showTips("集团任务及任务职责单位数据生成成功");
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