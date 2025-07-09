package com.zhonghe.ame.kaohe;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Comparator;
import java.util.Optional;
import java.util.function.Function;
import java.util.stream.Collectors;

import cn.hutool.core.date.DateTime;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.NumberUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.db.Entity;
import cn.hutool.db.Session;

import com.eos.common.connection.DataSourceHelper;
import com.eos.system.annotation.Bizlet;

@Bizlet("公司领导推送统计数据的查询")
public class CompanyLeadershipChartSearch {

	@Bizlet("本年新签合同排行（维度：集团内外）")
	public List<Entity> rankingOfNewlySignedContracts(String year, String month, Boolean outsideTheGroup) throws Exception {
		String querySql = "SELECT TOP 5 contract_name, signatory_name, contract_sum, secondary_orgname FROM zh_charge_contract WHERE app_status = '2' AND signing_date >= ? AND signing_date <= ? ORDER BY contract_sum DESC";
		String querySqlByJTW = "SELECT TOP 5 contract_name, signatory_name, contract_sum, secondary_orgname FROM zh_charge_contract WHERE app_status = '2'  AND headquarter_group  = '1' AND signing_date >= ? AND signing_date <= ? ORDER BY contract_sum DESC";
		Session dbSession = new Session(DataSourceHelper.getDataSource());
		String startDate = StrUtil.format("{}-{}-{}", year, "01", "01");
		String monthEndDate = this.getMonthEndDate(year, month);
		List<Entity> entityList = new ArrayList<Entity>();
		if (outsideTheGroup) {
			entityList = dbSession.query(querySqlByJTW, startDate, monthEndDate);
		} else {
			entityList = dbSession.query(querySql, startDate, monthEndDate);
		}
		return entityList.stream().map(entity -> {
			entity.set("contract_sum", this.yuanToTenThousandYuan(entity.getBigDecimal("contract_sum")));
			return entity;
		}).collect(Collectors.toList());
	}

	@Bizlet("本年合同履约排行（维度：集团内外）")
	public List<Entity> contractPerformanceRanking(String year, String month, Boolean outsideTheGroup) throws Exception {
		String querySql = "SELECT TOP 5 contract_name, payer_name, actual_invoice_sum, secondary_orgname FROM zh_invoice WHERE app_status = '2' AND create_time >= ? AND create_time <= ? ORDER BY actual_invoice_sum DESC";
		String querySqlByJTW = "SELECT TOP 5 contract_name, payer_name, actual_invoice_sum, secondary_orgname FROM zh_invoice WHERE app_status = '2' AND headquarter_group = '1' AND create_time >= ? AND create_time <= ? ORDER BY actual_invoice_sum DESC";
		Session dbSession = new Session(DataSourceHelper.getDataSource());
		String startDate = StrUtil.format("{}-{}-{}", year, "01", "01");
		String monthEndDate = this.getMonthEndDate(year, month);
		List<Entity> entityList = new ArrayList<Entity>();
		if (outsideTheGroup) {
			entityList = dbSession.query(querySqlByJTW, startDate, monthEndDate);
		} else {
			entityList = dbSession.query(querySql, startDate, monthEndDate);
		}
		return entityList.stream().map(entity -> {
			entity.set("actual_invoice_sum", this.yuanToTenThousandYuan(entity.getBigDecimal("actual_invoice_sum")));
			return entity;
		}).collect(Collectors.toList());
	}

	@Bizlet("营业收入全年趋势预测（维度：专业类别）")
	public List<Entity> annualTrendForecastOfOperatingIncome(String year, String month, String major) throws Exception {
		String querySql = "SELECT * FROM zh_kaohe_company_chart_income_trends WHERE outside_the_group = '0' AND years = ? AND months = ? AND major = ?";
		String querySqlByJTW = "SELECT * FROM zh_kaohe_company_chart_income_trends WHERE outside_the_group = '1' AND years = ? AND months = ? AND major = ?";
		Session dbSession = new Session(DataSourceHelper.getDataSource());
		Entity entity = dbSession.queryOne(querySql, year, month, major);
		Entity entityJTW = dbSession.queryOne(querySqlByJTW, year, month, major);
		List<Entity> result = new ArrayList<Entity>();
		result.add(this.fillAnnualTrendForecastOfOperatingIncome("全部", entity));
		result.add(this.fillAnnualTrendForecastOfOperatingIncome("集团外", entityJTW));
		return result;
	}

