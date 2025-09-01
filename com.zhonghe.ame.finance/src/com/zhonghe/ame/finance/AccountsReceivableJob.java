package com.zhonghe.ame.finance;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

import cn.hutool.core.date.DateTime;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.IdUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.db.Entity;
import cn.hutool.db.Session;

import com.eos.common.connection.DataSourceHelper;
import com.eos.system.annotation.Bizlet;

@Bizlet("应收账款任务调度")
public class AccountsReceivableJob {

	@Bizlet("自动生成快照")
	public void automaticGenerateSnapshot() throws Exception {
		Session dbSession = new Session(DataSourceHelper.getDataSource());
		Map<String, String> dateMap = this.buildDateMap(null);
		this.fillData(dbSession, dateMap);
	}

	@Bizlet("手动生成快照")
	public void generateSnapshot(String yearMonth) throws Exception {
		Session dbSession = new Session(DataSourceHelper.getDataSource());
		Map<String, String> dateMap = this.buildDateMap(yearMonth);
		this.fillData(dbSession, dateMap);
	}

	// 填充数据入库
	private void fillData(Session dbSession, Map<String, String> dateMap) throws Exception {
		List<Entity> insertList = new ArrayList<Entity>();
		List<Entity> secOrgList = this.getSecOrgList(dbSession);
		for (Entity secOrgEntity : secOrgList) {
			String secOrg = secOrgEntity.getStr("secondary_org");
			Entity insertJTN = Entity.create("zh_accounts_receivable_snapshot").set("id", IdUtil.objectId()).set("ar_year", dateMap.get("year")).set("ar_month", dateMap.get("month"))
					.set("headquarter_group", "0").set("secondary_org", secOrg);
			Entity insertJTW = Entity.create("zh_accounts_receivable_snapshot").set("id", IdUtil.objectId()).set("ar_year", dateMap.get("year")).set("ar_month", dateMap.get("month"))
					.set("headquarter_group", "1").set("secondary_org", secOrg);
			// 1-当月形成应收账款(集团内/外)
			Map<String, BigDecimal> monthlyAccountsReceivableMap = this.buildAccountsReceivableFormedInTheCurrentMonth(secOrg, dateMap, dbSession);
			insertJTN.set("monthly_accounts_receivable", monthlyAccountsReceivableMap.get("jtnVal"));
			insertJTW.set("monthly_accounts_receivable", monthlyAccountsReceivableMap.get("jtwVal"));
			// 其中：当月开票部分
			Map<String, BigDecimal> monthlyInvoicingPortionMap = this.buildMonthlyInvoicingPortion(secOrg, dateMap, dbSession);
			insertJTN.set("monthly_invoicing_portion", monthlyInvoicingPortionMap.get("jtnVal"));
			insertJTW.set("monthly_invoicing_portion", monthlyInvoicingPortionMap.get("jtwVal"));
			// 应收账款余额
			Map<String, BigDecimal> accountsReceivableBalanceMap = this.buildAccountsReceivableBalance(secOrg, dbSession);
			insertJTN.set("accounts_receivable_balance", accountsReceivableBalanceMap.get("jtnVal"));
			insertJTW.set("accounts_receivable_balance", accountsReceivableBalanceMap.get("jtwVal"));
			// 其中：1年以内
			Map<String, BigDecimal> oneBalanceMap = this.buildOneBalance(secOrg, dateMap, dbSession);
			insertJTN.set("one_balance", oneBalanceMap.get("jtnVal"));
			insertJTW.set("one_balance", oneBalanceMap.get("jtwVal"));
			// 其中：1-2年
			Map<String, BigDecimal> oneTwoBalanceMap = this.buildOneTwoBalance(secOrg, dateMap, dbSession);
			insertJTN.set("one_two_balance", oneTwoBalanceMap.get("jtnVal"));
			insertJTW.set("one_two_balance", oneTwoBalanceMap.get("jtwVal"));
			// 其中：2-3年
			Map<String, BigDecimal> twoThreeBalanceMap = this.buildTwoThreeBalance(secOrg, dateMap, dbSession);
			insertJTN.set("two_three_balance", twoThreeBalanceMap.get("jtnVal"));
			insertJTW.set("two_three_balance", twoThreeBalanceMap.get("jtwVal"));
			// 其中：3年以上
			Map<String, BigDecimal> threeBalanceMap = this.buildThreeBalance(secOrg, dateMap, dbSession);
			insertJTN.set("three_balance", threeBalanceMap.get("jtnVal"));
			insertJTW.set("three_balance", threeBalanceMap.get("jtwVal"));
			insertList.add(insertJTN);
			insertList.add(insertJTW);
		}
		String secOrgs = secOrgList.stream().map(secOrgEntity -> "'" + secOrgEntity.getStr("secondary_org") + "'").collect(Collectors.joining(","));
		String delSql = "DELETE FROM zh_accounts_receivable_snapshot WHERE ar_year = ?  AND ar_month = ? AND secondary_org IN (" + secOrgs + ")";
		dbSession.execute(delSql, dateMap.get("year"), dateMap.get("month"));
		dbSession.insert(insertList);
	}

