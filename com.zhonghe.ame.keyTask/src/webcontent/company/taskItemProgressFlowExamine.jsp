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

.mini-grid-cell-nowrap {
	white-space: nowrap;
}
</style>
<head>
<title>任务进度流程 - 审核页面</title>
</head>
<body>
	<%
		long workItemId = (Long) request.getAttribute("workItemID");
	%>
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
						<div field="taskName" name="taskName" width="250" align="center" headerAlign="center">任务名称</div>
						<div field="taskMonth" width="50" headeralign="center" align="center" renderer="renderMonth">时间节点</div>
						<div field="taskPlanName" width="500" headeralign="center" align="left">分解计划</div>
						<div field="taskStatus" width="50" headeralign="center" align="center" renderer="renderTaskStatus">任务状态</div>
						<div field="riskStatus" width="70" headeralign="center" align="center">是否存在风险</div>
						<div width="40" headeralign="center" align="center" renderer="renderOperate">操作</div>
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
		var workItemId = <%=workItemId%>;
		var companyForm = new nui.Form("#companyForm");
		var itemGrid = nui.get("itemGrid");
		var opioionForm = new nui.Form("opioionform");
		var opioionGrid = nui.get("datagrid1");
		var countersignUsers, titleText;
		
		init();
		
		function init() {
			var data = {
				"workItemId" : workItemId
			};
			var json = nui.encode(data);
			ajaxCommon({
				url : "com.zhonghe.ame.keyTask.company.queryItemListById.biz.ext",
				data : json,
				success : function(result) {
					companyForm.setData(result.mainData);
					itemGrid.setData(result.itemDatas);
					nui.get("backTo").setData(result.backList);
					opioionGrid.load({
						processInstID : result.itemDatas[0].processId
					});
					opioionGrid.sortBy("time", "desc");
					initMisOpinion({
						auditstatus : "1"
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
		
		function renderMonth(e) {
			if (e.value != null && e.value != "") {
				return e.value + "月";
			}
		}
		
		function renderTaskStatus(e) {
			var row = e.record;
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
		
		function renderOperate(e) {
			var row = e.record;
			return '<a href="javascript:void(0)" onclick="operationTianBao(\'' + row.id + '\')">修改</a>';
		}

		function operationTianBao(id) {
			nui.open({
				url : "/default/keyTask/company/fillingItemProgress.jsp",
				title : "任务 - 进展情况 - 修改",
				width : "1200",
				height : "800",
				allowResize : false,
				onload : function() {
					var iframe = this.getIFrameEl();
					iframe.contentWindow.initData(id);
				},
				ondestroy : function(action) {
					var data = {
						"workItemId" : workItemId
					};
					var json = nui.encode(data);
					ajaxCommon({
						url : "com.zhonghe.ame.keyTask.company.queryItemListById.biz.ext",
						data : json,
						success : function(result) {
							itemGrid.setData(result.itemDatas);
						}
					});
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
			var taskItemDatas = itemGrid.getData();
			var misOpinion = opioionForm.getData().misOpinion;
			var json = {
				"taskItems" : taskItemDatas,
				"misOpinion" : misOpinion,
				"workItemId" : workItemId,
				"countersignUsers" : countersignUsers
			};
			ajaxCommon({
				url : "com.zhonghe.ame.keyTask.company.flowTaskItemDeclare.biz.ext",
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
		
	</script>

</body>
</html>