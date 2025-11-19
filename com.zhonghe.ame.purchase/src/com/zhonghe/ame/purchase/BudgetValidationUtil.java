package com.zhonghe.ame.purchase;

import java.math.BigDecimal;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.stream.Collectors;

import cn.hutool.core.lang.Dict;
import cn.hutool.core.util.NumberUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.db.Entity;
import cn.hutool.db.Session;

import com.eos.common.connection.DataSourceHelper;
import com.eos.system.annotation.Bizlet;

@Bizlet("预算核算工具类")
public class BudgetValidationUtil {

	private String queryPurPlanItemSql = "SELECT zppi.PLAN_ID, zppi.year_budget_amount, zppi.budget_account, zppi.ledger_category, zppi.ledger_name FROM zh_purchase_plan_item AS zppi, zh_purchase_plan zpp WHERE zppi.PLAN_ID = zpp.id AND zpp.EXTEND2 = '0' AND (zpp.status = '1' OR zpp.status = '2') AND zpp.need_org_id = ? AND zpp.YEAR = ?";

	private String queryAssetsSql = "SELECT clazz, total FROM zh_caiwu_assets WHERE YEAR(proc_time) = ? AND secondary_org = ? ";

	private String queryCaiwuSql = "SELECT total_amount FROM zh_caiwu_budget_filling_ledger AS zcbfl, zh_caiwu_budget_filling_main AS zcbfm WHERE zcbfl.budget_main_id = zcbfm.id AND zcbfm.budget_year = ? AND zcbfm.budget_account_id = ? AND zcbfl.budget_category = ? AND zcbfl.ledger_account_id = ?";

	private String queryTaxRateSql = "SELECT id, tax_rate FROM zh_caiwu_ledger_account";

	@Bizlet("核算并返回结果")
	public String budgetValidation(Entity purPlan, Entity[] purPlanItem) throws Exception {
		String resultStr = "";
		Session dbSession = new Session(DataSourceHelper.getDataSource());
		Map<String, BigDecimal> taxRateMapData = this.gettaxRateMap(dbSession);
		Map<String, BigDecimal> validateMapData = this.groupItem(purPlanItem);
		Map<String, BigDecimal> alreadyMapData = this.thereIsAlsoDataInTheDatabase(purPlan.getStr("id"), purPlan.getStr("year"), purPlan.getStr("needOrgId"), dbSession);
		Map<String, BigDecimal> validateAssetsMapData = this.groupItemLongTermAssets(purPlanItem);
		Map<String, BigDecimal> alreadyAssetsMapData = this.thereIsAlsoDataInTheAssetsDatabase(purPlan.getStr("id"), purPlan.getStr("year"), purPlan.getStr("needOrgId"), dbSession);
		Map<String, BigDecimal> assetsMapData = this.longTermAssets(purPlan.getStr("year"), purPlan.getStr("needOrgId"), dbSession);
		for (Entry<String, BigDecimal> entry : validateMapData.entrySet()) {
			String key = entry.getKey();
			BigDecimal b1 = entry.getValue();
			BigDecimal b2 = BigDecimal.ZERO;
			if (alreadyMapData.containsKey(key)) {
				b2 = alreadyMapData.get(key);
			}
			BigDecimal sourceBigDecimal = NumberUtil.mul(NumberUtil.add(b1, b2), 10000);
			String str = this.compare(key, purPlan.getStr("year"), sourceBigDecimal, dbSession, taxRateMapData);
			if (StrUtil.isNotBlank(str)) {
				resultStr = resultStr + str + "<br>";
			}
		}
		for (Entry<String, BigDecimal> entry : validateAssetsMapData.entrySet()) {
			String key = entry.getKey();
			BigDecimal b1 = entry.getValue();
			BigDecimal b2 = BigDecimal.ZERO;
			if (alreadyAssetsMapData.containsKey(key)) {
				b2 = alreadyMapData.get(key);
			}
			BigDecimal sourceBigDecimal = NumberUtil.mul(NumberUtil.add(b1, b2), 10000);
			String str = this.compareAssets(key, sourceBigDecimal, assetsMapData, taxRateMapData);
			if (StrUtil.isNotBlank(str)) {
				resultStr = resultStr + str + "<br>";
			}
		}
		return resultStr;
	}

