package com.zhonghe.ame.kaohe;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Comparator;

import cn.hutool.core.util.NumberUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.db.Entity;
import cn.hutool.db.Session;

import com.eos.common.connection.DataSourceHelper;
import com.eos.system.annotation.Bizlet;

@Bizlet("收入指标分析预测工具类")
public class AnalysisAndPredictionOfIncomeIndicators {

	private String querySnapshotDetailSql = "SELECT zkssd.*, oo.ORGNAME AS secondary_orgname FROM zh_kaohe_statistics_snapshot_details AS zkssd, OM_ORGANIZATION AS oo WHERE zkssd.years = ? AND zkssd.months = ? AND zkssd.secondary_org = ? AND zkssd.secondary_org = oo.ORGID";

	private String querySnapshotDetailJTWSql = "SELECT zkssd.*, oo.ORGNAME AS secondary_orgname FROM zh_kaohe_statistics_snapshot_details AS zkssd, OM_ORGANIZATION AS oo WHERE zkssd.years = ? AND zkssd.months = ? AND zkssd.secondary_org = ? AND zkssd.headquarter_group = '1' AND zkssd.secondary_org = oo.ORGID";

	private String queryThresholdSql = "SELECT SUM(CAST(threshold_value AS DECIMAL(18,2))) AS threshold_value_sum FROM zh_operating_income_threshold WHERE sec_org = ? AND years = ? AND threshold_type = '1'";

	private String queryThresholdJTWSql = "SELECT SUM(CAST(threshold_value AS DECIMAL(18,2))) AS threshold_value_sum FROM zh_operating_income_threshold WHERE sec_org = ? AND years = ? AND threshold_type = '1' AND headquarter_group = '1'";

	private String queryDictSql = "SELECT DICTID, SORTNO FROM EOS_DICT_ENTRY WHERE DICTTYPEID = 'ZH_OPERATION_INCOME_ORG'";

