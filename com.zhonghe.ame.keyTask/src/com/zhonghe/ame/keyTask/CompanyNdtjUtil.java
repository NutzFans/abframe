package com.zhonghe.ame.keyTask;

import java.io.File;
import java.io.FileOutputStream;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.stream.Collectors;

import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import cn.hutool.core.lang.Console;
import cn.hutool.core.util.NumberUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.db.Entity;
import cn.hutool.db.Session;

import com.eos.common.connection.DataSourceHelper;
import com.eos.system.annotation.Bizlet;
import com.esproc.jdbc.Array;

@Bizlet("公司重点任务 - 年度统计工具")
public class CompanyNdtjUtil {

	@Bizlet("年度统计")
	public Map<String, List<Entity>> yearStatistics(String taskYear) throws Exception {
		Map<String, List<Entity>> mapData = new HashMap<String, List<Entity>>();
		List<Entity> resultList = new ArrayList<Entity>();
		Session dbSession = new Session(DataSourceHelper.getDataSource());
		String queryCompanySql = "SELECT * FROM zh_key_task_company WHERE task_year = ? AND app_status = 2 ORDER BY secondary_org ASC";
		List<Entity> companyList = dbSession.query(queryCompanySql, taskYear);
		if (companyList != null && companyList.size() > 0) {
			String querySqlByMainId = "SELECT * FROM zh_key_task_company_item WHERE main_id = ?";
			for (Entity company : companyList) {
				List<Entity> allItemDatas = dbSession.query(querySqlByMainId, company.getStr("id"));
				// 指定单位任务总数
				int taskCount = this.taskCount(allItemDatas);
				// 指定单位按时完成任务数
				int taskCountCompletedOnTime = this.taskCountCompletedOnTime(allItemDatas);
				// 指定单位未按时完成任务数
				int taskCountNotCompletedOnTime = taskCount - taskCountCompletedOnTime;

				// 全部按时完成
				if (taskCount == taskCountCompletedOnTime) {
					Entity entity = this.buildCompleteAllOnTime(company.getStr("id"), company.getStr("secondary_orgname"), taskCount);
					resultList.add(entity);
				} else {
					List<Entity> entityList = this.taskDecompositionStatistics(allItemDatas, company.getStr("id"), company.getStr("secondary_orgname"), taskCount, taskCountCompletedOnTime,
							taskCountNotCompletedOnTime);
					resultList.addAll(entityList);
				}
			}
		}
		mapData.put("ndtjDatas", resultList);
		List<Entity> mergeConfig = this.buildMergeRowConfig(resultList);
		mapData.put("mergeConfig", mergeConfig);
		return mapData;
	}

	private List<Entity> buildMergeRowConfig(List<Entity> statisticsResult) {
		List<Entity> mergeConfig = new ArrayList<Entity>();
		if (statisticsResult == null || statisticsResult.isEmpty()) {
			return mergeConfig;
		}

		// 1. 定义需要合并的列索引和固定的列跨度
		int[] columnsToMerge = { 0, 1, 2, 3, 7 };
		int colSpan = 1;

		// 2. 初始化跟踪变量
		String currentOrgName = statisticsResult.get(0).getStr("secOrgName");
		int currentOrgStartRowIndex = 0;
		int currentOrgRecordCount = 1;

		// 3. 顺序遍历统计结果列表
		for (int i = 1; i < statisticsResult.size(); i++) {
			Entity entity = statisticsResult.get(i);
			String orgName = entity.getStr("secOrgName");

			if (currentOrgName.equals(orgName)) {
				// 如果单位名称相同，则计数加一
				currentOrgRecordCount++;
			} else {
				// 如果单位名称不同，说明上一组已结束，为上一组生成配置
				generateAndAddConfig(mergeConfig, currentOrgStartRowIndex, currentOrgRecordCount, columnsToMerge, colSpan);

				// 更新跟踪变量，开始处理新的一组
				currentOrgName = orgName;
				currentOrgStartRowIndex = i;
				currentOrgRecordCount = 1;
			}
		}

		// 4. 处理循环结束后的最后一组数据
		generateAndAddConfig(mergeConfig, currentOrgStartRowIndex, currentOrgRecordCount, columnsToMerge, colSpan);

		return mergeConfig;
	}

	// 一个辅助方法，用于为指定的单位生成合并配置并添加到结果列表中
	private void generateAndAddConfig(List<Entity> mergeConfig, int startRowIndex, int rowSpan, int[] columnsToMerge, int colSpan) {
		for (int columnIndex : columnsToMerge) {
			Entity configItem = new Entity();
			configItem.set("rowIndex", startRowIndex);
			configItem.set("rowSpan", rowSpan);
			configItem.set("columnIndex", columnIndex);
			configItem.set("colSpan", colSpan);
			mergeConfig.add(configItem);
		}
	}

