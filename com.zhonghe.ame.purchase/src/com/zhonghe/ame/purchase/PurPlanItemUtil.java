package com.zhonghe.ame.purchase;

import static com.eos.system.annotation.ParamType.CONSTANT;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import cn.hutool.core.util.ArrayUtil;
import cn.hutool.core.util.NumberUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.db.Entity;
import cn.hutool.db.Session;

import com.eos.common.connection.DataSourceHelper;
import com.eos.foundation.data.DataObjectUtil;
import com.eos.system.annotation.Bizlet;
import com.eos.system.annotation.BizletParam;

import commonj.sdo.DataObject;

@Bizlet("年度采购计划工具类")
public class PurPlanItemUtil {

	@Bizlet("包装采购计划明细数据")
	public DataObject[] wrap(DataObject[] dataObjects) throws Exception {
		List<DataObject> warpDatas = new ArrayList<DataObject>();
		Session dbSession = new Session(DataSourceHelper.getDataSource());
		Map<String, String> budgetAccountMap = this.getBudgetAccount(dbSession);
		Map<String, String> ledgerCategoryMap = this.getLedgerCategory(dbSession);
		Map<String, String> ledgerNameMap = this.getLedgerName(dbSession);
		for (int i = 0; i < dataObjects.length; i++) {
			String id = dataObjects[i].getString("id");
			BigDecimal newBudgetAmount = dataObjects[i].getBigDecimal("newBudgetAmount");
			String querySql = "SELECT zpad.id AS id,zpad.pid AS pid,zpad.amount AS amount FROM zh_project_approval AS zpa,zh_project_approval_details AS zpad WHERE zpa.id= zpad.pid AND zpa.status= '2' AND zpad.plan_id=? UNION SELECT zpzi.id AS id,zpzi.zero_id AS pid,zpzi.total_price AS amount FROM zh_purchase_zero AS zpz,zh_purchase_zero_item AS zpzi WHERE zpz.status= '2' AND zpzi.plan_id=?";
			List<Entity> list = dbSession.query(querySql, id, id);
			BigDecimal sumamount = new BigDecimal(0);
			String sumamountRate = "0%";
			if (list != null && list.size() > 0) {
				for (Entity entity : list) {
					BigDecimal amount = entity.getBigDecimal("amount");
					sumamount = NumberUtil.add(sumamount, amount);
				}
				if (newBudgetAmount.compareTo(BigDecimal.ZERO) == 0) {
					sumamountRate = "100%";
				} else {
					sumamountRate = NumberUtil.decimalFormat("#.##%", NumberUtil.div(sumamount, newBudgetAmount, 2));
				}

			}
			if (StrUtil.isNotBlank(dataObjects[i].getString("budgetAccount"))) {
				String budgetAccount = dataObjects[i].getString("budgetAccount");
				dataObjects[i].setString("budgetAccount", budgetAccountMap.get(budgetAccount));
			}
			if (StrUtil.isNotBlank(dataObjects[i].getString("ledgerCategory"))) {
				String ledgerCategory = dataObjects[i].getString("ledgerCategory");
				dataObjects[i].setString("ledgerCategory", ledgerCategoryMap.get(ledgerCategory));
			}
			if (StrUtil.isNotBlank(dataObjects[i].getString("ledgerName"))) {
				String ledgerName = dataObjects[i].getString("ledgerName");
				dataObjects[i].setString("ledgerName", ledgerNameMap.get(ledgerName));
			}
			
			dataObjects[i].setBigDecimal("sumamount", sumamount);
			dataObjects[i].setString("sumamountRate", sumamountRate);
			warpDatas.add(dataObjects[i]);
		}
		return ArrayUtil.toArray(warpDatas, DataObject.class);
	}

