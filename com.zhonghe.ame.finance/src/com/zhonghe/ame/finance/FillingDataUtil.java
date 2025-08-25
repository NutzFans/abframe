package com.zhonghe.ame.finance;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.function.Function;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

import cn.hutool.core.util.NumberUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.db.Entity;
import cn.hutool.db.Session;

import com.eos.common.connection.DataSourceHelper;
import com.eos.system.annotation.Bizlet;

@Bizlet("填报数据工具类")
public class FillingDataUtil {

	@Bizlet("获取需要填报的数据")
	public HashMap<String, List<Entity>> getFillingDatas(String budgetMainId) throws Exception {
		HashMap<String, List<Entity>> result = new HashMap<String, List<Entity>>();
		List<Entity> financialStatements = new ArrayList<Entity>();
		Session dbSession = new Session(DataSourceHelper.getDataSource());
		List<Entity> totalRevenueList = this.buildFillingIncome(dbSession, budgetMainId);
		List<Entity> totalCostList = this.buildFillingLedger(dbSession, budgetMainId);
		Entity grossProfitMargin = this.buildGrossProfitMargin(totalRevenueList, totalCostList);
		List<Entity> apportionmentAndOtherList = this.buildApportionmentAndOther(totalCostList, dbSession, budgetMainId);
		Entity totalProfit = this.buildTotalProfit(grossProfitMargin, apportionmentAndOtherList);
		financialStatements.addAll(totalRevenueList);
		financialStatements.addAll(totalCostList);
		financialStatements.add(grossProfitMargin);
		financialStatements.addAll(apportionmentAndOtherList);
		financialStatements.add(totalProfit);
		result.put("cwbb", financialStatements);
		List<Entity> personnelAndPerCapitaSituation = this.buildPersonnelAndPerCapitaSituation(dbSession, budgetMainId);
		result.put("ryjrjqk", personnelAndPerCapitaSituation);
		List<Entity> fullAperture = this.buildFullAperture(financialStatements, personnelAndPerCapitaSituation);
		result.put("rgcbqkj", fullAperture);
		List<Entity> laborProductivityList = this.buildLaborProductivity(financialStatements, fullAperture, personnelAndPerCapitaSituation, dbSession, budgetMainId);
		result.put("ldscl", laborProductivityList);

		return result;
	}

	// 报表总收入部分数据构建
	private List<Entity> buildFillingIncome(Session dbSession, String budgetMainId) throws Exception {
		List<Entity> totalRevenueList = new ArrayList<Entity>();
		String querySql = "SELECT *, income_name AS name, '总收入' AS parent, '1' AS editable FROM zh_caiwu_budget_filling_income WHERE budget_main_id = ?";
		Entity totalRevenue = new Entity();
		totalRevenue.set("serial_number", "1").set("id", "总收入").set("name", "一、总收入").set("parent", "-1").set("editable", "0").set("jan_amount", BigDecimal.ZERO).set("feb_amount", BigDecimal.ZERO)
				.set("mar_amount", BigDecimal.ZERO).set("apr_amount", BigDecimal.ZERO).set("may_amount", BigDecimal.ZERO).set("jun_amount", BigDecimal.ZERO).set("jul_amount", BigDecimal.ZERO)
				.set("aug_amount", BigDecimal.ZERO).set("sep_amount", BigDecimal.ZERO).set("oct_amount", BigDecimal.ZERO).set("nov_amount", BigDecimal.ZERO).set("dec_amount", BigDecimal.ZERO)
				.set("total_amount", BigDecimal.ZERO);
		List<Entity> incomeList = dbSession.query(querySql, budgetMainId);
		for (int i = 0; i < incomeList.size(); i++) {
			incomeList.get(i).set("serial_number", StrUtil.format("1.{}", i + 1));
		}
		for (Entity income : incomeList) {
			totalRevenue.set("jan_amount", NumberUtil.add(totalRevenue.getBigDecimal("jan_amount"), income.getBigDecimal("jan_amount")));
			totalRevenue.set("feb_amount", NumberUtil.add(totalRevenue.getBigDecimal("feb_amount"), income.getBigDecimal("feb_amount")));
			totalRevenue.set("mar_amount", NumberUtil.add(totalRevenue.getBigDecimal("mar_amount"), income.getBigDecimal("mar_amount")));
			totalRevenue.set("apr_amount", NumberUtil.add(totalRevenue.getBigDecimal("apr_amount"), income.getBigDecimal("apr_amount")));
			totalRevenue.set("may_amount", NumberUtil.add(totalRevenue.getBigDecimal("may_amount"), income.getBigDecimal("may_amount")));
			totalRevenue.set("jun_amount", NumberUtil.add(totalRevenue.getBigDecimal("jun_amount"), income.getBigDecimal("jun_amount")));
			totalRevenue.set("jul_amount", NumberUtil.add(totalRevenue.getBigDecimal("jul_amount"), income.getBigDecimal("jul_amount")));
			totalRevenue.set("aug_amount", NumberUtil.add(totalRevenue.getBigDecimal("aug_amount"), income.getBigDecimal("aug_amount")));
			totalRevenue.set("sep_amount", NumberUtil.add(totalRevenue.getBigDecimal("sep_amount"), income.getBigDecimal("sep_amount")));
			totalRevenue.set("oct_amount", NumberUtil.add(totalRevenue.getBigDecimal("oct_amount"), income.getBigDecimal("oct_amount")));
			totalRevenue.set("nov_amount", NumberUtil.add(totalRevenue.getBigDecimal("nov_amount"), income.getBigDecimal("nov_amount")));
			totalRevenue.set("dec_amount", NumberUtil.add(totalRevenue.getBigDecimal("dec_amount"), income.getBigDecimal("dec_amount")));
			totalRevenue.set("total_amount", NumberUtil.add(totalRevenue.getBigDecimal("total_amount"), income.getBigDecimal("total_amount")));
		}
		totalRevenueList.add(totalRevenue);
		totalRevenueList.addAll(incomeList);
		return totalRevenueList;
	}

	// 报表总成本部分数据构建
	public List<Entity> buildFillingLedger(Session dbSession, String budgetMainId) throws Exception {
		List<Entity> totalCostList = new ArrayList<Entity>();
		String queryKmClassSql = "SELECT DICTID, DICTNAME FROM EOS_DICT_ENTRY WHERE DICTTYPEID = 'CW_KM_CLASS' ORDER BY SORTNO ASC";
		List<Entity> kmClassList = dbSession.query(queryKmClassSql);

		Entity totalCost = new Entity();
		totalCost.set("serial_number", "2").set("id", "totalCost").set("name", "二、总成本").set("parent", "-1").set("editable", "0").set("jan_amount", BigDecimal.ZERO).set("feb_amount", BigDecimal.ZERO)
				.set("mar_amount", BigDecimal.ZERO).set("apr_amount", BigDecimal.ZERO).set("may_amount", BigDecimal.ZERO).set("jun_amount", BigDecimal.ZERO).set("jul_amount", BigDecimal.ZERO)
				.set("aug_amount", BigDecimal.ZERO).set("sep_amount", BigDecimal.ZERO).set("oct_amount", BigDecimal.ZERO).set("nov_amount", BigDecimal.ZERO).set("dec_amount", BigDecimal.ZERO)
				.set("total_amount", BigDecimal.ZERO);
		totalCostList.add(totalCost);

		List<Entity> kmClassRevenueList = new ArrayList<Entity>();
		for (int i = 0; i < kmClassList.size(); i++) {
			Entity kmClass = kmClassList.get(i);
			Entity kmClassRevenue = new Entity();
			kmClassRevenue.set("serial_number", StrUtil.format("2.{}", i + 1)).set("id", kmClass.getStr("DICTNAME")).set("name", kmClass.getStr("DICTNAME")).set("parent", "totalCost")
					.set("editable", "0").set("jan_amount", BigDecimal.ZERO).set("feb_amount", BigDecimal.ZERO).set("mar_amount", BigDecimal.ZERO).set("apr_amount", BigDecimal.ZERO)
					.set("may_amount", BigDecimal.ZERO).set("jun_amount", BigDecimal.ZERO).set("jul_amount", BigDecimal.ZERO).set("aug_amount", BigDecimal.ZERO).set("sep_amount", BigDecimal.ZERO)
					.set("oct_amount", BigDecimal.ZERO).set("nov_amount", BigDecimal.ZERO).set("dec_amount", BigDecimal.ZERO).set("total_amount", BigDecimal.ZERO);

			String parentStr = StrUtil.format("'{}' AS parent", kmClass.getStr("DICTNAME"));
			String querySql = "SELECT zcbfl.*, zcla.name, '1' AS editable, "
					+ parentStr
					+ " FROM zh_caiwu_budget_filling_ledger AS zcbfl, zh_caiwu_ledger_account AS zcla WHERE zcbfl.budget_main_id = ? AND zcbfl.budget_category = ? AND zcbfl.ledger_account_id = zcla.id ORDER BY zcla.sorting ASC";
			List<Entity> ledgerList = dbSession.query(querySql, budgetMainId, kmClass.getStr("DICTID"));

			if ("人工和用工成本（不含研发）".equals(kmClass.getStr("DICTNAME"))) {
				// 插入部分统计科目项
				for (int j = ledgerList.size() - 1; j >= 0; j--) {
					if (ledgerList.get(j).getStr("name").equals("合作单位费用-成本（不含内部交易）")) {
						ledgerList.add(
								j,
								new Entity().set("id", "合作单位费用（无内部交易）").set("name", "合作单位费用（无内部交易）").set("parent", kmClass.getStr("DICTNAME")).set("editable", "0").set("jan_amount", BigDecimal.ZERO)
										.set("feb_amount", BigDecimal.ZERO).set("mar_amount", BigDecimal.ZERO).set("apr_amount", BigDecimal.ZERO).set("may_amount", BigDecimal.ZERO)
										.set("jun_amount", BigDecimal.ZERO).set("jul_amount", BigDecimal.ZERO).set("aug_amount", BigDecimal.ZERO).set("sep_amount", BigDecimal.ZERO)
										.set("oct_amount", BigDecimal.ZERO).set("nov_amount", BigDecimal.ZERO).set("dec_amount", BigDecimal.ZERO).set("total_amount", BigDecimal.ZERO));
					} else if (ledgerList.get(j).getStr("name").equals("意外伤害保险-成本")) {
						ledgerList.add(
								j,
								new Entity().set("id", "意外伤害保险").set("name", "意外伤害保险").set("parent", kmClass.getStr("DICTNAME")).set("editable", "0").set("jan_amount", BigDecimal.ZERO)
										.set("feb_amount", BigDecimal.ZERO).set("mar_amount", BigDecimal.ZERO).set("apr_amount", BigDecimal.ZERO).set("may_amount", BigDecimal.ZERO)
										.set("jun_amount", BigDecimal.ZERO).set("jul_amount", BigDecimal.ZERO).set("aug_amount", BigDecimal.ZERO).set("sep_amount", BigDecimal.ZERO)
										.set("oct_amount", BigDecimal.ZERO).set("nov_amount", BigDecimal.ZERO).set("dec_amount", BigDecimal.ZERO).set("total_amount", BigDecimal.ZERO));
					}
				}
				// 生成科目序号及部分科目字段汇总计算
				for (int k = 0; k < ledgerList.size(); k++) {
					if (ledgerList.get(k).getStr("name").equals("工资总额（不含研发）")) {
						ledgerList.get(k).set("serial_number", StrUtil.format("2.{}.{}", i + 1, k + 1));
						ledgerList.get(k).set("editable", "0");
						String querySqlOne = "SELECT zcbfl.* FROM zh_caiwu_budget_filling_ledger AS zcbfl, zh_caiwu_ledger_account AS zcla WHERE zcbfl.budget_main_id = ? AND zcbfl.ledger_account_id = zcla.id AND zcla.name = '工资总额（含研发）'";
						String querySqlTwo = "SELECT zcbfl.* FROM zh_caiwu_budget_filling_ledger AS zcbfl, zh_caiwu_ledger_account AS zcla WHERE zcbfl.budget_main_id = ? AND zcbfl.ledger_account_id = zcla.id AND zcla.name = '研发-工资'";
						Entity oneEntity = dbSession.queryOne(querySqlOne, budgetMainId);
						Entity twoEntity = dbSession.queryOne(querySqlTwo, budgetMainId);
						ledgerList.get(k).set("jan_amount", NumberUtil.sub(oneEntity.getBigDecimal("jan_amount"), twoEntity.getBigDecimal("jan_amount")))
								.set("feb_amount", NumberUtil.sub(oneEntity.getBigDecimal("feb_amount"), twoEntity.getBigDecimal("feb_amount")))
								.set("mar_amount", NumberUtil.sub(oneEntity.getBigDecimal("mar_amount"), twoEntity.getBigDecimal("mar_amount")))
								.set("apr_amount", NumberUtil.sub(oneEntity.getBigDecimal("apr_amount"), twoEntity.getBigDecimal("apr_amount")))
								.set("may_amount", NumberUtil.sub(oneEntity.getBigDecimal("may_amount"), twoEntity.getBigDecimal("may_amount")))
								.set("jun_amount", NumberUtil.sub(oneEntity.getBigDecimal("jun_amount"), twoEntity.getBigDecimal("jun_amount")))
								.set("jul_amount", NumberUtil.sub(oneEntity.getBigDecimal("jul_amount"), twoEntity.getBigDecimal("jul_amount")))
								.set("aug_amount", NumberUtil.sub(oneEntity.getBigDecimal("aug_amount"), twoEntity.getBigDecimal("aug_amount")))
								.set("sep_amount", NumberUtil.sub(oneEntity.getBigDecimal("sep_amount"), twoEntity.getBigDecimal("sep_amount")))
								.set("oct_amount", NumberUtil.sub(oneEntity.getBigDecimal("oct_amount"), twoEntity.getBigDecimal("oct_amount")))
								.set("nov_amount", NumberUtil.sub(oneEntity.getBigDecimal("nov_amount"), twoEntity.getBigDecimal("nov_amount")))
								.set("dec_amount", NumberUtil.sub(oneEntity.getBigDecimal("dec_amount"), twoEntity.getBigDecimal("dec_amount")))
								.set("total_amount", NumberUtil.sub(oneEntity.getBigDecimal("total_amount"), twoEntity.getBigDecimal("total_amount")));

					} else if (ledgerList.get(k).getStr("name").equals("养老保险（不含研发）")) {
						ledgerList.get(k).set("serial_number", StrUtil.format("2.{}.{}", i + 1, k + 1));
						ledgerList.get(k).set("editable", "0");
						String querySqlOne = "SELECT zcbfl.* FROM zh_caiwu_budget_filling_ledger AS zcbfl, zh_caiwu_ledger_account AS zcla WHERE zcbfl.budget_main_id = ? AND zcbfl.ledger_account_id = zcla.id AND zcla.name = '养老保险（含研发）'";
						String querySqlTwo = "SELECT zcbfl.* FROM zh_caiwu_budget_filling_ledger AS zcbfl, zh_caiwu_ledger_account AS zcla WHERE zcbfl.budget_main_id = ? AND zcbfl.ledger_account_id = zcla.id AND zcla.name = '研发-社保'";
						Entity oneEntity = dbSession.queryOne(querySqlOne, budgetMainId);
						Entity twoEntity = dbSession.queryOne(querySqlTwo, budgetMainId);
						ledgerList.get(k).set("jan_amount", NumberUtil.sub(oneEntity.getBigDecimal("jan_amount"), twoEntity.getBigDecimal("jan_amount")))
								.set("feb_amount", NumberUtil.sub(oneEntity.getBigDecimal("feb_amount"), twoEntity.getBigDecimal("feb_amount")))
								.set("mar_amount", NumberUtil.sub(oneEntity.getBigDecimal("mar_amount"), twoEntity.getBigDecimal("mar_amount")))
								.set("apr_amount", NumberUtil.sub(oneEntity.getBigDecimal("apr_amount"), twoEntity.getBigDecimal("apr_amount")))
								.set("may_amount", NumberUtil.sub(oneEntity.getBigDecimal("may_amount"), twoEntity.getBigDecimal("may_amount")))
								.set("jun_amount", NumberUtil.sub(oneEntity.getBigDecimal("jun_amount"), twoEntity.getBigDecimal("jun_amount")))
								.set("jul_amount", NumberUtil.sub(oneEntity.getBigDecimal("jul_amount"), twoEntity.getBigDecimal("jul_amount")))
								.set("aug_amount", NumberUtil.sub(oneEntity.getBigDecimal("aug_amount"), twoEntity.getBigDecimal("aug_amount")))
								.set("sep_amount", NumberUtil.sub(oneEntity.getBigDecimal("sep_amount"), twoEntity.getBigDecimal("sep_amount")))
								.set("oct_amount", NumberUtil.sub(oneEntity.getBigDecimal("oct_amount"), twoEntity.getBigDecimal("oct_amount")))
								.set("nov_amount", NumberUtil.sub(oneEntity.getBigDecimal("nov_amount"), twoEntity.getBigDecimal("nov_amount")))
								.set("dec_amount", NumberUtil.sub(oneEntity.getBigDecimal("dec_amount"), twoEntity.getBigDecimal("dec_amount")))
								.set("total_amount", NumberUtil.sub(oneEntity.getBigDecimal("total_amount"), twoEntity.getBigDecimal("total_amount")));

					} else if (ledgerList.get(k).getStr("name").equals("意外伤害保险-成本")) {
						ledgerList.get(k).set("serial_number", StrUtil.format("2.{}.{}.{}", i + 1, k, 1));
						ledgerList.get(k).set("parent", "意外伤害保险");

					} else if (ledgerList.get(k).getStr("name").equals("意外伤害保险-管理")) {
						ledgerList.get(k).set("serial_number", StrUtil.format("2.{}.{}.{}", i + 1, k - 1, 2));
						ledgerList.get(k).set("parent", "意外伤害保险");

					} else if (ledgerList.get(k).getStr("name").equals("合作单位费用-成本（不含内部交易）")) {
						ledgerList.get(k).set("serial_number", StrUtil.format("2.{}.{}.{}", i + 1, k, 1));
						ledgerList.get(k).set("parent", "合作单位费用（无内部交易）");

					} else if (ledgerList.get(k).getStr("name").equals("合作单位费用-管理")) {
						ledgerList.get(k).set("serial_number", StrUtil.format("2.{}.{}.{}", i + 1, k - 1, 2));
						ledgerList.get(k).set("parent", "合作单位费用（无内部交易）");

					} else if (ledgerList.get(k).getStr("name").equals("意外伤害保险")) {
						String querySqlOne = "SELECT zcbfl.* FROM zh_caiwu_budget_filling_ledger AS zcbfl, zh_caiwu_ledger_account AS zcla WHERE zcbfl.budget_main_id = ? AND zcbfl.ledger_account_id = zcla.id AND zcla.name = '意外伤害保险-成本'";
						String querySqlTwo = "SELECT zcbfl.* FROM zh_caiwu_budget_filling_ledger AS zcbfl, zh_caiwu_ledger_account AS zcla WHERE zcbfl.budget_main_id = ? AND zcbfl.ledger_account_id = zcla.id AND zcla.name = '意外伤害保险-管理'";
						Entity oneEntity = dbSession.queryOne(querySqlOne, budgetMainId);
						Entity twoEntity = dbSession.queryOne(querySqlTwo, budgetMainId);
						ledgerList.get(k).set("jan_amount", NumberUtil.add(oneEntity.getBigDecimal("jan_amount"), twoEntity.getBigDecimal("jan_amount")))
								.set("feb_amount", NumberUtil.add(oneEntity.getBigDecimal("feb_amount"), twoEntity.getBigDecimal("feb_amount")))
								.set("mar_amount", NumberUtil.add(oneEntity.getBigDecimal("mar_amount"), twoEntity.getBigDecimal("mar_amount")))
								.set("apr_amount", NumberUtil.add(oneEntity.getBigDecimal("apr_amount"), twoEntity.getBigDecimal("apr_amount")))
								.set("may_amount", NumberUtil.add(oneEntity.getBigDecimal("may_amount"), twoEntity.getBigDecimal("may_amount")))
								.set("jun_amount", NumberUtil.add(oneEntity.getBigDecimal("jun_amount"), twoEntity.getBigDecimal("jun_amount")))
								.set("jul_amount", NumberUtil.add(oneEntity.getBigDecimal("jul_amount"), twoEntity.getBigDecimal("jul_amount")))
								.set("aug_amount", NumberUtil.add(oneEntity.getBigDecimal("aug_amount"), twoEntity.getBigDecimal("aug_amount")))
								.set("sep_amount", NumberUtil.add(oneEntity.getBigDecimal("sep_amount"), twoEntity.getBigDecimal("sep_amount")))
								.set("oct_amount", NumberUtil.add(oneEntity.getBigDecimal("oct_amount"), twoEntity.getBigDecimal("oct_amount")))
								.set("nov_amount", NumberUtil.add(oneEntity.getBigDecimal("nov_amount"), twoEntity.getBigDecimal("nov_amount")))
								.set("dec_amount", NumberUtil.add(oneEntity.getBigDecimal("dec_amount"), twoEntity.getBigDecimal("dec_amount")))
								.set("total_amount", NumberUtil.add(oneEntity.getBigDecimal("total_amount"), twoEntity.getBigDecimal("total_amount")));

					} else if (ledgerList.get(k).getStr("name").equals("合作单位费用（无内部交易）")) {
						String querySqlOne = "SELECT zcbfl.* FROM zh_caiwu_budget_filling_ledger AS zcbfl, zh_caiwu_ledger_account AS zcla WHERE zcbfl.budget_main_id = ? AND zcbfl.ledger_account_id = zcla.id AND zcla.name = '合作单位费用-成本（不含内部交易）'";
						String querySqlTwo = "SELECT zcbfl.* FROM zh_caiwu_budget_filling_ledger AS zcbfl, zh_caiwu_ledger_account AS zcla WHERE zcbfl.budget_main_id = ? AND zcbfl.ledger_account_id = zcla.id AND zcla.name = '合作单位费用-管理'";
						Entity oneEntity = dbSession.queryOne(querySqlOne, budgetMainId);
						Entity twoEntity = dbSession.queryOne(querySqlTwo, budgetMainId);
						ledgerList.get(k).set("jan_amount", NumberUtil.add(oneEntity.getBigDecimal("jan_amount"), twoEntity.getBigDecimal("jan_amount")))
								.set("feb_amount", NumberUtil.add(oneEntity.getBigDecimal("feb_amount"), twoEntity.getBigDecimal("feb_amount")))
								.set("mar_amount", NumberUtil.add(oneEntity.getBigDecimal("mar_amount"), twoEntity.getBigDecimal("mar_amount")))
								.set("apr_amount", NumberUtil.add(oneEntity.getBigDecimal("apr_amount"), twoEntity.getBigDecimal("apr_amount")))
								.set("may_amount", NumberUtil.add(oneEntity.getBigDecimal("may_amount"), twoEntity.getBigDecimal("may_amount")))
								.set("jun_amount", NumberUtil.add(oneEntity.getBigDecimal("jun_amount"), twoEntity.getBigDecimal("jun_amount")))
								.set("jul_amount", NumberUtil.add(oneEntity.getBigDecimal("jul_amount"), twoEntity.getBigDecimal("jul_amount")))
								.set("aug_amount", NumberUtil.add(oneEntity.getBigDecimal("aug_amount"), twoEntity.getBigDecimal("aug_amount")))
								.set("sep_amount", NumberUtil.add(oneEntity.getBigDecimal("sep_amount"), twoEntity.getBigDecimal("sep_amount")))
								.set("oct_amount", NumberUtil.add(oneEntity.getBigDecimal("oct_amount"), twoEntity.getBigDecimal("oct_amount")))
								.set("nov_amount", NumberUtil.add(oneEntity.getBigDecimal("nov_amount"), twoEntity.getBigDecimal("nov_amount")))
								.set("dec_amount", NumberUtil.add(oneEntity.getBigDecimal("dec_amount"), twoEntity.getBigDecimal("dec_amount")))
								.set("total_amount", NumberUtil.add(oneEntity.getBigDecimal("total_amount"), twoEntity.getBigDecimal("total_amount")));

					} else {
						ledgerList.get(k).set("serial_number", StrUtil.format("2.{}.{}", i + 1, k + 1));
					}
				}
				for (Entity ledger : ledgerList) {
					String name = ledger.getStr("name");
					if (!"工资总额（含研发）".equals(name) && !"养老保险（含研发）".equals(name) && !"意外伤害保险".equals(name) && !"合作单位费用（无内部交易）".equals(name)) {
						kmClassRevenue.set("jan_amount", NumberUtil.add(kmClassRevenue.getBigDecimal("jan_amount"), ledger.getBigDecimal("jan_amount")));
						kmClassRevenue.set("feb_amount", NumberUtil.add(kmClassRevenue.getBigDecimal("feb_amount"), ledger.getBigDecimal("feb_amount")));
						kmClassRevenue.set("mar_amount", NumberUtil.add(kmClassRevenue.getBigDecimal("mar_amount"), ledger.getBigDecimal("mar_amount")));
						kmClassRevenue.set("apr_amount", NumberUtil.add(kmClassRevenue.getBigDecimal("apr_amount"), ledger.getBigDecimal("apr_amount")));
						kmClassRevenue.set("may_amount", NumberUtil.add(kmClassRevenue.getBigDecimal("may_amount"), ledger.getBigDecimal("may_amount")));
						kmClassRevenue.set("jun_amount", NumberUtil.add(kmClassRevenue.getBigDecimal("jun_amount"), ledger.getBigDecimal("jun_amount")));
						kmClassRevenue.set("jul_amount", NumberUtil.add(kmClassRevenue.getBigDecimal("jul_amount"), ledger.getBigDecimal("jul_amount")));
						kmClassRevenue.set("aug_amount", NumberUtil.add(kmClassRevenue.getBigDecimal("aug_amount"), ledger.getBigDecimal("aug_amount")));
						kmClassRevenue.set("sep_amount", NumberUtil.add(kmClassRevenue.getBigDecimal("sep_amount"), ledger.getBigDecimal("sep_amount")));
						kmClassRevenue.set("oct_amount", NumberUtil.add(kmClassRevenue.getBigDecimal("oct_amount"), ledger.getBigDecimal("oct_amount")));
						kmClassRevenue.set("nov_amount", NumberUtil.add(kmClassRevenue.getBigDecimal("nov_amount"), ledger.getBigDecimal("nov_amount")));
						kmClassRevenue.set("dec_amount", NumberUtil.add(kmClassRevenue.getBigDecimal("dec_amount"), ledger.getBigDecimal("dec_amount")));
						kmClassRevenue.set("total_amount", NumberUtil.add(kmClassRevenue.getBigDecimal("total_amount"), ledger.getBigDecimal("total_amount")));
					}

				}
			} else {
				for (int j = 0; j < ledgerList.size(); j++) {
					ledgerList.get(j).set("serial_number", StrUtil.format("2.{}.{}", i + 1, j + 1));
				}
				for (Entity ledger : ledgerList) {
					kmClassRevenue.set("jan_amount", NumberUtil.add(kmClassRevenue.getBigDecimal("jan_amount"), ledger.getBigDecimal("jan_amount")));
					kmClassRevenue.set("feb_amount", NumberUtil.add(kmClassRevenue.getBigDecimal("feb_amount"), ledger.getBigDecimal("feb_amount")));
					kmClassRevenue.set("mar_amount", NumberUtil.add(kmClassRevenue.getBigDecimal("mar_amount"), ledger.getBigDecimal("mar_amount")));
					kmClassRevenue.set("apr_amount", NumberUtil.add(kmClassRevenue.getBigDecimal("apr_amount"), ledger.getBigDecimal("apr_amount")));
					kmClassRevenue.set("may_amount", NumberUtil.add(kmClassRevenue.getBigDecimal("may_amount"), ledger.getBigDecimal("may_amount")));
					kmClassRevenue.set("jun_amount", NumberUtil.add(kmClassRevenue.getBigDecimal("jun_amount"), ledger.getBigDecimal("jun_amount")));
					kmClassRevenue.set("jul_amount", NumberUtil.add(kmClassRevenue.getBigDecimal("jul_amount"), ledger.getBigDecimal("jul_amount")));
					kmClassRevenue.set("aug_amount", NumberUtil.add(kmClassRevenue.getBigDecimal("aug_amount"), ledger.getBigDecimal("aug_amount")));
					kmClassRevenue.set("sep_amount", NumberUtil.add(kmClassRevenue.getBigDecimal("sep_amount"), ledger.getBigDecimal("sep_amount")));
					kmClassRevenue.set("oct_amount", NumberUtil.add(kmClassRevenue.getBigDecimal("oct_amount"), ledger.getBigDecimal("oct_amount")));
					kmClassRevenue.set("nov_amount", NumberUtil.add(kmClassRevenue.getBigDecimal("nov_amount"), ledger.getBigDecimal("nov_amount")));
					kmClassRevenue.set("dec_amount", NumberUtil.add(kmClassRevenue.getBigDecimal("dec_amount"), ledger.getBigDecimal("dec_amount")));
					kmClassRevenue.set("total_amount", NumberUtil.add(kmClassRevenue.getBigDecimal("total_amount"), ledger.getBigDecimal("total_amount")));
				}
			}

			totalCostList.add(kmClassRevenue);
			totalCostList.addAll(ledgerList);
			kmClassRevenueList.add(kmClassRevenue);
		}

		for (Entity kmClassRevenue : kmClassRevenueList) {
			totalCostList.get(0).set("jan_amount", NumberUtil.add(totalCostList.get(0).getBigDecimal("jan_amount"), kmClassRevenue.getBigDecimal("jan_amount")));
			totalCostList.get(0).set("feb_amount", NumberUtil.add(totalCostList.get(0).getBigDecimal("feb_amount"), kmClassRevenue.getBigDecimal("feb_amount")));
			totalCostList.get(0).set("mar_amount", NumberUtil.add(totalCostList.get(0).getBigDecimal("mar_amount"), kmClassRevenue.getBigDecimal("mar_amount")));
			totalCostList.get(0).set("apr_amount", NumberUtil.add(totalCostList.get(0).getBigDecimal("apr_amount"), kmClassRevenue.getBigDecimal("apr_amount")));
			totalCostList.get(0).set("may_amount", NumberUtil.add(totalCostList.get(0).getBigDecimal("may_amount"), kmClassRevenue.getBigDecimal("may_amount")));
			totalCostList.get(0).set("jun_amount", NumberUtil.add(totalCostList.get(0).getBigDecimal("jun_amount"), kmClassRevenue.getBigDecimal("jun_amount")));
			totalCostList.get(0).set("jul_amount", NumberUtil.add(totalCostList.get(0).getBigDecimal("jul_amount"), kmClassRevenue.getBigDecimal("jul_amount")));
			totalCostList.get(0).set("aug_amount", NumberUtil.add(totalCostList.get(0).getBigDecimal("aug_amount"), kmClassRevenue.getBigDecimal("aug_amount")));
			totalCostList.get(0).set("sep_amount", NumberUtil.add(totalCostList.get(0).getBigDecimal("sep_amount"), kmClassRevenue.getBigDecimal("sep_amount")));
			totalCostList.get(0).set("oct_amount", NumberUtil.add(totalCostList.get(0).getBigDecimal("oct_amount"), kmClassRevenue.getBigDecimal("oct_amount")));
			totalCostList.get(0).set("nov_amount", NumberUtil.add(totalCostList.get(0).getBigDecimal("nov_amount"), kmClassRevenue.getBigDecimal("nov_amount")));
			totalCostList.get(0).set("dec_amount", NumberUtil.add(totalCostList.get(0).getBigDecimal("dec_amount"), kmClassRevenue.getBigDecimal("dec_amount")));
			totalCostList.get(0).set("total_amount", NumberUtil.add(totalCostList.get(0).getBigDecimal("total_amount"), kmClassRevenue.getBigDecimal("total_amount")));
		}

		return totalCostList;
	}