	// 获取指定部门的任务总数
	private Integer taskCount(List<Entity> allItemDatas) throws Exception {
		Map<String, List<Entity>> mapData = allItemDatas.stream().collect(Collectors.groupingBy(item -> item.getStr("task_name") + item.getStr("annual_target")));
		return mapData.size();
	}

	// 获取指定部门的按时完成任务数
	private Integer taskCountCompletedOnTime(List<Entity> allItemDatas) throws Exception {
		Map<String, List<Entity>> mapData = allItemDatas.stream().filter(item -> !"/".equals(item.getStr("task_plan_name")))
				.collect(Collectors.groupingBy(item -> item.getStr("task_name") + item.getStr("annual_target")));
		int completedGroupCount = (int) mapData.values().stream().filter(entityList -> entityList.stream().allMatch(entity -> "已完成".equals(entity.getStr("task_status")))).count();
		return completedGroupCount;
	}

	// 未完成任务的分解计划情况及占比
	private List<Entity> taskDecompositionStatistics(List<Entity> allItemDatas, String mainId, String secOrgName, int taskCount, int taskCountCompletedOnTime, int taskCountNotCompletedOnTime)
			throws Exception {
		List<Entity> resultList = new ArrayList<Entity>();
		Map<String, List<Entity>> mapData = allItemDatas.stream().filter(item -> !"/".equals(item.getStr("task_plan_name")))
				.collect(Collectors.groupingBy(item -> item.getStr("task_name") + item.getStr("annual_target")));

		for (Entry<String, List<Entity>> entry : mapData.entrySet()) {
			boolean bool = entry.getValue().stream().allMatch(entity -> "已完成".equals(entity.getStr("task_status")));
			if (!bool) {
				Entity item = new Entity();
				// 单位编码
				item.set("mainId", mainId);
				// 单位名称
				item.set("secOrgName", secOrgName);
				// 任务总数
				item.set("taskCount", taskCount);
				// 按时完成任务数
				item.set("taskCountCompletedOnTime", taskCountCompletedOnTime);
				// 未按时完成任务数
				item.set("taskCountNotCompletedOnTime", taskCountNotCompletedOnTime);
				// 分解计划数
				item.set("numberOfDecompositionPlans", entry.getValue().size());
				// 未完成计划数
				int numberOfUnfinishedPlans = (int) entry.getValue().stream().filter(entity -> !"已完成".equals(entity.getStr("task_status"))).count();
				item.set("numberOfUnfinishedPlans", numberOfUnfinishedPlans);
				// 已完成计划占比
				double toCompleteTheProportionOfThePlan = 0;
				if (numberOfUnfinishedPlans != entry.getValue().size()) {
					toCompleteTheProportionOfThePlan = NumberUtil.sub(1, NumberUtil.div(numberOfUnfinishedPlans, entry.getValue().size(), 2));
				}
				item.set("toCompleteTheProportionOfThePlan", toCompleteTheProportionOfThePlan);
				resultList.add(item);
			}
			double toCompleteTheProportionOfThePlanSum = resultList.stream().mapToDouble(entity -> entity.getDouble("toCompleteTheProportionOfThePlan")).sum();
			double totalProportion = NumberUtil.add(taskCountCompletedOnTime, toCompleteTheProportionOfThePlanSum);
			resultList = resultList.stream().map(entity -> {
				entity.set("totalProportion", NumberUtil.round(totalProportion, 2));
				return entity;
			}).collect(Collectors.toList());
		}
		return resultList;
	}

	// 任务全部完全的对象构建
	private Entity buildCompleteAllOnTime(String mainId, String secOrgName, int taskCount) {
		Entity entity = new Entity();
		// 单位编码
		entity.set("mainId", mainId);
		// 单位名称
		entity.set("secOrgName", secOrgName);
		// 任务总数
		entity.set("taskCount", taskCount);
		// 按时完成任务数
		entity.set("taskCountCompletedOnTime", taskCount);
		// 未按时完成任务数
		entity.set("taskCountNotCompletedOnTime", 0);
		// 分解计划数
		entity.set("numberOfDecompositionPlans", 0);
		// 未完成计划数
		entity.set("numberOfUnfinishedPlans", 0);
		// 未完成计划占比
		entity.set("toCompleteTheProportionOfThePlan", 0);
		// 总比例
		entity.set("totalProportion", taskCount);

		return entity;
	}

