package com.zhonghe.ame.keyTask;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import cn.hutool.core.util.StrUtil;
import cn.hutool.db.Entity;
import cn.hutool.db.Session;

import com.eos.common.connection.DataSourceHelper;
import com.eos.system.annotation.Bizlet;

@Bizlet("集团重点任务进展工具类")
public class GroupTaskItemApprovalUtil {

	@Bizlet("获取待审批的任务进展")
	public List<Entity> findGroupTaskItem(String taskYear, String secondaryOrg, int fillMonth) throws Exception {
		List<Entity> resultList = new ArrayList<Entity>();
		Session dbSession = new Session(DataSourceHelper.getDataSource());
		String querySql = "SELECT zktgp.*, zktg.task_name,zktg.action_plan FROM zh_key_task_group_progress AS zktgp, zh_key_task_group AS zktg WHERE zktgp.main_id = zktg.id AND zktg.task_year = ? AND zktg.secondary_org = ? ORDER BY fill_month DESC";
		List<Entity> entityList = dbSession.query(querySql, taskYear, secondaryOrg);
		if (entityList != null && entityList.size() > 0) {
			if (fillMonth != 0) {
				resultList = entityList.stream().filter(entity -> entity.getInt("fill_month").intValue() == fillMonth && StrUtil.isBlank(entity.getStr("app_status"))).collect(Collectors.toList());
			} else {
				resultList = entityList.stream().filter(entity -> StrUtil.isBlank(entity.getStr("app_status"))).collect(Collectors.toList());
			}
		}
		return resultList;
	}

}
