package zhzxUtils;

import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Stream;

import org.ttzero.excel.reader.ExcelReader;
import org.ttzero.excel.reader.FullSheet;
import org.ttzero.excel.reader.Sheet;

import cn.hutool.core.convert.Convert;
import cn.hutool.core.date.DateTime;
import cn.hutool.core.lang.Console;
import cn.hutool.core.util.IdUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.db.Entity;
import cn.hutool.db.Session;

import com.eos.common.connection.DataSourceHelper;
import com.eos.system.annotation.Bizlet;

@Bizlet("公司重点任务数据导入")
public class GszdrwExcelImprot {

	@Bizlet("Excel数据导入")
	public String excelIn(String filePath) {
		try {
			Session dbSession = new Session(DataSourceHelper.getDataSource());
			Map<String, String> secOrgMap = this.getSecOrgMap();
			ExcelReader reader = ExcelReader.read(Paths.get(filePath));
			Sheet[] sheets = reader.all();
			String taskYear = "2025";
			String createUser = "0859";
			String createName = "聂世鹏";
			int appStatus = 2;
			DateTime createTime = DateTime.now();
			String querySecOrgSql = "SELECT ORGCODE, ORGNAME FROM OM_ORGANIZATION WHERE ORGCODE = ?";
			List<Entity> keyTaskCompanyList = new ArrayList<Entity>();
			List<Entity> taskItemList = new ArrayList<Entity>();
			List<Entity> itemProcessList = new ArrayList<Entity>();

			for (int i = 0; i < sheets.length; i++) {
				FullSheet sheet = sheets[i].load().asFullSheet();
				Entity secOrgEntity = dbSession.queryOne(querySecOrgSql, secOrgMap.get(sheet.getName()));
				if (secOrgEntity != null) {
					String mainId = IdUtil.objectId();
					Entity keyTaskCompany = Entity.create("zh_key_task_company").set("id", mainId).set("task_year", taskYear).set("secondary_org", secOrgEntity.getStr("ORGCODE"))
							.set("secondary_orgname", secOrgEntity.getStr("ORGNAME")).set("create_user", createUser).set("create_name", createName).set("create_time", createTime)
							.set("app_status", appStatus);
					keyTaskCompanyList.add(keyTaskCompany);

					Stream<Map<String, Object>> dataMapStream = sheet.copyOnMerged().header(1).rows().map(row -> row.toMap());
					dataMapStream.forEach(dataMap -> {
						if (StrUtil.isAllNotBlank(Convert.toStr(dataMap.get("任务名称")), Convert.toStr(dataMap.get("时间节点")))) {
							String itemId = IdUtil.objectId();
							Entity taskItem = Entity.create("zh_key_task_company_item").set("id", itemId).set("main_id", mainId).set("action_plan_number", dataMap.get("行动计划编号"))
									.set("task_name", dataMap.get("任务名称")).set("annual_target", dataMap.get("年度目标")).set("task_plan_name", dataMap.get("分解计划")).set("create_user", createUser)
									.set("create_name", createName).set("create_time", createTime);
							int taskMonth = Convert.toInt(StrUtil.removeSuffix(Convert.toStr(dataMap.get("时间节点")), "月"));
							taskItem.set("task_month", taskMonth);
							if (taskMonth < 7) {
								taskItem.set("task_status", "已完成").set("risk_status", "无风险").set("task_progress", "/").set("risk_measures", "/");
								Entity itemProcess = Entity.create("zh_key_task_company_item_process").set("item_id", itemId).set("app_status", appStatus);
								itemProcessList.add(itemProcess);
							}
							taskItemList.add(taskItem);
						}
					});
				}
			}

			dbSession.insert(keyTaskCompanyList);
			dbSession.insert(taskItemList);
			dbSession.insert(itemProcessList);

			return "数据导入成功";
		} catch (Exception e) {
			Console.error(e);
			return "数据导入失败，请检查！";
		}
	}

	private Map<String, String> getSecOrgMap() {
		Map<String, String> secOrgMap = new HashMap<String, String>();
		secOrgMap.put("党群", "102542");
		secOrgMap.put("综合", "7");
		secOrgMap.put("企发", "8");
		secOrgMap.put("保密", "102123");
		secOrgMap.put("人力", "9");
		secOrgMap.put("财务", "10");
		secOrgMap.put("科数", "11");
		secOrgMap.put("安质", "13");
		secOrgMap.put("纪检", "14");
		secOrgMap.put("审法", "15");
		secOrgMap.put("核动力", "17");
		secOrgMap.put("核资源", "16");
		secOrgMap.put("产研", "20");
		secOrgMap.put("核化工", "21");
		secOrgMap.put("工程项目", "102401");
		secOrgMap.put("工业安全", "102199");
		secOrgMap.put("设备监理", "19");
		secOrgMap.put("河北", "24");
		secOrgMap.put("天津", "25");
		secOrgMap.put("福建", "26");
		secOrgMap.put("海南", "193");
		secOrgMap.put("事业部", "18");
		secOrgMap.put("中核供应链", "1111");
		secOrgMap.put("采购与供应链管理中心", "120598");
		return secOrgMap;
	}

}
