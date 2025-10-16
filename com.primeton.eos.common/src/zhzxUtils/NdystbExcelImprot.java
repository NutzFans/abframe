package zhzxUtils;

import java.math.BigDecimal;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Stream;

import org.ttzero.excel.reader.ExcelReader;
import org.ttzero.excel.reader.FullSheet;
import org.ttzero.excel.reader.Sheet;

import cn.hutool.core.convert.Convert;
import cn.hutool.core.date.DateField;
import cn.hutool.core.date.DateTime;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.lang.Console;
import cn.hutool.core.util.IdUtil;
import cn.hutool.core.util.NumberUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.db.Entity;
import cn.hutool.db.Session;

import com.eos.common.connection.DataSourceHelper;
import com.eos.system.annotation.Bizlet;

@Bizlet("年度预算填报数据导入")
public class NdystbExcelImprot {

	@Bizlet("Excel数据导入")
	public String excelIn(String filePath, String budgetYear) {
		try {
			Session dbSession = new Session(DataSourceHelper.getDataSource());
			ExcelReader reader = ExcelReader.read(Paths.get(filePath));
			Sheet[] sheets = reader.all();

			for (int i = 0; i < sheets.length; i++) {
				FullSheet sheet = sheets[i].load().asFullSheet();
				String budgetAccountName = sheet.getName();
				Entity budgetAccountEntity = this.getBudgetAccount(dbSession, budgetAccountName);

				// 存在对应预算主体
				if (budgetAccountEntity != null) {
					Entity budgetFillingMainEntity = this.getBudgetFillingMain(dbSession, budgetAccountEntity.getStr("id"), budgetYear);

					// 存在对应预算填报 - 主表
					if (budgetFillingMainEntity != null) {
						Stream<Map<String, Object>> dataMapStream = sheet.copyOnMerged().header(1).rows().map(row -> row.toMap());

						dataMapStream.forEach(dataMap -> {

							if (NumberUtil.isGreater(this.getRowTotal(dataMap), BigDecimal.ZERO)) {
								String budgetCategory = Convert.toStr(dataMap.get("分类"));

								if ("生产运营-费用".equals(budgetCategory)) {
									this.fillLedgerAndAssociatedXmbAndAssociatedPenetrate(dbSession, dataMap, "1", budgetFillingMainEntity.getStr("id"), budgetAccountName);
								} else if ("生产运营-成本".equals(budgetCategory)) {
									this.fillLedgerAndAssociatedXmbAndAssociatedPenetrate(dbSession, dataMap, "2", budgetFillingMainEntity.getStr("id"), budgetAccountName);
								} else if ("人工和用工成本（不含研发）".equals(budgetCategory)) {
									this.fillLedgerAndAssociatedXmbAndAssociatedPenetrate(dbSession, dataMap, "3", budgetFillingMainEntity.getStr("id"), budgetAccountName);
								} else if ("研发费".equals(budgetCategory)) {
									this.fillLedgerAndAssociatedXmbAndAssociatedPenetrate(dbSession, dataMap, "4", budgetFillingMainEntity.getStr("id"), budgetAccountName);
								} else if ("人员及人均情况".equals(budgetCategory)) {
									this.fillBudgetFillingPersonnel(dbSession, dataMap, budgetFillingMainEntity.getStr("id"));
								} else if ("劳动生产率".equals(budgetCategory)) {
									this.fillBudgetFillingProductivity(dbSession, dataMap, budgetFillingMainEntity.getStr("id"));
								}
							}
						});
					}
				}
			}
			return "数据导入成功";
		} catch (Exception e) {
			Console.error(e);
			return "数据导入失败，请检查！";
		}
	}

	// 获取预算主体
	private Entity getBudgetAccount(Session dbSession, String budgetAccountName) throws Exception {
		String querySql = "SELECT * FROM zh_caiwu_budget_account WHERE name = ?";
		return dbSession.queryOne(querySql, budgetAccountName);
	}

