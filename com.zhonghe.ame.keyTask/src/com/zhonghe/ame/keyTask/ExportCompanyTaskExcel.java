package com.zhonghe.ame.keyTask;

import java.io.File;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.stream.Collectors;

import org.apache.poi.ss.usermodel.*;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import cn.hutool.core.lang.Console;
import cn.hutool.core.util.StrUtil;
import cn.hutool.db.Entity;
import cn.hutool.db.Session;

import com.eos.common.connection.DataSourceHelper;
import com.eos.system.annotation.Bizlet;

import commonj.sdo.DataObject;

@Bizlet("公司重点任务导出")
public class ExportCompanyTaskExcel {

	@Bizlet("导出Excel")
	public String export(DataObject[] companyTasks) throws Exception {
		if (companyTasks == null || companyTasks.length == 0) {
			return null;
		}

		Session dbSession = new Session(DataSourceHelper.getDataSource());
		Workbook workbook = new XSSFWorkbook();
		CellStyle headerStyle = createHeaderStyle(workbook);
		CellStyle cellStyle = createCellStyle(workbook);
		CellStyle serialNumStyle = createSerialNumStyle(workbook);

		String queryTaskItemSql = "SELECT zktci.*, zkcip.* FROM zh_key_task_company_item AS zktci LEFT JOIN zh_key_task_company_item_process AS zkcip ON zktci.id = zkcip.item_id WHERE zktci.main_id = ?";

		if (companyTasks.length > 1) {
			List<Entity> allTaskItems = new ArrayList<>();
			for (DataObject task : companyTasks) {
				String mainId = task.getString("id");
				String secOrgName = task.getString("secondaryOrgname");
				List<Entity> itemList = dbSession.query(queryTaskItemSql, mainId);
				for (Entity entity : itemList) {
					entity.set("secOrgName", getSafeValue(secOrgName));
					entity.set("task_source", getSafeValue(entity.getStr("task_source")));
					entity.set("task_num", getSafeValue(entity.getStr("task_num")));
				}
				allTaskItems.addAll(itemList);
			}

			Sheet allSheet = workbook.createSheet("全部数据");
			allSheet.createFreezePane(7, 0, 7, 0);
			setAllDataColumnWidths(allSheet);
			Row allHeader = allSheet.createRow(0);
			createAllDataHeaderRow(allHeader, headerStyle);

			Map<String, List<Entity>> orgGroup = allTaskItems.stream().collect(Collectors.groupingBy(e -> e.getStr("secOrgName")));
			List<String> orgNames = new ArrayList<>(orgGroup.keySet());
			Collections.sort(orgNames);

			int currentRow = 1;
			int serialNumCounter = 1;

			for (String orgName : orgNames) {
				List<Entity> orgData = orgGroup.get(orgName);
				Collections.sort(orgData, new Comparator<Entity>() {
					@Override
					public int compare(Entity o1, Entity o2) {
						int num1 = parseTaskNum(o1.getStr("task_num"));
						int num2 = parseTaskNum(o2.getStr("task_num"));
						if (num1 != num2)
							return Integer.compare(num1, num2);
						int sourceComp = o1.getStr("task_source").compareTo(o2.getStr("task_source"));
						if (sourceComp != 0)
							return sourceComp;
						return getSafeValue(o1.getStr("action_plan_number")).compareTo(getSafeValue(o2.getStr("action_plan_number")));
					}
				});

				int groupStartRow = currentRow;
				for (Entity entity : orgData) {
					Row row = allSheet.createRow(currentRow++);
					fillAllSheetRow(row, entity, orgName, cellStyle);
				}
				int groupEndRow = currentRow - 1;

				// 合并业务列并获取行动编号列的合并区间
				List<CellRangeAddress> taskNumRegions = mergeAllSheetColumns(allSheet, groupStartRow, groupEndRow);
				// 处理序号列，直接复用行动编号列的合并区间（含单行补充）
				serialNumCounter = handleSerialNumberColumn(allSheet, groupStartRow, groupEndRow, taskNumRegions, serialNumStyle, serialNumCounter);
			}
		}

		// 生成各责任单位独立Sheet
		for (DataObject task : companyTasks) {
			String mainId = task.getString("id");
			String secOrgName = task.getString("secondaryOrgname");
			List<Entity> itemList = dbSession.query(queryTaskItemSql, mainId);
			for (Entity entity : itemList) {
				entity.set("task_source", getSafeValue(entity.getStr("task_source")));
				entity.set("task_num", getSafeValue(entity.getStr("task_num")));
			}

			Sheet sheet = workbook.createSheet(secOrgName);
			sheet.createFreezePane(5, 0, 5, 0);
			setColumnWidths(sheet);
			Row header = sheet.createRow(0);
			createHeaderRow(header, headerStyle);

			Collections.sort(itemList, new Comparator<Entity>() {
				@Override
				public int compare(Entity o1, Entity o2) {
					int num1 = parseTaskNum(o1.getStr("task_num"));
					int num2 = parseTaskNum(o2.getStr("task_num"));
					if (num1 != num2)
						return Integer.compare(num1, num2);
					int sourceComp = o1.getStr("task_source").compareTo(o2.getStr("task_source"));
					if (sourceComp != 0)
						return sourceComp;
					return getSafeValue(o1.getStr("action_plan_number")).compareTo(getSafeValue(o2.getStr("action_plan_number")));
				}
			});

			int currentRow = 1;
			int groupStart = currentRow;
			for (Entity entity : itemList) {
				Row row = sheet.createRow(currentRow++);
				fillSingleOrgSheetRow(row, entity, cellStyle);
			}
			int groupEnd = currentRow - 1;
			mergeSingleOrgSheetColumns(sheet, groupStart, groupEnd);
		}

		String path = saveWorkbook(workbook);
		Console.log("Excel导出成功，路径：{}", path);
		return path;
	}

