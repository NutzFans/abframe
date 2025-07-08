package com.zhonghe.ame.kaohe;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import mondrian.rolap.BitKey.Big;
import java_cup.production;
import cn.hutool.core.date.DateTime;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.IdUtil;
import cn.hutool.core.util.NumberUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.db.Entity;
import cn.hutool.db.Session;

import com.eos.common.connection.DataSourceHelper;
import com.eos.runtime.core.TraceLoggerFactory;
import com.eos.system.annotation.Bizlet;
import com.eos.system.logging.Logger;
import com.itextpdf.text.pdf.PdfStructTreeController.returnType;

@Bizlet("公司领导推送统计数据生成")
public class CompanyLeadershipChartJob {

	Logger logger = TraceLoggerFactory.getLogger(this.getClass());

	// 根据年月删除数据
	private String delSql = "DELETE FROM zh_kaohe_company_chart WHERE years = ? AND months = ?";

	private String delSqlIncomeTrends = "DELETE FROM zh_kaohe_company_chart_income_trends WHERE years = ? AND months = ?";

	// 月份英文缩写映射
	private static final Map<String, Integer> MONTH_MAP = new HashMap<>();

	static {
		MONTH_MAP.put("jan", 1);
		MONTH_MAP.put("feb", 2);
		MONTH_MAP.put("mar", 3);
		MONTH_MAP.put("apr", 4);
		MONTH_MAP.put("may", 5);
		MONTH_MAP.put("jun", 6);
		MONTH_MAP.put("jul", 7);
		MONTH_MAP.put("aug", 8);
		MONTH_MAP.put("sep", 9);
		MONTH_MAP.put("oct", 10);
		MONTH_MAP.put("nov", 11);
		MONTH_MAP.put("dec", 12);
	}

	@Bizlet("自动生成")
	public void automaticGenerate() throws Exception {
		String querySql = "SELECT * FROM zh_kaohe_company_chart WHERE (push_status = '已推送' OR push_status = '已推送(部分成功)') AND  years = ? AND months = ?";
		Session dbSession = new Session(DataSourceHelper.getDataSource());
		logger.info("【执行】定时任务 - 公司领导推送统计数据生成 - 自动生成");
		Map<String, String> dateMap = this.getPreviousMonth();
		Entity entity = dbSession.queryOne(querySql, dateMap.get("year"), dateMap.get("month"));
		if (entity != null) {
			logger.warn("【执行】定时任务 - 公司领导推送统计数据生成 - 已有已推送的数据，无法生成");
		} else {
			Entity companyChartEntity = this.buildChartData(dateMap.get("year"), dateMap.get("month"), dbSession);
			List<Entity> incomeTrendsDataEntityList = this.buildChartIncomeTrendsData(dateMap.get("year"), dateMap.get("month"), dbSession);
			companyChartEntity.set("chart_method", "定时任务生成");
			companyChartEntity.set("create_by", "定时任务");
			companyChartEntity.set("create_time", DateUtil.date());
			companyChartEntity.set("push_status", "未推送");
			dbSession.execute(delSql, dateMap.get("year"), dateMap.get("month"));
			dbSession.execute(delSqlIncomeTrends, dateMap.get("year"), dateMap.get("month"));
			dbSession.insert(companyChartEntity);
			dbSession.insert(incomeTrendsDataEntityList);
		}
	}

	@Bizlet("手动生成")
	public Boolean artificialGenerate(String year, String month, String createBy) throws Exception {
		String querySql = "SELECT * FROM zh_kaohe_company_chart WHERE (push_status = '已推送' OR push_status = '已推送(部分成功)') AND  years = ? AND months = ?";
		Session dbSession = new Session(DataSourceHelper.getDataSource());
		Entity entity = dbSession.queryOne(querySql, year, month);
		if (entity != null) {
			return false;
		} else {
			Entity companyChartEntity = this.buildChartData(year, month, dbSession);
			List<Entity> incomeTrendsDataEntityList = this.buildChartIncomeTrendsData(year, month, dbSession);
			companyChartEntity.set("chart_method", "人工手动生成");
			companyChartEntity.set("create_by", createBy);
			companyChartEntity.set("create_time", DateUtil.date());
			companyChartEntity.set("push_status", "未推送");
			dbSession.execute(delSql, year, month);
			dbSession.execute(delSqlIncomeTrends, year, month);
			dbSession.insert(companyChartEntity);
			dbSession.insert(incomeTrendsDataEntityList);
			return true;
		}

	}