	// 获取：财务管理 - 预算填报 - 主表（zh_caiwu_budget_filling_main）
	private Entity getBudgetFillingMain(Session dbSession, String budgetAccountId, String budgetYear) throws Exception {
		String querySql = "SELECT * FROM zh_caiwu_budget_filling_main WHERE budget_account_id = ? AND budget_year = ?";
		return dbSession.queryOne(querySql, budgetAccountId, budgetYear);
	}

	// 填充数据（适配生产运营-费用、生产运营-成本、人工和用工成本（不含研发）、研发费）
	private void fillLedgerAndAssociatedXmbAndAssociatedPenetrate(Session dbSession, Map<String, Object> dataMap, String budgetCategory, String budgetMainId, String budgetAccountName) {
		try {
			String queryLedgerAccountSql = "SELECT * FROM zh_caiwu_ledger_account WHERE name = ?";
			String queryBudgetFillingLedgerSql = "SELECT * FROM zh_caiwu_budget_filling_ledger WHERE budget_main_id = ? AND ledger_account_id = ? AND budget_category = ?";
			String ledgerName = Convert.toStr(dataMap.get("科目"));
			if (StrUtil.isNotBlank(ledgerName)) {
				Entity ledgerAccountEntity = dbSession.queryOne(queryLedgerAccountSql, StrUtil.cleanBlank(ledgerName));
				if (ledgerAccountEntity != null) {
					Entity budgetFillingLedgerEntity = dbSession.queryOne(queryBudgetFillingLedgerSql, budgetMainId, ledgerAccountEntity.getStr("id"), budgetCategory);
					Entity budgetFillingAssociatedXmbEntity = this.buildBudgetFillingAssociatedXmb(dataMap, budgetFillingLedgerEntity.getStr("id"), budgetAccountName);
					Entity budgetFillingAssociatedPenetrateEntity = this.buildBudgetFillingAssociatedPenetrate(dataMap, budgetFillingLedgerEntity.getStr("id"),
							budgetFillingAssociatedXmbEntity.getStr("id"));
					this.updateAndInsertLedgerAndAssociatedXmbAndAssociatedPenetrate(dbSession, budgetFillingLedgerEntity, budgetFillingAssociatedXmbEntity, budgetFillingAssociatedPenetrateEntity);
				}
			}
		} catch (Exception e) {
			Console.log(e);
		}
	}

	// 构建财务管理 - 预算填报 - 穿透 - 项目部（zh_caiwu_budget_filling_associated_xmb）
	private Entity buildBudgetFillingAssociatedXmb(Map<String, Object> dataMap, String budgetFillingLedgerId, String xmbName) {
		Entity entity = Entity.create("zh_caiwu_budget_filling_associated_xmb");
		entity.set("id", IdUtil.objectId());
		entity.set("main_id", budgetFillingLedgerId);
		entity.set("xmb_name", xmbName);
		BigDecimal jan_amount = Convert.toBigDecimal(dataMap.get("1月"), BigDecimal.ZERO);
		entity.set("jan_amount", NumberUtil.mul(jan_amount, 10000));
		BigDecimal feb_amount = Convert.toBigDecimal(dataMap.get("2月"), BigDecimal.ZERO);
		entity.set("feb_amount", NumberUtil.mul(feb_amount, 10000));
		BigDecimal mar_amount = Convert.toBigDecimal(dataMap.get("3月"), BigDecimal.ZERO);
		entity.set("mar_amount", NumberUtil.mul(mar_amount, 10000));
		BigDecimal apr_amount = Convert.toBigDecimal(dataMap.get("4月"), BigDecimal.ZERO);
		entity.set("apr_amount", NumberUtil.mul(apr_amount, 10000));
		BigDecimal may_amount = Convert.toBigDecimal(dataMap.get("5月"), BigDecimal.ZERO);
		entity.set("may_amount", NumberUtil.mul(may_amount, 10000));
		BigDecimal jun_amount = Convert.toBigDecimal(dataMap.get("6月"), BigDecimal.ZERO);
		entity.set("jun_amount", NumberUtil.mul(jun_amount, 10000));
		BigDecimal jul_amount = Convert.toBigDecimal(dataMap.get("7月"), BigDecimal.ZERO);
		entity.set("jul_amount", NumberUtil.mul(jul_amount, 10000));
		BigDecimal aug_amount = Convert.toBigDecimal(dataMap.get("8月"), BigDecimal.ZERO);
		entity.set("aug_amount", NumberUtil.mul(aug_amount, 10000));
		BigDecimal sep_amount = Convert.toBigDecimal(dataMap.get("9月"), BigDecimal.ZERO);
		entity.set("sep_amount", NumberUtil.mul(sep_amount, 10000));
		BigDecimal oct_amount = Convert.toBigDecimal(dataMap.get("10月"), BigDecimal.ZERO);
		entity.set("oct_amount", NumberUtil.mul(oct_amount, 10000));
		BigDecimal nov_amount = Convert.toBigDecimal(dataMap.get("11月"), BigDecimal.ZERO);
		entity.set("nov_amount", NumberUtil.mul(nov_amount, 10000));
		BigDecimal dec_amount = Convert.toBigDecimal(dataMap.get("12月"), BigDecimal.ZERO);
		entity.set("dec_amount", NumberUtil.mul(dec_amount, 10000));
		BigDecimal total_amount = NumberUtil.add(jan_amount, feb_amount, mar_amount, apr_amount, may_amount, jun_amount, jul_amount, aug_amount, sep_amount, oct_amount, nov_amount, dec_amount);
		entity.set("total_amount", NumberUtil.mul(total_amount, 10000));
		entity.set("create_code", "0052");
		entity.set("create_name", "王冬圆");
		entity.set("create_time", DateTime.now());
		return entity;
	}

