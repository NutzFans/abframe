package com.zhonghe.ame.finance;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import cn.hutool.core.date.DateTime;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.IdUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.db.Entity;
import cn.hutool.db.Session;

import com.eos.common.connection.DataSourceHelper;
import com.eos.system.annotation.Bizlet;

@Bizlet("预算填报工具类")
public class BudgetFillingUtil {

	@Bizlet("生成预算填报数据")
	public void generateBudgetFilling(String budgetAccounts, String year, String createName) throws Exception {
		Session dbSession = new Session(DataSourceHelper.getDataSource());
		List<Entity> budgetAccountList = this.getBudgetAccountList(dbSession, budgetAccounts);
		List<Entity> ledgerAccountList = this.getLedgerAccountList(dbSession);
		List<Entity> budgetFillingMainList = new ArrayList<Entity>();
		List<Entity> budgetFillingIncomeList = new ArrayList<Entity>();
		List<Entity> budgetFillingMarginList = new ArrayList<Entity>();
		List<Entity> budgetFillingLedgerList = new ArrayList<Entity>();
		List<Entity> budgetFillingPersonnelList = new ArrayList<Entity>();
		List<Entity> budgetFillingProductivityList = new ArrayList<Entity>();
		for (Entity budgetAccount : budgetAccountList) {
			Entity budgetFillingMain = this.buildBudgetFillingMain(budgetAccount, year, createName);
			budgetFillingMainList.add(budgetFillingMain);

			Entity budgetFillingIncomeJTN = this.buildBudgetFillingIncome(budgetFillingMain, "集团内", createName);
			budgetFillingIncomeList.add(budgetFillingIncomeJTN);
			Entity budgetFillingIncomeJTW = this.buildBudgetFillingIncome(budgetFillingMain, "集团外", createName);
			budgetFillingIncomeList.add(budgetFillingIncomeJTW);

			Entity budgetFillingMarginFT = this.buildBudgetFillingMargin(budgetFillingMain, "四、总部管理费分摊", createName);
			budgetFillingMarginList.add(budgetFillingMarginFT);
			Entity budgetFillingMarginQT = this.buildBudgetFillingMargin(budgetFillingMain, "五、其他", createName);

			budgetFillingMarginList.add(budgetFillingMarginQT);
			for (Entity ledgerAccount : ledgerAccountList) {
				List<String> budgetCategoryList = StrUtil.split(ledgerAccount.getStr("category"), ",");
				for (String budgetCategory : budgetCategoryList) {
					Entity budgetFillingLedger = this.buildBudgetFillingLedger(budgetFillingMain.getStr("id"), budgetCategory, ledgerAccount.getInt("id"), createName);
					budgetFillingLedgerList.add(budgetFillingLedger);
				}
			}

			Entity budgetFillingPersonnelPJZZRS = this.buildBudgetFillingPersonnel(budgetFillingMain, "平均在职人数", createName);
			budgetFillingPersonnelList.add(budgetFillingPersonnelPJZZRS);
			Entity budgetFillingPersonnelPJFPRS = this.buildBudgetFillingPersonnel(budgetFillingMain, "平均返聘人数", createName);
			budgetFillingPersonnelList.add(budgetFillingPersonnelPJFPRS);
			Entity budgetFillingPersonnelPJLWPQ = this.buildBudgetFillingPersonnel(budgetFillingMain, "平均劳务派遣", createName);
			budgetFillingPersonnelList.add(budgetFillingPersonnelPJLWPQ);
			Entity budgetFillingPersonnelPJHZRS = this.buildBudgetFillingPersonnel(budgetFillingMain, "平均合作人数", createName);
			budgetFillingPersonnelList.add(budgetFillingPersonnelPJHZRS);
			Entity budgetFillingPersonnelPJHGBP = this.buildBudgetFillingPersonnel(budgetFillingMain, "平均海工爆破", createName);
			budgetFillingPersonnelList.add(budgetFillingPersonnelPJHGBP);

			Entity budgetFillingProductivitySCSJE = this.buildBudgetFillingProductivity(budgetFillingMain, "生产税净额", createName);
			budgetFillingProductivityList.add(budgetFillingProductivitySCSJE);
			Entity budgetFillingProductivityGSSCSJEZS = this.buildBudgetFillingProductivity(budgetFillingMain, "公司生产税净额总数", createName);
			budgetFillingProductivityList.add(budgetFillingProductivityGSSCSJEZS);
		}
		this.deleteData(dbSession, budgetAccounts, year);
		dbSession.insert(budgetFillingMainList);
		dbSession.insert(budgetFillingIncomeList);
		dbSession.insert(budgetFillingMarginList);
		dbSession.insert(budgetFillingLedgerList);
		dbSession.insert(budgetFillingPersonnelList);
		dbSession.insert(budgetFillingProductivityList);
	}

