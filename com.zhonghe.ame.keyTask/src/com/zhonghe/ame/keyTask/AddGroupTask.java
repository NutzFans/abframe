package com.zhonghe.ame.keyTask;

import java.util.ArrayList;
import java.util.List;

import cn.hutool.core.date.DateTime;
import cn.hutool.core.util.IdUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.db.Entity;
import cn.hutool.db.Session;

import com.eos.common.connection.DataSourceHelper;
import com.eos.system.annotation.Bizlet;

@Bizlet("生成集团任务及责任单位")
public class AddGroupTask {

	@Bizlet("生成集团任务及责任单位")
	public void addGroupTask(String taskSecOrgs, String taskSecOrgnames, String taskYear, String taskDomain, String taskName, String actionPlan, String measureStandard, String createUser,
			String createName) throws Exception {
		Session dbSession = new Session(DataSourceHelper.getDataSource());
		List<String> taskSecOrgList = StrUtil.split(taskSecOrgs, ",");
		List<String> taskSecOrgnameList = StrUtil.split(taskSecOrgnames, ",");
		List<Entity> insertList = new ArrayList<Entity>();
		for (int i = 0; i < taskSecOrgList.size(); i++) {
			Entity insert = Entity.create("zh_key_task_group");
			insert.set("id", IdUtil.objectId());
			insert.set("task_year", taskYear);
			insert.set("task_domain", taskDomain);
			insert.set("task_name", taskName);
			insert.set("action_plan", actionPlan);
			insert.set("measure_standard", measureStandard);
			insert.set("secondary_org", taskSecOrgList.get(i));
			insert.set("secondary_orgname", taskSecOrgnameList.get(i));
			insert.set("create_user", createUser);
			insert.set("create_name", createName);
			insert.set("create_time", DateTime.now());
			insertList.add(insert);
		}
		dbSession.insert(insertList);
	}

	private void deleteData(Session dbSession, String taskYear, String taskName, String actionPlan) throws Exception {
		// TODO
	}

}