	// 构建财务管理 - 预算填报 - 穿透 - 费用明细（zh_caiwu_budget_filling_associated_penetrate）
	private Entity buildBudgetFillingAssociatedPenetrate(Map<String, Object> dataMap, String budgetFillingLedgerId, String xmbId) {
		Entity entity = Entity.create("zh_caiwu_budget_filling_associated_penetrate");
		entity.set("id", IdUtil.objectId());
		entity.set("main_id", budgetFillingLedgerId);
		entity.set("xmb_id", xmbId);
		entity.set("matter_name", StrUtil.cleanBlank(Convert.toStr(dataMap.get("科目"))));
		entity.set("involving_total", 1);
		BigDecimal jan_amount = Convert.toBigDecimal(dataMap.get("1月"), BigDecimal.ZERO);
		entity.set("jan_amount", NumberUtil.mul(jan_amount, 10000));
		BigDecimal feb_amount = Convert.toBigDecimal(dataMap.get("2月"), BigDecimal.ZERO);
		entity.set("feb_amount", NumberUtil.mul(feb_amount, 10000));
		BigDecimal mar_amount = Convert.toBigDecimal(dataMap.get("3月"), BigDecimal.ZERO);
		entity.set("mar_amount", NumberUtil.mul(mar_amount, 10000));
		BigDecimal apr_amount = Convert.toBigDecimal(dataMap.get("4月"), BigDecimal.ZERO);
		entity.set("apr_amount", NumberUtil.mul(apr_amount, 10000));
		BigDecimal may_amount = Convert.toBigDecimal(dataMap.get("5月"), BigDecimal.ZERO);
		entity.set("may_amount", NumberUtil.mul(may_amount, 10000));
		BigDecimal jun_amount = Convert.toBigDecimal(dataMap.get("6月"), BigDecimal.ZERO);
		entity.set("jun_amount", NumberUtil.mul(jun_amount, 10000));
		BigDecimal jul_amount = Convert.toBigDecimal(dataMap.get("7月"), BigDecimal.ZERO);
		entity.set("jul_amount", NumberUtil.mul(jul_amount, 10000));
		BigDecimal aug_amount = Convert.toBigDecimal(dataMap.get("8月"), BigDecimal.ZERO);
		entity.set("aug_amount", NumberUtil.mul(aug_amount, 10000));
		BigDecimal sep_amount = Convert.toBigDecimal(dataMap.get("9月"), BigDecimal.ZERO);
		entity.set("sep_amount", NumberUtil.mul(sep_amount, 10000));
		BigDecimal oct_amount = Convert.toBigDecimal(dataMap.get("10月"), BigDecimal.ZERO);
		entity.set("oct_amount", NumberUtil.mul(oct_amount, 10000));
		BigDecimal nov_amount = Convert.toBigDecimal(dataMap.get("11月"), BigDecimal.ZERO);
		entity.set("nov_amount", NumberUtil.mul(nov_amount, 10000));
		BigDecimal dec_amount = Convert.toBigDecimal(dataMap.get("12月"), BigDecimal.ZERO);
		entity.set("dec_amount", NumberUtil.mul(dec_amount, 10000));
		BigDecimal total_amount = NumberUtil.add(jan_amount, feb_amount, mar_amount, apr_amount, may_amount, jun_amount, jul_amount, aug_amount, sep_amount, oct_amount, nov_amount, dec_amount);
		entity.set("total_amount", NumberUtil.mul(total_amount, 10000));
		entity.set("unit_price", NumberUtil.mul(total_amount, 10000));
		entity.set("create_code", "0052");
		entity.set("create_name", "王冬圆");
		entity.set("create_time", DateTime.now());
		return entity;
	}

