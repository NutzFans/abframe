package com.zhonghe.ame.kaohe;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Optional;
import java.util.stream.Collectors;

import cn.hutool.core.util.StrUtil;
import cn.hutool.db.Entity;
import cn.hutool.db.Session;

import com.eos.common.connection.DataSourceHelper;
import com.eos.system.annotation.Bizlet;

@Bizlet("公司级重点任务统计工具类")
public class CompanyKeyTaskUtil {

	@Bizlet("统计")
	public Map<String, Object> keyTaskStatistics(String year, String month) throws Exception {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		List<Entity> itemList = new ArrayList<Entity>();
		Session dbSession = new Session(DataSourceHelper.getDataSource());
		String queryCompanySql = "SELECT * FROM zh_key_task_company WHERE task_year = ? AND app_status = 2 ORDER BY secondary_org ASC";
		List<Entity> companyList = dbSession.query(queryCompanySql, year);
		if (companyList != null && companyList.size() > 0) {
			int totalNumberOfCompanyLevelKeyTasks = 0;
			int normalProgressOfCompanyLevelKeyTasks = 0;
			int certainRisksOfCompanyLevelKeyTasks = 0;
			int significantRisksOfCompanyLevelKeyTasks = 0;
			for (Entity company : companyList) {
				// 任务总数
				int taskCount = this.taskCount(company.getStr("id"), dbSession);
				totalNumberOfCompanyLevelKeyTasks = totalNumberOfCompanyLevelKeyTasks + taskCount;

				String querySql = "SELECT zktci.* FROM zh_key_task_company_item AS zktci, zh_key_task_company_item_process AS zktcip WHERE zktci.id = zktcip.item_id AND zktcip.app_status = 2 AND zktci.main_id = ? AND zktci.task_month <= ?";
				List<Entity> itemDatas = dbSession.query(querySql, company.getStr("id"), month);

				// 正常推进
				int normalProgressCount = this.normalProgressCount(itemDatas);
				normalProgressOfCompanyLevelKeyTasks = normalProgressOfCompanyLevelKeyTasks + normalProgressCount;

				// 一定风险
				int certainRiskCount = this.certainRiskCount(itemDatas);
				certainRisksOfCompanyLevelKeyTasks = certainRisksOfCompanyLevelKeyTasks + certainRiskCount;
				if (certainRiskCount != 0) {
					List<Entity> certainRiskList = this.queryDetails(company.getStr("id"), year, month, "certainRisk");
					itemList.addAll(certainRiskList);
				}

				// 极大风险
				int greatRiskCount = this.greatRiskCount(itemDatas);
				significantRisksOfCompanyLevelKeyTasks = significantRisksOfCompanyLevelKeyTasks + greatRiskCount;
				if (greatRiskCount != 0) {
					List<Entity> greatRiskList = this.queryDetails(company.getStr("id"), year, month, "greatRisk");
					itemList.addAll(greatRiskList);
				}

			}
			if (itemList.size() > 0) {
				itemList = this.listByGroup(itemList);
			}
			dataMap.put("totalNumberOfCompanyLevelKeyTasks", totalNumberOfCompanyLevelKeyTasks);
			dataMap.put("normalProgressOfCompanyLevelKeyTasks", normalProgressOfCompanyLevelKeyTasks);
			dataMap.put("certainRisksOfCompanyLevelKeyTasks", certainRisksOfCompanyLevelKeyTasks);
			dataMap.put("significantRisksOfCompanyLevelKeyTasks", significantRisksOfCompanyLevelKeyTasks);
			dataMap.put("keyTaskList", itemList);
		} else {
			dataMap.put("totalNumberOfCompanyLevelKeyTasks", 0);
			dataMap.put("normalProgressOfCompanyLevelKeyTasks", 0);
			dataMap.put("certainRisksOfCompanyLevelKeyTasks", 0);
			dataMap.put("significantRisksOfCompanyLevelKeyTasks", 0);
			dataMap.put("keyTaskList", itemList);
		}
		return dataMap;
	}

	// 获取指定部门的任务总数
	private Integer taskCount(String mainId, Session dbSession) throws Exception {
		String querySql = "SELECT * FROM zh_key_task_company_item WHERE main_id = ?";
		List<Entity> itemDatas = dbSession.query(querySql, mainId);
		Map<String, List<Entity>> map = itemDatas.stream().collect(Collectors.groupingBy(item -> item.getStr("task_name") + item.getStr("annual_target")));
		return map.size();
	}

	// 其中正常推进
	private Integer normalProgressCount(List<Entity> itemDatas) {
		if (itemDatas != null && itemDatas.size() > 0) {
			// 1. 按task_name+annual_target分组，每组保留task_month最大的那条数据
			Map<String, Optional<Entity>> maxMonthTasksByGroup = itemDatas.stream().collect(
					Collectors.groupingBy(item -> item.getStr("task_name") + item.getStr("annual_target"),
							Collectors.maxBy((t1, t2) -> ((Entity) t1).getInt("task_month").compareTo(((Entity) t2).getInt("task_month")))));
			// 2. 统计每组最大月份数据中risk_status为“无风险”的数量
			int count = (int) maxMonthTasksByGroup.values().stream().map(Optional::get).filter(task -> "无风险".equals(task.getStr("risk_status"))).count();
			return count;
		} else {
			return 0;
		}
	}