	// 获取数据库中已有数据(分组及汇总,去掉科目分类为长期资产的)
	private Map<String, BigDecimal> thereIsAlsoDataInTheDatabase(String planId, String year, String secOrg, Session dbSession) throws Exception {
		Map<String, BigDecimal> mapData = new HashMap<String, BigDecimal>();
		List<Entity> existingDatas = dbSession.query(queryPurPlanItemSql, secOrg, year);
		if (existingDatas != null && existingDatas.size() > 0) {
			if (StrUtil.isNotBlank(planId)) {
				existingDatas = existingDatas.stream().filter(entity -> !entity.getStr("PLAN_ID").equals(planId)).collect(Collectors.toList());
			}
		}
		if (existingDatas != null && existingDatas.size() > 0) {
			mapData = existingDatas
					.stream()
					.filter(entity -> !"10".equals(entity.getStr("ledger_category")))
					.collect(
							Collectors.groupingBy(entity -> entity.getStr("budget_account") + "_" + entity.getStr("ledger_category") + "_" + entity.getStr("ledger_name"),
									Collectors.reducing(BigDecimal.ZERO, entity -> ((Entity) entity).getBigDecimal("year_budget_amount"), BigDecimal::add)));
		}
		return mapData;
	}

	// 效验数据分组(分组及汇总,去掉科目分类为长期资产的)
	private Map<String, BigDecimal> groupItem(Entity[] purPlanItem) {
		Map<String, BigDecimal> mapData = new HashMap<String, BigDecimal>();
		mapData = Arrays
				.asList(purPlanItem)
				.stream()
				.filter(entity -> !"10".equals(entity.getStr("ledgerCategory")))
				.collect(
						Collectors.groupingBy(entity -> entity.getStr("budgetAccount") + "_" + entity.getStr("ledgerCategory") + "_" + entity.getStr("ledgerName"),
								Collectors.reducing(BigDecimal.ZERO, entity -> ((Entity) entity).getBigDecimal("yearBudgetAmount"), BigDecimal::add)));
		return mapData;
	}

	// 长期资产模块数据 - 分组
	private Map<String, BigDecimal> longTermAssets(String year, String secOrg, Session dbSession) throws Exception {
		Map<String, BigDecimal> mapData = new HashMap<String, BigDecimal>();
		List<Entity> entityList = dbSession.query(queryAssetsSql, year, secOrg);
		if (entityList != null && entityList.size() > 0) {
			mapData = entityList.stream().collect(
					Collectors.groupingBy(entity -> entity.getStr("clazz"), Collectors.reducing(BigDecimal.ZERO, entity -> ((Entity) entity).getBigDecimal("total"), BigDecimal::add)));
		}
		return mapData;
	}

	// 获取数据库中已有数据 - 长期资产分组汇总
	private Map<String, BigDecimal> thereIsAlsoDataInTheAssetsDatabase(String planId, String year, String secOrg, Session dbSession) throws Exception {
		Map<String, BigDecimal> mapData = new HashMap<String, BigDecimal>();
		List<Entity> existingDatas = dbSession.query(queryPurPlanItemSql, secOrg, year);
		if (existingDatas != null && existingDatas.size() > 0) {
			if (StrUtil.isNotBlank(planId)) {
				existingDatas = existingDatas.stream().filter(entity -> !entity.getStr("PLAN_ID").equals(planId)).collect(Collectors.toList());
			}
		}
		if (existingDatas != null && existingDatas.size() > 0) {
			mapData = existingDatas
					.stream()
					.filter(entity -> "10".equals(entity.getStr("ledger_category")))
					.collect(
							Collectors.groupingBy(entity -> entity.getStr("ledger_name"),
									Collectors.reducing(BigDecimal.ZERO, entity -> ((Entity) entity).getBigDecimal("year_budget_amount"), BigDecimal::add)));
		}
		return mapData;
	}

