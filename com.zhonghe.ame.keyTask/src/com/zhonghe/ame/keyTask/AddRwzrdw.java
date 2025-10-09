package com.zhonghe.ame.keyTask;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import cn.hutool.core.date.DateTime;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.IdUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.db.Entity;
import cn.hutool.db.Session;

import com.eos.common.connection.DataSourceHelper;
import com.eos.system.annotation.Bizlet;

@Bizlet("生成任务责任单位")
public class AddRwzrdw {

	@Bizlet("生成任务责任单位")
	public void addRwzrdw(String taskSecOrgs, String taskSecOrgnames, String taskYear, String createUser, String createName) throws Exception {
		Session dbSession = new Session(DataSourceHelper.getDataSource());
		List<String> taskSecOrgList = StrUtil.split(taskSecOrgs, ",");
		List<String> taskSecOrgnameList = StrUtil.split(taskSecOrgnames, ",");
		List<Entity> insertList = new ArrayList<Entity>();
		for (int i = 0; i < taskSecOrgList.size(); i++) {
			Entity insert = Entity.create("zh_key_task_company");
			insert.set("id", IdUtil.objectId());
			insert.set("task_year", taskYear);
			insert.set("secondary_org", taskSecOrgList.get(i));
			insert.set("secondary_orgname", taskSecOrgnameList.get(i));
			insert.set("create_user", createUser);
			insert.set("create_name", createName);
			insert.set("create_time", DateTime.now());
			insertList.add(insert);
		}
		this.deleteData(dbSession, taskSecOrgList, taskYear);
		dbSession.insert(insertList);
	}

	private void deleteData(Session dbSession, List<String> taskSecOrgList, String taskYear) throws Exception {
		String taskSecOrgs = taskSecOrgList.stream().map(taskSecOrg -> "'" + taskSecOrg + "'").collect(Collectors.joining(","));
		String querySql = "SELECT * FROM zh_key_task_company WHERE task_year = ? AND secondary_org IN (" + taskSecOrgs + ")";
		List<Entity> companyList = dbSession.query(querySql, taskYear);
		if (companyList != null && companyList.size() > 0) {
			String mainIds = companyList.stream().map(company -> "'" + company.getStr("id") + "'").collect(Collectors.joining(","));
			String queryItemSql = "SELECT * FROM zh_key_task_company_item WHERE  main_id IN (" + mainIds + ")";
			List<Entity> itemList = dbSession.query(queryItemSql);
			if (itemList != null && itemList.size() > 0) {
				String itemIds = itemList.stream().map(item -> "'" + item.getStr("id") + "'").collect(Collectors.joining(","));
				String delItemprocessSql = "DELETE FROM zh_key_task_company_item_process WHERE item_id IN (" + itemIds + ")";
				String delItemSql = "DELETE FROM zh_key_task_company_item WHERE id IN (" + itemIds + ")";
				dbSession.execute(delItemprocessSql);
				dbSession.execute(delItemSql);
			}
			String delCompanySql = "DELETE FROM zh_key_task_company WHERE id IN (" + mainIds + ")";
			dbSession.execute(delCompanySql);
		}
	}

}
