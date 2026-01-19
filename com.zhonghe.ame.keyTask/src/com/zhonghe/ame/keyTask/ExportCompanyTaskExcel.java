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
			CellStyle headerStyle = this.createHeaderStyle(workbook);
			CellStyle cellStyle = this.createCellStyle(workbook);

			String queryTaskItemSql = "SELECT zktci.*, zkcip.* FROM zh_key_task_company_item AS zktci LEFT JOIN zh_key_task_company_item_process AS zkcip ON zktci.id = zkcip.item_id WHERE zktci.main_id = ?";

			// ========== 生成【全部数据】Sheet ==========
			if (companyTasks.length > 1) {
				List<Entity> allTaskItems = new ArrayList<>();
				for (int i = 0; i < companyTasks.length; i++) {
					String mainId = companyTasks[i].getString("id");
					String secOrgName = companyTasks[i].getString("secondaryOrgname");
					List<Entity> taskItemList = dbSession.query(queryTaskItemSql, mainId);
					for (Entity item : taskItemList) {
						item.set("secOrgName", getSafeValue(secOrgName));
						item.set("task_source", getSafeValue(item.getStr("task_source")));
					}
					allTaskItems.addAll(taskItemList);
				}

				Sheet allDataSheet = workbook.createSheet("全部数据");
				this.setAllDataColumnWidths(allDataSheet);
				allDataSheet.createFreezePane(5, 0, 5, 0);
				Row allHeaderRow = allDataSheet.createRow(0);
				this.createAllDataHeaderRow(allHeaderRow, headerStyle);

				// 第一层：任务责任单位
				Map<String, List<Entity>> orgGroupMap = allTaskItems.stream().collect(Collectors.groupingBy(taskItem -> taskItem.getStr("secOrgName")));
				List<String> sortedOrgNames = new ArrayList<>(orgGroupMap.keySet());
				Collections.sort(sortedOrgNames);

				int allRowIndex = 1;
				for (String orgName : sortedOrgNames) {
					List<Entity> orgTaskItems = orgGroupMap.get(orgName);
					int orgTotalRows = orgTaskItems.size();
					if (orgTotalRows > 1)
						allDataSheet.addMergedRegion(new CellRangeAddress(allRowIndex, allRowIndex + orgTotalRows - 1, 0, 0));

					// 第二层：任务来源
					Map<String, List<Entity>> sourceGroupMap = orgTaskItems.stream().collect(Collectors.groupingBy(taskItem -> taskItem.getStr("task_source")));
					List<String> sortedSourceNames = new ArrayList<>(sourceGroupMap.keySet());
					Collections.sort(sortedSourceNames);

					for (String sourceName : sortedSourceNames) {
						List<Entity> sourceTaskItems = sourceGroupMap.get(sourceName);
						int sourceTotalRows = sourceTaskItems.size();
						if (sourceTotalRows > 1)
							allDataSheet.addMergedRegion(new CellRangeAddress(allRowIndex, allRowIndex + sourceTotalRows - 1, 1, 1));

						// 第三层：行动计划编号
						Map<String, List<Entity>> actionPlanGroupMap = sourceTaskItems.stream().collect(Collectors.groupingBy(taskItem -> getSafeValue(taskItem.getStr("action_plan_number"))));
						List<String> sortedActionPlanNames = new ArrayList<>(actionPlanGroupMap.keySet());
						Collections.sort(sortedActionPlanNames);

						for (String actionPlanName : sortedActionPlanNames) {
							List<Entity> actionPlanTaskItems = actionPlanGroupMap.get(actionPlanName);
							int actionPlanTotalRows = actionPlanTaskItems.size();
							if (actionPlanTotalRows > 1)
								allDataSheet.addMergedRegion(new CellRangeAddress(allRowIndex, allRowIndex + actionPlanTotalRows - 1, 2, 2));

							// 第四层：任务名称
							Map<String, List<Entity>> taskNameGroupMap = actionPlanTaskItems.stream().collect(Collectors.groupingBy(taskItem -> getSafeValue(taskItem.getStr("task_name"))));
							List<String> sortedTaskNames = new ArrayList<>(taskNameGroupMap.keySet());
							Collections.sort(sortedTaskNames);

							for (String taskName : sortedTaskNames) {
								List<Entity> taskNameTaskItems = taskNameGroupMap.get(taskName);
								int taskNameTotalRows = taskNameTaskItems.size();
								if (taskNameTotalRows > 1)
									allDataSheet.addMergedRegion(new CellRangeAddress(allRowIndex, allRowIndex + taskNameTotalRows - 1, 3, 3));

								// 第五层：年度目标
								Map<String, List<Entity>> annualTargetGroupMap = taskNameTaskItems.stream().collect(Collectors.groupingBy(taskItem -> getSafeValue(taskItem.getStr("annual_target"))));
								List<String> sortedAnnualTargets = new ArrayList<>(annualTargetGroupMap.keySet());
								Collections.sort(sortedAnnualTargets);

								for (String annualTarget : sortedAnnualTargets) {
									List<Entity> annualTargetTaskItems = annualTargetGroupMap.get(annualTarget);
									int annualTargetTotalRows = annualTargetTaskItems.size();
									if (annualTargetTotalRows > 1)
										allDataSheet.addMergedRegion(new CellRangeAddress(allRowIndex, allRowIndex + annualTargetTotalRows - 1, 4, 4));

									// 最内层：按时间节点排序
									Collections.sort(annualTargetTaskItems, Comparator.comparingInt(o -> o.getInt("task_month")));
									int groupSize = annualTargetTaskItems.size();

									// 填充数据
									for (int j = 0; j < groupSize; j++) {
										Entity taskItem = annualTargetTaskItems.get(j);
										Row row = allDataSheet.createRow(allRowIndex + j);

										// A-任务责任单位
										Cell cell0 = row.createCell(0);
										if (allRowIndex == row.getRowNum())
											cell0.setCellValue(orgName);
										cell0.setCellStyle(cellStyle);

										// B-任务来源
										Cell cell1 = row.createCell(1);
										if (allRowIndex == row.getRowNum())
											cell1.setCellValue(sourceName);
										cell1.setCellStyle(cellStyle);

										// C-行动计划编号
										Cell cell2 = row.createCell(2);
										if (allRowIndex == row.getRowNum())
											cell2.setCellValue(actionPlanName);
										cell2.setCellStyle(cellStyle);

										// D-任务名称
										Cell cell3 = row.createCell(3);
										if (allRowIndex == row.getRowNum())
											cell3.setCellValue(taskName);
										cell3.setCellStyle(cellStyle);

										// E-年度目标
										Cell cell4 = row.createCell(4);
										if (allRowIndex == row.getRowNum())
											cell4.setCellValue(annualTarget);
										cell4.setCellStyle(cellStyle);

										// 其他列
										row.createCell(5).setCellValue(taskItem.getStr("task_month") + "月");
										row.createCell(6).setCellValue(getSafeValue(taskItem.getStr("task_plan_name")));
										row.createCell(7).setCellValue(getSafeValue(taskItem.getStr("responsible_person")));
										row.createCell(8).setCellValue(getSafeValue(taskItem.getStr("task_status")));
										row.createCell(9).setCellValue(getSafeValue(taskItem.getStr("risk_status")));
										row.createCell(10).setCellValue(getSafeValue(taskItem.getStr("task_progress")));
										row.createCell(11).setCellValue(getSafeValue(taskItem.getStr("risk_measures")));
										row.createCell(12).setCellValue(getAppStatusStr(taskItem.getStr("app_status"), taskItem.getStr("task_status"), taskItem.getStr("task_progress")));

										for (int k = 5; k <= 12; k++)
											row.getCell(k).setCellStyle(cellStyle);
									}
									allRowIndex += groupSize;
								}
							}
						}
					}
				}
			}

			// ========== 生成【各责任单位】独立Sheet ==========
			for (int i = 0; i < companyTasks.length; i++) {
				String mainId = companyTasks[i].getString("id");
				String secOrgName = companyTasks[i].getString("secondaryOrgname");
				List<Entity> taskItemList = dbSession.query(queryTaskItemSql, mainId);

				for (Entity item : taskItemList) {
					item.set("task_source", getSafeValue(item.getStr("task_source")));
				}

				Sheet sheet = workbook.createSheet(secOrgName);
				this.setColumnWidths(sheet);
				sheet.createFreezePane(4, 0, 4, 0);
				Row headerRow = sheet.createRow(0);
				this.createHeaderRow(headerRow, headerStyle);

				int rowIndex = 1;
				// 第一层：任务来源
				Map<String, List<Entity>> sourceGroupMap = taskItemList.stream().collect(Collectors.groupingBy(taskItem -> taskItem.getStr("task_source")));
				List<String> sortedSourceNames = new ArrayList<>(sourceGroupMap.keySet());
				Collections.sort(sortedSourceNames);

				for (String sourceName : sortedSourceNames) {
					List<Entity> sourceTaskItems = sourceGroupMap.get(sourceName);
					int sourceTotalRows = sourceTaskItems.size();
					if (sourceTotalRows > 1)
						sheet.addMergedRegion(new CellRangeAddress(rowIndex, rowIndex + sourceTotalRows - 1, 0, 0));

					// 第二层：行动计划编号（核心解决你截图的问题）
					Map<String, List<Entity>> actionPlanGroupMap = sourceTaskItems.stream().collect(Collectors.groupingBy(taskItem -> getSafeValue(taskItem.getStr("action_plan_number"))));
					List<String> sortedActionPlanNames = new ArrayList<>(actionPlanGroupMap.keySet());
					Collections.sort(sortedActionPlanNames);

					for (String actionPlanName : sortedActionPlanNames) {
						List<Entity> actionPlanTaskItems = actionPlanGroupMap.get(actionPlanName);
						int actionPlanTotalRows = actionPlanTaskItems.size();
						if (actionPlanTotalRows > 1)
							sheet.addMergedRegion(new CellRangeAddress(rowIndex, rowIndex + actionPlanTotalRows - 1, 1, 1));

						// 第三层：任务名称
						Map<String, List<Entity>> taskNameGroupMap = actionPlanTaskItems.stream().collect(Collectors.groupingBy(taskItem -> getSafeValue(taskItem.getStr("task_name"))));
						List<String> sortedTaskNames = new ArrayList<>(taskNameGroupMap.keySet());
						Collections.sort(sortedTaskNames);

						for (String taskName : sortedTaskNames) {
							List<Entity> taskNameTaskItems = taskNameGroupMap.get(taskName);
							int taskNameTotalRows = taskNameTaskItems.size();
							if (taskNameTotalRows > 1)
								sheet.addMergedRegion(new CellRangeAddress(rowIndex, rowIndex + taskNameTotalRows - 1, 2, 2));

							// 第四层：年度目标
							Map<String, List<Entity>> annualTargetGroupMap = taskNameTaskItems.stream().collect(Collectors.groupingBy(taskItem -> getSafeValue(taskItem.getStr("annual_target"))));
							List<String> sortedAnnualTargets = new ArrayList<>(annualTargetGroupMap.keySet());
							Collections.sort(sortedAnnualTargets);

							for (String annualTarget : sortedAnnualTargets) {
								List<Entity> annualTargetTaskItems = annualTargetGroupMap.get(annualTarget);
								int annualTargetTotalRows = annualTargetTaskItems.size();
								if (annualTargetTotalRows > 1)
									sheet.addMergedRegion(new CellRangeAddress(rowIndex, rowIndex + annualTargetTotalRows - 1, 3, 3));

								// 最内层：按时间节点排序
								Collections.sort(annualTargetTaskItems, Comparator.comparingInt(o -> o.getInt("task_month")));
								int groupSize = annualTargetTaskItems.size();

								// 填充数据
								for (int j = 0; j < groupSize; j++) {
									Entity taskItem = annualTargetTaskItems.get(j);
									Row row = sheet.createRow(rowIndex + j);

									// A-任务来源
									Cell cell0 = row.createCell(0);
									if (rowIndex == row.getRowNum())
										cell0.setCellValue(sourceName);
									cell0.setCellStyle(cellStyle);

									// B-行动计划编号（核心解决你截图的问题）
									Cell cell1 = row.createCell(1);
									if (rowIndex == row.getRowNum())
										cell1.setCellValue(actionPlanName);
									cell1.setCellStyle(cellStyle);

									// C-任务名称
									Cell cell2 = row.createCell(2);
									if (rowIndex == row.getRowNum())
										cell2.setCellValue(taskName);
									cell2.setCellStyle(cellStyle);

									// D-年度目标
									Cell cell3 = row.createCell(3);
									if (rowIndex == row.getRowNum())
										cell3.setCellValue(annualTarget);
									cell3.setCellStyle(cellStyle);

									// 其他列
									row.createCell(4).setCellValue(taskItem.getStr("task_month") + "月");
									row.createCell(5).setCellValue(getSafeValue(taskItem.getStr("task_plan_name")));
									row.createCell(6).setCellValue(getSafeValue(taskItem.getStr("responsible_person")));
									row.createCell(7).setCellValue(getSafeValue(taskItem.getStr("task_status")));
									row.createCell(8).setCellValue(getSafeValue(taskItem.getStr("risk_status")));
									row.createCell(9).setCellValue(getSafeValue(taskItem.getStr("task_progress")));
									row.createCell(10).setCellValue(getSafeValue(taskItem.getStr("risk_measures")));
									row.createCell(11).setCellValue(getAppStatusStr(taskItem.getStr("app_status"), taskItem.getStr("task_status"), taskItem.getStr("task_progress")));

									for (int k = 4; k <= 11; k++)
										row.getCell(k).setCellStyle(cellStyle);
								}
								rowIndex += groupSize;
							}
						}
					}
				}
			}

			String filePath = saveWorkbook(workbook);
			Console.log("Excel导出成功，路径：{}", filePath);
			return filePath;
		} else {
			return null;
		}
	}

	private String getSafeValue(String value) {
		return StrUtil.isBlank(value) ? "" : value;
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

	private void setColumnWidths(Sheet sheet) {
		sheet.setColumnWidth(0, 12 * 256);
		sheet.setColumnWidth(1, 30 * 256);
		sheet.setColumnWidth(2, 50 * 256);
		sheet.setColumnWidth(3, 50 * 256);
		sheet.setColumnWidth(4, 10 * 256);
		sheet.setColumnWidth(5, 50 * 256);
		sheet.setColumnWidth(6, 10 * 256);
		sheet.setColumnWidth(7, 10 * 256);
		sheet.setColumnWidth(8, 10 * 256);
		sheet.setColumnWidth(9, 50 * 256);
		sheet.setColumnWidth(10, 50 * 256);
		sheet.setColumnWidth(11, 10 * 256);
	}

	private void setAllDataColumnWidths(Sheet sheet) {
		sheet.setColumnWidth(0, 30 * 256);
		sheet.setColumnWidth(1, 12 * 256);
		sheet.setColumnWidth(2, 30 * 256);
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

	private void createHeaderRow(Row headerRow, CellStyle headerStyle) {
		String[] headers = { "任务来源", "任务名称", "行动计划", "衡量标准", "时间节点", "分解计划", "责任人", "任务状态", "风险状态", "进展情况", "风险及措施", "审批状态" };
		for (int i = 0; i < headers.length; i++) {
			Cell cell = headerRow.createCell(i);
			cell.setCellValue(headers[i]);
			cell.setCellStyle(headerStyle);
		}
	}

	private void createAllDataHeaderRow(Row headerRow, CellStyle headerStyle) {
		String[] headers = { "任务责任单位", "任务来源", "任务名称", "行动计划", "衡量标准", "时间节点", "分解计划", "责任人", "任务状态", "风险状态", "进展情况", "风险及措施", "审批状态" };
		for (int i = 0; i < headers.length; i++) {
			Cell cell = headerRow.createCell(i);
			cell.setCellValue(headers[i]);
			cell.setCellStyle(headerStyle);
		}
	}

	private String saveWorkbook(Workbook workbook) throws Exception {
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
