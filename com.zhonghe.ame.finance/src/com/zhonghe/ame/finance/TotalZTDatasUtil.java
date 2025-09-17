package com.zhonghe.ame.finance;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;
import java.util.function.Function;
import java.util.stream.Collectors;

import cn.hutool.core.util.NumberUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.db.Entity;
import cn.hutool.db.Session;

import com.eos.common.connection.DataSourceHelper;
import com.eos.system.annotation.Bizlet;

@Bizlet("合计 - 主体 工具类")
public class TotalZTDatasUtil {

	@Bizlet("合计 - 主体 数据")
	public HashMap<String, List<Entity>> getTotalZTDatas(String budgetYear) throws Exception {
		HashMap<String, List<Entity>> result = new HashMap<String, List<Entity>>();
		Session dbSession = new Session(DataSourceHelper.getDataSource());
		List<Entity> columnList = this.buildGridColumns(dbSession, false);
		List<Entity> ryjrjqkColumnList = this.buildGridColumns(dbSession, true);
		result.put("column", columnList);
		result.put("ryjrjqkColumn", ryjrjqkColumnList);

		String querySql = "SELECT zcbfm.id, zcba.code FROM zh_caiwu_budget_filling_main AS zcbfm, zh_caiwu_budget_account AS zcba WHERE zcbfm.budget_year = ? AND zcbfm.budget_account_id = zcba.id ORDER BY zcba.sorting ASC";
		List<Entity> budgetFillingMainList = dbSession.query(querySql, budgetYear);
		if (budgetFillingMainList != null && budgetFillingMainList.size() > 0) {
			List<Entity> financialStatements = new ArrayList<Entity>();
			String budgetMainIds = budgetFillingMainList.stream().map(budgetFillingMain -> "'" + budgetFillingMain.getStr("id") + "'").collect(Collectors.joining(","));
			Map<String, String> budgetIdCodeMap = budgetFillingMainList.stream().collect(Collectors.toMap(entity -> entity.getStr("id"), entity -> entity.getStr("code")));

			List<Entity> totalRevenueList = this.buildFillingIncome(dbSession, budgetIdCodeMap, budgetMainIds);
			List<Entity> totalCostList = this.buildFillingLedger(dbSession, budgetIdCodeMap, budgetMainIds);
			Entity grossProfitMargin = this.buildGrossProfitMargin(totalRevenueList, budgetIdCodeMap, totalCostList);
			List<Entity> apportionmentAndOtherList = this.buildApportionmentAndOther(dbSession, budgetIdCodeMap, budgetMainIds, totalCostList);
			Entity totalProfit = this.buildTotalProfit(grossProfitMargin, apportionmentAndOtherList, budgetIdCodeMap);
			financialStatements.addAll(totalRevenueList);
			financialStatements.addAll(totalCostList);
			financialStatements.add(grossProfitMargin);
			financialStatements.addAll(apportionmentAndOtherList);
			financialStatements.add(totalProfit);
			result.put("cwbb", financialStatements);
			List<Entity> personnelAndPerCapitaSituation = this.buildPersonnelAndPerCapitaSituation(dbSession, budgetIdCodeMap, budgetMainIds);
			result.put("ryjrjqk", personnelAndPerCapitaSituation);
			List<Entity> fullAperture = this.buildFullAperture(financialStatements, budgetIdCodeMap, personnelAndPerCapitaSituation);
			result.put("rgcbqkj", fullAperture);
			List<Entity> laborProductivityList = this.buildLaborProductivity(financialStatements, fullAperture, personnelAndPerCapitaSituation, dbSession, budgetMainIds, budgetIdCodeMap);
			result.put("ldscl", laborProductivityList);
		}
		return result;
	}

	// 主体动态列的构建
	private List<Entity> buildGridColumns(Session dbSession, boolean ryjrjqk) throws Exception {
		List<Entity> columnList = new ArrayList<Entity>();
		Entity serialNumberEntity = new Entity();
		serialNumberEntity.set("field", "serial_number").set("width", 60).set("headerAlign", "center").set("align", "center").set("header", "序号");
		columnList.add(serialNumberEntity);
		Entity nameEntity = new Entity();
		nameEntity.set("name", "name").set("field", "name").set("width", 200).set("headerAlign", "center").set("align", "left").set("header", "填报项");
		columnList.add(nameEntity);
		Entity totalEntity = new Entity();
		if (ryjrjqk) {
			totalEntity.set("field", "total_amount").set("width", 150).set("headerAlign", "center").set("align", "center").set("dataType", "currency").set("header", "平均实际");
		} else {
			totalEntity.set("field", "total_amount").set("width", 150).set("headerAlign", "center").set("align", "center").set("dataType", "currency").set("header", "合计");
		}
		columnList.add(totalEntity);
		String querySql = "SELECT id, name, filling_in_org, code FROM zh_caiwu_budget_account WHERE filling_in_org IS NOT NULL ORDER BY sorting ASC";
		List<Entity> budgetAccountList = dbSession.query(querySql);
		for (Entity budget : budgetAccountList) {
			Entity column = new Entity();
			column.set("field", budget.getStr("code")).set("width", 150).set("headerAlign", "center").set("align", "center").set("dataType", "currency").set("header", budget.getStr("name"));
			columnList.add(column);
		}
		return columnList;
	}

	// 报表总收入部分数据构建
	private List<Entity> buildFillingIncome(Session dbSession, Map<String, String> budgetIdCodeMap, String budgetMainIds) throws Exception {
		List<Entity> totalRevenueList = new ArrayList<Entity>();
		String queryWithinTheGroupSql = "SELECT * FROM zh_caiwu_budget_filling_income WHERE income_name = '集团内' AND budget_main_id IN  (" + budgetMainIds + ")";
		Entity withinTheGroup = this.groupToEntity(dbSession.query(queryWithinTheGroupSql), budgetIdCodeMap, "budget_main_id", "total_amount");
		withinTheGroup.set("serial_number", "1.1").set("id", "1.1").set("name", "集团内").set("parent", "总收入");
		String queryOutsideTheGroupSql = "SELECT * FROM zh_caiwu_budget_filling_income WHERE income_name = '集团外' AND budget_main_id IN  (" + budgetMainIds + ")";
		Entity outsideTheGroup = this.groupToEntity(dbSession.query(queryOutsideTheGroupSql), budgetIdCodeMap, "budget_main_id", "total_amount");
		outsideTheGroup.set("serial_number", "1.2").set("id", "1.2").set("name", "集团外").set("parent", "总收入");
		Entity totalRevenue = new Entity();
		totalRevenue.set("serial_number", "1").set("id", "总收入").set("name", "一、总收入").set("parent", "-1")
				.set("total_amount", NumberUtil.add(withinTheGroup.getBigDecimal("total_amount"), outsideTheGroup.getBigDecimal("total_amount")));
		for (Map.Entry<String, String> entry : budgetIdCodeMap.entrySet()) {
			totalRevenue.set(entry.getValue(), NumberUtil.add(withinTheGroup.getBigDecimal(entry.getValue()), outsideTheGroup.getBigDecimal(entry.getValue())));
		}
		totalRevenueList.add(totalRevenue);
		totalRevenueList.add(withinTheGroup);
		totalRevenueList.add(outsideTheGroup);
		return totalRevenueList;
	}