	// 1-当月形成应收账款
	private Map<String, BigDecimal> buildAccountsReceivableFormedInTheCurrentMonth(String secOrg, Map<String, String> dateMap, Session dbSession) throws Exception {
		Map<String, BigDecimal> map = new HashMap<String, BigDecimal>();
		String querySqlJTN = "SELECT balance_sum FROM zh_invoice WHERE app_status = '2' AND balance_sum > 0  AND headquarter_group IN ('0','3','4') AND secondary_org = ? AND create_time >= ? AND create_time <= ?";
		String querySqlJTW = "SELECT balance_sum FROM zh_invoice WHERE app_status = '2' AND balance_sum > 0  AND headquarter_group IN ('1') AND secondary_org = ? AND create_time >= ? AND create_time <= ?";
		List<Entity> jtnEntityList = dbSession.query(querySqlJTN, secOrg, dateMap.get("beginOfYear"), dateMap.get("endOfMonth"));
		List<Entity> jtwEntityList = dbSession.query(querySqlJTW, secOrg, dateMap.get("beginOfYear"), dateMap.get("endOfMonth"));
		if (jtnEntityList != null && jtnEntityList.size() > 0) {
			BigDecimal jtnVal = jtnEntityList.stream().map(entity -> entity.getBigDecimal("balance_sum")).filter(balanceSum -> balanceSum != null).reduce(BigDecimal.ZERO, BigDecimal::add);
			map.put("jtnVal", jtnVal);
		} else {
			map.put("jtnVal", BigDecimal.ZERO);
		}
		if (jtwEntityList != null && jtwEntityList.size() > 0) {
			BigDecimal jtwVal = jtwEntityList.stream().map(entity -> entity.getBigDecimal("balance_sum")).filter(balanceSum -> balanceSum != null).reduce(BigDecimal.ZERO, BigDecimal::add);
			map.put("jtwVal", jtwVal);
		} else {
			map.put("jtwVal", BigDecimal.ZERO);
		}
		return map;
	}

	// 其中：当月开票部分
	private Map<String, BigDecimal> buildMonthlyInvoicingPortion(String secOrg, Map<String, String> dateMap, Session dbSession) throws Exception {
		Map<String, BigDecimal> map = new HashMap<String, BigDecimal>();
		String querySqlJTN = "SELECT balance_sum FROM zh_invoice WHERE app_status = '2' AND balance_sum > 0  AND headquarter_group IN ('0','3','4') AND secondary_org = ? AND create_time >= ? AND create_time <= ?";
		String querySqlJTW = "SELECT balance_sum FROM zh_invoice WHERE app_status = '2' AND balance_sum > 0  AND headquarter_group IN ('1') AND secondary_org = ? AND create_time >= ? AND create_time <= ?";
		List<Entity> jtnEntityList = dbSession.query(querySqlJTN, secOrg, dateMap.get("beginOfMonth"), dateMap.get("endOfMonth"));
		List<Entity> jtwEntityList = dbSession.query(querySqlJTW, secOrg, dateMap.get("beginOfMonth"), dateMap.get("endOfMonth"));
		if (jtnEntityList != null && jtnEntityList.size() > 0) {
			BigDecimal jtnVal = jtnEntityList.stream().map(entity -> entity.getBigDecimal("balance_sum")).filter(balanceSum -> balanceSum != null).reduce(BigDecimal.ZERO, BigDecimal::add);
			map.put("jtnVal", jtnVal);
		} else {
			map.put("jtnVal", BigDecimal.ZERO);
		}
		if (jtwEntityList != null && jtwEntityList.size() > 0) {
			BigDecimal jtwVal = jtwEntityList.stream().map(entity -> entity.getBigDecimal("balance_sum")).filter(balanceSum -> balanceSum != null).reduce(BigDecimal.ZERO, BigDecimal::add);
			map.put("jtwVal", jtwVal);
		} else {
			map.put("jtwVal", BigDecimal.ZERO);
		}
		return map;
	}

