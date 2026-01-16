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
<title>任务申报流程 - 审批页面</title>
</head>
<body>
	<%
		long workItemId = (Long) request.getAttribute("workItemID");
	%>
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
						<div field="actionPlanNumber" name="actionPlanNumber" width="150" align="center" headerAlign="center">任务名称</div>
						<div field="taskName" name="taskName" width="250" align="center" headerAlign="center">行动计划</div>
						<div field="annualTarget" name="annualTarget" width="300" align="left" headerAlign="center">衡量目标</div>
						<div field="taskMonth" width="50" headeralign="center" align="center" renderer="renderMonth">时间节点</div>
						<div field="taskPlanName" width="450" headeralign="center" align="left">分解计划</div>
						<div field="responsiblePerson" width="100" headeralign="center" align="left">责任人</div>
					</div>
				</div>
			</div>
		</fieldset>
		<p>
			<jsp:include page="/ame_common/misOpinion_Freeflow.jsp" />
	</div>

	<div style="text-align: center; padding: 5px; margin-bottom: 1px" class="nui-toolbar">
		<a class="nui-button" onclick="countersign()" id="countersign" iconCls="icon-user" style="width: 60px; margin-right: 20px;">加签</a>
		<a class="nui-button" onclick="submit()" id="creatReimbProcess" iconCls="icon-ok" style="width: 60px; margin-right: 20px;">提交</a>
		<a class="nui-button" onclick="closeCancel" iconCls="icon-close" style="width: 60px;">关闭</a>
	</div>

	<script type="text/javascript">
		nui.parse();
		var workItemId =<%=workItemId%>;
		var flowForm = new nui.Form("#flowForm");
		var itemGrid = nui.get("itemGrid");
		var opioionForm = new nui.Form("opioionform");
		var opioionGrid = nui.get("datagrid1");
		var countersignUsers, titleText;

		itemGrid.on("load", function() {
			itemGrid.mergeColumns([ "checkcolumn", "actionPlanNumber", "taskName", "annualTarget" ]);
		});

		init();

		function init() {
			var data = {
				"workItemId" : workItemId
			};
			var json = nui.encode(data);
			ajaxCommon({
				url : "com.zhonghe.ame.keyTask.company.queryCompanyTaskById.biz.ext",
				data : json,
				success : function(result) {
					flowForm.setData(result.mainData);
					nui.get("backTo").setData(result.mainData.backList);
					opioionGrid.load({
						processInstID : result.mainData.processId
					});
					opioionGrid.sortBy("time", "desc");
					initMisOpinion({
						auditstatus : "1"
					});
					itemGrid.load({
						'mainId' : result.mainData.id
					});
				}
			});
		}

		function countersign() {
			selectOmEmployee();
		}

		function selectOmEmployee() {
			var btnEdit = this;
			nui.open({
				url: "<%=request.getContextPath()%>/contractPact/selectUsers.jsp",
				title : "加签人员选择",
				width : 430,
				height : 400,
				ondestroy : function(action) {
					console.log(action)
					var user, users = "【";
					countersignUsers = [];
					if (action == "ok") {
						var iframe = this.getIFrameEl();
						var data = iframe.contentWindow.GetData();
						data = nui.clone(data); //必须
						if (data) {
							for (var i = 0; i < data.length; i++) {
								user = {};
								user.id = data[i].userid
								user.name = data[i].empname
								user.typeCode = "person"
								countersignUsers.push(user);
								if (i == 0) {
									users = users + data[i].empname;
								} else {

									users = users + "," + data[i].empname;
								}
							}
							users = users + "】";
							titleText = "增加审批人员" + users + "并提交";
							submitProcess(titleText);
						}
					}

				}
			});
		}
		
		function submit() {
			var auditstatus = nui.get("auditstatus").getValue();
			if (auditstatus == "2") { //终止流程
				titleText = "终止";
			} else if (auditstatus == "0") { //退回流程
				if (!nui.get("backTo").getValue()) {
					showTips("退回环节不能为空！");
					return;
				}
				titleText = "退回";
			} else if (auditstatus == "1") { //提交流程
				titleText = "提交";
			}
			submitProcess(titleText);
		}
		
		function submitProcess(title) {
			nui.confirm("确定" + titleText + "流程吗？", "操作提示", function(action) {
				if (action == "ok") {
					nui.get("countersign").disable();
					nui.get("creatReimbProcess").disable();
					nui.mask({
						el : document.body,
						cls : 'mini-mask-loading',
						html : '表单提交中...'
					});
					saveData();
				}
			});
		}
		
		function saveData() {
			var formData = flowForm.getData();
			var misOpinion = opioionForm.getData().misOpinion;
			var json = {
				"keyTask" : formData,
				"misOpinion" : misOpinion,
				"workItemId" : workItemId,
				"countersignUsers" : countersignUsers
			};
			ajaxCommon({
				url : "com.zhonghe.ame.keyTask.company.flowTaskDeclare.biz.ext",
				data : json,
				contentType : 'text/json',
				success : function(o) {
					nui.unmask(document.body);
					if (o.result == "1") {
						showTips("提交成功");
						CloseWindow("ok");
					} else {
						nui.get("countersign").enable();
						nui.get("creatReimbProcess").enable();
					}
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