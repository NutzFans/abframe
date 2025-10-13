package com.zhonghe.ame.keyTask;

import java.util.List;
import java.util.stream.Collectors;

import cn.hutool.db.Entity;
import cn.hutool.db.Session;

import com.eos.common.connection.DataSourceHelper;
import com.eos.system.annotation.Bizlet;

@Bizlet("删除责任单位任务工具类")
public class DeleteCompanyTask {

	@Bizlet("删除")
	public void delete(String id) throws Exception {
		Session dbSession = new Session(DataSourceHelper.getDataSource());
		String queryItemSql = "SELECT id FROM zh_key_task_company_item WHERE main_id = ?";
		List<Entity> itemList = dbSession.query(queryItemSql, id);
		if (itemList != null && itemList.size() > 0) {
			String itemIds = itemList.stream().map(item -> "'" + item.getStr("id") + "'").collect(Collectors.joining(","));
			String delItemProcessSql = "DELETE FROM zh_key_task_company_item_process WHERE item_id IN (" + itemIds + ")";
			dbSession.execute(delItemProcessSql);
		}
		String delItemSql = "DELETE FROM zh_key_task_company_item WHERE main_id = ?";
		String delCompanyTaskSql = "DELETE FROM zh_key_task_company WHERE id = ?";
		dbSession.execute(delItemSql, id);
		dbSession.execute(delCompanyTaskSql, id);
	}

}
