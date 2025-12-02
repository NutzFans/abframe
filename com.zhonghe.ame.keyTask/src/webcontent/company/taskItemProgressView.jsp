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
<title>详情 - 任务进展</title>
</head>
<body>
	<div class="nui-fit" style="padding: 5px;">
		<fieldset id="field1" style="border: solid 1px #aaa; padding: 5px;">
			<legend>任务 - 分解计划</legend>
			<div style="width: 99%">
				<form id="baseForm" method="post">
					<table style="table-layout: fixed;">
						<tr>
							<td align="right" style="width: 100px">时间节点：</td>
							<td>
								<input id="taskMonth" name="taskMonth" class="nui-combobox" style="width: 100px" readonly="readonly" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 100px">分解计划：</td>
							<td>
								<input name="taskPlanName" class="nui-textarea" style="width: 1020px; height: 65px" readonly="readonly" />
							</td>
						</tr>
					</table>
				</form>
			</div>
		</fieldset>
		<p>
		<fieldset id="field2" style="border: solid 1px #aaa; padding: 5px;">
			<legend>任务 - 进展情况</legend>
			<div style="width: 99%">
				<form id=tianBaoForm " method="post">
					<input name="id" class="nui-hidden" />
					<input name="files" id="fileids" class="nui-hidden" />
					<table style="table-layout: fixed;">
						<tr>
							<td align="right" style="width: 100px">完成状态：</td>
							<td>
								<input id="taskStatus" name="taskStatus" class="nui-combobox" style="width: 100px" readonly="readonly" />
								<div style="display: inline-table; padding: 1px; margin-left: 10px">风险状态：</div>
								<input id="riskStatus" name="riskStatus" class="nui-combobox" style="width: 100px" readonly="readonly" />
								<div style="display: inline-block; color: red;">（指整个任务可能存在的风险，并非该分解计划的风险）</div>
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 100px">进展情况：</td>
							<td>
								<input name="taskProgress" class="nui-textarea" style="width: 1020px; height: 65px" readonly="readonly" />
							</td>
						</tr>
						<tr id="riskMeasuresTr">
							<td align="right" style="width: 100px">风险及措施：</td>
							<td>
								<input id="riskMeasures" name="riskMeasures" class="nui-textarea" style="width: 1020px; height: 65px" readonly="readonly" />
							</td>
						</tr>
					</table>
				</form>
			</div>
		</fieldset>
		<p>
		<fieldset id="field3" style="border: solid 1px #aaa; padding: 5px;">
			<legend>相关支撑材料</legend>
			<jsp:include page="/ame_common/detailFile.jsp">
				<jsp:param name="downloadZip" value="true"/>
			</jsp:include>
		</fieldset>
	</div>

	<div style="text-align: center; padding-top: 5px; padding-bottom: 10px; margin-bottom: 1px" class="nui-toolbar">
		<a id="closeBtn" class="nui-button" onclick="closeCancel()" style="width: 60px;" iconCls="icon-close">关闭</a>
	</div>
	
	<form name="exprotZipFileFlow" id="exprotZipFileFlow" action="com.primeton.eos.ame_common.ameExportZip.flow" method="post">
		<input type="hidden" name="_eosFlowAction" value="action0" filter="false" />
		<input type="hidden" name="downloadFile" filter="false" />
		<input type="hidden" name="fileName" filter="false" />
	</form>	

	<script type="text/javascript">
		nui.parse();
		var baseForm = new nui.Form("#baseForm");
		var tianBaoForm = new nui.Form("#tianBaoForm");
		var itemId;

		function initData(data) {
			nui.get("taskMonth").setData(monthDict);
			nui.get("taskStatus").setData(taskStatusDict);
			nui.get("riskStatus").setData(riskStatusDict);
			var json = nui.encode({
				"id" : data
			});
			ajaxCommon({
				url : "com.zhonghe.ame.keyTask.company.queryItemById.biz.ext",
				data : json,
				success : function(result) {
					var taskItemData = result.taskItem;
					baseForm.setData(taskItemData);
					tianBaoForm.setData(taskItemData);
					itemId = taskItemData.id;
					var grid_0 = nui.get("grid_0");
					grid_0.load({
						"groupid" : "companyTaskItem",
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
		
		function downloadZipFile() {
			if (!confirm("是否确认打包下载？")) {
				return;
			}
			var relationId = itemId;
			var fileCatalog = 'companyTaskItem';
			var json = nui.encode({
				'relationId' : relationId,
				'fileCatalog' : fileCatalog
			});
			nui.ajax({
				url : "com.primeton.eos.ame_common.file_zip.fileZip.biz.ext",
				type : "post",
				data : json,
				cache : false,
				contentType : 'text/json',
				success : function(o) {
					var filePath = o.downloadFile;
					if (filePath != null && filePath != "") {
						var fileName = "重点任务_支撑材料附件.zip";
						var frm = document.getElementById("exprotZipFileFlow");
						frm.elements["downloadFile"].value = filePath;
						frm.elements["fileName"].value = fileName;
						frm.submit();
					}
				}
			})
		}		
		
	</script>
</body>
</html>