	// 报表总成本部分数据构建
	public List<Entity> buildFillingLedger(Session dbSession, Map<String, String> budgetIdCodeMap, String budgetMainIds) throws Exception {
		List<Entity> totalCostList = new ArrayList<Entity>();
		String queryKmClassSql = "SELECT DICTID, DICTNAME FROM EOS_DICT_ENTRY WHERE DICTTYPEID = 'CW_KM_CLASS' ORDER BY SORTNO ASC";
		List<Entity> kmClassList = dbSession.query(queryKmClassSql);

		Entity totalCost = new Entity();
		totalCost.set("serial_number", "2").set("id", "totalCost").set("name", "二、总成本").set("parent", "-1").set("total_amount", BigDecimal.ZERO);
		for (Map.Entry<String, String> entry : budgetIdCodeMap.entrySet()) {
			totalCost.set(entry.getValue(), BigDecimal.ZERO);
		}
		totalCostList.add(totalCost);

		List<Entity> kmClassRevenueList = new ArrayList<Entity>();
		for (int i = 0; i < kmClassList.size(); i++) {
			Entity kmClass = kmClassList.get(i);
			Entity kmClassRevenue = new Entity();
			kmClassRevenue.set("serial_number", StrUtil.format("2.{}", i + 1)).set("id", kmClass.getStr("DICTNAME")).set("name", kmClass.getStr("DICTNAME")).set("parent", "totalCost")
					.set("total_amount", BigDecimal.ZERO);
			for (Map.Entry<String, String> entry : budgetIdCodeMap.entrySet()) {
				kmClassRevenue.set(entry.getValue(), BigDecimal.ZERO);
			}

			String querySql = "SELECT zcbfl.*, zcla.name, zcla.sorting FROM zh_caiwu_budget_filling_ledger AS zcbfl, zh_caiwu_ledger_account AS zcla WHERE zcbfl.budget_category = ? AND zcbfl.ledger_account_id = zcla.id AND zcbfl.budget_main_id IN ("
					+ budgetMainIds + ") ORDER BY zcla.sorting ASC";
			List<Entity> entityList = dbSession.query(querySql, kmClass.getStr("DICTID"));
			Map<String, List<Entity>> ledgerGroupMap = entityList.stream().collect(Collectors.groupingBy(entity -> entity.getStr("ledger_account_id"), TreeMap::new, Collectors.toList()));
			Map<String, List<Entity>> sortMap = this.sortMapByFirstEntitySorting(ledgerGroupMap);
			List<Entity> ledgerList = sortMap.entrySet().stream().map(entry -> {
				String ledgerAccountId = entry.getKey();
				List<Entity> groupEntities = entry.getValue();
				Entity result = this.groupToEntity(groupEntities, budgetIdCodeMap, "budget_main_id", "total_amount");
				result.set("id", kmClass.getStr("DICTID") + "_" + ledgerAccountId);
				result.set("name", groupEntities.get(0).getStr("name"));
				result.set("parent", kmClass.getStr("DICTNAME"));
				return result;
			}).collect(Collectors.toList());

			if ("人工和用工成本（不含研发）".equals(kmClass.getStr("DICTNAME"))) {
				// 插入部分统计科目项
				for (int j = ledgerList.size() - 1; j >= 0; j--) {
					if (ledgerList.get(j).getStr("name").equals("合作单位费用-成本（不含内部交易）")) {
						Entity entity = new Entity().set("id", "合作单位费用（无内部交易）").set("name", "合作单位费用（无内部交易）").set("parent", kmClass.getStr("DICTNAME")).set("total_amount", BigDecimal.ZERO);
						for (Map.Entry<String, String> entry : budgetIdCodeMap.entrySet()) {
							entity.set(entry.getValue(), BigDecimal.ZERO);
						}
						ledgerList.add(j, entity);
					} else if (ledgerList.get(j).getStr("name").equals("意外伤害保险-成本")) {
						Entity entity = new Entity().set("id", "意外伤害保险").set("name", "意外伤害保险").set("parent", kmClass.getStr("DICTNAME")).set("total_amount", BigDecimal.ZERO);
						for (Map.Entry<String, String> entry : budgetIdCodeMap.entrySet()) {
							entity.set(entry.getValue(), BigDecimal.ZERO);
						}
						ledgerList.add(j, entity);
					}
				}
				// 生成科目序号及部分科目字段汇总计算
				int stepNum = 0;
				for (int k = 0; k < ledgerList.size(); k++) {
					if (ledgerList.get(k).getStr("name").equals("工资总额（不含研发）")) {
						ledgerList.get(k).set("serial_number", StrUtil.format("2.{}.{}", i + 1, k + 1));
						String querySqlOne = "SELECT zcbfl.* FROM zh_caiwu_budget_filling_ledger AS zcbfl, zh_caiwu_ledger_account AS zcla WHERE zcbfl.ledger_account_id = zcla.id AND zcla.name = '工资总额（含研发）' AND zcbfl.budget_main_id IN  ("
								+ budgetMainIds + ")";
						String querySqlTwo = "SELECT zcbfl.* FROM zh_caiwu_budget_filling_ledger AS zcbfl, zh_caiwu_ledger_account AS zcla WHERE zcbfl.ledger_account_id = zcla.id AND zcla.name = '研发-工资' AND zcbfl.budget_main_id IN  ("
								+ budgetMainIds + ")";
						List<Entity> oneList = dbSession.query(querySqlOne);
						List<Entity> twoList = dbSession.query(querySqlTwo);
						Entity oneEntity = this.groupToEntity(oneList, budgetIdCodeMap, "budget_main_id", "total_amount");
						Entity twoEntity = this.groupToEntity(twoList, budgetIdCodeMap, "budget_main_id", "total_amount");
						ledgerList.get(k).set("total_amount", NumberUtil.sub(oneEntity.getBigDecimal("total_amount"), twoEntity.getBigDecimal("total_amount")));
						for (Map.Entry<String, String> entry : budgetIdCodeMap.entrySet()) {
							ledgerList.get(k).set(entry.getValue(), NumberUtil.sub(oneEntity.getBigDecimal(entry.getValue()), twoEntity.getBigDecimal(entry.getValue())));
						}
					} else if (ledgerList.get(k).getStr("name").equals("养老保险（不含研发）")) {
						ledgerList.get(k).set("serial_number", StrUtil.format("2.{}.{}", i + 1, k + 1));
						String querySqlOne = "SELECT zcbfl.* FROM zh_caiwu_budget_filling_ledger AS zcbfl, zh_caiwu_ledger_account AS zcla WHERE zcbfl.ledger_account_id = zcla.id AND zcla.name = '养老保险（含研发）' AND zcbfl.budget_main_id IN  ("
								+ budgetMainIds + ")";
						String querySqlTwo = "SELECT zcbfl.* FROM zh_caiwu_budget_filling_ledger AS zcbfl, zh_caiwu_ledger_account AS zcla WHERE zcbfl.ledger_account_id = zcla.id AND zcla.name = '研发-社保' AND zcbfl.budget_main_id IN  ("
								+ budgetMainIds + ")";
						List<Entity> oneList = dbSession.query(querySqlOne);
						List<Entity> twoList = dbSession.query(querySqlTwo);
						Entity oneEntity = this.groupToEntity(oneList, budgetIdCodeMap, "budget_main_id", "total_amount");
						Entity twoEntity = this.groupToEntity(twoList, budgetIdCodeMap, "budget_main_id", "total_amount");
						ledgerList.get(k).set("total_amount", NumberUtil.sub(oneEntity.getBigDecimal("total_amount"), twoEntity.getBigDecimal("total_amount")));
						for (Map.Entry<String, String> entry : budgetIdCodeMap.entrySet()) {
							ledgerList.get(k).set(entry.getValue(), NumberUtil.sub(oneEntity.getBigDecimal(entry.getValue()), twoEntity.getBigDecimal(entry.getValue())));
						}
					} else if (ledgerList.get(k).getStr("name").equals("意外伤害保险-成本")) {
						ledgerList.get(k).set("serial_number", StrUtil.format("2.{}.{}.{}", i + 1, k, 1));
						ledgerList.get(k).set("parent", "意外伤害保险");
						stepNum = 1;
					} else if (ledgerList.get(k).getStr("name").equals("意外伤害保险-管理")) {
						ledgerList.get(k).set("serial_number", StrUtil.format("2.{}.{}.{}", i + 1, k - stepNum, 2));
						ledgerList.get(k).set("parent", "意外伤害保险");
						stepNum = 2;
					} else if (ledgerList.get(k).getStr("name").equals("合作单位费用-成本（不含内部交易）")) {
						ledgerList.get(k).set("serial_number", StrUtil.format("2.{}.{}.{}", i + 1, k - stepNum, 1));
						ledgerList.get(k).set("parent", "合作单位费用（无内部交易）");
						stepNum = 3;
					} else if (ledgerList.get(k).getStr("name").equals("合作单位费用-管理")) {
						ledgerList.get(k).set("serial_number", StrUtil.format("2.{}.{}.{}", i + 1, k - stepNum, 2));
						ledgerList.get(k).set("parent", "合作单位费用（无内部交易）");
						stepNum = 4;
					} else if (ledgerList.get(k).getStr("name").equals("意外伤害保险")) {
						String querySqlOne = "SELECT zcbfl.* FROM zh_caiwu_budget_filling_ledger AS zcbfl, zh_caiwu_ledger_account AS zcla WHERE zcbfl.ledger_account_id = zcla.id AND zcla.name = '意外伤害保险-成本' AND zcbfl.budget_main_id IN  ("
								+ budgetMainIds + ")";
						String querySqlTwo = "SELECT zcbfl.* FROM zh_caiwu_budget_filling_ledger AS zcbfl, zh_caiwu_ledger_account AS zcla WHERE zcbfl.ledger_account_id = zcla.id AND zcla.name = '意外伤害保险-管理' AND zcbfl.budget_main_id IN  ("
								+ budgetMainIds + ")";
						List<Entity> oneList = dbSession.query(querySqlOne);
						List<Entity> twoList = dbSession.query(querySqlTwo);
						Entity oneEntity = this.groupToEntity(oneList, budgetIdCodeMap, "budget_main_id", "total_amount");
						Entity twoEntity = this.groupToEntity(twoList, budgetIdCodeMap, "budget_main_id", "total_amount");
						ledgerList.get(k).set("total_amount", NumberUtil.sub(oneEntity.getBigDecimal("total_amount"), twoEntity.getBigDecimal("total_amount")))
								.set("serial_number", StrUtil.format("2.{}.{}", i + 1, k + 1 - stepNum));
						for (Map.Entry<String, String> entry : budgetIdCodeMap.entrySet()) {
							ledgerList.get(k).set(entry.getValue(), NumberUtil.sub(oneEntity.getBigDecimal(entry.getValue()), twoEntity.getBigDecimal(entry.getValue())));
						}
					} else if (ledgerList.get(k).getStr("name").equals("合作单位费用（无内部交易）")) {
						String querySqlOne = "SELECT zcbfl.* FROM zh_caiwu_budget_filling_ledger AS zcbfl, zh_caiwu_ledger_account AS zcla WHERE zcbfl.ledger_account_id = zcla.id AND zcla.name = '合作单位费用-成本（不含内部交易）' AND zcbfl.budget_main_id IN  ("
								+ budgetMainIds + ")";
						String querySqlTwo = "SELECT zcbfl.* FROM zh_caiwu_budget_filling_ledger AS zcbfl, zh_caiwu_ledger_account AS zcla WHERE zcbfl.ledger_account_id = zcla.id AND zcla.name = '合作单位费用-管理' AND zcbfl.budget_main_id IN  ("
								+ budgetMainIds + ")";
						List<Entity> oneList = dbSession.query(querySqlOne);
						List<Entity> twoList = dbSession.query(querySqlTwo);
						Entity oneEntity = this.groupToEntity(oneList, budgetIdCodeMap, "budget_main_id", "total_amount");
						Entity twoEntity = this.groupToEntity(twoList, budgetIdCodeMap, "budget_main_id", "total_amount");
						ledgerList.get(k).set("total_amount", NumberUtil.sub(oneEntity.getBigDecimal("total_amount"), twoEntity.getBigDecimal("total_amount")))
								.set("serial_number", StrUtil.format("2.{}.{}", i + 1, k + 1 - stepNum));
						for (Map.Entry<String, String> entry : budgetIdCodeMap.entrySet()) {
							ledgerList.get(k).set(entry.getValue(), NumberUtil.sub(oneEntity.getBigDecimal(entry.getValue()), twoEntity.getBigDecimal(entry.getValue())));
						}
					} else {
						ledgerList.get(k).set("serial_number", StrUtil.format("2.{}.{}", i + 1, k + 1 - stepNum));
					}
				}
				for (Map.Entry<String, String> entry : budgetIdCodeMap.entrySet()) {
					for (Entity ledger : ledgerList) {
						String name = ledger.getStr("name");
						if (!"工资总额（含研发）".equals(name) && !"养老保险（含研发）".equals(name) && !"意外伤害保险".equals(name) && !"合作单位费用（无内部交易）".equals(name)) {
							kmClassRevenue.set(entry.getValue(), NumberUtil.add(kmClassRevenue.getBigDecimal(entry.getValue()), ledger.getBigDecimal(entry.getValue())));
						}
					}
				}
				for (Entity ledger : ledgerList) {
					String name = ledger.getStr("name");
					if (!"工资总额（含研发）".equals(name) && !"养老保险（含研发）".equals(name) && !"意外伤害保险".equals(name) && !"合作单位费用（无内部交易）".equals(name)) {
						kmClassRevenue.set("total_amount", NumberUtil.add(kmClassRevenue.getBigDecimal("total_amount"), ledger.getBigDecimal("total_amount")));
					}
				}
			} else {
				for (int j = 0; j < ledgerList.size(); j++) {
					ledgerList.get(j).set("serial_number", StrUtil.format("2.{}.{}", i + 1, j + 1));
				}
				for (Map.Entry<String, String> entry : budgetIdCodeMap.entrySet()) {
					for (Entity ledger : ledgerList) {
						kmClassRevenue.set(entry.getValue(), NumberUtil.add(kmClassRevenue.getBigDecimal(entry.getValue()), ledger.getBigDecimal(entry.getValue())));
					}
				}
				for (Entity ledger : ledgerList) {
					kmClassRevenue.set("total_amount", NumberUtil.add(kmClassRevenue.getBigDecimal("total_amount"), ledger.getBigDecimal("total_amount")));
				}
			}

			totalCostList.add(kmClassRevenue);
			totalCostList.addAll(ledgerList);
			kmClassRevenueList.add(kmClassRevenue);

		}

		for (Map.Entry<String, String> entry : budgetIdCodeMap.entrySet()) {
			for (Entity kmClassRevenue : kmClassRevenueList) {
				totalCostList.get(0).set(entry.getValue(), NumberUtil.add(totalCostList.get(0).getBigDecimal(entry.getValue()), kmClassRevenue.getBigDecimal(entry.getValue())));
			}
		}

		for (Entity kmClassRevenue : kmClassRevenueList) {
			totalCostList.get(0).set("total_amount", NumberUtil.add(totalCostList.get(0).getBigDecimal("total_amount"), kmClassRevenue.getBigDecimal("total_amount")));
		}

		return totalCostList;
	}

