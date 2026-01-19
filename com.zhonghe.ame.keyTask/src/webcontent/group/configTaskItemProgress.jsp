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
<title>填报 - 任务进展(每月)</title>
</head>
<body>
	<div class="nui-fit" style="padding: 5px;">
		<fieldset id="field1" style="border: solid 1px #aaa; padding: 5px;">
			<legend>
				任务分解计划 -
				<span id="zrdwSpan" style="color: red"></span>
			</legend>
			<div style="padding: 5px;">
				<div id="taskDecGrid" class="nui-datagrid" style="width: 98%; height: auto;" showPager="false" allowCellWrap="true">
					<div property="columns">
						<div field="taskMonth" width="50" headerAlign="center" align="center" renderer="renderMonth">时间节点</div>
						<div field="taskPlanName" width="800" headerAlign="center" align="left">分解计划</div>
						<div field="responsiblePerson" width="100" headerAlign="center" align="left">责任人</div>
					</div>
				</div>
			</div>
		</fieldset>
		<p>
		<fieldset id="field2" style="border: solid 1px #aaa; padding: 5px;">
			<legend>任务 - 进展情况</legend>
			<div style="width: 99%">
				<form id=tianBaoForm " method="post">
					<input name="files" id="fileids" class="nui-hidden" />
					<table style="table-layout: fixed;">
						<tr>
							<td align="right" style="width: 100px">填报月份：</td>
							<td>
								<input id="fillMonth" name="fillMonth" class="nui-combobox" style="width: 100px" required="true" />
								<div style="display: inline-table; padding: 1px; margin-left: 10px">完成状态：</div>
								<input id="taskStatus" name="taskStatus" class="nui-combobox" style="width: 100px" required="true" />
								<div style="display: inline-table; padding: 1px; margin-left: 10px">风险状态：</div>
								<input id="riskStatus" name="riskStatus" class="nui-combobox" style="width: 100px" required="true" onvaluechanged="riskStatusChange" />
								<div style="display: inline-block; color: red;">（指整个任务可能存在的风险，并非该分解计划的风险）</div>
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 100px">进展情况：</td>
							<td>
								<input name="taskProgress" class="nui-textarea" style="width: 1020px; height: 65px" required="true" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 110px">截至本月完成情况：</td>
							<td>
								<input name="taskMonthComple" class="nui-textarea" style="width: 1020px; height: 65px" required="true" />
							</td>
						</tr>						
						<tr id="riskMeasuresTr">
							<td align="right" style="width: 100px">风险及措施：</td>
							<td>
								<input id="riskMeasures" name="riskMeasures" class="nui-textarea" style="width: 1020px; height: 65px" />
							</td>
						</tr>
					</table>
				</form>
			</div>
		</fieldset>
		<p>
		<fieldset id="field3" style="border: solid 1px #aaa; padding: 5px;">
			<legend>上传相关支撑材料</legend>
			<div style="width: 98%">
				<jsp:include page="/ame_common/inputFile.jsp"/>
			</div>
		</fieldset>
		<p>
		<fieldset id="field4" style="border: solid 1px #aaa; padding: 5px;">
			<legend>
				历史填报记录
				</span>
			</legend>
			<div style="padding: 5px;">
				<div id="taskTBHistoryGrid" class="nui-datagrid" style="width: 100%; height: auto;" showPager="false" allowCellWrap="true">
					<div property="columns">
						<div field="fillMonth" width="50" headerAlign="center" align="center" renderer="renderMonth">填报月份</div>
						<div field="taskStatus" width="50" headerAlign="center" align="center" renderer="setTaskBackColor">完成状态</div>
						<div field="riskStatus" width="60" headerAlign="center" align="center" renderer="setRiskBackColor">是否存在风险</div>
						<div field="appStatus" width="60" headerAlign="center" align="center" renderer="renderTBStatus">审核状态</div>
						<div width="50" headeralign="center" align="center" renderer="renderOperate">操作</div>
					</div>
				</div>
			</div>
		</fieldset>
	</div>

	<div style="text-align: center; padding-top: 5px; padding-bottom: 10px; margin-bottom: 1px" class="nui-toolbar">
		<a id="saveBtn" class="nui-button" onclick="save()" style="width: 60px; margin-right: 20px;" iconCls="icon-save">保存</a>
		<a id="closeBtn" class="nui-button" onclick="closeCancel()" style="width: 60px;" iconCls="icon-close">关闭</a>
	</div>

	<script type="text/javascript">
		nui.parse();
		var tianBaoForm = new nui.Form("#tianBaoForm");
		var taskDecGrid = nui.get("taskDecGrid");
		var taskTBHistoryGrid = nui.get("taskTBHistoryGrid");
		var mainId;

		function initData(data) {
			mainId = data.id;
			$("#zrdwSpan").text(data.secondaryOrgname);
			nui.get("fillMonth").setData(monthDict);
			nui.get("taskStatus").setData(taskStatusDict);
			nui.get("riskStatus").setData(riskStatusDict);
			var json = nui.encode({
				'id' : mainId
			});
			ajaxCommon({
				url : "com.zhonghe.ame.keyTask.group.getGroupTaskItem.biz.ext",
				data : json,
				success : function(res) {
					taskDecGrid.setData(res.itemList);
				}
			});
			ajaxCommon({
				url : "com.zhonghe.ame.keyTask.group.getGroupTaskItemProgress.biz.ext",
				data : json,
				success : function(res) {
					taskTBHistoryGrid.setData(res.itemList);
				}
			});
		}

		function save() {
			if (!tianBaoForm.validate()) {
				showTips("请检查表单的完整性!", "danger");
				return;
			}
			var json = nui.encode({
				'id' : mainId,
				'fillMonth' : tianBaoForm.getData().fillMonth
			});
			ajaxCommon({
				url : "com.zhonghe.ame.keyTask.group.validateTaskItemProgress.biz.ext",
				data : json,
				success : function(res) {
					if (res.bool) {
						document.getElementById("fileCatalog").value = "groupTaskItem";
						nui.get("saveBtn").disable();
						nui.mask({
							el : document.body,
							cls : 'mini-mask-loading',
							html : '表单提交中...'
						});
						form2.submit();
					} else {
						showTips("当前选择填报的月份，已经填报过数据了！", "danger");
						return;
					}
				}
			});
		}

		function SaveData() {
			var formData = tianBaoForm.getData();
			formData.files = nui.get("fileids").getValue();
			formData.mainId = mainId;
			var json = nui.encode({
				"taskItem" : formData
			});
			ajaxCommon({
				"url" : "com.zhonghe.ame.keyTask.group.fillingGroupItemProgress.biz.ext",
				data : json,
				contentType : 'text/json',
				success : function(text) {
					nui.unmask(document.body);
					if (text.result == "1") {
						showTips("操作成功");
						closeOk();
					} else {
						nui.get("saveBtn").enable();
						showTips("操作失败!", "danger");
					}
				}
			});
		}

		function riskStatusChange() {
			var riskStatus = nui.get("riskStatus").getValue();
			if (riskStatus == "无风险") {
				nui.get("riskMeasures").setRequired(false);
			} else {
				nui.get("riskMeasures").setRequired(true);
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

		var taskStatusDict = [ {
			id : "/",
			text : '/'
		}, {
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

		function renderTBStatus(e) {
			var row = e.record;
			if (row.appStatus == null) {
				return '待审核';
			} else {
				return '<a href="javascript:void(0)" onclick="flowView(\'' + row.processId + '\')">' + nui.getDictText('ZH_FLOW_TYPE', e.value) + '</a>';
			}
		}

		function renderOperate(e) {
			var row = e.record;
			if (row.appStatus != null && row.appStatus != "") {
				return '<a href="javascript:void(0)" onclick="progressDetails(\'' + row.id + '\')">详情</a>';
			} else {
				return '<a href="javascript:void(0)" onclick="operationTianBao(\'' + row.id + '\')">修改</a>';
			}
		}

		function operationTianBao(id) {
			nui.open({
				url : "/default/keyTask/group/editTaskItemProgress.jsp",
				title : "任务 - 进展情况 - 修改",
				width : "1000",
				height : "600",
				allowResize : false,
				onload : function() {
					var iframe = this.getIFrameEl();
					iframe.contentWindow.initData(id);
				},
				ondestroy : function(action) {
					var json = nui.encode({
						'id' : mainId
					});
					ajaxCommon({
						url : "com.zhonghe.ame.keyTask.group.getGroupTaskItemProgress.biz.ext",
						data : json,
						success : function(res) {
							taskTBHistoryGrid.setData(res.itemList);
						}
					});										
				}				
			});
		}

		function progressDetails(id) {
			nui.open({
				url : "/default/keyTask/group/GroupTaskItemProgressView.jsp",
				title : "任务 - 进展情况 - 详情",
				width : "1000",
				height : "600",
				allowResize : false,
				onload : function() {
					var iframe = this.getIFrameEl();
					iframe.contentWindow.initData(id);
				}
			});
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
		
	</script>
</body>
</html>