	// 应收账款余额
	private Map<String, BigDecimal> buildAccountsReceivableBalance(String secOrg, Session dbSession) throws Exception {
		Map<String, BigDecimal> map = new HashMap<String, BigDecimal>();
		String querySqlJTN = "SELECT balance_sum FROM zh_invoice WHERE app_status = '2' AND balance_sum > 0  AND headquarter_group IN ('0','3','4') AND secondary_org = ?";
		String querySqlJTW = "SELECT balance_sum FROM zh_invoice WHERE app_status = '2' AND balance_sum > 0  AND headquarter_group IN ('1') AND secondary_org = ?";
		List<Entity> jtnEntityList = dbSession.query(querySqlJTN, secOrg);
		List<Entity> jtwEntityList = dbSession.query(querySqlJTW, secOrg);
		if (jtnEntityList != null && jtnEntityList.size() > 0) {
			BigDecimal jtnVal = jtnEntityList.stream().map(entity -> entity.getBigDecimal("balance_sum")).filter(balanceSum -> balanceSum != null).reduce(BigDecimal.ZERO, BigDecimal::add);
			map.put("jtnVal", jtnVal);
		} else {
			map.put("jtnVal", BigDecimal.ZERO);
		}
		if (jtwEntityList != null && jtwEntityList.size() > 0) {
			BigDecimal jtwVal = jtwEntityList.stream().map(entity -> entity.getBigDecimal("balance_sum")).filter(balanceSum -> balanceSum != null).reduce(BigDecimal.ZERO, BigDecimal::add);
			map.put("jtwVal", jtwVal);
		} else {
			map.put("jtwVal", BigDecimal.ZERO);
		}
		return map;
	}

	// 其中：1年以内
	private Map<String, BigDecimal> buildOneBalance(String secOrg, Map<String, String> dateMap, Session dbSession) throws Exception {
		Map<String, BigDecimal> map = new HashMap<String, BigDecimal>();
		String querySqlJTN = "SELECT balance_sum FROM zh_invoice WHERE app_status = '2' AND balance_sum > 0  AND headquarter_group IN ('0','3','4') AND secondary_org = ? AND create_time >= ? AND create_time <= ?";
		String querySqlJTW = "SELECT balance_sum FROM zh_invoice WHERE app_status = '2' AND balance_sum > 0  AND headquarter_group IN ('1') AND secondary_org = ? AND create_time >= ? AND create_time <= ?";
		List<Entity> jtnEntityList = dbSession.query(querySqlJTN, secOrg, dateMap.get("oneYearAgo"), dateMap.get("endOfMonth"));
		List<Entity> jtwEntityList = dbSession.query(querySqlJTW, secOrg, dateMap.get("oneYearAgo"), dateMap.get("endOfMonth"));
		if (jtnEntityList != null && jtnEntityList.size() > 0) {
			BigDecimal jtnVal = jtnEntityList.stream().map(entity -> entity.getBigDecimal("balance_sum")).filter(balanceSum -> balanceSum != null).reduce(BigDecimal.ZERO, BigDecimal::add);
			map.put("jtnVal", jtnVal);
		} else {
			map.put("jtnVal", BigDecimal.ZERO);
		}
		if (jtwEntityList != null && jtwEntityList.size() > 0) {
			BigDecimal jtwVal = jtwEntityList.stream().map(entity -> entity.getBigDecimal("balance_sum")).filter(balanceSum -> balanceSum != null).reduce(BigDecimal.ZERO, BigDecimal::add);
			map.put("jtwVal", jtwVal);
		} else {
			map.put("jtwVal", BigDecimal.ZERO);
		}
		return map;
	}