	// 报表毛利率数据构建
	private Entity buildGrossProfitMargin(List<Entity> totalRevenueList, Map<String, String> budgetIdCodeMap, List<Entity> totalCostList) throws Exception {
		Entity totalRevenue = totalRevenueList.get(0);
		Entity totalCost = totalCostList.get(0);
		Entity grossProfitMargin = new Entity();
		grossProfitMargin.set("serial_number", "3").set("id", "毛利率").set("name", "三、毛利率").set("parent", "-1")
				.set("total_amount", NumberUtil.sub(totalRevenue.getBigDecimal("total_amount"), totalCost.getBigDecimal("total_amount")));
		for (Map.Entry<String, String> entry : budgetIdCodeMap.entrySet()) {
			grossProfitMargin.set(entry.getValue(), NumberUtil.sub(totalRevenue.getBigDecimal(entry.getValue()), totalCost.getBigDecimal(entry.getValue())));
		}
		return grossProfitMargin;
	}

	// 报表总部管理费分摊和其他数据构建
	private List<Entity> buildApportionmentAndOther(Session dbSession, Map<String, String> budgetIdCodeMap, String budgetMainIds, List<Entity> totalCostList) throws Exception {
		List<Entity> resultList = new ArrayList<Entity>();
		Entity totalCost = totalCostList.get(0);
		List<String> budgetMainIdList = StrUtil.split(budgetMainIds, ",");
		String queryApportionmentSql = "SELECT *, margin_name AS name FROM zh_caiwu_budget_filling_margin WHERE margin_name = '四、总部管理费分摊' AND budget_main_id IN (" + budgetMainIds + ")";
		List<Entity> apportionmentList = dbSession.query(queryApportionmentSql);
		Map<String, List<Entity>> apportionmentGroupedMap = apportionmentList.stream().collect(Collectors.groupingBy(entity -> entity.getStr("budget_main_id"), TreeMap::new, Collectors.toList()));
		Entity apportionmentEntity = new Entity().set("id", "总部管理费分摊").set("name", "四、总部管理费分摊").set("parent", "-1").set("serial_number", "4").set("total_amount", BigDecimal.ZERO);
		BigDecimal total = BigDecimal.ZERO;
		for (Map.Entry<String, String> entry : budgetIdCodeMap.entrySet()) {
			BigDecimal val = BigDecimal.ZERO;
			if (apportionmentGroupedMap.containsKey(entry.getKey())) {
				val = NumberUtil.mul(totalCost.getBigDecimal(entry.getValue()), NumberUtil.div(apportionmentGroupedMap.get(entry.getKey()).get(0).getBigDecimal("share_proportion"), 100));
			}
			apportionmentEntity.set(entry.getValue(), val);
			total = NumberUtil.add(total, val);
		}
		apportionmentEntity.set("total_amount", total);
		resultList.add(apportionmentEntity);

		String queryOtherSql = "SELECT *, margin_name AS name FROM zh_caiwu_budget_filling_margin WHERE margin_name = '五、其他' AND budget_main_id IN (" + budgetMainIds + ")";
		List<Entity> otherList = dbSession.query(queryOtherSql);
		Entity otherEntity = this.groupToEntity(otherList, budgetIdCodeMap, "budget_main_id", "total_amount");
		otherEntity.set("id", "其他").set("name", "五、其他").set("parent", "-1").set("serial_number", "5");
		resultList.add(otherEntity);
		return resultList;
	}

