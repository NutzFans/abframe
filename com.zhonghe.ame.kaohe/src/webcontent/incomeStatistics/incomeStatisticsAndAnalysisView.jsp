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
<title>指标分析预测及统计明细</title>
</head>
<body>
	<div style="width: auto; height: 99%; padding: 5px;">
		<div class="nui-toolbar" style="border-bottom: 0; padding: 5px; background: #f1f2f6;">
			<span id="khny" style="font-size: 14px; margin-left: 10px; font-weight: bold;"></span>
			<span id="khdw" style="font-size: 14px; margin-left: 20px; font-weight: bold;"></span>
		</div>
		<div class="nui-toolbar" style="border-bottom: 0; padding: 5px; text-align: center; background: #f1f2f6;">
			<span style="font-size: 14px; font-weight: bold;">收入指标分析预测</span>
		</div>
		<div class="nui-toolbar" style="border-bottom: 0; padding: 5px; background: #f1f2f6;">
			<span style="margin-left: 10px; font-weight: bold;">表1：营业收入（单位：万元）</span>
		</div>
		<div>
			<div id="operatingRevenueGrid" class="nui-datagrid" showPager="false" style="width: 100%; height: 90px;" url="com.zhonghe.ame.kaohe.incomeStatistics.queryOperatingRevenue.biz.ext"
				dataField="operatingRevenueList">
				<div property="columns">
					<div field="expectedValue" headerAlign="center" align="center" dataType="currency">期望值</div>
					<div header="全年预测及缺口情况" headerAlign="center" align="center">
						<div property="columns">
							<div field="annualForecastedBookValue" headerAlign="center" align="center" dataType="currency">全年预测（账面值）</div>
							<div field="annualForecastAssessmentValue" headerAlign="center" align="center" dataType="currency">全年预测（考核值）</div>
							<div field="assessmentValueGap" headerAlign="center" align="center" renderer="FONT_COLOR" dataType="currency">考核值缺口</div>
						</div>
					</div>
					<div header="已完成情况" headerAlign="center" align="center">
						<div property="columns">
							<div field="asOfTheCurrentMonthTheBookValueHasBeenCompleted" headerAlign="center" align="center" dataType="currency">截至当月已完成（账面值）</div>
							<div field="asOfTheCurrentMonthTheAssessmentValuesHaveBeenCompleted" headerAlign="center" align="center" dataType="currency">截至当月已完成（考核值）</div>
							<div field="assessmentCompletionRate" headerAlign="center" align="center">考核值完成率</div>
						</div>
					</div>
					<div header="后续待完成分解" headerAlign="center" align="center">
						<div property="columns">
							<div field="totalToBeCompletedInTheFuture" headerAlign="center" align="center" dataType="currency">后续待完成合计</div>
							<div field="totalHandheldContractAmount" headerAlign="center" align="center" dataType="currency">（1）手持合同</div>
							<div field="totalAmountOfPendingContractToBeSigned" headerAlign="center" align="center" dataType="currency">（2）待签合同</div>
							<div field="totalAmountOfLowriskContractToBeSigned" headerAlign="center" align="center" dataType="currency">待签：低风险</div>
							<div field="totalAmountOfRiskContractsToBeSigned" headerAlign="center" align="center" dataType="currency">待签：中风险</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="nui-toolbar" style="border-bottom: 0; margin-top: 10px; padding: 5px; background: #f1f2f6;">
			<span style="margin-left: 10px; font-weight: bold;">表2：集团外收入（单位：万元）</span>
		</div>
		<div>
			<div id="externalIncomeOfTheGroupGrid" class="nui-datagrid" showPager="false" style="width: 100%; height: 90px;" url="com.zhonghe.ame.kaohe.incomeStatistics.queryExternalIncomeOfTheGroup.biz.ext"
				dataField="externalIncomeOfTheGroupList">
				<div property="columns">
					<div field="expectedValue" headerAlign="center" align="center" dataType="currency">期望值</div>
					<div header="全年预测及缺口情况" headerAlign="center" align="center">
						<div property="columns">
							<div field="annualForecastedBookValue" headerAlign="center" align="center" dataType="currency">全年预测（账面值）</div>
							<div field="annualForecastAssessmentValue" headerAlign="center" align="center" dataType="currency">全年预测（考核值）</div>
							<div field="assessmentValueGap" headerAlign="center" align="center" renderer="FONT_COLOR" dataType="currency">考核值缺口</div>
						</div>
					</div>
					<div header="已完成情况" headerAlign="center" align="center">
						<div property="columns">
							<div field="asOfTheCurrentMonthTheBookValueHasBeenCompleted" headerAlign="center" align="center" dataType="currency">截至当月已完成（账面值）</div>
							<div field="asOfTheCurrentMonthTheAssessmentValuesHaveBeenCompleted" headerAlign="center" align="center" dataType="currency">截至当月已完成（考核值）</div>
							<div field="assessmentCompletionRate" headerAlign="center" align="center">考核值完成率</div>
						</div>
					</div>
					<div header="后续待完成分解" headerAlign="center" align="center">
						<div property="columns">
							<div field="totalToBeCompletedInTheFuture" headerAlign="center" align="center" dataType="currency">后续待完成合计</div>
							<div field="totalHandheldContractAmount" headerAlign="center" align="center" dataType="currency">（1）手持合同</div>
							<div field="totalAmountOfPendingContractToBeSigned" headerAlign="center" align="center" dataType="currency">（2）待签合同</div>
							<div field="totalAmountOfLowriskContractToBeSigned" headerAlign="center" align="center" dataType="currency">待签：低风险</div>
							<div field="totalAmountOfRiskContractsToBeSigned" headerAlign="center" align="center" dataType="currency">待签：中风险</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id=statisticsSnapshotDetailForm>
			<input id="statisticsSnapshotDetailYears" name="criteria._expr[0].years" class="nui-hidden" />
			<input id="statisticsSnapshotDetailMonths" name="criteria._expr[1].months" class="nui-hidden" />
			<input id="statisticsSnapshotDetailSecondaryOrg" name="criteria._expr[2].secondaryOrg" class="nui-hidden" />
			<input name="criteria._expr[4]._op" value="like" class="nui-hidden"/>
			<div class="nui-toolbar" style="border-bottom: 0; margin-top: 10px; padding: 5px; text-align: center; background: #f1f2f6;">
				<div style="display: inline; float: left;">
					<input name="criteria._expr[3].contractStauts" class="nui-dictcombobox" dictTypeId="ZH_CONTRACT_STATUS_KAOHE" showNullItem="true" emptyText="合同状态" width="75" onvaluechanged="statisticsSnapshotDetailSearch"/>
				</div>
				<div style="display: inline; float: left; margin-left: 5px">
					<input name="criteria._expr[4].contractName" class="nui-textbox" width="200" emptyText="合同名称(回车查询)" onvaluechanged="statisticsSnapshotDetailSearch"/>
				</div>
				<div style="display: inline; float: left; margin-left: 5px">
					<input name="criteria._expr[5].headquarterGroup" class="nui-dictcombobox" dictTypeId="ZH_GROUP" showNullItem="true" emptyText="集团内外" width="75" onvaluechanged="statisticsSnapshotDetailSearch"/>
				</div>
				<div style="display: inline; float: left; margin-left: 5px">
					<input name="criteria._expr[6].riskLevel" class="nui-dictcombobox" dictTypeId="RISK_LEVEL" showNullItem="true" emptyText="风险等级" width="75" onvaluechanged="statisticsSnapshotDetailSearch"/>
				</div>
				<span style="font-size: 14px; font-weight: bold;">考核收入统计明细</span>
			</div>
		</div>
		<div class="nui-fit">
			<div id="statisticsSnapshotDetailGrid" sizeList="[1000]" pageSize="1000" class="nui-datagrid" style="width: 100%; height: 98%" showSummaryRow="true" virtualScroll="true" virtualColumns="true"
				frozenStartColumn="0" frozenEndColumn="9" url="com.zhonghe.ame.kaohe.incomeStatistics.queryStatisticsSnapshotDetailListBySec.biz.ext" dataField="statisticsSnapshotDetailList">
				<div property="columns">
					<div field="contractStauts" headerAlign="center" align="center" width="75" renderer="ZH_CONTRACT_STATUS_KAOHE">合同状态</div>
					<div field="contractNo" headerAlign="center" align="center" width="200">合同编号</div>
					<div field="contractName" headerAlign="center" align="center" width="200">合同名称</div>
					<div field="createUsername" headerAlign="center" align="center" width="60">经办人</div>
					<div field="signatoryName" headerAlign="center" align="center" width="200">付款单位</div>
					<div field="sum" headerAlign="center" align="center" width="135" summaryType="sum" dataType="currency">全年计划收款金额（元）</div>
					<div field="sumExcludeTax" headerAlign="center" align="center" width="135" summaryType="sum" dataType="currency">全年计划收入金额（元）</div>
					<div field="sumTotalBookIncome" headerAlign="center" align="center" width="150" summaryType="sum" dataType="currency">截至当月已完成收入（元）</div>
					<div field="coefficient" headerAlign="center" align="center" width="60">系数</div>
					<div field="coefficientSum" headerAlign="center" align="center" width="145" summaryType="sum" dataType="currency">全年营业收入考核值（元）</div>
					<div field="jan" headerAlign="center" align="center" summaryType="sum" dataType="currency">1月(不含税)</div>
					<div field="feb" headerAlign="center" align="center" summaryType="sum" dataType="currency">2月(不含税)</div>
					<div field="mar" headerAlign="center" align="center" summaryType="sum" dataType="currency">3月(不含税)</div>
					<div field="apr" headerAlign="center" align="center" summaryType="sum" dataType="currency">4月(不含税)</div>
					<div field="may" headerAlign="center" align="center" summaryType="sum" dataType="currency">5月(不含税)</div>
					<div field="jun" headerAlign="center" align="center" summaryType="sum" dataType="currency">6月(不含税)</div>
					<div field="jul" headerAlign="center" align="center" summaryType="sum" dataType="currency">7月(不含税)</div>
					<div field="aug" headerAlign="center" align="center" summaryType="sum" dataType="currency">8月(不含税)</div>
					<div field="sep" headerAlign="center" align="center" summaryType="sum" dataType="currency">9月(不含税)</div>
					<div field="oct" headerAlign="center" align="center" summaryType="sum" dataType="currency">10月(不含税)</div>
					<div field="nov" headerAlign="center" align="center" summaryType="sum" dataType="currency">11月(不含税)</div>
					<div field="dec" headerAlign="center" align="center" summaryType="sum" dataType="currency">12月(不含税)</div>
					<div field="headquarterGroup" headerAlign="center" align="center" renderer="ZH_GROUP">集团内外</div>
					<div field="riskLevel" headerAlign="center" align="center" renderer="RISK_LEVEL">风险等级</div>
					<div field="estimatedDate" headerAlign="center" align="center">预计签署日期</div>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		var reqId ='<%=request.getParameter("id")%>';

		nui.parse();
		var statisticsSnapshotDetailForm = new nui.Form("#statisticsSnapshotDetailForm");
		var operatingRevenueGrid = nui.get("operatingRevenueGrid");
		var externalIncomeOfTheGroupGrid = nui.get("externalIncomeOfTheGroupGrid");
		var statisticsSnapshotDetailGrid = nui.get("statisticsSnapshotDetailGrid");

		init();

		function init() {
			nui.mask({
				el : document.body,
				cls : 'mini-mask-loading',
				html : '数据加载中...'
			});
			var json = nui.encode({
				"id" : reqId
			});
			ajaxCommon({
				"url" : "com.zhonghe.ame.kaohe.incomeStatistics.queryStatisticsSnapshotById.biz.ext",
				data : json,
				contentType : 'text/json',
				success : function(result) {
					var data = result.statisticsSnapshot;
					$("#khny").text("考核年月：" + data.years + "年" + data.months + "月");
					$("#khdw").text("考核单位：" + data.secondaryOrgname);
					operatingRevenueGrid.load({
						"year" : data.years,
						"month" : data.months,
						"secOrg" : data.secondaryOrg
					});
					externalIncomeOfTheGroupGrid.load({
						"year" : data.years,
						"month" : data.months,
						"secOrg" : data.secondaryOrg
					});
					nui.get("statisticsSnapshotDetailYears").setValue(data.years);
					nui.get("statisticsSnapshotDetailMonths").setValue(data.months);
					nui.get("statisticsSnapshotDetailSecondaryOrg").setValue(data.secondaryOrg);
					var searchData = statisticsSnapshotDetailForm.getData();
					statisticsSnapshotDetailGrid.sortBy("contractStauts", "asc");
					statisticsSnapshotDetailGrid.load(searchData);
					nui.unmask(document.body);
				}
			});
		}

		function ZH_CONTRACT_STATUS_KAOHE(e) {
			if (e.value == '1') {
				e.cellStyle = "color: green";
			} else {
				e.cellStyle = "color: red";
			}
			return nui.getDictText("ZH_CONTRACT_STATUS_KAOHE", e.value);
		}

		function ZH_GROUP(e) {
			return nui.getDictText("ZH_GROUP", e.value);
		}

		function RISK_LEVEL(e) {
			return nui.getDictText("RISK_LEVEL", e.value);
		}

		function FONT_COLOR(e) {
			if (e.value < 0) {
				e.cellStyle = "color: red";
			}
			return e.value;
		}

		function statisticsSnapshotDetailSearch() {
			var searchData = statisticsSnapshotDetailForm.getData();
			statisticsSnapshotDetailGrid.sortBy("contractStauts", "asc");
			statisticsSnapshotDetailGrid.load(searchData);
		}
	</script>

</body>
</html>