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
<title>设置 - 任务分解计划</title>
</head>
<body>
	<div class="nui-fit" style="padding: 5px;">
		<fieldset id="field1" style="border: solid 1px #aaa; padding: 5px;">
			<legend>集团任务 - 基本信息</legend>
			<form id="baseForm" method="post">
				<div style="padding: 5px;">
					<table style="table-layout: fixed;">
						<tr>
							<td align="right" style="width: 90px">任务年份：</td>
							<td>
								<input id="taskYear" class="nui-textbox" style="width: 150px" readonly="readonly" />
							</td>
							<td align="right" style="width: 90px">领域：</td>
							<td>
								<input id="taskDomain" class="nui-textbox" style="width: 500px" readonly="readonly" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 90px">任务名称：</td>
							<td colspan="3">
								<input id="taskName" class="nui-textbox" style="width: 100%" readonly="readonly" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 90px">行动计划：</td>
							<td colspan="3">
								<input id="actionPlan" class="nui-textbox" style="width: 100%" readonly="readonly" />
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
								<input id="measureStandard" class="nui-textarea" style="width: 100%; height: 100px" readonly="readonly" />
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
				<div id="taskDecGrid" class="nui-datagrid" style="width: 100%; height: 300px;" showPager="false" multiSelect="true" allowCellEdit="true" allowCellSelect="true" allowCellWrap="true">
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
	</div>

	<div style="text-align: center; padding: 5px; margin-bottom: 1px" class="nui-toolbar">
		<a id="saveBtn" class="nui-button" onclick="save()" style="width: 60px; margin-right: 20px;" iconCls="icon-save">保存</a>
		<a id="closeBtn" class="nui-button" onclick="closeCancel()" style="width: 60px;" iconCls="icon-close">关闭</a>
	</div>

	<script type="text/javascript">
		nui.parse();
		var baseForm = new nui.Form("#baseForm");
		var taskDecGrid = nui.get("taskDecGrid");
		var mainId;

		function initData(data) {
			mainId = data.id;
			$("#zrdwSpan").text(data.secondaryOrgname);
			var json = nui.encode({
				'id' : mainId
			});
			ajaxCommon({
				url : "com.zhonghe.ame.keyTask.group.getSecOrgStrsByTask.biz.ext",
				data : json,
				success : function(res) {
					var secOrgStrs = res.result;
					nui.get("taskYear").setValue(data.taskYear);
					nui.get("taskDomain").setValue(data.taskDomain);
					nui.get("taskName").setValue(data.taskName);
					nui.get("actionPlan").setValue(data.actionPlan);
					nui.get("secOrgStrs").setValue(secOrgStrs);
					nui.get("measureStandard").setValue(data.measureStandard);
				}
			});
			ajaxCommon({
				url : "com.zhonghe.ame.keyTask.group.getGroupTaskItem.biz.ext",
				data : json,
				success : function(res) {
					taskDecGrid.setData(res.itemList);
				}
			});
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

		function save() {
			if (taskDecGrid.getData().length == 0) {
				showTips("需要填写任务 - 分解计划数据，请检查!", "danger");
				return;
			}
			taskDecGrid.validate();
			if (taskDecGrid.isValid() == false) {
				var error = taskDecGrid.getCellErrors()[0];
				taskDecGrid.beginEditCell(error.record, error.column);
				showTips("任务 - 分解计划数据有错误，请检查!", "danger");
				return;
			}
			nui.get("saveBtn").disable();
			nui.mask({
				el : document.body,
				cls : 'mini-mask-loading',
				html : '表单提交中...'
			});
			var gridData = taskDecGrid.getChanges();
			var json = nui.encode({
				"mainId" : mainId,
				"itemDatas" : gridData
			});
			ajaxCommon({
				"url" : "com.zhonghe.ame.keyTask.group.saveTaskItem.biz.ext",
				data : json,
				contentType : 'text/json',
				success : function(text) {
					nui.unmask(document.body);
					if (text.result == "1") {
						showTips("操作成功");
						closeOk();
					} else {
						nui.get("saveBtn").enable();
					}
				}
			});
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