	/**
	 * 构建插入 zh_kaohe_company_chart 表的数据集合
	 */
	private Entity buildChartData(String year, String month, Session dbSession) throws Exception {
		Entity companyChartEntity = Entity.create("zh_kaohe_company_chart");
		// 主键
		companyChartEntity.set("id", IdUtil.objectId());
		// 统计年份
		companyChartEntity.set("years", year);
		// 统计月份
		companyChartEntity.set("months", month);
		// 统计名称
		companyChartEntity.set("chart_name", this.getChartName(year, month));
		// 月末手持合同额
		companyChartEntity.set("contract_amount_held_at_the_end_of_the_month", this.yuanToTenThousandYuan(this.getContractAmountHeldAtTheEndOfTheMonth(year, month, dbSession)));
		// 月末手持合同额 - 集团外
		companyChartEntity.set("end_of_month_contract_amount_held_outside_the_group", this.yuanToTenThousandYuan(this.getEndOfMonthContractAmountHeldOutsideTheGroup(year, month, dbSession)));
		// 本年新签合同额
		companyChartEntity.set("new_contract_amount_signed_this_year", this.yuanToTenThousandYuan(this.getNewContractAmountSignedThisYear(year, month, dbSession)));
		// 本年新签合同额 - 集团外
		companyChartEntity.set("new_contract_amount_signed_this_year_outside_the_group", this.yuanToTenThousandYuan(this.getNewContractAmountSignedThisYearOutsideTheGroup(year, month, dbSession)));
		// 本年新签合同额 - 同比
		companyChartEntity.set("new_contract_amount_signed_this_year_compared_to_the_same_period_last_year",
				this.getNewContractAmountSignedThisYearComparedToTheSamePeriodLastYear(year, month, dbSession, companyChartEntity.getBigDecimal("new_contract_amount_signed_this_year")));
		// 本年新签合同额 - 集团外 - 同比
		companyChartEntity.set(
				"new_contract_amount_signed_this_year_compared_to_the_same_period_last_year_outside_the_group",
				this.getNewContractAmountSignedThisYearComparedToTheSamePeriodLastYearOutsideTheGroup(year, month, dbSession,
						companyChartEntity.getBigDecimal("new_contract_amount_signed_this_year_outside_the_group")));
		// 本年营业收入
		companyChartEntity.set("operating_revenue_for_this_year", this.yuanToTenThousandYuan(this.getOperatingRevenueForThisYear(year, month, dbSession)));
		// 本年营业收入 - 集团外
		companyChartEntity.set("this_years_operating_revenue_outside_the_group", this.yuanToTenThousandYuan(this.getThisYearsOperatingRevenueOutsideTheGroup(year, month, dbSession)));
		// 本年营业收入 - 同比
		companyChartEntity.set("year_on_year_operating_revenue_for_this_year",
				this.getYearOnYearOperatingRevenueForThisYear(year, month, dbSession, companyChartEntity.getBigDecimal("operating_revenue_for_this_year")));
		// 本年营业收入 - 集团外 - 同比
		companyChartEntity.set(
				"this_years_operating_revenue_compared_to_the_same_period_last_year_outside_the_group",
				this.getThisYearsOperatingRevenueComparedToTheSamePeriodLastYearOutsideTheGroup(year, month, dbSession,
						companyChartEntity.getBigDecimal("this_years_operating_revenue_outside_the_group")));
		// 项目承揽率
		companyChartEntity.set("project_acceptance_rate", this.getProjectAcceptanceRate(year, month, dbSession));
		// 项目承揽率 - 集团外
		companyChartEntity.set("project_acceptance_rate_outside_the_group", this.getProjectAcceptanceRateOutsideTheGroup(year, month, dbSession));

		return companyChartEntity;
	}

