package com.zhonghe.ame.keyTask;

import cn.hutool.core.date.DateTime;
import cn.hutool.core.util.IdUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.db.Entity;
import cn.hutool.db.Session;

import com.eos.common.connection.DataSourceHelper;
import com.eos.system.annotation.Bizlet;

@Bizlet("编辑任务及分解计划")
public class EditItem {

	@Bizlet("编辑任务及分解计划")
	public void edit(Entity mainData, Entity[] itemDatas, Entity[] itemChangeDatas) throws Exception {
		Session dbSession = new Session(DataSourceHelper.getDataSource());
		if (itemChangeDatas != null && itemChangeDatas.length > 0) {
			String delItemSql = "DELETE FROM zh_key_task_company_item WHERE id = ?";
			String delItemProcessSql = "DELETE FROM zh_key_task_company_item_process WHERE item_id = ?";
			for (int i = 0; i < itemChangeDatas.length; i++) {
				Entity entity = itemChangeDatas[i];
				dbSession.execute(delItemSql, entity.getStr("id"));
				dbSession.execute(delItemProcessSql, entity.getStr("id"));
			}
		}
		String updateItemSql = "UPDATE zh_key_task_company_item SET action_plan_number = ?, task_name = ?, annual_target = ?, task_month = ?, task_plan_name = ? WHERE id = ?";
		for (int i = 0; i < itemDatas.length; i++) {
			Entity item = itemDatas[i];
			if (StrUtil.isNotBlank(item.getStr("id"))) {
				dbSession.execute(updateItemSql, mainData.getStr("actionPlanNumber"), mainData.getStr("taskName"), mainData.getStr("annualTarget"), item.getInt("taskMonth"),
						item.getStr("taskPlanName"), item.getStr("id"));
			} else {
				Entity insert = Entity.create("zh_key_task_company_item");
				insert.set("id", IdUtil.objectId());
				insert.set("main_id", mainData.getStr("mainId"));
				insert.set("action_plan_number", mainData.getStr("actionPlanNumber"));
				insert.set("task_name", mainData.getStr("taskName"));
				insert.set("annual_target", mainData.getStr("annualTarget"));
				insert.set("task_month", item.getInt("taskMonth"));
				insert.set("task_plan_name", item.getStr("taskPlanName"));
				insert.set("create_user", mainData.getStr("createUser"));
				insert.set("create_name", mainData.getStr("createName"));
				insert.set("create_time", DateTime.now());
				dbSession.insert(insert);
			}
		}
	}

}
