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
<title>任务详情</title>
</head>
<body>
	<div class="nui-fit" style="padding: 5px;">
		<fieldset id="field1" style="border: solid 1px #aaa; padding: 5px;">
			<legend>基本信息</legend>
			<div>
				<form id="groupForm" method="post">
					<input name="id" class="nui-hidden" />
					<table style="table-layout: fixed;">
						<tr>
							<td align="right" style="width: 100px">任务年份：</td>
							<td>
								<input name="taskYear" class="nui-textbox" style="width: 100px" readonly="readonly" />
							</td>
							<td align="right" style="width: 100px">任务责任单位：</td>
							<td>
								<input id="secOrgStrs" class="nui-textbox" style="width: 400px" readonly="readonly" />
							</td>
							<td align="right" style="width: 90px">任务名称：</td>
							<td>
								<input name="taskName" class="nui-textbox" style="width: 400px" readonly="readonly" />
							</td>
							<td align="right" style="width: 90px">行动计划：</td>
							<td>
								<input name="actionPlan" class="nui-textbox" style="width: 400px" readonly="readonly" />
							</td>
						</tr>
					</table>
				</form>
			</div>
		</fieldset>
		<p>
		<fieldset id="field2" style="border: solid 1px #aaa; padding: 5px;">
			<legend>
				任务 - 分解计划 -
				<span id="zrdwSpan" style="color: red"></span>
			</legend>
			<div style="padding: 5px;">
				<div id="taskDecGrid" class="nui-datagrid" style="width: 100%; height: auto;" showPager="false" allowCellWrap="true">
					<div property="columns">
						<div field="taskMonth" width="50" headerAlign="center" align="center" renderer="renderMonth">时间节点</div>
						<div field="taskPlanName" width="800" headerAlign="center" align="left">分解计划</div>
						<div field="responsiblePerson" width="100" headerAlign="center" align="left">责任人</div>
					</div>
				</div>
			</div>
		</fieldset>
		<p>
		<fieldset id="field3" style="border: solid 1px #aaa; padding: 5px;">
			<legend>任务进展情况 - 
				<span id="zrdwjzSpan" style="color: red"></span>
			</legend>
			<div style="padding: 5px;">
				<div id="taskTBHistoryGrid" class="nui-datagrid" style="width: 100%; height: auto;" showPager="false" allowCellWrap="true">
					<div property="columns">
						<div field="fillMonth" width="50" headerAlign="center" align="center" renderer="renderMonth">填报月份</div>
						<div field="taskStatus" width="50" headerAlign="center" align="center" renderer="setTaskBackColor">完成状态</div>
						<div field="riskStatus" width="60" headerAlign="center" align="center" renderer="setRiskBackColor">是否存在风险</div>
						<div field="appStatus" width="60" headerAlign="center" align="center" renderer="renderTBStatus">审核状态</div>
						<div width="50" headeralign="center" align="center" renderer="renderOperate">操作</div>
					</div>
				</div>
			</div>
		</fieldset>
	</div>

	<script type="text/javascript">
		nui.parse();
		var groupForm = new nui.Form("#groupForm");
		var taskDecGrid = nui.get("taskDecGrid");
		var taskTBHistoryGrid = nui.get("taskTBHistoryGrid");
		var groupId;
		
		setData();
		
		function setData() {
			groupId = "<%=request.getParameter("id")%>";
			var json = nui.encode({
				"id" : groupId
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
				"url" : "com.zhonghe.ame.keyTask.group.queryGroupTaskById.biz.ext",
				data : json,
				success : function(result) {
					groupForm.setData(result.mainData);
					$("#zrdwSpan").text(result.mainData.secondaryOrgname);
					$("#zrdwjzSpan").text(result.mainData.secondaryOrgname);
				}
			});
			var taskJson = nui.encode({
				'id' : groupId
			});
			ajaxCommon({
				url : "com.zhonghe.ame.keyTask.group.getGroupTaskItem.biz.ext",
				data : taskJson,
				success : function(res) {
					taskDecGrid.setData(res.itemList);
				}
			});
			ajaxCommon({
				url : "com.zhonghe.ame.keyTask.group.getGroupTaskItemProgress.biz.ext",
				data : taskJson,
				success : function(res) {
					taskTBHistoryGrid.setData(res.itemList);
				}
			});			
		}

		function renderMonth(e) {
			if (e.value != null && e.value != "") {
				return e.value + "月";
			}
		}
		
		function renderTBStatus(e) {
			var row = e.record;
			if (row.appStatus == null) {
				return '待审核';
			} else {
				return '<a href="javascript:void(0)" onclick="flowView(\'' + row.processId + '\')">' + nui.getDictText('ZH_FLOW_TYPE', e.value) + '</a>';
			}
		}
		
		function renderOperate(e) {
			var row = e.record;
			return '<a href="javascript:void(0)" onclick="progressDetails(\'' + row.id + '\')">详情</a>';
		}
		
		function progressDetails(id) {
			nui.open({
				url : "/default/keyTask/group/GroupTaskItemProgressView.jsp",
				title : "任务 - 进展情况 - 详情",
				width : "1000",
				height : "600",
				allowResize : false,
				onload : function() {
					var iframe = this.getIFrameEl();
					iframe.contentWindow.initData(id);
				}
			});
		}

		function setTaskBackColor(e) {
			if (e.value == "已完成") {
				e.cellStyle = "background-color: #f6ffed";
			} else if (e.value == "未完成") {
				e.cellStyle = "background-color: #ffffb8";
			}
			return e.value;
		}
		
		function setRiskBackColor(e) {
			if (e.value == "无风险") {
				e.cellStyle = "background-color: #f6ffed";
			} else if (e.value == "低风险") {
				e.cellStyle = "background-color: #ffffb8";
			} else if (e.value == "高风险") {
				e.cellStyle = "background-color: #ffccc7";
			}
			return e.value;
		}								
		
		function flowView(processId) {
			var url = "/default/bps/wfclient/task/processinstView.jsp";
			var title = "流程图查看";
			var width = 1000;
			nui.open({
				url : url,
				title : title,
				width : "1200",
				height : "770",
				allowResize : false,
				onload : function() {
					var iframe = this.getIFrameEl();
					if (iframe.contentWindow.initData) {
						iframe.contentWindow.initData({
							"processInstID" : processId
						});
					}
				}
			});
		}		
		
	</script>

</body>
</html>