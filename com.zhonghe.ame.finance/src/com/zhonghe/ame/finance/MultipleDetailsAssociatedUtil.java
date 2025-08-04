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
	public void fillData(Entity multipleDetailsAssociated, Entity[] penetrateAssociatedGrid) throws Exception {
		Session dbSession = new Session(DataSourceHelper.getDataSource());
		String delSql = "DELETE FROM zh_caiwu_budget_filling_associated_penetrate WHERE main_id = ? AND xmb_id = ?";
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

		List<Entity> insertEntitys = new ArrayList<Entity>();
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
			insert.set("create_code", multipleDetailsAssociated.getStr("create_code"));
			insert.set("create_name", multipleDetailsAssociated.getStr("create_name"));
			insert.set("create_time", DateTime.now());
			insertEntitys.add(insert);
		}

		if (StrUtil.isNotBlank(multipleDetailsAssociated.getStr("id"))) {
			// 编辑保存
			Entity updateWhere = Entity.create("zh_caiwu_budget_filling_associated_xmb").set("id", xmbId);
			dbSession.execute(delSql, multipleDetailsAssociated.getStr("main_id"), xmbId);
			dbSession.insert(insertEntitys);
			dbSession.update(xmbEntity, updateWhere);
		} else {
			// 新增保存
			dbSession.execute(delSql, multipleDetailsAssociated.getStr("main_id"), xmbId);
			dbSession.insert(insertEntitys);
			dbSession.insert(xmbEntity);
		}

	}

}