	@Bizlet("营业收入")
	public List<Entity> operatingRevenueBySecOrg(String year, String month, String secOrg) {
		List<Entity> operatingRevenueList = new ArrayList<Entity>();
		if (StrUtil.isNotBlank(secOrg)) {
			Entity operatingRevenue = new Entity();
			try {
				Session dbSession = new Session(DataSourceHelper.getDataSource());
				List<Entity> snapshotDetailList = dbSession.query(querySnapshotDetailSql, year, month, secOrg);
				if (snapshotDetailList != null && snapshotDetailList.size() > 0) {
					Entity thresholdEntity = dbSession.queryOne(queryThresholdSql, secOrg, year);
					operatingRevenue = this.buildEntity(operatingRevenue, snapshotDetailList, thresholdEntity);
					operatingRevenueList.add(operatingRevenue);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			try {
				Session dbSession = new Session(DataSourceHelper.getDataSource());
				String querySql = "SELECT secondary_org FROM zh_kaohe_statistics_snapshot WHERE years = ? AND months = ?";
				List<Entity> secOrgList = dbSession.query(querySql, year, month);
				if (secOrgList != null && secOrgList.size() > 0) {
					for (Entity secOrgEntity : secOrgList) {
						Entity operatingRevenue = new Entity();
						List<Entity> snapshotDetailList = dbSession.query(querySnapshotDetailSql, year, month, secOrgEntity.getStr("secondary_org"));
						if (snapshotDetailList != null && snapshotDetailList.size() > 0) {
							Entity thresholdEntity = dbSession.queryOne(queryThresholdSql, secOrgEntity.getStr("secondary_org"), year);
							operatingRevenue = this.buildEntity(operatingRevenue, snapshotDetailList, thresholdEntity);
							operatingRevenue.set("secondary_org", secOrgEntity.getStr("secondary_org"));
							operatingRevenueList.add(operatingRevenue);
						}
					}
					Map<String, Integer> secOrderMap = this.getSecOrgOrderMap(dbSession);
					operatingRevenueList.sort(Comparator.comparing(entity -> secOrderMap.getOrDefault(entity.getStr("secondary_org"), 100)));
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return operatingRevenueList;
	}

	@Bizlet("集团外收入")
	public List<Entity> externalIncomeOfTheGroupBySecOrg(String year, String month, String secOrg) {
		List<Entity> operatingRevenueList = new ArrayList<Entity>();
		if (StrUtil.isNotBlank(secOrg)) {
			Entity operatingRevenue = new Entity();
			try {
				Session dbSession = new Session(DataSourceHelper.getDataSource());
				List<Entity> snapshotDetailList = dbSession.query(querySnapshotDetailJTWSql, year, month, secOrg);
				if (snapshotDetailList != null && snapshotDetailList.size() > 0) {
					Entity thresholdEntity = dbSession.queryOne(queryThresholdJTWSql, secOrg, year);
					operatingRevenue = this.buildEntity(operatingRevenue, snapshotDetailList, thresholdEntity);
					operatingRevenueList.add(operatingRevenue);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			try {
				Session dbSession = new Session(DataSourceHelper.getDataSource());
				String querySql = "SELECT secondary_org FROM zh_kaohe_statistics_snapshot WHERE years = ? AND months = ?";
				List<Entity> secOrgList = dbSession.query(querySql, year, month);
				if (secOrgList != null && secOrgList.size() > 0) {
					for (Entity secOrgEntity : secOrgList) {
						Entity operatingRevenue = new Entity();
						List<Entity> snapshotDetailList = dbSession.query(querySnapshotDetailJTWSql, year, month, secOrgEntity.getStr("secondary_org"));
						if (snapshotDetailList != null && snapshotDetailList.size() > 0) {
							Entity thresholdEntity = dbSession.queryOne(queryThresholdJTWSql, secOrgEntity.getStr("secondary_org"), year);
							operatingRevenue = this.buildEntity(operatingRevenue, snapshotDetailList, thresholdEntity);
							operatingRevenue.set("secondary_org", secOrgEntity.getStr("secondary_org"));
							operatingRevenueList.add(operatingRevenue);
						}
					}
					Map<String, Integer> secOrderMap = this.getSecOrgOrderMap(dbSession);
					operatingRevenueList.sort(Comparator.comparing(entity -> secOrderMap.getOrDefault(entity.getStr("secondary_org"), 100)));
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return operatingRevenueList;
	}

	// 构建填充字段值
	private Entity buildEntity(Entity operatingRevenue, List<Entity> snapshotDetailList, Entity thresholdEntity) {
		// 组织机构名称
		operatingRevenue.set("secondaryOrgname", snapshotDetailList.get(0).getStr("secondary_orgname"));
		// 期望值
		operatingRevenue.set("expectedValue", thresholdEntity.getBigDecimal("threshold_value_sum") != null ? thresholdEntity.getBigDecimal("threshold_value_sum") : BigDecimal.ZERO);
		// 全年预测（账面值）
		operatingRevenue.set("annualForecastedBookValue", this.yuanToTenThousandYuan(this.getAnnualForecastedBookValue(snapshotDetailList)));
		// 全年预测（考核值）
		operatingRevenue.set("annualForecastAssessmentValue", this.yuanToTenThousandYuan(this.getAnnualForecastAssessmentValue(snapshotDetailList)));
		// 考核值缺口
		operatingRevenue.set("assessmentValueGap", NumberUtil.sub(operatingRevenue.getBigDecimal("annualForecastAssessmentValue"), operatingRevenue.getBigDecimal("expectedValue")));
		// 截至当月已完成（账面值）
		operatingRevenue.set("asOfTheCurrentMonthTheBookValueHasBeenCompleted", this.yuanToTenThousandYuan(this.getAsOfTheCurrentMonthTheBookValueHasBeenCompleted(snapshotDetailList)));
		// 截至当月已完成（考核值）
		operatingRevenue
				.set("asOfTheCurrentMonthTheAssessmentValuesHaveBeenCompleted", this.yuanToTenThousandYuan(this.getAsOfTheCurrentMonthTheAssessmentValuesHaveBeenCompleted(snapshotDetailList)));
		// 考核值完成率
		if (operatingRevenue.getBigDecimal("expectedValue").equals(BigDecimal.ZERO)) {
			operatingRevenue.set("assessmentCompletionRate", "/");
		} else {
			operatingRevenue.set(
					"assessmentCompletionRate",
					NumberUtil.decimalFormat("#.##%",
							NumberUtil.div(operatingRevenue.getBigDecimal("asOfTheCurrentMonthTheBookValueHasBeenCompleted"), operatingRevenue.getBigDecimal("expectedValue"))));
		}
		// 后续待完成合计
		operatingRevenue.set("totalToBeCompletedInTheFuture",
				NumberUtil.sub(operatingRevenue.getBigDecimal("annualForecastAssessmentValue"), operatingRevenue.getBigDecimal("asOfTheCurrentMonthTheAssessmentValuesHaveBeenCompleted")));
		// 待签合同金额合计
		operatingRevenue.set("totalAmountOfPendingContractToBeSigned", this.yuanToTenThousandYuan(this.getTotalAmountOfPendingContractToBeSigned(snapshotDetailList)));
		// 手持合同金额合计
		operatingRevenue.set("totalHandheldContractAmount",
				NumberUtil.sub(operatingRevenue.getBigDecimal("totalToBeCompletedInTheFuture"), operatingRevenue.getBigDecimal("totalAmountOfPendingContractToBeSigned")));
		// 待签：低风险合同金额合计
		operatingRevenue.set("totalAmountOfLowriskContractToBeSigned", this.yuanToTenThousandYuan(this.getTotalAmountOfLowriskContractToBeSigned(snapshotDetailList)));
		// 待签：中风险合同金额合计
		operatingRevenue.set("totalAmountOfRiskContractsToBeSigned", this.yuanToTenThousandYuan(this.getTotalAmountOfRiskContractsToBeSigned(snapshotDetailList)));

		return operatingRevenue;
	}

	// 元金额转为万元金额
	private BigDecimal yuanToTenThousandYuan(BigDecimal yuan) {
		BigDecimal tenThousand = new BigDecimal("10000");
		return yuan.divide(tenThousand, 2, BigDecimal.ROUND_HALF_UP);
	}

	// 全年预测（账面值）
	private BigDecimal getAnnualForecastedBookValue(List<Entity> snapshotDetailList) {
		return snapshotDetailList.stream().filter(snapshotDetail -> !"3".equals(snapshotDetail.getStr("risk_level")) && !"5".equals(snapshotDetail.getStr("contract_stauts")))
				.map(snapshotDetail -> snapshotDetail.getBigDecimal("sum_exclude_tax")).reduce(BigDecimal.ZERO, BigDecimal::add);
	}

	// 全年预测（考核值）
	private BigDecimal getAnnualForecastAssessmentValue(List<Entity> snapshotDetailList) {
		return snapshotDetailList.stream().filter(snapshotDetail -> !"3".equals(snapshotDetail.getStr("risk_level"))).map(snapshotDetail -> snapshotDetail.getBigDecimal("coefficient_sum"))
				.reduce(BigDecimal.ZERO, BigDecimal::add);
	}

	// 截至当月已完成（账面值）
	private BigDecimal getAsOfTheCurrentMonthTheBookValueHasBeenCompleted(List<Entity> snapshotDetailList) {
		return snapshotDetailList.stream().filter(snapshotDetail -> !"3".equals(snapshotDetail.getStr("risk_level")) && !"5".equals(snapshotDetail.getStr("contract_stauts")))
				.map(snapshotDetail -> snapshotDetail.getBigDecimal("sum_total_book_income")).reduce(BigDecimal.ZERO, BigDecimal::add);
	}

	// 截至当月已完成（考核值）
	private BigDecimal getAsOfTheCurrentMonthTheAssessmentValuesHaveBeenCompleted(List<Entity> snapshotDetailList) {
		return snapshotDetailList.stream().filter(snapshotDetail -> !"3".equals(snapshotDetail.getStr("risk_level")))
				.map(snapshotDetail -> NumberUtil.mul(snapshotDetail.getBigDecimal("sum_total_book_income"), snapshotDetail.getBigDecimal("coefficient"))).reduce(BigDecimal.ZERO, BigDecimal::add);
	}

	// 待签合同金额合计
	private BigDecimal getTotalAmountOfPendingContractToBeSigned(List<Entity> snapshotDetailList) {
		return snapshotDetailList.stream().filter(snapshotDetail -> !"3".equals(snapshotDetail.getStr("risk_level")) && "2".equals(snapshotDetail.getStr("contract_stauts")))
				.map(snapshotDetail -> snapshotDetail.getBigDecimal("coefficient_sum")).reduce(BigDecimal.ZERO, BigDecimal::add);
	}

	// 待签：低风险合同金额合计
	private BigDecimal getTotalAmountOfLowriskContractToBeSigned(List<Entity> snapshotDetailList) {
		return snapshotDetailList.stream().filter(snapshotDetail -> "1".equals(snapshotDetail.getStr("risk_level")) && "2".equals(snapshotDetail.getStr("contract_stauts")))
				.map(snapshotDetail -> snapshotDetail.getBigDecimal("coefficient_sum")).reduce(BigDecimal.ZERO, BigDecimal::add);
	}

	// 待签：中风险合同金额合计
	private BigDecimal getTotalAmountOfRiskContractsToBeSigned(List<Entity> snapshotDetailList) {
		return snapshotDetailList.stream().filter(snapshotDetail -> "2".equals(snapshotDetail.getStr("risk_level")) && "2".equals(snapshotDetail.getStr("contract_stauts")))
				.map(snapshotDetail -> snapshotDetail.getBigDecimal("coefficient_sum")).reduce(BigDecimal.ZERO, BigDecimal::add);
	}

	private Map<String, Integer> getSecOrgOrderMap(Session dbSession) throws Exception {
		Map<String, Integer> map = new HashMap<String, Integer>();
		List<Entity> dictList = dbSession.query(queryDictSql);
		for (Entity dict : dictList) {
			map.put(dict.getStr("DICTID"), dict.getInt("SORTNO"));
		}
		return map;
	}

}