	/**
	 * 构建插入 zh_kaohe_company_chart_income_trends 表的数据
	 */
	private List<Entity> buildChartIncomeTrendsData(String year, String month, Session dbSession) throws Exception {
		// 全部实际
		String querySql = "SELECT create_time, book_income FROM zh_invoice WHERE app_status = '2' AND create_time >= ? AND create_time <= ?";
		// 全部预测
		String querySqlTrend = "SELECT jan, feb, mar, apr, may, jun, jul, aug, sep, oct, nov, [dec] FROM zh_kaohe_statistics_snapshot_details WHERE contract_stauts !='5' AND(risk_level != '3' OR risk_level IS NULL) AND years = ? AND months = ?";
		// 集团外实际
		String querySqlByOutsideTheGroup = "SELECT create_time, book_income FROM zh_invoice WHERE app_status = '2' AND headquarter_group = '1' AND create_time >= ? AND create_time <= ?";
		// 集团外预测
		String querySqlByOutsideTheGroupTrend = "SELECT jan, feb, mar, apr, may, jun, jul, aug, sep, oct, nov, [dec] FROM zh_kaohe_statistics_snapshot_details WHERE contract_stauts !='5' AND(risk_level != '3' OR risk_level IS NULL) AND headquarter_group = '1' AND years = ? AND months = ?";
		// 全部实际 - 咨询
		String querySqlByMajorZX = "SELECT create_time, book_income FROM zh_invoice WHERE app_status = '2' AND major = '1' AND create_time >= ? AND create_time <= ?";
		// 全部预测 - 咨询
		String querySqlByMajorZXTrend = "SELECT jan, feb, mar, apr, may, jun, jul, aug, sep, oct, nov, [dec] FROM zh_kaohe_statistics_snapshot_details WHERE contract_stauts !='5' AND(risk_level != '3' OR risk_level IS NULL) AND major = '1' AND years = ? AND months = ?";
		// 集团外实际 - 咨询
		String querySqlByOutsideTheGroupMajorZX = "SELECT create_time, book_income FROM zh_invoice WHERE app_status = '2' AND headquarter_group = '1' AND major = '1' AND create_time >= ? AND create_time <= ?";
		// 集团外预测 - 咨询
		String querySqlByOutsideTheGroupMajorZXTrend = "SELECT jan, feb, mar, apr, may, jun, jul, aug, sep, oct, nov, [dec] FROM zh_kaohe_statistics_snapshot_details WHERE contract_stauts !='5' AND(risk_level != '3' OR risk_level IS NULL) AND headquarter_group = '1' AND major = '1' AND years = ? AND months = ?";
		// 全部实际 - 监理
		String querySqlByMajorJL = "SELECT create_time, book_income FROM zh_invoice WHERE app_status = '2' AND major = '6' AND create_time >= ? AND create_time <= ?";
		// 全部预测 - 监理
		String querySqlByMajorJLTrend = "SELECT jan, feb, mar, apr, may, jun, jul, aug, sep, oct, nov, [dec] FROM zh_kaohe_statistics_snapshot_details WHERE contract_stauts !='5' AND(risk_level != '3' OR risk_level IS NULL) AND major = '6' AND years = ? AND months = ?";
		// 集团外实际 - 监理
		String querySqlByOutsideTheGroupMajorJL = "SELECT create_time, book_income FROM zh_invoice WHERE app_status = '2' AND headquarter_group = '1' AND major = '6' AND create_time >= ? AND create_time <= ?";
		// 集团外预测 - 监理
		String querySqlByOutsideTheGroupMajorJLTrend = "SELECT jan, feb, mar, apr, may, jun, jul, aug, sep, oct, nov, [dec] FROM zh_kaohe_statistics_snapshot_details WHERE contract_stauts !='5' AND(risk_level != '3' OR risk_level IS NULL) AND headquarter_group = '1' AND major = '6' AND years = ? AND months = ?";
		// 全部实际 - 设备监理
		String querySqlByMajorSBJL = "SELECT create_time, book_income FROM zh_invoice WHERE app_status = '2' AND major = '7' AND create_time >= ? AND create_time <= ?";
		// 全部预测 - 设备监理
		String querySqlByMajorSBJLTrend = "SELECT jan, feb, mar, apr, may, jun, jul, aug, sep, oct, nov, [dec] FROM zh_kaohe_statistics_snapshot_details WHERE contract_stauts !='5' AND(risk_level != '3' OR risk_level IS NULL) AND major = '7' AND years = ? AND months = ?";
		// 集团外实际 - 设备监理
		String querySqlByOutsideTheGroupMajorSBJL = "SELECT create_time, book_income FROM zh_invoice WHERE app_status = '2' AND headquarter_group = '1' AND major = '7' AND create_time >= ? AND create_time <= ?";
		// 集团外预测 - 设备监理
		String querySqlByOutsideTheGroupMajorSBJLTrend = "SELECT jan, feb, mar, apr, may, jun, jul, aug, sep, oct, nov, [dec] FROM zh_kaohe_statistics_snapshot_details WHERE contract_stauts !='5' AND(risk_level != '3' OR risk_level IS NULL) AND headquarter_group = '1' AND major = '7' AND years = ? AND months = ?";
		// 全部实际 - 工程检测
		String querySqlByMajorGCJC = "SELECT create_time, book_income FROM zh_invoice WHERE app_status = '2' AND major = '12' AND create_time >= ? AND create_time <= ?";
		// 全部预测 - 工程检测
		String querySqlByMajorGCJCTrend = "SELECT jan, feb, mar, apr, may, jun, jul, aug, sep, oct, nov, [dec] FROM zh_kaohe_statistics_snapshot_details WHERE contract_stauts !='5' AND(risk_level != '3' OR risk_level IS NULL) AND major = '12' AND years = ? AND months = ?";
		// 集团外实际 - 工程检测
		String querySqlByOutsideTheGroupMajorGCJC = "SELECT create_time, book_income FROM zh_invoice WHERE app_status = '2' AND headquarter_group = '1' AND major = '12' AND create_time >= ? AND create_time <= ?";
		// 集团外预测 - 工程检测
		String querySqlByOutsideTheGroupMajorGCJCTrend = "SELECT jan, feb, mar, apr, may, jun, jul, aug, sep, oct, nov, [dec] FROM zh_kaohe_statistics_snapshot_details WHERE contract_stauts !='5' AND(risk_level != '3' OR risk_level IS NULL) AND headquarter_group = '1' AND major = '12' AND years = ? AND months = ?";

		List<Entity> incomeTrendsDatas = new ArrayList<Entity>();
		String startDate = StrUtil.format("{}-{}-{}", year, "01", "01");
		String monthEndDate = this.getMonthEndDate(year, month);
		// 全部
		incomeTrendsDatas.add(this.fillChartIncomeTrendsData(dbSession.query(querySql, startDate, monthEndDate), dbSession.query(querySqlTrend, year, month), year, month, "0", "0"));
		// 集团外
		incomeTrendsDatas.add(this.fillChartIncomeTrendsData(dbSession.query(querySqlByOutsideTheGroup, startDate, monthEndDate), dbSession.query(querySqlByOutsideTheGroupTrend, year, month), year,
				month, "1", "0"));
		// 全部 - 咨询
		incomeTrendsDatas.add(this.fillChartIncomeTrendsData(dbSession.query(querySqlByMajorZX, startDate, monthEndDate), dbSession.query(querySqlByMajorZXTrend, year, month), year, month, "0", "1"));
		// 集团外 - 咨询
		incomeTrendsDatas.add(this.fillChartIncomeTrendsData(dbSession.query(querySqlByOutsideTheGroupMajorZX, startDate, monthEndDate),
				dbSession.query(querySqlByOutsideTheGroupMajorZXTrend, year, month), year, month, "1", "1"));
		// 全部 - 监理
		incomeTrendsDatas.add(this.fillChartIncomeTrendsData(dbSession.query(querySqlByMajorJL, startDate, monthEndDate), dbSession.query(querySqlByMajorJLTrend, year, month), year, month, "0", "6"));
		// 集团外 - 监理
		incomeTrendsDatas.add(this.fillChartIncomeTrendsData(dbSession.query(querySqlByOutsideTheGroupMajorJL, startDate, monthEndDate),
				dbSession.query(querySqlByOutsideTheGroupMajorJLTrend, year, month), year, month, "1", "6"));
		// 全部 - 设备监理
		incomeTrendsDatas.add(this.fillChartIncomeTrendsData(dbSession.query(querySqlByMajorSBJL, startDate, monthEndDate), dbSession.query(querySqlByMajorSBJLTrend, year, month), year, month, "0",
				"7"));
		// 集团外 - 设备监理
		incomeTrendsDatas.add(this.fillChartIncomeTrendsData(dbSession.query(querySqlByOutsideTheGroupMajorSBJL, startDate, monthEndDate),
				dbSession.query(querySqlByOutsideTheGroupMajorSBJLTrend, year, month), year, month, "1", "7"));
		// 全部 - 工程检测
		incomeTrendsDatas.add(this.fillChartIncomeTrendsData(dbSession.query(querySqlByMajorGCJC, startDate, monthEndDate), dbSession.query(querySqlByMajorGCJCTrend, year, month), year, month, "0",
				"12"));
		// 集团外 - 工程检测
		incomeTrendsDatas.add(this.fillChartIncomeTrendsData(dbSession.query(querySqlByOutsideTheGroupMajorGCJC, startDate, monthEndDate),
				dbSession.query(querySqlByOutsideTheGroupMajorGCJCTrend, year, month), year, month, "1", "12"));

		return incomeTrendsDatas;
	}

