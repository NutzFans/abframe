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
<title>任务 - 进展情况 - 详情</title>
</head>
<body>
	<div class="nui-fit" style="padding: 5px;">
		<fieldset id="field1" style="border: solid 1px #aaa; padding: 5px;">
			<legend>集团任务 - 基本信息</legend>
			<form id="baseForm" method="post">
				<div style="padding: 5px;">
					<table style="table-layout: fixed;">
						<tr>
							<td align="right" style="width: 90px">任务名称：</td>
							<td>
								<input id="taskName" class="nui-textbox" style="width: 300px" readonly="readonly" />
							<td align="right" style="width: 90px">行动计划：</td>
							<td>
								<input id="actionPlan" class="nui-textbox" style="width: 300px" readonly="readonly" />
							</td>
							<td align="right" style="width: 90px">任务责任单位：</td>
							<td>
								<input id="secOrgStrs" class="nui-textbox" style="width: 250px" readonly="readonly" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 90px">衡量标准：</td>
							<td colspan="5">
								<input id="measureStandard" class="nui-textarea" style="width: 100%; height: 65px" readonly="readonly" />
							</td>
						</tr>
					</table>
				</div>
			</form>
		</fieldset>
		<p>
		<fieldset id="field1" style="border: solid 1px #aaa; padding: 5px;">
			<legend>
				任务分解计划 -
				<span id="zrdwSpan" style="color: red"></span>
			</legend>
			<div style="padding: 5px;">
				<div id="taskDecGrid" class="nui-datagrid" style="width: 98%; height: auto;" showPager="false" allowCellWrap="true">
					<div property="columns">
						<div field="taskMonth" width="50" headerAlign="center" align="center" renderer="renderMonth">时间节点</div>
						<div field="taskPlanName" width="800" headerAlign="center" align="left">分解计划</div>
						<div field="responsiblePerson" width="100" headerAlign="center" align="left">责任人</div>
					</div>
				</div>
			</div>
		</fieldset>
		<p>
		<fieldset id="field1" style="border: solid 1px #aaa; padding: 5px;">
			<legend>任务 - 进展情况</legend>
			<div style="width: 99%">
				<form id=tianBaoForm " method="post">
					<input name="id" class="nui-hidden" />
					<input name="files" id="fileids" class="nui-hidden" />
					<table style="table-layout: fixed;">
						<tr>
							<td align="right" style="width: 100px">填报月份：</td>
							<td>
								<input id="fillMonth" name="fillMonth" class="nui-combobox" style="width: 100px" readonly="readonly" />
								<div style="display: inline-table; padding: 1px; margin-left: 10px">完成状态：</div>
								<input id="taskStatus" name="taskStatus" class="nui-combobox" style="width: 100px" readonly="readonly" />
								<div style="display: inline-table; padding: 1px; margin-left: 10px">风险状态：</div>
								<input id="riskStatus" name="riskStatus" class="nui-combobox" style="width: 100px" readonly="readonly" />
								<div style="display: inline-block; color: red;">（指整个任务可能存在的风险，并非该分解计划的风险）</div>
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 100px">进展情况：</td>
							<td>
								<input name="taskProgress" class="nui-textarea" style="width: 900px; height: 65px" readonly="readonly" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 110px">截至本月完成情况：</td>
							<td>
								<input name="taskMonthComple" class="nui-textarea" style="width: 900px; height: 65px" readonly="readonly" />
							</td>
						</tr>						
						<tr id="riskMeasuresTr">
							<td align="right" style="width: 100px">风险及措施：</td>
							<td>
								<input id="riskMeasures" name="riskMeasures" class="nui-textarea" style="width: 900px; height: 65px" readonly="readonly" />
							</td>
						</tr>
					</table>
				</form>
			</div>
		</fieldset>
		<p>
		<fieldset id="field2" style="border: solid 1px #aaa; padding: 5px;">
			<legend>相关支撑材料</legend>
			<jsp:include page="/ame_common/detailFile.jsp"></jsp:include>
		</fieldset>
	</div>

	<div style="text-align: center; padding-top: 5px; padding-bottom: 10px; margin-bottom: 1px" class="nui-toolbar">
		<a id="closeBtn" class="nui-button" onclick="closeCancel()" style="width: 60px;" iconCls="icon-close">关闭</a>
	</div>
	
	<script type="text/javascript">
		nui.parse();
		var baseForm = new nui.Form("#baseForm");
		var taskDecGrid = nui.get("taskDecGrid");
		var tianBaoForm = new nui.Form("#tianBaoForm");
		
		function initData(id,mainId) {
			nui.get("fillMonth").setData(monthDict);
			nui.get("taskStatus").setData(taskStatusDict);
			nui.get("riskStatus").setData(riskStatusDict);		
			var json = nui.encode({
				'id' : mainId
			});		
			ajaxCommon({
				url : "com.zhonghe.ame.keyTask.group.getSecOrgStrsByTask.biz.ext",
				data : json,
				success : function(res) {
					var secOrgStrs = res.result;
					nui.get("secOrgStrs").setValue(secOrgStrs);
				}
			});
			ajaxCommon({
				url : "com.zhonghe.ame.keyTask.group.queryGroupTaskById.biz.ext",
				data : json,
				success : function(res) {
					var data = res.mainData;
					$("#zrdwSpan").text(data.secondaryOrgname);
					nui.get("taskName").setValue(data.taskName);
					nui.get("actionPlan").setValue(data.actionPlan);
					nui.get("measureStandard").setValue(data.measureStandard);
				}
			});
			ajaxCommon({
				url : "com.zhonghe.ame.keyTask.group.getGroupTaskItem.biz.ext",
				data : json,
				success : function(res) {
					taskDecGrid.setData(res.itemList);
				}
			});
			var itemJson = nui.encode({
				"id" : id
			});
			ajaxCommon({
				url : "com.zhonghe.ame.keyTask.group.queryGroupTaskItemById.biz.ext",
				data : itemJson,
				success : function(result) {
					var taskItemData = result.taskItem;
					tianBaoForm.setData(taskItemData);
					itemId = taskItemData.id;
					var grid_0 = nui.get("grid_0");
					grid_0.load({
						"groupid" : "groupTaskItem",
						"relationid" : taskItemData.id
					});
					grid_0.sortBy("fileTime", "desc");
				}
			});									
		}
		
		var monthDict = [ {
			id : "1",
			text : '1月'
		}, {
			id : "2",
			text : '2月'
		}, {
			id : "3",
			text : '3月'
		}, {
			id : "4",
			text : '4月'
		}, {
			id : "5",
			text : '5月'
		}, {
			id : "6",
			text : '6月'
		}, {
			id : "7",
			text : '7月'
		}, {
			id : "8",
			text : '8月'
		}, {
			id : "9",
			text : '9月'
		}, {
			id : "10",
			text : '10月'
		}, {
			id : "11",
			text : '11月'
		}, {
			id : "12",
			text : '12月'
		} ];

		var taskStatusDict = [ {
			id : "/",
			text : '/'
		}, {
			id : "已完成",
			text : '已完成'
		}, {
			id : "未完成",
			text : '未完成'
		} ];

		var riskStatusDict = [ {
			id : "无风险",
			text : '无风险'
		}, {
			id : "低风险",
			text : '低风险'
		}, {
			id : "高风险",
			text : '高风险'
		} ];				
		
	</script>

</body>
</html>