	// 获取合计金额
	private BigDecimal getRowTotal(Map<String, Object> dataMap) {
		BigDecimal jan_amount = Convert.toBigDecimal(dataMap.get("1月"), BigDecimal.ZERO);
		BigDecimal feb_amount = Convert.toBigDecimal(dataMap.get("2月"), BigDecimal.ZERO);
		BigDecimal mar_amount = Convert.toBigDecimal(dataMap.get("3月"), BigDecimal.ZERO);
		BigDecimal apr_amount = Convert.toBigDecimal(dataMap.get("4月"), BigDecimal.ZERO);
		BigDecimal may_amount = Convert.toBigDecimal(dataMap.get("5月"), BigDecimal.ZERO);
		BigDecimal jun_amount = Convert.toBigDecimal(dataMap.get("6月"), BigDecimal.ZERO);
		BigDecimal jul_amount = Convert.toBigDecimal(dataMap.get("7月"), BigDecimal.ZERO);
		BigDecimal aug_amount = Convert.toBigDecimal(dataMap.get("8月"), BigDecimal.ZERO);
		BigDecimal sep_amount = Convert.toBigDecimal(dataMap.get("9月"), BigDecimal.ZERO);
		BigDecimal oct_amount = Convert.toBigDecimal(dataMap.get("10月"), BigDecimal.ZERO);
		BigDecimal nov_amount = Convert.toBigDecimal(dataMap.get("11月"), BigDecimal.ZERO);
		BigDecimal dec_amount = Convert.toBigDecimal(dataMap.get("12月"), BigDecimal.ZERO);
		return NumberUtil.add(jan_amount, feb_amount, mar_amount, apr_amount, may_amount, jun_amount, jul_amount, aug_amount, sep_amount, oct_amount, nov_amount, dec_amount);
	}

	// 更新和插入数据
	private void updateAndInsertLedgerAndAssociatedXmbAndAssociatedPenetrate(Session dbSession, Entity budgetFillingLedgerEntity, Entity budgetFillingAssociatedXmbEntity,
			Entity budgetFillingAssociatedPenetrateEntity) {
		try {
			budgetFillingLedgerEntity.set("jan_amount", budgetFillingAssociatedXmbEntity.getBigDecimal("jan_amount"));
			budgetFillingLedgerEntity.set("feb_amount", budgetFillingAssociatedXmbEntity.getBigDecimal("feb_amount"));
			budgetFillingLedgerEntity.set("mar_amount", budgetFillingAssociatedXmbEntity.getBigDecimal("mar_amount"));
			budgetFillingLedgerEntity.set("apr_amount", budgetFillingAssociatedXmbEntity.getBigDecimal("apr_amount"));
			budgetFillingLedgerEntity.set("may_amount", budgetFillingAssociatedXmbEntity.getBigDecimal("may_amount"));
			budgetFillingLedgerEntity.set("jun_amount", budgetFillingAssociatedXmbEntity.getBigDecimal("jun_amount"));
			budgetFillingLedgerEntity.set("jul_amount", budgetFillingAssociatedXmbEntity.getBigDecimal("jul_amount"));
			budgetFillingLedgerEntity.set("aug_amount", budgetFillingAssociatedXmbEntity.getBigDecimal("aug_amount"));
			budgetFillingLedgerEntity.set("sep_amount", budgetFillingAssociatedXmbEntity.getBigDecimal("sep_amount"));
			budgetFillingLedgerEntity.set("oct_amount", budgetFillingAssociatedXmbEntity.getBigDecimal("oct_amount"));
			budgetFillingLedgerEntity.set("nov_amount", budgetFillingAssociatedXmbEntity.getBigDecimal("nov_amount"));
			budgetFillingLedgerEntity.set("dec_amount", budgetFillingAssociatedXmbEntity.getBigDecimal("dec_amount"));
			budgetFillingLedgerEntity.set("total_amount", budgetFillingAssociatedXmbEntity.getBigDecimal("total_amount"));
			dbSession.update(budgetFillingLedgerEntity, Entity.create("zh_caiwu_budget_filling_ledger").set("id", budgetFillingLedgerEntity.getStr("id")));
			dbSession.insert(budgetFillingAssociatedXmbEntity);
			dbSession.insert(budgetFillingAssociatedPenetrateEntity);
		} catch (Exception e) {
			Console.log(e);
		}
	}

