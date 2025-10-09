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
<title>任务详情</title>
</head>
<body>
	<div class="nui-fit" style="padding: 5px;">
		<fieldset id="field1" style="border: solid 1px #aaa; padding: 5px;">
			<legend>基本信息</legend>
			<div>
				<form id="companyForm" method="post">
					<input name="id" class="nui-hidden" />
					<table style="table-layout: fixed;">
						<tr>
							<td align="right" style="width: 100px">任务年份：</td>
							<td>
								<input name="taskYear" class="nui-textbox" style="width: 100px" readonly="readonly" />
							</td>
							<td align="right" style="width: 100px">任务责任单位：</td>
							<td>
								<input name="secondaryOrg" class="nui-hidden" />
								<input name="secondaryOrgname" class="nui-textbox" style="width: 200px" readonly="readonly" />
							</td>
						</tr>
					</table>
				</form>
			</div>
		</fieldset>
		<p>
		<div id="itemGrid" class="nui-datagrid" style="width: 100%; height: 93%;" showPager="false" url="com.zhonghe.ame.keyTask.company.queryItemListByMainId.biz.ext" dataField="itemDatas"
			allowCellSelect="true" enableHotTrack="false" allowRowSelect="false" allowCellWrap="true" frozenStartColumn="0" frozenEndColumn="2">
			<div property="columns">
				<div field="actionPlanNumber" name="actionPlanNumber" width="200" align="center" headerAlign="center">行动计划编号</div>
				<div field="taskName" name="taskName" width="250" align="center" headerAlign="center">任务名称</div>
				<div field="annualTarget" name="annualTarget" width="300" align="left" headerAlign="center">年度目标</div>
				<div field="taskMonth" width="50" headeralign="center" align="center" renderer="renderMonth">时间节点</div>
				<div field="taskStatus" width="50" headeralign="center" align="center">任务状态</div>
				<div field="riskStatus" width="70" headeralign="center" align="center">是否存在风险</div>
				<div width="40" headeralign="center" align="center" renderer="renderOperate">操作</div>
				<div field="appStatus" width="50" headeralign="center" align="center" renderer="renderTBStatus">填报状态</div>
				<div field="taskPlanName" width="500" headeralign="center" align="left">分解计划</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		nui.parse();
		var companyForm = new nui.Form("#companyForm");
		var itemGrid = nui.get("itemGrid");
		var companyId;
		
		itemGrid.on("load", function() {
			itemGrid.mergeColumns([ "checkcolumn", "actionPlanNumber", "taskName", "annualTarget" ]);
		});		

		setData();

		function setData() {
			companyId = "<%=request.getParameter("id")%>";
			var json = nui.encode({
				"id" : companyId
			});
			ajaxCommon({
				"url" : "com.zhonghe.ame.keyTask.company.queryCompanyTaskById.biz.ext",
				data : json,
				success : function(result) {
					companyForm.setData(result.mainData);
				}
			});
			itemGrid.load({
				'mainId' : companyId
			});
		}

		function renderMonth(e) {
			if (e.value != null && e.value != "") {
				return e.value + "月";
			}
		}

		function renderTBStatus(e) {
			var row = e.record;
			if (row.taskStatus == null) {
				return '未填报';
			} else {
				if (row.appStatus == null) {
					return '待审核';
				} else {
					return '<a href="javascript:void(0)" onclick="flowView(\'' + row.processId + '\')">' + nui.getDictText('ZH_FLOW_TYPE', e.value) + '</a>';
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

		function renderOperate(e) {
			var row = e.record;
			if (row.taskStatus != null && row.taskStatus != "") {
				return '<a href="javascript:void(0)" onclick="progressDetails(\'' + row.id + '\')">详情</a>';
			} else {
				return '';
			}
		}

		function progressDetails(id) {
			nui.open({
				url : "/default/keyTask/company/taskItemProgressView.jsp",
				title : "任务 - 进展情况 - 详情",
				width : "1200",
				height : "800",
				allowResize : false,
				onload : function() {
					var iframe = this.getIFrameEl();
					iframe.contentWindow.initData(id);
				}
			});
		}
	</script>

</body>
</html>