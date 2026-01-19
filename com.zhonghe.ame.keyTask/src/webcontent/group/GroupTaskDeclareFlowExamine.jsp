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
<title>任务分解申报流程 - 审核页面</title>
</head>
<body>
	<%
		long workItemId = (Long) request.getAttribute("workItemID");
	%>
	<div class="nui-fit" style="padding: 5px;">
		<fieldset id="field1" style="border: solid 1px #aaa; padding: 5px;">
			<legend>集团任务 - 基本信息</legend>
			<form id="flowForm" method="post">
				<input name="id" class="nui-hidden" />
				<input name="processId" class="nui-hidden" />
				<div style="padding: 5px;">
					<table style="table-layout: fixed;">
						<tr>
							<td align="right" style="width: 90px">任务年份：</td>
							<td>
								<input name="taskYear" class="nui-textbox" style="width: 150px" readonly="readonly" />
							</td>
							<td align="right" style="width: 90px">领域：</td>
							<td>
								<input name="taskDomain" class="nui-textbox" style="width: 500px" readonly="readonly" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 90px">任务名称：</td>
							<td colspan="3">
								<input name="taskName" class="nui-textbox" style="width: 100%" readonly="readonly" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 90px">行动计划：</td>
							<td colspan="3">
								<input name="actionPlan" class="nui-textbox" style="width: 100%" readonly="readonly" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 90px">任务责任单位：</td>
							<td colspan="3">
								<input id="secOrgStrs" class="nui-textbox" style="width: 100%" readonly="readonly" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 90px">衡量标准：</td>
							<td colspan="3">
								<input name="measureStandard" class="nui-textarea" style="width: 100%; height: 100px" readonly="readonly" />
							</td>
						</tr>
					</table>
				</div>
			</form>
		</fieldset>
		<p>
		<fieldset id="field2" style="border: solid 1px #aaa; padding: 5px;">
			<legend>
				任务 - 分解计划 -
				<span id="zrdwSpan" style="color: red"></span>
			</legend>
			<div style="padding: 5px;">
				<div class="nui-toolbar" style="border-bottom: 0; padding: 0px;">
					<table>
						<tr>
							<td>
								<a class="nui-button" iconCls="icon-add" onclick="addRow()">新增</a>
								<a class="nui-button" iconCls="icon-remove" onclick="removeRow()">删除</a>
							</td>
						</tr>
					</table>
				</div>
				<div id="taskDecGrid" class="nui-datagrid" style="width: 99%; height: 250px;" url="com.zhonghe.ame.keyTask.group.getGroupTaskItem.biz.ext" dataField="itemList" showPager="false" multiSelect="true"
					allowCellEdit="true" allowCellSelect="true" allowCellWrap="true">
					<div property="columns">
						<div type="checkcolumn"></div>
						<div field="taskMonth" width="50" headerAlign="center" align="center" vtype="required" renderer="renderMonth">
							时间节点
							<input property="editor" class="nui-combobox" style="width: 100%" required="true" data="monthDict" />
						</div>
						<div field="taskPlanName" width="800" headerAlign="center" align="left" vtype="required">
							分解计划
							<input property="editor" class="nui-textarea" style="width: 100%; height: 65px" required="true" />
						</div>
						<div field="responsiblePerson" width="100" headerAlign="center" align="left" vtype="required">
							责任人
							<input property="editor" class="nui-textbox" style="width: 100%" required="true" />
						</div>
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
		var taskDecGrid = nui.get("taskDecGrid");
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
				url : "com.zhonghe.ame.keyTask.group.queryGroupTaskById.biz.ext",
				data : json,
				success : function(result) {
					$("#zrdwSpan").text(result.mainData.secondaryOrgname);
					var json = nui.encode({
						'id' : result.mainData.id
					});
					ajaxCommon({
						url : "com.zhonghe.ame.keyTask.group.getSecOrgStrsByTask.biz.ext",
						data : json,
						success : function(res) {
							var secOrgStrs = res.result;
							nui.get("secOrgStrs").setValue(secOrgStrs);
							flowForm.setData(result.mainData);
							nui.get("backTo").setData(result.mainData.backList);
							opioionGrid.load({
								processInstID : result.mainData.processId
							});
							opioionGrid.sortBy("time", "desc");
							initMisOpinion({
								auditstatus : "1"
							});
							taskDecGrid.load({
								'id' : result.mainData.id
							});
						}
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
			var gridData = taskDecGrid.getChanges();
			var json = nui.encode({
				"mainId" : formData.id,
				"itemDatas" : gridData
			});
			ajaxCommon({
				"url" : "com.zhonghe.ame.keyTask.group.saveTaskItem.biz.ext",
				data : json,
				contentType : 'text/json',
				success : function(text) {
					if (text.result == "1") {
						var json = {
							"keyTask" : formData,
							"misOpinion" : misOpinion,
							"workItemId" : workItemId,
							"countersignUsers" : countersignUsers
						};
						ajaxCommon({
							url : "com.zhonghe.ame.keyTask.group.flowGroupTaskDeclare.biz.ext",
							data : json,
							contentType : 'text/json',
							success : function(o) {
								nui.unmask(document.body);
								if (o.result == "1") {
									showTips("提交成功");
									CloseWindow("ok");
								}else{
									nui.get("countersign").enable();
									nui.get("creatReimbProcess").enable();
								}
							}
						})
					}else{
						nui.get("countersign").enable();
						nui.get("creatReimbProcess").enable();
					}
				}
			})
		}

		function addRow() {
			var newRow = {
				taskMonth : "",
				taskPlanName : ""
			};
			var index = taskDecGrid.getData().length;
			taskDecGrid.addRow(newRow, index + 1);
			taskDecGrid.beginEditRow(newRow);
		}

		function removeRow() {
			var rows = taskDecGrid.getSelecteds();
			if (rows.length > 0) {
				taskDecGrid.removeRows(rows, false);
			}
		}

		function renderMonth(e) {
			if (e.value != null && e.value != "") {
				return e.value + "月";
			}
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
	</script>

</body>
</html>