	// 报表利润总额数据构建
	private Entity buildTotalProfit(Entity grossProfitMargin, List<Entity> apportionmentAndOtherList, Map<String, String> budgetIdCodeMap) throws Exception {
		Entity apportionment = apportionmentAndOtherList.get(0);
		Entity other = apportionmentAndOtherList.get(1);
		Entity totalProfit = new Entity();
		totalProfit.set("serial_number", "6").set("id", "利润总额").set("name", "六、利润总额").set("parent", "-1")
				.set("total_amount", NumberUtil.sub(grossProfitMargin.getBigDecimal("total_amount"), apportionment.getBigDecimal("total_amount"), other.getBigDecimal("total_amount")));
		for (Map.Entry<String, String> entry : budgetIdCodeMap.entrySet()) {
			totalProfit.set(entry.getValue(), NumberUtil.sub(grossProfitMargin.getBigDecimal(entry.getValue()), apportionment.getBigDecimal(entry.getValue()), other.getBigDecimal(entry.getValue())));
		}
		return totalProfit;
	}

	// 报表人员及人均情况数据构建
	private List<Entity> buildPersonnelAndPerCapitaSituation(Session dbSession, Map<String, String> budgetIdCodeMap, String budgetMainIds) throws Exception {
		List<Entity> personnelAndPerCapitaSituationList = new ArrayList<Entity>();
		String querySql = "SELECT *, situation_name AS name, '平均从业人员人数' AS parent FROM zh_caiwu_budget_filling_personnel WHERE budget_main_id IN (" + budgetMainIds + ")";
		List<Entity> personnelList = dbSession.query(querySql);
		Map<String, List<Entity>> groupedMap = personnelList.stream().collect(Collectors.groupingBy(entity -> entity.getStr("situation_name"))).entrySet().stream().sorted((entry1, entry2) -> {
			String id1 = entry1.getValue().get(0).getStr("id");
			String id2 = entry2.getValue().get(0).getStr("id");
			return id1.compareTo(id2);
		}).collect(Collectors.toMap(Map.Entry::getKey, Map.Entry::getValue, (v1, v2) -> v1, LinkedHashMap::new));
		List<Entity> groupList = groupedMap.entrySet().stream().map(entry -> {
			String key = entry.getKey();
			List<Entity> groupEntities = entry.getValue();
			Entity result = this.groupToEntity(groupEntities, budgetIdCodeMap, "budget_main_id", "average_actual");
			result.set("id", "平均从业人员人数_" + key);
			result.set("name", key);
			result.set("parent", "平均从业人员人数");
			return result;
		}).collect(Collectors.toList());

		Entity averageNumberOfEmployees = new Entity().set("serial_number", "1").set("id", "平均从业人员人数").set("name", "一、平均从业人员人数").set("parent", "-1").set("total_amount", BigDecimal.ZERO);
		for (Map.Entry<String, String> entry : budgetIdCodeMap.entrySet()) {
			averageNumberOfEmployees.set(entry.getValue(), BigDecimal.ZERO);
		}

		Entity averageNumberOfEmployedPersonnel = new Entity().set("serial_number", "2").set("id", "平均用工人员人数").set("name", "二、平均用工人员人数").set("parent", "-1").set("total_amount", BigDecimal.ZERO);
		for (Map.Entry<String, String> entry : budgetIdCodeMap.entrySet()) {
			averageNumberOfEmployedPersonnel.set(entry.getValue(), BigDecimal.ZERO);
		}

		personnelAndPerCapitaSituationList.add(averageNumberOfEmployees);
		personnelAndPerCapitaSituationList.addAll(groupList);
		personnelAndPerCapitaSituationList.add(averageNumberOfEmployedPersonnel);

		for (int i = 0; i < personnelAndPerCapitaSituationList.size(); i++) {
			if (personnelAndPerCapitaSituationList.get(i).getStr("id").equals("平均从业人员人数")) {
				for (Entity entity : groupList) {
					if ("平均在职人数".equals(entity.getStr("name")) || "平均返聘人数".equals(entity.getStr("name")) || "平均劳务派遣".equals(entity.getStr("name"))) {
						personnelAndPerCapitaSituationList.get(i).set("total_amount",
								NumberUtil.add(personnelAndPerCapitaSituationList.get(i).getBigDecimal("total_amount"), entity.getBigDecimal("total_amount")));
						for (Map.Entry<String, String> entry : budgetIdCodeMap.entrySet()) {
							personnelAndPerCapitaSituationList.get(i).set(entry.getValue(),
									NumberUtil.add(personnelAndPerCapitaSituationList.get(i).getBigDecimal(entry.getValue()), entity.getBigDecimal(entry.getValue())));
						}
					}
				}
			} else if (personnelAndPerCapitaSituationList.get(i).getStr("id").equals("平均用工人员人数")) {
				for (Entity entity : groupList) {
					personnelAndPerCapitaSituationList.get(i).set("total_amount",
							NumberUtil.add(personnelAndPerCapitaSituationList.get(i).getBigDecimal("total_amount"), entity.getBigDecimal("total_amount")));
					for (Map.Entry<String, String> entry : budgetIdCodeMap.entrySet()) {
						personnelAndPerCapitaSituationList.get(i).set(entry.getValue(),
								NumberUtil.add(personnelAndPerCapitaSituationList.get(i).getBigDecimal(entry.getValue()), entity.getBigDecimal(entry.getValue())));
					}
				}
			} else {
				personnelAndPerCapitaSituationList.get(i).set("serial_number", StrUtil.format("1.{}", i));
			}
		}

		return personnelAndPerCapitaSituationList;
	}