	@Bizlet("获取年度统计有问题数据")
	public List<Entity> queryNdtjDetails(String mainId) throws Exception {
		List<Entity> resultList = new ArrayList<Entity>();
		Session dbSession = new Session(DataSourceHelper.getDataSource());

		// 步骤1：查询主表关联的全量任务子项
		String querySqlByMainId = "SELECT * FROM zh_key_task_company_item WHERE main_id = ?";
		List<Entity> allItemDatas = dbSession.query(querySqlByMainId, mainId);

		// 步骤2：过滤无效数据 + 按【任务名称+衡量标准】分组
		Map<String, List<Entity>> mapData = allItemDatas.stream()
				// 优化：增加NULL值过滤，避免脏数据
				.filter(item -> StrUtil.isNotBlank(item.getStr("task_plan_name")) && !"/".equals(item.getStr("task_plan_name")))
				.collect(Collectors.groupingBy(item -> item.getStr("task_name") + "〓" + item.getStr("annual_target")));

		// 步骤3：筛选“有问题的任务组”
		List<Entity> tempList = new ArrayList<Entity>();
		for (Map.Entry<String, List<Entity>> entry : mapData.entrySet()) {
			// 判断：组内是否存在未完成任务
			boolean allCompleted = entry.getValue().stream().allMatch(entity -> "已完成".equals(entity.getStr("task_status")));
			if (!allCompleted) {
				List<String> keyList = StrUtil.split(entry.getKey(), "〓");
				Entity temp = new Entity().set("task_name", keyList.get(0)).set("annual_target", keyList.get(1));
				tempList.add(temp);
			}
		}

		// 步骤4：一次性查询所有异常组数据（解决N+1+排序碎片化问题）
		if (!tempList.isEmpty()) {
			// 提取所有需要查询的 task_name 和 annual_target（去重）
			List<String> taskNames = tempList.stream().map(temp -> temp.getStr("task_name")).distinct().collect(Collectors.toList());
			List<String> annualTargets = tempList.stream().map(temp -> temp.getStr("annual_target")).distinct().collect(Collectors.toList());

			// 构造IN条件的SQL（全局排序，确保四个维度连续）
			String queryResultSql = "SELECT zktci.*, zkcip.* " + "FROM zh_key_task_company_item AS zktci " + "LEFT JOIN zh_key_task_company_item_process AS zkcip ON zktci.id = zkcip.item_id "
					+ "WHERE zktci.main_id = ? " + "AND zktci.task_name IN (" + StrUtil.join(",", Collections.nCopies(taskNames.size(), "?")) + ") " + "AND zktci.annual_target IN ("
					+ StrUtil.join(",", Collections.nCopies(annualTargets.size(), "?")) + ") "
					+ "ORDER BY zktci.task_source, zktci.action_plan_number, zktci.task_name, zktci.annual_target, zktci.task_month ASC";

			// 组装参数
			List<Object> params = new ArrayList<>();
			params.add(mainId);
			params.addAll(taskNames);
			params.addAll(annualTargets);

			// 一次性查询所有数据（全局排序生效）
			resultList = dbSession.query(queryResultSql, params.toArray());
		}

		return resultList;
	}

	@Bizlet("导出Excel")
	public String export(Map<String, List<Entity>> mapData, String taskYear) throws Exception {
		Workbook workbook = new XSSFWorkbook();
		// 创建单元格样式
		CellStyle headerStyle = this.createHeaderStyle(workbook);
		CellStyle cellStyle = this.createCellStyle(workbook);

		Sheet sheet = workbook.createSheet(taskYear);
		// 设置总sheet列宽（按新列顺序）
		this.setAllDataColumnWidths(sheet);
		// 创建总sheet表头（第0列为任务责任单位）
		Row headerRow = sheet.createRow(0);
		createAllDataHeaderRow(headerRow, headerStyle);
		// 3. 获取数据和合并配置
		List<Entity> ndtjDatas = mapData.get("ndtjDatas");
		List<Entity> mergeConfig = mapData.get("mergeConfig");
		// 4. 填充数据行
		int rowIndex = 1;
		for (Entity data : ndtjDatas) {
			Row row = sheet.createRow(rowIndex);
			// 任务责任单位
			Cell cell0 = row.createCell(0);
			cell0.setCellValue(data.getStr("secOrgName"));
			cell0.setCellStyle(cellStyle);
			// 重点任务数
			Cell cell1 = row.createCell(1);
			cell1.setCellValue(data.getInt("taskCount"));
			cell1.setCellStyle(cellStyle);
			// 按时完成任务数
			Cell cell2 = row.createCell(2);
			cell2.setCellValue(data.getInt("taskCountCompletedOnTime"));
			cell2.setCellStyle(cellStyle);
			// 未按时完成任务数
			Cell cell3 = row.createCell(3);
			cell3.setCellValue(data.getInt("taskCountNotCompletedOnTime"));
			cell3.setCellStyle(cellStyle);
			// 分解计划数
			Cell cell4 = row.createCell(4);
			cell4.setCellValue(data.getInt("numberOfDecompositionPlans"));
			cell4.setCellStyle(cellStyle);
			// 未完成计划数
			Cell cell5 = row.createCell(5);
			cell5.setCellValue(data.getInt("numberOfUnfinishedPlans"));
			cell5.setCellStyle(cellStyle);
			// 未完成比例
			Cell cell6 = row.createCell(6);
			cell6.setCellValue(data.getDouble("toCompleteTheProportionOfThePlan"));
			cell6.setCellStyle(cellStyle);
			// 总比例
			Cell cell7 = row.createCell(7);
			cell7.setCellValue(data.getDouble("totalProportion"));
			cell7.setCellStyle(cellStyle);
			rowIndex++;
		}
		// 5. 处理合并单元格
		for (Entity config : mergeConfig) {
			int startRow = config.getInt("rowIndex");
			int rowSpan = config.getInt("rowSpan");
			int startCol = config.getInt("columnIndex");
			int colSpan = config.getInt("colSpan");
			if (rowSpan > 1) {
				// 转换为Excel实际行索引：startRow + 1（数据行从第1行开始）到 startRow + rowSpan
				int firstRow = startRow + 1;
				int lastRow = startRow + rowSpan;
				sheet.addMergedRegion(new CellRangeAddress(firstRow, lastRow, startCol, startCol + colSpan - 1));
			}
		}
		// 保存文件
		String filePath = saveWorkbook(workbook);
		Console.log("Excel导出成功，路径：{}", filePath);
		return filePath;
	}

