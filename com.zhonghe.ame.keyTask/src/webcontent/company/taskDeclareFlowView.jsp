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
<title>任务申报流程 - 流程查看</title>
</head>
<body>
	<div class="nui-fit" style="padding: 5px;">
		<fieldset id="field1" style="border: solid 1px #aaa; padding: 5px;">
			<legend>任务 - 基本信息</legend>
			<div style="width: 99%">
				<form id="flowForm" method="post">
					<input name="id" class="nui-hidden" />
					<input name="processId" class="nui-hidden" />
					<table style="table-layout: fixed;">
						<tr>
							<td align="right" style="width: 100px">任务年份：</td>
							<td>
								<input name="taskYear" class="nui-textbox" style="width: 100px" readonly="readonly" />
							</td>
							<td align="right" style="width: 100px">任务责任单位：</td>
							<td>
								<input name="secondaryOrgname" class="nui-textbox" style="width: 200px" readonly="readonly" />
							</td>
						</tr>
					</table>
				</form>
			</div>
		</fieldset>
		<p>
		<fieldset id="field2" style="border: solid 1px #aaa; padding: 5px;">
			<legend>任务及分解计划</legend>
			<div style="width: 99%; margin: 0 auto;">
				<div id="itemGrid" class="nui-datagrid" style="width: 100%; height: 650px;" showPager="false" url="com.zhonghe.ame.keyTask.company.queryItemListByMainId.biz.ext" dataField="itemDatas"
					allowCellSelect="true" enableHotTrack="false" allowRowSelect="false" allowCellWrap="true">
					<div property="columns">
						<div field="actionPlanNumber" name="actionPlanNumber" width="150" align="center" headerAlign="center">行动计划编号</div>
						<div field="taskName" name="taskName" width="250" align="center" headerAlign="center">任务名称</div>
						<div field="annualTarget" name="annualTarget" width="300" align="left" headerAlign="center">年度目标</div>
						<div field="taskMonth" width="40" headeralign="center" align="center" renderer="renderMonth">时间节点</div>
						<div field="taskPlanName" width="450" headeralign="center" align="left">分解计划</div>
					</div>
				</div>
			</div>
		</fieldset>
	</div>

	<script type="text/javascript">
		nui.parse();
		var processId = <%=request.getParameter("processInstID")%>;
		var flowForm = new nui.Form("#flowForm");
		var itemGrid = nui.get("itemGrid");

		itemGrid.on("load", function() {
			itemGrid.mergeColumns([ "checkcolumn", "actionPlanNumber", "taskName", "annualTarget" ]);
		});

		init();

		function init() {
			var data = {
				"processId" : processId
			};
			var json = nui.encode(data);
			ajaxCommon({
				url : "com.zhonghe.ame.keyTask.company.queryCompanyTaskById.biz.ext",
				data : json,
				success : function(result) {
					flowForm.setData(result.mainData);
					itemGrid.load({
						'mainId' : result.mainData.id
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