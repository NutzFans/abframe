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

/* 强制长单词/字符自动断行 */
.mini-grid-cell-inner {
	word-wrap: break-word !important; /* 英文单词内断行 */
	word-break: break-all !important; /* 中文/英文强制断行 */
}
</style>
<head>
<title>任务分解申报流程 - 流程查看</title>
</head>
<body>
	<div class="nui-fit" style="padding: 5px;">
		<fieldset id="field1" style="border: solid 1px #aaa; padding: 5px;">
			<legend>集团任务 - 基本信息</legend>
			<form id="flowForm" method="post">
				<input name="id" class="nui-hidden" />
				<input name="processId" class="nui-hidden" />
				<div style="padding: 5px;">
					<table style="table-layout: fixed;">
						<tr>
							<td align="right" style="width: 90px">任务年份：</td>
							<td>
								<input name="taskYear" class="nui-textbox" style="width: 150px" readonly="readonly" />
							</td>
							<td align="right" style="width: 90px">领域：</td>
							<td>
								<input name="taskDomain" class="nui-textbox" style="width: 500px" readonly="readonly" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 90px">任务名称：</td>
							<td colspan="3">
								<input name="taskName" class="nui-textbox" style="width: 100%" readonly="readonly" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 90px">行动计划：</td>
							<td colspan="3">
								<input name="actionPlan" class="nui-textbox" style="width: 100%" readonly="readonly" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 90px">任务责任单位：</td>
							<td colspan="3">
								<input id="secOrgStrs" class="nui-textbox" style="width: 100%" readonly="readonly" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 90px">衡量标准：</td>
							<td colspan="3">
								<input name="measureStandard" class="nui-textarea" style="width: 100%; height: 100px" readonly="readonly" />
							</td>
						</tr>
					</table>
				</div>
			</form>
		</fieldset>
		<p>
		<fieldset id="field2" style="border: solid 1px #aaa; padding: 5px;">
			<legend>
				任务 - 分解计划 -
				<span id="zrdwSpan" style="color: red"></span>
			</legend>
			<div id="taskDecGrid" class="nui-datagrid" style="width: 99%; height: 250px;" url="com.zhonghe.ame.keyTask.group.getGroupTaskItem.biz.ext" dataField="itemList" showPager="false"
				allowCellSelect="true" enableHotTrack="false" allowRowSelect="false" allowCellWrap="true">
				<div property="columns">
					<div field="taskMonth" width="50" headerAlign="center" align="center" vtype="required" renderer="renderMonth">时间节点</div>
					<div field="taskPlanName" width="800" headerAlign="center" align="left" vtype="required">分解计划</div>
				</div>
			</div>
		</fieldset>
	</div>

	<script type="text/javascript">
		nui.parse();
		var processId =<%=request.getParameter("processInstID")%>;
		var flowForm = new nui.Form("#flowForm");
		var taskDecGrid = nui.get("taskDecGrid");
		
		init();

		function init() {
			var data = {
				"processId" : processId
			};
			var json = nui.encode(data);
			ajaxCommon({
				url : "com.zhonghe.ame.keyTask.group.queryGroupTaskById.biz.ext",
				data : json,
				success : function(result) {
					$("#zrdwSpan").text(result.mainData.secondaryOrgname);
					var json = nui.encode({
						'id' : result.mainData.id
					});
					ajaxCommon({
						url : "com.zhonghe.ame.keyTask.group.getSecOrgStrsByTask.biz.ext",
						data : json,
						success : function(res) {
							var secOrgStrs = res.result;
							nui.get("secOrgStrs").setValue(secOrgStrs);
							flowForm.setData(result.mainData);
							taskDecGrid.load({
								'id' : result.mainData.id
							});
						}
					});
				}
			});
		}
		
		function renderMonth(e) {
			if (e.value != null && e.value != "") {
				return e.value + "月";
			}
		}		
		
	</script>

</body>
</html>