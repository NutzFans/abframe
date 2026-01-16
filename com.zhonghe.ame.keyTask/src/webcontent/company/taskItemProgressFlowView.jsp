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
<title>任务进度流程 - 流程查看</title>
</head>
<body>
	<div class="nui-fit" style="padding: 5px;">
		<fieldset id="field1" style="border: solid 1px #aaa; padding: 5px;">
			<legend>基本信息</legend>
			<div style="width: 99%">
				<form id="companyForm" method="post">
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
			<legend style="color: red">审核 - 任务进展（点击任务状态超链接，查看详情）</legend>
			<div style="width: 99%; margin: 0 auto;">
				<div id="itemGrid" class="nui-datagrid" style="width: 100%; height: 550px;" showPager="false" onlyCheckSelection="true">
					<div property="columns">
						<div field="taskName" name="taskName" width="250" align="center" headerAlign="center">行动计划</div>
						<div field="taskMonth" width="50" headeralign="center" align="center" renderer="renderMonth">时间节点</div>
						<div field="taskPlanName" width="500" headeralign="center" align="left">分解计划</div>
						<div field="responsiblePerson" width="100" headeralign="center" align="left">责任人</div>
						<div field="taskStatus" width="50" headeralign="center" align="center" renderer="renderTaskStatus">任务状态</div>
						<div field="riskStatus" width="70" headeralign="center" align="center" renderer="setRiskBackColor">是否存在风险</div>
					</div>
				</div>
			</div>
		</fieldset>
	</div>
	
	<script type="text/javascript">
		nui.parse();
		var processId = <%=request.getParameter("processInstID")%>;
		var companyForm = new nui.Form("#companyForm");
		var itemGrid = nui.get("itemGrid");
		
		init();

		function init() {
			var data = {
				"processId" : processId
			};
			var json = nui.encode(data);
			ajaxCommon({
				url : "com.zhonghe.ame.keyTask.company.queryItemListById.biz.ext",
				data : json,
				success : function(result) {
					companyForm.setData(result.mainData);
					itemGrid.setData(result.itemDatas);
				}
			});
		}
		
		function renderMonth(e) {
			if (e.value != null && e.value != "") {
				return e.value + "月";
			}
		}

		function renderTaskStatus(e) {
			var row = e.record;
			if (e.value == "已完成") {
				e.cellStyle = "background-color: #f6ffed";
			} else if (e.value == "未完成") {
				e.cellStyle = "background-color: #ffffb8";
			}			
			return '<a href="javascript:void(0)" onclick="progressDetails(\'' + row.id + '\')">'+e.value+'</a>';
		}
		
		function progressDetails(id){
			nui.open({
				url : "/default/keyTask/company/taskItemProgressView.jsp",
				title : "任务 - 进展情况 - 填报",
				width : "1200",
				height : "800",
				allowResize : false,
				onload : function() {
					var iframe = this.getIFrameEl();
					iframe.contentWindow.initData(id);
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
		
	</script>
	
</body>
</html>