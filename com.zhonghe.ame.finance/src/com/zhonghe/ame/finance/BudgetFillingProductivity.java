package com.zhonghe.ame.finance;

import cn.hutool.core.date.DateTime;
import cn.hutool.db.Entity;
import cn.hutool.db.Session;

import com.eos.common.connection.DataSourceHelper;
import com.eos.system.annotation.Bizlet;

@Bizlet("劳动生产率 - 工具类")
public class BudgetFillingProductivity {

	@Bizlet("保存数据")
	public void save(Entity entity) throws Exception {
		Session dbSession = new Session(DataSourceHelper.getDataSource());
		Entity updateEntity = Entity.create("zh_caiwu_budget_filling_productivity").set("jan_amount", entity.getBigDecimal("jan_amount")).set("feb_amount", entity.getBigDecimal("feb_amount"))
				.set("mar_amount", entity.getBigDecimal("mar_amount")).set("apr_amount", entity.getBigDecimal("apr_amount")).set("may_amount", entity.getBigDecimal("may_amount"))
				.set("jun_amount", entity.getBigDecimal("jun_amount")).set("jul_amount", entity.getBigDecimal("jul_amount")).set("aug_amount", entity.getBigDecimal("aug_amount"))
				.set("sep_amount", entity.getBigDecimal("sep_amount")).set("oct_amount", entity.getBigDecimal("oct_amount")).set("nov_amount", entity.getBigDecimal("nov_amount"))
				.set("dec_amount", entity.getBigDecimal("dec_amount")).set("total_amount", entity.getBigDecimal("total_amount")).set("update_name", entity.getStr("update_name"))
				.set("update_time", DateTime.now());
		Entity updateWhere = Entity.create("zh_caiwu_budget_filling_productivity").set("id", entity.getStr("id"));
		dbSession.update(updateEntity, updateWhere);
	}

}
