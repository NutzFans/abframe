package com.zhonghe.ame.keyTask;

import java.io.File;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;
import java.util.Map;
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
		if (companyTasks.length > 0) {
			Session dbSession = new Session(DataSourceHelper.getDataSource());
			Workbook workbook = new XSSFWorkbook();
			// 创建单元格样式
			CellStyle headerStyle = this.createHeaderStyle(workbook);
			CellStyle cellStyle = this.createCellStyle(workbook);

			String queryTaskItemSql = "SELECT zktci.*, zkcip.* FROM zh_key_task_company_item AS zktci LEFT JOIN zh_key_task_company_item_process AS zkcip ON zktci.id = zkcip.item_id WHERE zktci.main_id = ?";

			if (companyTasks.length > 1) {
				// 第一步：先收集所有任务项（用于“全部数据”sheet）
				List<Entity> allTaskItems = new ArrayList<>();
				for (int i = 0; i < companyTasks.length; i++) {
					String mainId = companyTasks[i].getString("id");
					String secOrgName = companyTasks[i].getString("secondaryOrgname");
					List<Entity> taskItemList = dbSession.query(queryTaskItemSql, mainId);
					// 为每个任务项添加“任务责任单位”信息
					for (Entity item : taskItemList) {
						item.set("secOrgName", secOrgName);
					}
					allTaskItems.addAll(taskItemList);
				}
				// 新增：创建“全部数据”sheet（核心修改部分）
				Sheet allDataSheet = workbook.createSheet("全部数据");
				// 设置总sheet列宽（按新列顺序）
				this.setAllDataColumnWidths(allDataSheet);
				// 冻结前4列（新列0-3：任务责任单位、行动计划编号、任务名称、年度目标）
				allDataSheet.createFreezePane(4, 0, 4, 0);
				// 创建总sheet表头（第0列为任务责任单位）
				Row allHeaderRow = allDataSheet.createRow(0);
				this.createAllDataHeaderRow(allHeaderRow, headerStyle);

				// 第一步：按“任务责任单位”分组（外层大组）
				Map<String, List<Entity>> orgGroupMap = allTaskItems.stream().collect(Collectors.groupingBy(taskItem -> taskItem.getStr("secOrgName")));

				// 按责任单位名称排序（确保顺序一致）
				List<String> sortedOrgNames = new ArrayList<>(orgGroupMap.keySet());
				Collections.sort(sortedOrgNames);

				int allRowIndex = 1; // 从第1行开始（跳过表头）

				for (String orgName : sortedOrgNames) {
					List<Entity> orgTaskItems = orgGroupMap.get(orgName);

					// 第二步：在当前责任单位内部，按“行动计划编号+任务名称+年度目标”分内层子组
					Map<String, List<Entity>> innerGroupMap = orgTaskItems.stream().collect(
							Collectors.groupingBy(taskItem -> taskItem.getStr("action_plan_number") + "|" + taskItem.getStr("task_name") + "|" + taskItem.getStr("annual_target")));

					// 计算当前责任单位的总数据行数（用于合并“任务责任单位”列）
					int orgTotalRows = orgTaskItems.size();
					// 合并当前责任单位的“任务责任单位”列（第0列）
					if (orgTotalRows > 1) {
						allDataSheet.addMergedRegion(new CellRangeAddress(allRowIndex, allRowIndex + orgTotalRows - 1, 0, 0)); // 第0列：任务责任单位
					}

					// 遍历当前责任单位的内层子组
					for (Map.Entry<String, List<Entity>> innerEntry : innerGroupMap.entrySet()) {
						List<Entity> innerGroup = innerEntry.getValue();
						// 按时间节点升序排序
						Collections.sort(innerGroup, Comparator.comparingInt(o -> o.getInt("task_month")));
						int innerGroupSize = innerGroup.size();

						// 合并内层子组的列（1-3列：行动计划编号、任务名称、年度目标）
						if (innerGroupSize > 1) {
							allDataSheet.addMergedRegion(new CellRangeAddress(allRowIndex, allRowIndex + innerGroupSize - 1, 1, 1)); // 第1列：行动计划编号
							allDataSheet.addMergedRegion(new CellRangeAddress(allRowIndex, allRowIndex + innerGroupSize - 1, 2, 2)); // 第2列：任务名称
							allDataSheet.addMergedRegion(new CellRangeAddress(allRowIndex, allRowIndex + innerGroupSize - 1, 3, 3)); // 第3列：年度目标
						}

						// 填充内层子组数据
						for (int j = 0; j < innerGroupSize; j++) {
							Entity taskItem = innerGroup.get(j);
							Row row = allDataSheet.createRow(allRowIndex + j);

							// 0: 任务责任单位（整个责任单位合并，仅第1行填充）
							Cell cell0 = row.createCell(0);
							if (allRowIndex == row.getRowNum()) { // 责任单位内第一行填充名称
								cell0.setCellValue(orgName);
							}
							cell0.setCellStyle(cellStyle);

							// 1: 任务名称
							Cell cell1 = row.createCell(1);
							if (j == 0) {
								cell1.setCellValue(taskItem.getStr("action_plan_number"));
							}
							cell1.setCellStyle(cellStyle);

							// 2: 行动计划
							Cell cell2 = row.createCell(2);
							if (j == 0) {
								cell2.setCellValue(taskItem.getStr("task_name"));
							}
							cell2.setCellStyle(cellStyle);

							// 3: 衡量标准
							Cell cell3 = row.createCell(3);
							if (j == 0) {
								cell3.setCellValue(taskItem.getStr("annual_target"));
							}
							cell3.setCellStyle(cellStyle);

							// 4: 时间节点（每行填充）
							Cell cell4 = row.createCell(4);
							cell4.setCellValue(taskItem.getStr("task_month") + "月");
							cell4.setCellStyle(cellStyle);

							// 5: 分解计划（每行填充）
							Cell cell5 = row.createCell(5);
							cell5.setCellValue(taskItem.getStr("task_plan_name"));
							cell5.setCellStyle(cellStyle);
							
							// 6: 责任人（每行填充）
							Cell cell6 = row.createCell(6);
							cell6.setCellValue(taskItem.getStr("responsible_person"));
							cell6.setCellStyle(cellStyle);

							// 7: 任务状态（每行填充）
							Cell cell7 = row.createCell(7);
							cell7.setCellValue(taskItem.getStr("task_status"));
							cell7.setCellStyle(cellStyle);

							// 8: 风险状态（每行填充）
							Cell cell8 = row.createCell(8);
							cell8.setCellValue(taskItem.getStr("risk_status"));
							cell8.setCellStyle(cellStyle);

							// 9: 进展情况（每行填充）
							Cell cell9 = row.createCell(9);
							cell9.setCellValue(taskItem.getStr("task_progress"));
							cell9.setCellStyle(cellStyle);

							// 10: 风险及措施（每行填充）
							Cell cell10 = row.createCell(10);
							cell10.setCellValue(taskItem.getStr("risk_measures"));
							cell10.setCellStyle(cellStyle);

							// 11：审批状态（每行填充）
							Cell cell11 = row.createCell(11);
							String appStatusStr = this.getAppStatusStr(taskItem.getStr("app_status"), taskItem.getStr("task_status"), taskItem.getStr("task_progress"));
							cell11.setCellValue(appStatusStr);
							cell11.setCellStyle(cellStyle);

						}

						// 移动到下一个子组的起始行
						allRowIndex += innerGroupSize;
					}
				}
			}

			for (int i = 0; i < companyTasks.length; i++) {
				String mainId = companyTasks[i].getString("id");
				String secOrgName = companyTasks[i].getString("secondaryOrgname");
				List<Entity> taskItemList = dbSession.query(queryTaskItemSql, mainId);
				Sheet sheet = workbook.createSheet(secOrgName);

				// 设置单元格宽度
				this.setColumnWidths(sheet);

				// 冻结前3列（参数含义：冻结列数，冻结行数，右侧滚动区域起始列，下方滚动区域起始行）
				sheet.createFreezePane(3, 0, 3, 0);

				// 创建表头行
				Row headerRow = sheet.createRow(0);
				this.createHeaderRow(headerRow, headerStyle);

				// 按“行动计划编号+任务名称+年度目标”分组
				Map<String, List<Entity>> groupTaskItem = taskItemList.stream().collect(
						Collectors.groupingBy(taskItem -> taskItem.getStr("action_plan_number") + "|" + taskItem.getStr("task_name") + "|" + taskItem.getStr("annual_target")));

				// 遍历分组，每组内部按“时间节点”升序排序
				int rowIndex = 1; // 从第1行开始（跳过表头）
				for (Map.Entry<String, List<Entity>> entry : groupTaskItem.entrySet()) {
					List<Entity> group = entry.getValue();
					// 核心：对当前分组按“时间节点”升序排序
					Collections.sort(group, new Comparator<Entity>() {
						@Override
						public int compare(Entity o1, Entity o2) {
							return Integer.compare(o1.getInt("task_month"), o2.getInt("task_month")); // 升序（小→大）
						}
					});
					int groupSize = group.size(); // 排序后的数据量
					// 合并单元格（仅当分组记录数>1时）
					if (groupSize > 1) {
						// 合并“行动计划编号”列（第0列）
						sheet.addMergedRegion(new CellRangeAddress(rowIndex, rowIndex + groupSize - 1, 0, 0));
						// 合并“任务名称”列（第1列）
						sheet.addMergedRegion(new CellRangeAddress(rowIndex, rowIndex + groupSize - 1, 1, 1));
						// 合并“年度目标”列（第2列）
						sheet.addMergedRegion(new CellRangeAddress(rowIndex, rowIndex + groupSize - 1, 2, 2));
					}
					// 填充分组内数据（已按时间节点排序）
					for (int j = 0; j < groupSize; j++) {
						Entity taskItem = group.get(j);
						Row row = sheet.createRow(rowIndex + j);
						// 合并列（0、1、2列）：无论是否为第1行，都创建单元格并应用样式（确保边框完整）
						// 任务名称（第0列）
						Cell cell0 = row.createCell(0);
						if (j == 0) { // 仅第1行填充内容
							cell0.setCellValue(taskItem.getStr("action_plan_number"));
						}
						cell0.setCellStyle(cellStyle); // 所有行的该列都应用边框样式

						// 行动计划（第1列）
						Cell cell1 = row.createCell(1);
						if (j == 0) {
							cell1.setCellValue(taskItem.getStr("task_name"));
						}
						cell1.setCellStyle(cellStyle);

						// 衡量标准（第2列）
						Cell cell2 = row.createCell(2);
						if (j == 0) {
							cell2.setCellValue(taskItem.getStr("annual_target"));
						}
						cell2.setCellStyle(cellStyle);
						// 非合并列每行填充
						// 时间节点（第3列）
						Cell cell3 = row.createCell(3);
						cell3.setCellValue(taskItem.getStr("task_month") + "月");
						cell3.setCellStyle(cellStyle);
						// 分解计划（第4列）
						Cell cell4 = row.createCell(4);
						cell4.setCellValue(taskItem.getStr("task_plan_name"));
						cell4.setCellStyle(cellStyle);
						// 责任人（第5列）
						Cell cell5 = row.createCell(5);
						cell5.setCellValue(taskItem.getStr("responsible_person"));
						cell5.setCellStyle(cellStyle);
						// 任务状态（第5列）
						Cell cell6 = row.createCell(6);
						cell6.setCellValue(taskItem.getStr("task_status"));
						cell6.setCellStyle(cellStyle);
						// 风险状态（第6列）
						Cell cell7 = row.createCell(7);
						cell7.setCellValue(taskItem.getStr("risk_status"));
						cell7.setCellStyle(cellStyle);
						// 进展情况（第7列）
						Cell cell8 = row.createCell(8);
						cell8.setCellValue(taskItem.getStr("task_progress"));
						cell8.setCellStyle(cellStyle);
						// 风险及措施（第8列）
						Cell cell9 = row.createCell(9);
						cell9.setCellValue(taskItem.getStr("risk_measures"));
						cell9.setCellStyle(cellStyle);
						// 审批状态（第9列）
						Cell cell10 = row.createCell(10);
						String appStatusStr = this.getAppStatusStr(taskItem.getStr("app_status"), taskItem.getStr("task_status"), taskItem.getStr("task_progress"));
						cell10.setCellValue(appStatusStr);
						cell10.setCellStyle(cellStyle);
					}
					rowIndex += groupSize; // 移动到下一分组起始行
				}

			}
			// 保存文件
			String filePath = saveWorkbook(workbook);
			Console.log("Excel导出成功，路径：{}", filePath);
			return filePath;
		} else {
			return null;
		}
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

	// 设置所有列的宽度
	private void setColumnWidths(Sheet sheet) {
		// 列索引从0开始，宽度值 = 字符数 * 256（1/256个字符宽度）
		// 0: 任务名称
		sheet.setColumnWidth(0, 30 * 256);
		// 1: 行动计划
		sheet.setColumnWidth(1, 50 * 256);
		// 2: 衡量标准
		sheet.setColumnWidth(2, 50 * 256);
		// 3：时间节点
		sheet.setColumnWidth(3, 10 * 256);
		// 4：分解计划
		sheet.setColumnWidth(4, 50 * 256);
		// 5：责任人
		sheet.setColumnWidth(5, 10 * 256);
		// 6：任务状态
		sheet.setColumnWidth(6, 10 * 256);
		// 7：风险状态
		sheet.setColumnWidth(7, 10 * 256);
		// 8：进展情况
		sheet.setColumnWidth(8, 50 * 256);
		// 9：风险及措施
		sheet.setColumnWidth(9, 50 * 256);
		// 10: 审批状态
		sheet.setColumnWidth(10, 10 * 256);
	}

	// 总数据sheet列宽设置（按新列顺序调整）
	private void setAllDataColumnWidths(Sheet sheet) {
		sheet.setColumnWidth(0, 30 * 256); // 0: 任务责任单位（新第0列）
		sheet.setColumnWidth(1, 30 * 256); // 1: 任务名称（新第1列）
		sheet.setColumnWidth(2, 50 * 256); // 2: 行动计划（新第2列）
		sheet.setColumnWidth(3, 50 * 256); // 3: 衡量标准（新第3列）
		sheet.setColumnWidth(4, 10 * 256); // 4: 时间节点（新第4列）
		sheet.setColumnWidth(5, 50 * 256); // 5: 分解计划（新第5列）
		sheet.setColumnWidth(6, 10 * 256); // 6: 责任人（新第6列）
		sheet.setColumnWidth(7, 10 * 256); // 6: 任务状态（新第6列）
		sheet.setColumnWidth(8, 10 * 256); // 7: 风险状态（新第7列）
		sheet.setColumnWidth(9, 50 * 256); // 8: 进展情况（新第8列）
		sheet.setColumnWidth(10, 50 * 256); // 9: 风险及措施（新第9列）
		sheet.setColumnWidth(11, 10 * 256); // 10: 审批状态（新第10列）
	}

	// 创建表头行
	private void createHeaderRow(Row headerRow, CellStyle headerStyle) {
		String[] headers = { "任务名称", "行动计划", "衡量目标", "时间节点", "分解计划", "责任人", "任务状态", "风险状态", "进展情况", "风险及措施", "审批状态" };
		for (int i = 0; i < headers.length; i++) {
			Cell cell = headerRow.createCell(i);
			cell.setCellValue(headers[i]);
			cell.setCellStyle(headerStyle);
		}
	}

	// 总数据sheet表头创建（第0列为任务责任单位）
	private void createAllDataHeaderRow(Row headerRow, CellStyle headerStyle) {
		String[] headers = { "任务责任单位", "任务名称", "行动计划", "衡量目标", "时间节点", "分解计划", "责任人", "任务状态", "风险状态", "进展情况", "风险及措施", "审批状态" };
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

	private String getAppStatusStr(String appStatus, String taskStatus, String taskProgress) {
		if (StrUtil.isAllBlank(appStatus, taskStatus, taskProgress)) {
			return "未填报";
		} else if (StrUtil.isAllNotBlank(taskStatus, taskProgress) && StrUtil.isBlank(appStatus)) {
			return "待审核";
		} else if ("2".equals(appStatus)) {
			return "审批通过";
		} else if ("1".equals(appStatus)) {
			return "审批中";
		} else if ("4".equals(appStatus)) {
			return "作废";
		} else {
			return "";
		}
	}
}
