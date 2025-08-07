package com.zhonghe.ame.finance;

import java.util.ArrayList;
import java.util.List;

import cn.hutool.core.date.DateTime;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.IdUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.db.Entity;
import cn.hutool.db.Session;

import com.eos.common.connection.DataSourceHelper;
import com.eos.system.annotation.Bizlet;

@Bizlet("总成本 - 会计科目 数据填充")
public class MultipleDetailsAssociatedUtil {

	@Bizlet("填充相关数据")
	public void fillData(Entity multipleDetailsAssociated, Entity[] penetrateAssociatedGrid, Entity[] paymentPlanAssociatedGrid, Entity[] purchasePlanAssociatedGrid,
			Entity[] distributionAssociatedGrid) throws Exception {
		Session dbSession = new Session(DataSourceHelper.getDataSource());
		String delPenetrateSql = "DELETE FROM zh_caiwu_budget_filling_associated_penetrate WHERE main_id = ? AND xmb_id = ?";
		String delPaymentPlanSql = "DELETE FROM zh_caiwu_budget_filling_associated_payment_plans WHERE main_id = ? AND xmb_id = ?";
		String delPurchasePlanSql = "DELETE FROM zh_caiwu_budget_filling_associated_purchase_plan WHERE main_id = ? AND xmb_id = ?";
		String delDistributionSql = "DELETE FROM zh_caiwu_budget_filling_associated_distribution WHERE main_id = ? AND xmb_id = ?";
		String xmbId;
		if (StrUtil.isNotBlank(multipleDetailsAssociated.getStr("id"))) {
			// 编辑保存
			xmbId = multipleDetailsAssociated.getStr("id");
		} else {
			// 新增保存
			xmbId = IdUtil.objectId();
		}
		Entity xmbEntity = Entity.create("zh_caiwu_budget_filling_associated_xmb").set("id", xmbId).set("main_id", multipleDetailsAssociated.getStr("main_id"))
				.set("xmb_name", multipleDetailsAssociated.getStr("xmb_name")).set("jan_amount", multipleDetailsAssociated.getBigDecimal("jan_amount"))
				.set("feb_amount", multipleDetailsAssociated.getBigDecimal("feb_amount")).set("mar_amount", multipleDetailsAssociated.getBigDecimal("mar_amount"))
				.set("apr_amount", multipleDetailsAssociated.getBigDecimal("apr_amount")).set("may_amount", multipleDetailsAssociated.getBigDecimal("may_amount"))
				.set("jun_amount", multipleDetailsAssociated.getBigDecimal("jun_amount")).set("jul_amount", multipleDetailsAssociated.getBigDecimal("jul_amount"))
				.set("aug_amount", multipleDetailsAssociated.getBigDecimal("aug_amount")).set("sep_amount", multipleDetailsAssociated.getBigDecimal("sep_amount"))
				.set("oct_amount", multipleDetailsAssociated.getBigDecimal("oct_amount")).set("nov_amount", multipleDetailsAssociated.getBigDecimal("nov_amount"))
				.set("dec_amount", multipleDetailsAssociated.getBigDecimal("dec_amount")).set("total_amount", multipleDetailsAssociated.getBigDecimal("total_amount"))
				.set("create_code", multipleDetailsAssociated.getStr("create_code")).set("create_name", multipleDetailsAssociated.getStr("create_name")).set("create_time", DateTime.now());

		List<Entity> penetrateInsertEntitys = new ArrayList<Entity>();
		for (int i = 0; i < penetrateAssociatedGrid.length; i++) {
			Entity insert = Entity.create("zh_caiwu_budget_filling_associated_penetrate");
			insert.set("id", IdUtil.objectId());
			insert.set("main_id", multipleDetailsAssociated.getStr("main_id"));
			insert.set("xmb_id", xmbId);
			insert.set("matter_name", penetrateAssociatedGrid[i].getStr("matterName"));
			insert.set("involving_total", penetrateAssociatedGrid[i].getInt("involvingTotal"));
			insert.set("unit_measure", penetrateAssociatedGrid[i].getStr("unitMeasure"));
			insert.set("unit_price", penetrateAssociatedGrid[i].getBigDecimal("unitPrice"));
			insert.set("remark", penetrateAssociatedGrid[i].getStr("remark"));
			insert.set("jan_amount", penetrateAssociatedGrid[i].getBigDecimal("jan"));
			insert.set("feb_amount", penetrateAssociatedGrid[i].getBigDecimal("feb"));
			insert.set("mar_amount", penetrateAssociatedGrid[i].getBigDecimal("mar"));
			insert.set("apr_amount", penetrateAssociatedGrid[i].getBigDecimal("apr"));
			insert.set("may_amount", penetrateAssociatedGrid[i].getBigDecimal("may"));
			insert.set("jun_amount", penetrateAssociatedGrid[i].getBigDecimal("jun"));
			insert.set("jul_amount", penetrateAssociatedGrid[i].getBigDecimal("jul"));
			insert.set("aug_amount", penetrateAssociatedGrid[i].getBigDecimal("aug"));
			insert.set("sep_amount", penetrateAssociatedGrid[i].getBigDecimal("sep"));
			insert.set("oct_amount", penetrateAssociatedGrid[i].getBigDecimal("oct"));
			insert.set("nov_amount", penetrateAssociatedGrid[i].getBigDecimal("nov"));
			insert.set("dec_amount", penetrateAssociatedGrid[i].getBigDecimal("dec"));
			insert.set("total_amount", penetrateAssociatedGrid[i].getBigDecimal("totalAmount"));
			insert.set("create_code", penetrateAssociatedGrid[i].getStr("createCode"));
			insert.set("create_name", penetrateAssociatedGrid[i].getStr("createName"));
			insert.set("create_time", DateUtil.parse(penetrateAssociatedGrid[i].getStr("createTime")));
			penetrateInsertEntitys.add(insert);
		}

		List<Entity> paymentPlanInsertEntitys = new ArrayList<Entity>();
		for (int i = 0; i < paymentPlanAssociatedGrid.length; i++) {
			Entity insert = Entity.create("zh_caiwu_budget_filling_associated_payment_plans");
			insert.set("id", IdUtil.objectId());
			insert.set("main_id", multipleDetailsAssociated.getStr("main_id"));
			insert.set("xmb_id", xmbId);
			insert.set("source_id", paymentPlanAssociatedGrid[i].getStr("sourceId"));
			insert.set("contract_name", paymentPlanAssociatedGrid[i].getStr("contractName"));
			insert.set("jan_tax", paymentPlanAssociatedGrid[i].getBigDecimal("jan"));
			insert.set("jan_amount", paymentPlanAssociatedGrid[i].getBigDecimal("janAmount"));
			insert.set("feb_tax", paymentPlanAssociatedGrid[i].getBigDecimal("feb"));
			insert.set("feb_amount", paymentPlanAssociatedGrid[i].getBigDecimal("febAmount"));
			insert.set("mar_tax", paymentPlanAssociatedGrid[i].getBigDecimal("mar"));
			insert.set("mar_amount", paymentPlanAssociatedGrid[i].getBigDecimal("marAmount"));
			insert.set("apr_tax", paymentPlanAssociatedGrid[i].getBigDecimal("apr"));
			insert.set("apr_amount", paymentPlanAssociatedGrid[i].getBigDecimal("aprAmount"));
			insert.set("may_tax", paymentPlanAssociatedGrid[i].getBigDecimal("may"));
			insert.set("may_amount", paymentPlanAssociatedGrid[i].getBigDecimal("mayAmount"));
			insert.set("jun_tax", paymentPlanAssociatedGrid[i].getBigDecimal("jun"));
			insert.set("jun_amount", paymentPlanAssociatedGrid[i].getBigDecimal("junAmount"));
			insert.set("jul_tax", paymentPlanAssociatedGrid[i].getBigDecimal("jul"));
			insert.set("jul_amount", paymentPlanAssociatedGrid[i].getBigDecimal("julAmount"));
			insert.set("aug_tax", paymentPlanAssociatedGrid[i].getBigDecimal("aug"));
			insert.set("aug_amount", paymentPlanAssociatedGrid[i].getBigDecimal("augAmount"));
			insert.set("sep_tax", paymentPlanAssociatedGrid[i].getBigDecimal("sep"));
			insert.set("sep_amount", paymentPlanAssociatedGrid[i].getBigDecimal("sepAmount"));
			insert.set("oct_tax", paymentPlanAssociatedGrid[i].getBigDecimal("oct"));
			insert.set("oct_amount", paymentPlanAssociatedGrid[i].getBigDecimal("octAmount"));
			insert.set("nov_tax", paymentPlanAssociatedGrid[i].getBigDecimal("nov"));
			insert.set("nov_amount", paymentPlanAssociatedGrid[i].getBigDecimal("novAmount"));
			insert.set("dec_tax", paymentPlanAssociatedGrid[i].getBigDecimal("dec"));
			insert.set("dec_amount", paymentPlanAssociatedGrid[i].getBigDecimal("decAmount"));
			insert.set("total_tax", paymentPlanAssociatedGrid[i].getBigDecimal("totalTax"));
			insert.set("total_amount", paymentPlanAssociatedGrid[i].getBigDecimal("totalAmount"));
			insert.set("create_code", paymentPlanAssociatedGrid[i].getStr("createCode"));
			insert.set("create_name", paymentPlanAssociatedGrid[i].getStr("createName"));
			insert.set("create_time", DateUtil.parse(paymentPlanAssociatedGrid[i].getStr("createTime")));
			paymentPlanInsertEntitys.add(insert);
		}

		List<Entity> purchasePlanInsertEntitys = new ArrayList<Entity>();
		for (int i = 0; i < purchasePlanAssociatedGrid.length; i++) {
			Entity insert = Entity.create("zh_caiwu_budget_filling_associated_purchase_plan");
			insert.set("id", IdUtil.objectId());
			insert.set("main_id", multipleDetailsAssociated.getStr("main_id"));
			insert.set("xmb_id", xmbId);
			insert.set("source_id", purchasePlanAssociatedGrid[i].getStr("sourceId"));
			insert.set("plan_name", purchasePlanAssociatedGrid[i].getStr("planName"));
			insert.set("material_name", purchasePlanAssociatedGrid[i].getStr("materialName"));
			insert.set("jan_amount", purchasePlanAssociatedGrid[i].getBigDecimal("jan"));
			insert.set("feb_amount", purchasePlanAssociatedGrid[i].getBigDecimal("feb"));
			insert.set("mar_amount", purchasePlanAssociatedGrid[i].getBigDecimal("mar"));
			insert.set("apr_amount", purchasePlanAssociatedGrid[i].getBigDecimal("apr"));
			insert.set("may_amount", purchasePlanAssociatedGrid[i].getBigDecimal("may"));
			insert.set("jun_amount", purchasePlanAssociatedGrid[i].getBigDecimal("jun"));
			insert.set("jul_amount", purchasePlanAssociatedGrid[i].getBigDecimal("jul"));
			insert.set("aug_amount", purchasePlanAssociatedGrid[i].getBigDecimal("aug"));
			insert.set("sep_amount", purchasePlanAssociatedGrid[i].getBigDecimal("sep"));
			insert.set("oct_amount", purchasePlanAssociatedGrid[i].getBigDecimal("oct"));
			insert.set("nov_amount", purchasePlanAssociatedGrid[i].getBigDecimal("nov"));
			insert.set("dec_amount", purchasePlanAssociatedGrid[i].getBigDecimal("dec"));
			insert.set("total_amount", purchasePlanAssociatedGrid[i].getBigDecimal("totalAmount"));
			insert.set("total_tax", purchasePlanAssociatedGrid[i].getBigDecimal("totalTax"));
			insert.set("create_code", purchasePlanAssociatedGrid[i].getStr("createCode"));
			insert.set("create_name", purchasePlanAssociatedGrid[i].getStr("createName"));
			insert.set("create_time", DateUtil.parse(purchasePlanAssociatedGrid[i].getStr("createTime")));
			purchasePlanInsertEntitys.add(insert);
		}

		List<Entity> distributionInsertEntitys = new ArrayList<Entity>();
		for (int i = 0; i < distributionAssociatedGrid.length; i++) {
			Entity insert = Entity.create("zh_caiwu_budget_filling_associated_distribution");
			insert.set("id", IdUtil.objectId());
			insert.set("main_id", multipleDetailsAssociated.getStr("main_id"));
			insert.set("xmb_id", xmbId);
			insert.set("matter_name", distributionAssociatedGrid[i].getStr("matterName"));
			insert.set("remark", distributionAssociatedGrid[i].getStr("remark"));
			insert.set("jan_amount", distributionAssociatedGrid[i].getBigDecimal("jan"));
			insert.set("feb_amount", distributionAssociatedGrid[i].getBigDecimal("feb"));
			insert.set("mar_amount", distributionAssociatedGrid[i].getBigDecimal("mar"));
			insert.set("apr_amount", distributionAssociatedGrid[i].getBigDecimal("apr"));
			insert.set("may_amount", distributionAssociatedGrid[i].getBigDecimal("may"));
			insert.set("jun_amount", distributionAssociatedGrid[i].getBigDecimal("jun"));
			insert.set("jul_amount", distributionAssociatedGrid[i].getBigDecimal("jul"));
			insert.set("aug_amount", distributionAssociatedGrid[i].getBigDecimal("aug"));
			insert.set("sep_amount", distributionAssociatedGrid[i].getBigDecimal("sep"));
			insert.set("oct_amount", distributionAssociatedGrid[i].getBigDecimal("oct"));
			insert.set("nov_amount", distributionAssociatedGrid[i].getBigDecimal("nov"));
			insert.set("dec_amount", distributionAssociatedGrid[i].getBigDecimal("dec"));
			insert.set("total_amount", distributionAssociatedGrid[i].getBigDecimal("totalAmount"));
			insert.set("create_code", distributionAssociatedGrid[i].getStr("createCode"));
			insert.set("create_name", distributionAssociatedGrid[i].getStr("createName"));
			insert.set("create_time", DateUtil.parse(distributionAssociatedGrid[i].getStr("createTime")));
			distributionInsertEntitys.add(insert);
		}

		if (StrUtil.isNotBlank(multipleDetailsAssociated.getStr("id"))) {
			// 编辑保存
			Entity updateWhere = Entity.create("zh_caiwu_budget_filling_associated_xmb").set("id", xmbId);
			dbSession.execute(delPenetrateSql, multipleDetailsAssociated.getStr("main_id"), xmbId);
			dbSession.execute(delPaymentPlanSql, multipleDetailsAssociated.getStr("main_id"), xmbId);
			dbSession.execute(delPurchasePlanSql, multipleDetailsAssociated.getStr("main_id"), xmbId);
			dbSession.execute(delDistributionSql, multipleDetailsAssociated.getStr("main_id"), xmbId);
			if (penetrateInsertEntitys.size() > 0) {
				dbSession.insert(penetrateInsertEntitys);
			}
			if (paymentPlanInsertEntitys.size() > 0) {
				dbSession.insert(paymentPlanInsertEntitys);
			}
			if (purchasePlanInsertEntitys.size() > 0) {
				dbSession.insert(purchasePlanInsertEntitys);
			}
			if (distributionInsertEntitys.size() > 0) {
				dbSession.insert(distributionInsertEntitys);
			}
			dbSession.update(xmbEntity, updateWhere);
		} else {
			// 新增保存
			dbSession.execute(delPenetrateSql, multipleDetailsAssociated.getStr("main_id"), xmbId);
			dbSession.execute(delPaymentPlanSql, multipleDetailsAssociated.getStr("main_id"), xmbId);
			dbSession.execute(delPurchasePlanSql, multipleDetailsAssociated.getStr("main_id"), xmbId);
			dbSession.execute(delDistributionSql, multipleDetailsAssociated.getStr("main_id"), xmbId);
			if (penetrateInsertEntitys.size() > 0) {
				dbSession.insert(penetrateInsertEntitys);
			}
			if (paymentPlanInsertEntitys.size() > 0) {
				dbSession.insert(paymentPlanInsertEntitys);
			}
			if (purchasePlanInsertEntitys.size() > 0) {
				dbSession.insert(purchasePlanInsertEntitys);
			}
			if (distributionInsertEntitys.size() > 0) {
				dbSession.insert(distributionInsertEntitys);
			}
			dbSession.insert(xmbEntity);
		}

	}

}