	// 统计名称
	private String getChartName(String year, String month) {
		return StrUtil.format("{}年{}月公司生产经营情况统计", year, month);
	}

	// 月末手持合同额
	private BigDecimal getContractAmountHeldAtTheEndOfTheMonth(String year, String month, Session dbSession) throws Exception {
		String querySql = "SELECT SUM(contract_balance) AS contract_balance_sum FROM zh_charge_contract WHERE app_status = '2' AND create_time <= ?";
		String monthEndDate = this.getMonthEndDate(year, month);
		Entity entity = dbSession.queryOne(querySql, monthEndDate);
		return entity.getBigDecimal("contract_balance_sum");
	}

	// 月末手持合同额 - 集团外
	private BigDecimal getEndOfMonthContractAmountHeldOutsideTheGroup(String year, String month, Session dbSession) throws Exception {
		String querySql = "SELECT SUM(contract_balance) AS contract_balance_sum FROM zh_charge_contract WHERE app_status = '2' AND headquarter_group='1' AND create_time <= ?";
		String monthEndDate = this.getMonthEndDate(year, month);
		Entity entity = dbSession.queryOne(querySql, monthEndDate);
		return entity.getBigDecimal("contract_balance_sum");
	}

	// 本年新签合同额
	private BigDecimal getNewContractAmountSignedThisYear(String year, String month, Session dbSession) throws Exception {
		String querySql = "SELECT SUM ( CAST ( contract_sum AS NUMERIC ( 18, 2 ) ) ) AS contract_sums FROM zh_charge_contract WHERE app_status = '2'  AND signing_date >= ? AND signing_date <= ?";
		String startDate = StrUtil.format("{}-{}-{}", year, "01", "01");
		String monthEndDate = this.getMonthEndDate(year, month);
		Entity entity = dbSession.queryOne(querySql, startDate, monthEndDate);
		return entity.getBigDecimal("contract_sums") != null ? entity.getBigDecimal("contract_sums") : BigDecimal.ZERO;
	}