	@Bizlet("获取变更的物项信息")
	public DataObject[] changeItemView(String id) throws Exception {
		List<DataObject> resultDatas = new ArrayList<DataObject>();
		Session dbSession = new Session(DataSourceHelper.getDataSource());
		String queryPlanSql = "SELECT * FROM zh_purchase_plan WHERE old_id = ?";
		String queryPlanItemSql = "SELECT zpp.name, zpp.CREATED_USERNAME, zpp.need_org_name, zpp.CREATED_TIME, zppi.CODE, zppi.PURCHASE_FIRST_NAME, zppi.PURCHASE_TWO_NAME, zppi.MATERIAL_NAME, zppi.NUMBER, zppi.NEW_NUMBER, zppi.BUDGET_AMOUNT, zppi.NEW_BUDGET_AMOUNT, zppi.CHANGE_REASON FROM zh_purchase_plan_item AS zppi, zh_purchase_plan AS zpp WHERE zppi.PLAN_ID = zpp.id AND zpp.id = ?";
		List<Entity> planList = dbSession.query(queryPlanSql, id);

		if (planList != null && planList.size() > 0) {
			for (Entity plan : planList) {
				String planId = plan.getStr("id");
				List<Entity> planItemList = dbSession.query(queryPlanItemSql, planId);

				if (planItemList != null && planItemList.size() > 0) {
					for (Entity planItem : planItemList) {
						DataObject dataObject = DataObjectUtil.createDataObject("com.zhonghe.ame.purchase.purchase.ChangeItemView");
						dataObject.set("name", planItem.getStr("name"));
						dataObject.set("createdUsername", planItem.getStr("CREATED_USERNAME"));
						dataObject.set("needOrgName", planItem.getStr("need_org_name"));
						dataObject.set("createdTime", planItem.getDate("CREATED_TIME"));
						dataObject.set("code", planItem.getStr("CODE"));
						dataObject.set("purchaseFirstName", planItem.getStr("PURCHASE_FIRST_NAME"));
						dataObject.set("purchaseTwoName", planItem.getStr("PURCHASE_TWO_NAME"));
						dataObject.set("materialName", planItem.getStr("MATERIAL_NAME"));
						dataObject.set("number", planItem.getStr("NUMBER"));
						dataObject.set("newNumber", planItem.getStr("NEW_NUMBER"));
						dataObject.set("budgetAmount", planItem.getBigDecimal("BUDGET_AMOUNT"));
						dataObject.set("newBudgetAmount", planItem.getBigDecimal("NEW_BUDGET_AMOUNT"));
						dataObject.set("changeReason", planItem.getStr("CHANGE_REASON"));
						resultDatas.add(dataObject);
					}
				}
			}
		}

		return ArrayUtil.toArray(resultDatas, DataObject.class);
	}

	// 获取预算主体Map
	private Map<String, String> getBudgetAccount(Session dbSession) throws Exception {
		String querySql = "SELECT id, name FROM zh_caiwu_budget_account";
		List<Entity> entityList = dbSession.query(querySql);
		return entityList.stream().collect(Collectors.toMap(entity -> entity.getStr("id"), entity -> entity.getStr("name")));
	}

	// 获取科目分类
	private Map<String, String> getLedgerCategory(Session dbSession) throws Exception {
		String querySql = "SELECT DICTID AS id, DICTNAME AS name FROM EOS_DICT_ENTRY WHERE DICTTYPEID = 'CW_KM_CLASS'";
		List<Entity> entityList = dbSession.query(querySql);
		Entity entity = new Entity();
		entity.set("id", "10");
		entity.set("name", "长期资产");
		entityList.add(entity);
		return entityList.stream().collect(Collectors.toMap(item -> item.getStr("id"), item -> item.getStr("name")));
	}

	// 获取科目
	private Map<String, String> getLedgerName(Session dbSession) throws Exception {
		String querySql = "SELECT id,name FROM zh_caiwu_ledger_account";
		List<Entity> entityList = dbSession.query(querySql);
		String querySqlTwo = "SELECT DICTID AS id, DICTNAME AS name FROM EOS_DICT_ENTRY WHERE DICTTYPEID = 'ZH_CW_CQZCFL'";
		List<Entity> entityListTwo = dbSession.query(querySqlTwo);
		entityList.addAll(entityListTwo);
		return entityList.stream().collect(Collectors.toMap(item -> item.getStr("id"), item -> item.getStr("name")));
	}

}
