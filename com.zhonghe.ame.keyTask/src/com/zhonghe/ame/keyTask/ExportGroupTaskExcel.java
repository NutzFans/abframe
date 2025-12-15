package com.zhonghe.ame.keyTask;

import java.io.File;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.Comparator;
import java.util.LinkedHashMap;

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

@Bizlet("集团重点任务导出")
public class ExportGroupTaskExcel {

	@Bizlet("导出Excel")
	public String export(DataObject[] groupTasks) throws Exception {
		if (groupTasks.length > 0) {
			Session dbSession = new Session(DataSourceHelper.getDataSource());
			List<Entity> allDatas = this.getAllDatas(groupTasks, dbSession);
			Workbook workbook = new XSSFWorkbook();
			// 创建单元格样式
			CellStyle headerStyle = this.createHeaderStyle(workbook);
			CellStyle cellStyle = this.createCellStyle(workbook);

			Map<String, List<Entity>> secOrgMap = allDatas.stream().collect(Collectors.groupingBy(taskItem -> taskItem.getStr("secondary_orgname")));

			// 如果有多个责任单位，才展现“全部数据” sheet
			if (secOrgMap.size() > 1) {
				Sheet allDataSheet = workbook.createSheet("全部数据");
				// 设置总sheet列宽（按新列顺序）
				this.setAllDataColumnWidths(allDataSheet);
				// 冻结前4列（新列0-3：领域、任务名称、行动计划、衡量标准）
				allDataSheet.createFreezePane(4, 0, 4, 0);
				// 创建总sheet表头（第0列为任务责任单位）
				Row allHeaderRow = allDataSheet.createRow(0);
				this.createAllDataHeaderRow(allHeaderRow, headerStyle);

				// 第一步：按“领域”分组
				Map<String, List<Entity>> taskDomainMap = allDatas.stream().collect(Collectors.groupingBy(taskItem -> taskItem.getStr("task_domain")));

				int allRowIndex = 1; // 从第1行开始（跳过表头）

				for (Map.Entry<String, List<Entity>> taskDomainEntry : taskDomainMap.entrySet()) {
					// 计算当前领域的总数据行数（用于合并“领域”列）
					int taskDomainRows = taskDomainEntry.getValue().size();
					// 合并“领域”列（第0列）
					if (taskDomainRows > 1) {
						allDataSheet.addMergedRegion(new CellRangeAddress(allRowIndex, allRowIndex + taskDomainRows - 1, 0, 0)); // 第0列：领域
						// 合并单元格赋值+样式（仅需给第一个单元格赋值）
						Row firstRow = allDataSheet.createRow(allRowIndex);
						Cell domainCell = firstRow.createCell(0);
						domainCell.setCellValue(taskDomainEntry.getKey());
						domainCell.setCellStyle(cellStyle);
					}
					// 第二步：按“任务名称、行动计划”分组（在第一个分组的基础上）
					Map<String, List<Entity>> taskNameActionMap = taskDomainEntry.getValue().stream()
							.collect(Collectors.groupingBy(taskItem -> taskItem.getStr("task_name") + "〓" + taskItem.getStr("action_plan")));
					for (Map.Entry<String, List<Entity>> taskNameActionEntry : taskNameActionMap.entrySet()) {
						List<Entity> nameActionEntityList = taskNameActionEntry.getValue();
						String[] nameActionArr = taskNameActionEntry.getKey().split("〓");
						String taskName = nameActionArr[0];
						String actionPlan = nameActionArr[1];
						// 计算当前“任务名称、行动计划”的总数据行数（用于合并“任务名称、行动计划”列）
						int taskNameActionRows = taskNameActionEntry.getValue().size();
						// 合并“任务名称、行动计划”列（第1、2列）
						if (taskNameActionRows > 1) {
							allDataSheet.addMergedRegion(new CellRangeAddress(allRowIndex, allRowIndex + taskNameActionRows - 1, 1, 1)); // 第1列：任务名称
							allDataSheet.addMergedRegion(new CellRangeAddress(allRowIndex, allRowIndex + taskNameActionRows - 1, 2, 2)); // 第2列：行动计划
							// 合并单元格赋值
							Row firstRow = allDataSheet.getRow(allRowIndex);
							if (firstRow == null)
								firstRow = allDataSheet.createRow(allRowIndex);
							// 任务名称单元格
							Cell nameCell = firstRow.createCell(1);
							nameCell.setCellValue(taskName);
							nameCell.setCellStyle(cellStyle);
							// 行动计划单元格
							Cell actionCell = firstRow.createCell(2);
							actionCell.setCellValue(actionPlan);
							actionCell.setCellStyle(cellStyle);
						}

						// 第三步：按“衡量标准”分组（在第二个分组的基础上）
						Map<String, List<Entity>> measureStandardMap = taskNameActionEntry.getValue().stream().collect(Collectors.groupingBy(taskItem -> taskItem.getStr("measure_standard")));
						for (Map.Entry<String, List<Entity>> measureStandardEntry : measureStandardMap.entrySet()) {
							List<Entity> measureEntityList = measureStandardEntry.getValue();
							String measureStandard = measureStandardEntry.getKey();
							// 计算当前“衡量标准”的总数据行数（用于合并“衡量标准”列）
							int measureStandardRows = measureStandardEntry.getValue().size();
							// 合并“衡量标准”列（第3列）
							if (measureStandardRows > 1) {
								allDataSheet.addMergedRegion(new CellRangeAddress(allRowIndex, allRowIndex + measureStandardRows - 1, 3, 3)); // 第3列：衡量标准
								// 合并单元格赋值
								Row firstRow = allDataSheet.getRow(allRowIndex);
								if (firstRow == null)
									firstRow = allDataSheet.createRow(allRowIndex);
								Cell measureCell = firstRow.createCell(3);
								measureCell.setCellValue(measureStandard);
								measureCell.setCellStyle(cellStyle);
							}
							// 第四步：按“责任单位”分组（在第三个分组的基础上）
							Map<String, List<Entity>> secondaryOrgnameMap = measureStandardEntry.getValue().stream().collect(Collectors.groupingBy(taskItem -> taskItem.getStr("secondary_orgname")));
							for (Map.Entry<String, List<Entity>> secondaryOrgnameEntry : secondaryOrgnameMap.entrySet()) {
								List<Entity> orgEntityList = secondaryOrgnameEntry.getValue();
								String secondaryOrgname = secondaryOrgnameEntry.getKey();
								// 计算当前“责任单位”的总数据行数（用于合并“责任单位”列）
								int secondaryOrgnameRows = secondaryOrgnameEntry.getValue().size();
								// 合并“责任单位”列（第4列）
								if (secondaryOrgnameRows > 1) {
									allDataSheet.addMergedRegion(new CellRangeAddress(allRowIndex, allRowIndex + secondaryOrgnameRows - 1, 4, 4)); // 第4列：责任单位
									// 合并单元格赋值
									Row firstRow = allDataSheet.getRow(allRowIndex);
									if (firstRow == null)
										firstRow = allDataSheet.createRow(allRowIndex);
									Cell orgCell = firstRow.createCell(4);
									orgCell.setCellValue(secondaryOrgname);
									orgCell.setCellStyle(cellStyle);
								}
								// 第五步：按“时间节点”分组（在第四个分组的基础上）（有序+子列表升序）
								Map<String, List<Entity>> taskMonthMap = secondaryOrgnameEntry.getValue().stream()
								// 先对子列表按时间节点数字升序排序
										.sorted(Comparator.comparingInt(e -> {
											String taskMonthStr = getStrValue(e, "task_month");
											if (StrUtil.isBlank(taskMonthStr))
												return 0;
											try {
												return Integer.parseInt(taskMonthStr);
											} catch (NumberFormatException ex) {
												return 0;
											}
										}))
										// 用LinkedHashMap保留排序后的插入顺序
										.collect(Collectors.groupingBy(taskItem -> taskItem.getStr("task_month"), LinkedHashMap::new, // 关键：有序Map
												Collectors.toList()));
								for (Map.Entry<String, List<Entity>> taskMonthEntry : taskMonthMap.entrySet()) {
									List<Entity> monthEntityList = taskMonthEntry.getValue();
									String taskMonth = taskMonthEntry.getKey();
									String taskPlanName = monthEntityList.get(0).getStr("task_plan_name"); // 同时间节点的分解计划一致
									// 计算当前“时间节点”的总数据行数（用于合并“时间节点、分解计划”列）
									int taskMonthRows = taskMonthEntry.getValue().size();
									// 合并“时间节点、分解计划”列（第5、6列）
									if (taskMonthRows > 1) {
										allDataSheet.addMergedRegion(new CellRangeAddress(allRowIndex, allRowIndex + taskMonthRows - 1, 5, 5)); // 第5列：时间节点
										allDataSheet.addMergedRegion(new CellRangeAddress(allRowIndex, allRowIndex + taskMonthRows - 1, 6, 6)); // 第6列：分解计划
										// 合并单元格赋值
										Row firstRow = allDataSheet.getRow(allRowIndex);
										if (firstRow == null)
											firstRow = allDataSheet.createRow(allRowIndex);
										// 时间节点单元格
										Cell monthCell = firstRow.createCell(5);
										if (StrUtil.isNotBlank(taskMonth)) {
											taskMonth = taskMonth + "月";
										}
										monthCell.setCellValue(taskMonth);
										monthCell.setCellStyle(cellStyle);
										// 分解计划单元格
										Cell planCell = firstRow.createCell(6);
										planCell.setCellValue(taskPlanName);
										planCell.setCellStyle(cellStyle);
									}

									// 填充当前分组的所有数据行
									for (int j = 0; j < monthEntityList.size(); j++) {
										Entity taskItem = monthEntityList.get(j);
										Row row = allDataSheet.getRow(allRowIndex + j);
										if (row == null) {
											row = allDataSheet.createRow(allRowIndex + j);
										}
										// 设置行高（适配自动换行，单位：1/20个点）
										row.setHeightInPoints(40);

										// 填充单元格（未合并的列/合并列的非首行也需赋值，避免空值）
										// 0: 领域（合并列首行已赋值，非首行仅设样式）
										setCellValue(row, 0, getStrValue(taskItem, "task_domain"), cellStyle);
										// 1: 任务名称（合并列首行已赋值）
										setCellValue(row, 1, getStrValue(taskItem, "task_name"), cellStyle);
										// 2: 行动计划（合并列首行已赋值）
										setCellValue(row, 2, getStrValue(taskItem, "action_plan"), cellStyle);
										// 3: 衡量标准（合并列首行已赋值）
										setCellValue(row, 3, getStrValue(taskItem, "measure_standard"), cellStyle);
										// 4: 责任单位（合并列首行已赋值）
										setCellValue(row, 4, getStrValue(taskItem, "secondary_orgname"), cellStyle);
										// 5: 时间节点（合并列首行已赋值）
										String task_onth = getStrValue(taskItem, "task_month");
										if (StrUtil.isNotBlank(task_onth)) {
											task_onth = task_onth + "月";
										}
										setCellValue(row, 5, task_onth, cellStyle);
										// 6: 分解计划（合并列首行已赋值）
										setCellValue(row, 6, getStrValue(taskItem, "task_plan_name"), cellStyle);
										// 7: 填报月份
										String fill_month = getStrValue(taskItem, "fill_month");
										if (StrUtil.isNotBlank(fill_month)) {
											fill_month = fill_month + "月";
										}
										setCellValue(row, 7, fill_month, cellStyle);
										// 8: 任务状态
										setCellValue(row, 8, getStrValue(taskItem, "task_status"), cellStyle);
										// 9: 风险状态
										setCellValue(row, 9, getStrValue(taskItem, "risk_status"), cellStyle);
										// 10: 进展情况
										setCellValue(row, 10, getStrValue(taskItem, "task_progress"), cellStyle);
										// 11: 截至本月完成情况
										setCellValue(row, 11, getStrValue(taskItem, "task_month_comple"), cellStyle);
										// 12: 风险及措施
										setCellValue(row, 12, getStrValue(taskItem, "risk_measures"), cellStyle);
										// 13: 审批状态
										setCellValue(row, 13, getStrValue(taskItem, "app_status"), cellStyle);
									}
									// 更新行索引：当前分组处理完成，行索引+=行数
									allRowIndex += taskMonthRows;
								}
							}
						}
					}
				}
			}

			for (Map.Entry<String, List<Entity>> secOrgEntry : secOrgMap.entrySet()) {
				Sheet sheet = workbook.createSheet(secOrgEntry.getKey());
				// 设置单元格宽度
				this.setColumnWidths(sheet);
				// 冻结前4列（新列0-3：领域、任务名称、行动计划、衡量标准）
				sheet.createFreezePane(4, 0, 4, 0);
				// 创建总sheet表头（第0列为任务责任单位）
				Row headerRow = sheet.createRow(0);
				this.createHeaderRow(headerRow, headerStyle);

				// 第一步：按“领域”分组
				Map<String, List<Entity>> taskDomainMap = secOrgEntry.getValue().stream().collect(Collectors.groupingBy(taskItem -> taskItem.getStr("task_domain")));

				int rowIndex = 1; // 从第1行开始（跳过表头）

				for (Map.Entry<String, List<Entity>> taskDomainEntry : taskDomainMap.entrySet()) {
					// 计算当前领域的总数据行数（用于合并“领域”列）
					int taskDomainRows = taskDomainEntry.getValue().size();
					// 合并“领域”列（第0列）
					if (taskDomainRows > 1) {
						sheet.addMergedRegion(new CellRangeAddress(rowIndex, rowIndex + taskDomainRows - 1, 0, 0)); // 第0列：领域
						// 合并单元格赋值+样式（仅需给第一个单元格赋值）
						Row firstRow = sheet.createRow(rowIndex);
						Cell domainCell = firstRow.createCell(0);
						domainCell.setCellValue(taskDomainEntry.getKey());
						domainCell.setCellStyle(cellStyle);
					}
					// 第二步：按“任务名称、行动计划”分组（在第一个分组的基础上）
					Map<String, List<Entity>> taskNameActionMap = taskDomainEntry.getValue().stream()
							.collect(Collectors.groupingBy(taskItem -> taskItem.getStr("task_name") + "〓" + taskItem.getStr("action_plan")));
					for (Map.Entry<String, List<Entity>> taskNameActionEntry : taskNameActionMap.entrySet()) {
						List<Entity> nameActionEntityList = taskNameActionEntry.getValue();
						String[] nameActionArr = taskNameActionEntry.getKey().split("〓");
						String taskName = nameActionArr[0];
						String actionPlan = nameActionArr[1];
						// 计算当前“任务名称、行动计划”的总数据行数（用于合并“任务名称、行动计划”列）
						int taskNameActionRows = taskNameActionEntry.getValue().size();
						// 合并“任务名称、行动计划”列（第1、2列）
						if (taskNameActionRows > 1) {
							sheet.addMergedRegion(new CellRangeAddress(rowIndex, rowIndex + taskNameActionRows - 1, 1, 1)); // 第1列：任务名称
							sheet.addMergedRegion(new CellRangeAddress(rowIndex, rowIndex + taskNameActionRows - 1, 2, 2)); // 第2列：行动计划
							// 合并单元格赋值
							Row firstRow = sheet.getRow(rowIndex);
							if (firstRow == null)
								firstRow = sheet.createRow(rowIndex);
							// 任务名称单元格
							Cell nameCell = firstRow.createCell(1);
							nameCell.setCellValue(taskName);
							nameCell.setCellStyle(cellStyle);
							// 行动计划单元格
							Cell actionCell = firstRow.createCell(2);
							actionCell.setCellValue(actionPlan);
							actionCell.setCellStyle(cellStyle);
						}

						// 第三步：按“衡量标准”分组（在第二个分组的基础上）
						Map<String, List<Entity>> measureStandardMap = taskNameActionEntry.getValue().stream().collect(Collectors.groupingBy(taskItem -> taskItem.getStr("measure_standard")));
						for (Map.Entry<String, List<Entity>> measureStandardEntry : measureStandardMap.entrySet()) {
							List<Entity> measureEntityList = measureStandardEntry.getValue();
							String measureStandard = measureStandardEntry.getKey();
							// 计算当前“衡量标准”的总数据行数（用于合并“衡量标准”列）
							int measureStandardRows = measureStandardEntry.getValue().size();
							// 合并“衡量标准”列（第3列）
							if (measureStandardRows > 1) {
								sheet.addMergedRegion(new CellRangeAddress(rowIndex, rowIndex + measureStandardRows - 1, 3, 3)); // 第3列：衡量标准
								// 合并单元格赋值
								Row firstRow = sheet.getRow(rowIndex);
								if (firstRow == null)
									firstRow = sheet.createRow(rowIndex);
								Cell measureCell = firstRow.createCell(3);
								measureCell.setCellValue(measureStandard);
								measureCell.setCellStyle(cellStyle);
							}
							// 第四步：按“时间节点”分组（在第三个分组的基础上）（有序+子列表升序）
							Map<String, List<Entity>> taskMonthMap = measureStandardEntry.getValue().stream()
							// 先对子列表按时间节点数字升序排序
									.sorted(Comparator.comparingInt(e -> {
										String taskMonthStr = getStrValue(e, "task_month");
										if (StrUtil.isBlank(taskMonthStr))
											return 0;
										try {
											return Integer.parseInt(taskMonthStr);
										} catch (NumberFormatException ex) {
											return 0;
										}
									}))
									// 用LinkedHashMap保留排序后的插入顺序
									.collect(Collectors.groupingBy(taskItem -> taskItem.getStr("task_month"), LinkedHashMap::new, // 关键：有序Map
											Collectors.toList()));
							for (Map.Entry<String, List<Entity>> taskMonthEntry : taskMonthMap.entrySet()) {
								List<Entity> monthEntityList = taskMonthEntry.getValue();
								String taskMonth = taskMonthEntry.getKey();
								String taskPlanName = monthEntityList.get(0).getStr("task_plan_name"); // 同时间节点的分解计划一致
								// 计算当前“时间节点”的总数据行数（用于合并“时间节点、分解计划”列）
								int taskMonthRows = taskMonthEntry.getValue().size();
								// 合并“时间节点、分解计划”列（第4、5列）
								if (taskMonthRows > 1) {
									sheet.addMergedRegion(new CellRangeAddress(rowIndex, rowIndex + taskMonthRows - 1, 4, 4)); // 第4列：时间节点
									sheet.addMergedRegion(new CellRangeAddress(rowIndex, rowIndex + taskMonthRows - 1, 5, 5)); // 第5列：分解计划
									// 合并单元格赋值
									Row firstRow = sheet.getRow(rowIndex);
									if (firstRow == null)
										firstRow = sheet.createRow(rowIndex);
									// 时间节点单元格
									Cell monthCell = firstRow.createCell(4);
									if (StrUtil.isNotBlank(taskMonth)) {
										taskMonth = taskMonth + "月";
									}
									monthCell.setCellValue(taskMonth);
									monthCell.setCellStyle(cellStyle);
									// 分解计划单元格
									Cell planCell = firstRow.createCell(5);
									planCell.setCellValue(taskPlanName);
									planCell.setCellStyle(cellStyle);
								}

								// 填充当前分组的所有数据行
								for (int j = 0; j < monthEntityList.size(); j++) {
									Entity taskItem = monthEntityList.get(j);
									Row row = sheet.getRow(rowIndex + j);
									if (row == null) {
										row = sheet.createRow(rowIndex + j);
									}
									// 设置行高（适配自动换行，单位：1/20个点）
									row.setHeightInPoints(40);

									// 填充单元格（未合并的列/合并列的非首行也需赋值，避免空值）
									// 0: 领域（合并列首行已赋值，非首行仅设样式）
									setCellValue(row, 0, getStrValue(taskItem, "task_domain"), cellStyle);
									// 1: 任务名称（合并列首行已赋值）
									setCellValue(row, 1, getStrValue(taskItem, "task_name"), cellStyle);
									// 2: 行动计划（合并列首行已赋值）
									setCellValue(row, 2, getStrValue(taskItem, "action_plan"), cellStyle);
									// 3: 衡量标准（合并列首行已赋值）
									setCellValue(row, 3, getStrValue(taskItem, "measure_standard"), cellStyle);
									// 4: 时间节点（合并列首行已赋值）
									String task_onth = getStrValue(taskItem, "task_month");
									if (StrUtil.isNotBlank(task_onth)) {
										task_onth = task_onth + "月";
									}
									setCellValue(row, 4, task_onth, cellStyle);
									// 5: 分解计划（合并列首行已赋值）
									setCellValue(row, 5, getStrValue(taskItem, "task_plan_name"), cellStyle);
									// 6: 填报月份
									String fill_month = getStrValue(taskItem, "fill_month");
									if (StrUtil.isNotBlank(fill_month)) {
										fill_month = fill_month + "月";
									}
									setCellValue(row, 6, fill_month, cellStyle);
									// 7: 任务状态
									setCellValue(row, 7, getStrValue(taskItem, "task_status"), cellStyle);
									// 8: 风险状态
									setCellValue(row, 8, getStrValue(taskItem, "risk_status"), cellStyle);
									// 9: 进展情况
									setCellValue(row, 9, getStrValue(taskItem, "task_progress"), cellStyle);
									// 10: 截至本月完成情况
									setCellValue(row, 10, getStrValue(taskItem, "task_month_comple"), cellStyle);
									// 11: 风险及措施
									setCellValue(row, 11, getStrValue(taskItem, "risk_measures"), cellStyle);
									// 12: 审批状态
									setCellValue(row, 12, getStrValue(taskItem, "app_status"), cellStyle);
								}
								// 更新行索引：当前分组处理完成，行索引+=行数
								rowIndex += taskMonthRows;
							}
						}
					}
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

	// 获取所有数据
	private List<Entity> getAllDatas(DataObject[] groupTasks, Session dbSession) throws Exception {
		List<Entity> allDatas = new ArrayList<Entity>();
		String queryGroupItemSql = "SELECT * FROM zh_key_task_group_item WHERE main_id = ? ORDER BY task_month ASC";
		String queryItemProgressSql = "SELECT * FROM zh_key_task_group_progress WHERE main_id = ? ORDER BY fill_month ASC";
		for (DataObject groupTask : groupTasks) {
			List<Entity> groupItemList = dbSession.query(queryGroupItemSql, groupTask.getString("id"));
			List<Entity> groupProgressList = dbSession.query(queryItemProgressSql, groupTask.getString("id"));
			if (groupItemList != null && groupItemList.size() > 0) {
				if (groupProgressList != null && groupProgressList.size() > 0) {
					for (int i = 0; i < groupItemList.size(); i++) {
						List<Entity> entityList = new ArrayList<Entity>();
						if (i == 0) {
							int taskMonth = groupItemList.get(i).getInt("task_month");
							entityList = groupProgressList.stream().filter(entity -> entity.getInt("fill_month") <= taskMonth).collect(Collectors.toList());
						} else {
							int minTaskMonth = groupItemList.get(i - 1).getInt("task_month");
							int maxTaskMonth = groupItemList.get(i).getInt("task_month");
							entityList = groupProgressList.stream().filter(entity -> entity.getInt("fill_month") > minTaskMonth && entity.getInt("fill_month") <= maxTaskMonth)
									.collect(Collectors.toList());
						}
						if (entityList != null && entityList.size() > 0) {
							for (Entity temp : entityList) {
								Entity entity = Entity.create().set("task_domain", groupTask.getString("taskDomain")).set("task_name", groupTask.getString("taskName"))
										.set("action_plan", groupTask.getString("actionPlan")).set("measure_standard", groupTask.getString("measureStandard"))
										.set("secondary_orgname", groupTask.getString("secondaryOrgname")).set("task_month", groupItemList.get(i).getInt("task_month"))
										.set("task_plan_name", groupItemList.get(i).getStr("task_plan_name")).set("fill_month", temp.getInt("fill_month"))
										.set("task_status", temp.getStr("task_status")).set("risk_status", temp.getStr("risk_status")).set("task_progress", temp.getStr("task_progress"))
										.set("task_month_comple", temp.getStr("task_month_comple")).set("risk_measures", temp.getStr("risk_measures"))
										.set("app_status", this.getAppStatusStr(temp.getStr("app_status"), temp.getStr("task_status"), temp.getStr("task_progress")));
								allDatas.add(entity);
							}
						} else {
							Entity entity = Entity.create().set("task_domain", groupTask.getString("taskDomain")).set("task_name", groupTask.getString("taskName"))
									.set("action_plan", groupTask.getString("actionPlan")).set("measure_standard", groupTask.getString("measureStandard"))
									.set("secondary_orgname", groupTask.getString("secondaryOrgname")).set("task_month", groupItemList.get(i).getInt("task_month"))
									.set("task_plan_name", groupItemList.get(i).getStr("task_plan_name")).set("fill_month", "").set("task_status", "").set("risk_status", "").set("task_progress", "")
									.set("task_month_comple", "").set("risk_measures", "").set("app_status", "");
							allDatas.add(entity);
						}
					}
				} else {
					for (int i = 0; i < groupItemList.size(); i++) {
						Entity entity = Entity.create().set("task_domain", groupTask.getString("taskDomain")).set("task_name", groupTask.getString("taskName"))
								.set("action_plan", groupTask.getString("actionPlan")).set("measure_standard", groupTask.getString("measureStandard"))
								.set("secondary_orgname", groupTask.getString("secondaryOrgname")).set("task_month", groupItemList.get(i).getInt("task_month"))
								.set("task_plan_name", groupItemList.get(i).getStr("task_plan_name")).set("fill_month", "").set("task_status", "").set("risk_status", "").set("task_progress", "")
								.set("task_month_comple", "").set("risk_measures", "").set("app_status", "");
						allDatas.add(entity);
					}
				}
			} else {
				Entity entity = Entity.create().set("task_domain", groupTask.getString("taskDomain")).set("task_name", groupTask.getString("taskName"))
						.set("action_plan", groupTask.getString("actionPlan")).set("measure_standard", groupTask.getString("measureStandard"))
						.set("secondary_orgname", groupTask.getString("secondaryOrgname")).set("task_month", "").set("task_plan_name", "").set("fill_month", "").set("task_status", "")
						.set("risk_status", "").set("task_progress", "").set("task_month_comple", "").set("risk_measures", "").set("app_status", "");
				allDatas.add(entity);
			}
		}
		return allDatas;
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

	// 设置所有列的宽度
	private void setColumnWidths(Sheet sheet) {
		sheet.setColumnWidth(0, 10 * 256); // 0: 领域（新第0列）
		sheet.setColumnWidth(1, 50 * 256); // 1: 任务名称（新第1列）
		sheet.setColumnWidth(2, 50 * 256); // 2: 行动计划（新第2列）
		sheet.setColumnWidth(3, 50 * 256); // 3: 衡量标准（新第3列）
		sheet.setColumnWidth(4, 10 * 256); // 4: 时间节点（新第4列）
		sheet.setColumnWidth(5, 50 * 256); // 5: 分解计划（新第6列）
		sheet.setColumnWidth(6, 10 * 256); // 6: 填报月份（新第7列）
		sheet.setColumnWidth(7, 10 * 256); // 7: 任务状态（新第8列）
		sheet.setColumnWidth(8, 10 * 256); // 8: 风险状态（新第9列）
		sheet.setColumnWidth(9, 50 * 256); // 9: 进展情况（新第10列）
		sheet.setColumnWidth(10, 50 * 256); // 10: 截至本月完成情况（新第11列）
		sheet.setColumnWidth(11, 50 * 256); // 11: 风险及措施（新第12列）
		sheet.setColumnWidth(12, 10 * 256); // 12: 审批状态（新第13列）
	}

	// 总数据sheet列宽设置（按新列顺序调整）
	private void setAllDataColumnWidths(Sheet sheet) {
		sheet.setColumnWidth(0, 10 * 256); // 0: 领域（新第0列）
		sheet.setColumnWidth(1, 50 * 256); // 1: 任务名称（新第1列）
		sheet.setColumnWidth(2, 50 * 256); // 2: 行动计划（新第2列）
		sheet.setColumnWidth(3, 50 * 256); // 3: 衡量标准（新第3列）
		sheet.setColumnWidth(4, 30 * 256); // 4: 任务责任单位（新第4列）
		sheet.setColumnWidth(5, 10 * 256); // 5: 时间节点（新第5列）
		sheet.setColumnWidth(6, 50 * 256); // 6: 分解计划（新第6列）
		sheet.setColumnWidth(7, 10 * 256); // 7: 填报月份（新第7列）
		sheet.setColumnWidth(8, 10 * 256); // 8: 任务状态（新第8列）
		sheet.setColumnWidth(9, 10 * 256); // 9: 风险状态（新第9列）
		sheet.setColumnWidth(10, 50 * 256); // 10: 进展情况（新第10列）
		sheet.setColumnWidth(11, 50 * 256); // 11: 截至本月完成情况（新第11列）
		sheet.setColumnWidth(12, 50 * 256); // 12: 风险及措施（新第12列）
		sheet.setColumnWidth(13, 10 * 256); // 13: 审批状态（新第13列）
	}

	// 创建表头行
	private void createHeaderRow(Row headerRow, CellStyle headerStyle) {
		String[] headers = { "领域", "任务名称", "行动计划", "衡量标准", "时间节点", "分解计划", "填报月份", "任务状态", "风险状态", "进展情况", "截至本月完成情况", "风险及措施", "审批状态" };
		for (int i = 0; i < headers.length; i++) {
			Cell cell = headerRow.createCell(i);
			cell.setCellValue(headers[i]);
			cell.setCellStyle(headerStyle);
		}
	}

	// 总数据sheet表头创建（第0列为任务责任单位）
	private void createAllDataHeaderRow(Row headerRow, CellStyle headerStyle) {
		String[] headers = { "领域", "任务名称", "行动计划", "衡量标准", "任务责任单位", "时间节点", "分解计划", "填报月份", "任务状态", "风险状态", "进展情况", "截至本月完成情况", "风险及措施", "审批状态" };
		for (int i = 0; i < headers.length; i++) {
			Cell cell = headerRow.createCell(i);
			cell.setCellValue(headers[i]);
			cell.setCellStyle(headerStyle);
		}
	}

	/**
	 * 安全获取字符串值（避免空指针）
	 */
	private String getStrValue(Entity entity, String key) {
		Object value = entity.get(key);
		if (value == null) {
			return "";
		}
		// 数字类型转字符串
		if (value instanceof Number) {
			return ((Number) value).toString();
		}
		return value.toString().trim();
	}

	/**
	 * 设置单元格值并应用样式
	 */
	private void setCellValue(Row row, int colIndex, String value, CellStyle style) {
		Cell cell = row.createCell(colIndex);
		cell.setCellValue(value);
		cell.setCellStyle(style);
	}

	// 保存Workbook到文件
	private String saveWorkbook(Workbook workbook) throws Exception {
		// 创建临时文件
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
		String datetimeString = format.format(new Date());
		File tempFile = File.createTempFile("集团重点任务导出_" + datetimeString, ".xlsx");
		try (FileOutputStream fos = new FileOutputStream(tempFile)) {
			workbook.write(fos);
		}
		return tempFile.getAbsolutePath();
	}

}
