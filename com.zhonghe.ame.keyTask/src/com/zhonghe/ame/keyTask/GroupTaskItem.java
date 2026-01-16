package com.zhonghe.ame.keyTask;

import cn.hutool.core.date.DateTime;
import cn.hutool.core.lang.Console;
import cn.hutool.core.util.IdUtil;
import cn.hutool.db.Entity;
import cn.hutool.db.Session;

import com.eos.common.connection.DataSourceHelper;
import com.eos.system.annotation.Bizlet;

@Bizlet("集团重点任务 - 任务分解")
public class GroupTaskItem {

	@Bizlet("保存任务分解")
	public void saveTaskItem(String mainId, Entity[] itemDatas, String createUser, String createName) throws Exception {
		if (itemDatas.length > 0) {
			Session dbSession = new Session(DataSourceHelper.getDataSource());
			for (int i = 0; i < itemDatas.length; i++) {
				Entity entity = itemDatas[i];
				if ("added".equals(entity.getStr("_state"))) {
					Entity insert = Entity.create("zh_key_task_group_item").set("id", IdUtil.objectId()).set("main_id", mainId).set("task_month", entity.getInt("taskMonth"))
							.set("task_plan_name", entity.getStr("taskPlanName")).set("create_user", createUser).set("create_name", createName).set("create_time", DateTime.now());
					dbSession.insert(insert);
				} else if ("modified".equals(entity.getStr("_state"))) {
					String updateSql = "UPDATE zh_key_task_group_item SET task_month = ?, task_plan_name = ?, create_user = ?, create_name = ?, create_time = ? WHERE id = ?";
					dbSession.execute(updateSql, entity.getInt("taskMonth"), entity.getStr("taskPlanName"), createUser, createName, DateTime.now(), entity.getStr("id"));
				} else if ("removed".equals(entity.getStr("_state"))) {
					String deleteSql = "DELETE FROM zh_key_task_group_item WHERE id = ?";
					dbSession.execute(deleteSql, entity.getStr("id"));
				}
			}
		}
	}

	@Bizlet("保存任务分解")
	public void whSaveTaskItem(String mainId, Entity[] itemDatas, Entity baseData, String createUser, String createName) throws Exception {
		Session dbSession = new Session(DataSourceHelper.getDataSource());
		if (itemDatas.length > 0) {
			for (int i = 0; i < itemDatas.length; i++) {
				Entity entity = itemDatas[i];
				if ("added".equals(entity.getStr("_state"))) {
					Entity insert = Entity.create("zh_key_task_group_item").set("id", IdUtil.objectId()).set("main_id", mainId).set("task_month", entity.getInt("taskMonth"))
							.set("task_plan_name", entity.getStr("taskPlanName")).set("create_user", createUser).set("create_name", createName).set("create_time", DateTime.now());
					dbSession.insert(insert);
				} else if ("modified".equals(entity.getStr("_state"))) {
					String updateSql = "UPDATE zh_key_task_group_item SET task_month = ?, task_plan_name = ?, create_user = ?, create_name = ?, create_time = ? WHERE id = ?";
					dbSession.execute(updateSql, entity.getInt("taskMonth"), entity.getStr("taskPlanName"), createUser, createName, DateTime.now(), entity.getStr("id"));
				} else if ("removed".equals(entity.getStr("_state"))) {
					String deleteSql = "DELETE FROM zh_key_task_group_item WHERE id = ?";
					dbSession.execute(deleteSql, entity.getStr("id"));
				}
			}
		}
		String updateGroupSql = "UPDATE zh_key_task_group SET task_year = ?, task_domain = ?, task_name = ?, action_plan = ?, measure_standard = ? WHERE id = ?";
		dbSession.execute(updateGroupSql, baseData.getStr("taskYear"), baseData.getStr("taskDomain"), baseData.getStr("taskName"), baseData.getStr("actionPlan"), baseData.getStr("measureStandard"),
				baseData.getStr("id"));
	}

}