	// 其中：1-2年
	private Map<String, BigDecimal> buildOneTwoBalance(String secOrg, Map<String, String> dateMap, Session dbSession) throws Exception {
		Map<String, BigDecimal> map = new HashMap<String, BigDecimal>();
		String querySqlJTN = "SELECT balance_sum FROM zh_invoice WHERE app_status = '2' AND balance_sum > 0  AND headquarter_group IN ('0','3','4') AND secondary_org = ? AND create_time >= ? AND create_time < ?";
		String querySqlJTW = "SELECT balance_sum FROM zh_invoice WHERE app_status = '2' AND balance_sum > 0  AND headquarter_group IN ('1') AND secondary_org = ? AND create_time >= ? AND create_time < ?";
		List<Entity> jtnEntityList = dbSession.query(querySqlJTN, secOrg, dateMap.get("twoYearAgo"), dateMap.get("oneYearAgo"));
		List<Entity> jtwEntityList = dbSession.query(querySqlJTW, secOrg, dateMap.get("twoYearAgo"), dateMap.get("oneYearAgo"));
		if (jtnEntityList != null && jtnEntityList.size() > 0) {
			BigDecimal jtnVal = jtnEntityList.stream().map(entity -> entity.getBigDecimal("balance_sum")).filter(balanceSum -> balanceSum != null).reduce(BigDecimal.ZERO, BigDecimal::add);
			map.put("jtnVal", jtnVal);
		} else {
			map.put("jtnVal", BigDecimal.ZERO);
		}
		if (jtwEntityList != null && jtwEntityList.size() > 0) {
			BigDecimal jtwVal = jtwEntityList.stream().map(entity -> entity.getBigDecimal("balance_sum")).filter(balanceSum -> balanceSum != null).reduce(BigDecimal.ZERO, BigDecimal::add);
			map.put("jtwVal", jtwVal);
		} else {
			map.put("jtwVal", BigDecimal.ZERO);
		}
		return map;
	}

	// 其中：2-3年
	private Map<String, BigDecimal> buildTwoThreeBalance(String secOrg, Map<String, String> dateMap, Session dbSession) throws Exception {
		Map<String, BigDecimal> map = new HashMap<String, BigDecimal>();
		String querySqlJTN = "SELECT balance_sum FROM zh_invoice WHERE app_status = '2' AND balance_sum > 0  AND headquarter_group IN ('0','3','4') AND secondary_org = ? AND create_time >= ? AND create_time < ?";
		String querySqlJTW = "SELECT balance_sum FROM zh_invoice WHERE app_status = '2' AND balance_sum > 0  AND headquarter_group IN ('1') AND secondary_org = ? AND create_time >= ? AND create_time < ?";
		List<Entity> jtnEntityList = dbSession.query(querySqlJTN, secOrg, dateMap.get("threeYearAgo"), dateMap.get("twoYearAgo"));
		List<Entity> jtwEntityList = dbSession.query(querySqlJTW, secOrg, dateMap.get("threeYearAgo"), dateMap.get("twoYearAgo"));
		if (jtnEntityList != null && jtnEntityList.size() > 0) {
			BigDecimal jtnVal = jtnEntityList.stream().map(entity -> entity.getBigDecimal("balance_sum")).filter(balanceSum -> balanceSum != null).reduce(BigDecimal.ZERO, BigDecimal::add);
			map.put("jtnVal", jtnVal);
		} else {
			map.put("jtnVal", BigDecimal.ZERO);
		}
		if (jtwEntityList != null && jtwEntityList.size() > 0) {
			BigDecimal jtwVal = jtwEntityList.stream().map(entity -> entity.getBigDecimal("balance_sum")).filter(balanceSum -> balanceSum != null).reduce(BigDecimal.ZERO, BigDecimal::add);
			map.put("jtwVal", jtwVal);
		} else {
			map.put("jtwVal", BigDecimal.ZERO);
		}
		return map;
	}

