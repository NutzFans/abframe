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

.mini-grid-summaryCell {
	text-align: center;
}
</style>
<head>
<title>考核收入统计</title>
</head>
<body>
	<div id="tabs" class="nui-tabs" activeIndex="0" style="width: auto; height: 99%; padding: 5px;" onactivechanged="tabActiveChanged">
		<div title="考核收入统计快照">
			<div id="statisticsForm">
				<input name="criteria._expr[0]._property" value="secondaryOrg" class="nui-hidden" />
				<input name="criteria._expr[0]._op" value="in" class="nui-hidden" />
				<input id="searchOrgids" name="criteria._expr[0]._value" class="nui-hidden" />
				<div class="nui-toolbar" style="border-bottom: 0; padding: 5px;">
					<table>
						<tr>
							<td style="width: 60px; text-align: right;">考核年份:</td>
							<td>
								<input id="years" name="criteria._expr[1].years" class="nui-textbox" style="width: 100px" />
							</td>
							<td style="width: 60px; text-align: right;">考核月份:</td>
							<td>
								<input id="months" name="criteria._expr[2].months" class="nui-textbox" style="width: 100px" />
							</td>
							<td style="width: 60px; text-align: right;">考核单位:</td>
							<td>
								<input id="secondaryOrg" name="criteria._expr[3].secondaryOrg" class="nui-combobox" textField="secOrgname" valueField="secOrg" style="width: 200px" showNullItem="true" />
							</td>
							<td>
								<a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查询</a>
								<a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset()">重置</a>
							</td>
						</tr>
					</table>
				</div>
			</div>

			<div class="nui-toolbar" style="border-bottom: 0; padding: 5px;">
				<table style="width: 100%;">
					<tr>
						<td>
							<a class="nui-button" id="khsrtj_sckz" iconCls="icon-add" onclick="sckz()">生成快照</a>
							<a class="nui-button" id="khsrtj_del" iconCls="icon-remove" onclick="khsrtj_del()">删除</a>
						</td>
					</tr>
				</table>
			</div>

			<div class="nui-fit">
				<div id="statisticsGrid" sizeList="[50,100,500]" showPager="true" multiSelect="true" dataField="statisticsSnapshotList" pageSize="50" class="nui-datagrid" style="width: 100%; height: 100%;"
					url="com.zhonghe.ame.kaohe.incomeStatistics.queryStatisticsSnapshotList.biz.ext">
					<div property="columns">
						<div type="checkcolumn"></div>
						<div field="secondaryOrgname" width="200" headerAlign="center" allowSort="true" align="center">考核单位</div>
						<div field="years" width="80" headerAlign="center" allowSort="true" align="center">考核年份</div>
						<div field="months" width="80" headerAlign="center" allowSort="true" align="center">考核月份</div>
						<div width="100" headerAlign="center" align="center" renderer="StatisticsAndAnalysis">收入指标分析预测及统计明细</div>
						<div field="snapshotMethod" width="100" headerAlign="center" allowSort="true" align="center">快照生成方式</div>
						<div field="createBy" width="100" headerAlign="center" allowSort="true" align="center">快照生成人员</div>
						<div field="createTime" width="100" headerAlign="center" allowSort="true" align="center">快照生成时间</div>
					</div>
				</div>
			</div>
		</div>

		<div name="srzbfxycDimTab" title="收入指标分析预测" visible="false">
			<div id="srzbfxycForm">
				<div class="nui-toolbar" style="border-bottom: 0; padding: 5px;">
					<table>
						<tr>
							<td style="width: 60px; text-align: right;">考核年份:</td>
							<td>
								<input id="srzbfxycYears" class="nui-textbox" style="width: 100px" />
							</td>
							<td style="width: 60px; text-align: right;">考核月份:</td>
							<td>
								<input id="srzbfxycMonths" class="nui-textbox" style="width: 100px" />
							</td>
							<td style="width: 60px; text-align: right;">考核单位:</td>
							<td>
								<input id="srzbfxycSecondaryOrg" class="nui-combobox" textField="secOrgname" valueField="secOrg" style="width: 200px" showNullItem="true" />
							</td>
							<td>
								<a class="nui-button" id="srzbfxycSearch" iconCls="icon-search" onclick="srzbfxycSearch()">查询</a>
								<a class="nui-button" id="srzbfxycReset" iconCls="icon-reload" onclick="srzbfxycReset()">重置</a>
								<a class="nui-button" id="srzbfxycExport" iconCls="icon-download" onclick="srzbfxycExport()">导出</a>
							</td>
						</tr>
					</table>
				</div>
			</div>

			<div class="nui-toolbar" style="border-bottom: 0; padding: 5px; background: #f1f2f6;">
				<span style="margin-left: 10px; font-weight: bold;">表1：营业收入（单位：万元）</span>
			</div>
			<div>
				<div id="operatingRevenueGrid" class="nui-datagrid" showPager="false" showSummaryRow="true" style="width: 100%;" url="com.zhonghe.ame.kaohe.incomeStatistics.queryOperatingRevenue.biz.ext"
					dataField="operatingRevenueList" frozenStartColumn="0" frozenEndColumn="1">
					<div property="columns">
						<div field="secondaryOrgname" headerAlign="center" align="center" width="150">考核单位</div>
						<div field="expectedValue" headerAlign="center" align="center" width="100" summaryType="sum" dataType="currency">期望值</div>
						<div header="全年预测及缺口情况" headerAlign="center" align="center">
							<div property="columns">
								<div field="annualForecastedBookValue" headerAlign="center" align="center" summaryType="sum" dataType="currency" width="120">全年预测（账面值）</div>
								<div field="annualForecastAssessmentValue" headerAlign="center" align="center" summaryType="sum" dataType="currency" width="120">全年预测（考核值）</div>
								<div field="assessmentValueGap" headerAlign="center" align="center" renderer="FONT_COLOR" summaryType="sum" dataType="currency">考核值缺口</div>
							</div>
						</div>
						<div header="已完成情况" headerAlign="center" align="center">
							<div property="columns">
								<div field="asOfTheCurrentMonthTheBookValueHasBeenCompleted" headerAlign="center" align="center" width="150" summaryType="sum" dataType="currency">截至当月已完成（账面值）</div>
								<div field="asOfTheCurrentMonthTheAssessmentValuesHaveBeenCompleted" headerAlign="center" align="center" width="150" summaryType="sum" dataType="currency">截至当月已完成（考核值）</div>
								<div field="assessmentCompletionRate" headerAlign="center" align="center">考核值完成率</div>
							</div>
						</div>
						<div header="后续待完成分解" headerAlign="center" align="center">
							<div property="columns">
								<div field="totalToBeCompletedInTheFuture" headerAlign="center" align="center" summaryType="sum" dataType="currency">后续待完成合计</div>
								<div field="totalHandheldContractAmount" headerAlign="center" align="center" summaryType="sum" dataType="currency">（1）手持合同</div>
								<div field="totalAmountOfPendingContractToBeSigned" headerAlign="center" align="center" summaryType="sum" dataType="currency">（2）待签合同</div>
								<div field="totalAmountOfLowriskContractToBeSigned" headerAlign="center" align="center" summaryType="sum" dataType="currency">待签：低风险</div>
								<div field="totalAmountOfRiskContractsToBeSigned" headerAlign="center" align="center" summaryType="sum" dataType="currency">待签：中风险</div>
							</div>
						</div>
						<div header="本年考核运用（年底考核期使用）" headerAlign="center" align="center" headerStyle="background-color: #e6f7ff">
							<div property="columns">
								<div field="annualForecastAssessmentValue" headerAlign="center" align="center" summaryType="sum" dataType="currency" renderer="FONT_COLOR_ALL" headerStyle="background-color: #e6f7ff">营业收入考核值</div>
								<div field="totalAmountOfAssessmentDeductionRegulation" headerAlign="center" summaryType="sum" align="center" dataType="currency" headerStyle="background-color: #e6f7ff">其中：扣减调控</div>
								<div field="totalAmountOfAssessmentOfThisYearSRegulation" headerAlign="center" summaryType="sum" align="center" dataType="currency" headerStyle="background-color: #e6f7ff">其中：本年调控</div>
								<div field="totalAmountOfAssessingVirtualOutputValue" headerAlign="center" align="center" summaryType="sum" dataType="currency" headerStyle="background-color: #e6f7ff">其中：虚拟产值</div>
								<div field="totalAmountOfAssessmentIncomeCorrection" headerAlign="center" summaryType="sum" align="center" dataType="currency" headerStyle="background-color: #e6f7ff">其中：收入纠偏</div>
								<div field="totalAmountOfOperatingLoans" headerAlign="center" summaryType="sum" align="center" dataType="currency" headerStyle="background-color: #e6f7ff">其中：经营借款</div>
								<div field="totalAmountOfAssessOthers" headerAlign="center" align="center" summaryType="sum" dataType="currency" headerStyle="background-color: #e6f7ff">其中：其他</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="nui-toolbar" style="border-bottom: 0; margin-top: 10px; padding: 5px; background: #f1f2f6;">
				<span style="margin-left: 10px; font-weight: bold;">表2：集团外收入（单位：万元）</span>
			</div>
			<div>
				<div id="externalIncomeOfTheGroupGrid" class="nui-datagrid" showPager="false" showSummaryRow="true" style="width: 100%;"
					url="com.zhonghe.ame.kaohe.incomeStatistics.queryExternalIncomeOfTheGroup.biz.ext" dataField="externalIncomeOfTheGroupList" frozenStartColumn="0" frozenEndColumn="1">
					<div property="columns">
						<div field="secondaryOrgname" headerAlign="center" align="center" width="150">考核单位</div>
						<div field="expectedValue" headerAlign="center" align="center" width="100" summaryType="sum" dataType="currency">期望值</div>
						<div header="全年预测及缺口情况" headerAlign="center" align="center">
							<div property="columns">
								<div field="annualForecastedBookValue" headerAlign="center" align="center" summaryType="sum" dataType="currency" width="120">全年预测（账面值）</div>
								<div field="annualForecastAssessmentValue" headerAlign="center" align="center" summaryType="sum" dataType="currency" width="120">全年预测（考核值）</div>
								<div field="assessmentValueGap" headerAlign="center" align="center" renderer="FONT_COLOR" summaryType="sum" dataType="currency">考核值缺口</div>
							</div>
						</div>
						<div header="已完成情况" headerAlign="center" align="center">
							<div property="columns">
								<div field="asOfTheCurrentMonthTheBookValueHasBeenCompleted" headerAlign="center" align="center" width="150" summaryType="sum" dataType="currency">截至当月已完成（账面值）</div>
								<div field="asOfTheCurrentMonthTheAssessmentValuesHaveBeenCompleted" headerAlign="center" align="center" width="150" summaryType="sum" dataType="currency">截至当月已完成（考核值）</div>
								<div field="assessmentCompletionRate" headerAlign="center" align="center">考核值完成率</div>
							</div>
						</div>
						<div header="后续待完成分解" headerAlign="center" align="center">
							<div property="columns">
								<div field="totalToBeCompletedInTheFuture" headerAlign="center" align="center" summaryType="sum" dataType="currency">后续待完成合计</div>
								<div field="totalHandheldContractAmount" headerAlign="center" align="center" summaryType="sum" dataType="currency">（1）手持合同</div>
								<div field="totalAmountOfPendingContractToBeSigned" headerAlign="center" align="center" summaryType="sum" dataType="currency">（2）待签合同</div>
								<div field="totalAmountOfLowriskContractToBeSigned" headerAlign="center" align="center" summaryType="sum" dataType="currency">待签：低风险</div>
								<div field="totalAmountOfRiskContractsToBeSigned" headerAlign="center" align="center" summaryType="sum" dataType="currency">待签：中风险</div>
							</div>
						</div>
						<div header="本年考核运用（年底考核期使用）" headerAlign="center" align="center">
							<div property="columns">
								<div field="annualForecastAssessmentValue" headerAlign="center" align="center" summaryType="sum" dataType="currency" renderer="FONT_COLOR_ALL" headerStyle="background-color: #e6f7ff">营业收入考核值</div>
								<div field="totalAmountOfAssessmentDeductionRegulation" headerAlign="center" summaryType="sum" align="center" dataType="currency" headerStyle="background-color: #e6f7ff">其中：扣减调控</div>
								<div field="totalAmountOfAssessmentOfThisYearSRegulation" headerAlign="center" summaryType="sum" align="center" dataType="currency" headerStyle="background-color: #e6f7ff">其中：本年调控</div>
								<div field="totalAmountOfAssessingVirtualOutputValue" headerAlign="center" align="center" summaryType="sum" dataType="currency" headerStyle="background-color: #e6f7ff">其中：虚拟产值</div>
								<div field="totalAmountOfAssessmentIncomeCorrection" headerAlign="center" summaryType="sum" align="center" dataType="currency" headerStyle="background-color: #e6f7ff">其中：收入纠偏</div>
								<div field="totalAmountOfOperatingLoans" headerAlign="center" summaryType="sum" align="center" dataType="currency" headerStyle="background-color: #e6f7ff">其中：经营借款</div>
								<div field="totalAmountOfAssessOthers" headerAlign="center" align="center" summaryType="sum" dataType="currency" headerStyle="background-color: #e6f7ff">其中：其他</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div name="khsrtjmxDimTab" title="考核收入统计明细" visible="false">
			<div id="khsrtjmxForm">
				<div class="nui-toolbar" style="border-bottom: 0; padding: 5px;">
					<table>
						<tr>
							<td style="width: 60px; text-align: right;">考核年份:</td>
							<td>
								<input id="khsrtjmxYears" name="criteria._expr[1].years" class="nui-textbox" style="width: 100px" />
							</td>
							<td style="width: 60px; text-align: right;">考核月份:</td>
							<td>
								<input id="khsrtjmxMonths" name="criteria._expr[2].months" class="nui-textbox" style="width: 100px" />
							</td>
							<td style="width: 60px; text-align: right;">考核单位:</td>
							<td>
								<input id="khsrtjmxSecondaryOrg" name="criteria._expr[3].secondaryOrg" class="nui-combobox" textField="secOrgname" valueField="secOrg" style="width: 200px" showNullItem="true" />
							</td>
							<td style="width: 60px; text-align: right;">合同状态:</td>
							<td>
								<input name="criteria._expr[4].contractStauts" class="nui-dictcombobox" dictTypeId="ZH_CONTRACT_STATUS_KAOHE" showNullItem="true" style="width: 100px" />
							</td>
							<td style="width: 60px; text-align: right;">合同名称 :</td>
							<td>
								<input name="criteria._expr[5].contractName" class="nui-textbox" style="width: 200px" />
								<input name="criteria._expr[5]._op" value="like" class="nui-hidden" />
							</td>
							<td style="width: 60px; text-align: right;">集团内外:</td>
							<td>
								<input name="criteria._expr[6].headquarterGroup" class="nui-dictcombobox" dictTypeId="ZH_GROUP" showNullItem="true" style="width: 100px" />
							</td>
							<td style="width: 60px; text-align: right;">风险等级:</td>
							<td>
								<input name="criteria._expr[7].riskLevel" class="nui-dictcombobox" dictTypeId="RISK_LEVEL" showNullItem="true" style="width: 100px" />
							</td>
							<td>
								<a class="nui-button" id="khsrtjmxSearch" iconCls="icon-search" onclick="khsrtjmxSearch()">查询</a>
								<a class="nui-button" id="khsrtjmxReset" iconCls="icon-reload" onclick="khsrtjmxReset()">重置</a>
								<a class="nui-button" id="srtjmxExport" iconCls="icon-download" onclick="srtjmxExport()">导出</a>
							</td>
						</tr>
					</table>
				</div>
			</div>

			<div class="nui-fit">
				<div id="statisticsSnapshotDetailGrid" sizeList="[1000]" pageSize="1000" class="nui-datagrid" style="width: 100%; height: 100%" showSummaryRow="true" virtualScroll="true" virtualColumns="true"
					frozenStartColumn="0" frozenEndColumn="10" url="com.zhonghe.ame.kaohe.incomeStatistics.queryStatisticsSnapshotDetailList.biz.ext" dataField="statisticsSnapshotDetailList">
					<div property="columns">
						<div field="contractStauts" headerAlign="center" align="center" width="75" renderer="ZH_CONTRACT_STATUS_KAOHE">合同状态</div>
						<div field="secondaryOrgname" headerAlign="center" align="center" width="150">合同承办单位</div>
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
						<div field="major" headerAlign="center" align="center" renderer="ZH_MAJOR_TYPE">专业类别</div>
						<div field="headquarterGroup" headerAlign="center" align="center" renderer="ZH_GROUP">集团内外</div>
						<div field="riskLevel" headerAlign="center" align="center" renderer="RISK_LEVEL">风险等级</div>
						<div field="estimatedDate" headerAlign="center" align="center">预计签署日期</div>
					</div>
				</div>
			</div>

		</div>

	</div>

	<form name="viewlist1" id="viewlist1" action="com.primeton.eos.ame_common.ameExportCommon.flow" method="post">
		<input type="hidden" name="_eosFlowAction" value="action0" filter="false" />
		<input type="hidden" name="downloadFile" filter="false" />
		<input type="hidden" name="fileName" filter="false" />
	</form>

	<script type="text/javascript">
		nui.parse();
		var statisticsForm = new nui.Form("#statisticsForm");
		var statisticsGrid = nui.get("statisticsGrid");
		var srzbfxycForm = new nui.Form("#srzbfxycForm");
		var operatingRevenueGrid = nui.get("operatingRevenueGrid");
		var externalIncomeOfTheGroupGrid = nui.get("externalIncomeOfTheGroupGrid");
		var khsrtjmxForm = new nui.Form("#khsrtjmxForm");
		var statisticsSnapshotDetailGrid = nui.get("statisticsSnapshotDetailGrid");
		var tabs = nui.get("tabs");
		
		function tabActiveChanged(e) {
			if (e.tab.title == "考核收入统计快照") {
				var json = nui.encode({
					'loginUserId' : userId,
					'loginUserOrgId' : userOrgId,
					'authCode' : 'khsrtj'
				});
				nui.ajax({
					url : "com.zhonghe.ame.contractPact.statisticalReport.queryMonthlyBudgetTrackAuth.biz.ext",
					type : 'POST',
					data : json,
					contentType : 'text/json',
					success : function(o) {
						if(o.result == "1"){
							var srzbfxycDimTab = tabs.getTab("srzbfxycDimTab");
							var khsrtjmxDimTab = tabs.getTab("khsrtjmxDimTab");
							tabs.updateTab(srzbfxycDimTab, {
								visible : true
							});
							tabs.updateTab(khsrtjmxDimTab, {
								visible : true
							});
						}
						init();
					}
				});
			}else if(e.tab.title == "收入指标分析预测"){
				var pageHeight = Math.max(document.body.scrollHeight, document.documentElement.scrollHeight);
				var srzbfxyHeight = (pageHeight-175)/2;
				$("#externalIncomeOfTheGroupGrid").height(srzbfxyHeight);
				$("#operatingRevenueGrid").height(srzbfxyHeight);
				srzbfxycInit();
			}else if(e.tab.title == "考核收入统计明细"){
				khsrtjmxInit();
			}
		}		
		
		function init(){
			// 按钮权限
			if (userId != 'sysadmin') {
				getOpeatorButtonAuth("khsrtj_sckz,khsrtj_del");
			}
			//code:对应功能编码，map：对于机构的查询条件
			var json = {
				"code" : "khsrtj"
			};
			nui.ajax({
				url : "com.primeton.eos.ame_auth.ame_auth.getownorg1.biz.ext",
				data : json,
				type : 'POST',
				contentType : 'text/json',
				success : function(text) {
					if(text.errcode == "没有有权的机构"){
						getSecOrg(userOrgId);												
					}else{
						initSecOrgCombobox(text.orgids)
					}
					search();
				}
			});
		}
		
		function getSecOrg(userOrgId){
			var json = nui.encode({'userOrgId' : userOrgId});
			ajaxCommon({
				url : "com.primeton.eos.common.orgUtils.getSecOrg.biz.ext",
				data : json,
				async: false,
				success : function(result) {
					var data = result.data;
					nui.get("searchOrgids").setValue(data.ORGID);
				}
			});
		}
		
		function initSecOrgCombobox(orgids) {
			ajaxCommon({
				"url" : "com.zhonghe.ame.kaohe.common.getBusSecOrgList.biz.ext",
				contentType : 'text/json',
				async: false,
				success : function(result) {
					var datas = result.secOrgList;
					var orgIdSet = new Set(orgids.split(','));
					var filteredDatas = datas.filter(item => orgIdSet.has(item.secOrg));
					nui.get("secondaryOrg").setData(filteredDatas);
					nui.get("searchOrgids").setValue(orgids);
				}
			});
		}
		
		function search() {
			var data = statisticsForm.getData();
			statisticsGrid.sortBy("createTime", "desc");
			statisticsGrid.load(data);
		}
		
		function reset() {
			statisticsForm.reset();
			init();
		}
		
		function StatisticsAndAnalysis(e){
			var record = e.record;
			var s = "<a  href='javascript:void(0)' onclick='StatisticsAndAnalysisView();' >详情</a>";
			return s;
		}
		
		function StatisticsAndAnalysisView(){
			var row = statisticsGrid.getSelected();
			executeUrl = "/default/kaohe/incomeStatistics/incomeStatisticsAndAnalysisView.jsp?id=" + row.id;
			window.open(executeUrl);
		}
		
		function sckz(){
			nui.open({
				url : "/default/kaohe/incomeStatistics/artificialGenerateSnapshot.jsp",
				width : "450",
				height : "300",
				allowResize: false,
				title : "考核收入统计 - 生成快照",
				onload : function() {
					var iframe = this.getIFrameEl();
				},
				ondestroy : function(action) {
					search();
				}
			});
		}						
		
		function srzbfxycInit(){
			var date = new Date();
			date.setMonth(date.getMonth() - 1);
			var year = date.getFullYear();
			var month = date.getMonth() + 1;
			nui.get("srzbfxycYears").setValue(year);
			nui.get("srzbfxycMonths").setValue(month);
			initSrzbfxycSecOrgCombobox();
		}
		
		function initSrzbfxycSecOrgCombobox() {
			ajaxCommon({
				"url" : "com.zhonghe.ame.kaohe.common.getBusSecOrgList.biz.ext",
				contentType : 'text/json',
				success : function(result) {
					var datas = result.secOrgList;
					nui.get("srzbfxycSecondaryOrg").setData(datas);
					srzbfxycSearch();
				}
			});
		}
		
		function srzbfxycSearch(){
			operatingRevenueGrid.load({
				"year" : nui.get("srzbfxycYears").getValue(),
				"month" : nui.get("srzbfxycMonths").getValue(),
				"secOrg" : nui.get("srzbfxycSecondaryOrg").getValue()
			});
			externalIncomeOfTheGroupGrid.load({
				"year" : nui.get("srzbfxycYears").getValue(),
				"month" : nui.get("srzbfxycMonths").getValue(),
				"secOrg" : nui.get("srzbfxycSecondaryOrg").getValue()
			});			
		}
		
		function srzbfxycReset(){
			srzbfxycForm.reset();
			srzbfxycInit();
		}
		
		function khsrtjmxInit(){
			var date = new Date();
			date.setMonth(date.getMonth() - 1);
			var year = date.getFullYear();
			var month = date.getMonth() + 1;
			nui.get("khsrtjmxYears").setValue(year);
			nui.get("khsrtjmxMonths").setValue(month);
			initKhsrtjmxSecOrgCombobox();
		}
		
		function initKhsrtjmxSecOrgCombobox() {
			ajaxCommon({
				"url" : "com.zhonghe.ame.kaohe.common.getBusSecOrgList.biz.ext",
				contentType : 'text/json',
				success : function(result) {
					var datas = result.secOrgList;
					nui.get("khsrtjmxSecondaryOrg").setData(datas);
					khsrtjmxSearch();
				}
			});
		}
		
		function khsrtjmxSearch(){
			var data = khsrtjmxForm.getData();
			statisticsSnapshotDetailGrid.sortBy("contractStauts", "asc");
			statisticsSnapshotDetailGrid.load(data);
		}
		
		function khsrtjmxReset(){
			khsrtjmxForm.reset();
			khsrtjmxInit();
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
		
		function ZH_MAJOR_TYPE(e){
			return nui.getDictText("ZH_MAJOR_TYPE", e.value);
		}		

		function RISK_LEVEL(e) {
			return nui.getDictText("RISK_LEVEL", e.value);
		}						
		
		function FONT_COLOR(e) {
			if (e.value > 0) {
				e.cellStyle = "color: red";
			}
			return e.value;
		}
		
		function FONT_COLOR_ALL(e) {
			e.cellStyle = "color: red; font-weight: bold;";
			return e.value;
		}		
		
		function khsrtj_del(){
			var rows = statisticsGrid.getSelecteds();
			if (rows.length == 0) {
				showTips("请选中需要删除的数据记录", "danger");
			}else{
				if(!confirm("是否删除？")){
					return;
				}else{
					var datas = rows.map(row => ({ id: row.id }));
					var json = nui.encode({
						'datas' : datas
					});
					nui.ajax({
						url : "com.zhonghe.ame.kaohe.incomeStatistics.deleteStatisticsSnapshot.biz.ext",
						type : 'POST',
						data : json,
						contentType : 'text/json',
						success : function(o) {
							if (o.result == 1) {
								showTips("删除成功");
								statisticsGrid.reload();
							} else {
								showTips("删除失败，请联系信息技术部人员！", "danger");
							}
						}
					});				
				}
			}
		}
		
		function srzbfxycExport() {
			var data = {
				"year" : nui.get("srzbfxycYears").getValue(),
				"month" : nui.get("srzbfxycMonths").getValue(),
				"secOrg" : nui.get("srzbfxycSecondaryOrg").getValue()
			};
			exportExcel({
				"data" : data,
				"url" : "com.zhonghe.ame.kaohe.incomeStatistics.exportSRZBFXYCExcel.biz.ext",
				"fileName" : "收入指标分析预测"
			})
		}
		
		function srtjmxExport(){
			var data = khsrtjmxForm.getData();
			exportExcel({
				"data" : data,
				"url" : "com.zhonghe.ame.kaohe.incomeStatistics.exportStatisticsSnapshotDetailExcel.biz.ext",
				"fileName" : "考核收入统计明细"
			})
		}			
		
	</script>

</body>
</html>