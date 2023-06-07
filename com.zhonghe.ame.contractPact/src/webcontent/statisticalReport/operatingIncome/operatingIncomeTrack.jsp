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
<title>营业收入跟踪</title>
</head>
<body>
	<div id="tabs" class="nui-tabs" activeIndex="0" style="width: auto; height: 99%; padding: 5px;" onactivechanged="tabActiveChanged">
		<div title="【单位】维度跟踪">
			<div id="orgDimForm">
				<input class="nui-hidden" name="authType" id="authType" />
				<input class="nui-hidden" name="secOrgId" id="secOrgId" />
				<div class="nui-toolbar" style="border-bottom: 0; padding: 5px;">
					<table>
						<tr>
							<td style="width: 60px; text-align: right;">年份:</td>
							<td>
								<input id="orgDimYear" name="orgDimYear" class="nui-textbox" style="width: 150px" />
							</td>
							<td style="width: 60px; text-align: right;">集团内外:</td>
							<td style="width: 155px">
								<input id="orgDimGroup" name="orgDimGroup" class="nui-dictcombobox" dictTypeId="ZH_OPERATION_INCOME_GROUP" showNullItem="true" nullItemText="全部" style="width: 150px" />
							</td>
							<td>
								<a class="nui-button" id="orgDimSearch" iconCls="icon-search" onclick="orgDimSearch()">查询</a>
								<a class="nui-button" id="orgDimReset" iconCls="icon-reload" onclick="orgDimReset()">重置</a>
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
							<a class="nui-button" id="operatingIncomeTrack_add" iconCls="icon-add" onclick="orgDimAdd()">新增</a>
							<a class="nui-button" id="operatingIncomeTrack_edit" iconCls="icon-edit" onclick="orgDimAddEdit()">编辑</a>
							<a class="nui-button" id="orgDimExport" iconCls="icon-download" onclick="orgDimExportExcel()">导出</a>
						</td>
					</tr>
				</table>
			</div>

			<div class="nui-fit">
				<div id="orgDimGrid" class="nui-datagrid" style="width: 100%; height: 100%;" sizeList="[50]" pageSize="50" dataField="trackDatas" idField="secOrgId"
					url="com.zhonghe.ame.contractPact.statisticalReport.orgDimOperatingIncomeTrack.biz.ext" ondrawcell="setBackGroundColor">
					<div property="columns">
						<div field="secOrgName" align="center" headerAlign="center" allowSort="true">单位</div>
						<div field="targetValue" align="center" headerAlign="center" dataType="currency">门槛值（万元）</div>
						<div field="thresholdValue" align="center" headerAlign="center" dataType="currency">期望值（万元）</div>
						<div field="cumulativeCompleted" align="center" headerAlign="center" dataType="currency">累计已完成（万元）</div>
						<div field="followUpCcompleted" align="center" headerAlign="center" dataType="currency">后续待完成（万元）</div>
						<div field="toBeSigned" align="center" headerAlign="center" dataType="currency">其中：待签合同收入（万元）</div>
						<div field="totalYear" align="center" headerAlign="center" dataType="currency">全年合计（万元）</div>
					</div>
				</div>
			</div>
		</div>

		<div name="majorDimTab" title="【专业类别】维度跟踪" visible="false">
			<div id="majorDimForm">
				<div class="nui-toolbar" style="border-bottom: 0; padding: 5px;">
					<table>
						<tr>
							<td style="width: 60px; text-align: right;">年份:</td>
							<td>
								<input id="majorDimYear" name="majorDimYear" class="nui-textbox" style="width: 150px" />
							</td>
							<td style="width: 60px; text-align: right;">集团内外:</td>
							<td style="width: 155px">
								<input id="majorDimGroup" name="majorDimGroup" class="nui-dictcombobox" dictTypeId="ZH_OPERATION_INCOME_GROUP" showNullItem="true" nullItemText="全部" style="width: 150px" />
							</td>
							<td>
								<a class="nui-button" id="majorDimSearch" iconCls="icon-search" onclick="majorDimSearch()">查询</a>
								<a class="nui-button" id="majorDimReset" iconCls="icon-reload" onclick="majorDimReset()">重置</a>
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
							<a class="nui-button" id="operatingIncomeTrack_major_add" iconCls="icon-add" onclick="majorDimAdd()">新增</a>
							<a class="nui-button" id="operatingIncomeTrack_major_edit" iconCls="icon-edit" onclick="majorDimAddEdit()">编辑</a>
							<a class="nui-button" id="orgDimExport" iconCls="icon-download" onclick="majorDimExportExcel()">导出</a>
						</td>
					</tr>
				</table>
			</div>

			<div class="nui-fit">
				<div id="majorDimGrid" class="nui-datagrid" style="width: 100%; height: 100%;" sizeList="[50]" pageSize="50" dataField="trackDatas" idField="majorId"
					url="com.zhonghe.ame.contractPact.statisticalReport.majorDimOperatingIncomeTrack.biz.ext" ondrawcell="setMajorBackGroundColor">
					<div property="columns">
						<div field="majorName" align="center" headerAlign="center" allowSort="true">专业类别</div>
						<div field="targetValue" align="center" headerAlign="center" dataType="currency">门槛值（万元）</div>
						<div field="thresholdValue" align="center" headerAlign="center" dataType="currency">期望值（万元）</div>
						<div field="cumulativeCompleted" align="center" headerAlign="center" dataType="currency">累计已完成（万元）</div>
						<div field="followUpCcompleted" align="center" headerAlign="center" dataType="currency">后续待完成（万元）</div>
						<div field="toBeSigned" align="center" headerAlign="center" dataType="currency">其中：待签合同收入（万元）</div>
						<div field="totalYear" align="center" headerAlign="center" dataType="currency">全年合计（万元）</div>
					</div>
				</div>
			</div>
		</div>

		<div name="groupDimTab" title="【集团内/外】维度跟踪" visible="false">
			<div id="groupDimForm">
				<div class="nui-toolbar" style="border-bottom: 0; padding: 5px;">
					<table>
						<tr>
							<td style="width: 60px; text-align: right;">年份:</td>
							<td>
								<input id="groupDimYear" name="groupDimYear" class="nui-textbox" style="width: 150px" />
							</td>
							<td>
								<a class="nui-button" id="groupDimSearch" iconCls="icon-search" onclick="groupDimSearch()">查询</a>
								<a class="nui-button" id="groupDimReset" iconCls="icon-reload" onclick="groupDimReset()">重置</a>
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
							<a class="nui-button" id="groupDimExport" iconCls="icon-download" onclick="groupDimExportExcel()">导出</a>
						</td>
					</tr>
				</table>
			</div>

			<div class="nui-fit">
				<div id="groupDimGrid" class="nui-datagrid" style="width: 100%; height: 100%;" sizeList="[50]" pageSize="50" dataField="trackDatas" idField="groupId"
					url="com.zhonghe.ame.contractPact.statisticalReport.groupDimOperatingIncomeTrack.biz.ext" ondrawcell="setGroupBackGroundColor">
					<div property="columns">
						<div field="groupName" align="center" headerAlign="center" allowSort="true">集团内/外</div>
						<div field="targetValue" align="center" headerAlign="center" dataType="currency">门槛值（万元）</div>
						<div field="thresholdValue" align="center" headerAlign="center" dataType="currency">期望值（万元）</div>
						<div field="cumulativeCompleted" align="center" headerAlign="center" dataType="currency">累计已完成（万元）</div>
						<div field="followUpCcompleted" align="center" headerAlign="center" dataType="currency">后续待完成（万元）</div>
						<div field="toBeSigned" align="center" headerAlign="center" dataType="currency">其中：待签合同收入（万元）</div>
						<div field="totalYear" align="center" headerAlign="center" dataType="currency">全年合计（万元）</div>
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
				if (userId != 'sysadmin') {
					// 新增按钮（单位维度） - operatingIncomeTrack_add，编辑按钮（单位维度） - operatingIncomeTrack_edit
					getOpeatorButtonAuth("operatingIncomeTrack_add,operatingIncomeTrack_edit");
				}
				var json = nui.encode({
					'loginUserId' : userId,
					'loginUserOrgId' : userOrgId,
					'authCode' : 'operatingIncomeTrack'
				});
				nui.ajax({
					url : "com.zhonghe.ame.contractPact.statisticalReport.queryOperatingIncomeTrackAuth.biz.ext",
					type : 'POST',
					data : json,
					contentType : 'text/json',
					success : function(o) {
						if (o.result == "2") {
							// 查看指定组织数据
							nui.get("authType").setValue("2");
							nui.get("secOrgId").setValue(o.secOrgId);
						} else if (o.result == "3") {
							// 不展现任何组织数据
							nui.get("authType").setValue("3");
						} else {
							// 查看所有组织数据
							nui.get("authType").setValue("1");
							var tabs = mini.get("tabs");
							var majorDimTab = tabs.getTab("majorDimTab");
							var groupDimTab = tabs.getTab("groupDimTab");
							tabs.updateTab(majorDimTab, {
								visible : true
							});
							tabs.updateTab(groupDimTab, {
								visible : true
							});
						}
						nui.get("orgDimYear").setValue(now.getFullYear());
						orgDimSearch();
					}
				});
			} else if (e.tab.title == "【专业类别】维度跟踪") {
				if (userId != 'sysadmin') {
					// 新增按钮（专业维度） - operatingIncomeTrack_major_add，编辑按钮（专业维度） - operatingIncomeTrack_major_edit
					getOpeatorButtonAuth("operatingIncomeTrack_major_add,operatingIncomeTrack_major_edit");
				}
				nui.get("majorDimYear").setValue(now.getFullYear());
				majorDimSearch();
			} else if (e.tab.title == "【集团内/外】维度跟踪") {
				nui.get("groupDimYear").setValue(now.getFullYear());
				groupDimSearch();
			}
		}

		function orgDimSearch() {
			var data = orgDimForm.getData();
			orgDimGrid.load(data);
		}

		function orgDimReset() {
			orgDimForm.reset();
			if (userId != 'sysadmin') {
				// 新增按钮（单位维度） - operatingIncomeTrack_add，编辑按钮（单位维度） - operatingIncomeTrack_edit
				getOpeatorButtonAuth("operatingIncomeTrack_add,operatingIncomeTrack_edit");
			}
			var json = nui.encode({
				'loginUserId' : userId,
				'loginUserOrgId' : userOrgId,
				'authCode' : 'operatingIncomeTrack'
			});
			nui.ajax({
				url : "com.zhonghe.ame.contractPact.statisticalReport.queryOperatingIncomeTrackAuth.biz.ext",
				type : 'POST',
				data : json,
				contentType : 'text/json',
				success : function(o) {
					if (o.result == "2") {
						// 查看指定组织数据
						nui.get("authType").setValue("2");
						nui.get("secOrgId").setValue(o.secOrgId);
					} else if (o.result == "3") {
						// 不展现任何组织数据
						nui.get("authType").setValue("3");
					} else {
						// 查看所有组织数据
						nui.get("authType").setValue("1");
						var tabs = mini.get("tabs");
						var majorDimTab = tabs.getTab("majorDimTab");
						var groupDimTab = tabs.getTab("groupDimTab");
						tabs.updateTab(majorDimTab, {
							visible : true
						});
						tabs.updateTab(groupDimTab, {
							visible : true
						});
					}
					nui.get("orgDimYear").setValue(now.getFullYear());
					orgDimSearch();
				}
			});
		}

		function majorDimSearch() {
			var data = majorDimForm.getData();
			majorDimGrid.load(data);
		}

		function majorDimReset() {
			majorDimForm.reset();
			if (userId != 'sysadmin') {
				// 新增按钮（专业维度） - operatingIncomeTrack_major_add，编辑按钮（专业维度） - operatingIncomeTrack_major_edit
				getOpeatorButtonAuth("operatingIncomeTrack_major_add,operatingIncomeTrack_major_edit");
			}
			nui.get("majorDimYear").setValue(now.getFullYear());
			majorDimSearch();
		}

		function groupDimSearch() {
			var data = groupDimForm.getData();
			groupDimGrid.load(data);
		}

		function groupDimReset() {
			groupDimForm.reset();
			nui.get("groupDimYear").setValue(now.getFullYear());
			groupDimSearch();
		}

		function orgDimAdd() {
			nui.open({
				url : "/default/contractPact/statisticalReport/operatingIncome/addOrgDimThreshold.jsp",
				width : '450px',
				height : '300px',
				title : "新增单位年度门槛值及期望值",
				onload : function() {
					var iframe = this.getIFrameEl();
				},
				ondestroy : function(action) {
					orgDimSearch();
				}
			})
		}

		function majorDimAdd() {
			nui.open({
				url : "/default/contractPact/statisticalReport/operatingIncome/addMajorDimThreshold.jsp",
				width : '450px',
				height : '280px',
				title : "新增专业类别年度门槛值及期望值",
				onload : function() {
					var iframe = this.getIFrameEl();
				},
				ondestroy : function(action) {
					majorDimSearch();
				}
			})
		}

		function orgDimAddEdit() {
			var row = orgDimGrid.getSelecteds();
			if (row.length > 1 || row.length == 0) {
				showTips("只能选中一条记录进行编辑", "danger");
				return;
			} else {
				var data = row[0];
				if (data.secOrgName == "合计") {
					showTips("只能选中一条记录进行编辑", "danger");
					return;
				} else {
					var json = nui.encode({
						'years' : nui.get("orgDimYear").getValue(),
						'secOrg' : data.secOrgId
					});
					nui.ajax({
						url : "com.zhonghe.ame.contractPact.statisticalReport.queryOrgDimThreshold.biz.ext",
						type : 'POST',
						data : json,
						contentType : 'text/json',
						success : function(o) {
							if (o.result == "1") {
								nui.open({
									url : "/default/contractPact/statisticalReport/operatingIncome/editOrgDimThreshold.jsp",
									width : '450px',
									height : '280px',
									title : "编辑单位年度门槛值及期望值",
									onload : function() {
										var iframe = this.getIFrameEl();
										iframe.contentWindow.setEditData(o.data);
									},
									ondestroy : function(action) {
										orgDimSearch();
									}
								})
							} else {
								showTips("无法编辑，请联系管理员！", "danger");
							}
						}
					});
				}
			}
		}

		function majorDimAddEdit() {
			var row = majorDimGrid.getSelecteds();
			if (row.length > 1 || row.length == 0) {
				showTips("只能选中一条记录进行编辑", "danger");
				return;
			} else {
				var data = row[0];
				if (data.majorName == "合计") {
					showTips("只能选中一条记录进行编辑", "danger");
					return;
				} else {
					var json = nui.encode({
						'years' : nui.get("majorDimYear").getValue(),
						'majorId' : data.majorId
					});
					nui.ajax({
						url : "com.zhonghe.ame.contractPact.statisticalReport.queryMajorDimThreshold.biz.ext",
						type : 'POST',
						data : json,
						contentType : 'text/json',
						success : function(o) {
							if (o.result == "1") {
								nui.open({
									url : "/default/contractPact/statisticalReport/operatingIncome/editMajorDimThreshold.jsp",
									width : '450px',
									height : '280px',
									title : "编辑专业类别年度门槛值及期望值",
									onload : function() {
										var iframe = this.getIFrameEl();
										iframe.contentWindow.setEditData(o.data);
									},
									ondestroy : function(action) {
										majorDimSearch();
									}
								})
							} else {
								showTips("无法编辑，请联系管理员！", "danger");
							}
						}
					});
				}
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
				url : "com.zhonghe.ame.contractPact.statisticalReport.exportOrgDimOperatingIncomeTrackExcel.biz.ext",
				type : "post",
				data : json,
				cache : false,
				contentType : 'text/json',
				success : function(o) {
					var filePath = o.downloadFile;
					var fileName = "营业收入跟踪";
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
				url : "com.zhonghe.ame.contractPact.statisticalReport.exportMajorDimOperatingIncomeTrackExcel.biz.ext",
				type : "post",
				data : json,
				cache : false,
				contentType : 'text/json',
				success : function(o) {
					var filePath = o.downloadFile;
					var fileName = "营业收入跟踪";
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
				url : "com.zhonghe.ame.contractPact.statisticalReport.exportGroupDimOperatingIncomeTrackExcel.biz.ext",
				type : "post",
				data : json,
				cache : false,
				contentType : 'text/json',
				success : function(o) {
					var filePath = o.downloadFile;
					var fileName = "营业收入跟踪";
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
	</script>

</body>
</html>