	// 本年新签合同额 - 集团外
	private BigDecimal getNewContractAmountSignedThisYearOutsideTheGroup(String year, String month, Session dbSession) throws Exception {
		String querySql = "SELECT SUM ( CAST ( contract_sum AS NUMERIC ( 18, 2 ) ) ) AS contract_sums FROM zh_charge_contract WHERE app_status = '2'  AND headquarter_group = '1' AND signing_date >= ? AND signing_date <= ?";
		String startDate = StrUtil.format("{}-{}-{}", year, "01", "01");
		String monthEndDate = this.getMonthEndDate(year, month);
		Entity entity = dbSession.queryOne(querySql, startDate, monthEndDate);
		return entity.getBigDecimal("contract_sums") != null ? entity.getBigDecimal("contract_sums") : BigDecimal.ZERO;
	}

	// 本年新签合同额 - 同比
	private BigDecimal getNewContractAmountSignedThisYearComparedToTheSamePeriodLastYear(String year, String month, Session dbSession, BigDecimal newContractAmountSignedThisYear) throws Exception {
		String querySql = "SELECT SUM ( CAST ( contract_sum AS NUMERIC ( 18, 2 ) ) ) AS contract_sums FROM zh_charge_contract WHERE app_status = '2'  AND signing_date >= ? AND signing_date <= ?";
		String[] dateRange = this.getLastYearDateRange(year, month);
		Entity entity = dbSession.queryOne(querySql, dateRange[0], dateRange[1]);
		BigDecimal contractAmountSignedLastYear = entity.getBigDecimal("contract_sums") != null ? entity.getBigDecimal("contract_sums") : BigDecimal.ZERO;
		if (contractAmountSignedLastYear.equals(BigDecimal.ZERO)) {
			return BigDecimal.ONE;
		} else {
			return NumberUtil.div(NumberUtil.sub(newContractAmountSignedThisYear, this.yuanToTenThousandYuan(contractAmountSignedLastYear)), this.yuanToTenThousandYuan(contractAmountSignedLastYear),
					2);
		}
	}

	// 本年新签合同额 - 集团外 - 同比
	private BigDecimal getNewContractAmountSignedThisYearComparedToTheSamePeriodLastYearOutsideTheGroup(String year, String month, Session dbSession,
			BigDecimal newContractAmountSignedThisYearOutsideTheGroup) throws Exception {
		String querySql = "SELECT SUM ( CAST ( contract_sum AS NUMERIC ( 18, 2 ) ) ) AS contract_sums FROM zh_charge_contract WHERE app_status = '2'  AND headquarter_group = '1' AND signing_date >= ? AND signing_date <= ?";
		String[] dateRange = this.getLastYearDateRange(year, month);
		Entity entity = dbSession.queryOne(querySql, dateRange[0], dateRange[1]);
		BigDecimal newContractAmountSignedLastYearOutsideTheGroup = entity.getBigDecimal("contract_sums") != null ? entity.getBigDecimal("contract_sums") : BigDecimal.ZERO;
		if (newContractAmountSignedLastYearOutsideTheGroup.equals(BigDecimal.ZERO)) {
			return BigDecimal.ONE;
		} else {
			return NumberUtil.div(NumberUtil.sub(newContractAmountSignedThisYearOutsideTheGroup, this.yuanToTenThousandYuan(newContractAmountSignedLastYearOutsideTheGroup)),
					this.yuanToTenThousandYuan(newContractAmountSignedLastYearOutsideTheGroup), 2);
		}
	}

	// 本年营业收入
	private BigDecimal getOperatingRevenueForThisYear(String year, String month, Session dbSession) throws Exception {
		String querySql = "SELECT SUM(book_income) AS book_income_sum FROM zh_invoice WHERE app_status= '2' AND create_time >= ? AND create_time <= ?";
		String startDate = StrUtil.format("{}-{}-{}", year, "01", "01");
		String monthEndDate = this.getMonthEndDate(year, month);
		Entity entity = dbSession.queryOne(querySql, startDate, monthEndDate);
		return entity.getBigDecimal("book_income_sum") != null ? entity.getBigDecimal("book_income_sum") : BigDecimal.ZERO;
	}

	// 本年营业收入 - 集团外
	private BigDecimal getThisYearsOperatingRevenueOutsideTheGroup(String year, String month, Session dbSession) throws Exception {
		String querySql = "SELECT SUM(book_income) AS book_income_sum FROM zh_invoice WHERE app_status= '2' AND headquarter_group = '1' AND create_time >= ? AND create_time <= ?";
		String startDate = StrUtil.format("{}-{}-{}", year, "01", "01");
		String monthEndDate = this.getMonthEndDate(year, month);
		Entity entity = dbSession.queryOne(querySql, startDate, monthEndDate);
		return entity.getBigDecimal("book_income_sum") != null ? entity.getBigDecimal("book_income_sum") : BigDecimal.ZERO;
	}