	// 报表毛利率数据构建
	private Entity buildGrossProfitMargin(List<Entity> totalRevenueList, List<Entity> totalCostList) throws Exception {
		Entity totalRevenue = totalRevenueList.get(0);
		Entity totalCost = totalCostList.get(0);
		Entity grossProfitMargin = new Entity();
		grossProfitMargin.set("serial_number", "3").set("id", "毛利率").set("name", "三、毛利率").set("parent", "-1").set("editable", "0")
				.set("jan_amount", NumberUtil.sub(totalRevenue.getBigDecimal("jan_amount"), totalCost.getBigDecimal("jan_amount")))
				.set("feb_amount", NumberUtil.sub(totalRevenue.getBigDecimal("feb_amount"), totalCost.getBigDecimal("feb_amount")))
				.set("mar_amount", NumberUtil.sub(totalRevenue.getBigDecimal("mar_amount"), totalCost.getBigDecimal("mar_amount")))
				.set("apr_amount", NumberUtil.sub(totalRevenue.getBigDecimal("apr_amount"), totalCost.getBigDecimal("apr_amount")))
				.set("may_amount", NumberUtil.sub(totalRevenue.getBigDecimal("may_amount"), totalCost.getBigDecimal("may_amount")))
				.set("jun_amount", NumberUtil.sub(totalRevenue.getBigDecimal("jun_amount"), totalCost.getBigDecimal("jun_amount")))
				.set("jul_amount", NumberUtil.sub(totalRevenue.getBigDecimal("jul_amount"), totalCost.getBigDecimal("jul_amount")))
				.set("aug_amount", NumberUtil.sub(totalRevenue.getBigDecimal("aug_amount"), totalCost.getBigDecimal("aug_amount")))
				.set("sep_amount", NumberUtil.sub(totalRevenue.getBigDecimal("sep_amount"), totalCost.getBigDecimal("sep_amount")))
				.set("oct_amount", NumberUtil.sub(totalRevenue.getBigDecimal("oct_amount"), totalCost.getBigDecimal("oct_amount")))
				.set("nov_amount", NumberUtil.sub(totalRevenue.getBigDecimal("nov_amount"), totalCost.getBigDecimal("nov_amount")))
				.set("dec_amount", NumberUtil.sub(totalRevenue.getBigDecimal("dec_amount"), totalCost.getBigDecimal("dec_amount")))
				.set("total_amount", NumberUtil.sub(totalRevenue.getBigDecimal("total_amount"), totalCost.getBigDecimal("total_amount")));
		return grossProfitMargin;
	}

	// 报表总部管理费分摊和其他数据构建
	private List<Entity> buildApportionmentAndOther(List<Entity> totalCostList, Session dbSession, String budgetMainId) throws Exception {
		Map<String, Entity> totalCostMap = totalCostList.stream().collect(
				Collectors.toMap(entity -> entity.getStr("parent") + "_" + entity.getStr("name"), Function.identity(), (existing, replacement) -> existing));

		String querySql = "SELECT *, margin_name AS name, '-1' AS parent, '1' AS editable FROM zh_caiwu_budget_filling_margin WHERE budget_main_id = ?";
		List<Entity> apportionmentAndOtherList = dbSession.query(querySql, budgetMainId);
		for (int i = 0; i < apportionmentAndOtherList.size(); i++) {
			if (apportionmentAndOtherList.get(i).getStr("margin_name").equals("四、总部管理费分摊")) {
				apportionmentAndOtherList.get(i).set("jan_amount",
						NumberUtil.mul(totalCostMap.get("-1_二、总成本").getBigDecimal("jan_amount"), NumberUtil.div(apportionmentAndOtherList.get(i).getBigDecimal("share_proportion"), 100)));
				apportionmentAndOtherList.get(i).set("feb_amount",
						NumberUtil.mul(totalCostMap.get("-1_二、总成本").getBigDecimal("feb_amount"), NumberUtil.div(apportionmentAndOtherList.get(i).getBigDecimal("share_proportion"), 100)));
				apportionmentAndOtherList.get(i).set("mar_amount",
						NumberUtil.mul(totalCostMap.get("-1_二、总成本").getBigDecimal("mar_amount"), NumberUtil.div(apportionmentAndOtherList.get(i).getBigDecimal("share_proportion"), 100)));
				apportionmentAndOtherList.get(i).set("apr_amount",
						NumberUtil.mul(totalCostMap.get("-1_二、总成本").getBigDecimal("apr_amount"), NumberUtil.div(apportionmentAndOtherList.get(i).getBigDecimal("share_proportion"), 100)));
				apportionmentAndOtherList.get(i).set("may_amount",
						NumberUtil.mul(totalCostMap.get("-1_二、总成本").getBigDecimal("may_amount"), NumberUtil.div(apportionmentAndOtherList.get(i).getBigDecimal("share_proportion"), 100)));
				apportionmentAndOtherList.get(i).set("jun_amount",
						NumberUtil.mul(totalCostMap.get("-1_二、总成本").getBigDecimal("jun_amount"), NumberUtil.div(apportionmentAndOtherList.get(i).getBigDecimal("share_proportion"), 100)));
				apportionmentAndOtherList.get(i).set("jul_amount",
						NumberUtil.mul(totalCostMap.get("-1_二、总成本").getBigDecimal("jul_amount"), NumberUtil.div(apportionmentAndOtherList.get(i).getBigDecimal("share_proportion"), 100)));
				apportionmentAndOtherList.get(i).set("aug_amount",
						NumberUtil.mul(totalCostMap.get("-1_二、总成本").getBigDecimal("aug_amount"), NumberUtil.div(apportionmentAndOtherList.get(i).getBigDecimal("share_proportion"), 100)));
				apportionmentAndOtherList.get(i).set("sep_amount",
						NumberUtil.mul(totalCostMap.get("-1_二、总成本").getBigDecimal("sep_amount"), NumberUtil.div(apportionmentAndOtherList.get(i).getBigDecimal("share_proportion"), 100)));
				apportionmentAndOtherList.get(i).set("oct_amount",
						NumberUtil.mul(totalCostMap.get("-1_二、总成本").getBigDecimal("oct_amount"), NumberUtil.div(apportionmentAndOtherList.get(i).getBigDecimal("share_proportion"), 100)));
				apportionmentAndOtherList.get(i).set("nov_amount",
						NumberUtil.mul(totalCostMap.get("-1_二、总成本").getBigDecimal("nov_amount"), NumberUtil.div(apportionmentAndOtherList.get(i).getBigDecimal("share_proportion"), 100)));
				apportionmentAndOtherList.get(i).set("dec_amount",
						NumberUtil.mul(totalCostMap.get("-1_二、总成本").getBigDecimal("dec_amount"), NumberUtil.div(apportionmentAndOtherList.get(i).getBigDecimal("share_proportion"), 100)));
				apportionmentAndOtherList.get(i).set("total_amount",
						NumberUtil.mul(totalCostMap.get("-1_二、总成本").getBigDecimal("total_amount"), NumberUtil.div(apportionmentAndOtherList.get(i).getBigDecimal("share_proportion"), 100)));
			}
			apportionmentAndOtherList.get(i).set("serial_number", i + 4);
		}
		return apportionmentAndOtherList;
	}

	// 报表利润总额数据构建
	private Entity buildTotalProfit(Entity grossProfitMargin, List<Entity> apportionmentAndOtherList) throws Exception {
		Entity apportionment = apportionmentAndOtherList.get(0);
		Entity other = apportionmentAndOtherList.get(1);
		Entity totalProfit = new Entity();
		totalProfit.set("serial_number", "6").set("id", "利润总额").set("name", "六、利润总额").set("parent", "-1").set("editable", "0")
				.set("jan_amount", NumberUtil.sub(grossProfitMargin.getBigDecimal("jan_amount"), apportionment.getBigDecimal("jan_amount"), other.getBigDecimal("jan_amount")))
				.set("feb_amount", NumberUtil.sub(grossProfitMargin.getBigDecimal("feb_amount"), apportionment.getBigDecimal("feb_amount"), other.getBigDecimal("feb_amount")))
				.set("mar_amount", NumberUtil.sub(grossProfitMargin.getBigDecimal("mar_amount"), apportionment.getBigDecimal("mar_amount"), other.getBigDecimal("mar_amount")))
				.set("apr_amount", NumberUtil.sub(grossProfitMargin.getBigDecimal("apr_amount"), apportionment.getBigDecimal("apr_amount"), other.getBigDecimal("apr_amount")))
				.set("may_amount", NumberUtil.sub(grossProfitMargin.getBigDecimal("may_amount"), apportionment.getBigDecimal("may_amount"), other.getBigDecimal("may_amount")))
				.set("jun_amount", NumberUtil.sub(grossProfitMargin.getBigDecimal("jun_amount"), apportionment.getBigDecimal("jun_amount"), other.getBigDecimal("jun_amount")))
				.set("jul_amount", NumberUtil.sub(grossProfitMargin.getBigDecimal("jul_amount"), apportionment.getBigDecimal("jul_amount"), other.getBigDecimal("jul_amount")))
				.set("aug_amount", NumberUtil.sub(grossProfitMargin.getBigDecimal("aug_amount"), apportionment.getBigDecimal("aug_amount"), other.getBigDecimal("aug_amount")))
				.set("sep_amount", NumberUtil.sub(grossProfitMargin.getBigDecimal("sep_amount"), apportionment.getBigDecimal("sep_amount"), other.getBigDecimal("sep_amount")))
				.set("oct_amount", NumberUtil.sub(grossProfitMargin.getBigDecimal("oct_amount"), apportionment.getBigDecimal("oct_amount"), other.getBigDecimal("oct_amount")))
				.set("nov_amount", NumberUtil.sub(grossProfitMargin.getBigDecimal("nov_amount"), apportionment.getBigDecimal("nov_amount"), other.getBigDecimal("nov_amount")))
				.set("dec_amount", NumberUtil.sub(grossProfitMargin.getBigDecimal("dec_amount"), apportionment.getBigDecimal("dec_amount"), other.getBigDecimal("dec_amount")))
				.set("total_amount", NumberUtil.sub(grossProfitMargin.getBigDecimal("total_amount"), apportionment.getBigDecimal("total_amount"), other.getBigDecimal("total_amount")));
		return totalProfit;
	}

