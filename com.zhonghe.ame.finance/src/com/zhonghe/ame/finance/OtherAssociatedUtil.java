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

@Bizlet("五、其他 - 数据填充")
public class OtherAssociatedUtil {

	@Bizlet("填充相关数据入库")
	public void fillData(Entity otherAssociated, Entity[] otherAssociatedGrid) throws Exception {
		Session dbSession = new Session(DataSourceHelper.getDataSource());
		String delSql = "DELETE FROM zh_caiwu_budget_filling_associated_other WHERE main_id = ?";

		Entity updateEntity = Entity.create("zh_caiwu_budget_filling_margin").set("jan_amount", otherAssociated.getBigDecimal("jan_amount"))
				.set("feb_amount", otherAssociated.getBigDecimal("feb_amount")).set("mar_amount", otherAssociated.getBigDecimal("mar_amount"))
				.set("apr_amount", otherAssociated.getBigDecimal("apr_amount")).set("may_amount", otherAssociated.getBigDecimal("may_amount"))
				.set("jun_amount", otherAssociated.getBigDecimal("jun_amount")).set("jul_amount", otherAssociated.getBigDecimal("jul_amount"))
				.set("aug_amount", otherAssociated.getBigDecimal("aug_amount")).set("sep_amount", otherAssociated.getBigDecimal("sep_amount"))
				.set("oct_amount", otherAssociated.getBigDecimal("oct_amount")).set("nov_amount", otherAssociated.getBigDecimal("nov_amount"))
				.set("dec_amount", otherAssociated.getBigDecimal("dec_amount")).set("total_amount", otherAssociated.getBigDecimal("total_amount"))
				.set("update_time", otherAssociated.getStr("update_name")).set("update_time", DateTime.now());
		Entity updateWhere = Entity.create("zh_caiwu_budget_filling_margin").set("id", otherAssociated.getStr("id"));

		List<Entity> insertEntitys = new ArrayList<Entity>();
		for (int i = 0; i < otherAssociatedGrid.length; i++) {
			Entity insert = Entity.create("zh_caiwu_budget_filling_associated_other");
			insert.set("id", IdUtil.objectId());
			insert.set("main_id", otherAssociated.getStr("id"));
			insert.set("matter_name", otherAssociatedGrid[i].getStr("matterName"));
			insert.set("remark", otherAssociatedGrid[i].getStr("remark"));
			insert.set("jan_amount", otherAssociatedGrid[i].getBigDecimal("jan"));
			insert.set("feb_amount", otherAssociatedGrid[i].getBigDecimal("feb"));
			insert.set("mar_amount", otherAssociatedGrid[i].getBigDecimal("mar"));
			insert.set("apr_amount", otherAssociatedGrid[i].getBigDecimal("apr"));
			insert.set("may_amount", otherAssociatedGrid[i].getBigDecimal("may"));
			insert.set("jun_amount", otherAssociatedGrid[i].getBigDecimal("jun"));
			insert.set("jul_amount", otherAssociatedGrid[i].getBigDecimal("jul"));
			insert.set("aug_amount", otherAssociatedGrid[i].getBigDecimal("aug"));
			insert.set("sep_amount", otherAssociatedGrid[i].getBigDecimal("sep"));
			insert.set("oct_amount", otherAssociatedGrid[i].getBigDecimal("oct"));
			insert.set("nov_amount", otherAssociatedGrid[i].getBigDecimal("nov"));
			insert.set("dec_amount", otherAssociatedGrid[i].getBigDecimal("dec"));
			insert.set("total_amount", otherAssociatedGrid[i].getBigDecimal("totalAmount"));
			insert.set("create_code", otherAssociatedGrid[i].getStr("createCode"));
			insert.set("create_name", otherAssociatedGrid[i].getStr("createName"));
			insert.set("create_time", DateUtil.parse(otherAssociatedGrid[i].getStr("createTime")));
			insertEntitys.add(insert);
		}

		dbSession.execute(delSql, otherAssociated.getStr("id"));
		dbSession.insert(insertEntitys);
		dbSession.update(updateEntity, updateWhere);
	}

}