	// 生成填充zh_caiwu_budget_filling_main表的数据
	private Entity buildBudgetFillingMain(Entity budgetAccount, String year, String createName) {
		Entity budgetFillingMain = Entity.create("zh_caiwu_budget_filling_main");
		budgetFillingMain.set("id", IdUtil.objectId());
		budgetFillingMain.set("budget_account_id", budgetAccount.getInt("id"));
		budgetFillingMain.set("budget_year", year);
		budgetFillingMain.set("filling_stage", "进行中");
		budgetFillingMain.set("create_name", createName);
		budgetFillingMain.set("create_time", DateTime.now());
		budgetFillingMain.set("update_name", createName);
		budgetFillingMain.set("update_time", DateTime.now());
		return budgetFillingMain;
	}

	// 生成填充zh_caiwu_budget_filling_income表的数据
	private Entity buildBudgetFillingIncome(Entity budgetFillingMain, String incomeName, String createName) throws Exception {
		Entity budgetFillingIncome = Entity.create("zh_caiwu_budget_filling_income");
		budgetFillingIncome.set("id", IdUtil.objectId());
		budgetFillingIncome.set("budget_main_id", budgetFillingMain.getStr("id"));
		budgetFillingIncome.set("income_name", incomeName);
		budgetFillingIncome.set("jan_amount", BigDecimal.ZERO);
		budgetFillingIncome.set("feb_amount", BigDecimal.ZERO);
		budgetFillingIncome.set("mar_amount", BigDecimal.ZERO);
		budgetFillingIncome.set("apr_amount", BigDecimal.ZERO);
		budgetFillingIncome.set("may_amount", BigDecimal.ZERO);
		budgetFillingIncome.set("jun_amount", BigDecimal.ZERO);
		budgetFillingIncome.set("jul_amount", BigDecimal.ZERO);
		budgetFillingIncome.set("aug_amount", BigDecimal.ZERO);
		budgetFillingIncome.set("sep_amount", BigDecimal.ZERO);
		budgetFillingIncome.set("oct_amount", BigDecimal.ZERO);
		budgetFillingIncome.set("nov_amount", BigDecimal.ZERO);
		budgetFillingIncome.set("dec_amount", BigDecimal.ZERO);
		budgetFillingIncome.set("total_amount", BigDecimal.ZERO);
		budgetFillingIncome.set("create_name", createName);
		budgetFillingIncome.set("create_time", DateTime.now());
		budgetFillingIncome.set("update_name", createName);
		budgetFillingIncome.set("update_time", DateTime.now());
		return budgetFillingIncome;
	}

	// 生成填充zh_caiwu_budget_filling_margin表的数据
	private Entity buildBudgetFillingMargin(Entity budgetFillingMain, String marginName, String createName) throws Exception {
		Entity budgetFillingMargin = Entity.create("zh_caiwu_budget_filling_margin");
		budgetFillingMargin.set("id", IdUtil.objectId());
		budgetFillingMargin.set("budget_main_id", budgetFillingMain.getStr("id"));
		budgetFillingMargin.set("margin_name", marginName);
		budgetFillingMargin.set("jan_amount", BigDecimal.ZERO);
		budgetFillingMargin.set("feb_amount", BigDecimal.ZERO);
		budgetFillingMargin.set("mar_amount", BigDecimal.ZERO);
		budgetFillingMargin.set("apr_amount", BigDecimal.ZERO);
		budgetFillingMargin.set("may_amount", BigDecimal.ZERO);
		budgetFillingMargin.set("jun_amount", BigDecimal.ZERO);
		budgetFillingMargin.set("jul_amount", BigDecimal.ZERO);
		budgetFillingMargin.set("aug_amount", BigDecimal.ZERO);
		budgetFillingMargin.set("sep_amount", BigDecimal.ZERO);
		budgetFillingMargin.set("oct_amount", BigDecimal.ZERO);
		budgetFillingMargin.set("nov_amount", BigDecimal.ZERO);
		budgetFillingMargin.set("dec_amount", BigDecimal.ZERO);
		budgetFillingMargin.set("total_amount", BigDecimal.ZERO);
		budgetFillingMargin.set("create_name", createName);
		budgetFillingMargin.set("create_time", DateTime.now());
		budgetFillingMargin.set("update_name", createName);
		budgetFillingMargin.set("update_time", DateTime.now());
		budgetFillingMargin.set("share_proportion", BigDecimal.ZERO);
		return budgetFillingMargin;
	}