	@Bizlet("营业收入考核口径（维度：集团内外）")
	public Map<String, Entity> assessmentCriteriaForOperatingIncome(String year, String month, Boolean outsideTheGroup) throws Exception {
		Map<String, Entity> resultMap = new HashMap<String, Entity>();
		AnalysisAndPredictionOfIncomeIndicators analysisAndPredictionOfIncomeIndicators = new AnalysisAndPredictionOfIncomeIndicators();
		List<Entity> analysisEntityList = new ArrayList<Entity>();
		if (outsideTheGroup) {
			analysisEntityList = analysisAndPredictionOfIncomeIndicators.externalIncomeOfTheGroupBySecOrg(year, month, null);
		} else {
			analysisEntityList = analysisAndPredictionOfIncomeIndicators.operatingRevenueBySecOrg(year, month, null);
		}
		analysisEntityList = analysisEntityList.stream().filter(entity -> !StrUtil.equals(entity.getStr("secondary_org"), "8") && !StrUtil.equals(entity.getStr("secondary_org"), "102123"))
				.collect(Collectors.toList());
		Session dbSession = new Session(DataSourceHelper.getDataSource());
		String querySqlByDict = "SELECT DICTID FROM EOS_DICT_ENTRY WHERE DICTTYPEID = 'ORG_CLASS_SERVICE_CENTER' OR DICTTYPEID='ORG_CLASS_FUNCTIONAL_DEP'";
		List<Entity> ywzxEntityList = dbSession.query(querySqlByDict);
		Map<String, Entity> ywzxSecMap = ywzxEntityList.stream().collect(Collectors.toMap(entity -> entity.getStr("DICTID"), entity -> entity));
		Map<Boolean, List<Entity>> partitionedMap = analysisEntityList.stream().collect(Collectors.partitioningBy(analysisEntity -> ywzxSecMap.containsKey(analysisEntity.getStr("secondary_org"))));

		Entity ywzxData = new Entity();
		List<Entity> ywzxKhzList = new ArrayList<Entity>();
		// 组织名称数组(业务中心)
		String[] ywzxSecOrgNames = partitionedMap.get(true).stream().map(entity -> entity.getStr("secondaryOrgname")).toArray(String[]::new);
		ywzxData.set("secOrgNames", ywzxSecOrgNames);
		// 期望值数组(业务中心)
		BigDecimal[] ywzxExpectedValues = partitionedMap.get(true).stream().map(entity -> entity.getBigDecimal("expectedValue")).toArray(BigDecimal[]::new);
		Entity ywzxExpectedValuesEntity = new Entity();
		ywzxExpectedValuesEntity.set("name", "期望值");
		ywzxExpectedValuesEntity.set("datas", ywzxExpectedValues);
		ywzxKhzList.add(ywzxExpectedValuesEntity);
		// 全年预测考核值数组(业务中心)
		BigDecimal[] ywzxAnnualForecastAssessmentValues = partitionedMap.get(true).stream().map(entity -> entity.getBigDecimal("annualForecastAssessmentValue")).toArray(BigDecimal[]::new);
		Entity ywzxAnnualForecastAssessmentValuesEntity = new Entity();
		ywzxAnnualForecastAssessmentValuesEntity.set("name", "全年预测考核值");
		ywzxAnnualForecastAssessmentValuesEntity.set("datas", ywzxAnnualForecastAssessmentValues);
		ywzxKhzList.add(ywzxAnnualForecastAssessmentValuesEntity);
		// 截至当月已完成考核值(业务中心)
		BigDecimal[] ywzxAsOfTheCurrentMonthTheAssessmentValuesHaveBeenCompleteds = partitionedMap.get(true).stream()
				.map(entity -> entity.getBigDecimal("asOfTheCurrentMonthTheAssessmentValuesHaveBeenCompleted")).toArray(BigDecimal[]::new);
		Entity ywzxAsOfTheCurrentMonthTheAssessmentValuesHaveBeenCompletedsEntity = new Entity();
		ywzxAsOfTheCurrentMonthTheAssessmentValuesHaveBeenCompletedsEntity.set("name", "截至当月已完成考核值");
		ywzxAsOfTheCurrentMonthTheAssessmentValuesHaveBeenCompletedsEntity.set("datas", ywzxAsOfTheCurrentMonthTheAssessmentValuesHaveBeenCompleteds);
		ywzxKhzList.add(ywzxAsOfTheCurrentMonthTheAssessmentValuesHaveBeenCompletedsEntity);
		ywzxData.set("examineDatas", ywzxKhzList);
		resultMap.put("ywzx", ywzxData);

		Entity qtData = new Entity();
		List<Entity> qtKhzList = new ArrayList<Entity>();
		// 组织名称数组(设备监理中心、事业部、分公司)
		String[] qtSecOrgNames = partitionedMap.get(false).stream().map(entity -> entity.getStr("secondaryOrgname")).toArray(String[]::new);
		qtData.set("secOrgNames", qtSecOrgNames);
		// 期望值数组(设备监理中心、事业部、分公司)
		BigDecimal[] qtExpectedValues = partitionedMap.get(false).stream().map(entity -> entity.getBigDecimal("expectedValue")).toArray(BigDecimal[]::new);
		Entity qtExpectedValuesEntity = new Entity();
		qtExpectedValuesEntity.set("name", "期望值");
		qtExpectedValuesEntity.set("datas", qtExpectedValues);
		qtKhzList.add(qtExpectedValuesEntity);
		// 全年预测考核值数组(设备监理中心、事业部、分公司)
		BigDecimal[] qtAnnualForecastAssessmentValues = partitionedMap.get(false).stream().map(entity -> entity.getBigDecimal("annualForecastAssessmentValue")).toArray(BigDecimal[]::new);
		Entity qtAnnualForecastAssessmentValuesEntity = new Entity();
		qtAnnualForecastAssessmentValuesEntity.set("name", "全年预测考核值");
		qtAnnualForecastAssessmentValuesEntity.set("datas", qtAnnualForecastAssessmentValues);
		qtKhzList.add(qtAnnualForecastAssessmentValuesEntity);
		// 截至当月已完成考核值(设备监理中心、事业部、分公司)
		BigDecimal[] qtAsOfTheCurrentMonthTheAssessmentValuesHaveBeenCompleteds = partitionedMap.get(false).stream()
				.map(entity -> entity.getBigDecimal("asOfTheCurrentMonthTheAssessmentValuesHaveBeenCompleted")).toArray(BigDecimal[]::new);
		Entity qtAsOfTheCurrentMonthTheAssessmentValuesHaveBeenCompletedsEntity = new Entity();
		qtAsOfTheCurrentMonthTheAssessmentValuesHaveBeenCompletedsEntity.set("name", "截至当月已完成考核值");
		qtAsOfTheCurrentMonthTheAssessmentValuesHaveBeenCompletedsEntity.set("datas", qtAsOfTheCurrentMonthTheAssessmentValuesHaveBeenCompleteds);
		qtKhzList.add(qtAsOfTheCurrentMonthTheAssessmentValuesHaveBeenCompletedsEntity);
		qtData.set("examineDatas", qtKhzList);
		resultMap.put("qt", qtData);

		return resultMap;
	}