	// 效验数据 - 长期资产分组
	private Map<String, BigDecimal> groupItemLongTermAssets(Entity[] purPlanItem) {
		Map<String, BigDecimal> mapData = new HashMap<String, BigDecimal>();
		mapData = Arrays
				.asList(purPlanItem)
				.stream()
				.filter(entity -> "10".equals(entity.getStr("ledgerCategory")))
				.collect(
						Collectors.groupingBy(entity -> entity.getStr("ledgerName"),
								Collectors.reducing(BigDecimal.ZERO, entity -> ((Entity) entity).getBigDecimal("yearBudgetAmount"), BigDecimal::add)));
		return mapData;
	}

	// 比较是否超过预算
	private String compare(String key, String year, BigDecimal sourceBigDecimal, Session dbSession, Map<String, BigDecimal> taxRateMapData) throws Exception {
		List<String> strList = StrUtil.split(key, "_");
		Entity entity = new Entity().set("total_amount", BigDecimal.ZERO);
		entity = dbSession.queryOne(queryCaiwuSql, year, strList.get(0), strList.get(1), strList.get(2));
		BigDecimal taxIncludedTotalAmount = NumberUtil.mul(NumberUtil.add(1, taxRateMapData.get(strList.get(2))), entity.getBigDecimal("total_amount"));
		if (NumberUtil.isGreater(sourceBigDecimal, taxIncludedTotalAmount)) {
			String querySqlOne = "SELECT name FROM zh_caiwu_budget_account WHERE id = ?";
			String querySqlTwo = "SELECT DICTNAME AS name FROM EOS_DICT_ENTRY WHERE DICTTYPEID = 'CW_KM_CLASS' AND DICTID = ?";
			String querySqlThree = "SELECT name FROM zh_caiwu_ledger_account WHERE id = ?";
			Entity budgetAccount = dbSession.queryOne(querySqlOne, strList.get(0));
			Entity ledgerCategory = dbSession.queryOne(querySqlTwo, strList.get(1));
			Entity ledgerName = dbSession.queryOne(querySqlThree, strList.get(2));
			return StrUtil.format("【{}】-【{}】-【{}】的总金额【{}元】超过了财务预算金额(含税)【{}元】", budgetAccount.getStr("name"), ledgerCategory.getStr("name"), ledgerName.getStr("name"),
					NumberUtil.decimalFormat(",###", sourceBigDecimal), NumberUtil.decimalFormat(",###", taxIncludedTotalAmount));
		} else {
			return "";
		}
	}

	// 比较是否超过预算
	private String compareAssets(String key, BigDecimal sourceBigDecimal, Map<String, BigDecimal> assetsMapData, Map<String, BigDecimal> taxRateMapData) throws Exception {
		BigDecimal targetBigDecimal = BigDecimal.ZERO;
		if (assetsMapData.containsKey(key)) {
			targetBigDecimal = assetsMapData.get(key);
			targetBigDecimal = NumberUtil.mul(NumberUtil.add(1, taxRateMapData.get(key)), targetBigDecimal);
		}
		if (NumberUtil.isGreater(sourceBigDecimal, targetBigDecimal)) {
			return StrUtil.format("【{}】的总金额【{}元】超过了长期资产【{}】的总预算金额(含税)【{}元】", key, NumberUtil.decimalFormat(",###", sourceBigDecimal), key, NumberUtil.decimalFormat(",###", targetBigDecimal));
		} else {
			return "";
		}
	}

	// 获取财务科目税率
	private Map<String, BigDecimal> gettaxRateMap(Session dbSession) throws Exception {
		List<Entity> entityList = dbSession.query(queryTaxRateSql);
		Map<String, BigDecimal> mapData = entityList.stream().collect(Collectors.toMap(entity -> entity.getStr("id"), entity -> entity.getBigDecimal("tax_rate")));
		mapData.put("固定资产", new BigDecimal(0.13));
		mapData.put("大额装修", new BigDecimal(0.09));
		mapData.put("无形资产", new BigDecimal(0.13));
		return mapData;
	}

}
