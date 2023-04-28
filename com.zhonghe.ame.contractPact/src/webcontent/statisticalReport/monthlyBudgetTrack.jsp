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
<title>月度经营统计</title>
</head>
<body>
	<div id="tabs" class="nui-tabs" activeIndex="0" style="width: auto; height: 99%; padding: 5px;" onactivechanged="tabActiveChanged">
		<div title="【单位】维度跟踪">
			<div id="orgDimForm">
				<div class="nui-toolbar" style="border-bottom: 0; padding: 5px;">
					<table>
						<tr>
							<td style="width: 60px; text-align: right;">年月:</td>
							<td>
								<input id="orgDimYearMonth" name="orgDimYearMonth" class="nui-monthpicker" style="width: 150px" />
							</td>
							<td style="width: 60px; text-align: right;">集团内外:</td>
							<td style="width: 155px">
								<input id="orgDimGroup" name="orgDimGroup" class="nui-dictcombobox" dictTypeId="ZH_OPERATION_INCOME_GROUP" showNullItem="true" nullItemText="全部" style="width: 150px" />
							</td>
							<td>
								<a class="nui-button" id="orgDimSearch" iconCls="icon-search" onclick="orgDimSearch()">查询</a>
								<a class="nui-button" id="orgDimReset" iconCls="icon-reload" onclick="orgDimReset()">重置</a>
								<span style="color: red; vertical-align: inherit">默认当前年份及月份</span>
							</td>
						</tr>
					</table>
				</div>
			</div>

			<div class="nui-toolbar" style="border-bottom: 0; padding: 5px;">
				<table style="width: 100%;">
					<tr>
						<td>
							<a class="nui-button" id="orgDimExport" iconCls="icon-download" onclick="orgDimExportExcel()">导出</a>
						</td>
					</tr>
				</table>
			</div>

			<div class="nui-fit">
				<div id="orgDimGrid" class="nui-datagrid" style="width: 100%; height: 100%;" sizeList="[50]" pageSize="50" dataField="trackDatas" idField="secOrgId"
					url="com.zhonghe.ame.contractPact.statisticalReport.orgDimMonthlyBudgetTrack.biz.ext" frozenStartColumn="0" frozenEndColumn="1" ondrawcell="setBackGroundColor">
					<div property="columns">
						<div field="secOrgName" width="250" align="center" headerAlign="center">单位</div>
						<div field="holdContractSum" width="150" align="center" headerAlign="center" dataType="currency">手持合同额（万元）</div>
						<div header="当月" headerAlign="center">
							<div property="columns">
								<div field="monthContractCount" width="150" align="center" headerAlign="center">新签合同数量</div>
								<div field="monthNewContractSum" width="150" align="center" headerAlign="center" dataType="currency">新签合同额（万元）</div>
								<div field="monthContractExecutionSum" width="150" align="center" headerAlign="center" dataType="currency">合同执行额（万元）</div>
								<div field="monthNewContractExecutionSum" width="250" align="center" headerAlign="center" dataType="currency">其中：当月新签合同执行额（万元）</div>
								<div field="monthReceiveSum" width="150" align="center" headerAlign="center" dataType="currency">合同收款额（万元）</div>
							</div>
						</div>
						<div header="本年累计" headerAlign="center">
							<div property="columns">
								<div field="yearContractCount" width="150" align="center" headerAlign="center">新签合同数量</div>
								<div field="yearNewContractSum" width="150" align="center" headerAlign="center" dataType="currency">新签合同额（万元）</div>
								<div field="yearContractExecutionSum" width="150" align="center" headerAlign="center" dataType="currency">合同执行额（万元）</div>
								<div field="yearNewContractExecutionSum" width="250" align="center" headerAlign="center" dataType="currency">其中：本年累计新签合同执行额（万元）</div>
								<div field="yearReceiveSum" width="150" align="center" headerAlign="center" dataType="currency">合同收款额（万元）</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div title="【专业类别】维度跟踪">
			<div id="majorDimForm">
				<div class="nui-toolbar" style="border-bottom: 0; padding: 5px;">
					<table>
						<tr>
							<td style="width: 60px; text-align: right;">年月:</td>
							<td>
								<input id="majorDimYearMonth" name="majorDimYearMonth" class="nui-monthpicker" style="width: 150px" />
							</td>
							<td style="width: 60px; text-align: right;">集团内外:</td>
							<td style="width: 155px">
								<input id="majorDimGroup" name="majorDimGroup" class="nui-dictcombobox" dictTypeId="ZH_OPERATION_INCOME_GROUP" showNullItem="true" nullItemText="全部" style="width: 150px" />
							</td>
							<td>
								<a class="nui-button" id="majorDimSearch" iconCls="icon-search" onclick="majorDimSearch()">查询</a>
								<a class="nui-button" id="majorDimReset" iconCls="icon-reload" onclick="majorDimReset()">重置</a>
								<span style="color: red; vertical-align: inherit">默认当前年份及月份</span>
							</td>
						</tr>
					</table>
				</div>
			</div>

			<div class="nui-toolbar" style="border-bottom: 0; padding: 5px;">
				<table style="width: 100%;">
					<tr>
						<td>
							<a class="nui-button" id="majorDimExport" iconCls="icon-download" onclick="majorDimExportExcel()">导出</a>
						</td>
					</tr>
				</table>
			</div>

			<div class="nui-fit">
				<div id="majorDimGrid" class="nui-datagrid" style="width: 100%; height: 100%;" sizeList="[50]" pageSize="50" dataField="trackDatas" idField="majorId"
					url="com.zhonghe.ame.contractPact.statisticalReport.majorDimMonthlyBudgetTrack.biz.ext" frozenStartColumn="0" frozenEndColumn="1" ondrawcell="setMajorBackGroundColor">
					<div property="columns">
						<div field="majorName" width="250" align="center" headerAlign="center">专业类别</div>
						<div field="holdContractSum" width="150" align="center" headerAlign="center" dataType="currency">手持合同额（万元）</div>
						<div header="当月" headerAlign="center">
							<div property="columns">
								<div field="monthContractCount" width="150" align="center" headerAlign="center">新签合同数量</div>
								<div field="monthNewContractSum" width="150" align="center" headerAlign="center" dataType="currency">新签合同额（万元）</div>
								<div field="monthContractExecutionSum" width="150" align="center" headerAlign="center" dataType="currency">合同执行额（万元）</div>
								<div field="monthNewContractExecutionSum" width="250" align="center" headerAlign="center" dataType="currency">其中：当月新签合同执行额（万元）</div>
								<div field="monthReceiveSum" width="150" align="center" headerAlign="center" dataType="currency">合同收款额（万元）</div>
							</div>
						</div>
						<div header="本年累计" headerAlign="center">
							<div property="columns">
								<div field="yearContractCount" width="150" align="center" headerAlign="center">新签合同数量</div>
								<div field="yearNewContractSum" width="150" align="center" headerAlign="center" dataType="currency">新签合同额（万元）</div>
								<div field="yearContractExecutionSum" width="150" align="center" headerAlign="center" dataType="currency">合同执行额（万元）</div>
								<div field="yearNewContractExecutionSum" width="250" align="center" headerAlign="center" dataType="currency">其中：本年累计新签合同执行额（万元）</div>
								<div field="yearReceiveSum" width="150" align="center" headerAlign="center" dataType="currency">合同收款额（万元）</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div title="【集团内/外】维度跟踪">
			<div id="groupDimForm">
				<div class="nui-toolbar" style="border-bottom: 0; padding: 5px;">
					<table>
						<tr>
							<td style="width: 60px; text-align: right;">年月:</td>
							<td>
								<input id="groupDimYearMonth" name="groupDimYearMonth" class="nui-monthpicker" style="width: 150px" />
							</td>
							<td>
								<a class="nui-button" id="groupDimSearch" iconCls="icon-search" onclick="groupDimSearch()">查询</a>
								<a class="nui-button" id="groupDimReset" iconCls="icon-reload" onclick="groupDimReset()">重置</a>
								<span style="color: red; vertical-align: inherit">默认当前年份及月份</span>
							</td>
						</tr>
					</table>
				</div>
			</div>

			<div class="nui-toolbar" style="border-bottom: 0; padding: 5px;">
				<table style="width: 100%;">
					<tr>
						<td>
							<a class="nui-button" id="groupDimExport" iconCls="icon-download" onclick="groupDimExportExcel()">导出</a>
						</td>
					</tr>
				</table>
			</div>

			<div class="nui-fit">
				<div id="groupDimGrid" class="nui-datagrid" style="width: 100%; height: 100%;" sizeList="[50]" pageSize="50" dataField="trackDatas" idField="groupId"
					url="com.zhonghe.ame.contractPact.statisticalReport.groupDimMonthlyBudgetTrack.biz.ext" frozenStartColumn="0" frozenEndColumn="1" ondrawcell="setGroupBackGroundColor">
					<div property="columns">
						<div field="groupName" width="250" align="center" headerAlign="center">集团内/外</div>
						<div field="holdContractSum" width="150" align="center" headerAlign="center" dataType="currency">手持合同额（万元）</div>
						<div header="当月" headerAlign="center">
							<div property="columns">
								<div field="monthContractCount" width="150" align="center" headerAlign="center">新签合同数量</div>
								<div field="monthNewContractSum" width="150" align="center" headerAlign="center" dataType="currency">新签合同额（万元）</div>
								<div field="monthContractExecutionSum" width="150" align="center" headerAlign="center" dataType="currency">合同执行额（万元）</div>
								<div field="monthNewContractExecutionSum" width="250" align="center" headerAlign="center" dataType="currency">其中：当月新签合同执行额（万元）</div>
								<div field="monthReceiveSum" width="150" align="center" headerAlign="center" dataType="currency">合同收款额（万元）</div>
							</div>
						</div>
						<div header="本年累计" headerAlign="center">
							<div property="columns">
								<div field="yearContractCount" width="150" align="center" headerAlign="center">新签合同数量</div>
								<div field="yearNewContractSum" width="150" align="center" headerAlign="center" dataType="currency">新签合同额（万元）</div>
								<div field="yearContractExecutionSum" width="150" align="center" headerAlign="center" dataType="currency">合同执行额（万元）</div>
								<div field="yearNewContractExecutionSum" width="250" align="center" headerAlign="center" dataType="currency">其中：本年累计新签合同执行额（万元）</div>
								<div field="yearReceiveSum" width="150" align="center" headerAlign="center" dataType="currency">合同收款额（万元）</div>
							</div>
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
		var orgDimForm = new nui.Form("#orgDimForm");
		var orgDimGrid = nui.get("orgDimGrid");
		var majorDimForm = new nui.Form("#majorDimForm");
		var majorDimGrid = nui.get("majorDimGrid");
		var groupDimForm = new nui.Form("#groupDimForm");
		var groupDimGrid = nui.get("groupDimGrid");
		var tabs = nui.get("tabs");
		var now = new Date();

		function tabActiveChanged(e) {
			if (e.tab.title == "【单位】维度跟踪") {
				nui.get("orgDimYearMonth").setValue(now);
				orgDimSearch();
			} else if (e.tab.title == "【专业类别】维度跟踪") {
				nui.get("majorDimYearMonth").setValue(now);
				majorDimSearch();
			} else if (e.tab.title == "【集团内/外】维度跟踪") {
				nui.get("groupDimYearMonth").setValue(now);
				groupDimSearch();
			}
		}

		function orgDimSearch() {
			var data = orgDimForm.getData();
			orgDimGrid.load(data);
		}

		function orgDimReset() {
			orgDimForm.reset();
			nui.get("orgDimYearMonth").setValue(now);
			orgDimSearch();
		}

		function majorDimSearch() {
			var data = majorDimForm.getData();
			majorDimGrid.load(data);
		}

		function majorDimReset() {
			majorDimForm.reset();
			nui.get("majorDimYearMonth").setValue(now);
			majorDimSearch();
		}

		function groupDimSearch() {
			var data = groupDimForm.getData();
			groupDimGrid.load(data);
		}

		function groupDimReset() {
			groupDimForm.reset();
			nui.get("groupDimYearMonth").setValue(now);
			groupDimSearch();
		}

		function setBackGroundColor(e) {
			var record = e.record;
			if (record.secOrgName == "合计") {
				e.rowStyle = "background-color: #e3f9e9";
			}
		}

		function setMajorBackGroundColor(e) {
			var record = e.record;
			if (record.majorName == "合计") {
				e.rowStyle = "background-color: #e3f9e9";
			}
		}

		function setGroupBackGroundColor(e) {
			var record = e.record;
			if (record.groupName == "合计") {
				e.rowStyle = "background-color: #e3f9e9";
			}
		}

		function orgDimExportExcel() {
			if (!confirm("是否确认导出？")) {
				return;
			}
			var orgDimForm = new nui.Form("#orgDimForm");
			var data = orgDimForm.getData(); //获取表单JS对象数据
			var json = nui.encode(data);
			nui.ajax({
				url : "com.zhonghe.ame.contractPact.statisticalReport.exportOrgDimMonthlyBudgetTrackExcel.biz.ext",
				type : "post",
				data : json,
				cache : false,
				contentType : 'text/json',
				success : function(o) {
					var filePath = o.downloadFile;
					var fileName = "月度经营统计";
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

		function majorDimExportExcel() {
			if (!confirm("是否确认导出？")) {
				return;
			}
			var majorDimForm = new nui.Form("#majorDimForm");
			var data = majorDimForm.getData(); //获取表单JS对象数据
			var json = nui.encode(data);
			nui.ajax({
				url : "com.zhonghe.ame.contractPact.statisticalReport.exportMajorDimMonthlyBudgetTrackExcel.biz.ext",
				type : "post",
				data : json,
				cache : false,
				contentType : 'text/json',
				success : function(o) {
					var filePath = o.downloadFile;
					var fileName = "月度经营统计";
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

		function groupDimExportExcel() {
			if (!confirm("是否确认导出？")) {
				return;
			}
			var groupDimForm = new nui.Form("#groupDimForm");
			var data = groupDimForm.getData(); //获取表单JS对象数据
			var json = nui.encode(data);
			nui.ajax({
				url : "com.zhonghe.ame.contractPact.statisticalReport.exportGroupDimMonthlyBudgetTrackExcel.biz.ext",
				type : "post",
				data : json,
				cache : false,
				contentType : 'text/json',
				success : function(o) {
					var filePath = o.downloadFile;
					var fileName = "月度经营统计";
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
	</script>

</body>
</html>