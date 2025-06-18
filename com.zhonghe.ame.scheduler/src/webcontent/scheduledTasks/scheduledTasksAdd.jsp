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
<title>定时任务 - 新增</title>
</head>
<body>
	<div class="nui-fit" style="padding: 5px;">
		<form id="addForm" method="post">
			<fieldset id="field1" style="border: solid 1px #aaa;">
				<legend>定时任务 - 新增</legend>
				<div style="padding: 5px;">
					<table style="table-layout: fixed;">
						<tr>
							<td align="right" style="width: 100px">任务名称：</td>
							<td>
								<input id="taskName" name="taskName" class="nui-textbox" style="width: 200px" required="true" />
							</td>
							<td align="right" style="width: 100px">任务类型：</td>
							<td>
								<input id="taskType" name="taskType" class="nui-dictcombobox" dictTypeId="scheduled_task_type" style="width: 200px" required="true" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 100px">任务执行类：</td>
							<td>
								<input id="taskClassName" name="taskClassName" class="nui-textbox" style="width: 200px" required="true" />
							</td>
							<td align="right" style="width: 100px">任务执行方法：</td>
							<td>
								<input id="taskMethodName" name="taskMethodName" class="nui-textbox" style="width: 200px" required="true" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 100px">开始日期：</td>
							<td>
								<input id="startTime" name="startTime" class="nui-datepicker" style="width: 200px" format="yyyy-MM-dd" required="true" />
							</td>
							<td align="right" style="width: 100px">结束日期：</td>
							<td>
								<input id="endTime" name="endTime" class="nui-datepicker" style="width: 200px" format="yyyy-MM-dd" required="true" />
							</td>
							<td align="left">
								<div id="isNoEndTime" class="nui-checkboxlist" data="[{'id': false,'text': '无结束时间'}]" style="margin-left: 10px;" onvaluechanged="changeIsNoEndTime"></div>
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 120px">备注：</td>
							<td colspan="3">
								<input id="remark" name="remark" class="nui-textarea" style="width: 100%; height: 50px" />
							</td>
						</tr>
					</table>
				</div>
			</fieldset>
			<fieldset id="field1" style="border: solid 1px #aaa;">
				<legend>触发模式 - 日历周期触发</legend>
				<div style="padding: 5px;">
					<table style="table-layout: fixed;">
						<tr>
							<td align="right" style="width: 100px; border: solid 1px #aaa;">触发时间：</td>
							<td style="border: solid 1px #aaa;">
								<input id="trTime" class="nui-timespinner" format="H:mm" style="width: 65px" required="true" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 100px; border: solid 1px #aaa;" rowspan="4">循环模式：</td>
							<td align="left" style="border: solid 1px #aaa; padding-left: 10px">
								<div id="radioDay" class="nui-radiobuttonlist" data="[{'id': 'day','text': '每日'}]" style="margin-top: 5px; margin-bottom: 5px; width: 50px" onvaluechanged="triggerOuterLayerRadioChange"></div>
							</td>
						</tr>
						<tr>
							<td align="left" style="border: solid 1px #aaa; padding-left: 10px">
								<div id="radioWeek" class="nui-radiobuttonlist" data="[{'id': 'week','text': '每周'}]" style="margin-top: 5px; margin-bottom: 5px; width: 50px" onvaluechanged="triggerOuterLayerRadioChange"></div>
							</td>
							<td align="left" style="border: solid 1px #aaa; padding-left: 29px">
								<div id="selectWeek" class="nui-combobox" showNullItem="true" allowInput="false" multiSelect="true" style="width: 200px; margin-top: 5px; margin-bottom: 5px;" dataField="weekDict"></div>
							</td>
						</tr>
						<tr>
							<td align="left" style="border: solid 1px #aaa; padding-left: 10px">
								<div id="radioMonth" class="nui-radiobuttonlist" data="[{'id': 'month','text': '每月'}]" style="margin-top: 5px; margin-bottom: 5px; width: 50px" onvaluechanged="triggerOuterLayerRadioChange"></div>
							</td>
							<td align="left" style="border: solid 1px #aaa;">
								<table style="table-layout: fixed;">
									<tr>
										<td>
											<input id="radioMonthDay" name="radioMonthDay" type="radio" onchange="triggerInnerLayerRadioChange('radioMonthDay')">
										</td>
										<td>
											<div id="selectMonthDay" class="nui-combobox" showNullItem="true" allowInput="false" multiSelect="true" style="width: 200px; margin-top: 5px; margin-bottom: 3px;" dataField="dayDict"></div>
										</td>
									</tr>
									<tr>
										<td>
											<input id="radioMonthWeek" name="radioMonthWeek" type="radio" onchange="triggerInnerLayerRadioChange('radioMonthWeek')">
										</td>
										<td>
											<div id="selectMonthWeekOrder" class="nui-combobox" showNullItem="true" allowInput="false" style="width: 200px; margin-top: 5px; margin-bottom: 3px;" dataField="monthWeekOrderDict"></div>
											<div id="selectMonthWeek" class="nui-combobox" showNullItem="true" allowInput="false" style="width: 200px; margin-top: 5px; margin-bottom: 3px;" dataField="weekDict"></div>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td align="left" style="border: solid 1px #aaa; padding-left: 10px">
								<div id="radioYear" class="nui-radiobuttonlist" data="[{'id': 'year','text': '每年'}]" style="margin-top: 5px; margin-bottom: 5px; width: 50px" onvaluechanged="triggerOuterLayerRadioChange"></div>
							</td>
							<td align="left" style="border: solid 1px #aaa;">
								<table style="table-layout: fixed;">
									<tr>
										<td>
											<input id="radioYearMonthDay" name="radioYearMonthDay" type="radio" onchange="triggerInnerLayerRadioChange('radioYearMonthDay')">
										</td>
										<td>
											<div id="selectYearMonth" class="nui-combobox" showNullItem="true" allowInput="false" style="width: 200px; margin-top: 5px; margin-bottom: 3px;" dataField="monthDict"></div>
											<div id="selectYearMonthDay" class="nui-combobox" showNullItem="true" allowInput="false" style="width: 200px; margin-top: 5px; margin-bottom: 3px;" dataField="dayDict"></div>
										</td>
									</tr>
									<tr>
										<td>
											<input id="radioYearWeek" name="radioYearWeek" type="radio" onchange="triggerInnerLayerRadioChange('radioYearWeek')">
										</td>
										<td>
											<div id="selectYearMonthOrder" class="nui-combobox" showNullItem="true" allowInput="false" style="width: 200px; margin-top: 5px; margin-bottom: 3px;" dataField="monthDict"></div>
											<div id="selectYearWeekOrder" class="nui-combobox" showNullItem="true" allowInput="false" style="width: 200px; margin-top: 5px; margin-bottom: 3px;" dataField="monthWeekOrderDict"></div>
											<div id="selectYearWeek" class="nui-combobox" showNullItem="true" allowInput="false" style="width: 200px; margin-top: 5px; margin-bottom: 3px;" dataField="weekDict"></div>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</div>
			</fieldset>
		</form>
	</div>

	<div style="text-align: center; padding: 5px; margin-bottom: 1px" class="nui-toolbar">
		<a id="saveBtn" class="nui-button" onclick="save()" style="width: 60px; margin-right: 20px;" iconCls="icon-save">保存</a>
		<a id="closeBtn" class="nui-button" onclick="closeCancel()" style="width: 60px;" iconCls="icon-close">关闭</a>
	</div>

	<script type="text/javascript">
		nui.parse();
		var form = new nui.Form("addForm");

		var weekDict = [ {
			id : "2",
			text : "星期一"
		}, {
			id : "3",
			text : "星期二"
		}, {
			id : "4",
			text : "星期三"
		}, {
			id : "5",
			text : "星期四"
		}, {
			id : "6",
			text : "星期五"
		}, {
			id : "7",
			text : "星期六"
		}, {
			id : "1",
			text : "星期日"
		} ];

		var dayDict = [ {
			id : "1",
			text : "1日"
		}, {
			id : "2",
			text : "2日"
		}, {
			id : "3",
			text : "3日"
		}, {
			id : "4",
			text : "4日"
		}, {
			id : "5",
			text : "5日"
		}, {
			id : "6",
			text : "6日"
		}, {
			id : "7",
			text : "7日"
		}, {
			id : "8",
			text : "8日"
		}, {
			id : "9",
			text : "9日"
		}, {
			id : "10",
			text : "10日"
		}, {
			id : "11",
			text : "11日"
		}, {
			id : "12",
			text : "12日"
		}, {
			id : "13",
			text : "13日"
		}, {
			id : "14",
			text : "14日"
		}, {
			id : "15",
			text : "15日"
		}, {
			id : "16",
			text : "16日"
		}, {
			id : "17",
			text : "17日"
		}, {
			id : "18",
			text : "18日"
		}, {
			id : "19",
			text : "19日"
		}, {
			id : "20",
			text : "20日"
		}, {
			id : "21",
			text : "21日"
		}, {
			id : "22",
			text : "22日"
		}, {
			id : "23",
			text : "23日"
		}, {
			id : "24",
			text : "24日"
		}, {
			id : "25",
			text : "25日"
		}, {
			id : "26",
			text : "26日"
		}, {
			id : "27",
			text : "27日"
		}, {
			id : "28",
			text : "28日"
		}, {
			id : "29",
			text : "29日"
		}, {
			id : "30",
			text : "30日"
		}, {
			id : "31",
			text : "31日"
		} ];

		var monthWeekOrderDict = [ {
			id : "1",
			text : "第一周"
		}, {
			id : "2",
			text : "第二周"
		}, {
			id : "3",
			text : "第三周"
		}, {
			id : "4",
			text : "第四周"
		}, {
			id : "-1",
			text : "最后一周"
		} ];

		var monthDict = [ {
			id : "1",
			text : "1月"
		}, {
			id : "2",
			text : "2月"
		}, {
			id : "3",
			text : "3月"
		}, {
			id : "4",
			text : "4月"
		}, {
			id : "5",
			text : "5月"
		}, {
			id : "6",
			text : "6月"
		}, {
			id : "7",
			text : "7月"
		}, {
			id : "8",
			text : "8月"
		}, {
			id : "9",
			text : "9月"
		}, {
			id : "10",
			text : "10月"
		}, {
			id : "11",
			text : "11月"
		}, {
			id : "12",
			text : "12月"
		} ];

		nui.get("selectWeek").setData(weekDict);
		nui.get("selectMonthDay").setData(dayDict);
		nui.get("selectMonthWeekOrder").setData(monthWeekOrderDict);
		nui.get("selectMonthWeek").setData(weekDict);
		nui.get("selectYearMonth").setData(monthDict);
		nui.get("selectYearMonthDay").setData(dayDict);
		nui.get("selectYearMonthOrder").setData(monthDict);
		nui.get("selectYearWeekOrder").setData(monthWeekOrderDict);
		nui.get("selectYearWeek").setData(weekDict);

		nui.get("radioDay").setValue("day");

		var init = {
			"value" : "day"
		};
		triggerOuterLayerRadioChange(init);

		function changeIsNoEndTime() {
			var isNoEndTime = nui.get("isNoEndTime").getValue();
			if (isNoEndTime) {
				nui.get("endTime").setEnabled(false);
				nui.get("endTime").setRequired(false);
			} else {
				nui.get("endTime").setEnabled(true);
				nui.get("endTime").setRequired(true);
			}
		}

		function triggerOuterLayerRadioChange(e) {
			if (e.value == "day") {
				nui.get("radioWeek").setValue("");
				nui.get("radioMonth").setValue("");
				nui.get("radioYear").setValue("");
				nui.get("selectWeek").setEnabled(false);
				nui.get("selectWeek").setRequired(false);
				nui.get("selectWeek").setValue("");
				$("#radioMonthDay").attr("disabled", true);
				$("#radioMonthDay").prop('checked', false);
				nui.get("selectMonthDay").setEnabled(false);
				nui.get("selectMonthDay").setRequired(false);
				nui.get("selectMonthDay").setValue("");
				$("#radioMonthWeek").attr("disabled", true);
				$("#radioMonthDay").prop('checked', false);
				nui.get("selectMonthWeekOrder").setEnabled(false);
				nui.get("selectMonthWeekOrder").setRequired(false);
				nui.get("selectMonthWeekOrder").setValue("");
				nui.get("selectMonthWeek").setEnabled(false);
				nui.get("selectMonthWeek").setRequired(false);
				nui.get("selectMonthWeek").setValue("");
				$("#radioYearMonthDay").attr("disabled", true);
				$("#radioYearMonthDay").prop('checked', false);
				nui.get("selectYearMonth").setEnabled(false);
				nui.get("selectYearMonth").setRequired(false);
				nui.get("selectYearMonth").setValue("");
				nui.get("selectYearMonthDay").setEnabled(false);
				nui.get("selectYearMonthDay").setRequired(false);
				nui.get("selectYearMonthDay").setValue("");
				$("#radioYearWeek").attr("disabled", true);
				$("#radioYearWeek").prop('checked', false);
				nui.get("selectYearMonthOrder").setEnabled(false);
				nui.get("selectYearMonthOrder").setRequired(false);
				nui.get("selectYearMonthOrder").setValue("");
				nui.get("selectYearWeekOrder").setEnabled(false);
				nui.get("selectYearWeekOrder").setRequired(false);
				nui.get("selectYearWeekOrder").setValue("");
				nui.get("selectYearWeek").setEnabled(false);
				nui.get("selectYearWeek").setRequired(false);
				nui.get("selectYearWeek").setValue("");
			}
			if (e.value == "week") {
				nui.get("radioDay").setValue("");
				nui.get("radioMonth").setValue("");
				nui.get("radioYear").setValue("");
				nui.get("selectWeek").setEnabled(true);
				nui.get("selectWeek").setRequired(true);
				nui.get("selectWeek").setValue("");
				$("#radioMonthDay").attr("disabled", true);
				$("#radioMonthDay").prop('checked', false);
				nui.get("selectMonthDay").setEnabled(false);
				nui.get("selectMonthDay").setRequired(false);
				nui.get("selectMonthDay").setValue("");
				$("#radioMonthWeek").attr("disabled", true);
				$("#radioMonthWeek").prop('checked', false);
				nui.get("selectMonthWeekOrder").setEnabled(false);
				nui.get("selectMonthWeekOrder").setRequired(false);
				nui.get("selectMonthWeekOrder").setValue("");
				nui.get("selectMonthWeek").setEnabled(false);
				nui.get("selectMonthWeek").setRequired(false);
				nui.get("selectMonthWeek").setValue("");
				$("#radioYearMonthDay").attr("disabled", true);
				$("#radioYearMonthDay").prop('checked', false);
				nui.get("selectYearMonth").setEnabled(false);
				nui.get("selectYearMonth").setRequired(false);
				nui.get("selectYearMonth").setValue("");
				nui.get("selectYearMonthDay").setEnabled(false);
				nui.get("selectYearMonthDay").setRequired(false);
				nui.get("selectYearMonthDay").setValue("");
				$("#radioYearWeek").attr("disabled", true);
				$("#radioYearWeek").prop('checked', false);
				nui.get("selectYearMonthOrder").setEnabled(false);
				nui.get("selectYearMonthOrder").setRequired(false);
				nui.get("selectYearMonthOrder").setValue("");
				nui.get("selectYearWeekOrder").setEnabled(false);
				nui.get("selectYearWeekOrder").setRequired(false);
				nui.get("selectYearWeekOrder").setValue("");
				nui.get("selectYearWeek").setEnabled(false);
				nui.get("selectYearWeek").setRequired(false);
				nui.get("selectYearWeek").setValue("");
			}
			if (e.value == "month") {
				nui.get("radioDay").setValue("");
				nui.get("radioWeek").setValue("");
				nui.get("radioYear").setValue("");
				nui.get("selectWeek").setEnabled(false);
				nui.get("selectWeek").setRequired(false);
				nui.get("selectWeek").setValue("");
				$("#radioMonthDay").attr("disabled", false);
				$("#radioMonthDay").prop('checked', false);
				nui.get("selectMonthDay").setEnabled(false);
				nui.get("selectMonthDay").setRequired(false);
				nui.get("selectMonthDay").setValue("");
				$("#radioMonthWeek").attr("disabled", false);
				$("#radioMonthWeek").prop('checked', false);
				nui.get("selectMonthWeekOrder").setEnabled(false);
				nui.get("selectMonthWeekOrder").setRequired(false);
				nui.get("selectMonthWeekOrder").setValue("");
				nui.get("selectMonthWeek").setEnabled(false);
				nui.get("selectMonthWeek").setRequired(false);
				nui.get("selectMonthWeek").setValue("");
				$("#radioYearMonthDay").attr("disabled", true);
				$("#radioYearMonthDay").prop('checked', false);
				nui.get("selectYearMonth").setEnabled(false);
				nui.get("selectYearMonth").setRequired(false);
				nui.get("selectYearMonth").setValue("");
				nui.get("selectYearMonthDay").setEnabled(false);
				nui.get("selectYearMonthDay").setRequired(false);
				nui.get("selectYearMonthDay").setValue("");
				$("#radioYearWeek").attr("disabled", true);
				$("#radioYearWeek").prop('checked', false);
				nui.get("selectYearMonthOrder").setEnabled(false);
				nui.get("selectYearMonthOrder").setRequired(false);
				nui.get("selectYearMonthOrder").setValue("");
				nui.get("selectYearWeekOrder").setEnabled(false);
				nui.get("selectYearWeekOrder").setRequired(false);
				nui.get("selectYearWeekOrder").setValue("");
				nui.get("selectYearWeek").setEnabled(false);
				nui.get("selectYearWeek").setRequired(false);
				nui.get("selectYearWeek").setValue("");
			}
			if (e.value == "year") {
				nui.get("radioDay").setValue("");
				nui.get("radioWeek").setValue("");
				nui.get("radioMonth").setValue("");
				nui.get("selectWeek").setEnabled(false);
				nui.get("selectWeek").setRequired(false);
				nui.get("selectWeek").setValue("");
				$("#radioMonthDay").attr("disabled", true);
				$("#radioMonthDay").prop('checked', false);
				nui.get("selectMonthDay").setEnabled(false);
				nui.get("selectMonthDay").setRequired(false);
				nui.get("selectMonthDay").setValue("");
				$("#radioMonthWeek").attr("disabled", true);
				$("#radioMonthDay").prop('checked', false);
				nui.get("selectMonthWeekOrder").setEnabled(false);
				nui.get("selectMonthWeekOrder").setRequired(false);
				nui.get("selectMonthWeekOrder").setValue("");
				nui.get("selectMonthWeek").setEnabled(false);
				nui.get("selectMonthWeek").setRequired(false);
				nui.get("selectMonthWeek").setValue("");
				$("#radioYearMonthDay").attr("disabled", false);
				$("#radioYearMonthDay").prop('checked', false);
				nui.get("selectYearMonth").setEnabled(false);
				nui.get("selectYearMonth").setRequired(false);
				nui.get("selectYearMonth").setValue("");
				nui.get("selectYearMonthDay").setEnabled(false);
				nui.get("selectYearMonthDay").setRequired(false);
				nui.get("selectYearMonthDay").setValue("");
				$("#radioYearWeek").attr("disabled", false);
				$("#radioYearWeek").prop('checked', false);
				nui.get("selectYearMonthOrder").setEnabled(false);
				nui.get("selectYearMonthOrder").setRequired(false);
				nui.get("selectYearMonthOrder").setValue("");
				nui.get("selectYearWeekOrder").setEnabled(false);
				nui.get("selectYearWeekOrder").setRequired(false);
				nui.get("selectYearWeekOrder").setValue("");
				nui.get("selectYearWeek").setEnabled(false);
				nui.get("selectYearWeek").setRequired(false);
				nui.get("selectYearWeek").setValue("");
			}
		}

		function triggerInnerLayerRadioChange(val) {
			if (val == "radioMonthDay") {
				$("#radioMonthWeek").prop('checked', false);
				nui.get("selectMonthDay").setEnabled(true);
				nui.get("selectMonthDay").setRequired(true);
				nui.get("selectMonthDay").setValue("");
				nui.get("selectMonthWeekOrder").setEnabled(false);
				nui.get("selectMonthWeekOrder").setRequired(false);
				nui.get("selectMonthWeekOrder").setValue("");
				nui.get("selectMonthWeek").setEnabled(false);
				nui.get("selectMonthWeek").setRequired(false);
				nui.get("selectMonthWeek").setValue("");
			}
			if (val == "radioMonthWeek") {
				$("#radioMonthDay").prop('checked', false);
				nui.get("selectMonthWeekOrder").setEnabled(true);
				nui.get("selectMonthWeekOrder").setRequired(true);
				nui.get("selectMonthWeekOrder").setValue("");
				nui.get("selectMonthWeek").setEnabled(true);
				nui.get("selectMonthWeek").setRequired(true);
				nui.get("selectMonthWeek").setValue("");
				nui.get("selectMonthDay").setEnabled(false);
				nui.get("selectMonthDay").setRequired(false);
				nui.get("selectMonthDay").setValue("");
			}
			if (val == "radioYearMonthDay") {
				$("#radioYearWeek").prop('checked', false);
				nui.get("selectYearMonth").setEnabled(true);
				nui.get("selectYearMonth").setRequired(true);
				nui.get("selectYearMonth").setValue("");
				nui.get("selectYearMonthDay").setEnabled(true);
				nui.get("selectYearMonthDay").setRequired(true);
				nui.get("selectYearMonthDay").setValue("");
				nui.get("selectYearMonthOrder").setEnabled(false);
				nui.get("selectYearMonthOrder").setRequired(false);
				nui.get("selectYearMonthOrder").setValue("");
				nui.get("selectYearWeekOrder").setEnabled(false);
				nui.get("selectYearWeekOrder").setRequired(false);
				nui.get("selectYearWeekOrder").setValue("");
				nui.get("selectYearWeek").setEnabled(false);
				nui.get("selectYearWeek").setRequired(false);
				nui.get("selectYearWeek").setValue("");
			}
			if (val == "radioYearWeek") {
				$("#radioYearMonthDay").prop('checked', false);
				nui.get("selectYearMonthOrder").setEnabled(true);
				nui.get("selectYearMonthOrder").setRequired(true);
				nui.get("selectYearMonthOrder").setValue("");
				nui.get("selectYearWeekOrder").setEnabled(true);
				nui.get("selectYearWeekOrder").setRequired(true);
				nui.get("selectYearWeekOrder").setValue("");
				nui.get("selectYearWeek").setEnabled(true);
				nui.get("selectYearWeek").setRequired(true);
				nui.get("selectYearWeek").setValue("");
				nui.get("selectYearMonth").setEnabled(false);
				nui.get("selectYearMonth").setRequired(false);
				nui.get("selectYearMonth").setValue("");
				nui.get("selectYearMonthDay").setEnabled(false);
				nui.get("selectYearMonthDay").setRequired(false);
				nui.get("selectYearMonthDay").setValue("");
			}
		}

		function getCronExpression() {
			var cronExpression;
			var trTime = nui.get("trTime").getValue();
			if (trTime != null && trTime != "") {
				var times = nui.formatDate(trTime, "HH:mm:ss");
				var t = times.split(":");
				var a = t[1][1];
				var b = t[0][1];
				var a1 = t[1] < 10 ? a : t[1];
				var b1 = t[0] < 10 ? b : t[0];
				cronExpression = "0 " + a1 + " " + b1;
			}
			var radioDay = nui.get("radioDay").getValue();
			var radioWeek = nui.get("radioWeek").getValue();
			var radioMonth = nui.get("radioMonth").getValue();
			var radioYear = nui.get("radioYear").getValue();
			if (radioDay == "day") {
				cronExpression = cronExpression + " * * ? *";
			}
			if (radioWeek == "week") {
				var selectWeek = nui.get("selectWeek").getValue();
				cronExpression = cronExpression + " ? * " + selectWeek + " *";
			}
			if (radioMonth == "month") {
				if ($("#radioMonthDay").is(":checked")) {
					var selectMonthDay = nui.get("selectMonthDay").getValue();
					cronExpression = cronExpression + " " + selectMonthDay + " * ? *";
				} else if ($("#radioMonthWeek").is(":checked")) {
					var selectMonthWeekOrder = nui.get("selectMonthWeekOrder").getValue();
					var selectMonthWeek = nui.get("selectMonthWeek").getValue();
					if (selectMonthWeekOrder == "-1") {
						cronExpression = cronExpression + " ? * " + selectMonthWeek + "L *";
					} else {
						cronExpression = cronExpression + " ? * " + selectMonthWeek + "#" + selectMonthWeekOrder + " *";
					}
				} else {
					showTips("循环模式：每月配置存在问题！", "danger");
					return "false";
				}
			}
			if (radioYear == "year") {
				if ($("#radioYearMonthDay").is(":checked")) {
					var selectYearMonth = nui.get("selectYearMonth").getValue();
					var selectYearMonthDay = nui.get("selectYearMonthDay").getValue();
					cronExpression = cronExpression + " " + selectYearMonthDay + " " + selectYearMonth + " ? *";
				} else if ($("#radioYearWeek").is(":checked")) {
					var selectYearMonthOrder = nui.get("selectYearMonthOrder").getValue();
					var selectYearWeekOrder = nui.get("selectYearWeekOrder").getValue();
					var selectYearWeek = nui.get("selectYearWeek").getValue();
					if (selectYearWeekOrder == '-1') {
						cronExpression = cronExpression + " ? " + selectYearMonthOrder + " " + selectYearWeek + "L *";
					} else {
						cronExpression = cronExpression + " ? " + selectYearMonthOrder + " " + selectYearWeek + "#" + selectYearWeekOrder + " *";
					}
				} else {
					showTips("循环模式：每年配置存在问题！", "danger");
					return "false";
				}
			}
			return cronExpression;
		}

		function save() {
			if (!form.validate()) {
				showTips("请检查表单的完整性!", "danger");
				return;
			}
			var cronExpression = getCronExpression();
			if (cronExpression != "false") {
				nui.confirm("确定保存数据吗？", "系统提示", function(action) {
					if (action == "ok") {
						nui.get("saveBtn").disable();
						nui.get("closeBtn").disable();
						nui.mask({
							el : document.body,
							cls : 'mini-mask-loading',
							html : '表单保存中...'
						});
						setTimeout(function() {
							nui.unmask(document.body);
							var formData = form.getData();
							formData.cronExpression = cronExpression;
							var json = nui.encode({
								"scheduledInfo" : formData
							});
							ajaxCommon({
								"url" : "com.zhonghe.ame.scheduler.task.scheduledTasks.addScheduledTasks.biz.ext",
								data : json,
								contentType : 'text/json',
								success : function(text) {
									if (text.result == "1") {
										showTips("保存成功");
										closeOk();
									} else {
										nui.get("saveBtn").enable();
										nui.get("closeBtn").enable();
									}
								}
							});
						}, 2000);
					}
				});
			}

		}
	</script>

</body>
</html>