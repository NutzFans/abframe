package com.zhonghe.ame.purchase;

import java.util.ArrayList;
import java.util.List;

import cn.hutool.core.util.StrUtil;
import cn.hutool.db.Entity;
import cn.hutool.db.Session;

import com.eos.common.connection.DataSourceHelper;
import com.eos.system.annotation.Bizlet;

@Bizlet("财务相关工具类")
public class CaiWuUtils {

	@Bizlet("获取填报单位对于的财务预算主体")
	public List<Entity> findBudgetAccountList(String secOrg) throws Exception {
		Session dbSession = new Session(DataSourceHelper.getDataSource());
		String querySql = "SELECT id, name FROM zh_caiwu_budget_account WHERE filling_in_org = ?";
		List<Entity> entityList = dbSession.query(querySql, secOrg);
		return entityList;
	}

	@Bizlet("获取财务科目分类")
	public List<Entity> findLedgerCategoryList() throws Exception {
		Session dbSession = new Session(DataSourceHelper.getDataSource());
		String querySql = "SELECT DICTID AS id, DICTNAME AS name FROM EOS_DICT_ENTRY WHERE DICTTYPEID = 'CW_KM_CLASS'";
		List<Entity> entityList = dbSession.query(querySql);
		Entity entity = new Entity();
		entity.set("id", "10");
		entity.set("name", "长期资产");
		entityList.add(entity);
		return entityList;
	}

	@Bizlet("获取财务科目")
	public List<Entity> findLedgerNameList() throws Exception {
		List<Entity> resultList = new ArrayList<Entity>();
		Session dbSession = new Session(DataSourceHelper.getDataSource());
		String querySql = "SELECT DICTID AS id, DICTNAME AS name FROM EOS_DICT_ENTRY WHERE DICTTYPEID = 'CW_KM_CLASS'";
		List<Entity> entityList = dbSession.query(querySql);
		Entity entity = new Entity();
		entity.set("id", "10");
		entity.set("name", "长期资产");
		entityList.add(entity);
		for (Entity category : entityList) {
			if ("1".equals(category.getStr("id"))) {
				String queryDataSql = "SELECT id, name, '1' AS category FROM zh_caiwu_ledger_account WHERE category LIKE '1%'";
				List<Entity> dataList = dbSession.query(queryDataSql);
				resultList.addAll(dataList);
			} else if ("2".equals(category.getStr("id"))) {
				String queryDataSql = "SELECT id, name, '2' AS category FROM zh_caiwu_ledger_account WHERE category LIKE '%,2'";
				List<Entity> dataList = dbSession.query(queryDataSql);
				resultList.addAll(dataList);
			} else if ("10".equals(category.getStr("id"))) {
				String queryDataSql = "SELECT DICTID AS id, DICTNAME AS name, '10' AS category FROM EOS_DICT_ENTRY WHERE DICTTYPEID = 'ZH_CW_CQZCFL'";
				List<Entity> dataList = dbSession.query(queryDataSql);
				resultList.addAll(dataList);
			} else {
				String queryDataSql = StrUtil.format("SELECT id, name, '{}' AS category FROM zh_caiwu_ledger_account WHERE category = ?", category.getStr("id"));
				List<Entity> dataList = dbSession.query(queryDataSql, category.getStr("id"));
				resultList.addAll(dataList);
			}
		}
		return resultList;
	}

}
