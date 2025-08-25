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

@Bizlet("折旧、长期摊派工具类")
public class AssetsAssociatedUtil {

	@Bizlet("填充数据")
	public void fillData(Entity assetAssociated, Entity[] assetsAssociatedGrid) throws Exception {
		Session dbSession = new Session(DataSourceHelper.getDataSource());
		String delSql = "DELETE FROM zh_caiwu_budget_filling_ledger_assets WHERE main_id = ?";

		Entity updateEntity = Entity.create("zh_caiwu_budget_filling_ledger").set("jan_amount", assetAssociated.getBigDecimal("jan_amount"))
				.set("feb_amount", assetAssociated.getBigDecimal("feb_amount")).set("mar_amount", assetAssociated.getBigDecimal("mar_amount"))
				.set("apr_amount", assetAssociated.getBigDecimal("apr_amount")).set("may_amount", assetAssociated.getBigDecimal("may_amount"))
				.set("jun_amount", assetAssociated.getBigDecimal("jun_amount")).set("jul_amount", assetAssociated.getBigDecimal("jul_amount"))
				.set("aug_amount", assetAssociated.getBigDecimal("aug_amount")).set("sep_amount", assetAssociated.getBigDecimal("sep_amount"))
				.set("oct_amount", assetAssociated.getBigDecimal("oct_amount")).set("nov_amount", assetAssociated.getBigDecimal("nov_amount"))
				.set("dec_amount", assetAssociated.getBigDecimal("dec_amount")).set("total_amount", assetAssociated.getBigDecimal("total_amount"))
				.set("update_name", assetAssociated.getStr("update_name")).set("update_time", DateTime.now());
		Entity updateWhere = Entity.create("zh_caiwu_budget_filling_ledger").set("id", assetAssociated.getStr("id"));

		List<Entity> insertEntitys = new ArrayList<Entity>();
		for (int i = 0; i < assetsAssociatedGrid.length; i++) {
			Entity insert = Entity.create("zh_caiwu_budget_filling_ledger_assets");
			insert.set("id", IdUtil.objectId());
			insert.set("main_id", assetAssociated.getStr("id"));
			insert.set("source_id", assetsAssociatedGrid[i].getStr("sourceId"));
			insert.set("assets_name", assetsAssociatedGrid[i].getStr("assetsName"));
			insert.set("department", assetsAssociatedGrid[i].getStr("department"));
			insert.set("clazz", assetsAssociatedGrid[i].getStr("clazz"));
			insert.set("jan", assetsAssociatedGrid[i].getBigDecimal("jan"));
			insert.set("feb", assetsAssociatedGrid[i].getBigDecimal("feb"));
			insert.set("mar", assetsAssociatedGrid[i].getBigDecimal("mar"));
			insert.set("apr", assetsAssociatedGrid[i].getBigDecimal("apr"));
			insert.set("may", assetsAssociatedGrid[i].getBigDecimal("may"));
			insert.set("jun", assetsAssociatedGrid[i].getBigDecimal("jun"));
			insert.set("jul", assetsAssociatedGrid[i].getBigDecimal("jul"));
			insert.set("aug", assetsAssociatedGrid[i].getBigDecimal("aug"));
			insert.set("sep", assetsAssociatedGrid[i].getBigDecimal("sep"));
			insert.set("oct", assetsAssociatedGrid[i].getBigDecimal("oct"));
			insert.set("nov", assetsAssociatedGrid[i].getBigDecimal("nov"));
			insert.set("dec", assetsAssociatedGrid[i].getBigDecimal("dec"));
			insert.set("total", assetsAssociatedGrid[i].getBigDecimal("total"));
			insert.set("create_name", assetsAssociatedGrid[i].getStr("createName"));
			insert.set("create_time", DateUtil.parse(assetsAssociatedGrid[i].getStr("createTime")));
			insertEntitys.add(insert);
		}

		dbSession.execute(delSql, assetAssociated.getStr("id"));
		dbSession.insert(insertEntitys);
		dbSession.update(updateEntity, updateWhere);
	}

}