	@Bizlet("全年收入分解&风险分析（维度：集团内外、单位）")
	public Entity annualIncomeBreakdown(String year, String month, String secOrg, Boolean outsideTheGroup) {
		Entity result = new Entity();
		AnalysisAndPredictionOfIncomeIndicators analysisAndPredictionOfIncomeIndicators = new AnalysisAndPredictionOfIncomeIndicators();
		List<Entity> analysisEntityList = new ArrayList<Entity>();
		if ("all".equals(secOrg)) {
			if (outsideTheGroup) {
				analysisEntityList = analysisAndPredictionOfIncomeIndicators.externalIncomeOfTheGroupBySecOrg(year, month, null);
			} else {
				analysisEntityList = analysisAndPredictionOfIncomeIndicators.operatingRevenueBySecOrg(year, month, null);
			}
		} else {
			if (outsideTheGroup) {
				analysisEntityList = analysisAndPredictionOfIncomeIndicators.externalIncomeOfTheGroupBySecOrg(year, month, secOrg);
			} else {
				analysisEntityList = analysisAndPredictionOfIncomeIndicators.operatingRevenueBySecOrg(year, month, secOrg);
			}
		}

		// 截至当月已完成（考核值） - 累加
		BigDecimal asOfTheCurrentMonthTheAssessmentValuesHaveBeenCompletedSum = analysisEntityList.stream()
				.map(entity -> entity.getBigDecimal("asOfTheCurrentMonthTheAssessmentValuesHaveBeenCompleted")).reduce(BigDecimal.ZERO, BigDecimal::add);
		// 手持合同金额合计 - 累加
		BigDecimal totalHandheldContractAmountSum = analysisEntityList.stream().map(entity -> entity.getBigDecimal("totalHandheldContractAmount")).reduce(BigDecimal.ZERO, BigDecimal::add);

		// 待签合同金额合计 - 累加
		BigDecimal totalAmountOfPendingContractToBeSignedSum = analysisEntityList.stream().map(entity -> entity.getBigDecimal("totalAmountOfPendingContractToBeSigned"))
				.reduce(BigDecimal.ZERO, BigDecimal::add);

		// 待签：低风险合同金额合计 - 累加
		BigDecimal totalAmountOfLowriskContractToBeSignedSum = analysisEntityList.stream().map(entity -> entity.getBigDecimal("totalAmountOfLowriskContractToBeSigned"))
				.reduce(BigDecimal.ZERO, BigDecimal::add);
		// 待签：中风险合同金额合计 - 累加
		BigDecimal totalAmountOfRiskContractsToBeSignedSum = analysisEntityList.stream().map(entity -> entity.getBigDecimal("totalAmountOfRiskContractsToBeSigned"))
				.reduce(BigDecimal.ZERO, BigDecimal::add);

		// 合计总值
		BigDecimal allSum = NumberUtil.add(asOfTheCurrentMonthTheAssessmentValuesHaveBeenCompletedSum, totalHandheldContractAmountSum, totalAmountOfPendingContractToBeSignedSum);

		List<Entity> dataEntityList = new ArrayList<Entity>();

		Entity asOfTheCurrentMonthTheAssessmentValuesHaveBeenCompletedSumEntity = new Entity();
		asOfTheCurrentMonthTheAssessmentValuesHaveBeenCompletedSumEntity.set("name", "截至本月已完成");
		asOfTheCurrentMonthTheAssessmentValuesHaveBeenCompletedSumEntity.set("value", asOfTheCurrentMonthTheAssessmentValuesHaveBeenCompletedSum);
		asOfTheCurrentMonthTheAssessmentValuesHaveBeenCompletedSumEntity.set("allSum", allSum);
		asOfTheCurrentMonthTheAssessmentValuesHaveBeenCompletedSumEntity.set("percentage",
				NumberUtil.decimalFormat("#.##%", NumberUtil.div(asOfTheCurrentMonthTheAssessmentValuesHaveBeenCompletedSum, allSum, 2)));
		dataEntityList.add(asOfTheCurrentMonthTheAssessmentValuesHaveBeenCompletedSumEntity);

		Entity totalHandheldContractAmountSumEntity = new Entity();
		totalHandheldContractAmountSumEntity.set("name", "后续手持合同收入");
		totalHandheldContractAmountSumEntity.set("value", totalHandheldContractAmountSum);
		totalHandheldContractAmountSumEntity.set("allSum", allSum);
		totalHandheldContractAmountSumEntity.set("percentage", NumberUtil.decimalFormat("#.##%", NumberUtil.div(totalHandheldContractAmountSum, allSum, 2)));
		dataEntityList.add(totalHandheldContractAmountSumEntity);

		Entity totalAmountOfPendingContractToBeSignedSumEntity = new Entity();
		totalAmountOfPendingContractToBeSignedSumEntity.set("name", "后续待签合同收入");
		totalAmountOfPendingContractToBeSignedSumEntity.set("value", totalAmountOfPendingContractToBeSignedSum);
		totalAmountOfPendingContractToBeSignedSumEntity.set("allSum", allSum);
		totalAmountOfPendingContractToBeSignedSumEntity.set("percentage", NumberUtil.decimalFormat("#.##%", NumberUtil.div(totalAmountOfPendingContractToBeSignedSum, allSum, 2)));
		totalAmountOfPendingContractToBeSignedSumEntity.set("dfxValue", totalAmountOfLowriskContractToBeSignedSum);
		totalAmountOfPendingContractToBeSignedSumEntity.set("zfxValue", totalAmountOfRiskContractsToBeSignedSum);
		if (!NumberUtil.equals(totalAmountOfPendingContractToBeSignedSum, BigDecimal.ZERO)) {
			totalAmountOfPendingContractToBeSignedSumEntity.set("dfxPercentage",
					NumberUtil.decimalFormat("#.##%", NumberUtil.div(totalAmountOfLowriskContractToBeSignedSum, totalAmountOfPendingContractToBeSignedSum, 2)));
			totalAmountOfPendingContractToBeSignedSumEntity.set("zfxPercentage",
					NumberUtil.decimalFormat("#.##%", NumberUtil.div(totalAmountOfRiskContractsToBeSignedSum, totalAmountOfPendingContractToBeSignedSum, 2)));
		} else {
			totalAmountOfPendingContractToBeSignedSumEntity.set("dfxPercentage", "0%");
			totalAmountOfPendingContractToBeSignedSumEntity.set("zfxPercentage", "0%");
		}
		dataEntityList.add(totalAmountOfPendingContractToBeSignedSumEntity);

		result.set("name", "全年收入分解");
		result.set("datas", dataEntityList);
		return result;
	}