	// ==================== 核心方法 ====================

	private void fillAllSheetRow(Row row, Entity entity, String orgName, CellStyle style) {
		createCell(row, 1, orgName, style);
		createCell(row, 2, entity.getStr("task_source"), style);
		createCell(row, 3, getSafeValue(entity.getStr("action_plan_number")), style);
		createCell(row, 4, entity.getStr("task_num"), style);
		createCell(row, 5, getSafeValue(entity.getStr("task_name")), style);
		createCell(row, 6, getSafeValue(entity.getStr("annual_target")), style);
		createCell(row, 7, entity.getStr("task_month") + "月", style);
		createCell(row, 8, getSafeValue(entity.getStr("task_plan_name")), style);
		createCell(row, 9, getSafeValue(entity.getStr("responsible_person")), style);
		createCell(row, 10, getSafeValue(entity.getStr("task_status")), style);
		createCell(row, 11, getSafeValue(entity.getStr("risk_status")), style);
		createCell(row, 12, getSafeValue(entity.getStr("task_progress")), style);
		createCell(row, 13, getSafeValue(entity.getStr("risk_measures")), style);
		createCell(row, 14, getAppStatusStr(entity.getStr("app_status"), entity.getStr("task_status"), entity.getStr("task_progress")), style);
	}

	private void fillSingleOrgSheetRow(Row row, Entity entity, CellStyle style) {
		createCell(row, 0, entity.getStr("task_source"), style);
		createCell(row, 1, getSafeValue(entity.getStr("action_plan_number")), style);
		createCell(row, 2, entity.getStr("task_num"), style);
		createCell(row, 3, getSafeValue(entity.getStr("task_name")), style);
		createCell(row, 4, getSafeValue(entity.getStr("annual_target")), style);
		createCell(row, 5, entity.getStr("task_month") + "月", style);
		createCell(row, 6, getSafeValue(entity.getStr("task_plan_name")), style);
		createCell(row, 7, getSafeValue(entity.getStr("responsible_person")), style);
		createCell(row, 8, getSafeValue(entity.getStr("task_status")), style);
		createCell(row, 9, getSafeValue(entity.getStr("risk_status")), style);
		createCell(row, 10, getSafeValue(entity.getStr("task_progress")), style);
		createCell(row, 11, getSafeValue(entity.getStr("risk_measures")), style);
		createCell(row, 12, getAppStatusStr(entity.getStr("app_status"), entity.getStr("task_status"), entity.getStr("task_progress")), style);
	}

	// 合并业务列并**仅返回行动编号列**的合并区间（修复核心1：移除多余收集）
	private List<CellRangeAddress> mergeAllSheetColumns(Sheet sheet, int startRow, int endRow) {
		if (startRow >= endRow)
			return new ArrayList<>();
		List<CellRangeAddress> taskNumRegions = new ArrayList<>();
		// 仅合并，不收集责任单位列区间（删除原有的addAll）
		mergeColumn(sheet, 1, startRow, endRow);
		mergeColumn(sheet, 2, startRow, endRow);
		mergeColumn(sheet, 3, startRow, endRow);
		// 只收集行动编号列（4列）的合并区间
		taskNumRegions.addAll(mergeColumn(sheet, 4, startRow, endRow));
		mergeColumn(sheet, 5, startRow, endRow);
		mergeColumn(sheet, 6, startRow, endRow);
		return taskNumRegions;
	}

