package com.zhonghe.ame.keyTask;

import java.io.File;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Optional;
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
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import cn.hutool.core.lang.Console;
import cn.hutool.core.lang.Dict;
import cn.hutool.core.util.NumberUtil;
import cn.hutool.db.Entity;
import cn.hutool.db.Session;

import com.eos.common.connection.DataSourceHelper;
import com.eos.system.annotation.Bizlet;

import commonj.sdo.DataObject;

@Bizlet("公司重点任务工具类")
public class CompanyUtil {

	@Bizlet("季度统计")
	public List<Entity> quarterlyStatistics(String taskYear, int taskMonth) throws Exception {
		List<Entity> resultList = new ArrayList<Entity>();
		Session dbSession = new Session(DataSourceHelper.getDataSource());
		String queryCompanySql = "SELECT * FROM zh_key_task_company WHERE task_year = ? AND app_status = 2 ORDER BY secondary_org ASC";
		List<Entity> companyList = dbSession.query(queryCompanySql, taskYear);
		if (companyList != null && companyList.size() > 0) {
			for (Entity company : companyList) {
				Entity jdtjEntity = new Entity();
				jdtjEntity.set("id", company.getStr("id"));
				jdtjEntity.set("taskYear", taskYear);
				jdtjEntity.set("taskMonth", taskMonth);
				jdtjEntity.set("secOrgName", company.getStr("secondary_orgname"));
				// 总数
				jdtjEntity.set("taskCount", this.taskCount(company.getStr("id"), dbSession));
				String querySql = "SELECT zktci.* FROM zh_key_task_company_item AS zktci, zh_key_task_company_item_process AS zktcip WHERE zktci.id = zktcip.item_id AND zktcip.app_status = 2 AND zktci.main_id = ? AND zktci.task_month <= ?";
				List<Entity> itemDatas = dbSession.query(querySql, company.getStr("id"), taskMonth);
				// 正常推进
				jdtjEntity.set("normalProgressCount", this.normalProgressCount(itemDatas));
				// 一定风险
				jdtjEntity.set("certainRiskCount", this.certainRiskCount(itemDatas));
				// 极大风险
				jdtjEntity.set("greatRiskCount", this.greatRiskCount(itemDatas));
				// 正常推进率
				jdtjEntity.set("normalPropulsionRate", NumberUtil.decimalFormat("#.##%", NumberUtil.div(jdtjEntity.getInt("normalProgressCount"), jdtjEntity.getInt("taskCount"), 2)));
				resultList.add(jdtjEntity);
			}
		}
		return resultList;
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

	@Bizlet("获取季度统计有问题数据")
	public List<Entity> queryJdtjDetails(String mainId, String taskYear, int taskMonth, String type) throws Exception {
		List<Entity> resultList = new ArrayList<Entity>();
		List<Entity> tempList = new ArrayList<Entity>();
		Session dbSession = new Session(DataSourceHelper.getDataSource());
		String querySql = "SELECT zktci.*, zktcip.app_status, zktcip.process_id FROM zh_key_task_company_item AS zktci, zh_key_task_company_item_process AS zktcip WHERE zktci.id = zktcip.item_id AND zktcip.app_status = 2 AND zktci.main_id = ? AND zktci.task_month <= ?";
		List<Entity> itemDatas = dbSession.query(querySql, mainId, taskMonth);
		Map<String, Optional<Entity>> maxMonthTasksByGroup = itemDatas.stream().collect(
				Collectors.groupingBy(item -> item.getStr("task_name") + item.getStr("annual_target"),
						Collectors.maxBy((t1, t2) -> ((Entity) t1).getInt("task_month").compareTo(((Entity) t2).getInt("task_month")))));
		if ("certainRisk".equals(type)) {
			tempList = maxMonthTasksByGroup.values().stream().map(Optional::get).filter(task -> "低风险".equals(task.getStr("risk_status"))).collect(Collectors.toList());
		}
		if ("greatRisk".equals(type)) {
			tempList = maxMonthTasksByGroup.values().stream().map(Optional::get).filter(task -> "高风险".equals(task.getStr("risk_status"))).collect(Collectors.toList());
		}
		String queryResultSql = "SELECT zktci.*, zkcip.* FROM zh_key_task_company_item AS zktci LEFT JOIN zh_key_task_company_item_process AS zkcip ON zktci.id = zkcip.item_id WHERE zktci.main_id = ? AND zktci.task_name = ? AND zktci.annual_target = ? ORDER BY zktci.task_month ASC";
		for (Entity temp : tempList) {
			List<Entity> datas = dbSession.query(queryResultSql, temp.getStr("main_id"), temp.getStr("task_name"), temp.getStr("annual_target"));
			resultList.addAll(datas);
		}
		return resultList;
	}

	@Bizlet("导出Excel")
	public String export(Entity[] companyTasks, String taskYear, String taskMonth) throws Exception {
		Workbook workbook = new XSSFWorkbook();
		// 创建单元格样式
		CellStyle headerStyle = this.createHeaderStyle(workbook);
		CellStyle cellStyle = this.createCellStyle(workbook);
		// 新增：创建“全部数据”sheet（核心修改部分）
		Sheet allDataSheet = workbook.createSheet(taskYear + "-" + taskMonth);
		// 设置总sheet列宽（按新列顺序）
		this.setAllDataColumnWidths(allDataSheet);
		// 创建总sheet表头（第0列为任务责任单位）
		Row allHeaderRow = allDataSheet.createRow(0);
		this.createAllDataHeaderRow(allHeaderRow, headerStyle);
		int allRowIndex = 1; // 从第1行开始（跳过表头）
		for (int j = 0; j < companyTasks.length; j++) {
			Entity taskItem = companyTasks[j];
			Row row = allDataSheet.createRow(allRowIndex + j);
			// 0: 任务责任单位（每行填充）
			Cell cell0 = row.createCell(0);
			cell0.setCellValue(taskItem.getStr("secOrgName"));
			cell0.setCellStyle(cellStyle);
			// 1: 任务总数（每行填充）
			Cell cell1 = row.createCell(1);
			cell1.setCellValue(taskItem.getInt("taskCount"));
			cell1.setCellStyle(cellStyle);
			// 1: 其中：正常推进（每行填充）
			Cell cell2 = row.createCell(2);
			cell2.setCellValue(taskItem.getInt("normalProgressCount"));
			cell2.setCellStyle(cellStyle);
			// 1: 其中：一定风险（每行填充）
			Cell cell3 = row.createCell(3);
			cell3.setCellValue(taskItem.getInt("certainRiskCount"));
			cell3.setCellStyle(cellStyle);
			// 1: 其中：极大风险（每行填充）
			Cell cell4 = row.createCell(4);
			cell4.setCellValue(taskItem.getInt("greatRiskCount"));
			cell4.setCellStyle(cellStyle);
			// 1: 正常推进率（每行填充）
			Cell cell5 = row.createCell(5);
			cell5.setCellValue(taskItem.getStr("normalPropulsionRate"));
			cell5.setCellStyle(cellStyle);
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
		sheet.setColumnWidth(0, 50 * 256); // 0: 任务责任单位（新第0列）
		sheet.setColumnWidth(1, 20 * 256); // 1: 任务总数（新第1列）
		sheet.setColumnWidth(2, 20 * 256); // 2: 其中：正常推进（新第2列）
		sheet.setColumnWidth(3, 20 * 256); // 3: 其中：一定风险（新第3列）
		sheet.setColumnWidth(4, 20 * 256); // 4: 其中：极大风险（新第4列）
		sheet.setColumnWidth(5, 20 * 256); // 5: 正常推进率（新第5列）
	}

	// 总数据sheet表头创建（第0列为任务责任单位）
	private void createAllDataHeaderRow(Row headerRow, CellStyle headerStyle) {
		String[] headers = { "任务责任单位", "任务总数", "其中：正常推进", "其中：一定风险", "其中：极大风险", "正常推进率" };
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