	@Bizlet("当月/累计单位完成值和完成率排行，维度：集团内外")
	public Map<String, List<Entity>> monthlyCumulativeUnitCompletionValueAndCompletionRateRanking(String year, String month, Boolean outsideTheGroup) throws Exception {
		Map<String, List<Entity>> resultMap = new HashMap<String, List<Entity>>();
		Map<String, String> previousMonthMap = this.getPreviousMonth(year, month);
		AnalysisAndPredictionOfIncomeIndicators analysisAndPredictionOfIncomeIndicators = new AnalysisAndPredictionOfIncomeIndicators();
		List<Entity> analysisEntityList = new ArrayList<Entity>();
		List<Entity> previousMonthAnalysisEntityList = new ArrayList<Entity>();
		if (outsideTheGroup) {
			analysisEntityList = analysisAndPredictionOfIncomeIndicators.externalIncomeOfTheGroupBySecOrg(year, month, null);
			previousMonthAnalysisEntityList = analysisAndPredictionOfIncomeIndicators.externalIncomeOfTheGroupBySecOrg(previousMonthMap.get("year"), previousMonthMap.get("month"), null);
		} else {
			analysisEntityList = analysisAndPredictionOfIncomeIndicators.operatingRevenueBySecOrg(year, month, null);
			previousMonthAnalysisEntityList = analysisAndPredictionOfIncomeIndicators.operatingRevenueBySecOrg(previousMonthMap.get("year"), previousMonthMap.get("month"), null);
		}
		analysisEntityList = analysisEntityList.stream().filter(entity -> !StrUtil.equals(entity.getStr("secondary_org"), "8") && !StrUtil.equals(entity.getStr("secondary_org"), "102123"))
				.collect(Collectors.toList());
		Session dbSession = new Session(DataSourceHelper.getDataSource());
		String querySqlByDict = "SELECT DICTID FROM EOS_DICT_ENTRY WHERE DICTTYPEID = 'ORG_CLASS_SERVICE_CENTER' OR DICTTYPEID='ORG_CLASS_FUNCTIONAL_DEP'";
		List<Entity> ywzxEntityList = dbSession.query(querySqlByDict);
		Map<String, Entity> ywzxSecMap = ywzxEntityList.stream().collect(Collectors.toMap(entity -> entity.getStr("DICTID"), entity -> entity));
		Map<Boolean, List<Entity>> partitionedMap = analysisEntityList.stream().collect(Collectors.partitioningBy(analysisEntity -> ywzxSecMap.containsKey(analysisEntity.getStr("secondary_org"))));
		Map<String, Entity> previousMonthAnalysisMap = this.listToMapBySecOrg(previousMonthAnalysisEntityList);

		List<Entity> ywzxCompletionValueEntityList = new ArrayList<Entity>();
		List<Entity> ywzxCompletionRateEntityList = new ArrayList<Entity>();
		List<Entity> ywzxCompletionValueLJEntityList = new ArrayList<Entity>();
		for (Entity entity : partitionedMap.get(true)) {
			Entity ywzxCompletionValueEntity = new Entity();
			Entity ywzxCompletionRateEntity = new Entity();
			Entity ywzxCompletionValueLJEntity = new Entity();
			ywzxCompletionValueEntity.set("secondaryOrgname", entity.getStr("secondaryOrgname"));
			ywzxCompletionValueEntity.set("completionValue", NumberUtil.sub(
					entity.getBigDecimal("asOfTheCurrentMonthTheAssessmentValuesHaveBeenCompleted"),
					previousMonthAnalysisMap.containsKey(entity.getStr("secondary_org")) ? previousMonthAnalysisMap.get(entity.getStr("secondary_org")).getBigDecimal(
							"asOfTheCurrentMonthTheAssessmentValuesHaveBeenCompleted") : BigDecimal.ZERO));
			ywzxCompletionValueEntityList.add(ywzxCompletionValueEntity);
			ywzxCompletionRateEntity.set("secondaryOrgname", entity.getStr("secondaryOrgname"));
			ywzxCompletionRateEntity.set("completionRate", entity.getStr("assessmentCompletionRate"));
			ywzxCompletionRateEntityList.add(ywzxCompletionRateEntity);
			ywzxCompletionValueLJEntity.set("secondaryOrgname", entity.getStr("secondaryOrgname"));
			ywzxCompletionValueLJEntity.set("completionValueLJ", entity.getBigDecimal("asOfTheCurrentMonthTheAssessmentValuesHaveBeenCompleted"));
			ywzxCompletionValueLJEntityList.add(ywzxCompletionValueLJEntity);

		}
		ywzxCompletionValueEntityList.sort(Comparator.comparing((Entity entity) -> entity.getBigDecimal("completionValue")).reversed());
		ywzxCompletionRateEntityList.sort(Comparator.comparing((Entity entity) -> this.parsePercentage(entity.getStr("completionRate"))).reversed());
		ywzxCompletionValueLJEntityList.sort(Comparator.comparing((Entity entity) -> entity.getBigDecimal("completionValueLJ")).reversed());
		resultMap.put("ywzxCompletionValue", ywzxCompletionValueEntityList);
		resultMap.put("ywzxCompletionValueLJ", ywzxCompletionValueLJEntityList);
		resultMap.put("ywzxCompletionRate", ywzxCompletionRateEntityList);

		List<Entity> qtCompletionValueEntityList = new ArrayList<Entity>();
		List<Entity> qtCompletionRateEntityList = new ArrayList<Entity>();
		List<Entity> qtCompletionValueLJEntityList = new ArrayList<Entity>();
		for (Entity entity : partitionedMap.get(false)) {
			Entity qtCompletionValueEntity = new Entity();
			Entity qtCompletionRateEntity = new Entity();
			Entity qtCompletionValueLJEntity = new Entity();
			qtCompletionValueEntity.set("secondaryOrgname", entity.getStr("secondaryOrgname"));
			qtCompletionValueEntity.set("completionValue", NumberUtil.sub(
					entity.getBigDecimal("asOfTheCurrentMonthTheAssessmentValuesHaveBeenCompleted"),
					previousMonthAnalysisMap.containsKey(entity.getStr("secondary_org")) ? previousMonthAnalysisMap.get(entity.getStr("secondary_org")).getBigDecimal(
							"asOfTheCurrentMonthTheAssessmentValuesHaveBeenCompleted") : BigDecimal.ZERO));
			qtCompletionValueEntityList.add(qtCompletionValueEntity);
			qtCompletionRateEntity.set("secondaryOrgname", entity.getStr("secondaryOrgname"));
			qtCompletionRateEntity.set("completionRate", entity.getStr("assessmentCompletionRate"));
			qtCompletionRateEntityList.add(qtCompletionRateEntity);
			qtCompletionValueLJEntity.set("secondaryOrgname", entity.getStr("secondaryOrgname"));
			qtCompletionValueLJEntity.set("completionValueLJ", entity.getBigDecimal("asOfTheCurrentMonthTheAssessmentValuesHaveBeenCompleted"));
			qtCompletionValueLJEntityList.add(qtCompletionValueLJEntity);
		}
		qtCompletionValueEntityList.sort(Comparator.comparing((Entity entity) -> entity.getBigDecimal("completionValue")).reversed());
		qtCompletionRateEntityList.sort(Comparator.comparing((Entity entity) -> this.parsePercentage(entity.getStr("completionRate"))).reversed());
		qtCompletionValueLJEntityList.sort(Comparator.comparing((Entity entity) -> entity.getBigDecimal("completionValueLJ")).reversed());
		resultMap.put("qtCompletionValue", qtCompletionValueEntityList);
		resultMap.put("qtCompletionValueLJ", qtCompletionValueLJEntityList);
		resultMap.put("qtCompletionRate", qtCompletionRateEntityList);

		return resultMap;
	}