	// 填充数据（适配人员及人均情况）
	private void fillBudgetFillingPersonnel(Session dbSession, Map<String, Object> dataMap, String budgetMainId) {
		try {
			String querySql = "SELECT * FROM zh_caiwu_budget_filling_personnel WHERE budget_main_id = ? AND situation_name = ?";
			Entity budgetFillingPersonnelEntity = dbSession.queryOne(querySql, budgetMainId, StrUtil.cleanBlank(Convert.toStr(dataMap.get("科目"))));
			if (budgetFillingPersonnelEntity != null) {
				BigDecimal jan = Convert.toBigDecimal(dataMap.get("1月"), BigDecimal.ZERO);
				budgetFillingPersonnelEntity.set("jan", jan);
				BigDecimal feb = Convert.toBigDecimal(dataMap.get("2月"), BigDecimal.ZERO);
				budgetFillingPersonnelEntity.set("feb", feb);
				BigDecimal mar = Convert.toBigDecimal(dataMap.get("3月"), BigDecimal.ZERO);
				budgetFillingPersonnelEntity.set("mar", mar);
				BigDecimal apr = Convert.toBigDecimal(dataMap.get("4月"), BigDecimal.ZERO);
				budgetFillingPersonnelEntity.set("apr", apr);
				BigDecimal may = Convert.toBigDecimal(dataMap.get("5月"), BigDecimal.ZERO);
				budgetFillingPersonnelEntity.set("may", may);
				BigDecimal jun = Convert.toBigDecimal(dataMap.get("6月"), BigDecimal.ZERO);
				budgetFillingPersonnelEntity.set("jun", jun);
				BigDecimal jul = Convert.toBigDecimal(dataMap.get("7月"), BigDecimal.ZERO);
				budgetFillingPersonnelEntity.set("jul", jul);
				BigDecimal aug = Convert.toBigDecimal(dataMap.get("8月"), BigDecimal.ZERO);
				budgetFillingPersonnelEntity.set("aug", aug);
				BigDecimal sep = Convert.toBigDecimal(dataMap.get("9月"), BigDecimal.ZERO);
				budgetFillingPersonnelEntity.set("sep", sep);
				BigDecimal oct = Convert.toBigDecimal(dataMap.get("10月"), BigDecimal.ZERO);
				budgetFillingPersonnelEntity.set("oct", oct);
				BigDecimal nov = Convert.toBigDecimal(dataMap.get("11月"), BigDecimal.ZERO);
				budgetFillingPersonnelEntity.set("nov", nov);
				BigDecimal dec = Convert.toBigDecimal(dataMap.get("12月"), BigDecimal.ZERO);
				budgetFillingPersonnelEntity.set("dec", dec);
				BigDecimal total = NumberUtil.add(jan, feb, mar, apr, may, jun, jul, aug, sep, oct, nov, dec);
				BigDecimal average_actual = NumberUtil.div(total, 12);
				budgetFillingPersonnelEntity.set("average_actual", average_actual);
				dbSession.update(budgetFillingPersonnelEntity, Entity.create("zh_caiwu_budget_filling_personnel").set("id", budgetFillingPersonnelEntity.getStr("id")));
			}
		} catch (Exception e) {
			Console.log(e);
		}
	}

