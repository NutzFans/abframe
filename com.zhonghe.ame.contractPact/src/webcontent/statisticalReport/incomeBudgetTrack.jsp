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
							<a class="nui-button" id="orgDimExport" iconCls="icon-download" onclick="orgDimExportExcel()">导出</a>
						</td>
					</tr>
				</table>
			</div>

			<div class="nui-fit">
				<div id="orgDimGrid" class="nui-datagrid" style="width: 100%; height: 100%;" sizeList="[50]" pageSize="50" dataField="trackDatas" idField="secOrgId"
					url="com.zhonghe.ame.contractPact.statisticalReport.orgDimIncomeBudgetTrack.biz.ext" frozenStartColumn="0" frozenEndColumn="0" ondrawcell="setBackGroundColor">
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
							<a class="nui-button" id="majorDimExport" iconCls="icon-download" onclick="majorDimExportExcel()">导出</a>
						</td>
					</tr>
				</table>
			</div>

			<div class="nui-fit">
				<div id="majorDimGrid" class="nui-datagrid" style="width: 100%; height: 100%;" sizeList="[50]" pageSize="50" dataField="trackDatas" idField="majorId"
					url="com.zhonghe.ame.contractPact.statisticalReport.majorDimIncomeBudgetTrack.biz.ext" frozenStartColumn="0" frozenEndColumn="0" ondrawcell="setMajorBackGroundColor">
					<div property="columns">
						<div field="majorName" width="250" align="center" headerAlign="center">专业类别</div>
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
					url="com.zhonghe.ame.contractPact.statisticalReport.groupDimIncomeBudgetTrack.biz.ext" frozenStartColumn="0" frozenEndColumn="0" ondrawcell="setGroupBackGroundColor">
					<div property="columns">
						<div field="groupName" width="250" align="center" headerAlign="center">集团内/外</div>
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
				var json = nui.encode({
					'loginUserId' : userId,
					'loginUserOrgId' : userOrgId,
					'authCode' : 'incomeBudgetTrack'
				});
				nui.ajax({
					url : "com.zhonghe.ame.contractPact.statisticalReport.queryIncomeBudgetTrackAuth.biz.ext",
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
			var json = nui.encode({
				'loginUserId' : userId,
				'loginUserOrgId' : userOrgId,
				'authCode' : 'incomeBudgetTrack'
			});
			nui.ajax({
				url : "com.zhonghe.ame.contractPact.statisticalReport.queryIncomeBudgetTrackAuth.biz.ext",
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
				url : "com.zhonghe.ame.contractPact.statisticalReport.exportOrgDimIncomeBudgetTrackExcel.biz.ext",
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

		function majorDimExportExcel() {
			if (!confirm("是否确认导出？")) {
				return;
			}
			var majorDimForm = new nui.Form("#majorDimForm");
			var data = majorDimForm.getData(); //获取表单JS对象数据
			var json = nui.encode(data);
			nui.ajax({
				url : "com.zhonghe.ame.contractPact.statisticalReport.exportMajorDimIncomeBudgetTrackExcel.biz.ext",
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

		function groupDimExportExcel() {
			if (!confirm("是否确认导出？")) {
				return;
			}
			var groupDimForm = new nui.Form("#groupDimForm");
			var data = groupDimForm.getData(); //获取表单JS对象数据
			var json = nui.encode(data);
			nui.ajax({
				url : "com.zhonghe.ame.contractPact.statisticalReport.exportGroupDimIncomeBudgetTrackExcel.biz.ext",
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
	</script>

</body>
</html>