	// 创建表头样式
	private CellStyle createHeaderStyle(Workbook workbook) {
		CellStyle style = workbook.createCellStyle();
		Font font = workbook.createFont();
		font.setBold(true);
		style.setFont(font);
		style.setFillPattern(FillPatternType.SOLID_FOREGROUND);
		style.setFillForegroundColor(IndexedColors.GREY_25_PERCENT.getIndex());
		style.setAlignment(HorizontalAlignment.CENTER);
		style.setVerticalAlignment(VerticalAlignment.CENTER);
		style.setBorderTop(BorderStyle.THIN);
		style.setBorderBottom(BorderStyle.THIN);
		style.setBorderLeft(BorderStyle.THIN);
		style.setBorderRight(BorderStyle.THIN);
		return style;
	}

	// 创建单元格样式
	private CellStyle createCellStyle(Workbook workbook) {
		CellStyle style = workbook.createCellStyle();
		style.setAlignment(HorizontalAlignment.LEFT);
		style.setVerticalAlignment(VerticalAlignment.CENTER);
		style.setBorderTop(BorderStyle.THIN);
		style.setBorderBottom(BorderStyle.THIN);
		style.setBorderLeft(BorderStyle.THIN);
		style.setBorderRight(BorderStyle.THIN);
		// 开启自动换行
		style.setWrapText(true);
		return style;
	}

	// 总数据sheet列宽设置（按新列顺序调整）
	private void setAllDataColumnWidths(Sheet sheet) {
		sheet.setColumnWidth(0, 35 * 256); // 0: 任务责任单位（新第0列）
		sheet.setColumnWidth(1, 15 * 256); // 1: 重点任务数
		sheet.setColumnWidth(2, 20 * 256); // 2: 按时完成任务数
		sheet.setColumnWidth(3, 20 * 256); // 3: 未按时完成任务数
		sheet.setColumnWidth(4, 15 * 256); // 4: 分解计划数
		sheet.setColumnWidth(5, 15 * 256); // 5: 未完成计划数
		sheet.setColumnWidth(6, 20 * 256); // 6: 已完成计划比例
		sheet.setColumnWidth(7, 20 * 256); // 7: 已完成任务总比例
	}

	// 总数据sheet表头创建（第0列为任务责任单位）
	private void createAllDataHeaderRow(Row headerRow, CellStyle headerStyle) {
		String[] headers = { "任务责任单位", "重点任务数", "按时完成任务数", "未按时完成任务数", "分解计划数", "未完成计划数", "已完成计划比例", "已完成任务总比例" };
		for (int i = 0; i < headers.length; i++) {
			Cell cell = headerRow.createCell(i);
			cell.setCellValue(headers[i]);
			cell.setCellStyle(headerStyle);
		}
	}

	// 保存Workbook到文件
	private String saveWorkbook(Workbook workbook) throws Exception {
		// 创建临时文件
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
		String datetimeString = format.format(new Date());
		File tempFile = File.createTempFile("公司重点任务导出_" + datetimeString, ".xlsx");
		try (FileOutputStream fos = new FileOutputStream(tempFile)) {
			workbook.write(fos);
		}
		return tempFile.getAbsolutePath();
	}

}
