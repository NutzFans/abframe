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
<title>任务申报流程 - 草稿页面</title>
</head>
<body>
	<%
		long workItemId = (Long) request.getAttribute("workItemID");
	%>
	<div class="nui-fit" style="padding: 5px;">
		<fieldset id="field1" style="border: solid 1px #aaa; padding: 5px;">
			<legend>任务 - 基本信息</legend>
			<div style="width: 99%">
				<form id="companyForm" method="post">
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
			<legend>设置 - 任务及分解计划</legend>
			<div style="width: 99%; margin: 0 auto;">
				<div class="nui-toolbar" style="border-bottom: 0; padding: 0px;">
					<table>
						<tr>
							<td>
								<a class="nui-button" iconCls="icon-add" onclick="addItem()">新增</a>
								<a class="nui-button" iconCls="icon-edit" onclick="editItem()">编辑</a>
								<a class="nui-button" iconCls="icon-remove" onclick="removeItem()">删除</a>
							</td>
						</tr>
					</table>
				</div>
				<div id="itemGrid" class="nui-datagrid" style="width: 100%; height: 650px;" showPager="false" url="com.zhonghe.ame.keyTask.company.queryItemListByMainId.biz.ext" dataField="itemDatas"
					allowCellSelect="true" enableHotTrack="false" allowRowSelect="false" allowCellWrap="true">
					<div property="columns">
						<div field="taskSource" name="taskSource" width="100" align="center" headerAlign="center">任务来源</div>
						<div field="actionPlanNumber" name="actionPlanNumber" width="150" align="center" headerAlign="center">任务名称</div>
						<div field="taskNum" name="taskNum" width="60" align="center" headerAlign="center">行动编号</div>
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
			<jsp:include page="/ame_common/misOpinion.jsp" />
	</div>

	<div style="text-align: center; padding: 5px; margin-bottom: 1px" class="nui-toolbar">
		<a id="okBtn" class="nui-button" onclick="save(1)" style="width: 60px; margin-right: 20px;" iconCls="icon-ok">提交</a>
		<a id="zzFeame" class="nui-button" onclick="save(2)" style="width: 60px; margin-right: 20px;" iconCls="icon-split">终止</a>
		<a id="closeBtn" class="nui-button" onclick="closeCancel()" style="width: 60px;" iconCls="icon-close">关闭</a>
	</div>

	<script type="text/javascript">
		nui.parse();
		var workItemId = <%=workItemId%>;
		var companyForm = new nui.Form("#companyForm");
		var itemGrid = nui.get("itemGrid");
		var opioionForm = new nui.Form("opioionform");
		var opioionGrid = nui.get("datagrid1");
		var companyId, saveType, confirmInfo;

		itemGrid.on("load", function() {
			itemGrid.mergeColumns(["taskSource", "actionPlanNumber", "taskNum", "taskName", "annualTarget" ]);
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
					companyId = result.mainData.id;
					var workItemInfo = result.workItemInfo;
					companyForm.setData(result.mainData);
					//设置审核意见基本信息
					nui.get("processinstid").setValue(workItemInfo.processInstID);
					nui.get("processinstname").setValue(workItemInfo.processInstName);
					nui.get("activitydefid").setValue(workItemInfo.activityDefID);
					nui.get("workitemname").setValue(workItemInfo.workItemName);
					nui.get("workitemid").setValue(workItemId);
					nui.get("isshow").setValue("1");
					nui.get("auditstatus").setValue(4);
					document.getElementById("salesEdit").style.display = "none";
					nui.get("auditopinion").setValue("");
					//查询审核意见
					if (workItemInfo.processInstID != null || workItemInfo.processInstID != "") {
						opioionGrid.load({
							"processInstID" : workItemInfo.processInstID
						});
						opioionGrid.sortBy("time", "desc");
					}
					itemGrid.load({
						'mainId' : result.mainData.id
					});
				}
			});
		}

		function addItem() {
			nui.open({
				url : "/default/keyTask/company/addItem.jsp",
				width : "1200px",
				height : "800px",
				allowResize : false,
				title : "新增 - 任务及分解计划",
				onload : function() {
					var iframe = this.getIFrameEl();
					iframe.contentWindow.initData(companyId);
				},
				ondestroy : function(action) {
					itemGrid.load({
						'mainId' : companyId
					});
				}
			});
		}

		function editItem() {
			var cellData = itemGrid.getCurrentCell();
			if (cellData == null) {
				showTips("请先选中你要进行编辑的【行动计划】！", "danger");
				return;
			} else if (cellData[1].field != "taskName") {
				showTips("请选中你要进行编辑的【行动计划】单元格！", "danger");
				return;
			}
			nui.open({
				url : "/default/keyTask/company/editItem.jsp",
				width : "1200px",
				height : "800px",
				allowResize : false,
				title : "编辑 - 任务及分解计划",
				onload : function() {
					var iframe = this.getIFrameEl();
					iframe.contentWindow.initData(cellData[0]);
				},
				ondestroy : function(action) {
					itemGrid.load({
						'mainId' : companyId
					});
				}
			});
		}

		function removeItem() {
			var cellData = itemGrid.getCurrentCell();
			if (cellData == null) {
				showTips("请先选中你要进行删除的【行动计划】！", "danger");
				return;
			} else if (cellData[1].field != "taskName") {
				showTips("请选中你要进行编辑的【行动计划】单元格！", "danger");
				return;
			}
			if (!confirm("是否删除？")) {
				return;
			} else {
				var json = nui.encode({
					"mainId" : cellData[0].mainId,
					"taskName" : cellData[0].taskName
				});
				ajaxCommon({
					url : "com.zhonghe.ame.keyTask.company.deleteItem.biz.ext",
					data : json,
					success : function(text) {
						if (text.result == "1") {
							showTips("操作成功");
							itemGrid.load({
								'mainId' : companyId
							});
						} else {
							showTips("删除失败，请联系信息技术部人员！", "danger");
						}
					}
				});
			}
		}

		function renderMonth(e) {
			if (e.value != null && e.value != "") {
				return e.value + "月";
			}
		}

		function save(e) {
			saveType = e;
			nui.get("auditstatus").setValue("4");
			if (saveType == 1) {
				if (itemGrid.getData().length == 0) {
					showTips("需要填写设置 - 任务及分解计划，请检查!", "danger");
					return;
				}
				confirmInfo = "提交流程表单？";
			} else {
				nui.get("auditstatus").setValue("2");
				confirmInfo = "终止流程表单？";
			}
			nui.confirm("确定" + confirmInfo, "系统提示", function(action) {
				if (action == "ok") {
					nui.get("okBtn").disable();
					nui.get("zzFeame").disable();
					nui.mask({
						el : document.body,
						cls : 'mini-mask-loading',
						html : '表单提交中...'
					});
					var formData = companyForm.getData();
					formData.saveType = saveType;
					var opioionData = opioionForm.getData();
					var json = nui.encode({
						"keyTask" : formData,
						"misOpinion" : opioionData.misOpinion
					});
					ajaxCommon({
						"url" : "com.zhonghe.ame.keyTask.company.flowTaskDeclareEdit.biz.ext",
						data : json,
						contentType : 'text/json',
						success : function(text) {
							nui.unmask(document.body);
							if (text.result == "1") {
								showTips("操作成功");
								closeOk();
							} else {
								nui.get("okBtn").enable();
								nui.get("zzFeame").enable();
							}
						}
					});
				}
			});
		}
	</script>

</body>
</html>