package com.zhonghe.ame.keyTask;

import java.util.ArrayList;
import java.util.List;

import cn.hutool.core.date.DateTime;
import cn.hutool.core.util.IdUtil;
import cn.hutool.db.Entity;
import cn.hutool.db.Session;

import com.eos.common.connection.DataSourceHelper;
import com.eos.system.annotation.Bizlet;

@Bizlet("新增任务及分解计划")
public class AddItem {

	@Bizlet("新增任务及分解计划")
	public void add(Entity mainData, Entity[] itemDatas) throws Exception {
		Session dbSession = new Session(DataSourceHelper.getDataSource());
		List<Entity> insertList = new ArrayList<Entity>();
		for (int i = 0; i < itemDatas.length; i++) {
			Entity insert = Entity.create("zh_key_task_company_item");
			insert.set("id", IdUtil.objectId());
			insert.set("main_id", mainData.getStr("mainId"));
			insert.set("task_source", mainData.getStr("taskSource"));
			insert.set("action_plan_number", mainData.getStr("actionPlanNumber"));
			insert.set("task_num", mainData.getStr("taskNum"));
			insert.set("task_name", mainData.getStr("taskName"));
			insert.set("annual_target", mainData.getStr("annualTarget"));
			insert.set("task_month", itemDatas[i].getInt("taskMonth"));
			insert.set("task_plan_name", itemDatas[i].getStr("taskPlanName"));
			insert.set("responsible_person", itemDatas[i].getStr("responsiblePerson"));
			insert.set("create_user", mainData.getStr("createUser"));
			insert.set("create_name", mainData.getStr("createName"));
			insert.set("create_time", DateTime.now());
			insertList.add(insert);
		}
		dbSession.insert(insertList);
	}

}