	@Bizlet("缺口预警，维度：集团内外")
	public Entity gapWarningAssessmentCriteria(String year, String month, Boolean outsideTheGroup) throws Exception {
		Entity result = new Entity();
		AnalysisAndPredictionOfIncomeIndicators analysisAndPredictionOfIncomeIndicators = new AnalysisAndPredictionOfIncomeIndicators();
		List<Entity> analysisEntityList = new ArrayList<Entity>();
		if (outsideTheGroup) {
			analysisEntityList = analysisAndPredictionOfIncomeIndicators.externalIncomeOfTheGroupBySecOrg(year, month, null);
		} else {
			analysisEntityList = analysisAndPredictionOfIncomeIndicators.operatingRevenueBySecOrg(year, month, null);
		}
		analysisEntityList = analysisEntityList.stream().filter(entity -> !StrUtil.equals(entity.getStr("secondary_org"), "8") && !StrUtil.equals(entity.getStr("secondary_org"), "102123"))
				.collect(Collectors.toList());
		List<Entity> dataEntityList = new ArrayList<Entity>();
		for (Entity analysisEntity : analysisEntityList) {
			Entity gapWarningEntity = new Entity();
			Entity labelEntity = new Entity();
			Entity itemStyleEntity = new Entity();
			gapWarningEntity.set("name", analysisEntity.getStr("secondaryOrgname"));
			gapWarningEntity.set("value", analysisEntity.getBigDecimal("assessmentValueGap"));
			labelEntity.set("position", NumberUtil.isGreaterOrEqual(analysisEntity.getBigDecimal("assessmentValueGap"), BigDecimal.ZERO) ? "left" : "right");
			itemStyleEntity.set("color", NumberUtil.isGreaterOrEqual(analysisEntity.getBigDecimal("assessmentValueGap"), BigDecimal.ZERO) ? "#de6e6a" : "#5a6fc0");
			gapWarningEntity.set("label", labelEntity);
			gapWarningEntity.set("itemStyle", itemStyleEntity);
			dataEntityList.add(gapWarningEntity);
		}
		BigDecimal maxAbsValue = this.getMaxAbsoluteValue(dataEntityList, entity -> entity.getBigDecimal("value"));
		result.set("datas", dataEntityList);
		result.set("min", maxAbsValue.negate());
		result.set("max", maxAbsValue);
		return result;
	}

