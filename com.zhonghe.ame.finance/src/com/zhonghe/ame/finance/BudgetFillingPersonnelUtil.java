package com.zhonghe.ame.finance;

import cn.hutool.core.date.DateTime;
import cn.hutool.db.Entity;
import cn.hutool.db.Session;

import com.eos.common.connection.DataSourceHelper;
import com.eos.system.annotation.Bizlet;

@Bizlet("人员及人均情况 - 工具类")
public class BudgetFillingPersonnelUtil {

	@Bizlet("保存数据")
	public void save(Entity entity) throws Exception {
		Session dbSession = new Session(DataSourceHelper.getDataSource());
		Entity updateEntity = Entity.create("zh_caiwu_budget_filling_personnel").set("jan", entity.getBigDecimal("jan")).set("feb", entity.getBigDecimal("feb"))
				.set("mar", entity.getBigDecimal("mar")).set("apr", entity.getBigDecimal("apr")).set("may", entity.getBigDecimal("may")).set("jun", entity.getBigDecimal("jun"))
				.set("jul", entity.getBigDecimal("jul")).set("aug", entity.getBigDecimal("aug")).set("sep", entity.getBigDecimal("sep")).set("oct", entity.getBigDecimal("oct"))
				.set("nov", entity.getBigDecimal("nov")).set("dec", entity.getBigDecimal("dec")).set("average_actual", entity.getBigDecimal("average_actual"))
				.set("update_name", entity.getStr("update_name")).set("update_time", DateTime.now());
		Entity updateWhere = Entity.create("zh_caiwu_budget_filling_personnel").set("id", entity.getStr("id"));
		dbSession.update(updateEntity, updateWhere);
	}

}