	// 其中：3年以上
	private Map<String, BigDecimal> buildThreeBalance(String secOrg, Map<String, String> dateMap, Session dbSession) throws Exception {
		Map<String, BigDecimal> map = new HashMap<String, BigDecimal>();
		String querySqlJTN = "SELECT balance_sum FROM zh_invoice WHERE app_status = '2' AND balance_sum > 0  AND headquarter_group IN ('0','3','4') AND secondary_org = ? AND create_time < ?";
		String querySqlJTW = "SELECT balance_sum FROM zh_invoice WHERE app_status = '2' AND balance_sum > 0  AND headquarter_group IN ('1') AND secondary_org = ? AND create_time < ?";
		List<Entity> jtnEntityList = dbSession.query(querySqlJTN, secOrg, dateMap.get("threeYearAgo"));
		List<Entity> jtwEntityList = dbSession.query(querySqlJTW, secOrg, dateMap.get("threeYearAgo"));
		if (jtnEntityList != null && jtnEntityList.size() > 0) {
			BigDecimal jtnVal = jtnEntityList.stream().map(entity -> entity.getBigDecimal("balance_sum")).filter(balanceSum -> balanceSum != null).reduce(BigDecimal.ZERO, BigDecimal::add);
			map.put("jtnVal", jtnVal);
		} else {
			map.put("jtnVal", BigDecimal.ZERO);
		}
		if (jtwEntityList != null && jtwEntityList.size() > 0) {
			BigDecimal jtwVal = jtwEntityList.stream().map(entity -> entity.getBigDecimal("balance_sum")).filter(balanceSum -> balanceSum != null).reduce(BigDecimal.ZERO, BigDecimal::add);
			map.put("jtwVal", jtwVal);
		} else {
			map.put("jtwVal", BigDecimal.ZERO);
		}
		return map;
	}

	// 构建查询涉及到的日期数据
	private Map<String, String> buildDateMap(String yearMonth) {
		Map<String, String> map = new HashMap();
		Date today;
		if (StrUtil.isNotBlank(yearMonth)) {
			today = DateUtil.offsetMonth(DateUtil.parse(yearMonth, "yyyy-MM"), 1);
		} else {
			today = new Date();
		}
		int year = DateUtil.year(DateUtil.offsetMonth(today, -1));
		map.put("year", "" + year);
		int month = DateUtil.month(DateUtil.offsetMonth(today, -1)) + 1;
		map.put("month", "" + month);
		// 月份开始日期
		String beginOfMonth = DateUtil.beginOfMonth(DateUtil.offsetMonth(today, -1)).toString("yyyy-MM-dd");
		map.put("beginOfMonth", beginOfMonth);
		// 月份结束日期
		String endOfMonth = DateUtil.endOfMonth(DateUtil.offsetMonth(today, -1)).toString("yyyy-MM-dd");
		map.put("endOfMonth", endOfMonth);
		// 年份开始日期
		String beginOfYear = DateUtil.beginOfYear(DateUtil.offsetMonth(today, -1)).toString("yyyy-MM-dd");
		map.put("beginOfYear", beginOfYear);
		// 1年前
		String oneYearAgo = DateUtil.offsetYear(today, -1).toString("yyyy-MM-dd");
		map.put("oneYearAgo", oneYearAgo);
		// 2年前
		String twoYearAgo = DateUtil.offsetYear(today, -2).toString("yyyy-MM-dd");
		map.put("twoYearAgo", twoYearAgo);
		// 3年前
		String threeYearAgo = DateUtil.offsetYear(today, -3).toString("yyyy-MM-dd");
		map.put("threeYearAgo", threeYearAgo);
		return map;
	}

	// 对开票数据分组获取二级组织
	private List<Entity> getSecOrgList(Session dbSession) throws Exception {
		String querySql = "SELECT secondary_org FROM zh_invoice WHERE app_status = '2' GROUP BY secondary_org";
		return dbSession.query(querySql);
	}

}