	// 生成填充zh_caiwu_budget_filling_ledger表的数据
	private Entity buildBudgetFillingLedger(String budgetMainId, String budgetCategory, Integer ledgerAccountId, String createName) throws Exception {
		Entity budgetFillingLedger = Entity.create("zh_caiwu_budget_filling_ledger");
		budgetFillingLedger.set("id", IdUtil.objectId());
		budgetFillingLedger.set("budget_main_id", budgetMainId);
		budgetFillingLedger.set("budget_category", budgetCategory);
		budgetFillingLedger.set("ledger_account_id", ledgerAccountId);
		budgetFillingLedger.set("jan_amount", BigDecimal.ZERO);
		budgetFillingLedger.set("feb_amount", BigDecimal.ZERO);
		budgetFillingLedger.set("mar_amount", BigDecimal.ZERO);
		budgetFillingLedger.set("apr_amount", BigDecimal.ZERO);
		budgetFillingLedger.set("may_amount", BigDecimal.ZERO);
		budgetFillingLedger.set("jun_amount", BigDecimal.ZERO);
		budgetFillingLedger.set("jul_amount", BigDecimal.ZERO);
		budgetFillingLedger.set("aug_amount", BigDecimal.ZERO);
		budgetFillingLedger.set("sep_amount", BigDecimal.ZERO);
		budgetFillingLedger.set("oct_amount", BigDecimal.ZERO);
		budgetFillingLedger.set("nov_amount", BigDecimal.ZERO);
		budgetFillingLedger.set("dec_amount", BigDecimal.ZERO);
		budgetFillingLedger.set("total_amount", BigDecimal.ZERO);
		budgetFillingLedger.set("create_name", createName);
		budgetFillingLedger.set("create_time", DateTime.now());
		budgetFillingLedger.set("update_name", createName);
		budgetFillingLedger.set("update_time", DateTime.now());
		return budgetFillingLedger;
	}

	// 生成填充zh_caiwu_budget_filling_personnel表的数据
	private Entity buildBudgetFillingPersonnel(Entity budgetFillingMain, String situationName, String createName) throws Exception {
		Entity budgetFillingPersonnel = Entity.create("zh_caiwu_budget_filling_personnel");
		budgetFillingPersonnel.set("id", IdUtil.objectId());
		budgetFillingPersonnel.set("budget_main_id", budgetFillingMain.getStr("id"));
		budgetFillingPersonnel.set("situation_name", situationName);
		budgetFillingPersonnel.set("jan", BigDecimal.ZERO);
		budgetFillingPersonnel.set("feb", BigDecimal.ZERO);
		budgetFillingPersonnel.set("mar", BigDecimal.ZERO);
		budgetFillingPersonnel.set("apr", BigDecimal.ZERO);
		budgetFillingPersonnel.set("may", BigDecimal.ZERO);
		budgetFillingPersonnel.set("jun", BigDecimal.ZERO);
		budgetFillingPersonnel.set("jul", BigDecimal.ZERO);
		budgetFillingPersonnel.set("aug", BigDecimal.ZERO);
		budgetFillingPersonnel.set("sep", BigDecimal.ZERO);
		budgetFillingPersonnel.set("oct", BigDecimal.ZERO);
		budgetFillingPersonnel.set("nov", BigDecimal.ZERO);
		budgetFillingPersonnel.set("dec", BigDecimal.ZERO);
		budgetFillingPersonnel.set("average_actual", BigDecimal.ZERO);
		budgetFillingPersonnel.set("create_name", createName);
		budgetFillingPersonnel.set("create_time", DateTime.now());
		budgetFillingPersonnel.set("update_name", createName);
		budgetFillingPersonnel.set("update_time", DateTime.now());
		return budgetFillingPersonnel;
	}

