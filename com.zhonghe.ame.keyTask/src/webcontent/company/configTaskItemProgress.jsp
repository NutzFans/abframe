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
<title>填报 - 任务进展</title>
</head>
<body>
	<div class="nui-fit" style="padding: 5px;">
		<fieldset id="field1" style="border: solid 1px #aaa; padding: 5px;">
			<legend>基本信息</legend>
			<div style="width: 99%">
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
		<fieldset id="field2" style="border: solid 1px #aaa; padding: 5px;">
			<legend>填报 - 任务进展</legend>
			<div style="width: 99%; margin: 0 auto;">
				<div id="itemGrid" class="nui-datagrid" style="width: 100%; height: 650px;" showPager="false" url="com.zhonghe.ame.keyTask.company.queryItemListByMainId.biz.ext" dataField="itemDatas"
					allowCellSelect="true" enableHotTrack="false" allowRowSelect="false" allowCellWrap="true">
					<div property="columns">
						<div field="actionPlanNumber" name="actionPlanNumber" width="200" align="center" headerAlign="center">任务名称</div>
						<div field="taskName" name="taskName" width="250" align="center" headerAlign="center">行动计划</div>
						<div field="annualTarget" name="annualTarget" width="300" align="left" headerAlign="center">衡量标准</div>
						<div field="taskMonth" width="50" headeralign="center" align="center" renderer="renderMonth">时间节点</div>
						<div field="taskPlanName" width="400" headeralign="center" align="left">分解计划</div>
						<div field="responsiblePerson" width="100" headeralign="center" align="left">责任人</div>
						<div field="taskStatus" width="50" headeralign="center" align="center" renderer="setTaskBackColor">任务状态</div>
						<div field="riskStatus" width="70" headeralign="center" align="center" renderer="setRiskBackColor">是否存在风险</div>
						<div width="40" headeralign="center" align="center" renderer="renderOperate">操作</div>
						<div field="appStatus" width="50" headeralign="center" align="center" renderer="renderTBStatus">填报状态</div>
					</div>
				</div>
			</div>
		</fieldset>
	</div>

	<div style="text-align: center; padding: 5px; margin-bottom: 1px" class="nui-toolbar">
		<a id="closeBtn" class="nui-button" onclick="closeCancel()" style="width: 60px; margin-right: 20px;" iconCls="icon-close">关闭</a>
	</div>

	<script type="text/javascript">
		nui.parse();
		var companyForm = new nui.Form("#companyForm");
		var itemGrid = nui.get("itemGrid");
		var companyId;

		itemGrid.on("load", function() {
			itemGrid.mergeColumns([ "checkcolumn", "actionPlanNumber", "taskName", "annualTarget" ]);
		});

		function initData(data) {
			companyForm.setData(data);
			companyId = data.id;
			itemGrid.load({
				'mainId' : companyId
			});
		}

		function renderMonth(e) {
			if (e.value != null && e.value != "") {
				return e.value + "月";
			}
		}

		function renderOperate(e) {
			var row = e.record;
			if (row.appStatus != null && row.appStatus != "") {
				return '<a href="javascript:void(0)" onclick="progressDetails(\'' + row.id + '\')">详情</a>';
			} else {
				return '<a href="javascript:void(0)" onclick="operationTianBao(\'' + row.id + '\')">填报</a>';
			}
		}
		
		function progressDetails(id){
			nui.open({
				url : "/default/keyTask/company/taskItemProgressView.jsp",
				title : "任务 - 进展情况 - 详情",
				width : "1200",
				height : "770",
				allowResize : false,
				onload : function() {
					var iframe = this.getIFrameEl();
					iframe.contentWindow.initData(id);
				}
			});
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

		function operationTianBao(id) {
			nui.open({
				url : "/default/keyTask/company/fillingItemProgress.jsp",
				title : "任务 - 进展情况 - 填报",
				width : "1200",
				height : "770",
				allowResize : false,
				onload : function() {
					var iframe = this.getIFrameEl();
					iframe.contentWindow.initData(id,false);
				},
				ondestroy : function(action) {
					itemGrid.load({
						'mainId' : companyId
					});
				}
			});
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
		
		function setTaskBackColor(e) {
			if (e.value == "已完成") {
				e.cellStyle = "background-color: #f6ffed";
			} else if (e.value == "未完成") {
				e.cellStyle = "background-color: #ffffb8";
			}
			return e.value;
		}		
		
	</script>

</body>
</html>