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
<title>收入预算执行跟踪</title>
</head>
<body>
	<div style="width: auto; height: 99%; padding: 5px;">
		<div id="form1">
			<div class="nui-toolbar" style="border-bottom: 0; padding: 5px;">
				<table>
					<tr>
						<td style="width: 60px; text-align: right;">年份:</td>
						<td>
							<input id="years" name="years" class="nui-textbox" style="width: 150px" />
						</td>
						<td>
							<a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查询</a>
							<a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset()">重置</a>
							<span style="color: red; vertical-align: inherit">默认当前年份</span>
						</td>
					</tr>
				</table>
			</div>
		</div>

		<div class="nui-toolbar" style="border-bottom: 0; padding: 5px;">
			<table style="width: 100%;">
				<tr>
					<td>
						<a class="nui-button" id="export" iconCls="icon-download" onclick="exportExcel()">导出</a>
					</td>
				</tr>
			</table>
		</div>

		<div class="nui-fit">
			<div id="trackGrid" class="nui-datagrid" style="width: 100%; height: 100%;" sizeList="[50]" pageSize="50" dataField="trackDatas" idField="secOrgId"
				url="com.zhonghe.ame.contractPact.statisticalReport.incomeBudgetTrack.biz.ext" frozenStartColumn="0" frozenEndColumn="0" ondrawcell="setBackGroundColor">
				<div property="columns">
					<div field="secOrgName" width="250" align="center" headerAlign="center">单位</div>
					<div header="1月份" headerAlign="center">
						<div property="columns">
							<div field="jarAccBudget" width="100" align="center" headerAlign="center" dataType="currency">预算（万元）</div>
							<div field="jarAccActual" width="100" align="center" headerAlign="center" dataType="currency">实际（万元）</div>
							<div field="jarCompletionRate" width="100" align="center" headerAlign="center">完成率</div>
						</div>
					</div>
					<div header="1 — 2月份" headerAlign="center">
						<div property="columns">
							<div field="febAccBudget" width="100" align="center" headerAlign="center" dataType="currency">预算（万元）</div>
							<div field="febAccActual" width="100" align="center" headerAlign="center" dataType="currency">实际（万元）</div>
							<div field="febCompletionRate" width="100" align="center" headerAlign="center">完成率</div>
						</div>
					</div>
					<div header="1 — 3月份" headerAlign="center">
						<div property="columns">
							<div field="marAccBudget" width="100" align="center" headerAlign="center" dataType="currency">预算（万元）</div>
							<div field="marAccActual" width="100" align="center" headerAlign="center" dataType="currency">实际（万元）</div>
							<div field="marCompletionRate" width="100" align="center" headerAlign="center">完成率</div>
						</div>
					</div>
					<div header="1 — 4月份" headerAlign="center">
						<div property="columns">
							<div field="aprAccBudget" width="100" align="center" headerAlign="center" dataType="currency">预算（万元）</div>
							<div field="aprAccActual" width="100" align="center" headerAlign="center" dataType="currency">实际（万元）</div>
							<div field="aprCompletionRate" width="100" align="center" headerAlign="center">完成率</div>
						</div>
					</div>
					<div header="1 — 5月份" headerAlign="center">
						<div property="columns">
							<div field="mayAccBudget" width="100" align="center" headerAlign="center" dataType="currency">预算（万元）</div>
							<div field="mayAccActual" width="100" align="center" headerAlign="center" dataType="currency">实际（万元）</div>
							<div field="mayCompletionRate" width="100" align="center" headerAlign="center">完成率</div>
						</div>
					</div>
					<div header="1 — 6月份" headerAlign="center">
						<div property="columns">
							<div field="junAccBudget" width="100" align="center" headerAlign="center" dataType="currency">预算（万元）</div>
							<div field="junAccActual" width="100" align="center" headerAlign="center" dataType="currency">实际（万元）</div>
							<div field="junCompletionRate" width="100" align="center" headerAlign="center">完成率</div>
						</div>
					</div>
					<div header="1 — 7月份" headerAlign="center">
						<div property="columns">
							<div field="julAccBudget" width="100" align="center" headerAlign="center" dataType="currency">预算（万元）</div>
							<div field="julAccActual" width="100" align="center" headerAlign="center" dataType="currency">实际（万元）</div>
							<div field="julCompletionRate" width="100" align="center" headerAlign="center">完成率</div>
						</div>
					</div>
					<div header="1 — 8月份" headerAlign="center">
						<div property="columns">
							<div field="augAccBudget" width="100" align="center" headerAlign="center" dataType="currency">预算（万元）</div>
							<div field="augAccActual" width="100" align="center" headerAlign="center" dataType="currency">实际（万元）</div>
							<div field="augCompletionRate" width="100" align="center" headerAlign="center">完成率</div>
						</div>
					</div>
					<div header="1 — 9月份" headerAlign="center">
						<div property="columns">
							<div field="sepAccBudget" width="100" align="center" headerAlign="center" dataType="currency">预算（万元）</div>
							<div field="sepAccActual" width="100" align="center" headerAlign="center" dataType="currency">实际（万元）</div>
							<div field="sepCompletionRate" width="100" align="center" headerAlign="center">完成率</div>
						</div>
					</div>
					<div header="1 — 10月份" headerAlign="center">
						<div property="columns">
							<div field="octAccBudget" width="100" align="center" headerAlign="center" dataType="currency">预算（万元）</div>
							<div field="octAccActual" width="100" align="center" headerAlign="center" dataType="currency">实际（万元）</div>
							<div field="octCompletionRate" width="100" align="center" headerAlign="center">完成率</div>
						</div>
					</div>
					<div header="1 — 11月份" headerAlign="center">
						<div property="columns">
							<div field="novAccBudget" width="100" align="center" headerAlign="center" dataType="currency">预算（万元）</div>
							<div field="novAccActual" width="100" align="center" headerAlign="center" dataType="currency">实际（万元）</div>
							<div field="novCompletionRate" width="100" align="center" headerAlign="center">完成率</div>
						</div>
					</div>
					<div header="1 — 12月份" headerAlign="center">
						<div property="columns">
							<div field="decAccBudget" width="100" align="center" headerAlign="center" dataType="currency">预算（万元）</div>
							<div field="decAccActual" width="100" align="center" headerAlign="center" dataType="currency">实际（万元）</div>
							<div field="decCompletionRate" width="100" align="center" headerAlign="center">完成率</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<form name="exprotExcelFlow" id="exprotExcelFlow" action="com.primeton.eos.ame_common.ameExportCommon.flow" method="post">
		<input type="hidden" name="_eosFlowAction" value="action0" filter="false" />
		<input type="hidden" name="downloadFile" filter="false" />
		<input type="hidden" name="fileName" filter="false" />
	</form>

	<script type="text/javascript">
		nui.parse();
		var form = new nui.Form("#form1");
		var grid = nui.get("trackGrid");
		var now = new Date();

		init();

		function init() {
			nui.get("years").setValue(now.getFullYear());
			search();
		}

		function search() {
			var data = form.getData();
			grid.load(data);
		}

		function reset() {
			form.reset();
			init();
		}

		function exportExcel() {
			if (!confirm("是否确认导出？")) {
				return;
			}
			var form = new nui.Form("#form1");
			var data = form.getData(); //获取表单JS对象数据
			var json = nui.encode(data);
			nui.ajax({
				url : "com.zhonghe.ame.contractPact.statisticalReport.exportIncomeBudgetTrackExcel.biz.ext",
				type : "post",
				data : json,
				cache : false,
				contentType : 'text/json',
				success : function(o) {
					var filePath = o.downloadFile;
					var fileName = "收入预算跟踪";
					var myDate = new Date();
					var year = myDate.getFullYear();
					var month = myDate.getMonth() + 1;
					var day = myDate.getDate();
					var hours = myDate.getHours();
					var minutes = myDate.getMinutes();
					var seconds = myDate.getSeconds();
					var curDateTime = year;
					if (month > 9) {
						curDateTime = curDateTime + "" + month;
					} else {
						curDateTime = curDateTime + "0" + month;
					}
					if (day > 9) {
						curDateTime = curDateTime + day;
					} else {
						curDateTime = curDateTime + "0" + day;
					}
					if (hours > 9) {
						curDateTime = curDateTime + hours;
					} else {
						curDateTime = curDateTime + "0" + hours;
					}
					if (minutes > 9) {
						curDateTime = curDateTime + minutes;
					} else {
						curDateTime = curDateTime + "0" + minutes;
					}
					if (seconds > 9) {
						curDateTime = curDateTime + seconds;
					} else {
						curDateTime = curDateTime + "0" + seconds;
					}
					fileName = fileName + "_" + curDateTime + ".xls";
					var frm = document.getElementById("exprotExcelFlow");
					frm.elements["downloadFile"].value = filePath;
					frm.elements["fileName"].value = fileName;
					frm.submit();
				},
				error : function() {
					showTips("导出数据异常，请联系管理员！", "danger");
				}
			});
		}
		
		function setBackGroundColor(e){
			var record = e.record;
			if(record.secOrgName=="合计"){
				e.rowStyle = "background-color: #e3f9e9";
			}
		}
		
	</script>

</body>
</html>