	// 本年营业收入 - 同比
	private BigDecimal getYearOnYearOperatingRevenueForThisYear(String year, String month, Session dbSession, BigDecimal operatingRevenueForThisYear) throws Exception {
		String querySql = "SELECT SUM(book_income) AS book_income_sum FROM zh_invoice WHERE app_status= '2' AND create_time >= ? AND create_time <= ?";
		String[] dateRange = this.getLastYearDateRange(year, month);
		Entity entity = dbSession.queryOne(querySql, dateRange[0], dateRange[1]);
		BigDecimal operatingRevenueForLastYear = entity.getBigDecimal("book_income_sum") != null ? entity.getBigDecimal("book_income_sum") : BigDecimal.ZERO;
		if (operatingRevenueForLastYear.equals(BigDecimal.ZERO)) {
			return BigDecimal.ONE;
		} else {
			return NumberUtil.div(NumberUtil.sub(operatingRevenueForThisYear, this.yuanToTenThousandYuan(operatingRevenueForLastYear)), this.yuanToTenThousandYuan(operatingRevenueForLastYear), 2);
		}
	}

	// 本年营业收入 - 集团外 - 同比
	private BigDecimal getThisYearsOperatingRevenueComparedToTheSamePeriodLastYearOutsideTheGroup(String year, String month, Session dbSession, BigDecimal thisYearsOperatingRevenueOutsideTheGroup)
			throws Exception {
		String querySql = "SELECT SUM(book_income) AS book_income_sum FROM zh_invoice WHERE app_status= '2' AND headquarter_group = '1' AND create_time >= ? AND create_time <= ?";
		String[] dateRange = this.getLastYearDateRange(year, month);
		Entity entity = dbSession.queryOne(querySql, dateRange[0], dateRange[1]);
		BigDecimal lastYearsOperatingRevenueOutsideTheGroup = entity.getBigDecimal("book_income_sum") != null ? entity.getBigDecimal("book_income_sum") : BigDecimal.ZERO;
		if (lastYearsOperatingRevenueOutsideTheGroup.equals(BigDecimal.ZERO)) {
			return BigDecimal.ONE;
		} else {
			return NumberUtil.div(NumberUtil.sub(thisYearsOperatingRevenueOutsideTheGroup, this.yuanToTenThousandYuan(lastYearsOperatingRevenueOutsideTheGroup)),
					this.yuanToTenThousandYuan(lastYearsOperatingRevenueOutsideTheGroup), 2);
		}
	}

	// 项目承揽率
	private BigDecimal getProjectAcceptanceRate(String year, String month, Session dbSession) throws Exception {
		String querySqlTotalNumber = "SELECT COUNT(id) AS total_number FROM ZH_BIDINFO WHERE bid_data_status = '1' AND bid_date >= ? AND bid_date <= ?";
		String querySqlBidwinningAmount = "SELECT COUNT(id) AS bidwinning_amount FROM ZH_BIDINFO WHERE bid_data_status = '1' AND bid_result = '1' AND bid_date >= ? AND bid_date <= ?";
		String startDate = StrUtil.format("{}-{}-{}", year, "01", "01");
		String monthEndDate = this.getMonthEndDate(year, month);
		Entity totalNumberEntity = dbSession.queryOne(querySqlTotalNumber, startDate, monthEndDate);
		Entity bidwinningAmountEntity = dbSession.queryOne(querySqlBidwinningAmount, startDate, monthEndDate);
		Integer totalNumber = totalNumberEntity.getInt("total_number") != null ? totalNumberEntity.getInt("total_number") : 0;
		Integer bidwinningAmount = bidwinningAmountEntity.getInt("bidwinning_amount") != null ? bidwinningAmountEntity.getInt("bidwinning_amount") : 0;
		if (totalNumber == 0 || bidwinningAmount == 0) {
			return BigDecimal.ZERO;
		} else {
			return NumberUtil.div(bidwinningAmount, totalNumber, 2);
		}
	}

