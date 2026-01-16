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
<title>任务进度流程 - 审批页面</title>
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
			<legend>审核 - 任务进展</legend>
			<div style="width: 99%; margin: 0 auto;">
				<div id="itemGrid" class="nui-datagrid" style="width: 100%; height: 550px;" showPager="false" onlyCheckSelection="true">
					<div property="columns">
						<div field="taskName" name="taskName" width="250" align="center" headerAlign="center">行动计划</div>
						<div field="taskMonth" width="50" headeralign="center" align="center" renderer="renderMonth">时间节点</div>
						<div field="taskPlanName" width="500" headeralign="center" align="left">分解计划</div>
						<div field="responsiblePerson" width="100" headeralign="center" align="left">责任人</div>
						<div field="taskStatus" width="50" headeralign="center" align="center" renderer="setTaskBackColor">任务状态</div>
						<div field="riskStatus" width="70" headeralign="center" align="center" renderer="setRiskBackColor">是否存在风险</div>
						<div width="40" headeralign="center" align="center" renderer="renderOperate">操作</div>
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
		var saveType, confirmInfo;

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
					var workItemInfo = result.workItemInfo;
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
				}
			});
		}

		function renderMonth(e) {
			if (e.value != null && e.value != "") {
				return e.value + "月";
			}
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

		function save(e) {
			saveType = e;
			if (saveType == 1) {
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
					var taskItemData = itemGrid.getData();
					var opioionData = opioionForm.getData();
					var json = nui.encode({
						"taskItems" : taskItemData,
						"saveType" : saveType,
						"misOpinion" : opioionData.misOpinion
					});
					ajaxCommon({
						"url" : "com.zhonghe.ame.keyTask.company.flowTaskItemDeclareEdit.biz.ext",
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