	// 生成填充zh_caiwu_budget_filling_productivity表的数据
	private Entity buildBudgetFillingProductivity(Entity budgetFillingMain, String laborName, String createName) throws Exception {
		Entity budgetFillingProductivity = Entity.create("zh_caiwu_budget_filling_productivity");
		budgetFillingProductivity.set("id", IdUtil.objectId());
		budgetFillingProductivity.set("budget_main_id", budgetFillingMain.getStr("id"));
		budgetFillingProductivity.set("labor_name", laborName);
		budgetFillingProductivity.set("jan_amount", BigDecimal.ZERO);
		budgetFillingProductivity.set("feb_amount", BigDecimal.ZERO);
		budgetFillingProductivity.set("mar_amount", BigDecimal.ZERO);
		budgetFillingProductivity.set("apr_amount", BigDecimal.ZERO);
		budgetFillingProductivity.set("may_amount", BigDecimal.ZERO);
		budgetFillingProductivity.set("jun_amount", BigDecimal.ZERO);
		budgetFillingProductivity.set("jul_amount", BigDecimal.ZERO);
		budgetFillingProductivity.set("aug_amount", BigDecimal.ZERO);
		budgetFillingProductivity.set("sep_amount", BigDecimal.ZERO);
		budgetFillingProductivity.set("oct_amount", BigDecimal.ZERO);
		budgetFillingProductivity.set("nov_amount", BigDecimal.ZERO);
		budgetFillingProductivity.set("dec_amount", BigDecimal.ZERO);
		budgetFillingProductivity.set("total_amount", BigDecimal.ZERO);
		budgetFillingProductivity.set("create_name", createName);
		budgetFillingProductivity.set("create_time", DateTime.now());
		budgetFillingProductivity.set("update_name", createName);
		budgetFillingProductivity.set("update_time", DateTime.now());
		return budgetFillingProductivity;
	}

	// 根据提供的主键获取预算主体列表
	private List<Entity> getBudgetAccountList(Session dbSession, String budgetAccounts) throws Exception {
		String querySql = "SELECT * FROM zh_caiwu_budget_account WHERE id IN (" + budgetAccounts + ")";
		List<Entity> budgetAccountList = dbSession.query(querySql);
		return budgetAccountList;
	}

	// 获取会计科目列表
	private List<Entity> getLedgerAccountList(Session dbSession) throws Exception {
		String querySql = "SELECT id, category FROM zh_caiwu_ledger_account";
		List<Entity> ledgerAccountList = dbSession.query(querySql);
		return ledgerAccountList;
	}

	// 根据条件删除表数据
	private void deleteData(Session dbSession, String budgetAccounts, String year) throws Exception {
		String querySql = "SELECT id FROM zh_caiwu_budget_filling_main WHERE budget_year = ? AND budget_account_id IN (" + budgetAccounts + ")";
		List<Entity> budgetFillingMainList = dbSession.query(querySql, year);
		if (budgetFillingMainList != null && budgetFillingMainList.size() > 0) {
			String budgetMainIds = budgetFillingMainList.stream().map(budgetFillingMain -> "'" + budgetFillingMain.getStr("id") + "'").collect(Collectors.joining(","));
			this.deleteBudgetFilling(budgetMainIds);
		}
	}

