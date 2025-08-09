package com.zhonghe.ame.finance;

import java.math.BigDecimal;
import java.util.List;

import cn.hutool.core.util.NumberUtil;
import cn.hutool.db.Entity;
import cn.hutool.db.Session;

import com.eos.common.connection.DataSourceHelper;
import com.eos.system.annotation.Bizlet;

@Bizlet("项监部列表页面关闭后 - 工具类")
public class XmbAssociatedUtil {

	@Bizlet("更新会计科目填报")
	public void updateFillingLedgerData(String mainId) throws Exception {
		Session dbSession = new Session(DataSourceHelper.getDataSource());
		String querySql = "SELECT * FROM zh_caiwu_budget_filling_associated_xmb WHERE main_id = ?";
		List<Entity> xmbEntityList = dbSession.query(querySql, mainId);

		Entity ledgerEntity = Entity.create("zh_caiwu_budget_filling_ledger").set("jan_amount", BigDecimal.ZERO).set("feb_amount", BigDecimal.ZERO).set("mar_amount", BigDecimal.ZERO)
				.set("apr_amount", BigDecimal.ZERO).set("may_amount", BigDecimal.ZERO).set("jun_amount", BigDecimal.ZERO).set("jul_amount", BigDecimal.ZERO).set("aug_amount", BigDecimal.ZERO)
				.set("sep_amount", BigDecimal.ZERO).set("oct_amount", BigDecimal.ZERO).set("nov_amount", BigDecimal.ZERO).set("dec_amount", BigDecimal.ZERO).set("total_amount", BigDecimal.ZERO);
		Entity updateWhere = Entity.create("zh_caiwu_budget_filling_ledger").set("id", mainId);

		if (xmbEntityList != null && xmbEntityList.size() > 0) {
			for (Entity xmbEntity : xmbEntityList) {
				ledgerEntity.set("jan_amount", NumberUtil.add(ledgerEntity.getBigDecimal("jan_amount"), xmbEntity.getBigDecimal("jan_amount")));
				ledgerEntity.set("feb_amount", NumberUtil.add(ledgerEntity.getBigDecimal("feb_amount"), xmbEntity.getBigDecimal("feb_amount")));
				ledgerEntity.set("mar_amount", NumberUtil.add(ledgerEntity.getBigDecimal("mar_amount"), xmbEntity.getBigDecimal("mar_amount")));
				ledgerEntity.set("apr_amount", NumberUtil.add(ledgerEntity.getBigDecimal("apr_amount"), xmbEntity.getBigDecimal("apr_amount")));
				ledgerEntity.set("may_amount", NumberUtil.add(ledgerEntity.getBigDecimal("may_amount"), xmbEntity.getBigDecimal("may_amount")));
				ledgerEntity.set("jun_amount", NumberUtil.add(ledgerEntity.getBigDecimal("jun_amount"), xmbEntity.getBigDecimal("jun_amount")));
				ledgerEntity.set("jul_amount", NumberUtil.add(ledgerEntity.getBigDecimal("jul_amount"), xmbEntity.getBigDecimal("jul_amount")));
				ledgerEntity.set("aug_amount", NumberUtil.add(ledgerEntity.getBigDecimal("aug_amount"), xmbEntity.getBigDecimal("aug_amount")));
				ledgerEntity.set("sep_amount", NumberUtil.add(ledgerEntity.getBigDecimal("sep_amount"), xmbEntity.getBigDecimal("sep_amount")));
				ledgerEntity.set("oct_amount", NumberUtil.add(ledgerEntity.getBigDecimal("oct_amount"), xmbEntity.getBigDecimal("oct_amount")));
				ledgerEntity.set("nov_amount", NumberUtil.add(ledgerEntity.getBigDecimal("nov_amount"), xmbEntity.getBigDecimal("nov_amount")));
				ledgerEntity.set("dec_amount", NumberUtil.add(ledgerEntity.getBigDecimal("dec_amount"), xmbEntity.getBigDecimal("dec_amount")));
				ledgerEntity.set("total_amount", NumberUtil.add(ledgerEntity.getBigDecimal("total_amount"), xmbEntity.getBigDecimal("total_amount")));
			}
		}

		dbSession.update(ledgerEntity, updateWhere);

	}

	@Bizlet("删除项目部创建的填报数据")
	public void deleteXmbAssociated(String id, String mainId) throws Exception {
		Session dbSession = new Session(DataSourceHelper.getDataSource());
		String delSql = "DELETE FROM zh_caiwu_budget_filling_associated_xmb WHERE id = ?";
		String delAssociatedPenetrateSql = "DELETE FROM zh_caiwu_budget_filling_associated_penetrate WHERE main_id = ? AND xmb_id = ?";
		String delPaymentPlanSql = "DELETE FROM zh_caiwu_budget_filling_associated_payment_plans WHERE main_id = ? AND xmb_id = ?";
		String delPurchasePlanSql = "DELETE FROM zh_caiwu_budget_filling_associated_purchase_plan WHERE main_id = ? AND xmb_id = ?";
		String delDistributionSql = "DELETE FROM zh_caiwu_budget_filling_associated_distribution WHERE main_id = ? AND xmb_id = ?";
		dbSession.execute(delSql, id);
		dbSession.execute(delAssociatedPenetrateSql, mainId, id);
		dbSession.execute(delPaymentPlanSql, mainId, id);
		dbSession.execute(delPurchasePlanSql, mainId, id);
		dbSession.execute(delDistributionSql, mainId, id);
	}

}