	// 其中一定风险
	private Integer certainRiskCount(List<Entity> itemDatas) {
		if (itemDatas != null && itemDatas.size() > 0) {
			// 1. 按task_name+annual_target分组，每组保留task_month最大的那条数据
			Map<String, Optional<Entity>> maxMonthTasksByGroup = itemDatas.stream().collect(
					Collectors.groupingBy(item -> item.getStr("task_name") + item.getStr("annual_target"),
							Collectors.maxBy((t1, t2) -> ((Entity) t1).getInt("task_month").compareTo(((Entity) t2).getInt("task_month")))));
			// 2. 统计每组最大月份数据中risk_status为“低风险”的数量
			int count = (int) maxMonthTasksByGroup.values().stream().map(Optional::get).filter(task -> "低风险".equals(task.getStr("risk_status"))).count();
			return count;
		} else {
			return 0;
		}
	}

	// 其中极大风险
	private Integer greatRiskCount(List<Entity> itemDatas) {
		if (itemDatas != null && itemDatas.size() > 0) {
			// 1. 按task_name+annual_target分组，每组保留task_month最大的那条数据
			Map<String, Optional<Entity>> maxMonthTasksByGroup = itemDatas.stream().collect(
					Collectors.groupingBy(item -> item.getStr("task_name") + item.getStr("annual_target"),
							Collectors.maxBy((t1, t2) -> ((Entity) t1).getInt("task_month").compareTo(((Entity) t2).getInt("task_month")))));
			// 2. 统计每组最大月份数据中risk_status为“高风险”的数量
			int count = (int) maxMonthTasksByGroup.values().stream().map(Optional::get).filter(task -> "高风险".equals(task.getStr("risk_status"))).count();
			return count;
		} else {
			return 0;
		}
	}

	private List<Entity> queryDetails(String mainId, String taskYear, String taskMonth, String type) throws Exception {
		List<Entity> resultList = new ArrayList<Entity>();
		Session dbSession = new Session(DataSourceHelper.getDataSource());
		String querySql = "SELECT zktc.secondary_orgname, zktci.task_name, zktci.annual_target, zktci.task_month, zktci.risk_status  FROM zh_key_task_company_item AS zktci, zh_key_task_company_item_process AS zktcip, zh_key_task_company AS zktc WHERE zktci.id = zktcip.item_id AND zktc.id = zktci.main_id AND zktcip.app_status = 2 AND zktci.main_id = ? AND zktci.task_month <= ?";
		List<Entity> itemDatas = dbSession.query(querySql, mainId, taskMonth);
		Map<String, Optional<Entity>> maxMonthTasksByGroup = itemDatas.stream().collect(
				Collectors.groupingBy(item -> item.getStr("task_name") + item.getStr("annual_target"),
						Collectors.maxBy((t1, t2) -> ((Entity) t1).getInt("task_month").compareTo(((Entity) t2).getInt("task_month")))));
		if ("certainRisk".equals(type)) {
			resultList = maxMonthTasksByGroup.values().stream().map(Optional::get).filter(task -> "低风险".equals(task.getStr("risk_status"))).collect(Collectors.toList());
		}
		if ("greatRisk".equals(type)) {
			resultList = maxMonthTasksByGroup.values().stream().map(Optional::get).filter(task -> "高风险".equals(task.getStr("risk_status"))).collect(Collectors.toList());
		}
		return resultList;
	}

	private List<Entity> listByGroup(List<Entity> itemList) {
		List<Entity> resultList = new ArrayList<Entity>();
		List<Entity> tempList = new ArrayList<Entity>();
		tempList = itemList.stream().filter(task -> "低风险".equals(task.getStr("risk_status"))).collect(Collectors.toList());
		if (itemList.size() > 0) {
			Map<String, List<Entity>> mapData = tempList.stream().collect(
					Collectors.groupingBy(item -> ((Entity) item).getStr("risk_status") + "〓" + ((Entity) item).getStr("task_name") + "〓" + ((Entity) item).getStr("secondary_orgname")));
			for (Entry<String, List<Entity>> entry : mapData.entrySet()) {
				String key = entry.getKey();
				List<String> StrList = StrUtil.split(key, "〓");
				Entity entity = new Entity();
				entity.set("riskStatus", "一定风险");
				entity.set("taskName", StrList.get(1));
				entity.set("secOrgName", StrList.get(2));
				resultList.add(entity);
			}
		}
		tempList = itemList.stream().filter(task -> "高风险".equals(task.getStr("risk_status"))).collect(Collectors.toList());
		if (itemList.size() > 0) {
			Map<String, List<Entity>> mapData = tempList.stream().collect(
					Collectors.groupingBy(item -> ((Entity) item).getStr("risk_status") + "〓" + ((Entity) item).getStr("task_name") + "〓" + ((Entity) item).getStr("secondary_orgname")));
			for (Entry<String, List<Entity>> entry : mapData.entrySet()) {
				String key = entry.getKey();
				List<String> StrList = StrUtil.split(key, "〓");
				Entity entity = new Entity();
				entity.set("riskStatus", "极大风险");
				entity.set("taskName", StrList.get(1));
				entity.set("secOrgName", StrList.get(2));
				resultList.add(entity);
			}
		}
		return resultList;
	}
}