	@Bizlet("各单位新签合同额排行，维度：集团内外")
	public Map<String, List<Entity>> rankingOfNewlySignedContractAmountsByEachUnit(String year, String month, Boolean outsideTheGroup) throws Exception {
		Map<String, List<Entity>> resultMap = new HashMap<String, List<Entity>>();
		Session dbSession = new Session(DataSourceHelper.getDataSource());
		String querySql = "SELECT secondary_org, SUM(contract_sum) AS total_contract_sum FROM zh_charge_contract WHERE app_status = '2' AND  signing_date >= ? AND signing_date <= ? GROUP BY secondary_org";
		String querySqlByJTW = "SELECT secondary_org, SUM(contract_sum) AS total_contract_sum FROM zh_charge_contract WHERE app_status = '2' AND  signing_date >= ? AND signing_date <= ? AND headquarter_group = '1' GROUP BY secondary_org";
		String yearStartDate = StrUtil.format("{}-{}-{}", year, "01", "01");
		String monthStartDate = this.getMonthStartDate(year, month);
		String monthEndDate = this.getMonthEndDate(year, month);
		SecOrgUtil secOrgUtil = new SecOrgUtil();
		List<Entity> secOrgList = secOrgUtil.getKaoHeSecOrg(year, month);

		List<Entity> thisMonthSecSumList = new ArrayList<Entity>();
		List<Entity> cumulativeMonthSecSumList = new ArrayList<Entity>();

		if (outsideTheGroup) {
			thisMonthSecSumList = dbSession.query(querySqlByJTW, monthStartDate, monthEndDate);
			cumulativeMonthSecSumList = dbSession.query(querySqlByJTW, yearStartDate, monthEndDate);
		} else {
			thisMonthSecSumList = dbSession.query(querySql, monthStartDate, monthEndDate);
			cumulativeMonthSecSumList = dbSession.query(querySql, yearStartDate, monthEndDate);
		}

		Map<String, Entity> thisMonthSecSumMap = this.listToMapBySecOrg(thisMonthSecSumList);
		Map<String, Entity> cumulativeMonthSecSumMap = this.listToMapBySecOrg(cumulativeMonthSecSumList);

		List<Entity> thisMonthEntityList = new ArrayList<Entity>();
		List<Entity> cumulativeMonthEntityList = new ArrayList<Entity>();

		for (Entity secOrg : secOrgList) {
			if (thisMonthSecSumMap.containsKey(secOrg.getStr("secondary_org"))) {
				Entity thisMonthEntity = thisMonthSecSumMap.get(secOrg.getStr("secondary_org"));
				thisMonthEntity.set("secondary_orgname", secOrg.getStr("secondary_orgname"));
				thisMonthEntity.set("total_contract_sum", this.yuanToTenThousandYuan(thisMonthEntity.getBigDecimal("total_contract_sum")));
				thisMonthEntityList.add(thisMonthEntity);
			} else {
				Entity thisMonthEntity = new Entity();
				thisMonthEntity.set("secondary_org", secOrg.getStr("secondary_org"));
				thisMonthEntity.set("secondary_orgname", secOrg.getStr("secondary_orgname"));
				thisMonthEntity.set("total_contract_sum", BigDecimal.ZERO);
				thisMonthEntityList.add(thisMonthEntity);
			}
			if (cumulativeMonthSecSumMap.containsKey(secOrg.getStr("secondary_org"))) {
				Entity cumulativeMonthEntity = cumulativeMonthSecSumMap.get(secOrg.getStr("secondary_org"));
				cumulativeMonthEntity.set("secondary_orgname", secOrg.getStr("secondary_orgname"));
				cumulativeMonthEntity.set("total_contract_sum", this.yuanToTenThousandYuan(cumulativeMonthEntity.getBigDecimal("total_contract_sum")));
				cumulativeMonthEntityList.add(cumulativeMonthEntity);
			} else {
				Entity cumulativeMonthEntity = new Entity();
				cumulativeMonthEntity.set("secondary_org", secOrg.getStr("secondary_org"));
				cumulativeMonthEntity.set("secondary_orgname", secOrg.getStr("secondary_orgname"));
				cumulativeMonthEntity.set("total_contract_sum", BigDecimal.ZERO);
				cumulativeMonthEntityList.add(cumulativeMonthEntity);
			}
		}

		String querySqlByDict = "SELECT DICTID FROM EOS_DICT_ENTRY WHERE DICTTYPEID = 'ORG_CLASS_SERVICE_CENTER' OR DICTTYPEID='ORG_CLASS_FUNCTIONAL_DEP'";
		List<Entity> ywzxEntityList = dbSession.query(querySqlByDict);
		Map<String, Entity> ywzxSecMap = ywzxEntityList.stream().collect(Collectors.toMap(entity -> entity.getStr("DICTID"), entity -> entity));

		Map<Boolean, List<Entity>> thisMonthPartitionedMap = thisMonthEntityList.stream().collect(
				Collectors.partitioningBy(analysisEntity -> ywzxSecMap.containsKey(analysisEntity.getStr("secondary_org"))));

		Map<Boolean, List<Entity>> cumulativeMonthPartitionedMap = cumulativeMonthEntityList.stream().collect(
				Collectors.partitioningBy(analysisEntity -> ywzxSecMap.containsKey(analysisEntity.getStr("secondary_org"))));

		List<Entity> ywzxThisMonth = thisMonthPartitionedMap.get(true);
		ywzxThisMonth.sort(Comparator.comparing((Entity entity) -> entity.getBigDecimal("total_contract_sum")).reversed());
		resultMap.put("ywzxThisMonth", ywzxThisMonth);

		List<Entity> qtThisMonth = thisMonthPartitionedMap.get(false);
		qtThisMonth.sort(Comparator.comparing((Entity entity) -> entity.getBigDecimal("total_contract_sum")).reversed());
		resultMap.put("qtThisMonth", qtThisMonth);

		List<Entity> ywzxCumulativeMonth = cumulativeMonthPartitionedMap.get(true);
		ywzxCumulativeMonth.sort(Comparator.comparing((Entity entity) -> entity.getBigDecimal("total_contract_sum")).reversed());
		resultMap.put("ywzxCumulativeMonth", ywzxCumulativeMonth);

		List<Entity> qtCumulativeMonth = cumulativeMonthPartitionedMap.get(false);
		qtCumulativeMonth.sort(Comparator.comparing((Entity entity) -> entity.getBigDecimal("total_contract_sum")).reversed());
		resultMap.put("qtCumulativeMonth", qtCumulativeMonth);

		return resultMap;
	}

