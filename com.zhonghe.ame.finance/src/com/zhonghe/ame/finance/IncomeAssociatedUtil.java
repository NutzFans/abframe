package com.zhonghe.ame.finance;

import java.util.ArrayList;
import java.util.List;

import cn.hutool.core.date.DateTime;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.IdUtil;
import cn.hutool.db.Entity;
import cn.hutool.db.Session;

import com.eos.common.connection.DataSourceHelper;
import com.eos.system.annotation.Bizlet;

@Bizlet("总收入 - 集团内/集团外 数据填充")
public class IncomeAssociatedUtil {

	@Bizlet("填充相关数据入库")
	public void fillData(Entity incomeAssociated, Entity[] incomeAssociatedGrid) throws Exception {
		Session dbSession = new Session(DataSourceHelper.getDataSource());
		String delSql = "DELETE FROM zh_caiwu_budget_filling_associated_annnual_plan WHERE main_id = ?";

		Entity updateEntity = Entity.create("zh_caiwu_budget_filling_income").set("jan_amount", incomeAssociated.getBigDecimal("jan_amount"))
				.set("feb_amount", incomeAssociated.getBigDecimal("feb_amount")).set("mar_amount", incomeAssociated.getBigDecimal("mar_amount"))
				.set("apr_amount", incomeAssociated.getBigDecimal("apr_amount")).set("may_amount", incomeAssociated.getBigDecimal("may_amount"))
				.set("jun_amount", incomeAssociated.getBigDecimal("jun_amount")).set("jul_amount", incomeAssociated.getBigDecimal("jul_amount"))
				.set("aug_amount", incomeAssociated.getBigDecimal("aug_amount")).set("sep_amount", incomeAssociated.getBigDecimal("sep_amount"))
				.set("oct_amount", incomeAssociated.getBigDecimal("oct_amount")).set("nov_amount", incomeAssociated.getBigDecimal("nov_amount"))
				.set("dec_amount", incomeAssociated.getBigDecimal("dec_amount")).set("total_amount", incomeAssociated.getBigDecimal("total_amount"))
				.set("update_time", incomeAssociated.getStr("update_name")).set("update_time", DateTime.now());
		Entity updateWhere = Entity.create("zh_caiwu_budget_filling_income").set("id", incomeAssociated.getStr("id"));

		List<Entity> insertEntitys = new ArrayList<Entity>();
		for (int i = 0; i < incomeAssociatedGrid.length; i++) {
			Entity insert = Entity.create("zh_caiwu_budget_filling_associated_annnual_plan");
			insert.set("id", IdUtil.objectId());
			insert.set("main_id", incomeAssociated.getStr("id"));
			insert.set("source_id", incomeAssociatedGrid[i].getStr("sourceId"));
			insert.set("contract_name", incomeAssociatedGrid[i].getStr("contractName"));
			insert.set("jan_amount", incomeAssociatedGrid[i].getBigDecimal("jan"));
			insert.set("feb_amount", incomeAssociatedGrid[i].getBigDecimal("feb"));
			insert.set("mar_amount", incomeAssociatedGrid[i].getBigDecimal("mar"));
			insert.set("apr_amount", incomeAssociatedGrid[i].getBigDecimal("apr"));
			insert.set("may_amount", incomeAssociatedGrid[i].getBigDecimal("may"));
			insert.set("jun_amount", incomeAssociatedGrid[i].getBigDecimal("jun"));
			insert.set("jul_amount", incomeAssociatedGrid[i].getBigDecimal("jul"));
			insert.set("aug_amount", incomeAssociatedGrid[i].getBigDecimal("aug"));
			insert.set("sep_amount", incomeAssociatedGrid[i].getBigDecimal("sep"));
			insert.set("oct_amount", incomeAssociatedGrid[i].getBigDecimal("oct"));
			insert.set("nov_amount", incomeAssociatedGrid[i].getBigDecimal("nov"));
			insert.set("dec_amount", incomeAssociatedGrid[i].getBigDecimal("dec"));
			insert.set("total_amount", incomeAssociatedGrid[i].getBigDecimal("totalAmount"));
			insert.set("create_name", incomeAssociatedGrid[i].getStr("createName"));
			insert.set("create_time", DateUtil.parse(incomeAssociatedGrid[i].getStr("createTime")));
			insertEntitys.add(insert);
		}

		dbSession.execute(delSql, incomeAssociated.getStr("id"));
		dbSession.insert(insertEntitys);
		dbSession.update(updateEntity, updateWhere);
	}

}
