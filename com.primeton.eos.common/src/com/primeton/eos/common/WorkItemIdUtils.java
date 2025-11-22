package com.primeton.eos.common;

import cn.hutool.db.Entity;
import cn.hutool.db.Session;

import com.eos.common.connection.DataSourceHelper;
import com.eos.system.annotation.Bizlet;

@Bizlet("获取工作项ID")
public class WorkItemIdUtils {

	@Bizlet("获取工作项ID")
	public String getWorkItemIdByProcessId(String processId) throws Exception {
		Session dbSession = new Session(DataSourceHelper.getDataSource());
		String querySql = "SELECT WORKITEMID FROM WFWORKITEM WHERE PROCESSINSTID = ? AND CURRENTSTATE = '10'";
		Entity entity = dbSession.queryOne(querySql, processId);
		if (entity != null) {
			return entity.getStr("WORKITEMID");
		} else {
			return null;
		}
	}

}
