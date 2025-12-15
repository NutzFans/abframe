package com.zhonghe.ame.keyTask;

import java.util.List;

import cn.hutool.db.Entity;
import cn.hutool.db.Session;

import com.eos.common.connection.DataSourceHelper;
import com.eos.system.annotation.Bizlet;

@Bizlet("其他相关数据操作")
public class OtherUtil {

	@Bizlet("获取任务分配的责任单位字符串")
	public String getSecOrgStrsByTask(String id) throws Exception {
		Session dbSession = new Session(DataSourceHelper.getDataSource());
		String querySql = "SELECT * FROM zh_key_task_group WHERE id = ?";
		Entity entity = dbSession.queryOne(querySql, id);
		String querySecSql = "SELECT * FROM zh_key_task_group WHERE task_year = ? AND task_name = ? AND action_plan = ?";
		List<Entity> entityList = dbSession.query(querySecSql, entity.getStr("task_year"), entity.getStr("task_name"), entity.getStr("action_plan"));
		StringBuilder strBuilder = new StringBuilder();
		for (int i = 0; i < entityList.size(); i++) {
			if (i != 0) {
				strBuilder.append("，");
			}
			strBuilder.append(entityList.get(i).getStr("secondary_orgname"));
		}
		return strBuilder.toString();
	}

}