	// 报表人员及人均情况数据构建
	private List<Entity> buildPersonnelAndPerCapitaSituation(Session dbSession, String budgetMainId) throws Exception {
		List<Entity> personnelAndPerCapitaSituationList = new ArrayList<Entity>();
		String querySql = "SELECT *, situation_name AS name, '平均从业人员人数' AS parent, '1' AS editable FROM zh_caiwu_budget_filling_personnel WHERE budget_main_id = ?";
		Entity averageNumberOfEmployees = new Entity();
		averageNumberOfEmployees.set("serial_number", "1").set("id", "平均从业人员人数").set("name", "一、平均从业人员人数").set("parent", "-1").set("editable", "0").set("jan", BigDecimal.ZERO)
				.set("feb", BigDecimal.ZERO).set("mar", BigDecimal.ZERO).set("apr", BigDecimal.ZERO).set("may", BigDecimal.ZERO).set("jun", BigDecimal.ZERO).set("jul", BigDecimal.ZERO)
				.set("aug", BigDecimal.ZERO).set("sep", BigDecimal.ZERO).set("oct", BigDecimal.ZERO).set("nov", BigDecimal.ZERO).set("dec", BigDecimal.ZERO).set("average_actual", BigDecimal.ZERO);
		List<Entity> personnelList = dbSession.query(querySql, budgetMainId);
		Entity averageNumberOfEmployedPersonnel = new Entity();
		averageNumberOfEmployedPersonnel.set("serial_number", "2").set("id", "平均用工人员人数").set("name", "二、平均用工人员人数").set("parent", "-1").set("editable", "0").set("jan", BigDecimal.ZERO)
				.set("feb", BigDecimal.ZERO).set("mar", BigDecimal.ZERO).set("apr", BigDecimal.ZERO).set("may", BigDecimal.ZERO).set("jun", BigDecimal.ZERO).set("jul", BigDecimal.ZERO)
				.set("aug", BigDecimal.ZERO).set("sep", BigDecimal.ZERO).set("oct", BigDecimal.ZERO).set("nov", BigDecimal.ZERO).set("dec", BigDecimal.ZERO).set("average_actual", BigDecimal.ZERO);
		personnelAndPerCapitaSituationList.add(averageNumberOfEmployees);
		personnelAndPerCapitaSituationList.addAll(personnelList);
		personnelAndPerCapitaSituationList.add(averageNumberOfEmployedPersonnel);

		for (int i = 0; i < personnelAndPerCapitaSituationList.size(); i++) {
			if (personnelAndPerCapitaSituationList.get(i).getStr("id").equals("平均从业人员人数")) {
				String queryDataSql = "SELECT * FROM zh_caiwu_budget_filling_personnel WHERE budget_main_id = ? AND (situation_name = '平均在职人数' OR situation_name = '平均返聘人数' OR situation_name = '平均劳务派遣')";
				List<Entity> entityList = dbSession.query(queryDataSql, budgetMainId);
				for (Entity entity : entityList) {
					personnelAndPerCapitaSituationList.get(i).set("jan", NumberUtil.add(personnelAndPerCapitaSituationList.get(i).getBigDecimal("jan"), entity.getBigDecimal("jan")));
					personnelAndPerCapitaSituationList.get(i).set("feb", NumberUtil.add(personnelAndPerCapitaSituationList.get(i).getBigDecimal("feb"), entity.getBigDecimal("feb")));
					personnelAndPerCapitaSituationList.get(i).set("mar", NumberUtil.add(personnelAndPerCapitaSituationList.get(i).getBigDecimal("mar"), entity.getBigDecimal("mar")));
					personnelAndPerCapitaSituationList.get(i).set("apr", NumberUtil.add(personnelAndPerCapitaSituationList.get(i).getBigDecimal("apr"), entity.getBigDecimal("apr")));
					personnelAndPerCapitaSituationList.get(i).set("may", NumberUtil.add(personnelAndPerCapitaSituationList.get(i).getBigDecimal("may"), entity.getBigDecimal("may")));
					personnelAndPerCapitaSituationList.get(i).set("jun", NumberUtil.add(personnelAndPerCapitaSituationList.get(i).getBigDecimal("jun"), entity.getBigDecimal("jun")));
					personnelAndPerCapitaSituationList.get(i).set("jul", NumberUtil.add(personnelAndPerCapitaSituationList.get(i).getBigDecimal("jul"), entity.getBigDecimal("jul")));
					personnelAndPerCapitaSituationList.get(i).set("aug", NumberUtil.add(personnelAndPerCapitaSituationList.get(i).getBigDecimal("aug"), entity.getBigDecimal("aug")));
					personnelAndPerCapitaSituationList.get(i).set("sep", NumberUtil.add(personnelAndPerCapitaSituationList.get(i).getBigDecimal("sep"), entity.getBigDecimal("sep")));
					personnelAndPerCapitaSituationList.get(i).set("oct", NumberUtil.add(personnelAndPerCapitaSituationList.get(i).getBigDecimal("oct"), entity.getBigDecimal("oct")));
					personnelAndPerCapitaSituationList.get(i).set("nov", NumberUtil.add(personnelAndPerCapitaSituationList.get(i).getBigDecimal("nov"), entity.getBigDecimal("nov")));
					personnelAndPerCapitaSituationList.get(i).set("dec", NumberUtil.add(personnelAndPerCapitaSituationList.get(i).getBigDecimal("dec"), entity.getBigDecimal("dec")));
					personnelAndPerCapitaSituationList.get(i).set("average_actual",
							NumberUtil.add(personnelAndPerCapitaSituationList.get(i).getBigDecimal("average_actual"), entity.getBigDecimal("average_actual")));
				}

			} else if (personnelAndPerCapitaSituationList.get(i).getStr("id").equals("平均用工人员人数")) {
				String queryDataSql = "SELECT * FROM zh_caiwu_budget_filling_personnel WHERE budget_main_id = ?";
				List<Entity> entityList = dbSession.query(queryDataSql, budgetMainId);
				for (Entity entity : entityList) {
					personnelAndPerCapitaSituationList.get(i).set("jan", NumberUtil.add(personnelAndPerCapitaSituationList.get(i).getBigDecimal("jan"), entity.getBigDecimal("jan")));
					personnelAndPerCapitaSituationList.get(i).set("feb", NumberUtil.add(personnelAndPerCapitaSituationList.get(i).getBigDecimal("feb"), entity.getBigDecimal("feb")));
					personnelAndPerCapitaSituationList.get(i).set("mar", NumberUtil.add(personnelAndPerCapitaSituationList.get(i).getBigDecimal("mar"), entity.getBigDecimal("mar")));
					personnelAndPerCapitaSituationList.get(i).set("apr", NumberUtil.add(personnelAndPerCapitaSituationList.get(i).getBigDecimal("apr"), entity.getBigDecimal("apr")));
					personnelAndPerCapitaSituationList.get(i).set("may", NumberUtil.add(personnelAndPerCapitaSituationList.get(i).getBigDecimal("may"), entity.getBigDecimal("may")));
					personnelAndPerCapitaSituationList.get(i).set("jun", NumberUtil.add(personnelAndPerCapitaSituationList.get(i).getBigDecimal("jun"), entity.getBigDecimal("jun")));
					personnelAndPerCapitaSituationList.get(i).set("jul", NumberUtil.add(personnelAndPerCapitaSituationList.get(i).getBigDecimal("jul"), entity.getBigDecimal("jul")));
					personnelAndPerCapitaSituationList.get(i).set("aug", NumberUtil.add(personnelAndPerCapitaSituationList.get(i).getBigDecimal("aug"), entity.getBigDecimal("aug")));
					personnelAndPerCapitaSituationList.get(i).set("sep", NumberUtil.add(personnelAndPerCapitaSituationList.get(i).getBigDecimal("sep"), entity.getBigDecimal("sep")));
					personnelAndPerCapitaSituationList.get(i).set("oct", NumberUtil.add(personnelAndPerCapitaSituationList.get(i).getBigDecimal("oct"), entity.getBigDecimal("oct")));
					personnelAndPerCapitaSituationList.get(i).set("nov", NumberUtil.add(personnelAndPerCapitaSituationList.get(i).getBigDecimal("nov"), entity.getBigDecimal("nov")));
					personnelAndPerCapitaSituationList.get(i).set("dec", NumberUtil.add(personnelAndPerCapitaSituationList.get(i).getBigDecimal("dec"), entity.getBigDecimal("dec")));
					personnelAndPerCapitaSituationList.get(i).set("average_actual",
							NumberUtil.add(personnelAndPerCapitaSituationList.get(i).getBigDecimal("average_actual"), entity.getBigDecimal("average_actual")));
				}
			} else {
				personnelAndPerCapitaSituationList.get(i).set("serial_number", StrUtil.format("1.{}", i));
			}
		}

		return personnelAndPerCapitaSituationList;
	}