	private void mergeSingleOrgSheetColumns(Sheet sheet, int startRow, int endRow) {
		if (startRow >= endRow)
			return;
		mergeColumn(sheet, 0, startRow, endRow);
		mergeColumn(sheet, 1, startRow, endRow);
		mergeColumn(sheet, 2, startRow, endRow);
		mergeColumn(sheet, 3, startRow, endRow);
		mergeColumn(sheet, 4, startRow, endRow);
	}

	// 合并单列并返回该列的合并区间
	private List<CellRangeAddress> mergeColumn(Sheet sheet, int colIndex, int startRow, int endRow) {
		List<CellRangeAddress> regions = new ArrayList<>();
		if (startRow >= endRow)
			return regions;

		String currentVal = getCellValue(sheet, startRow, colIndex);
		int mergeStart = startRow;

		for (int rowIdx = startRow + 1; rowIdx <= endRow; rowIdx++) {
			String val = getCellValue(sheet, rowIdx, colIndex);
			if (!Objects.equals(currentVal, val)) {
				if (mergeStart < rowIdx - 1) {
					CellRangeAddress region = new CellRangeAddress(mergeStart, rowIdx - 1, colIndex, colIndex);
					sheet.addMergedRegion(region);
					regions.add(region);
					clearCells(sheet, colIndex, mergeStart + 1, rowIdx - 1);
				}
				currentVal = val;
				mergeStart = rowIdx;
			}
		}

		if (mergeStart < endRow) {
			CellRangeAddress region = new CellRangeAddress(mergeStart, endRow, colIndex, colIndex);
			sheet.addMergedRegion(region);
			regions.add(region);
			clearCells(sheet, colIndex, mergeStart + 1, endRow);
		}
		return regions;
	}

	// 处理序号列：复用行动编号区间+补充单行块（修复核心2：解决单行遗漏+无重叠）
	private int handleSerialNumberColumn(Sheet sheet, int startRow, int endRow, List<CellRangeAddress> taskNumRegions, CellStyle style, int counter) {
		// 1. 先标记所有已处理的行，避免重复
		Set<Integer> processedRows = new HashSet<>();
		// 2. 处理多行的行动编号块（原有合并区间）
		for (CellRangeAddress region : taskNumRegions) {
			int first = region.getFirstRow();
			int last = region.getLastRow();
			// 序号列创建相同合并区间
			sheet.addMergedRegion(new CellRangeAddress(first, last, 0, 0));
			// 赋值序号
			createCell(sheet.getRow(first), 0, String.valueOf(counter++), style);
			// 清空非首行
			clearCells(sheet, 0, first + 1, last);
			// 标记已处理行
			for (int i = first; i <= last; i++)
				processedRows.add(i);
		}
		// 3. 处理单行的行动编号块（补充原有未收集的单行，无合并但赋值序号）
		for (int rowIdx = startRow; rowIdx <= endRow; rowIdx++) {
			if (!processedRows.contains(rowIdx)) {
				// 单行直接赋值，不合并
				createCell(sheet.getRow(rowIdx), 0, String.valueOf(counter++), style);
				processedRows.add(rowIdx);
			}
		}
		return counter;
	}

	// ==================== 工具方法 ====================

	private void createCell(Row row, int col, String value, CellStyle style) {
		Cell cell = row.createCell(col);
		cell.setCellValue(getSafeValue(value));
		cell.setCellStyle(style);
	}

	private String getCellValue(Sheet sheet, int rowIdx, int colIdx) {
		Row row = sheet.getRow(rowIdx);
		if (row == null)
			return "";
		Cell cell = row.getCell(colIdx);
		if (cell == null)
			return "";
		return getSafeValue(cell.getStringCellValue());
	}

	private void clearCells(Sheet sheet, int colIdx, int startRow, int endRow) {
		for (int i = startRow; i <= endRow; i++) {
			Row row = sheet.getRow(i);
			if (row != null) {
				Cell cell = row.getCell(colIdx);
				if (cell != null)
					cell.setCellValue("");
			}
		}
	}

	private String getSafeValue(String value) {
		return StrUtil.isBlank(value) ? "" : value.trim();
	}

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

	private CellStyle createCellStyle(Workbook workbook) {
		CellStyle style = workbook.createCellStyle();
		style.setAlignment(HorizontalAlignment.LEFT);
		style.setVerticalAlignment(VerticalAlignment.CENTER);
		style.setBorderTop(BorderStyle.THIN);
		style.setBorderBottom(BorderStyle.THIN);
		style.setBorderLeft(BorderStyle.THIN);
		style.setBorderRight(BorderStyle.THIN);
		style.setWrapText(true);
		return style;
	}