	/**
	 * 填充营业收入全年趋势预测数据
	 */
	private Entity fillAnnualTrendForecastOfOperatingIncome(String name, Entity entity) {
		Entity result = new Entity();
		result.set("name", name);
		BigDecimal[] bookIncomes = new BigDecimal[12];
		bookIncomes[0] = entity.getBigDecimal("jan_stacking");
		bookIncomes[1] = entity.getBigDecimal("feb_stacking");
		bookIncomes[2] = entity.getBigDecimal("mar_stacking");
		bookIncomes[3] = entity.getBigDecimal("apr_stacking");
		bookIncomes[4] = entity.getBigDecimal("may_stacking");
		bookIncomes[5] = entity.getBigDecimal("jun_stacking");
		bookIncomes[6] = entity.getBigDecimal("jul_stacking");
		bookIncomes[7] = entity.getBigDecimal("aug_stacking");
		bookIncomes[8] = entity.getBigDecimal("sep_stacking");
		bookIncomes[9] = entity.getBigDecimal("oct_stacking");
		bookIncomes[10] = entity.getBigDecimal("nov_stacking");
		bookIncomes[11] = entity.getBigDecimal("dec_stacking");
		result.set("data", bookIncomes);
		return result;
	}

	/**
	 * 元金额转为万元金额
	 */
	private BigDecimal yuanToTenThousandYuan(BigDecimal yuan) {
		BigDecimal tenThousand = new BigDecimal("10000");
		return yuan.divide(tenThousand, 2, BigDecimal.ROUND_HALF_UP);
	}