	// 填充数据（劳动生产率）
	private void fillBudgetFillingProductivity(Session dbSession, Map<String, Object> dataMap, String budgetMainId) {
		try {
			String querySql = "SELECT * FROM zh_caiwu_budget_filling_productivity WHERE budget_main_id = ? AND labor_name = ?";
			Entity budgetFillingProductivityEntity = dbSession.queryOne(querySql, budgetMainId, StrUtil.cleanBlank(Convert.toStr(dataMap.get("科目"))));
			BigDecimal jan_amount = Convert.toBigDecimal(dataMap.get("1月"), BigDecimal.ZERO);
			budgetFillingProductivityEntity.set("jan_amount", NumberUtil.mul(jan_amount, 10000));
			BigDecimal feb_amount = Convert.toBigDecimal(dataMap.get("2月"), BigDecimal.ZERO);
			budgetFillingProductivityEntity.set("feb_amount", NumberUtil.mul(feb_amount, 10000));
			BigDecimal mar_amount = Convert.toBigDecimal(dataMap.get("3月"), BigDecimal.ZERO);
			budgetFillingProductivityEntity.set("mar_amount", NumberUtil.mul(mar_amount, 10000));
			BigDecimal apr_amount = Convert.toBigDecimal(dataMap.get("4月"), BigDecimal.ZERO);
			budgetFillingProductivityEntity.set("apr_amount", NumberUtil.mul(apr_amount, 10000));
			BigDecimal may_amount = Convert.toBigDecimal(dataMap.get("5月"), BigDecimal.ZERO);
			budgetFillingProductivityEntity.set("may_amount", NumberUtil.mul(may_amount, 10000));
			BigDecimal jun_amount = Convert.toBigDecimal(dataMap.get("6月"), BigDecimal.ZERO);
			budgetFillingProductivityEntity.set("jun_amount", NumberUtil.mul(jun_amount, 10000));
			BigDecimal jul_amount = Convert.toBigDecimal(dataMap.get("7月"), BigDecimal.ZERO);
			budgetFillingProductivityEntity.set("jul_amount", NumberUtil.mul(jul_amount, 10000));
			BigDecimal aug_amount = Convert.toBigDecimal(dataMap.get("8月"), BigDecimal.ZERO);
			budgetFillingProductivityEntity.set("aug_amount", NumberUtil.mul(aug_amount, 10000));
			BigDecimal sep_amount = Convert.toBigDecimal(dataMap.get("9月"), BigDecimal.ZERO);
			budgetFillingProductivityEntity.set("sep_amount", NumberUtil.mul(sep_amount, 10000));
			BigDecimal oct_amount = Convert.toBigDecimal(dataMap.get("10月"), BigDecimal.ZERO);
			budgetFillingProductivityEntity.set("oct_amount", NumberUtil.mul(oct_amount, 10000));
			BigDecimal nov_amount = Convert.toBigDecimal(dataMap.get("11月"), BigDecimal.ZERO);
			budgetFillingProductivityEntity.set("nov_amount", NumberUtil.mul(nov_amount, 10000));
			BigDecimal dec_amount = Convert.toBigDecimal(dataMap.get("12月"), BigDecimal.ZERO);
			budgetFillingProductivityEntity.set("dec_amount", NumberUtil.mul(dec_amount, 10000));
			BigDecimal total_amount = NumberUtil.add(jan_amount, feb_amount, mar_amount, apr_amount, may_amount, jun_amount, jul_amount, aug_amount, sep_amount, oct_amount, nov_amount, dec_amount);
			budgetFillingProductivityEntity.set("total_amount", NumberUtil.mul(total_amount, 10000));
			dbSession.update(budgetFillingProductivityEntity, Entity.create("zh_caiwu_budget_filling_productivity").set("id", budgetFillingProductivityEntity.getStr("id")));
		} catch (Exception e) {
			Console.log(e);
		}
	}

}
