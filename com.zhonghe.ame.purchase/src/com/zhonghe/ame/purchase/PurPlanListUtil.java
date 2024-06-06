package com.zhonghe.ame.purchase;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import cn.hutool.core.util.ArrayUtil;
import cn.hutool.core.util.NumberUtil;
import cn.hutool.db.Entity;
import cn.hutool.db.Session;

import com.eos.common.connection.DataSourceHelper;
import com.eos.system.annotation.Bizlet;

import commonj.sdo.DataObject;

@Bizlet("年度采购计划包装工具类")
public class PurPlanListUtil {

	@Bizlet("包装年度采购计划列表")
	public DataObject[] wrap(DataObject[] dataObjects) throws Exception {
		List<DataObject> warpDatas = new ArrayList<DataObject>();
		Session dbSession = new Session(DataSourceHelper.getDataSource());
		for (int i = 0; i < dataObjects.length; i++) {
			String id = dataObjects[i].getString("id");
			String queryPurPlanItemSql = "SELECT ID, NEW_BUDGET_AMOUNT FROM zh_purchase_plan_item WHERE PLAN_ID=?";
			List<Entity> purPlanItemList = dbSession.query(queryPurPlanItemSql, id);
			if (purPlanItemList != null && purPlanItemList.size() > 0) {
				BigDecimal newBudgetAmountSum = new BigDecimal(0);
				BigDecimal sumamount = new BigDecimal(0);
				String sumamountRate = "0%";
				for (Entity purPlanItem : purPlanItemList) {
					String purPlanItemId = purPlanItem.getStr("ID");
					BigDecimal newBudgetAmount = purPlanItem.getBigDecimal("NEW_BUDGET_AMOUNT");
					newBudgetAmountSum = NumberUtil.add(newBudgetAmountSum, newBudgetAmount);
					String querySql = "SELECT zpad.amount FROM zh_project_approval AS zpa, zh_project_approval_details AS zpad WHERE zpa.id=zpad.pid AND zpa.status='2' AND zpad.plan_id=?";
					List<Entity> list = dbSession.query(querySql, purPlanItemId);
					if (list != null && list.size() > 0) {
						for (Entity entity : list) {
							BigDecimal amount = entity.getBigDecimal("amount");
							sumamount = NumberUtil.add(sumamount, amount);
						}
					}
				}
				if (newBudgetAmountSum.compareTo(BigDecimal.ZERO) == 0) {
					sumamountRate = "100%";
				} else {
					sumamountRate = NumberUtil.decimalFormat("#.##%", NumberUtil.div(sumamount, newBudgetAmountSum, 2));
				}
				dataObjects[i].setString("sumamountRate", sumamountRate);
			}
			warpDatas.add(dataObjects[i]);
		}
		return ArrayUtil.toArray(warpDatas, DataObject.class);
	}

}
