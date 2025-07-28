package com.zhonghe.ame.finance;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import cn.hutool.core.util.NumberUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.db.Entity;
import cn.hutool.db.Session;

import com.eos.common.connection.DataSourceHelper;
import com.eos.system.annotation.Bizlet;

@Bizlet("填报数据工具类")
public class FillingDataUtil {

	@Bizlet("获取需要填报的数据")
	public List<Entity> getFillingDatas(String budgetMainId) throws Exception {
		List<Entity> result = new ArrayList<Entity>();
		Session dbSession = new Session(DataSourceHelper.getDataSource());
		List<Entity> totalRevenueList = this.buildFillingIncome(dbSession, budgetMainId);
		List<Entity> totalCostList = this.buildFillingLedger(dbSession, budgetMainId);
		Entity grossProfitMargin = this.buildGrossProfitMargin(totalRevenueList, totalCostList);
		List<Entity> apportionmentAndOtherList = this.buildApportionmentAndOther(dbSession, budgetMainId);
		Entity totalProfit = this.buildTotalProfit(grossProfitMargin, apportionmentAndOtherList);
		result.addAll(totalRevenueList);
		result.addAll(totalCostList);
		result.add(grossProfitMargin);
		result.addAll(apportionmentAndOtherList);
		result.add(totalProfit);
		return result;
	}

	// 报表总收入部分数据构建
	private List<Entity> buildFillingIncome(Session dbSession, String budgetMainId) throws Exception {
		List<Entity> totalRevenueList = new ArrayList<Entity>();
		String querySql = "SELECT *, income_name AS name, '总收入' AS parent, '1' AS editable FROM zh_caiwu_budget_filling_income WHERE budget_main_id = ?";
		Entity totalRevenue = new Entity();
		totalRevenue.set("id", "总收入").set("name", "一、总收入").set("parent", "-1").set("editable", "0").set("jan_amount", BigDecimal.ZERO).set("feb_amount", BigDecimal.ZERO)
				.set("mar_amount", BigDecimal.ZERO).set("apr_amount", BigDecimal.ZERO).set("may_amount", BigDecimal.ZERO).set("jun_amount", BigDecimal.ZERO).set("jul_amount", BigDecimal.ZERO)
				.set("aug_amount", BigDecimal.ZERO).set("sep_amount", BigDecimal.ZERO).set("oct_amount", BigDecimal.ZERO).set("nov_amount", BigDecimal.ZERO).set("dec_amount", BigDecimal.ZERO)
				.set("total_amount", BigDecimal.ZERO);
		List<Entity> incomeList = dbSession.query(querySql, budgetMainId);
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
		totalCost.set("id", "totalCost").set("name", "二、总成本").set("parent", "-1").set("editable", "0").set("jan_amount", BigDecimal.ZERO).set("feb_amount", BigDecimal.ZERO)
				.set("mar_amount", BigDecimal.ZERO).set("apr_amount", BigDecimal.ZERO).set("may_amount", BigDecimal.ZERO).set("jun_amount", BigDecimal.ZERO).set("jul_amount", BigDecimal.ZERO)
				.set("aug_amount", BigDecimal.ZERO).set("sep_amount", BigDecimal.ZERO).set("oct_amount", BigDecimal.ZERO).set("nov_amount", BigDecimal.ZERO).set("dec_amount", BigDecimal.ZERO)
				.set("total_amount", BigDecimal.ZERO);
		totalCostList.add(totalCost);

		List<Entity> kmClassRevenueList = new ArrayList<Entity>();
		for (Entity kmClass : kmClassList) {
			Entity kmClassRevenue = new Entity();
			kmClassRevenue.set("id", kmClass.getStr("DICTNAME")).set("name", kmClass.getStr("DICTNAME")).set("parent", "totalCost").set("editable", "0").set("jan_amount", BigDecimal.ZERO)
					.set("feb_amount", BigDecimal.ZERO).set("mar_amount", BigDecimal.ZERO).set("apr_amount", BigDecimal.ZERO).set("may_amount", BigDecimal.ZERO).set("jun_amount", BigDecimal.ZERO)
					.set("jul_amount", BigDecimal.ZERO).set("aug_amount", BigDecimal.ZERO).set("sep_amount", BigDecimal.ZERO).set("oct_amount", BigDecimal.ZERO).set("nov_amount", BigDecimal.ZERO)
					.set("dec_amount", BigDecimal.ZERO).set("total_amount", BigDecimal.ZERO);

			String parentStr = StrUtil.format("'{}' AS parent", kmClass.getStr("DICTNAME"));
			String querySql = "SELECT zcbfl.*, zcla.name, '1' AS editable, "
					+ parentStr
					+ " FROM zh_caiwu_budget_filling_ledger AS zcbfl, zh_caiwu_ledger_account AS zcla WHERE zcbfl.budget_main_id = ? AND zcbfl.budget_category = ? AND zcbfl.ledger_account_id = zcla.id ORDER BY zcla.sorting ASC";
			List<Entity> ledgerList = dbSession.query(querySql, budgetMainId, kmClass.getStr("DICTID"));

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
		grossProfitMargin.set("id", "毛利率").set("name", "三、毛利率").set("parent", "-1").set("editable", "0")
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
	private List<Entity> buildApportionmentAndOther(Session dbSession, String budgetMainId) throws Exception {
		String querySql = "SELECT *, margin_name AS name, '-1' AS parent, '1' AS editable FROM zh_caiwu_budget_filling_margin WHERE budget_main_id = ?";
		List<Entity> apportionmentAndOtherList = dbSession.query(querySql, budgetMainId);
		return apportionmentAndOtherList;
	}

	// 报表利润总额数据构建
	private Entity buildTotalProfit(Entity grossProfitMargin, List<Entity> apportionmentAndOtherList) throws Exception {
		Entity apportionment = apportionmentAndOtherList.get(0);
		Entity other = apportionmentAndOtherList.get(1);
		Entity totalProfit = new Entity();
		totalProfit.set("id", "利润总额").set("name", "六、利润总额").set("parent", "-1").set("editable", "0")
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

}
