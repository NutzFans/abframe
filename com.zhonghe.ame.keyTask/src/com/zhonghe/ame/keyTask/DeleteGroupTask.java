package com.zhonghe.ame.keyTask;

import cn.hutool.db.Session;

import com.eos.common.connection.DataSourceHelper;
import com.eos.system.annotation.Bizlet;

@Bizlet("删除责任单位任务工具类")
public class DeleteGroupTask {

	@Bizlet("删除")
	public void delete(String id) throws Exception {
		Session dbSession = new Session(DataSourceHelper.getDataSource());
		String delGroupSql = "DELETE FROM zh_key_task_group WHERE id = ?";
		String delGroupItemSql = "DELETE FROM zh_key_task_group_item WHERE main_id = ?";
		String delGroupProgressSql = "DELETE FROM zh_key_task_group_progress WHERE main_id = ?";
		dbSession.execute(delGroupSql, id);
		dbSession.execute(delGroupItemSql, id);
		dbSession.execute(delGroupProgressSql, id);
	}

}