	// 项目承揽率 - 集团外
	private BigDecimal getProjectAcceptanceRateOutsideTheGroup(String year, String month, Session dbSession) throws Exception {
		String querySqlTotalNumber = "SELECT COUNT(id) AS total_number FROM ZH_BIDINFO WHERE bid_data_status = '1' AND headquarter_group = '1' AND bid_date >= ? AND bid_date <= ?";
		String querySqlBidwinningAmount = "SELECT COUNT(id) AS bidwinning_amount FROM ZH_BIDINFO WHERE bid_data_status = '1' AND headquarter_group = '1' AND bid_result = '1' AND bid_date >= ? AND bid_date <= ?";
		String startDate = StrUtil.format("{}-{}-{}", year, "01", "01");
		String monthEndDate = this.getMonthEndDate(year, month);
		Entity totalNumberEntity = dbSession.queryOne(querySqlTotalNumber, startDate, monthEndDate);
		Entity bidwinningAmountEntity = dbSession.queryOne(querySqlBidwinningAmount, startDate, monthEndDate);
		Integer totalNumber = totalNumberEntity.getInt("total_number") != null ? totalNumberEntity.getInt("total_number") : 0;
		Integer bidwinningAmount = bidwinningAmountEntity.getInt("bidwinning_amount") != null ? bidwinningAmountEntity.getInt("bidwinning_amount") : 0;
		if (totalNumber == 0 || bidwinningAmount == 0) {
			return BigDecimal.ZERO;
		} else {
			return NumberUtil.div(bidwinningAmount, totalNumber, 2);
		}
	}

	/**
	 * 填充 zh_kaohe_company_chart_income_trends 表数据对象
	 */
	public Entity fillChartIncomeTrendsData(List<Entity> entityList, List<Entity> entityTrendList, String year, String month, String outside_the_group, String major) {
		Entity incomeTrend = Entity.create("zh_kaohe_company_chart_income_trends");
		// 主键
		incomeTrend.set("id", IdUtil.objectId());
		// 统计年份
		incomeTrend.set("years", year);
		// 统计月份
		incomeTrend.set("months", month);
		// 集团外(0：全部、1：集团外)
		incomeTrend.set("outside_the_group", outside_the_group);
		// 专业类别（字典：ZH_MAJOR_TYPE，0：全部）
		incomeTrend.set("major", major);

		Map<Integer, BigDecimal> processInvoiceData = this.processInvoiceData(entityList, month);

		BigDecimal monthStacking = processInvoiceData.containsKey(Integer.valueOf(month).intValue()) ? processInvoiceData.get(Integer.valueOf(month).intValue()) : BigDecimal.ZERO;

		Map<Integer, BigDecimal> mergeCumulativeMap = this.mergeCumulativeMaps(processInvoiceData, this.processTrendData(entityTrendList, month, monthStacking));

		// 一月叠加金额
		incomeTrend.set("jan_stacking", mergeCumulativeMap.containsKey(1) ? this.yuanToTenThousandYuan(mergeCumulativeMap.get(1)) : BigDecimal.ZERO);
		// 二月叠加金额
		incomeTrend.set("feb_stacking", mergeCumulativeMap.containsKey(2) ? this.yuanToTenThousandYuan(mergeCumulativeMap.get(2)) : BigDecimal.ZERO);
		// 三月叠加金额
		incomeTrend.set("mar_stacking", mergeCumulativeMap.containsKey(3) ? this.yuanToTenThousandYuan(mergeCumulativeMap.get(3)) : BigDecimal.ZERO);
		// 四月叠加金额
		incomeTrend.set("apr_stacking", mergeCumulativeMap.containsKey(4) ? this.yuanToTenThousandYuan(mergeCumulativeMap.get(4)) : BigDecimal.ZERO);
		// 五月叠加金额
		incomeTrend.set("may_stacking", mergeCumulativeMap.containsKey(5) ? this.yuanToTenThousandYuan(mergeCumulativeMap.get(5)) : BigDecimal.ZERO);
		// 六月叠加金额
		incomeTrend.set("jun_stacking", mergeCumulativeMap.containsKey(6) ? this.yuanToTenThousandYuan(mergeCumulativeMap.get(6)) : BigDecimal.ZERO);
		// 七月叠加金额
		incomeTrend.set("jul_stacking", mergeCumulativeMap.containsKey(7) ? this.yuanToTenThousandYuan(mergeCumulativeMap.get(7)) : BigDecimal.ZERO);
		// 八月叠加金额
		incomeTrend.set("aug_stacking", mergeCumulativeMap.containsKey(8) ? this.yuanToTenThousandYuan(mergeCumulativeMap.get(8)) : BigDecimal.ZERO);
		// 九月叠加金额
		incomeTrend.set("sep_stacking", mergeCumulativeMap.containsKey(9) ? this.yuanToTenThousandYuan(mergeCumulativeMap.get(9)) : BigDecimal.ZERO);
		// 十月叠加金额
		incomeTrend.set("oct_stacking", mergeCumulativeMap.containsKey(10) ? this.yuanToTenThousandYuan(mergeCumulativeMap.get(10)) : BigDecimal.ZERO);
		// 十一月叠加金额
		incomeTrend.set("nov_stacking", mergeCumulativeMap.containsKey(11) ? this.yuanToTenThousandYuan(mergeCumulativeMap.get(11)) : BigDecimal.ZERO);
		// 十二月叠加金额
		incomeTrend.set("dec_stacking", mergeCumulativeMap.containsKey(12) ? this.yuanToTenThousandYuan(mergeCumulativeMap.get(12)) : BigDecimal.ZERO);

		return incomeTrend;

	}