	/**
	 * 获取指定月份的最后一天
	 */
	private String getMonthEndDate(String year, String month) {
		if (StrUtil.isNotBlank(month) && month.length() == 1) {
			month = "0" + month;
		}
		String dateStr = year + "-" + month + "-01";
		DateTime date = DateUtil.parse(dateStr, "yyyy-MM-dd");
		DateTime lastDay = DateUtil.endOfMonth(date);
		return lastDay.toString("yyyy-MM-dd");
	}

	/**
	 * 获取指定月份的第一天
	 */
	private String getMonthStartDate(String year, String month) {
		if (StrUtil.isNotBlank(month) && month.length() == 1) {
			month = "0" + month;
		}
		String dateStr = year + "-" + month + "-01";
		return dateStr;
	}

	/**
	 * 根据给定的年和月获取上个月的年份及月份
	 */
	private Map<String, String> getPreviousMonth(String year, String month) {
		Map<String, String> map = new HashMap<String, String>();
		String formattedMonth = String.format("%02d", Integer.parseInt(month));
		String dateStr = year + "-" + formattedMonth + "-01";
		DateTime dateTime = DateUtil.parse(dateStr, "yyyy-MM-dd");
		DateTime lastMonthDate = DateUtil.offsetMonth(dateTime, -1);
		String lastMonthYear = String.valueOf(lastMonthDate.year());
		String lastMonthMonth = String.valueOf(lastMonthDate.month() + 1);
		map.put("year", lastMonthYear);
		map.put("month", lastMonthMonth);
		return map;
	}

	/**
	 * List转Map(根据组织)
	 */
	private Map<String, Entity> listToMapBySecOrg(List<Entity> entityList) {
		Map<String, Entity> map = new HashMap<String, Entity>();
		if (entityList != null && entityList.size() > 0) {
			entityList = entityList.stream().filter(entity -> !StrUtil.equals(entity.getStr("secondary_org"), "8") && !StrUtil.equals(entity.getStr("secondary_org"), "102123"))
					.collect(Collectors.toList());
			map = entityList.stream().collect(Collectors.toMap(entity -> entity.getStr("secondary_org"), entity -> entity, (existing, replacement) -> existing));
		}
		return map;
	}

	/**
	 * 解析百分比字符串为 BigDecimal（去除%后除以100）
	 */
	private static BigDecimal parsePercentage(String percentage) {
		if (percentage == null || !percentage.endsWith("%") || "/".equals(percentage)) {
			return BigDecimal.ZERO;
		}
		String numberPart = percentage.substring(0, percentage.length() - 1);
		return new BigDecimal(numberPart).divide(BigDecimal.valueOf(100), 4, BigDecimal.ROUND_HALF_UP);
	}

	/**
	 * 获取对象集合中指定属性的绝对值的最大值
	 */
	private static <T> BigDecimal getMaxAbsoluteValue(Collection<T> collection, Function<T, BigDecimal> mapper) {
		if (collection == null || collection.isEmpty()) {
			return null;
		}
		Optional<BigDecimal> maxOptional = collection.stream().map(mapper).filter(value -> value != null).map(BigDecimal::abs).max(Comparator.naturalOrder());
		return maxOptional.orElse(null);
	}

}
