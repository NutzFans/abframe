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
					<table style="table-layout: fixed;">
						<tr>
							<td align="right" style="width: 100px">任务年份：</td>
							<td>
								<input id="taskYear" name="taskYear" class="nui-textbox" style="width: 100px" readonly="readonly" />
							</td>
							<td align="right" style="width: 100px">任务责任单位：</td>
							<td>
								<input id="secondaryOrgname" name="secondaryOrgname" class="nui-textbox" style="width: 200px" readonly="readonly" />
							</td>
						</tr>
					</table>
				</form>
			</div>
		</fieldset>
		<p>
		<div id="itemGrid" class="nui-datagrid" style="width: 100%; height: 92%;" showPager="false" url="com.zhonghe.ame.keyTask.group.queryGroupJdtjDetails.biz.ext" dataField="itemDatas"
			allowCellSelect="true" enableHotTrack="false" allowRowSelect="false" allowCellWrap="true">
			<div property="columns">
				<div field="task_domain" name="taskDomain" width="70" align="center" headerAlign="center">领域</div>
				<div field="task_name" name="taskName" width="250" align="center" headerAlign="center">任务名称</div>
				<div field="action_plan" name="actionPlan" width="250" align="center" headerAlign="center">行动计划</div>
				<div field="measure_standard" name="measureStandard" width="300" align="left" headerAlign="center">衡量标准</div>
				<div field="fill_month" width="50" headeralign="center" align="center" renderer="renderMonth">填报月份</div>
				<div field="task_status" width="50" headeralign="center" align="center" renderer="setTaskBackColor">任务状态</div>
				<div field="risk_status" width="70" headeralign="center" align="center" renderer="setRiskBackColor">是否存在风险</div>
				<div width="40" headeralign="center" align="center" renderer="renderOperate">操作</div>
				<div field="app_status" width="50" headeralign="center" align="center" renderer="renderTBStatus">填报状态</div>
			</div>
		</div>		
	</div>

	<script type="text/javascript">
		nui.parse();
		var groupForm = new nui.Form("#groupForm");
		var itemGrid = nui.get("itemGrid");
		var secOrgCode, taskYear, taskMonth, type, secOrgName;
		
		itemGrid.on("load", function() {
			itemGrid.mergeColumns(["taskDomain", "taskName", "actionPlan", "measureStandard" ]);
		});			
		
		setData();
		
		function setData() {
			secOrgCode = "<%=request.getParameter("secOrgCode")%>";
			secOrgName = "<%=request.getParameter("secOrgName")%>";
			taskYear = "<%=request.getParameter("taskYear")%>";
			taskMonth = "<%=request.getParameter("taskMonth")%>";
			type = "<%=request.getParameter("type")%>";

			nui.get("taskYear").setValue(taskYear);
			nui.get("secondaryOrgname").setValue(secOrgName);
			
			itemGrid.load({
				'secOrgCode' : secOrgCode,
				'taskYear' : taskYear,
				'taskMonth' : taskMonth,
				'type' : type
			});			
		}
		
		function renderMonth(e) {
			if (e.value != null && e.value != "") {
				return e.value + "月";
			}
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
		
		function renderOperate(e) {
			var row = e.record;
			if (row.task_status != null && row.task_status != "") {
				return '<a href="javascript:void(0)" onclick="progressDetails(\'' + row.id + '\',\'' + row.main_id + '\')">详情</a>';
			} else {
				return '';
			}
		}
		
		function progressDetails(id,mainId) {
			nui.open({
				url : "/default/keyTask/group/GroupTaskItemApprovalView.jsp",
				title : "任务 - 进展情况 - 详情",
				width : "1200",
				height : "800",
				allowResize : false,
				onload : function() {
					var iframe = this.getIFrameEl();
					iframe.contentWindow.initData(id,mainId);
				}
			});
		}		
		
		function renderTBStatus(e) {
			var row = e.record;
			if (row.task_status == null) {
				return '未填报';
			} else {
				if (row.app_status == null) {
					return '待审核';
				} else {
					return '<a href="javascript:void(0)" onclick="flowView(\'' + row.process_id + '\')">' + nui.getDictText('ZH_FLOW_TYPE', e.value) + '</a>';
				}
			}
		}

		function flowView(processId) {
			var url = "/default/bps/wfclient/task/processinstView.jsp";
			var title = "流程图查看";
			var width = 1000;
			nui.open({
				url : url,
				title : title,
				width : "1200",
				height : "800",
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