	private CellStyle createSerialNumStyle(Workbook workbook) {
		CellStyle style = workbook.createCellStyle();
		style.setAlignment(HorizontalAlignment.CENTER);
		style.setVerticalAlignment(VerticalAlignment.CENTER);
		style.setBorderTop(BorderStyle.THIN);
		style.setBorderBottom(BorderStyle.THIN);
		style.setBorderLeft(BorderStyle.THIN);
		style.setBorderRight(BorderStyle.THIN);
		style.setWrapText(true);
		return style;
	}

	private void setAllDataColumnWidths(Sheet sheet) {
		sheet.setColumnWidth(0, 8 * 256);
		sheet.setColumnWidth(1, 30 * 256);
		sheet.setColumnWidth(2, 12 * 256);
		sheet.setColumnWidth(3, 30 * 256);
		sheet.setColumnWidth(4, 15 * 256);
		sheet.setColumnWidth(5, 50 * 256);
		sheet.setColumnWidth(6, 50 * 256);
		sheet.setColumnWidth(7, 10 * 256);
		sheet.setColumnWidth(8, 50 * 256);
		sheet.setColumnWidth(9, 10 * 256);
		sheet.setColumnWidth(10, 10 * 256);
		sheet.setColumnWidth(11, 10 * 256);
		sheet.setColumnWidth(12, 50 * 256);
		sheet.setColumnWidth(13, 50 * 256);
		sheet.setColumnWidth(14, 10 * 256);
	}

	private void setColumnWidths(Sheet sheet) {
		sheet.setColumnWidth(0, 12 * 256);
		sheet.setColumnWidth(1, 30 * 256);
		sheet.setColumnWidth(2, 15 * 256);
		sheet.setColumnWidth(3, 50 * 256);
		sheet.setColumnWidth(4, 50 * 256);
		sheet.setColumnWidth(5, 10 * 256);
		sheet.setColumnWidth(6, 50 * 256);
		sheet.setColumnWidth(7, 10 * 256);
		sheet.setColumnWidth(8, 10 * 256);
		sheet.setColumnWidth(9, 10 * 256);
		sheet.setColumnWidth(10, 50 * 256);
		sheet.setColumnWidth(11, 50 * 256);
		sheet.setColumnWidth(12, 10 * 256);
	}

	private void createAllDataHeaderRow(Row headerRow, CellStyle headerStyle) {
		String[] headers = { "序号", "任务责任单位", "任务来源", "任务名称", "行动编号", "行动计划", "衡量标准", "时间节点", "分解计划", "责任人", "任务状态", "风险状态", "进展情况", "风险及措施", "审批状态" };
		for (int i = 0; i < headers.length; i++) {
			Cell cell = headerRow.createCell(i);
			cell.setCellValue(headers[i]);
			cell.setCellStyle(headerStyle);
		}
	}

	private void createHeaderRow(Row headerRow, CellStyle headerStyle) {
		String[] headers = { "任务来源", "任务名称", "行动编号", "行动计划", "衡量标准", "时间节点", "分解计划", "责任人", "任务状态", "风险状态", "进展情况", "风险及措施", "审批状态" };
		for (int i = 0; i < headers.length; i++) {
			Cell cell = headerRow.createCell(i);
			cell.setCellValue(headers[i]);
			cell.setCellStyle(headerStyle);
		}
	}

	private String saveWorkbook(Workbook workbook) throws Exception {
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
		String dateStr = format.format(new Date());
		File file = File.createTempFile("公司重点任务导出_" + dateStr, ".xlsx");
		try (FileOutputStream fos = new FileOutputStream(file)) {
			workbook.write(fos);
		}
		return file.getAbsolutePath();
	}

	private String getAppStatusStr(String appStatus, String taskStatus, String taskProgress) {
		if (StrUtil.isAllBlank(appStatus, taskStatus, taskProgress))
			return "未填报";
		if (StrUtil.isAllNotBlank(taskStatus, taskProgress) && StrUtil.isBlank(appStatus))
			return "待审核";
		if ("2".equals(appStatus))
			return "审批通过";
		if ("1".equals(appStatus))
			return "审批中";
		if ("4".equals(appStatus))
			return "作废";
		return "";
	}

	private int parseTaskNum(String numStr) {
		if (StrUtil.isBlank(numStr))
			return 0;
		try {
			return Integer.parseInt(numStr.trim());
		} catch (NumberFormatException e) {
			return 0;
		}
	}
}
