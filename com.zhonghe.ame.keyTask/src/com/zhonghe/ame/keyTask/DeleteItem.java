package com.zhonghe.ame.keyTask;

import java.util.List;
import java.util.stream.Collectors;

import cn.hutool.db.Entity;
import cn.hutool.db.Session;

import com.eos.common.connection.DataSourceHelper;
import com.eos.system.annotation.Bizlet;

@Bizlet("删除任务及分解计划")
public class DeleteItem {

	@Bizlet("删除任务及分解计划")
	public void delete(String mainId, String taskName) throws Exception {
		Session dbSession = new Session(DataSourceHelper.getDataSource());
		String querySql = "SELECT * FROM zh_key_task_company_item WHERE main_id = ? AND task_name = ?";
		List<Entity> itemList = dbSession.query(querySql, mainId, taskName);
		if (itemList != null && itemList.size() > 0) {
			String itemIds = itemList.stream().map(item -> "'" + item.getStr("id") + "'").collect(Collectors.joining(","));
			String delItemProcessSql = "DELETE FROM zh_key_task_company_item_process WHERE item_id IN (" + itemIds + ")";
			dbSession.execute(delItemProcessSql);
		}
		String delItemSql = "DELETE FROM zh_key_task_company_item WHERE main_id = ? AND task_name = ?";
		dbSession.execute(delItemSql, mainId, taskName);
	}

}