	@Bizlet("根据主键删除填报数据")
	public void deleteBudgetFilling(String ids) throws Exception {
		Session dbSession = new Session(DataSourceHelper.getDataSource());
		String queryFillingIncomeSql = "SELECT id FROM zh_caiwu_budget_filling_income WHERE budget_main_id IN (" + ids + ")";
		List<Entity> fillingIncomes = dbSession.query(queryFillingIncomeSql);
		String annnualPlanMainIds = fillingIncomes.stream().map(fillingIncome -> "'" + fillingIncome.getStr("id") + "'").collect(Collectors.joining(","));
		String delAssociatedAnnnualPlanSql = "DELETE FROM zh_caiwu_budget_filling_associated_annnual_plan WHERE main_id IN (" + annnualPlanMainIds + ")";

		String queryFillingLedgerSql = "SELECT id FROM zh_caiwu_budget_filling_ledger WHERE budget_main_id IN (" + ids + ")";
		List<Entity> fillingLedgers = dbSession.query(queryFillingLedgerSql);
		String distributionPaymentPlansPenetratePurchasePlanXmbMainIds = fillingLedgers.stream().map(fillingLedger -> "'" + fillingLedger.getStr("id") + "'").collect(Collectors.joining(","));
		String delAssociatedDistributionSql = "DELETE FROM zh_caiwu_budget_filling_associated_distribution WHERE main_id IN (" + distributionPaymentPlansPenetratePurchasePlanXmbMainIds + ")";
		String delAssociatedPaymentPlansSql = "DELETE FROM zh_caiwu_budget_filling_associated_payment_plans WHERE main_id IN (" + distributionPaymentPlansPenetratePurchasePlanXmbMainIds + ")";
		String delAssociatedPenetrateSql = "DELETE FROM zh_caiwu_budget_filling_associated_penetrate WHERE main_id IN (" + distributionPaymentPlansPenetratePurchasePlanXmbMainIds + ")";
		String delAssociatedPurchasePlanSql = "DELETE FROM zh_caiwu_budget_filling_associated_purchase_plan WHERE main_id IN (" + distributionPaymentPlansPenetratePurchasePlanXmbMainIds + ")";
		String delAssociatedXmbSql = "DELETE FROM zh_caiwu_budget_filling_associated_xmb WHERE main_id IN (" + distributionPaymentPlansPenetratePurchasePlanXmbMainIds + ")";
		String delAssetAssociatedSql = "DELETE FROM zh_caiwu_budget_filling_ledger_assets WHERE main_id IN (" + distributionPaymentPlansPenetratePurchasePlanXmbMainIds + ")";

		String queryFillingMarginSql = "SELECT id FROM zh_caiwu_budget_filling_margin WHERE budget_main_id IN (" + ids + ")";
		List<Entity> fillingMargins = dbSession.query(queryFillingMarginSql);
		String otherMainIds = fillingMargins.stream().map(fillingMargin -> "'" + fillingMargin.getStr("id") + "'").collect(Collectors.joining(","));
		String delAssociatedOtherSql = "DELETE FROM zh_caiwu_budget_filling_associated_other WHERE main_id IN (" + otherMainIds + ")";

		String delFillingMainSql = "DELETE FROM zh_caiwu_budget_filling_main WHERE id IN (" + ids + ")";
		String delFillingIncomeSql = "DELETE FROM zh_caiwu_budget_filling_income WHERE budget_main_id IN (" + ids + ")";
		String delFillingMarginSql = "DELETE FROM zh_caiwu_budget_filling_margin WHERE budget_main_id IN (" + ids + ")";
		String delFillingLedgerSql = "DELETE FROM zh_caiwu_budget_filling_ledger WHERE budget_main_id IN (" + ids + ")";
		String delFillingPersonnel = "DELETE FROM zh_caiwu_budget_filling_personnel WHERE budget_main_id IN (" + ids + ")";
		String delFillingProductivitySql = "DELETE FROM zh_caiwu_budget_filling_productivity WHERE budget_main_id IN (" + ids + ")";

		dbSession.execute(delAssociatedAnnnualPlanSql);
		dbSession.execute(delAssociatedDistributionSql);
		dbSession.execute(delAssociatedPaymentPlansSql);
		dbSession.execute(delAssociatedPenetrateSql);
		dbSession.execute(delAssociatedPurchasePlanSql);
		dbSession.execute(delAssociatedXmbSql);
		dbSession.execute(delAssetAssociatedSql);
		dbSession.execute(delAssociatedOtherSql);
		dbSession.execute(delFillingMainSql);
		dbSession.execute(delFillingIncomeSql);
		dbSession.execute(delFillingMarginSql);
		dbSession.execute(delFillingLedgerSql);
		dbSession.execute(delFillingPersonnel);
		dbSession.execute(delFillingProductivitySql);

	}

}