	// 月份营业收入 - 实际部分
	private Map<Integer, BigDecimal> processInvoiceData(List<Entity> entityList, String months) {
		// 按月累计值
		Map<Integer, BigDecimal> cumulativeIncome = new TreeMap<>();
		if (entityList != null && entityList.size() > 0) {
			// 按月份存储每月的总收入
			Map<Integer, BigDecimal> monthlyIncome = new TreeMap<>();
			for (int month = 1; month <= Integer.valueOf(months).intValue(); month++) {
				monthlyIncome.put(month, BigDecimal.ZERO);
			}
			// 按月统计book_income
			for (Entity entity : entityList) {
				DateTime createTime = DateTime.of(entity.getDate("create_time"));
				int month = createTime.month() + 1; // 月份从0开始，所以加1
				BigDecimal income = entity.getBigDecimal("book_income") != null ? entity.getBigDecimal("book_income") : BigDecimal.ZERO;
				monthlyIncome.put(month, monthlyIncome.getOrDefault(month, BigDecimal.ZERO).add(income));
			}
			BigDecimal cumulative = BigDecimal.ZERO;
			for (Map.Entry<Integer, BigDecimal> entry : monthlyIncome.entrySet()) {
				cumulative = cumulative.add(entry.getValue());
				cumulativeIncome.put(entry.getKey(), cumulative);
			}
		}
		return cumulativeIncome;
	}

	// 月份营业收入 - 预测部分
	public Map<Integer, BigDecimal> processTrendData(List<Entity> entityTrendList, String month, BigDecimal cumulative) {
		// 按月累计值
		Map<Integer, BigDecimal> cumulativeValues = new TreeMap<>();
		if (entityTrendList != null && entityTrendList.size() > 0) {
			Map<Integer, BigDecimal> monthlyValues = new TreeMap<>();
			int searchMonth = Integer.valueOf(month).intValue();
			// 初始化目标月份（大于searchMonth的月份）
			for (int m = searchMonth + 1; m <= 12; m++) {
				monthlyValues.put(m, BigDecimal.ZERO);
			}
			// 遍历每条记录，提取目标月份字段值
			for (Entity entity : entityTrendList) {
				for (Map.Entry<String, Integer> entry : MONTH_MAP.entrySet()) {
					int monthNum = entry.getValue();
					if (monthNum > searchMonth) { // 只处理大于当前月份的字段
						String fieldName = entry.getKey();
						BigDecimal value = entity.getBigDecimal(fieldName) != null ? entity.getBigDecimal(fieldName) : BigDecimal.ZERO;
						monthlyValues.put(monthNum, monthlyValues.get(monthNum).add(value));
					}
				}
			}
			for (Map.Entry<Integer, BigDecimal> entry : monthlyValues.entrySet()) {
				cumulative = cumulative.add(entry.getValue());
				cumulativeValues.put(entry.getKey(), cumulative);
			}
		}
		return cumulativeValues;
	}

	/**
	 * 元金额转为万元金额
	 */
	private BigDecimal yuanToTenThousandYuan(BigDecimal yuan) {
		BigDecimal tenThousand = new BigDecimal("10000");
		return yuan.divide(tenThousand, 2, BigDecimal.ROUND_HALF_UP);
	}

	/**
	 * 根据当前时间获取上个月的年份及月份
	 */
	private Map<String, String> getPreviousMonth() {
		Map<String, String> map = new HashMap();
		Date now = new Date();
		Date lastMonthDate = DateUtil.offsetMonth(now, -1);
		int year = DateUtil.year(lastMonthDate);
		int month = DateUtil.month(lastMonthDate) + 1;
		map.put("year", "" + year);
		map.put("month", "" + month);
		return map;
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
	 * 去年开始日期、去年对应月份的最后一天日期
	 */
	private String[] getLastYearDateRange(String year, String month) {
		if (StrUtil.isNotBlank(month) && month.length() == 1) {
			month = "0" + month;
		}
		int currentYear = Integer.parseInt(year);
		int lastYear = currentYear - 1;
		String startDate = lastYear + "-01-01";
		String dateStr = lastYear + "-" + month + "-01";
		DateTime date = DateUtil.parse(dateStr, "yyyy-MM-dd");
		DateTime lastDay = DateUtil.endOfMonth(date);
		String endDate = lastDay.toString("yyyy-MM-dd");
		return new String[] { startDate, endDate };
	}

	/**
	 * 合并Map
	 */
	private Map<Integer, BigDecimal> mergeCumulativeMaps(Map<Integer, BigDecimal> processInvoiceData, Map<Integer, BigDecimal> processTrendData) {
		Map<Integer, BigDecimal> mergedMap = new TreeMap<>();
		mergedMap.putAll(processInvoiceData);
		processTrendData.forEach((month, value) -> mergedMap.merge(month, value, (existing, incoming) -> existing.max(incoming)));
		return mergedMap;
	}

}