	// 报表人工成本-全口径部分数据构建
	private List<Entity> buildFullAperture(List<Entity> financialStatements, Map<String, String> budgetIdCodeMap, List<Entity> personnelAndPerCapitaSituation) throws Exception {
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
				.set("total_amount",
						NumberUtil.add(financialStatementsMap.get("人工和用工成本（不含研发）_工资总额（不含研发）").getBigDecimal("total_amount"), financialStatementsMap.get("研发费_研发-工资").getBigDecimal("total_amount")));
		for (Map.Entry<String, String> entry : budgetIdCodeMap.entrySet()) {
			zzzehyfEntity.set(entry.getValue(),
					NumberUtil.add(financialStatementsMap.get("人工和用工成本（不含研发）_工资总额（不含研发）").getBigDecimal(entry.getValue()), financialStatementsMap.get("研发费_研发-工资").getBigDecimal(entry.getValue())));
		}

		// 福利费
		Entity flfEntity = new Entity();
		flfEntity
				.set("serial_number", "1.2")
				.set("id", "福利费")
				.set("name", "福利费")
				.set("parent", "在职人员人工成本")
				.set("total_amount",
						NumberUtil.add(financialStatementsMap.get("人工和用工成本（不含研发）_体检费").getBigDecimal("total_amount"), financialStatementsMap.get("人工和用工成本（不含研发）_防暑降温费").getBigDecimal("total_amount"),
								financialStatementsMap.get("人工和用工成本（不含研发）_食堂经费").getBigDecimal("total_amount"), financialStatementsMap.get("人工和用工成本（不含研发）_独生子女费").getBigDecimal("total_amount"),
								financialStatementsMap.get("人工和用工成本（不含研发）_女职工卫生费").getBigDecimal("total_amount"),
								financialStatementsMap.get("人工和用工成本（不含研发）_职工供养直系亲属医疗补贴支出").getBigDecimal("total_amount"),
								financialStatementsMap.get("人工和用工成本（不含研发）_职工探亲假路费").getBigDecimal("total_amount"), financialStatementsMap.get("人工和用工成本（不含研发）_困难补助").getBigDecimal("total_amount"),
								financialStatementsMap.get("人工和用工成本（不含研发）_一次性辞退福利及其他").getBigDecimal("total_amount")));
		for (Map.Entry<String, String> entry : budgetIdCodeMap.entrySet()) {
			flfEntity.set(entry.getValue(), NumberUtil.add(financialStatementsMap.get("人工和用工成本（不含研发）_体检费").getBigDecimal(entry.getValue()), financialStatementsMap.get("人工和用工成本（不含研发）_防暑降温费")
					.getBigDecimal(entry.getValue()), financialStatementsMap.get("人工和用工成本（不含研发）_食堂经费").getBigDecimal(entry.getValue()), financialStatementsMap.get("人工和用工成本（不含研发）_独生子女费")
					.getBigDecimal(entry.getValue()), financialStatementsMap.get("人工和用工成本（不含研发）_女职工卫生费").getBigDecimal(entry.getValue()), financialStatementsMap.get("人工和用工成本（不含研发）_职工供养直系亲属医疗补贴支出")
					.getBigDecimal(entry.getValue()), financialStatementsMap.get("人工和用工成本（不含研发）_职工探亲假路费").getBigDecimal(entry.getValue()), financialStatementsMap.get("人工和用工成本（不含研发）_困难补助")
					.getBigDecimal(entry.getValue()), financialStatementsMap.get("人工和用工成本（不含研发）_一次性辞退福利及其他").getBigDecimal(entry.getValue())));
		}

		// 社会保险（含研发）
		Entity shbxhyfEntity = new Entity();
		shbxhyfEntity
				.set("serial_number", "1.3")
				.set("id", "社会保险（含研发）")
				.set("name", "社会保险（含研发）")
				.set("parent", "在职人员人工成本")
				.set("total_amount",
						NumberUtil.add(financialStatementsMap.get("人工和用工成本（不含研发）_养老保险（不含研发）").getBigDecimal("total_amount"),
								financialStatementsMap.get("人工和用工成本（不含研发）_医疗保险").getBigDecimal("total_amount"), financialStatementsMap.get("人工和用工成本（不含研发）_失业保险").getBigDecimal("total_amount"),
								financialStatementsMap.get("人工和用工成本（不含研发）_工伤保险").getBigDecimal("total_amount"), financialStatementsMap.get("人工和用工成本（不含研发）_生育保险").getBigDecimal("total_amount"),
								financialStatementsMap.get("研发费_研发-社保").getBigDecimal("total_amount")));
		for (Map.Entry<String, String> entry : budgetIdCodeMap.entrySet()) {
			shbxhyfEntity.set(entry.getValue(), NumberUtil.add(financialStatementsMap.get("人工和用工成本（不含研发）_养老保险（不含研发）").getBigDecimal(entry.getValue()), financialStatementsMap.get("人工和用工成本（不含研发）_医疗保险")
					.getBigDecimal(entry.getValue()), financialStatementsMap.get("人工和用工成本（不含研发）_失业保险").getBigDecimal(entry.getValue()),
					financialStatementsMap.get("人工和用工成本（不含研发）_工伤保险").getBigDecimal("jan_amount"), financialStatementsMap.get("人工和用工成本（不含研发）_生育保险").getBigDecimal(entry.getValue()),
					financialStatementsMap.get("研发费_研发-社保").getBigDecimal(entry.getValue())));
		}

		// 企业年金
		Entity qynjEntity = new Entity();
		qynjEntity.set("serial_number", "1.4").set("id", "企业年金").set("name", "企业年金").set("parent", "在职人员人工成本")
				.set("total_amount", financialStatementsMap.get("人工和用工成本（不含研发）_企业年金").getBigDecimal("total_amount"));
		for (Map.Entry<String, String> entry : budgetIdCodeMap.entrySet()) {
			qynjEntity.set(entry.getValue(), financialStatementsMap.get("人工和用工成本（不含研发）_企业年金").getBigDecimal(entry.getValue()));
		}

		// 补充医疗
		Entity bcylEntity = new Entity();
		bcylEntity.set("serial_number", "1.5").set("id", "补充医疗").set("name", "补充医疗").set("parent", "在职人员人工成本")
				.set("total_amount", financialStatementsMap.get("人工和用工成本（不含研发）_补充医疗").getBigDecimal("total_amount"));
		for (Map.Entry<String, String> entry : budgetIdCodeMap.entrySet()) {
			bcylEntity.set(entry.getValue(), financialStatementsMap.get("人工和用工成本（不含研发）_补充医疗").getBigDecimal(entry.getValue()));
		}

		// 意外伤害保险
		Entity ywshbxEntity = new Entity();
		ywshbxEntity.set("serial_number", "1.6").set("id", "意外伤害保险").set("name", "意外伤害保险").set("parent", "在职人员人工成本")
				.set("total_amount", financialStatementsMap.get("人工和用工成本（不含研发）_意外伤害保险").getBigDecimal("total_amount"));
		for (Map.Entry<String, String> entry : budgetIdCodeMap.entrySet()) {
			ywshbxEntity.set(entry.getValue(), financialStatementsMap.get("人工和用工成本（不含研发）_意外伤害保险").getBigDecimal(entry.getValue()));
		}

		// 住房公积金
		Entity zfgjjEntity = new Entity();
		zfgjjEntity.set("serial_number", "1.7").set("id", "住房公积金").set("name", "住房公积金").set("parent", "在职人员人工成本")
				.set("total_amount", financialStatementsMap.get("人工和用工成本（不含研发）_住房公积金").getBigDecimal("total_amount"));
		for (Map.Entry<String, String> entry : budgetIdCodeMap.entrySet()) {
			zfgjjEntity.set(entry.getValue(), financialStatementsMap.get("人工和用工成本（不含研发）_住房公积金").getBigDecimal(entry.getValue()));
		}

		// 工会经费
		Entity ghjfEntity = new Entity();
		ghjfEntity.set("serial_number", "1.8").set("id", "工会经费").set("name", "工会经费").set("parent", "在职人员人工成本")
				.set("total_amount", financialStatementsMap.get("人工和用工成本（不含研发）_工会经费").getBigDecimal("total_amount"));
		for (Map.Entry<String, String> entry : budgetIdCodeMap.entrySet()) {
			ghjfEntity.set(entry.getValue(), financialStatementsMap.get("人工和用工成本（不含研发）_工会经费").getBigDecimal(entry.getValue()));
		}

		// 职工教育经费
		Entity zgjyjfEntity = new Entity();
		zgjyjfEntity.set("serial_number", "1.9").set("id", "职工教育经费").set("name", "职工教育经费").set("parent", "在职人员人工成本")
				.set("total_amount", financialStatementsMap.get("人工和用工成本（不含研发）_职工教育经费").getBigDecimal("total_amount"));
		for (Map.Entry<String, String> entry : budgetIdCodeMap.entrySet()) {
			zgjyjfEntity.set(entry.getValue(), financialStatementsMap.get("人工和用工成本（不含研发）_职工教育经费").getBigDecimal(entry.getValue()));
		}

		// 残保金
		Entity cbjEntity = new Entity();
		cbjEntity.set("serial_number", "1.10").set("id", "残保金").set("name", "残保金").set("parent", "在职人员人工成本")
				.set("total_amount", financialStatementsMap.get("人工和用工成本（不含研发）_残保金").getBigDecimal("total_amount"));
		for (Map.Entry<String, String> entry : budgetIdCodeMap.entrySet()) {
			cbjEntity.set(entry.getValue(), financialStatementsMap.get("人工和用工成本（不含研发）_残保金").getBigDecimal(entry.getValue()));
		}

		// 在职人员人工成本
		Entity zzryrgcbEntity = new Entity();
		zzryrgcbEntity
				.set("serial_number", "1")
				.set("id", "在职人员人工成本")
				.set("name", "一、在职人员人工成本")
				.set("parent", "-1")
				.set("total_amount",
						NumberUtil.add(zzzehyfEntity.getBigDecimal("total_amount"), flfEntity.getBigDecimal("total_amount"), shbxhyfEntity.getBigDecimal("total_amount"),
								qynjEntity.getBigDecimal("total_amount"), bcylEntity.getBigDecimal("total_amount"), ywshbxEntity.getBigDecimal("total_amount"),
								zfgjjEntity.getBigDecimal("total_amount"), ghjfEntity.getBigDecimal("total_amount"), zgjyjfEntity.getBigDecimal("total_amount"),
								cbjEntity.getBigDecimal("total_amount")));
		for (Map.Entry<String, String> entry : budgetIdCodeMap.entrySet()) {
			zzryrgcbEntity.set(
					entry.getValue(),
					NumberUtil.add(zzzehyfEntity.getBigDecimal(entry.getValue()), flfEntity.getBigDecimal(entry.getValue()), shbxhyfEntity.getBigDecimal(entry.getValue()),
							qynjEntity.getBigDecimal(entry.getValue()), bcylEntity.getBigDecimal(entry.getValue()), ywshbxEntity.getBigDecimal(entry.getValue()),
							zfgjjEntity.getBigDecimal(entry.getValue()), ghjfEntity.getBigDecimal(entry.getValue()), zgjyjfEntity.getBigDecimal(entry.getValue()),
							cbjEntity.getBigDecimal(entry.getValue())));
		}

		// 退休返聘实习人员费用
		Entity txfpsxryfyEntity = new Entity();
		txfpsxryfyEntity.set("serial_number", "2").set("id", "退休返聘实习人员费用").set("name", "二、退休返聘实习人员费用").set("parent", "-1")
				.set("total_amount", financialStatementsMap.get("人工和用工成本（不含研发）_退休返聘实习人员费用").getBigDecimal("total_amount"));
		for (Map.Entry<String, String> entry : budgetIdCodeMap.entrySet()) {
			txfpsxryfyEntity.set(entry.getValue(), financialStatementsMap.get("人工和用工成本（不含研发）_退休返聘实习人员费用").getBigDecimal(entry.getValue()));
		}

		// 派遣人员薪酬
		Entity pqryxcEntity = new Entity();
		pqryxcEntity.set("serial_number", "3").set("id", "派遣人员薪酬").set("name", "三、派遣人员薪酬").set("parent", "-1")
				.set("total_amount", financialStatementsMap.get("人工和用工成本（不含研发）_派遣人员薪酬").getBigDecimal("total_amount"));
		for (Map.Entry<String, String> entry : budgetIdCodeMap.entrySet()) {
			pqryxcEntity.set(entry.getValue(), financialStatementsMap.get("人工和用工成本（不含研发）_派遣人员薪酬").getBigDecimal(entry.getValue()));
		}

		// 合作单位费用（无内部交易）
		Entity hzdwfyEntity = new Entity();
		hzdwfyEntity.set("serial_number", "4").set("id", "合作单位费用（无内部交易）").set("name", "四、合作单位费用（无内部交易）").set("parent", "-1")
				.set("total_amount", financialStatementsMap.get("人工和用工成本（不含研发）_合作单位费用（无内部交易）").getBigDecimal("total_amount"));
		for (Map.Entry<String, String> entry : budgetIdCodeMap.entrySet()) {
			hzdwfyEntity.set(entry.getValue(), financialStatementsMap.get("人工和用工成本（不含研发）_合作单位费用（无内部交易）").getBigDecimal(entry.getValue()));
		}

		// 海工爆破等合作费用
		Entity hgbpdhzfyEntity = new Entity();
		hgbpdhzfyEntity.set("serial_number", "5").set("id", "海工爆破等合作费用").set("name", "五、海工爆破等合作费用").set("parent", "-1")
				.set("total_amount", financialStatementsMap.get("人工和用工成本（不含研发）_海工爆破等合作费用").getBigDecimal("total_amount"));
		for (Map.Entry<String, String> entry : budgetIdCodeMap.entrySet()) {
			hgbpdhzfyEntity.set(entry.getValue(), financialStatementsMap.get("人工和用工成本（不含研发）_海工爆破等合作费用").getBigDecimal(entry.getValue()));
		}

		// 平均人工成本：在职
		Entity pjrgcbzzEntity = new Entity();
		pjrgcbzzEntity.set("serial_number", "6").set("id", "平均人工成本：在职").set("name", "六、平均人工成本：在职").set("parent", "-1");
		if (personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均在职人数").getBigDecimal("total_amount").compareTo(BigDecimal.ZERO) == 0) {
			pjrgcbzzEntity.set("total_amount", BigDecimal.ZERO);
		} else {
			pjrgcbzzEntity.set("total_amount", NumberUtil.div(zzryrgcbEntity.getBigDecimal("total_amount"), personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均在职人数").getBigDecimal("total_amount"), 2));
		}
		for (Map.Entry<String, String> entry : budgetIdCodeMap.entrySet()) {
			if (personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均在职人数").getBigDecimal(entry.getValue()).compareTo(BigDecimal.ZERO) == 0) {
				pjrgcbzzEntity.set(entry.getValue(), BigDecimal.ZERO);
			} else {
				pjrgcbzzEntity.set(entry.getValue(),
						NumberUtil.div(zzryrgcbEntity.getBigDecimal(entry.getValue()), personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均在职人数").getBigDecimal(entry.getValue()), 2));
			}
		}

		// 平均人工成本：退休返聘
		Entity pjrgcbtxfpEntity = new Entity();
		pjrgcbtxfpEntity.set("serial_number", "7").set("id", "平均人工成本：退休返聘").set("name", "七、平均人工成本：退休返聘").set("parent", "-1");
		if (personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均返聘人数").getBigDecimal("total_amount").compareTo(BigDecimal.ZERO) == 0) {
			pjrgcbtxfpEntity.set("total_amount", BigDecimal.ZERO);
		} else {
			pjrgcbtxfpEntity.set("total_amount",
					NumberUtil.div(txfpsxryfyEntity.getBigDecimal("total_amount"), personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均返聘人数").getBigDecimal("total_amount"), 2));
		}
		for (Map.Entry<String, String> entry : budgetIdCodeMap.entrySet()) {
			if (personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均返聘人数").getBigDecimal(entry.getValue()).compareTo(BigDecimal.ZERO) == 0) {
				pjrgcbtxfpEntity.set(entry.getValue(), BigDecimal.ZERO);
			} else {
				pjrgcbtxfpEntity.set(entry.getValue(),
						NumberUtil.div(txfpsxryfyEntity.getBigDecimal(entry.getValue()), personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均返聘人数").getBigDecimal(entry.getValue()), 2));
			}
		}

		// 平均人工成本：派遣
		Entity pjrgcbpqEntity = new Entity();
		pjrgcbpqEntity.set("serial_number", "8").set("id", "平均人工成本：派遣").set("name", "八、平均人工成本：派遣").set("parent", "-1");
		if (personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均劳务派遣").getBigDecimal("total_amount").compareTo(BigDecimal.ZERO) == 0) {
			pjrgcbpqEntity.set("total_amount", BigDecimal.ZERO);
		} else {
			pjrgcbpqEntity.set("total_amount", NumberUtil.div(pqryxcEntity.getBigDecimal("total_amount"), personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均劳务派遣").getBigDecimal("total_amount"), 2));
		}
		for (Map.Entry<String, String> entry : budgetIdCodeMap.entrySet()) {
			if (personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均劳务派遣").getBigDecimal(entry.getValue()).compareTo(BigDecimal.ZERO) == 0) {
				pjrgcbpqEntity.set(entry.getValue(), BigDecimal.ZERO);
			} else {
				pjrgcbpqEntity.set(entry.getValue(),
						NumberUtil.div(pqryxcEntity.getBigDecimal(entry.getValue()), personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均劳务派遣").getBigDecimal(entry.getValue()), 2));
			}
		}

		// 平均人工成本：合作
		Entity pjrgcbhzEntity = new Entity();
		pjrgcbhzEntity.set("serial_number", "9").set("id", "平均人工成本：合作").set("name", "九、平均人工成本：合作").set("parent", "-1");
		if (personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均合作人数").getBigDecimal("total_amount").compareTo(BigDecimal.ZERO) == 0) {
			pjrgcbhzEntity.set("total_amount", BigDecimal.ZERO);
		} else {
			pjrgcbhzEntity.set("total_amount", NumberUtil.div(hzdwfyEntity.getBigDecimal("total_amount"), personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均合作人数").getBigDecimal("total_amount"), 2));
		}
		for (Map.Entry<String, String> entry : budgetIdCodeMap.entrySet()) {
			if (personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均合作人数").getBigDecimal(entry.getValue()).compareTo(BigDecimal.ZERO) == 0) {
				pjrgcbhzEntity.set(entry.getValue(), BigDecimal.ZERO);
			} else {
				pjrgcbhzEntity.set(entry.getValue(),
						NumberUtil.div(hzdwfyEntity.getBigDecimal(entry.getValue()), personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均合作人数").getBigDecimal(entry.getValue()), 2));
			}
		}

		// 平均人工成本：海工爆破
		Entity pjrgcbhgbpEntity = new Entity();
		pjrgcbhgbpEntity.set("serial_number", "10").set("id", "平均人工成本：海工爆破").set("name", "十、平均人工成本：海工爆破").set("parent", "-1");
		if (personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均海工爆破").getBigDecimal("total_amount").compareTo(BigDecimal.ZERO) == 0) {
			pjrgcbhgbpEntity.set("total_amount", BigDecimal.ZERO);
		} else {
			pjrgcbhgbpEntity.set("total_amount",
					NumberUtil.div(hgbpdhzfyEntity.getBigDecimal("total_amount"), personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均海工爆破").getBigDecimal("total_amount"), 2));
		}
		for (Map.Entry<String, String> entry : budgetIdCodeMap.entrySet()) {
			if (personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均海工爆破").getBigDecimal(entry.getValue()).compareTo(BigDecimal.ZERO) == 0) {
				pjrgcbhgbpEntity.set(entry.getValue(), BigDecimal.ZERO);
			} else {
				pjrgcbhgbpEntity.set(entry.getValue(),
						NumberUtil.div(hgbpdhzfyEntity.getBigDecimal(entry.getValue()), personnelAndPerCapitaSituationMap.get("平均从业人员人数_平均海工爆破").getBigDecimal(entry.getValue()), 2));
			}
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
	private List<Entity> buildLaborProductivity(List<Entity> financialStatements, List<Entity> fullAperture, List<Entity> personnelAndPerCapitaSituation, Session dbSession, String budgetMainIds,
			Map<String, String> budgetIdCodeMap) throws Exception {
		List<Entity> laborProductivityList = new ArrayList<Entity>();
		Map<String, Entity> financialStatementsMap = financialStatements.stream().collect(
				Collectors.toMap(entity -> entity.getStr("parent") + "_" + entity.getStr("name"), Function.identity(), (existing, replacement) -> existing));
		Map<String, Entity> fullApertureMap = fullAperture.stream().collect(
				Collectors.toMap(entity -> entity.getStr("parent") + "_" + entity.getStr("name"), Function.identity(), (existing, replacement) -> existing));
		Map<String, Entity> personnelAndPerCapitaSituationMap = personnelAndPerCapitaSituation.stream().collect(
				Collectors.toMap(entity -> entity.getStr("parent") + "_" + entity.getStr("name"), Function.identity(), (existing, replacement) -> existing));

		// 折旧
		Entity zjEntity = new Entity();
		zjEntity.set("serial_number", "2.1").set("id", "折旧").set("name", "折旧").set("parent", "劳动生产总值（增加值）")
				.set("total_amount", NumberUtil.add(financialStatementsMap.get("生产运营-费用_折旧").getBigDecimal("total_amount"), financialStatementsMap.get("生产运营-成本_折旧").getBigDecimal("total_amount")));
		for (Map.Entry<String, String> entry : budgetIdCodeMap.entrySet()) {
			zjEntity.set(entry.getValue(),
					NumberUtil.add(financialStatementsMap.get("生产运营-费用_折旧").getBigDecimal(entry.getValue()), financialStatementsMap.get("生产运营-成本_折旧").getBigDecimal(entry.getValue())));
		}

		// 劳动者报酬
		Entity ldzbcEntity = new Entity();
		ldzbcEntity
				.set("serial_number", "2.2")
				.set("id", "劳动者报酬")
				.set("name", "劳动者报酬")
				.set("parent", "劳动生产总值（增加值）")
				.set("total_amount",
						NumberUtil.add(fullApertureMap.get("-1_一、在职人员人工成本").getBigDecimal("total_amount"), fullApertureMap.get("-1_二、退休返聘实习人员费用").getBigDecimal("total_amount"),
								fullApertureMap.get("-1_三、派遣人员薪酬").getBigDecimal("total_amount")));
		for (Map.Entry<String, String> entry : budgetIdCodeMap.entrySet()) {
			ldzbcEntity.set(
					entry.getValue(),
					NumberUtil.add(fullApertureMap.get("-1_一、在职人员人工成本").getBigDecimal(entry.getValue()), fullApertureMap.get("-1_二、退休返聘实习人员费用").getBigDecimal(entry.getValue()),
							fullApertureMap.get("-1_三、派遣人员薪酬").getBigDecimal(entry.getValue())));
		}

		// 盈余
		Entity yyEntity = new Entity();
		yyEntity.set("serial_number", "2.3").set("id", "盈余").set("name", "盈余").set("parent", "劳动生产总值（增加值）").set("total_amount", financialStatementsMap.get("-1_六、利润总额").getBigDecimal("total_amount"));
		for (Map.Entry<String, String> entry : budgetIdCodeMap.entrySet()) {
			yyEntity.set(entry.getValue(), financialStatementsMap.get("-1_六、利润总额").getBigDecimal(entry.getValue()));
		}

		// 生产税净额
		String queryScsjeSql = "SELECT * FROM zh_caiwu_budget_filling_productivity WHERE labor_name = '生产税净额' AND budget_main_id IN  (" + budgetMainIds + ")";
		List<Entity> scsjeDataList = dbSession.query(queryScsjeSql);
		Entity scsjeZtEntity = this.groupToEntity(scsjeDataList, budgetIdCodeMap, "budget_main_id", "total_amount");
		Entity scsjeEntity = new Entity();
		scsjeEntity.set("serial_number", "2.4").set("id", "生产税净额").set("name", "生产税净额").set("parent", "劳动生产总值（增加值）").set("total_amount", scsjeZtEntity.getBigDecimal("total_amount"));
		for (Map.Entry<String, String> entry : budgetIdCodeMap.entrySet()) {
			scsjeEntity.set(entry.getValue(), scsjeZtEntity.getBigDecimal(entry.getValue()));
		}

		// 劳动生产总值（增加值）
		Entity ldsczzEntity = new Entity();
		ldsczzEntity
				.set("serial_number", "2")
				.set("id", "劳动生产总值（增加值）")
				.set("name", "二、劳动生产总值（增加值）")
				.set("parent", "-1")
				.set("total_amount",
						NumberUtil.add(zjEntity.getBigDecimal("total_amount"), ldzbcEntity.getBigDecimal("total_amount"), yyEntity.getBigDecimal("total_amount"),
								scsjeEntity.getBigDecimal("total_amount")));
		for (Map.Entry<String, String> entry : budgetIdCodeMap.entrySet()) {
			ldsczzEntity.set(
					entry.getValue(),
					NumberUtil.add(zjEntity.getBigDecimal(entry.getValue()), ldzbcEntity.getBigDecimal(entry.getValue()), yyEntity.getBigDecimal(entry.getValue()),
							scsjeEntity.getBigDecimal(entry.getValue())));
		}

		// 公司生产税净额总数
		String queryGsscsjezsSql = "SELECT * FROM zh_caiwu_budget_filling_productivity WHERE labor_name = '公司生产税净额总数' AND budget_main_id IN  (" + budgetMainIds + ")";
		List<Entity> gsscsjezsDataList = dbSession.query(queryGsscsjezsSql);
		Entity gsscsjezsZtentity = this.groupToEntity(gsscsjezsDataList, budgetIdCodeMap, "budget_main_id", "total_amount");
		Entity gsscsjezsEntity = new Entity();
		gsscsjezsEntity.set("serial_number", "2.4.1").set("id", "公司生产税净额总数").set("name", "公司生产税净额总数").set("parent", "生产税净额").set("total_amount", gsscsjezsZtentity.getBigDecimal("total_amount"));
		for (Map.Entry<String, String> entry : budgetIdCodeMap.entrySet()) {
			gsscsjezsEntity.set(entry.getValue(), gsscsjezsZtentity.getBigDecimal(entry.getValue()));
		}

		// 收入占比
		Entity srzbEntity = new Entity();
		srzbEntity.set("serial_number", "2.4.2").set("id", "收入占比").set("name", "收入占比").set("parent", scsjeEntity.getStr("id")).set("total_amount", BigDecimal.ZERO);
		if (financialStatementsMap.get("-1_一、总收入").getBigDecimal("total_amount").compareTo(BigDecimal.ZERO) != 0) {
			srzbEntity.set("total_amount",
					NumberUtil.div(financialStatementsMap.get("-1_一、总收入").getBigDecimal("total_amount"), financialStatementsMap.get("-1_一、总收入").getBigDecimal("total_amount"), 2));
		}
		for (Map.Entry<String, String> entry : budgetIdCodeMap.entrySet()) {
			if (financialStatementsMap.get("-1_一、总收入").getBigDecimal("total_amount").compareTo(BigDecimal.ZERO) != 0) {
				srzbEntity.set(entry.getValue(),
						NumberUtil.div(financialStatementsMap.get("-1_一、总收入").getBigDecimal(entry.getValue()), financialStatementsMap.get("-1_一、总收入").getBigDecimal("total_amount"), 2));
			} else {
				srzbEntity.set(entry.getValue(), BigDecimal.ZERO);
			}
		}

		// 平均从业人员人数
		Entity pjryryrsEntity = new Entity();
		pjryryrsEntity.set("serial_number", "3").set("id", "平均从业人员人数").set("name", "三、平均从业人员人数").set("parent", "-1")
				.set("total_amount", personnelAndPerCapitaSituationMap.get("-1_一、平均从业人员人数").getBigDecimal("total_amount"));
		for (Map.Entry<String, String> entry : budgetIdCodeMap.entrySet()) {
			pjryryrsEntity.set(entry.getValue(), personnelAndPerCapitaSituationMap.get("-1_一、平均从业人员人数").getBigDecimal(entry.getValue()));
		}

		// 劳动生产率
		Entity ldsclEntity = new Entity();
		ldsclEntity.set("serial_number", "1").set("id", "劳动生产率").set("name", "一、劳动生产率").set("parent", "-1");
		if (pjryryrsEntity.getBigDecimal("total_amount").compareTo(BigDecimal.ZERO) == 0) {
			ldsclEntity.set("total_amount", BigDecimal.ZERO);
		} else {
			ldsclEntity.set("total_amount", NumberUtil.div(ldsczzEntity.getBigDecimal("total_amount"), pjryryrsEntity.getBigDecimal("total_amount"), 2));
		}
		for (Map.Entry<String, String> entry : budgetIdCodeMap.entrySet()) {
			if (pjryryrsEntity.getBigDecimal(entry.getValue()).compareTo(BigDecimal.ZERO) == 0) {
				ldsclEntity.set(entry.getValue(), BigDecimal.ZERO);
			} else {
				ldsclEntity.set(entry.getValue(), NumberUtil.div(ldsczzEntity.getBigDecimal(entry.getValue()), pjryryrsEntity.getBigDecimal(entry.getValue()), 2));
			}
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

	// 分组合并(行转列)
	private Entity groupToEntity(List<Entity> entities, Map<String, String> budgetIdCodeMap, String groupField, String sumField) {
		Entity result = new Entity();
		BigDecimal total = BigDecimal.ZERO;
		Map<String, List<Entity>> groupedMap = entities.stream().collect(Collectors.groupingBy(entity -> entity.getStr(groupField), TreeMap::new, Collectors.toList()));
		for (Map.Entry<String, String> entry : budgetIdCodeMap.entrySet()) {
			if (groupedMap.containsKey(entry.getKey())) {
				List<Entity> entityList = groupedMap.get(entry.getKey());
				for (Entity entity : entityList) {
					if (result.getBigDecimal(entry.getValue()) == null) {
						result.set(entry.getValue(), BigDecimal.ZERO);
					}
					result.set(entry.getValue(), NumberUtil.add(result.getBigDecimal(entry.getValue()), entity.getBigDecimal(sumField)));
				}
			} else {
				result.set(entry.getValue(), BigDecimal.ZERO);
			}
			total = NumberUtil.add(total, result.getBigDecimal(entry.getValue()));
		}
		result.set("total_amount", total);
		return result;
	}

	// 汇总指定字段
	private BigDecimal sumBigDecimalAmount(List<Entity> entities, String fieldName) {
		return null;
	}

	// 重新排序
	private Map<String, List<Entity>> sortMapByFirstEntitySorting(Map<String, List<Entity>> groupedMap) {
		if (groupedMap == null || groupedMap.isEmpty()) {
			return new LinkedHashMap<>();
		}
		// 对原Map的entry进行排序，然后收集到LinkedHashMap中
		return groupedMap.entrySet().stream().sorted((entry1, entry2) -> {
			int sorting1 = entry1.getValue().get(0).getInt("sorting");
			int sorting2 = entry2.getValue().get(0).getInt("sorting");
			return Integer.compare(sorting1, sorting2);
		}).collect(Collectors.toMap(Map.Entry::getKey, Map.Entry::getValue, (oldValue, newValue) -> oldValue, LinkedHashMap::new));
	}

}