	// 报表人工成本-全口径部分数据构建
	private List<Entity> buildFullAperture(List<Entity> financialStatements, List<Entity> personnelAndPerCapitaSituation) throws Exception {
		List<Entity> fullApertureList = new ArrayList<Entity>();
		Map<String, Entity> financialStatementsMap = financialStatements.stream().collect(
				Collectors.toMap(entity -> entity.getStr("parent") + "_" + entity.getStr("name"), Function.identity(), (existing, replacement) -> existing));
		Map<String, Entity> personnelAndPerCapitaSituationMap = personnelAndPerCapitaSituation.stream().collect(
				Collectors.toMap(entity -> entity.getStr("parent") + "_" + entity.getStr("name"), Function.identity(), (existing, replacement) -> existing));

		// 工资总额（含研发）
		Entity zzzehyfEntity = new Entity();
		zzzehyfEntity
				.set("serial_number", "1.1")
				.set("id", "工资总额（含研发）")
				.set("name", "工资总额（含研发）")
				.set("parent", "在职人员人工成本")
				.set("editable", "0")
				.set("jan_amount",
						NumberUtil.add(financialStatementsMap.get("人工和用工成本（不含研发）_工资总额（不含研发）").getBigDecimal("jan_amount"), financialStatementsMap.get("研发费_研发-工资").getBigDecimal("jan_amount")))
				.set("feb_amount",
						NumberUtil.add(financialStatementsMap.get("人工和用工成本（不含研发）_工资总额（不含研发）").getBigDecimal("feb_amount"), financialStatementsMap.get("研发费_研发-工资").getBigDecimal("feb_amount")))
				.set("mar_amount",
						NumberUtil.add(financialStatementsMap.get("人工和用工成本（不含研发）_工资总额（不含研发）").getBigDecimal("mar_amount"), financialStatementsMap.get("研发费_研发-工资").getBigDecimal("mar_amount")))
				.set("apr_amount",
						NumberUtil.add(financialStatementsMap.get("人工和用工成本（不含研发）_工资总额（不含研发）").getBigDecimal("apr_amount"), financialStatementsMap.get("研发费_研发-工资").getBigDecimal("apr_amount")))
				.set("may_amount",
						NumberUtil.add(financialStatementsMap.get("人工和用工成本（不含研发）_工资总额（不含研发）").getBigDecimal("may_amount"), financialStatementsMap.get("研发费_研发-工资").getBigDecimal("may_amount")))
				.set("jun_amount",
						NumberUtil.add(financialStatementsMap.get("人工和用工成本（不含研发）_工资总额（不含研发）").getBigDecimal("jun_amount"), financialStatementsMap.get("研发费_研发-工资").getBigDecimal("jun_amount")))
				.set("jul_amount",
						NumberUtil.add(financialStatementsMap.get("人工和用工成本（不含研发）_工资总额（不含研发）").getBigDecimal("jul_amount"), financialStatementsMap.get("研发费_研发-工资").getBigDecimal("jul_amount")))
				.set("aug_amount",
						NumberUtil.add(financialStatementsMap.get("人工和用工成本（不含研发）_工资总额（不含研发）").getBigDecimal("aug_amount"), financialStatementsMap.get("研发费_研发-工资").getBigDecimal("aug_amount")))
				.set("sep_amount",
						NumberUtil.add(financialStatementsMap.get("人工和用工成本（不含研发）_工资总额（不含研发）").getBigDecimal("sep_amount"), financialStatementsMap.get("研发费_研发-工资").getBigDecimal("sep_amount")))
				.set("oct_amount",
						NumberUtil.add(financialStatementsMap.get("人工和用工成本（不含研发）_工资总额（不含研发）").getBigDecimal("oct_amount"), financialStatementsMap.get("研发费_研发-工资").getBigDecimal("oct_amount")))
				.set("nov_amount",
						NumberUtil.add(financialStatementsMap.get("人工和用工成本（不含研发）_工资总额（不含研发）").getBigDecimal("nov_amount"), financialStatementsMap.get("研发费_研发-工资").getBigDecimal("nov_amount")))
				.set("dec_amount",
						NumberUtil.add(financialStatementsMap.get("人工和用工成本（不含研发）_工资总额（不含研发）").getBigDecimal("dec_amount"), financialStatementsMap.get("研发费_研发-工资").getBigDecimal("dec_amount")))
				.set("total_amount",
						NumberUtil.add(financialStatementsMap.get("人工和用工成本（不含研发）_工资总额（不含研发）").getBigDecimal("total_amount"), financialStatementsMap.get("研发费_研发-工资").getBigDecimal("total_amount")));

		// 福利费
		Entity flfEntity = new Entity();
		flfEntity
				.set("serial_number", "1.2")
				.set("id", "福利费")
				.set("name", "福利费")
				.set("parent", "在职人员人工成本")
				.set("editable", "0")
				.set("jan_amount",
						NumberUtil.add(financialStatementsMap.get("人工和用工成本（不含研发）_体检费").getBigDecimal("jan_amount"), financialStatementsMap.get("人工和用工成本（不含研发）_防暑降温费").getBigDecimal("jan_amount"),
								financialStatementsMap.get("人工和用工成本（不含研发）_食堂经费").getBigDecimal("jan_amount"), financialStatementsMap.get("人工和用工成本（不含研发）_独生子女费").getBigDecimal("jan_amount"),
								financialStatementsMap.get("人工和用工成本（不含研发）_女职工卫生费").getBigDecimal("jan_amount"), financialStatementsMap.get("人工和用工成本（不含研发）_职工供养直系亲属医疗补贴支出").getBigDecimal("jan_amount"),
								financialStatementsMap.get("人工和用工成本（不含研发）_职工探亲假路费").getBigDecimal("jan_amount"), financialStatementsMap.get("人工和用工成本（不含研发）_困难补助").getBigDecimal("jan_amount"),
								financialStatementsMap.get("人工和用工成本（不含研发）_一次性辞退福利及其他").getBigDecimal("jan_amount")))
				.set("feb_amount",
						NumberUtil.add(financialStatementsMap.get("人工和用工成本（不含研发）_体检费").getBigDecimal("feb_amount"), financialStatementsMap.get("人工和用工成本（不含研发）_防暑降温费").getBigDecimal("feb_amount"),
								financialStatementsMap.get("人工和用工成本（不含研发）_食堂经费").getBigDecimal("feb_amount"), financialStatementsMap.get("人工和用工成本（不含研发）_独生子女费").getBigDecimal("feb_amount"),
								financialStatementsMap.get("人工和用工成本（不含研发）_女职工卫生费").getBigDecimal("feb_amount"), financialStatementsMap.get("人工和用工成本（不含研发）_职工供养直系亲属医疗补贴支出").getBigDecimal("feb_amount"),
								financialStatementsMap.get("人工和用工成本（不含研发）_职工探亲假路费").getBigDecimal("feb_amount"), financialStatementsMap.get("人工和用工成本（不含研发）_困难补助").getBigDecimal("feb_amount"),
								financialStatementsMap.get("人工和用工成本（不含研发）_一次性辞退福利及其他").getBigDecimal("feb_amount")))
				.set("mar_amount",
						NumberUtil.add(financialStatementsMap.get("人工和用工成本（不含研发）_体检费").getBigDecimal("mar_amount"), financialStatementsMap.get("人工和用工成本（不含研发）_防暑降温费").getBigDecimal("mar_amount"),
								financialStatementsMap.get("人工和用工成本（不含研发）_食堂经费").getBigDecimal("mar_amount"), financialStatementsMap.get("人工和用工成本（不含研发）_独生子女费").getBigDecimal("mar_amount"),
								financialStatementsMap.get("人工和用工成本（不含研发）_女职工卫生费").getBigDecimal("mar_amount"), financialStatementsMap.get("人工和用工成本（不含研发）_职工供养直系亲属医疗补贴支出").getBigDecimal("mar_amount"),
								financialStatementsMap.get("人工和用工成本（不含研发）_职工探亲假路费").getBigDecimal("mar_amount"), financialStatementsMap.get("人工和用工成本（不含研发）_困难补助").getBigDecimal("mar_amount"),
								financialStatementsMap.get("人工和用工成本（不含研发）_一次性辞退福利及其他").getBigDecimal("mar_amount")))
				.set("apr_amount",
						NumberUtil.add(financialStatementsMap.get("人工和用工成本（不含研发）_体检费").getBigDecimal("apr_amount"), financialStatementsMap.get("人工和用工成本（不含研发）_防暑降温费").getBigDecimal("apr_amount"),
								financialStatementsMap.get("人工和用工成本（不含研发）_食堂经费").getBigDecimal("apr_amount"), financialStatementsMap.get("人工和用工成本（不含研发）_独生子女费").getBigDecimal("apr_amount"),
								financialStatementsMap.get("人工和用工成本（不含研发）_女职工卫生费").getBigDecimal("apr_amount"), financialStatementsMap.get("人工和用工成本（不含研发）_职工供养直系亲属医疗补贴支出").getBigDecimal("apr_amount"),
								financialStatementsMap.get("人工和用工成本（不含研发）_职工探亲假路费").getBigDecimal("apr_amount"), financialStatementsMap.get("人工和用工成本（不含研发）_困难补助").getBigDecimal("apr_amount"),
								financialStatementsMap.get("人工和用工成本（不含研发）_一次性辞退福利及其他").getBigDecimal("apr_amount")))
				.set("may_amount",
						NumberUtil.add(financialStatementsMap.get("人工和用工成本（不含研发）_体检费").getBigDecimal("may_amount"), financialStatementsMap.get("人工和用工成本（不含研发）_防暑降温费").getBigDecimal("may_amount"),
								financialStatementsMap.get("人工和用工成本（不含研发）_食堂经费").getBigDecimal("may_amount"), financialStatementsMap.get("人工和用工成本（不含研发）_独生子女费").getBigDecimal("may_amount"),
								financialStatementsMap.get("人工和用工成本（不含研发）_女职工卫生费").getBigDecimal("may_amount"), financialStatementsMap.get("人工和用工成本（不含研发）_职工供养直系亲属医疗补贴支出").getBigDecimal("may_amount"),
								financialStatementsMap.get("人工和用工成本（不含研发）_职工探亲假路费").getBigDecimal("may_amount"), financialStatementsMap.get("人工和用工成本（不含研发）_困难补助").getBigDecimal("may_amount"),
								financialStatementsMap.get("人工和用工成本（不含研发）_一次性辞退福利及其他").getBigDecimal("may_amount")))
				.set("jun_amount",
						NumberUtil.add(financialStatementsMap.get("人工和用工成本（不含研发）_体检费").getBigDecimal("jun_amount"), financialStatementsMap.get("人工和用工成本（不含研发）_防暑降温费").getBigDecimal("jun_amount"),
								financialStatementsMap.get("人工和用工成本（不含研发）_食堂经费").getBigDecimal("jun_amount"), financialStatementsMap.get("人工和用工成本（不含研发）_独生子女费").getBigDecimal("jun_amount"),
								financialStatementsMap.get("人工和用工成本（不含研发）_女职工卫生费").getBigDecimal("jun_amount"), financialStatementsMap.get("人工和用工成本（不含研发）_职工供养直系亲属医疗补贴支出").getBigDecimal("jun_amount"),
								financialStatementsMap.get("人工和用工成本（不含研发）_职工探亲假路费").getBigDecimal("jun_amount"), financialStatementsMap.get("人工和用工成本（不含研发）_困难补助").getBigDecimal("jun_amount"),
								financialStatementsMap.get("人工和用工成本（不含研发）_一次性辞退福利及其他").getBigDecimal("jun_amount")))
				.set("jul_amount",
						NumberUtil.add(financialStatementsMap.get("人工和用工成本（不含研发）_体检费").getBigDecimal("jul_amount"), financialStatementsMap.get("人工和用工成本（不含研发）_防暑降温费").getBigDecimal("jul_amount"),
								financialStatementsMap.get("人工和用工成本（不含研发）_食堂经费").getBigDecimal("jul_amount"), financialStatementsMap.get("人工和用工成本（不含研发）_独生子女费").getBigDecimal("jul_amount"),
								financialStatementsMap.get("人工和用工成本（不含研发）_女职工卫生费").getBigDecimal("jul_amount"), financialStatementsMap.get("人工和用工成本（不含研发）_职工供养直系亲属医疗补贴支出").getBigDecimal("jul_amount"),
								financialStatementsMap.get("人工和用工成本（不含研发）_职工探亲假路费").getBigDecimal("jul_amount"), financialStatementsMap.get("人工和用工成本（不含研发）_困难补助").getBigDecimal("jul_amount"),
								financialStatementsMap.get("人工和用工成本（不含研发）_一次性辞退福利及其他").getBigDecimal("jul_amount")))
				.set("aug_amount",
						NumberUtil.add(financialStatementsMap.get("人工和用工成本（不含研发）_体检费").getBigDecimal("aug_amount"), financialStatementsMap.get("人工和用工成本（不含研发）_防暑降温费").getBigDecimal("aug_amount"),
								financialStatementsMap.get("人工和用工成本（不含研发）_食堂经费").getBigDecimal("aug_amount"), financialStatementsMap.get("人工和用工成本（不含研发）_独生子女费").getBigDecimal("aug_amount"),
								financialStatementsMap.get("人工和用工成本（不含研发）_女职工卫生费").getBigDecimal("aug_amount"), financialStatementsMap.get("人工和用工成本（不含研发）_职工供养直系亲属医疗补贴支出").getBigDecimal("aug_amount"),
								financialStatementsMap.get("人工和用工成本（不含研发）_职工探亲假路费").getBigDecimal("aug_amount"), financialStatementsMap.get("人工和用工成本（不含研发）_困难补助").getBigDecimal("aug_amount"),
								financialStatementsMap.get("人工和用工成本（不含研发）_一次性辞退福利及其他").getBigDecimal("aug_amount")))
				.set("sep_amount",
						NumberUtil.add(financialStatementsMap.get("人工和用工成本（不含研发）_体检费").getBigDecimal("sep_amount"), financialStatementsMap.get("人工和用工成本（不含研发）_防暑降温费").getBigDecimal("sep_amount"),
								financialStatementsMap.get("人工和用工成本（不含研发）_食堂经费").getBigDecimal("sep_amount"), financialStatementsMap.get("人工和用工成本（不含研发）_独生子女费").getBigDecimal("sep_amount"),
								financialStatementsMap.get("人工和用工成本（不含研发）_女职工卫生费").getBigDecimal("sep_amount"), financialStatementsMap.get("人工和用工成本（不含研发）_职工供养直系亲属医疗补贴支出").getBigDecimal("sep_amount"),
								financialStatementsMap.get("人工和用工成本（不含研发）_职工探亲假路费").getBigDecimal("sep_amount"), financialStatementsMap.get("人工和用工成本（不含研发）_困难补助").getBigDecimal("sep_amount"),
								financialStatementsMap.get("人工和用工成本（不含研发）_一次性辞退福利及其他").getBigDecimal("sep_amount")))
				.set("oct_amount",
						NumberUtil.add(financialStatementsMap.get("人工和用工成本（不含研发）_体检费").getBigDecimal("oct_amount"), financialStatementsMap.get("人工和用工成本（不含研发）_防暑降温费").getBigDecimal("oct_amount"),
								financialStatementsMap.get("人工和用工成本（不含研发）_食堂经费").getBigDecimal("oct_amount"), financialStatementsMap.get("人工和用工成本（不含研发）_独生子女费").getBigDecimal("oct_amount"),
								financialStatementsMap.get("人工和用工成本（不含研发）_女职工卫生费").getBigDecimal("oct_amount"), financialStatementsMap.get("人工和用工成本（不含研发）_职工供养直系亲属医疗补贴支出").getBigDecimal("oct_amount"),
								financialStatementsMap.get("人工和用工成本（不含研发）_职工探亲假路费").getBigDecimal("oct_amount"), financialStatementsMap.get("人工和用工成本（不含研发）_困难补助").getBigDecimal("oct_amount"),
								financialStatementsMap.get("人工和用工成本（不含研发）_一次性辞退福利及其他").getBigDecimal("oct_amount")))
				.set("nov_amount",
						NumberUtil.add(financialStatementsMap.get("人工和用工成本（不含研发）_体检费").getBigDecimal("nov_amount"), financialStatementsMap.get("人工和用工成本（不含研发）_防暑降温费").getBigDecimal("nov_amount"),
								financialStatementsMap.get("人工和用工成本（不含研发）_食堂经费").getBigDecimal("nov_amount"), financialStatementsMap.get("人工和用工成本（不含研发）_独生子女费").getBigDecimal("nov_amount"),
								financialStatementsMap.get("人工和用工成本（不含研发）_女职工卫生费").getBigDecimal("nov_amount"), financialStatementsMap.get("人工和用工成本（不含研发）_职工供养直系亲属医疗补贴支出").getBigDecimal("nov_amount"),
								financialStatementsMap.get("人工和用工成本（不含研发）_职工探亲假路费").getBigDecimal("nov_amount"), financialStatementsMap.get("人工和用工成本（不含研发）_困难补助").getBigDecimal("nov_amount"),
								financialStatementsMap.get("人工和用工成本（不含研发）_一次性辞退福利及其他").getBigDecimal("nov_amount")))
				.set("dec_amount",
						NumberUtil.add(financialStatementsMap.get("人工和用工成本（不含研发）_体检费").getBigDecimal("dec_amount"), financialStatementsMap.get("人工和用工成本（不含研发）_防暑降温费").getBigDecimal("dec_amount"),
								financialStatementsMap.get("人工和用工成本（不含研发）_食堂经费").getBigDecimal("dec_amount"), financialStatementsMap.get("人工和用工成本（不含研发）_独生子女费").getBigDecimal("dec_amount"),
								financialStatementsMap.get("人工和用工成本（不含研发）_女职工卫生费").getBigDecimal("dec_amount"), financialStatementsMap.get("人工和用工成本（不含研发）_职工供养直系亲属医疗补贴支出").getBigDecimal("dec_amount"),
								financialStatementsMap.get("人工和用工成本（不含研发）_职工探亲假路费").getBigDecimal("dec_amount"), financialStatementsMap.get("人工和用工成本（不含研发）_困难补助").getBigDecimal("dec_amount"),
								financialStatementsMap.get("人工和用工成本（不含研发）_一次性辞退福利及其他").getBigDecimal("dec_amount")))
				.set("total_amount",
						NumberUtil.add(financialStatementsMap.get("人工和用工成本（不含研发）_体检费").getBigDecimal("total_amount"), financialStatementsMap.get("人工和用工成本（不含研发）_防暑降温费").getBigDecimal("total_amount"),
								financialStatementsMap.get("人工和用工成本（不含研发）_食堂经费").getBigDecimal("total_amount"), financialStatementsMap.get("人工和用工成本（不含研发）_独生子女费").getBigDecimal("total_amount"),
								financialStatementsMap.get("人工和用工成本（不含研发）_女职工卫生费").getBigDecimal("total_amount"),
								financialStatementsMap.get("人工和用工成本（不含研发）_职工供养直系亲属医疗补贴支出").getBigDecimal("total_amount"),
								financialStatementsMap.get("人工和用工成本（不含研发）_职工探亲假路费").getBigDecimal("total_amount"), financialStatementsMap.get("人工和用工成本（不含研发）_困难补助").getBigDecimal("total_amount"),
								financialStatementsMap.get("人工和用工成本（不含研发）_一次性辞退福利及其他").getBigDecimal("total_amount")));

		// 社会保险（含研发）
		Entity shbxhyfEntity = new Entity();
		shbxhyfEntity
				.set("serial_number", "1.3")
				.set("id", "社会保险（含研发）")
				.set("name", "社会保险（含研发）")
				.set("parent", "在职人员人工成本")
				.set("editable", "0")
				.set("jan_amount",
						NumberUtil.add(financialStatementsMap.get("人工和用工成本（不含研发）_养老保险（不含研发）").getBigDecimal("jan_amount"),
								financialStatementsMap.get("人工和用工成本（不含研发）_医疗保险").getBigDecimal("jan_amount"), financialStatementsMap.get("人工和用工成本（不含研发）_失业保险").getBigDecimal("jan_amount"),
								financialStatementsMap.get("人工和用工成本（不含研发）_工伤保险").getBigDecimal("jan_amount"), financialStatementsMap.get("人工和用工成本（不含研发）_生育保险").getBigDecimal("jan_amount"),
								financialStatementsMap.get("研发费_研发-社保").getBigDecimal("jan_amount")))
				.set("feb_amount",
						NumberUtil.add(financialStatementsMap.get("人工和用工成本（不含研发）_养老保险（不含研发）").getBigDecimal("feb_amount"),
								financialStatementsMap.get("人工和用工成本（不含研发）_医疗保险").getBigDecimal("feb_amount"), financialStatementsMap.get("人工和用工成本（不含研发）_失业保险").getBigDecimal("feb_amount"),
								financialStatementsMap.get("人工和用工成本（不含研发）_工伤保险").getBigDecimal("feb_amount"), financialStatementsMap.get("人工和用工成本（不含研发）_生育保险").getBigDecimal("feb_amount"),
								financialStatementsMap.get("研发费_研发-社保").getBigDecimal("feb_amount")))
				.set("mar_amount",
						NumberUtil.add(financialStatementsMap.get("人工和用工成本（不含研发）_养老保险（不含研发）").getBigDecimal("mar_amount"),
								financialStatementsMap.get("人工和用工成本（不含研发）_医疗保险").getBigDecimal("mar_amount"), financialStatementsMap.get("人工和用工成本（不含研发）_失业保险").getBigDecimal("mar_amount"),
								financialStatementsMap.get("人工和用工成本（不含研发）_工伤保险").getBigDecimal("mar_amount"), financialStatementsMap.get("人工和用工成本（不含研发）_生育保险").getBigDecimal("mar_amount"),
								financialStatementsMap.get("研发费_研发-社保").getBigDecimal("mar_amount")))
				.set("apr_amount",
						NumberUtil.add(financialStatementsMap.get("人工和用工成本（不含研发）_养老保险（不含研发）").getBigDecimal("apr_amount"),
								financialStatementsMap.get("人工和用工成本（不含研发）_医疗保险").getBigDecimal("apr_amount"), financialStatementsMap.get("人工和用工成本（不含研发）_失业保险").getBigDecimal("apr_amount"),
								financialStatementsMap.get("人工和用工成本（不含研发）_工伤保险").getBigDecimal("apr_amount"), financialStatementsMap.get("人工和用工成本（不含研发）_生育保险").getBigDecimal("apr_amount"),
								financialStatementsMap.get("研发费_研发-社保").getBigDecimal("apr_amount")))
				.set("may_amount",
						NumberUtil.add(financialStatementsMap.get("人工和用工成本（不含研发）_养老保险（不含研发）").getBigDecimal("may_amount"),
								financialStatementsMap.get("人工和用工成本（不含研发）_医疗保险").getBigDecimal("may_amount"), financialStatementsMap.get("人工和用工成本（不含研发）_失业保险").getBigDecimal("may_amount"),
								financialStatementsMap.get("人工和用工成本（不含研发）_工伤保险").getBigDecimal("may_amount"), financialStatementsMap.get("人工和用工成本（不含研发）_生育保险").getBigDecimal("may_amount"),
								financialStatementsMap.get("研发费_研发-社保").getBigDecimal("may_amount")))
				.set("jun_amount",
						NumberUtil.add(financialStatementsMap.get("人工和用工成本（不含研发）_养老保险（不含研发）").getBigDecimal("jun_amount"),
								financialStatementsMap.get("人工和用工成本（不含研发）_医疗保险").getBigDecimal("jun_amount"), financialStatementsMap.get("人工和用工成本（不含研发）_失业保险").getBigDecimal("jun_amount"),
								financialStatementsMap.get("人工和用工成本（不含研发）_工伤保险").getBigDecimal("jun_amount"), financialStatementsMap.get("人工和用工成本（不含研发）_生育保险").getBigDecimal("jun_amount"),
								financialStatementsMap.get("研发费_研发-社保").getBigDecimal("jun_amount")))
				.set("jul_amount",
						NumberUtil.add(financialStatementsMap.get("人工和用工成本（不含研发）_养老保险（不含研发）").getBigDecimal("jul_amount"),
								financialStatementsMap.get("人工和用工成本（不含研发）_医疗保险").getBigDecimal("jul_amount"), financialStatementsMap.get("人工和用工成本（不含研发）_失业保险").getBigDecimal("jul_amount"),
								financialStatementsMap.get("人工和用工成本（不含研发）_工伤保险").getBigDecimal("jul_amount"), financialStatementsMap.get("人工和用工成本（不含研发）_生育保险").getBigDecimal("jul_amount"),
								financialStatementsMap.get("研发费_研发-社保").getBigDecimal("jul_amount")))
				.set("aug_amount",
						NumberUtil.add(financialStatementsMap.get("人工和用工成本（不含研发）_养老保险（不含研发）").getBigDecimal("aug_amount"),
								financialStatementsMap.get("人工和用工成本（不含研发）_医疗保险").getBigDecimal("aug_amount"), financialStatementsMap.get("人工和用工成本（不含研发）_失业保险").getBigDecimal("aug_amount"),
								financialStatementsMap.get("人工和用工成本（不含研发）_工伤保险").getBigDecimal("aug_amount"), financialStatementsMap.get("人工和用工成本（不含研发）_生育保险").getBigDecimal("aug_amount"),
								financialStatementsMap.get("研发费_研发-社保").getBigDecimal("aug_amount")))
				.set("sep_amount",
						NumberUtil.add(financialStatementsMap.get("人工和用工成本（不含研发）_养老保险（不含研发）").getBigDecimal("sep_amount"),
								financialStatementsMap.get("人工和用工成本（不含研发）_医疗保险").getBigDecimal("sep_amount"), financialStatementsMap.get("人工和用工成本（不含研发）_失业保险").getBigDecimal("sep_amount"),
								financialStatementsMap.get("人工和用工成本（不含研发）_工伤保险").getBigDecimal("sep_amount"), financialStatementsMap.get("人工和用工成本（不含研发）_生育保险").getBigDecimal("sep_amount"),
								financialStatementsMap.get("研发费_研发-社保").getBigDecimal("sep_amount")))
				.set("oct_amount",
						NumberUtil.add(financialStatementsMap.get("人工和用工成本（不含研发）_养老保险（不含研发）").getBigDecimal("oct_amount"),
								financialStatementsMap.get("人工和用工成本（不含研发）_医疗保险").getBigDecimal("oct_amount"), financialStatementsMap.get("人工和用工成本（不含研发）_失业保险").getBigDecimal("oct_amount"),
								financialStatementsMap.get("人工和用工成本（不含研发）_工伤保险").getBigDecimal("oct_amount"), financialStatementsMap.get("人工和用工成本（不含研发）_生育保险").getBigDecimal("oct_amount"),
								financialStatementsMap.get("研发费_研发-社保").getBigDecimal("oct_amount")))
				.set("nov_amount",
						NumberUtil.add(financialStatementsMap.get("人工和用工成本（不含研发）_养老保险（不含研发）").getBigDecimal("nov_amount"),
								financialStatementsMap.get("人工和用工成本（不含研发）_医疗保险").getBigDecimal("nov_amount"), financialStatementsMap.get("人工和用工成本（不含研发）_失业保险").getBigDecimal("nov_amount"),
								financialStatementsMap.get("人工和用工成本（不含研发）_工伤保险").getBigDecimal("nov_amount"), financialStatementsMap.get("人工和用工成本（不含研发）_生育保险").getBigDecimal("nov_amount"),
								financialStatementsMap.get("研发费_研发-社保").getBigDecimal("nov_amount")))
				.set("dec_amount",
						NumberUtil.add(financialStatementsMap.get("人工和用工成本（不含研发）_养老保险（不含研发）").getBigDecimal("dec_amount"),
								financialStatementsMap.get("人工和用工成本（不含研发）_医疗保险").getBigDecimal("dec_amount"), financialStatementsMap.get("人工和用工成本（不含研发）_失业保险").getBigDecimal("dec_amount"),
								financialStatementsMap.get("人工和用工成本（不含研发）_工伤保险").getBigDecimal("dec_amount"), financialStatementsMap.get("人工和用工成本（不含研发）_生育保险").getBigDecimal("dec_amount"),
								financialStatementsMap.get("研发费_研发-社保").getBigDecimal("dec_amount")))
				.set("total_amount",
						NumberUtil.add(financialStatementsMap.get("人工和用工成本（不含研发）_养老保险（不含研发）").getBigDecimal("total_amount"),
								financialStatementsMap.get("人工和用工成本（不含研发）_医疗保险").getBigDecimal("total_amount"), financialStatementsMap.get("人工和用工成本（不含研发）_失业保险").getBigDecimal("total_amount"),
								financialStatementsMap.get("人工和用工成本（不含研发）_工伤保险").getBigDecimal("total_amount"), financialStatementsMap.get("人工和用工成本（不含研发）_生育保险").getBigDecimal("total_amount"),
								financialStatementsMap.get("研发费_研发-社保").getBigDecimal("total_amount")));

		// 企业年金
		Entity qynjEntity = new Entity();
		qynjEntity.set("serial_number", "1.4").set("id", "企业年金").set("name", "企业年金").set("parent", "在职人员人工成本").set("editable", "0")
				.set("jan_amount", financialStatementsMap.get("人工和用工成本（不含研发）_企业年金").getBigDecimal("jan_amount"))
				.set("feb_amount", financialStatementsMap.get("人工和用工成本（不含研发）_企业年金").getBigDecimal("feb_amount"))
				.set("mar_amount", financialStatementsMap.get("人工和用工成本（不含研发）_企业年金").getBigDecimal("mar_amount"))
				.set("apr_amount", financialStatementsMap.get("人工和用工成本（不含研发）_企业年金").getBigDecimal("apr_amount"))
				.set("may_amount", financialStatementsMap.get("人工和用工成本（不含研发）_企业年金").getBigDecimal("may_amount"))
				.set("jun_amount", financialStatementsMap.get("人工和用工成本（不含研发）_企业年金").getBigDecimal("jun_amount"))
				.set("jul_amount", financialStatementsMap.get("人工和用工成本（不含研发）_企业年金").getBigDecimal("jul_amount"))
				.set("aug_amount", financialStatementsMap.get("人工和用工成本（不含研发）_企业年金").getBigDecimal("aug_amount"))
				.set("sep_amount", financialStatementsMap.get("人工和用工成本（不含研发）_企业年金").getBigDecimal("sep_amount"))
				.set("oct_amount", financialStatementsMap.get("人工和用工成本（不含研发）_企业年金").getBigDecimal("oct_amount"))
				.set("nov_amount", financialStatementsMap.get("人工和用工成本（不含研发）_企业年金").getBigDecimal("nov_amount"))
				.set("dec_amount", financialStatementsMap.get("人工和用工成本（不含研发）_企业年金").getBigDecimal("dec_amount"))
				.set("total_amount", financialStatementsMap.get("人工和用工成本（不含研发）_企业年金").getBigDecimal("total_amount"));

		// 补充医疗
		Entity bcylEntity = new Entity();
		bcylEntity.set("serial_number", "1.5").set("id", "补充医疗").set("name", "补充医疗").set("parent", "在职人员人工成本").set("editable", "0")
				.set("jan_amount", financialStatementsMap.get("人工和用工成本（不含研发）_补充医疗").getBigDecimal("jan_amount"))
				.set("feb_amount", financialStatementsMap.get("人工和用工成本（不含研发）_补充医疗").getBigDecimal("feb_amount"))
				.set("mar_amount", financialStatementsMap.get("人工和用工成本（不含研发）_补充医疗").getBigDecimal("mar_amount"))
				.set("apr_amount", financialStatementsMap.get("人工和用工成本（不含研发）_补充医疗").getBigDecimal("apr_amount"))
				.set("may_amount", financialStatementsMap.get("人工和用工成本（不含研发）_补充医疗").getBigDecimal("may_amount"))
				.set("jun_amount", financialStatementsMap.get("人工和用工成本（不含研发）_补充医疗").getBigDecimal("jun_amount"))
				.set("jul_amount", financialStatementsMap.get("人工和用工成本（不含研发）_补充医疗").getBigDecimal("jul_amount"))
				.set("aug_amount", financialStatementsMap.get("人工和用工成本（不含研发）_补充医疗").getBigDecimal("aug_amount"))
				.set("sep_amount", financialStatementsMap.get("人工和用工成本（不含研发）_补充医疗").getBigDecimal("sep_amount"))
				.set("oct_amount", financialStatementsMap.get("人工和用工成本（不含研发）_补充医疗").getBigDecimal("oct_amount"))
				.set("nov_amount", financialStatementsMap.get("人工和用工成本（不含研发）_补充医疗").getBigDecimal("nov_amount"))
				.set("dec_amount", financialStatementsMap.get("人工和用工成本（不含研发）_补充医疗").getBigDecimal("dec_amount"))
				.set("total_amount", financialStatementsMap.get("人工和用工成本（不含研发）_补充医疗").getBigDecimal("total_amount"));

		// 意外伤害保险
		Entity ywshbxEntity = new Entity();
		ywshbxEntity.set("serial_number", "1.6").set("id", "意外伤害保险").set("name", "意外伤害保险").set("parent", "在职人员人工成本").set("editable", "0")
				.set("jan_amount", financialStatementsMap.get("人工和用工成本（不含研发）_意外伤害保险").getBigDecimal("jan_amount"))
				.set("feb_amount", financialStatementsMap.get("人工和用工成本（不含研发）_意外伤害保险").getBigDecimal("feb_amount"))
				.set("mar_amount", financialStatementsMap.get("人工和用工成本（不含研发）_意外伤害保险").getBigDecimal("mar_amount"))
				.set("apr_amount", financialStatementsMap.get("人工和用工成本（不含研发）_意外伤害保险").getBigDecimal("apr_amount"))
				.set("may_amount", financialStatementsMap.get("人工和用工成本（不含研发）_意外伤害保险").getBigDecimal("may_amount"))
				.set("jun_amount", financialStatementsMap.get("人工和用工成本（不含研发）_意外伤害保险").getBigDecimal("jun_amount"))
				.set("jul_amount", financialStatementsMap.get("人工和用工成本（不含研发）_意外伤害保险").getBigDecimal("jul_amount"))
				.set("aug_amount", financialStatementsMap.get("人工和用工成本（不含研发）_意外伤害保险").getBigDecimal("aug_amount"))
				.set("sep_amount", financialStatementsMap.get("人工和用工成本（不含研发）_意外伤害保险").getBigDecimal("sep_amount"))
				.set("oct_amount", financialStatementsMap.get("人工和用工成本（不含研发）_意外伤害保险").getBigDecimal("oct_amount"))
				.set("nov_amount", financialStatementsMap.get("人工和用工成本（不含研发）_意外伤害保险").getBigDecimal("nov_amount"))
				.set("dec_amount", financialStatementsMap.get("人工和用工成本（不含研发）_意外伤害保险").getBigDecimal("dec_amount"))
				.set("total_amount", financialStatementsMap.get("人工和用工成本（不含研发）_意外伤害保险").getBigDecimal("total_amount"));

		// 住房公积金
		Entity zfgjjEntity = new Entity();
		zfgjjEntity.set("serial_number", "1.7").set("id", "住房公积金").set("name", "住房公积金").set("parent", "在职人员人工成本").set("editable", "0")
				.set("jan_amount", financialStatementsMap.get("人工和用工成本（不含研发）_住房公积金").getBigDecimal("jan_amount"))
				.set("feb_amount", financialStatementsMap.get("人工和用工成本（不含研发）_住房公积金").getBigDecimal("feb_amount"))
				.set("mar_amount", financialStatementsMap.get("人工和用工成本（不含研发）_住房公积金").getBigDecimal("mar_amount"))
				.set("apr_amount", financialStatementsMap.get("人工和用工成本（不含研发）_住房公积金").getBigDecimal("apr_amount"))
				.set("may_amount", financialStatementsMap.get("人工和用工成本（不含研发）_住房公积金").getBigDecimal("may_amount"))
				.set("jun_amount", financialStatementsMap.get("人工和用工成本（不含研发）_住房公积金").getBigDecimal("jun_amount"))
				.set("jul_amount", financialStatementsMap.get("人工和用工成本（不含研发）_住房公积金").getBigDecimal("jul_amount"))
				.set("aug_amount", financialStatementsMap.get("人工和用工成本（不含研发）_住房公积金").getBigDecimal("aug_amount"))
				.set("sep_amount", financialStatementsMap.get("人工和用工成本（不含研发）_住房公积金").getBigDecimal("sep_amount"))
				.set("oct_amount", financialStatementsMap.get("人工和用工成本（不含研发）_住房公积金").getBigDecimal("oct_amount"))
				.set("nov_amount", financialStatementsMap.get("人工和用工成本（不含研发）_住房公积金").getBigDecimal("nov_amount"))
				.set("dec_amount", financialStatementsMap.get("人工和用工成本（不含研发）_住房公积金").getBigDecimal("dec_amount"))
				.set("total_amount", financialStatementsMap.get("人工和用工成本（不含研发）_住房公积金").getBigDecimal("total_amount"));

		// 工会经费
		Entity ghjfEntity = new Entity();
		ghjfEntity.set("serial_number", "1.8").set("id", "工会经费").set("name", "工会经费").set("parent", "在职人员人工成本").set("editable", "0")
				.set("jan_amount", financialStatementsMap.get("人工和用工成本（不含研发）_工会经费").getBigDecimal("jan_amount"))
				.set("feb_amount", financialStatementsMap.get("人工和用工成本（不含研发）_工会经费").getBigDecimal("feb_amount"))
				.set("mar_amount", financialStatementsMap.get("人工和用工成本（不含研发）_工会经费").getBigDecimal("mar_amount"))
				.set("apr_amount", financialStatementsMap.get("人工和用工成本（不含研发）_工会经费").getBigDecimal("apr_amount"))
				.set("may_amount", financialStatementsMap.get("人工和用工成本（不含研发）_工会经费").getBigDecimal("may_amount"))
				.set("jun_amount", financialStatementsMap.get("人工和用工成本（不含研发）_工会经费").getBigDecimal("jun_amount"))
				.set("jul_amount", financialStatementsMap.get("人工和用工成本（不含研发）_工会经费").getBigDecimal("jul_amount"))
				.set("aug_amount", financialStatementsMap.get("人工和用工成本（不含研发）_工会经费").getBigDecimal("aug_amount"))
				.set("sep_amount", financialStatementsMap.get("人工和用工成本（不含研发）_工会经费").getBigDecimal("sep_amount"))
				.set("oct_amount", financialStatementsMap.get("人工和用工成本（不含研发）_工会经费").getBigDecimal("oct_amount"))
				.set("nov_amount", financialStatementsMap.get("人工和用工成本（不含研发）_工会经费").getBigDecimal("nov_amount"))
				.set("dec_amount", financialStatementsMap.get("人工和用工成本（不含研发）_工会经费").getBigDecimal("dec_amount"))
				.set("total_amount", financialStatementsMap.get("人工和用工成本（不含研发）_工会经费").getBigDecimal("total_amount"));

		// 职工教育经费
		Entity zgjyjfEntity = new Entity();
		zgjyjfEntity.set("serial_number", "1.9").set("id", "职工教育经费").set("name", "职工教育经费").set("parent", "在职人员人工成本").set("editable", "0")
				.set("jan_amount", financialStatementsMap.get("人工和用工成本（不含研发）_职工教育经费").getBigDecimal("jan_amount"))
				.set("feb_amount", financialStatementsMap.get("人工和用工成本（不含研发）_职工教育经费").getBigDecimal("feb_amount"))
				.set("mar_amount", financialStatementsMap.get("人工和用工成本（不含研发）_职工教育经费").getBigDecimal("mar_amount"))
				.set("apr_amount", financialStatementsMap.get("人工和用工成本（不含研发）_职工教育经费").getBigDecimal("apr_amount"))
				.set("may_amount", financialStatementsMap.get("人工和用工成本（不含研发）_职工教育经费").getBigDecimal("may_amount"))
				.set("jun_amount", financialStatementsMap.get("人工和用工成本（不含研发）_职工教育经费").getBigDecimal("jun_amount"))
				.set("jul_amount", financialStatementsMap.get("人工和用工成本（不含研发）_职工教育经费").getBigDecimal("jul_amount"))
				.set("aug_amount", financialStatementsMap.get("人工和用工成本（不含研发）_职工教育经费").getBigDecimal("aug_amount"))
				.set("sep_amount", financialStatementsMap.get("人工和用工成本（不含研发）_职工教育经费").getBigDecimal("sep_amount"))
				.set("oct_amount", financialStatementsMap.get("人工和用工成本（不含研发）_职工教育经费").getBigDecimal("oct_amount"))
				.set("nov_amount", financialStatementsMap.get("人工和用工成本（不含研发）_职工教育经费").getBigDecimal("nov_amount"))
				.set("dec_amount", financialStatementsMap.get("人工和用工成本（不含研发）_职工教育经费").getBigDecimal("dec_amount"))
				.set("total_amount", financialStatementsMap.get("人工和用工成本（不含研发）_职工教育经费").getBigDecimal("total_amount"));

		// 残保金
		Entity cbjEntity = new Entity();
		cbjEntity.set("serial_number", "1.10").set("id", "残保金").set("name", "残保金").set("parent", "在职人员人工成本").set("editable", "0")
				.set("jan_amount", financialStatementsMap.get("人工和用工成本（不含研发）_残保金").getBigDecimal("jan_amount"))
				.set("feb_amount", financialStatementsMap.get("人工和用工成本（不含研发）_残保金").getBigDecimal("feb_amount"))
				.set("mar_amount", financialStatementsMap.get("人工和用工成本（不含研发）_残保金").getBigDecimal("mar_amount"))
				.set("apr_amount", financialStatementsMap.get("人工和用工成本（不含研发）_残保金").getBigDecimal("apr_amount"))
				.set("may_amount", financialStatementsMap.get("人工和用工成本（不含研发）_残保金").getBigDecimal("may_amount"))
				.set("jun_amount", financialStatementsMap.get("人工和用工成本（不含研发）_残保金").getBigDecimal("jun_amount"))
				.set("jul_amount", financialStatementsMap.get("人工和用工成本（不含研发）_残保金").getBigDecimal("jul_amount"))
				.set("aug_amount", financialStatementsMap.get("人工和用工成本（不含研发）_残保金").getBigDecimal("aug_amount"))
				.set("sep_amount", financialStatementsMap.get("人工和用工成本（不含研发）_残保金").getBigDecimal("sep_amount"))
				.set("oct_amount", financialStatementsMap.get("人工和用工成本（不含研发）_残保金").getBigDecimal("oct_amount"))
				.set("nov_amount", financialStatementsMap.get("人工和用工成本（不含研发）_残保金").getBigDecimal("nov_amount"))
				.set("dec_amount", financialStatementsMap.get("人工和用工成本（不含研发）_残保金").getBigDecimal("dec_amount"))
				.set("total_amount", financialStatementsMap.get("人工和用工成本（不含研发）_残保金").getBigDecimal("total_amount"));

		// 在职人员人工成本
		Entity zzryrgcbEntity = new Entity();
		zzryrgcbEntity
				.set("serial_number", "1")
				.set("id", "在职人员人工成本")
				.set("name", "一、在职人员人工成本")
				.set("parent", "-1")
				.set("editable", "0")
				.set("jan_amount",
						NumberUtil.add(zzzehyfEntity.getBigDecimal("jan_amount"), flfEntity.getBigDecimal("jan_amount"), shbxhyfEntity.getBigDecimal("jan_amount"),
								qynjEntity.getBigDecimal("jan_amount"), bcylEntity.getBigDecimal("jan_amount"), ywshbxEntity.getBigDecimal("jan_amount"), zfgjjEntity.getBigDecimal("jan_amount"),
								ghjfEntity.getBigDecimal("jan_amount"), zgjyjfEntity.getBigDecimal("jan_amount"), cbjEntity.getBigDecimal("jan_amount")))
				.set("feb_amount",
						NumberUtil.add(zzzehyfEntity.getBigDecimal("feb_amount"), flfEntity.getBigDecimal("feb_amount"), shbxhyfEntity.getBigDecimal("feb_amount"),
								qynjEntity.getBigDecimal("feb_amount"), bcylEntity.getBigDecimal("feb_amount"), ywshbxEntity.getBigDecimal("feb_amount"), zfgjjEntity.getBigDecimal("feb_amount"),
								ghjfEntity.getBigDecimal("feb_amount"), zgjyjfEntity.getBigDecimal("feb_amount"), cbjEntity.getBigDecimal("feb_amount")))
				.set("mar_amount",
						NumberUtil.add(zzzehyfEntity.getBigDecimal("mar_amount"), flfEntity.getBigDecimal("mar_amount"), shbxhyfEntity.getBigDecimal("mar_amount"),
								qynjEntity.getBigDecimal("mar_amount"), bcylEntity.getBigDecimal("mar_amount"), ywshbxEntity.getBigDecimal("mar_amount"), zfgjjEntity.getBigDecimal("mar_amount"),
								ghjfEntity.getBigDecimal("mar_amount"), zgjyjfEntity.getBigDecimal("mar_amount"), cbjEntity.getBigDecimal("mar_amount")))
				.set("apr_amount",
						NumberUtil.add(zzzehyfEntity.getBigDecimal("apr_amount"), flfEntity.getBigDecimal("apr_amount"), shbxhyfEntity.getBigDecimal("apr_amount"),
								qynjEntity.getBigDecimal("apr_amount"), bcylEntity.getBigDecimal("apr_amount"), ywshbxEntity.getBigDecimal("apr_amount"), zfgjjEntity.getBigDecimal("apr_amount"),
								ghjfEntity.getBigDecimal("apr_amount"), zgjyjfEntity.getBigDecimal("apr_amount"), cbjEntity.getBigDecimal("apr_amount")))
				.set("may_amount",
						NumberUtil.add(zzzehyfEntity.getBigDecimal("may_amount"), flfEntity.getBigDecimal("may_amount"), shbxhyfEntity.getBigDecimal("may_amount"),
								qynjEntity.getBigDecimal("may_amount"), bcylEntity.getBigDecimal("may_amount"), ywshbxEntity.getBigDecimal("may_amount"), zfgjjEntity.getBigDecimal("may_amount"),
								ghjfEntity.getBigDecimal("may_amount"), zgjyjfEntity.getBigDecimal("may_amount"), cbjEntity.getBigDecimal("may_amount")))
				.set("jun_amount",
						NumberUtil.add(zzzehyfEntity.getBigDecimal("jun_amount"), flfEntity.getBigDecimal("jun_amount"), shbxhyfEntity.getBigDecimal("jun_amount"),
								qynjEntity.getBigDecimal("jun_amount"), bcylEntity.getBigDecimal("jun_amount"), ywshbxEntity.getBigDecimal("jun_amount"), zfgjjEntity.getBigDecimal("jun_amount"),
								ghjfEntity.getBigDecimal("jun_amount"), zgjyjfEntity.getBigDecimal("jun_amount"), cbjEntity.getBigDecimal("jun_amount")))
				.set("jul_amount",
						NumberUtil.add(zzzehyfEntity.getBigDecimal("jul_amount"), flfEntity.getBigDecimal("jul_amount"), shbxhyfEntity.getBigDecimal("jul_amount"),
								qynjEntity.getBigDecimal("jul_amount"), bcylEntity.getBigDecimal("jul_amount"), ywshbxEntity.getBigDecimal("jul_amount"), zfgjjEntity.getBigDecimal("jul_amount"),
								ghjfEntity.getBigDecimal("jul_amount"), zgjyjfEntity.getBigDecimal("jul_amount"), cbjEntity.getBigDecimal("jul_amount")))
				.set("aug_amount",
						NumberUtil.add(zzzehyfEntity.getBigDecimal("aug_amount"), flfEntity.getBigDecimal("aug_amount"), shbxhyfEntity.getBigDecimal("aug_amount"),
								qynjEntity.getBigDecimal("aug_amount"), bcylEntity.getBigDecimal("aug_amount"), ywshbxEntity.getBigDecimal("aug_amount"), zfgjjEntity.getBigDecimal("aug_amount"),
								ghjfEntity.getBigDecimal("aug_amount"), zgjyjfEntity.getBigDecimal("aug_amount"), cbjEntity.getBigDecimal("aug_amount")))
				.set("sep_amount",
						NumberUtil.add(zzzehyfEntity.getBigDecimal("sep_amount"), flfEntity.getBigDecimal("sep_amount"), shbxhyfEntity.getBigDecimal("sep_amount"),
								qynjEntity.getBigDecimal("sep_amount"), bcylEntity.getBigDecimal("sep_amount"), ywshbxEntity.getBigDecimal("sep_amount"), zfgjjEntity.getBigDecimal("sep_amount"),
								ghjfEntity.getBigDecimal("sep_amount"), zgjyjfEntity.getBigDecimal("sep_amount"), cbjEntity.getBigDecimal("sep_amount")))
				.set("oct_amount",
						NumberUtil.add(zzzehyfEntity.getBigDecimal("oct_amount"), flfEntity.getBigDecimal("oct_amount"), shbxhyfEntity.getBigDecimal("oct_amount"),
								qynjEntity.getBigDecimal("oct_amount"), bcylEntity.getBigDecimal("oct_amount"), ywshbxEntity.getBigDecimal("oct_amount"), zfgjjEntity.getBigDecimal("oct_amount"),
								ghjfEntity.getBigDecimal("oct_amount"), zgjyjfEntity.getBigDecimal("oct_amount"), cbjEntity.getBigDecimal("oct_amount")))
				.set("nov_amount",
						NumberUtil.add(zzzehyfEntity.getBigDecimal("nov_amount"), flfEntity.getBigDecimal("nov_amount"), shbxhyfEntity.getBigDecimal("nov_amount"),
								qynjEntity.getBigDecimal("nov_amount"), bcylEntity.getBigDecimal("nov_amount"), ywshbxEntity.getBigDecimal("nov_amount"), zfgjjEntity.getBigDecimal("nov_amount"),
								ghjfEntity.getBigDecimal("nov_amount"), zgjyjfEntity.getBigDecimal("nov_amount"), cbjEntity.getBigDecimal("nov_amount")))
				.set("dec_amount",
						NumberUtil.add(zzzehyfEntity.getBigDecimal("dec_amount"), flfEntity.getBigDecimal("dec_amount"), shbxhyfEntity.getBigDecimal("dec_amount"),
								qynjEntity.getBigDecimal("dec_amount"), bcylEntity.getBigDecimal("dec_amount"), ywshbxEntity.getBigDecimal("dec_amount"), zfgjjEntity.getBigDecimal("dec_amount"),
								ghjfEntity.getBigDecimal("dec_amount"), zgjyjfEntity.getBigDecimal("dec_amount"), cbjEntity.getBigDecimal("dec_amount")))
				.set("total_amount",
						NumberUtil.add(zzzehyfEntity.getBigDecimal("total_amount"), flfEntity.getBigDecimal("total_amount"), shbxhyfEntity.getBigDecimal("total_amount"),
								qynjEntity.getBigDecimal("total_amount"), bcylEntity.getBigDecimal("total_amount"), ywshbxEntity.getBigDecimal("total_amount"),
								zfgjjEntity.getBigDecimal("total_amount"), ghjfEntity.getBigDecimal("total_amount"), zgjyjfEntity.getBigDecimal("total_amount"),
								cbjEntity.getBigDecimal("total_amount")));

		// 退休返聘实习人员费用
		Entity txfpsxryfyEntity = new Entity();
		txfpsxryfyEntity.set("serial_number", "2").set("id", "退休返聘实习人员费用").set("name", "二、退休返聘实习人员费用").set("parent", "-1").set("editable", "0")
				.set("jan_amount", financialStatementsMap.get("人工和用工成本（不含研发）_退休返聘实习人员费用").getBigDecimal("jan_amount"))
				.set("feb_amount", financialStatementsMap.get("人工和用工成本（不含研发）_退休返聘实习人员费用").getBigDecimal("feb_amount"))
				.set("mar_amount", financialStatementsMap.get("人工和用工成本（不含研发）_退休返聘实习人员费用").getBigDecimal("mar_amount"))
				.set("apr_amount", financialStatementsMap.get("人工和用工成本（不含研发）_退休返聘实习人员费用").getBigDecimal("apr_amount"))
				.set("may_amount", financialStatementsMap.get("人工和用工成本（不含研发）_退休返聘实习人员费用").getBigDecimal("may_amount"))
				.set("jun_amount", financialStatementsMap.get("人工和用工成本（不含研发）_退休返聘实习人员费用").getBigDecimal("jun_amount"))
				.set("jul_amount", financialStatementsMap.get("人工和用工成本（不含研发）_退休返聘实习人员费用").getBigDecimal("jul_amount"))
				.set("aug_amount", financialStatementsMap.get("人工和用工成本（不含研发）_退休返聘实习人员费用").getBigDecimal("aug_amount"))
				.set("sep_amount", financialStatementsMap.get("人工和用工成本（不含研发）_退休返聘实习人员费用").getBigDecimal("sep_amount"))
				.set("oct_amount", financialStatementsMap.get("人工和用工成本（不含研发）_退休返聘实习人员费用").getBigDecimal("oct_amount"))
				.set("nov_amount", financialStatementsMap.get("人工和用工成本（不含研发）_退休返聘实习人员费用").getBigDecimal("nov_amount"))
				.set("dec_amount", financialStatementsMap.get("人工和用工成本（不含研发）_退休返聘实习人员费用").getBigDecimal("dec_amount"))
				.set("total_amount", financialStatementsMap.get("人工和用工成本（不含研发）_退休返聘实习人员费用").getBigDecimal("total_amount"));

		// 派遣人员薪酬
		Entity pqryxcEntity = new Entity();
		pqryxcEntity.set("serial_number", "3").set("id", "派遣人员薪酬").set("name", "三、派遣人员薪酬").set("parent", "-1").set("editable", "0")
				.set("jan_amount", financialStatementsMap.get("人工和用工成本（不含研发）_派遣人员薪酬").getBigDecimal("jan_amount"))
				.set("feb_amount", financialStatementsMap.get("人工和用工成本（不含研发）_派遣人员薪酬").getBigDecimal("feb_amount"))
				.set("mar_amount", financialStatementsMap.get("人工和用工成本（不含研发）_派遣人员薪酬").getBigDecimal("mar_amount"))
				.set("apr_amount", financialStatementsMap.get("人工和用工成本（不含研发）_派遣人员薪酬").getBigDecimal("apr_amount"))
				.set("may_amount", financialStatementsMap.get("人工和用工成本（不含研发）_派遣人员薪酬").getBigDecimal("may_amount"))
				.set("jun_amount", financialStatementsMap.get("人工和用工成本（不含研发）_派遣人员薪酬").getBigDecimal("jun_amount"))
				.set("jul_amount", financialStatementsMap.get("人工和用工成本（不含研发）_派遣人员薪酬").getBigDecimal("jul_amount"))
				.set("aug_amount", financialStatementsMap.get("人工和用工成本（不含研发）_派遣人员薪酬").getBigDecimal("aug_amount"))
				.set("sep_amount", financialStatementsMap.get("人工和用工成本（不含研发）_派遣人员薪酬").getBigDecimal("sep_amount"))
				.set("oct_amount", financialStatementsMap.get("人工和用工成本（不含研发）_派遣人员薪酬").getBigDecimal("oct_amount"))
				.set("nov_amount", financialStatementsMap.get("人工和用工成本（不含研发）_派遣人员薪酬").getBigDecimal("nov_amount"))
				.set("dec_amount", financialStatementsMap.get("人工和用工成本（不含研发）_派遣人员薪酬").getBigDecimal("dec_amount"))
				.set("total_amount", financialStatementsMap.get("人工和用工成本（不含研发）_派遣人员薪酬").getBigDecimal("total_amount"));

		// 合作单位费用（无内部交易）
		Entity hzdwfyEntity = new Entity();
		hzdwfyEntity.set("serial_number", "4").set("id", "合作单位费用（无内部交易）").set("name", "四、合作单位费用（无内部交易）").set("parent", "-1").set("editable", "0")
				.set("jan_amount", financialStatementsMap.get("人工和用工成本（不含研发）_合作单位费用（无内部交易）").getBigDecimal("jan_amount"))
				.set("feb_amount", financialStatementsMap.get("人工和用工成本（不含研发）_合作单位费用（无内部交易）").getBigDecimal("feb_amount"))
				.set("mar_amount", financialStatementsMap.get("人工和用工成本（不含研发）_合作单位费用（无内部交易）").getBigDecimal("mar_amount"))
				.set("apr_amount", financialStatementsMap.get("人工和用工成本（不含研发）_合作单位费用（无内部交易）").getBigDecimal("apr_amount"))
				.set("may_amount", financialStatementsMap.get("人工和用工成本（不含研发）_合作单位费用（无内部交易）").getBigDecimal("may_amount"))
				.set("jun_amount", financialStatementsMap.get("人工和用工成本（不含研发）_合作单位费用（无内部交易）").getBigDecimal("jun_amount"))
				.set("jul_amount", financialStatementsMap.get("人工和用工成本（不含研发）_合作单位费用（无内部交易）").getBigDecimal("jul_amount"))
				.set("aug_amount", financialStatementsMap.get("人工和用工成本（不含研发）_合作单位费用（无内部交易）").getBigDecimal("aug_amount"))
				.set("sep_amount", financialStatementsMap.get("人工和用工成本（不含研发）_合作单位费用（无内部交易）").getBigDecimal("sep_amount"))
				.set("oct_amount", financialStatementsMap.get("人工和用工成本（不含研发）_合作单位费用（无内部交易）").getBigDecimal("oct_amount"))
				.set("nov_amount", financialStatementsMap.get("人工和用工成本（不含研发）_合作单位费用（无内部交易）").getBigDecimal("nov_amount"))
				.set("dec_amount", financialStatementsMap.get("人工和用工成本（不含研发）_合作单位费用（无内部交易）").getBigDecimal("dec_amount"))
				.set("total_amount", financialStatementsMap.get("人工和用工成本（不含研发）_合作单位费用（无内部交易）").getBigDecimal("total_amount"));

		// 海工爆破等合作费用
		Entity hgbpdhzfyEntity = new Entity();
		hgbpdhzfyEntity.set("serial_number", "5").set("id", "海工爆破等合作费用").set("name", "五、海工爆破等合作费用").set("parent", "-1").set("editable", "0")
				.set("jan_amount", financialStatementsMap.get("人工和用工成本（不含研发）_海工爆破等合作费用").getBigDecimal("jan_amount"))
				.set("feb_amount", financialStatementsMap.get("人工和用工成本（不含研发）_海工爆破等合作费用").getBigDecimal("feb_amount"))
				.set("mar_amount", financialStatementsMap.get("人工和用工成本（不含研发）_海工爆破等合作费用").getBigDecimal("mar_amount"))
				.set("apr_amount", financialStatementsMap.get("人工和用工成本（不含研发）_海工爆破等合作费用").getBigDecimal("apr_amount"))
				.set("may_amount", financialStatementsMap.get("人工和用工成本（不含研发）_海工爆破等合作费用").getBigDecimal("may_amount"))
				.set("jun_amount", financialStatementsMap.get("人工和用工成本（不含研发）_海工爆破等合作费用").getBigDecimal("jun_amount"))
				.set("jul_amount", financialStatementsMap.get("人工和用工成本（不含研发）_海工爆破等合作费用").getBigDecimal("jul_amount"))
				.set("aug_amount", financialStatementsMap.get("人工和用工成本（不含研发）_海工爆破等合作费用").getBigDecimal("aug_amount"))
				.set("sep_amount", financialStatementsMap.get("人工和用工成本（不含研发）_海工爆破等合作费用").getBigDecimal("sep_amount"))
				.set("oct_amount", financialStatementsMap.get("人工和用工成本（不含研发）_海工爆破等合作费用").getBigDecimal("oct_amount"))
				.set("nov_amount", financialStatementsMap.get("人工和用工成本（不含研发）_海工爆破等合作费用").getBigDecimal("nov_amount"))
				.set("dec_amount", financialStatementsMap.get("人工和用工成本（不含研发）_海工爆破等合作费用").getBigDecimal("dec_amount"))
				.set("total_amount", financialStatementsMap.get("人工和用工成本（不含研发）_海工爆破等合作费用").getBigDecimal("total_amount"));

		// 平均人工成本：在职
		Entity pjrgcbzzEntity = new Entity();
		pjrgcbzzEntity.set("serial_number", "6").set("id", "平均人工成本：在职").set("name", "六、平均人工成本：在职").set("parent", "-1").set("editable", "0");
		if (personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均在职人数").getBigDecimal("jan").compareTo(BigDecimal.ZERO) == 0) {
			pjrgcbzzEntity.set("jan_amount", BigDecimal.ZERO);
		} else {
			pjrgcbzzEntity.set("jan_amount", NumberUtil.div(zzryrgcbEntity.getBigDecimal("jan_amount"), personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均在职人数").getBigDecimal("jan"), 2));
		}
		if (personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均在职人数").getBigDecimal("feb").compareTo(BigDecimal.ZERO) == 0) {
			pjrgcbzzEntity.set("feb_amount", BigDecimal.ZERO);
		} else {
			pjrgcbzzEntity.set("feb_amount", NumberUtil.div(zzryrgcbEntity.getBigDecimal("feb_amount"), personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均在职人数").getBigDecimal("feb"), 2));
		}
		if (personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均在职人数").getBigDecimal("mar").compareTo(BigDecimal.ZERO) == 0) {
			pjrgcbzzEntity.set("mar_amount", BigDecimal.ZERO);
		} else {
			pjrgcbzzEntity.set("mar_amount", NumberUtil.div(zzryrgcbEntity.getBigDecimal("mar_amount"), personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均在职人数").getBigDecimal("mar"), 2));
		}
		if (personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均在职人数").getBigDecimal("apr").compareTo(BigDecimal.ZERO) == 0) {
			pjrgcbzzEntity.set("apr_amount", BigDecimal.ZERO);
		} else {
			pjrgcbzzEntity.set("apr_amount", NumberUtil.div(zzryrgcbEntity.getBigDecimal("apr_amount"), personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均在职人数").getBigDecimal("apr"), 2));
		}
		if (personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均在职人数").getBigDecimal("may").compareTo(BigDecimal.ZERO) == 0) {
			pjrgcbzzEntity.set("may_amount", BigDecimal.ZERO);
		} else {
			pjrgcbzzEntity.set("may_amount", NumberUtil.div(zzryrgcbEntity.getBigDecimal("may_amount"), personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均在职人数").getBigDecimal("may"), 2));
		}
		if (personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均在职人数").getBigDecimal("jun").compareTo(BigDecimal.ZERO) == 0) {
			pjrgcbzzEntity.set("jun_amount", BigDecimal.ZERO);
		} else {
			pjrgcbzzEntity.set("jun_amount", NumberUtil.div(zzryrgcbEntity.getBigDecimal("jun_amount"), personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均在职人数").getBigDecimal("jun"), 2));
		}
		if (personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均在职人数").getBigDecimal("jul").compareTo(BigDecimal.ZERO) == 0) {
			pjrgcbzzEntity.set("jul_amount", BigDecimal.ZERO);
		} else {
			pjrgcbzzEntity.set("jul_amount", NumberUtil.div(zzryrgcbEntity.getBigDecimal("jul_amount"), personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均在职人数").getBigDecimal("jul"), 2));
		}
		if (personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均在职人数").getBigDecimal("aug").compareTo(BigDecimal.ZERO) == 0) {
			pjrgcbzzEntity.set("aug_amount", BigDecimal.ZERO);
		} else {
			pjrgcbzzEntity.set("aug_amount", NumberUtil.div(zzryrgcbEntity.getBigDecimal("aug_amount"), personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均在职人数").getBigDecimal("aug"), 2));
		}
		if (personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均在职人数").getBigDecimal("sep").compareTo(BigDecimal.ZERO) == 0) {
			pjrgcbzzEntity.set("sep_amount", BigDecimal.ZERO);
		} else {
			pjrgcbzzEntity.set("sep_amount", NumberUtil.div(zzryrgcbEntity.getBigDecimal("sep_amount"), personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均在职人数").getBigDecimal("sep"), 2));
		}
		if (personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均在职人数").getBigDecimal("oct").compareTo(BigDecimal.ZERO) == 0) {
			pjrgcbzzEntity.set("oct_amount", BigDecimal.ZERO);
		} else {
			pjrgcbzzEntity.set("oct_amount", NumberUtil.div(zzryrgcbEntity.getBigDecimal("oct_amount"), personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均在职人数").getBigDecimal("oct"), 2));
		}
		if (personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均在职人数").getBigDecimal("nov").compareTo(BigDecimal.ZERO) == 0) {
			pjrgcbzzEntity.set("nov_amount", BigDecimal.ZERO);
		} else {
			pjrgcbzzEntity.set("nov_amount", NumberUtil.div(zzryrgcbEntity.getBigDecimal("nov_amount"), personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均在职人数").getBigDecimal("nov"), 2));
		}
		if (personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均在职人数").getBigDecimal("dec").compareTo(BigDecimal.ZERO) == 0) {
			pjrgcbzzEntity.set("dec_amount", BigDecimal.ZERO);
		} else {
			pjrgcbzzEntity.set("dec_amount", NumberUtil.div(zzryrgcbEntity.getBigDecimal("dec_amount"), personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均在职人数").getBigDecimal("dec"), 2));
		}
		if (personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均在职人数").getBigDecimal("average_actual").compareTo(BigDecimal.ZERO) == 0) {
			pjrgcbzzEntity.set("total_amount", BigDecimal.ZERO);
		} else {
			pjrgcbzzEntity.set("total_amount",
					NumberUtil.div(zzryrgcbEntity.getBigDecimal("total_amount"), personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均在职人数").getBigDecimal("average_actual"), 2));
		}

		// 平均人工成本：退休返聘
		Entity pjrgcbtxfpEntity = new Entity();
		pjrgcbtxfpEntity.set("serial_number", "7").set("id", "平均人工成本：退休返聘").set("name", "七、平均人工成本：退休返聘").set("parent", "-1").set("editable", "0");
		if (personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均返聘人数").getBigDecimal("jan").compareTo(BigDecimal.ZERO) == 0) {
			pjrgcbtxfpEntity.set("jan_amount", BigDecimal.ZERO);
		} else {
			pjrgcbzzEntity.set("jan_amount", NumberUtil.div(txfpsxryfyEntity.getBigDecimal("jan_amount"), personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均返聘人数").getBigDecimal("jan"), 2));
		}
		if (personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均返聘人数").getBigDecimal("feb").compareTo(BigDecimal.ZERO) == 0) {
			pjrgcbtxfpEntity.set("feb_amount", BigDecimal.ZERO);
		} else {
			pjrgcbzzEntity.set("feb_amount", NumberUtil.div(txfpsxryfyEntity.getBigDecimal("feb_amount"), personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均返聘人数").getBigDecimal("feb"), 2));
		}
		if (personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均返聘人数").getBigDecimal("mar").compareTo(BigDecimal.ZERO) == 0) {
			pjrgcbtxfpEntity.set("mar_amount", BigDecimal.ZERO);
		} else {
			pjrgcbzzEntity.set("mar_amount", NumberUtil.div(txfpsxryfyEntity.getBigDecimal("mar_amount"), personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均返聘人数").getBigDecimal("mar"), 2));
		}
		if (personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均返聘人数").getBigDecimal("apr").compareTo(BigDecimal.ZERO) == 0) {
			pjrgcbtxfpEntity.set("apr_amount", BigDecimal.ZERO);
		} else {
			pjrgcbzzEntity.set("apr_amount", NumberUtil.div(txfpsxryfyEntity.getBigDecimal("apr_amount"), personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均返聘人数").getBigDecimal("apr"), 2));
		}
		if (personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均返聘人数").getBigDecimal("may").compareTo(BigDecimal.ZERO) == 0) {
			pjrgcbtxfpEntity.set("may_amount", BigDecimal.ZERO);
		} else {
			pjrgcbzzEntity.set("may_amount", NumberUtil.div(txfpsxryfyEntity.getBigDecimal("may_amount"), personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均返聘人数").getBigDecimal("may"), 2));
		}
		if (personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均返聘人数").getBigDecimal("jun").compareTo(BigDecimal.ZERO) == 0) {
			pjrgcbtxfpEntity.set("jun_amount", BigDecimal.ZERO);
		} else {
			pjrgcbzzEntity.set("jun_amount", NumberUtil.div(txfpsxryfyEntity.getBigDecimal("jun_amount"), personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均返聘人数").getBigDecimal("jun"), 2));
		}
		if (personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均返聘人数").getBigDecimal("jul").compareTo(BigDecimal.ZERO) == 0) {
			pjrgcbtxfpEntity.set("jul_amount", BigDecimal.ZERO);
		} else {
			pjrgcbzzEntity.set("jul_amount", NumberUtil.div(txfpsxryfyEntity.getBigDecimal("jul_amount"), personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均返聘人数").getBigDecimal("jul"), 2));
		}
		if (personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均返聘人数").getBigDecimal("aug").compareTo(BigDecimal.ZERO) == 0) {
			pjrgcbtxfpEntity.set("aug_amount", BigDecimal.ZERO);
		} else {
			pjrgcbzzEntity.set("aug_amount", NumberUtil.div(txfpsxryfyEntity.getBigDecimal("aug_amount"), personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均返聘人数").getBigDecimal("aug"), 2));
		}
		if (personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均返聘人数").getBigDecimal("sep").compareTo(BigDecimal.ZERO) == 0) {
			pjrgcbtxfpEntity.set("sep_amount", BigDecimal.ZERO);
		} else {
			pjrgcbzzEntity.set("sep_amount", NumberUtil.div(txfpsxryfyEntity.getBigDecimal("sep_amount"), personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均返聘人数").getBigDecimal("sep"), 2));
		}
		if (personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均返聘人数").getBigDecimal("oct").compareTo(BigDecimal.ZERO) == 0) {
			pjrgcbtxfpEntity.set("oct_amount", BigDecimal.ZERO);
		} else {
			pjrgcbzzEntity.set("oct_amount", NumberUtil.div(txfpsxryfyEntity.getBigDecimal("oct_amount"), personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均返聘人数").getBigDecimal("oct"), 2));
		}
		if (personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均返聘人数").getBigDecimal("nov").compareTo(BigDecimal.ZERO) == 0) {
			pjrgcbtxfpEntity.set("nov_amount", BigDecimal.ZERO);
		} else {
			pjrgcbzzEntity.set("nov_amount", NumberUtil.div(txfpsxryfyEntity.getBigDecimal("nov_amount"), personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均返聘人数").getBigDecimal("nov"), 2));
		}
		if (personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均返聘人数").getBigDecimal("dec").compareTo(BigDecimal.ZERO) == 0) {
			pjrgcbtxfpEntity.set("dec_amount", BigDecimal.ZERO);
		} else {
			pjrgcbzzEntity.set("dec_amount", NumberUtil.div(txfpsxryfyEntity.getBigDecimal("dec_amount"), personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均返聘人数").getBigDecimal("dec"), 2));
		}
		if (personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均返聘人数").getBigDecimal("average_actual").compareTo(BigDecimal.ZERO) == 0) {
			pjrgcbtxfpEntity.set("total_amount", BigDecimal.ZERO);
		} else {
			pjrgcbzzEntity.set("total_amount",
					NumberUtil.div(txfpsxryfyEntity.getBigDecimal("total_amount"), personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均返聘人数").getBigDecimal("average_actual"), 2));
		}

		// 平均人工成本：派遣
		Entity pjrgcbpqEntity = new Entity();
		pjrgcbpqEntity.set("serial_number", "8").set("id", "平均人工成本：派遣").set("name", "八、平均人工成本：派遣").set("parent", "-1").set("editable", "0");
		if (personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均劳务派遣").getBigDecimal("jan").compareTo(BigDecimal.ZERO) == 0) {
			pjrgcbpqEntity.set("jan_amount", BigDecimal.ZERO);
		} else {
			pjrgcbpqEntity.set("jan_amount", NumberUtil.div(pqryxcEntity.getBigDecimal("jan_amount"), personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均劳务派遣").getBigDecimal("jan"), 2));
		}
		if (personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均劳务派遣").getBigDecimal("feb").compareTo(BigDecimal.ZERO) == 0) {
			pjrgcbpqEntity.set("feb_amount", BigDecimal.ZERO);
		} else {
			pjrgcbpqEntity.set("feb_amount", NumberUtil.div(pqryxcEntity.getBigDecimal("feb_amount"), personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均劳务派遣").getBigDecimal("feb"), 2));
		}
		if (personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均劳务派遣").getBigDecimal("mar").compareTo(BigDecimal.ZERO) == 0) {
			pjrgcbpqEntity.set("mar_amount", BigDecimal.ZERO);
		} else {
			pjrgcbpqEntity.set("mar_amount", NumberUtil.div(pqryxcEntity.getBigDecimal("mar_amount"), personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均劳务派遣").getBigDecimal("mar"), 2));
		}
		if (personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均劳务派遣").getBigDecimal("apr").compareTo(BigDecimal.ZERO) == 0) {
			pjrgcbpqEntity.set("apr_amount", BigDecimal.ZERO);
		} else {
			pjrgcbpqEntity.set("apr_amount", NumberUtil.div(pqryxcEntity.getBigDecimal("apr_amount"), personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均劳务派遣").getBigDecimal("apr"), 2));
		}
		if (personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均劳务派遣").getBigDecimal("may").compareTo(BigDecimal.ZERO) == 0) {
			pjrgcbpqEntity.set("may_amount", BigDecimal.ZERO);
		} else {
			pjrgcbpqEntity.set("may_amount", NumberUtil.div(pqryxcEntity.getBigDecimal("may_amount"), personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均劳务派遣").getBigDecimal("may"), 2));
		}
		if (personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均劳务派遣").getBigDecimal("jun").compareTo(BigDecimal.ZERO) == 0) {
			pjrgcbpqEntity.set("jun_amount", BigDecimal.ZERO);
		} else {
			pjrgcbpqEntity.set("jun_amount", NumberUtil.div(pqryxcEntity.getBigDecimal("jun_amount"), personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均劳务派遣").getBigDecimal("jun"), 2));
		}
		if (personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均劳务派遣").getBigDecimal("jul").compareTo(BigDecimal.ZERO) == 0) {
			pjrgcbpqEntity.set("jul_amount", BigDecimal.ZERO);
		} else {
			pjrgcbpqEntity.set("jul_amount", NumberUtil.div(pqryxcEntity.getBigDecimal("jul_amount"), personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均劳务派遣").getBigDecimal("jul"), 2));
		}
		if (personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均劳务派遣").getBigDecimal("aug").compareTo(BigDecimal.ZERO) == 0) {
			pjrgcbpqEntity.set("aug_amount", BigDecimal.ZERO);
		} else {
			pjrgcbpqEntity.set("aug_amount", NumberUtil.div(pqryxcEntity.getBigDecimal("aug_amount"), personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均劳务派遣").getBigDecimal("aug"), 2));
		}
		if (personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均劳务派遣").getBigDecimal("sep").compareTo(BigDecimal.ZERO) == 0) {
			pjrgcbpqEntity.set("sep_amount", BigDecimal.ZERO);
		} else {
			pjrgcbpqEntity.set("sep_amount", NumberUtil.div(pqryxcEntity.getBigDecimal("sep_amount"), personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均劳务派遣").getBigDecimal("sep"), 2));
		}
		if (personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均劳务派遣").getBigDecimal("oct").compareTo(BigDecimal.ZERO) == 0) {
			pjrgcbpqEntity.set("oct_amount", BigDecimal.ZERO);
		} else {
			pjrgcbpqEntity.set("oct_amount", NumberUtil.div(pqryxcEntity.getBigDecimal("oct_amount"), personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均劳务派遣").getBigDecimal("oct"), 2));
		}
		if (personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均劳务派遣").getBigDecimal("nov").compareTo(BigDecimal.ZERO) == 0) {
			pjrgcbpqEntity.set("nov_amount", BigDecimal.ZERO);
		} else {
			pjrgcbpqEntity.set("nov_amount", NumberUtil.div(pqryxcEntity.getBigDecimal("nov_amount"), personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均劳务派遣").getBigDecimal("nov"), 2));
		}
		if (personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均劳务派遣").getBigDecimal("dec").compareTo(BigDecimal.ZERO) == 0) {
			pjrgcbpqEntity.set("dec_amount", BigDecimal.ZERO);
		} else {
			pjrgcbpqEntity.set("dec_amount", NumberUtil.div(pqryxcEntity.getBigDecimal("dec_amount"), personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均劳务派遣").getBigDecimal("dec"), 2));
		}
		if (personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均劳务派遣").getBigDecimal("average_actual").compareTo(BigDecimal.ZERO) == 0) {
			pjrgcbpqEntity.set("total_amount", BigDecimal.ZERO);
		} else {
			pjrgcbpqEntity.set("total_amount", NumberUtil.div(pqryxcEntity.getBigDecimal("total_amount"), personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均劳务派遣").getBigDecimal("average_actual"), 2));
		}

		// 平均人工成本：合作
		Entity pjrgcbhzEntity = new Entity();
		pjrgcbhzEntity.set("serial_number", "9").set("id", "平均人工成本：合作").set("name", "九、平均人工成本：合作").set("parent", "-1").set("editable", "0");
		if (personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均合作人数").getBigDecimal("jan").compareTo(BigDecimal.ZERO) == 0) {
			pjrgcbhzEntity.set("jan_amount", BigDecimal.ZERO);
		} else {
			pjrgcbhzEntity.set("jan_amount", NumberUtil.div(hzdwfyEntity.getBigDecimal("jan_amount"), personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均合作人数").getBigDecimal("jan"), 2));
		}
		if (personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均合作人数").getBigDecimal("feb").compareTo(BigDecimal.ZERO) == 0) {
			pjrgcbhzEntity.set("feb_amount", BigDecimal.ZERO);
		} else {
			pjrgcbhzEntity.set("feb_amount", NumberUtil.div(hzdwfyEntity.getBigDecimal("feb_amount"), personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均合作人数").getBigDecimal("feb"), 2));
		}
		if (personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均合作人数").getBigDecimal("mar").compareTo(BigDecimal.ZERO) == 0) {
			pjrgcbhzEntity.set("mar_amount", BigDecimal.ZERO);
		} else {
			pjrgcbhzEntity.set("mar_amount", NumberUtil.div(hzdwfyEntity.getBigDecimal("mar_amount"), personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均合作人数").getBigDecimal("mar"), 2));
		}
		if (personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均合作人数").getBigDecimal("apr").compareTo(BigDecimal.ZERO) == 0) {
			pjrgcbhzEntity.set("apr_amount", BigDecimal.ZERO);
		} else {
			pjrgcbhzEntity.set("apr_amount", NumberUtil.div(hzdwfyEntity.getBigDecimal("apr_amount"), personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均合作人数").getBigDecimal("apr"), 2));
		}
		if (personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均合作人数").getBigDecimal("may").compareTo(BigDecimal.ZERO) == 0) {
			pjrgcbhzEntity.set("may_amount", BigDecimal.ZERO);
		} else {
			pjrgcbhzEntity.set("may_amount", NumberUtil.div(hzdwfyEntity.getBigDecimal("may_amount"), personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均合作人数").getBigDecimal("may"), 2));
		}
		if (personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均合作人数").getBigDecimal("jun").compareTo(BigDecimal.ZERO) == 0) {
			pjrgcbhzEntity.set("jun_amount", BigDecimal.ZERO);
		} else {
			pjrgcbhzEntity.set("jun_amount", NumberUtil.div(hzdwfyEntity.getBigDecimal("jun_amount"), personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均合作人数").getBigDecimal("jun"), 2));
		}
		if (personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均合作人数").getBigDecimal("jul").compareTo(BigDecimal.ZERO) == 0) {
			pjrgcbhzEntity.set("jul_amount", BigDecimal.ZERO);
		} else {
			pjrgcbhzEntity.set("jul_amount", NumberUtil.div(hzdwfyEntity.getBigDecimal("jul_amount"), personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均合作人数").getBigDecimal("jul"), 2));
		}
		if (personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均合作人数").getBigDecimal("aug").compareTo(BigDecimal.ZERO) == 0) {
			pjrgcbhzEntity.set("aug_amount", BigDecimal.ZERO);
		} else {
			pjrgcbhzEntity.set("aug_amount", NumberUtil.div(hzdwfyEntity.getBigDecimal("aug_amount"), personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均合作人数").getBigDecimal("aug"), 2));
		}
		if (personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均合作人数").getBigDecimal("sep").compareTo(BigDecimal.ZERO) == 0) {
			pjrgcbhzEntity.set("sep_amount", BigDecimal.ZERO);
		} else {
			pjrgcbhzEntity.set("sep_amount", NumberUtil.div(hzdwfyEntity.getBigDecimal("sep_amount"), personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均合作人数").getBigDecimal("sep"), 2));
		}
		if (personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均合作人数").getBigDecimal("oct").compareTo(BigDecimal.ZERO) == 0) {
			pjrgcbhzEntity.set("oct_amount", BigDecimal.ZERO);
		} else {
			pjrgcbhzEntity.set("oct_amount", NumberUtil.div(hzdwfyEntity.getBigDecimal("oct_amount"), personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均合作人数").getBigDecimal("oct"), 2));
		}
		if (personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均合作人数").getBigDecimal("nov").compareTo(BigDecimal.ZERO) == 0) {
			pjrgcbhzEntity.set("nov_amount", BigDecimal.ZERO);
		} else {
			pjrgcbhzEntity.set("nov_amount", NumberUtil.div(hzdwfyEntity.getBigDecimal("nov_amount"), personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均合作人数").getBigDecimal("nov"), 2));
		}
		if (personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均合作人数").getBigDecimal("dec").compareTo(BigDecimal.ZERO) == 0) {
			pjrgcbhzEntity.set("dec_amount", BigDecimal.ZERO);
		} else {
			pjrgcbhzEntity.set("dec_amount", NumberUtil.div(hzdwfyEntity.getBigDecimal("dec_amount"), personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均合作人数").getBigDecimal("dec"), 2));
		}
		if (personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均合作人数").getBigDecimal("average_actual").compareTo(BigDecimal.ZERO) == 0) {
			pjrgcbhzEntity.set("total_amount", BigDecimal.ZERO);
		} else {
			pjrgcbhzEntity.set("total_amount", NumberUtil.div(hzdwfyEntity.getBigDecimal("total_amount"), personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均合作人数").getBigDecimal("average_actual"), 2));
		}

		// 平均人工成本：海工爆破
		Entity pjrgcbhgbpEntity = new Entity();
		pjrgcbhgbpEntity.set("serial_number", "10").set("id", "平均人工成本：海工爆破").set("name", "十、平均人工成本：海工爆破").set("parent", "-1").set("editable", "0");
		if (personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均海工爆破").getBigDecimal("jan").compareTo(BigDecimal.ZERO) == 0) {
			pjrgcbhgbpEntity.set("jan_amount", BigDecimal.ZERO);
		} else {
			pjrgcbhgbpEntity.set("jan_amount", NumberUtil.div(hgbpdhzfyEntity.getBigDecimal("jan_amount"), personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均海工爆破").getBigDecimal("jan"), 2));
		}
		if (personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均海工爆破").getBigDecimal("feb").compareTo(BigDecimal.ZERO) == 0) {
			pjrgcbhgbpEntity.set("feb_amount", BigDecimal.ZERO);
		} else {
			pjrgcbhgbpEntity.set("feb_amount", NumberUtil.div(hgbpdhzfyEntity.getBigDecimal("feb_amount"), personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均海工爆破").getBigDecimal("feb"), 2));
		}
		if (personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均海工爆破").getBigDecimal("mar").compareTo(BigDecimal.ZERO) == 0) {
			pjrgcbhgbpEntity.set("mar_amount", BigDecimal.ZERO);
		} else {
			pjrgcbhgbpEntity.set("mar_amount", NumberUtil.div(hgbpdhzfyEntity.getBigDecimal("mar_amount"), personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均海工爆破").getBigDecimal("mar"), 2));
		}
		if (personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均海工爆破").getBigDecimal("apr").compareTo(BigDecimal.ZERO) == 0) {
			pjrgcbhgbpEntity.set("apr_amount", BigDecimal.ZERO);
		} else {
			pjrgcbhgbpEntity.set("apr_amount", NumberUtil.div(hgbpdhzfyEntity.getBigDecimal("apr_amount"), personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均海工爆破").getBigDecimal("apr"), 2));
		}
		if (personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均海工爆破").getBigDecimal("may").compareTo(BigDecimal.ZERO) == 0) {
			pjrgcbhgbpEntity.set("may_amount", BigDecimal.ZERO);
		} else {
			pjrgcbhgbpEntity.set("may_amount", NumberUtil.div(hgbpdhzfyEntity.getBigDecimal("may_amount"), personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均海工爆破").getBigDecimal("may"), 2));
		}
		if (personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均海工爆破").getBigDecimal("jun").compareTo(BigDecimal.ZERO) == 0) {
			pjrgcbhgbpEntity.set("jun_amount", BigDecimal.ZERO);
		} else {
			pjrgcbhgbpEntity.set("jun_amount", NumberUtil.div(hgbpdhzfyEntity.getBigDecimal("jun_amount"), personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均海工爆破").getBigDecimal("jun"), 2));
		}
		if (personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均海工爆破").getBigDecimal("jul").compareTo(BigDecimal.ZERO) == 0) {
			pjrgcbhgbpEntity.set("jul_amount", BigDecimal.ZERO);
		} else {
			pjrgcbhgbpEntity.set("jul_amount", NumberUtil.div(hgbpdhzfyEntity.getBigDecimal("jul_amount"), personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均海工爆破").getBigDecimal("jul"), 2));
		}
		if (personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均海工爆破").getBigDecimal("aug").compareTo(BigDecimal.ZERO) == 0) {
			pjrgcbhgbpEntity.set("aug_amount", BigDecimal.ZERO);
		} else {
			pjrgcbhgbpEntity.set("aug_amount", NumberUtil.div(hgbpdhzfyEntity.getBigDecimal("aug_amount"), personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均海工爆破").getBigDecimal("aug"), 2));
		}
		if (personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均海工爆破").getBigDecimal("sep").compareTo(BigDecimal.ZERO) == 0) {
			pjrgcbhgbpEntity.set("sep_amount", BigDecimal.ZERO);
		} else {
			pjrgcbhgbpEntity.set("sep_amount", NumberUtil.div(hgbpdhzfyEntity.getBigDecimal("sep_amount"), personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均海工爆破").getBigDecimal("sep"), 2));
		}
		if (personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均海工爆破").getBigDecimal("oct").compareTo(BigDecimal.ZERO) == 0) {
			pjrgcbhgbpEntity.set("oct_amount", BigDecimal.ZERO);
		} else {
			pjrgcbhgbpEntity.set("oct_amount", NumberUtil.div(hgbpdhzfyEntity.getBigDecimal("oct_amount"), personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均海工爆破").getBigDecimal("oct"), 2));
		}
		if (personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均海工爆破").getBigDecimal("nov").compareTo(BigDecimal.ZERO) == 0) {
			pjrgcbhgbpEntity.set("nov_amount", BigDecimal.ZERO);
		} else {
			pjrgcbhgbpEntity.set("nov_amount", NumberUtil.div(hgbpdhzfyEntity.getBigDecimal("nov_amount"), personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均海工爆破").getBigDecimal("nov"), 2));
		}
		if (personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均海工爆破").getBigDecimal("dec").compareTo(BigDecimal.ZERO) == 0) {
			pjrgcbhgbpEntity.set("dec_amount", BigDecimal.ZERO);
		} else {
			pjrgcbhgbpEntity.set("dec_amount", NumberUtil.div(hgbpdhzfyEntity.getBigDecimal("dec_amount"), personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均海工爆破").getBigDecimal("dec"), 2));
		}
		if (personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均海工爆破").getBigDecimal("average_actual").compareTo(BigDecimal.ZERO) == 0) {
			pjrgcbhgbpEntity.set("total_amount", BigDecimal.ZERO);
		} else {
			pjrgcbhgbpEntity.set("total_amount",
					NumberUtil.div(hgbpdhzfyEntity.getBigDecimal("total_amount"), personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均海工爆破").getBigDecimal("average_actual"), 2));
		}

		fullApertureList.add(zzryrgcbEntity);
		fullApertureList.add(zzzehyfEntity);
		fullApertureList.add(flfEntity);
		fullApertureList.add(shbxhyfEntity);
		fullApertureList.add(qynjEntity);
		fullApertureList.add(bcylEntity);
		fullApertureList.add(ywshbxEntity);
		fullApertureList.add(zfgjjEntity);
		fullApertureList.add(ghjfEntity);
		fullApertureList.add(zgjyjfEntity);
		fullApertureList.add(txfpsxryfyEntity);
		fullApertureList.add(cbjEntity);
		fullApertureList.add(pqryxcEntity);
		fullApertureList.add(hzdwfyEntity);
		fullApertureList.add(hgbpdhzfyEntity);
		fullApertureList.add(pjrgcbzzEntity);
		fullApertureList.add(pjrgcbtxfpEntity);
		fullApertureList.add(pjrgcbpqEntity);
		fullApertureList.add(pjrgcbhzEntity);
		fullApertureList.add(pjrgcbhgbpEntity);

		return fullApertureList;
	}

	// 报表劳动生产率部分数据构建
	private List<Entity> buildLaborProductivity(List<Entity> financialStatements, List<Entity> fullAperture, List<Entity> personnelAndPerCapitaSituation, Session dbSession, String budgetMainId)
			throws Exception {
		List<Entity> laborProductivityList = new ArrayList<Entity>();
		Map<String, Entity> financialStatementsMap = financialStatements.stream().collect(
				Collectors.toMap(entity -> entity.getStr("parent") + "_" + entity.getStr("name"), Function.identity(), (existing, replacement) -> existing));
		Map<String, Entity> fullApertureMap = fullAperture.stream().collect(
				Collectors.toMap(entity -> entity.getStr("parent") + "_" + entity.getStr("name"), Function.identity(), (existing, replacement) -> existing));
		Map<String, Entity> personnelAndPerCapitaSituationMap = personnelAndPerCapitaSituation.stream().collect(
				Collectors.toMap(entity -> entity.getStr("parent") + "_" + entity.getStr("name"), Function.identity(), (existing, replacement) -> existing));

		// 折旧
		Entity zjEntity = new Entity();
		zjEntity.set("serial_number", "2.1").set("id", "折旧").set("name", "折旧").set("parent", "劳动生产总值（增加值）").set("editable", "0")
				.set("jan_amount", NumberUtil.add(financialStatementsMap.get("生产运营-费用_折旧").getBigDecimal("jan_amount"), financialStatementsMap.get("生产运营-成本_折旧").getBigDecimal("jan_amount")))
				.set("feb_amount", NumberUtil.add(financialStatementsMap.get("生产运营-费用_折旧").getBigDecimal("feb_amount"), financialStatementsMap.get("生产运营-成本_折旧").getBigDecimal("feb_amount")))
				.set("mar_amount", NumberUtil.add(financialStatementsMap.get("生产运营-费用_折旧").getBigDecimal("mar_amount"), financialStatementsMap.get("生产运营-成本_折旧").getBigDecimal("mar_amount")))
				.set("apr_amount", NumberUtil.add(financialStatementsMap.get("生产运营-费用_折旧").getBigDecimal("apr_amount"), financialStatementsMap.get("生产运营-成本_折旧").getBigDecimal("apr_amount")))
				.set("may_amount", NumberUtil.add(financialStatementsMap.get("生产运营-费用_折旧").getBigDecimal("may_amount"), financialStatementsMap.get("生产运营-成本_折旧").getBigDecimal("may_amount")))
				.set("jun_amount", NumberUtil.add(financialStatementsMap.get("生产运营-费用_折旧").getBigDecimal("jun_amount"), financialStatementsMap.get("生产运营-成本_折旧").getBigDecimal("jun_amount")))
				.set("jul_amount", NumberUtil.add(financialStatementsMap.get("生产运营-费用_折旧").getBigDecimal("jul_amount"), financialStatementsMap.get("生产运营-成本_折旧").getBigDecimal("jul_amount")))
				.set("aug_amount", NumberUtil.add(financialStatementsMap.get("生产运营-费用_折旧").getBigDecimal("aug_amount"), financialStatementsMap.get("生产运营-成本_折旧").getBigDecimal("aug_amount")))
				.set("sep_amount", NumberUtil.add(financialStatementsMap.get("生产运营-费用_折旧").getBigDecimal("sep_amount"), financialStatementsMap.get("生产运营-成本_折旧").getBigDecimal("sep_amount")))
				.set("oct_amount", NumberUtil.add(financialStatementsMap.get("生产运营-费用_折旧").getBigDecimal("oct_amount"), financialStatementsMap.get("生产运营-成本_折旧").getBigDecimal("oct_amount")))
				.set("nov_amount", NumberUtil.add(financialStatementsMap.get("生产运营-费用_折旧").getBigDecimal("nov_amount"), financialStatementsMap.get("生产运营-成本_折旧").getBigDecimal("nov_amount")))
				.set("dec_amount", NumberUtil.add(financialStatementsMap.get("生产运营-费用_折旧").getBigDecimal("dec_amount"), financialStatementsMap.get("生产运营-成本_折旧").getBigDecimal("dec_amount")))
				.set("total_amount", NumberUtil.add(financialStatementsMap.get("生产运营-费用_折旧").getBigDecimal("total_amount"), financialStatementsMap.get("生产运营-成本_折旧").getBigDecimal("total_amount")));

		// 劳动者报酬
		Entity ldzbcEntity = new Entity();
		ldzbcEntity
				.set("serial_number", "2.2")
				.set("id", "劳动者报酬")
				.set("name", "劳动者报酬")
				.set("parent", "劳动生产总值（增加值）")
				.set("editable", "0")
				.set("jan_amount",
						NumberUtil.add(fullApertureMap.get("-1_一、在职人员人工成本").getBigDecimal("jan_amount"), fullApertureMap.get("-1_二、退休返聘实习人员费用").getBigDecimal("jan_amount"),
								fullApertureMap.get("-1_三、派遣人员薪酬").getBigDecimal("jan_amount")))
				.set("feb_amount",
						NumberUtil.add(fullApertureMap.get("-1_一、在职人员人工成本").getBigDecimal("feb_amount"), fullApertureMap.get("-1_二、退休返聘实习人员费用").getBigDecimal("feb_amount"),
								fullApertureMap.get("-1_三、派遣人员薪酬").getBigDecimal("feb_amount")))
				.set("mar_amount",
						NumberUtil.add(fullApertureMap.get("-1_一、在职人员人工成本").getBigDecimal("mar_amount"), fullApertureMap.get("-1_二、退休返聘实习人员费用").getBigDecimal("mar_amount"),
								fullApertureMap.get("-1_三、派遣人员薪酬").getBigDecimal("mar_amount")))
				.set("apr_amount",
						NumberUtil.add(fullApertureMap.get("-1_一、在职人员人工成本").getBigDecimal("apr_amount"), fullApertureMap.get("-1_二、退休返聘实习人员费用").getBigDecimal("apr_amount"),
								fullApertureMap.get("-1_三、派遣人员薪酬").getBigDecimal("apr_amount")))
				.set("may_amount",
						NumberUtil.add(fullApertureMap.get("-1_一、在职人员人工成本").getBigDecimal("may_amount"), fullApertureMap.get("-1_二、退休返聘实习人员费用").getBigDecimal("may_amount"),
								fullApertureMap.get("-1_三、派遣人员薪酬").getBigDecimal("may_amount")))
				.set("jun_amount",
						NumberUtil.add(fullApertureMap.get("-1_一、在职人员人工成本").getBigDecimal("jun_amount"), fullApertureMap.get("-1_二、退休返聘实习人员费用").getBigDecimal("jun_amount"),
								fullApertureMap.get("-1_三、派遣人员薪酬").getBigDecimal("jun_amount")))
				.set("jul_amount",
						NumberUtil.add(fullApertureMap.get("-1_一、在职人员人工成本").getBigDecimal("jul_amount"), fullApertureMap.get("-1_二、退休返聘实习人员费用").getBigDecimal("jul_amount"),
								fullApertureMap.get("-1_三、派遣人员薪酬").getBigDecimal("jul_amount")))
				.set("aug_amount",
						NumberUtil.add(fullApertureMap.get("-1_一、在职人员人工成本").getBigDecimal("aug_amount"), fullApertureMap.get("-1_二、退休返聘实习人员费用").getBigDecimal("aug_amount"),
								fullApertureMap.get("-1_三、派遣人员薪酬").getBigDecimal("aug_amount")))
				.set("sep_amount",
						NumberUtil.add(fullApertureMap.get("-1_一、在职人员人工成本").getBigDecimal("sep_amount"), fullApertureMap.get("-1_二、退休返聘实习人员费用").getBigDecimal("sep_amount"),
								fullApertureMap.get("-1_三、派遣人员薪酬").getBigDecimal("sep_amount")))
				.set("oct_amount",
						NumberUtil.add(fullApertureMap.get("-1_一、在职人员人工成本").getBigDecimal("oct_amount"), fullApertureMap.get("-1_二、退休返聘实习人员费用").getBigDecimal("oct_amount"),
								fullApertureMap.get("-1_三、派遣人员薪酬").getBigDecimal("oct_amount")))
				.set("nov_amount",
						NumberUtil.add(fullApertureMap.get("-1_一、在职人员人工成本").getBigDecimal("nov_amount"), fullApertureMap.get("-1_二、退休返聘实习人员费用").getBigDecimal("nov_amount"),
								fullApertureMap.get("-1_三、派遣人员薪酬").getBigDecimal("nov_amount")))
				.set("dec_amount",
						NumberUtil.add(fullApertureMap.get("-1_一、在职人员人工成本").getBigDecimal("dec_amount"), fullApertureMap.get("-1_二、退休返聘实习人员费用").getBigDecimal("dec_amount"),
								fullApertureMap.get("-1_三、派遣人员薪酬").getBigDecimal("dec_amount")))
				.set("total_amount",
						NumberUtil.add(fullApertureMap.get("-1_一、在职人员人工成本").getBigDecimal("total_amount"), fullApertureMap.get("-1_二、退休返聘实习人员费用").getBigDecimal("total_amount"),
								fullApertureMap.get("-1_三、派遣人员薪酬").getBigDecimal("total_amount")));

		// 盈余
		Entity yyEntity = new Entity();
		yyEntity.set("serial_number", "2.3").set("id", "盈余").set("name", "盈余").set("parent", "劳动生产总值（增加值）").set("editable", "0")
				.set("jan_amount", financialStatementsMap.get("-1_六、利润总额").getBigDecimal("jan_amount")).set("feb_amount", financialStatementsMap.get("-1_六、利润总额").getBigDecimal("feb_amount"))
				.set("mar_amount", financialStatementsMap.get("-1_六、利润总额").getBigDecimal("mar_amount")).set("apr_amount", financialStatementsMap.get("-1_六、利润总额").getBigDecimal("apr_amount"))
				.set("may_amount", financialStatementsMap.get("-1_六、利润总额").getBigDecimal("may_amount")).set("jun_amount", financialStatementsMap.get("-1_六、利润总额").getBigDecimal("jun_amount"))
				.set("jul_amount", financialStatementsMap.get("-1_六、利润总额").getBigDecimal("jul_amount")).set("aug_amount", financialStatementsMap.get("-1_六、利润总额").getBigDecimal("aug_amount"))
				.set("sep_amount", financialStatementsMap.get("-1_六、利润总额").getBigDecimal("sep_amount")).set("oct_amount", financialStatementsMap.get("-1_六、利润总额").getBigDecimal("oct_amount"))
				.set("nov_amount", financialStatementsMap.get("-1_六、利润总额").getBigDecimal("nov_amount")).set("dec_amount", financialStatementsMap.get("-1_六、利润总额").getBigDecimal("dec_amount"))
				.set("total_amount", financialStatementsMap.get("-1_六、利润总额").getBigDecimal("total_amount"));

		// 生产税净额
		String queryScsjeSql = "SELECT *, labor_name AS name, '劳动生产总值（增加值）' AS parent, '1' AS editable FROM zh_caiwu_budget_filling_productivity WHERE budget_main_id = ? AND labor_name = '生产税净额'";
		Entity scsjeEntity = dbSession.queryOne(queryScsjeSql, budgetMainId);
		scsjeEntity.set("serial_number", "2.4");

		// 劳动生产总值（增加值）
		Entity ldsczzEntity = new Entity();
		ldsczzEntity
				.set("serial_number", "2")
				.set("id", "劳动生产总值（增加值）")
				.set("name", "二、劳动生产总值（增加值）")
				.set("parent", "-1")
				.set("editable", "0")
				.set("jan_amount",
						NumberUtil.add(zjEntity.getBigDecimal("jan_amount"), ldzbcEntity.getBigDecimal("jan_amount"), yyEntity.getBigDecimal("jan_amount"), scsjeEntity.getBigDecimal("jan_amount")))
				.set("feb_amount",
						NumberUtil.add(zjEntity.getBigDecimal("feb_amount"), ldzbcEntity.getBigDecimal("feb_amount"), yyEntity.getBigDecimal("feb_amount"), scsjeEntity.getBigDecimal("feb_amount")))
				.set("mar_amount",
						NumberUtil.add(zjEntity.getBigDecimal("jan_amount"), ldzbcEntity.getBigDecimal("mar_amount"), yyEntity.getBigDecimal("mar_amount"), scsjeEntity.getBigDecimal("mar_amount")))
				.set("apr_amount",
						NumberUtil.add(zjEntity.getBigDecimal("apr_amount"), ldzbcEntity.getBigDecimal("apr_amount"), yyEntity.getBigDecimal("apr_amount"), scsjeEntity.getBigDecimal("apr_amount")))
				.set("may_amount",
						NumberUtil.add(zjEntity.getBigDecimal("jan_amount"), ldzbcEntity.getBigDecimal("may_amount"), yyEntity.getBigDecimal("jan_amount"), scsjeEntity.getBigDecimal("may_amount")))
				.set("jun_amount",
						NumberUtil.add(zjEntity.getBigDecimal("jun_amount"), ldzbcEntity.getBigDecimal("jun_amount"), yyEntity.getBigDecimal("jun_amount"), scsjeEntity.getBigDecimal("jun_amount")))
				.set("jul_amount",
						NumberUtil.add(zjEntity.getBigDecimal("jul_amount"), ldzbcEntity.getBigDecimal("jul_amount"), yyEntity.getBigDecimal("jul_amount"), scsjeEntity.getBigDecimal("jul_amount")))
				.set("aug_amount",
						NumberUtil.add(zjEntity.getBigDecimal("aug_amount"), ldzbcEntity.getBigDecimal("aug_amount"), yyEntity.getBigDecimal("aug_amount"), scsjeEntity.getBigDecimal("aug_amount")))
				.set("sep_amount",
						NumberUtil.add(zjEntity.getBigDecimal("sep_amount"), ldzbcEntity.getBigDecimal("sep_amount"), yyEntity.getBigDecimal("sep_amount"), scsjeEntity.getBigDecimal("sep_amount")))
				.set("oct_amount",
						NumberUtil.add(zjEntity.getBigDecimal("oct_amount"), ldzbcEntity.getBigDecimal("oct_amount"), yyEntity.getBigDecimal("oct_amount"), scsjeEntity.getBigDecimal("oct_amount")))
				.set("nov_amount",
						NumberUtil.add(zjEntity.getBigDecimal("nov_amount"), ldzbcEntity.getBigDecimal("nov_amount"), yyEntity.getBigDecimal("nov_amount"), scsjeEntity.getBigDecimal("nov_amount")))
				.set("dec_amount",
						NumberUtil.add(zjEntity.getBigDecimal("dec_amount"), ldzbcEntity.getBigDecimal("dec_amount"), yyEntity.getBigDecimal("dec_amount"), scsjeEntity.getBigDecimal("dec_amount")))
				.set("total_amount",
						NumberUtil.add(zjEntity.getBigDecimal("total_amount"), ldzbcEntity.getBigDecimal("total_amount"), yyEntity.getBigDecimal("total_amount"),
								scsjeEntity.getBigDecimal("total_amount")));

		// 公司生产税净额总数
		String queryGsscsjezsSql = "SELECT *, labor_name AS name, '生产税净额' AS parent, '1' AS editable FROM zh_caiwu_budget_filling_productivity WHERE budget_main_id = ? AND labor_name = '公司生产税净额总数'";
		Entity gsscsjezsEntity = dbSession.queryOne(queryGsscsjezsSql, budgetMainId);
		gsscsjezsEntity.set("serial_number", "2.4.1");
		gsscsjezsEntity.set("parent", scsjeEntity.getStr("id"));

		// 收入占比
		Entity srzbEntity = new Entity();
		srzbEntity.set("serial_number", "2.4.2").set("id", "收入占比").set("name", "收入占比").set("parent", scsjeEntity.getStr("id")).set("editable", "0").set("jan_amount", BigDecimal.ZERO)
				.set("feb_amount", BigDecimal.ZERO).set("mar_amount", BigDecimal.ZERO).set("apr_amount", BigDecimal.ZERO).set("may_amount", BigDecimal.ZERO).set("jun_amount", BigDecimal.ZERO)
				.set("jul_amount", BigDecimal.ZERO).set("aug_amount", BigDecimal.ZERO).set("sep_amount", BigDecimal.ZERO).set("oct_amount", BigDecimal.ZERO).set("nov_amount", BigDecimal.ZERO)
				.set("dec_amount", BigDecimal.ZERO).set("total_amount", BigDecimal.ZERO);
		if (financialStatementsMap.get("-1_一、总收入").getBigDecimal("total_amount").compareTo(BigDecimal.ZERO) != 0) {
			srzbEntity.set("jan_amount", NumberUtil.div(financialStatementsMap.get("-1_一、总收入").getBigDecimal("jan_amount"), financialStatementsMap.get("-1_一、总收入").getBigDecimal("total_amount"), 2))
					.set("feb_amount", NumberUtil.div(financialStatementsMap.get("-1_一、总收入").getBigDecimal("feb_amount"), financialStatementsMap.get("-1_一、总收入").getBigDecimal("total_amount"), 2))
					.set("mar_amount", NumberUtil.div(financialStatementsMap.get("-1_一、总收入").getBigDecimal("mar_amount"), financialStatementsMap.get("-1_一、总收入").getBigDecimal("total_amount"), 2))
					.set("apr_amount", NumberUtil.div(financialStatementsMap.get("-1_一、总收入").getBigDecimal("apr_amount"), financialStatementsMap.get("-1_一、总收入").getBigDecimal("total_amount"), 2))
					.set("may_amount", NumberUtil.div(financialStatementsMap.get("-1_一、总收入").getBigDecimal("may_amount"), financialStatementsMap.get("-1_一、总收入").getBigDecimal("total_amount"), 2))
					.set("jun_amount", NumberUtil.div(financialStatementsMap.get("-1_一、总收入").getBigDecimal("jun_amount"), financialStatementsMap.get("-1_一、总收入").getBigDecimal("total_amount"), 2))
					.set("jul_amount", NumberUtil.div(financialStatementsMap.get("-1_一、总收入").getBigDecimal("jul_amount"), financialStatementsMap.get("-1_一、总收入").getBigDecimal("total_amount"), 2))
					.set("aug_amount", NumberUtil.div(financialStatementsMap.get("-1_一、总收入").getBigDecimal("aug_amount"), financialStatementsMap.get("-1_一、总收入").getBigDecimal("total_amount"), 2))
					.set("sep_amount", NumberUtil.div(financialStatementsMap.get("-1_一、总收入").getBigDecimal("sep_amount"), financialStatementsMap.get("-1_一、总收入").getBigDecimal("total_amount"), 2))
					.set("oct_amount", NumberUtil.div(financialStatementsMap.get("-1_一、总收入").getBigDecimal("oct_amount"), financialStatementsMap.get("-1_一、总收入").getBigDecimal("total_amount"), 2))
					.set("nov_amount", NumberUtil.div(financialStatementsMap.get("-1_一、总收入").getBigDecimal("nov_amount"), financialStatementsMap.get("-1_一、总收入").getBigDecimal("total_amount"), 2))
					.set("dec_amount", NumberUtil.div(financialStatementsMap.get("-1_一、总收入").getBigDecimal("dec_amount"), financialStatementsMap.get("-1_一、总收入").getBigDecimal("total_amount"), 2))
					.set("total_amount", NumberUtil.div(financialStatementsMap.get("-1_一、总收入").getBigDecimal("total_amount"), financialStatementsMap.get("-1_一、总收入").getBigDecimal("total_amount"), 2));
		}

		// 平均从业人员人数
		Entity pjryryrsEntity = new Entity();
		pjryryrsEntity.set("serial_number", "3").set("id", "平均从业人员人数").set("name", "三、平均从业人员人数").set("parent", "-1").set("editable", "0")
				.set("jan_amount", personnelAndPerCapitaSituationMap.get("-1_一、平均从业人员人数").getBigDecimal("jan"))
				.set("feb_amount", personnelAndPerCapitaSituationMap.get("-1_一、平均从业人员人数").getBigDecimal("feb"))
				.set("mar_amount", personnelAndPerCapitaSituationMap.get("-1_一、平均从业人员人数").getBigDecimal("mar"))
				.set("apr_amount", personnelAndPerCapitaSituationMap.get("-1_一、平均从业人员人数").getBigDecimal("apr"))
				.set("may_amount", personnelAndPerCapitaSituationMap.get("-1_一、平均从业人员人数").getBigDecimal("may"))
				.set("jun_amount", personnelAndPerCapitaSituationMap.get("-1_一、平均从业人员人数").getBigDecimal("jun"))
				.set("jul_amount", personnelAndPerCapitaSituationMap.get("-1_一、平均从业人员人数").getBigDecimal("jul"))
				.set("aug_amount", personnelAndPerCapitaSituationMap.get("-1_一、平均从业人员人数").getBigDecimal("aug"))
				.set("sep_amount", personnelAndPerCapitaSituationMap.get("-1_一、平均从业人员人数").getBigDecimal("sep"))
				.set("oct_amount", personnelAndPerCapitaSituationMap.get("-1_一、平均从业人员人数").getBigDecimal("oct"))
				.set("nov_amount", personnelAndPerCapitaSituationMap.get("-1_一、平均从业人员人数").getBigDecimal("nov"))
				.set("dec_amount", personnelAndPerCapitaSituationMap.get("-1_一、平均从业人员人数").getBigDecimal("dec"))
				.set("total_amount", personnelAndPerCapitaSituationMap.get("-1_一、平均从业人员人数").getBigDecimal("average_actual"));

		// 劳动生产率
		Entity ldsclEntity = new Entity();
		ldsclEntity.set("serial_number", "1").set("id", "劳动生产率").set("name", "一、劳动生产率").set("parent", "-1").set("editable", "0");
		if (pjryryrsEntity.getBigDecimal("jan_amount").compareTo(BigDecimal.ZERO) == 0) {
			ldsclEntity.set("jan_amount", BigDecimal.ZERO);
		} else {
			ldsclEntity.set("jan_amount", NumberUtil.div(ldsczzEntity.getBigDecimal("jan_amount"), pjryryrsEntity.getBigDecimal("jan_amount"), 2));
		}
		if (pjryryrsEntity.getBigDecimal("feb_amount").compareTo(BigDecimal.ZERO) == 0) {
			ldsclEntity.set("feb_amount", BigDecimal.ZERO);
		} else {
			ldsclEntity.set("feb_amount", NumberUtil.div(ldsczzEntity.getBigDecimal("feb_amount"), pjryryrsEntity.getBigDecimal("feb_amount"), 2));
		}
		if (pjryryrsEntity.getBigDecimal("mar_amount").compareTo(BigDecimal.ZERO) == 0) {
			ldsclEntity.set("mar_amount", BigDecimal.ZERO);
		} else {
			ldsclEntity.set("mar_amount", NumberUtil.div(ldsczzEntity.getBigDecimal("mar_amount"), pjryryrsEntity.getBigDecimal("mar_amount"), 2));
		}
		if (pjryryrsEntity.getBigDecimal("apr_amount").compareTo(BigDecimal.ZERO) == 0) {
			ldsclEntity.set("apr_amount", BigDecimal.ZERO);
		} else {
			ldsclEntity.set("apr_amount", NumberUtil.div(ldsczzEntity.getBigDecimal("apr_amount"), pjryryrsEntity.getBigDecimal("apr_amount"), 2));
		}
		if (pjryryrsEntity.getBigDecimal("may_amount").compareTo(BigDecimal.ZERO) == 0) {
			ldsclEntity.set("may_amount", BigDecimal.ZERO);
		} else {
			ldsclEntity.set("may_amount", NumberUtil.div(ldsczzEntity.getBigDecimal("may_amount"), pjryryrsEntity.getBigDecimal("may_amount"), 2));
		}
		if (pjryryrsEntity.getBigDecimal("jun_amount").compareTo(BigDecimal.ZERO) == 0) {
			ldsclEntity.set("jun_amount", BigDecimal.ZERO);
		} else {
			ldsclEntity.set("jun_amount", NumberUtil.div(ldsczzEntity.getBigDecimal("jun_amount"), pjryryrsEntity.getBigDecimal("jun_amount"), 2));
		}
		if (pjryryrsEntity.getBigDecimal("jul_amount").compareTo(BigDecimal.ZERO) == 0) {
			ldsclEntity.set("jul_amount", BigDecimal.ZERO);
		} else {
			ldsclEntity.set("jul_amount", NumberUtil.div(ldsczzEntity.getBigDecimal("jul_amount"), pjryryrsEntity.getBigDecimal("jul_amount"), 2));
		}
		if (pjryryrsEntity.getBigDecimal("aug_amount").compareTo(BigDecimal.ZERO) == 0) {
			ldsclEntity.set("aug_amount", BigDecimal.ZERO);
		} else {
			ldsclEntity.set("aug_amount", NumberUtil.div(ldsczzEntity.getBigDecimal("aug_amount"), pjryryrsEntity.getBigDecimal("aug_amount"), 2));
		}
		if (pjryryrsEntity.getBigDecimal("sep_amount").compareTo(BigDecimal.ZERO) == 0) {
			ldsclEntity.set("sep_amount", BigDecimal.ZERO);
		} else {
			ldsclEntity.set("sep_amount", NumberUtil.div(ldsczzEntity.getBigDecimal("sep_amount"), pjryryrsEntity.getBigDecimal("sep_amount"), 2));
		}
		if (pjryryrsEntity.getBigDecimal("oct_amount").compareTo(BigDecimal.ZERO) == 0) {
			ldsclEntity.set("oct_amount", BigDecimal.ZERO);
		} else {
			ldsclEntity.set("oct_amount", NumberUtil.div(ldsczzEntity.getBigDecimal("oct_amount"), pjryryrsEntity.getBigDecimal("oct_amount"), 2));
		}
		if (pjryryrsEntity.getBigDecimal("nov_amount").compareTo(BigDecimal.ZERO) == 0) {
			ldsclEntity.set("nov_amount", BigDecimal.ZERO);
		} else {
			ldsclEntity.set("nov_amount", NumberUtil.div(ldsczzEntity.getBigDecimal("nov_amount"), pjryryrsEntity.getBigDecimal("nov_amount"), 2));
		}
		if (pjryryrsEntity.getBigDecimal("dec_amount").compareTo(BigDecimal.ZERO) == 0) {
			ldsclEntity.set("dec_amount", BigDecimal.ZERO);
		} else {
			ldsclEntity.set("dec_amount", NumberUtil.div(ldsczzEntity.getBigDecimal("dec_amount"), pjryryrsEntity.getBigDecimal("dec_amount"), 2));
		}
		if (pjryryrsEntity.getBigDecimal("total_amount").compareTo(BigDecimal.ZERO) == 0) {
			ldsclEntity.set("total_amount", BigDecimal.ZERO);
		} else {
			ldsclEntity.set("total_amount", NumberUtil.div(ldsczzEntity.getBigDecimal("total_amount"), pjryryrsEntity.getBigDecimal("total_amount"), 2));
		}

		laborProductivityList.add(ldsclEntity);
		laborProductivityList.add(ldsczzEntity);
		laborProductivityList.add(zjEntity);
		laborProductivityList.add(ldzbcEntity);
		laborProductivityList.add(yyEntity);
		laborProductivityList.add(scsjeEntity);
		laborProductivityList.add(gsscsjezsEntity);
		laborProductivityList.add(srzbEntity);
		laborProductivityList.add(pjryryrsEntity);

		return laborProductivityList;
	}
}
