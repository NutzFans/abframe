package com.zhonghe.ame.finance;

import java.io.File;
import java.io.FileOutputStream;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.function.Function;
import java.util.stream.Collectors;

import org.apache.poi.ss.usermodel.*;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import cn.hutool.core.collection.ListUtil;
import cn.hutool.core.lang.Console;
import cn.hutool.core.util.StrUtil;
import cn.hutool.db.Entity;
import cn.hutool.db.Session;

import com.eos.common.connection.DataSourceHelper;
import com.eos.system.annotation.Bizlet;

@Bizlet("预算主体 - 填报 - 导出")
public class ExportBudgetFillingExcel {

	@Bizlet("导出")
	public String export(String ids) throws Exception {
		Session dbSession = new Session(DataSourceHelper.getDataSource());
		FillingDataUtil fillingDataUtil = new FillingDataUtil();
		List<String> idList = StrUtil.split(ids, ",");
		String idStrs = idList.stream().map(id -> "'" + id + "'").collect(Collectors.joining(","));
		String querySql = "SELECT zcbfm.id, zcba.name FROM zh_caiwu_budget_filling_main AS zcbfm, zh_caiwu_budget_account AS zcba WHERE zcbfm.budget_account_id = zcba.id AND zcbfm.id IN  (" + idStrs
				+ ")";
		List<Entity> accountList = dbSession.query(querySql);
		Map<String, String> accountMap = accountList.stream().collect(Collectors.toMap(entity -> entity.getStr("id"), entity -> entity.getStr("name"), (existing, replacement) -> existing));

		Map<String, Map<String, List<Entity>>> exportMap = new HashMap<String, Map<String, List<Entity>>>();
		for (Map.Entry<String, String> entry : accountMap.entrySet()) {
			Map<String, List<Entity>> map = new HashMap<String, List<Entity>>();
			map = fillingDataUtil.getFillingDatas(entry.getKey());
			exportMap.put(entry.getValue(), map);
		}

		Workbook workbook = new XSSFWorkbook();
		// 创建单元格样式
		CellStyle headerStyle = this.createHeaderStyle(workbook);
		CellStyle baseStringStyle = this.createBaseStringCellStyle(workbook);
		CellStyle numberStyle = this.createNumberCellStyle(workbook);

		for (Map.Entry<String, Map<String, List<Entity>>> unitEntry : exportMap.entrySet()) {
			String unitName = unitEntry.getKey();
			Map<String, List<Entity>> businessDataMap = unitEntry.getValue();

			// 创建sheet，设置sheet名称（处理过长的名称）
			String sheetName = unitName.length() > 31 ? unitName.substring(0, 31) : unitName;
			Sheet sheet = workbook.createSheet(sheetName);

			// 设置单元格宽度
			this.setColumnWidths(sheet);
			
			// 冻结前3列（参数含义：冻结列数，冻结行数，右侧滚动区域起始列，下方滚动区域起始行）
			sheet.createFreezePane(3, 0, 3, 0);

			int currentRowNum = 0;

			// 第一部分：财务报表
			List<Entity> cwbbList = businessDataMap.get("cwbb");
			// 对根节点按照serial_number排序
			if (cwbbList != null) {
				Collections.sort(cwbbList, createSerialNumberComparator());
			}
			// 创建表头行
			Row cwbbHeaderRow = sheet.createRow(currentRowNum++);
			this.createHeaderRow(cwbbHeaderRow, "第一部分：财务报表", "合计", headerStyle);
			Map<String, Entity> cwbbDataMap = this.dataToMap(cwbbList);
			List<Entity> cwbbRootNodes = this.getRootNodes(cwbbList);
			// 对根节点排序
			Collections.sort(cwbbRootNodes, createSerialNumberComparator());
			List<String> cwbbFieldNameList = ListUtil.toLinkedList("serial_number", "name", "total_amount", "jan_amount", "feb_amount", "mar_amount", "apr_amount", "may_amount", "jun_amount",
					"jul_amount", "aug_amount", "sep_amount", "oct_amount", "nov_amount", "dec_amount");
			// 写入树形数据
			for (Entity root : cwbbRootNodes) {
				currentRowNum = writeTreeData(sheet, root, cwbbDataMap, currentRowNum, 0, baseStringStyle, numberStyle, cwbbFieldNameList, workbook);
			}

			currentRowNum += 2;

			// 第二部分：人员及人均情况
			List<Entity> ryjrjqkList = businessDataMap.get("ryjrjqk");
			// 对根节点按照serial_number排序
			if (ryjrjqkList != null) {
				Collections.sort(ryjrjqkList, createSerialNumberComparator());
			}
			// 创建表头行
			Row ryjrjqkHeaderRow = sheet.createRow(currentRowNum++);
			this.createHeaderRow(ryjrjqkHeaderRow, "第二部分：人员及人均情况", "平均实际", headerStyle);
			Map<String, Entity> ryjrjqkDataMap = this.dataToMap(ryjrjqkList);
			List<Entity> ryjrjqkRootNodes = this.getRootNodes(ryjrjqkList);
			// 对根节点排序
			Collections.sort(ryjrjqkRootNodes, createSerialNumberComparator());
			List<String> ryjrjqkFieldNameList = ListUtil.toLinkedList("serial_number", "name", "average_actual", "jan", "feb", "mar", "apr", "may", "jun", "jul", "aug", "sep", "oct", "nov", "dec");
			// 写入树形数据
			for (Entity root : ryjrjqkRootNodes) {
				currentRowNum = writeTreeData(sheet, root, ryjrjqkDataMap, currentRowNum, 0, baseStringStyle, numberStyle, ryjrjqkFieldNameList, workbook);
			}

			currentRowNum += 2;

			// 第三部分：劳动生产率
			List<Entity> ldsclList = businessDataMap.get("ldscl");
			// 对根节点按照serial_number排序
			if (ldsclList != null) {
				Collections.sort(ldsclList, createSerialNumberComparator());
			}
			// 创建表头行
			Row ldsclHeaderRow = sheet.createRow(currentRowNum++);
			this.createHeaderRow(ldsclHeaderRow, "第三部分：劳动生产率", "合计", headerStyle);
			Map<String, Entity> ldsclDataMap = this.dataToMap(ldsclList);
			List<Entity> ldsclRootNodes = this.getRootNodes(ldsclList);
			// 对根节点排序
			Collections.sort(ldsclRootNodes, createSerialNumberComparator());
			List<String> ldsclFieldNameList = ListUtil.toLinkedList("serial_number", "name", "total_amount", "jan_amount", "feb_amount", "mar_amount", "apr_amount", "may_amount", "jun_amount",
					"jul_amount", "aug_amount", "sep_amount", "oct_amount", "nov_amount", "dec_amount");
			// 写入树形数据
			for (Entity root : ldsclRootNodes) {
				currentRowNum = writeTreeData(sheet, root, ldsclDataMap, currentRowNum, 0, baseStringStyle, numberStyle, ldsclFieldNameList, workbook);
			}

			currentRowNum += 2;

			// 第四部分：人工成本-全口径
			List<Entity> rgcbqkjList = businessDataMap.get("rgcbqkj");
			// 对根节点按照serial_number排序
			if (rgcbqkjList != null) {
				Collections.sort(rgcbqkjList, createSerialNumberComparator());
			}
			// 创建表头行
			Row rgcbqkjHeaderRow = sheet.createRow(currentRowNum++);
			this.createHeaderRow(rgcbqkjHeaderRow, "第四部分：人工成本-全口径", "合计", headerStyle);
			Map<String, Entity> rgcbqkjDataMap = this.dataToMap(rgcbqkjList);
			List<Entity> rgcbqkjRootNodes = this.getRootNodes(rgcbqkjList);
			// 对根节点排序
			Collections.sort(rgcbqkjRootNodes, createSerialNumberComparator());
			List<String> rgcbqkjFieldNameList = ListUtil.toLinkedList("serial_number", "name", "total_amount", "jan_amount", "feb_amount", "mar_amount", "apr_amount", "may_amount", "jun_amount",
					"jul_amount", "aug_amount", "sep_amount", "oct_amount", "nov_amount", "dec_amount");
			// 写入树形数据
			for (Entity root : rgcbqkjRootNodes) {
				currentRowNum = writeTreeData(sheet, root, rgcbqkjDataMap, currentRowNum, 0, baseStringStyle, numberStyle, rgcbqkjFieldNameList, workbook);
			}

		}

		// 保存文件
		String filePath = saveWorkbook(workbook);
		Console.log("Excel导出成功，路径：{}", filePath);
		return filePath;
	}

	// 新增：设置所有列的宽度
	private void setColumnWidths(Sheet sheet) {
		// 列索引从0开始，宽度值 = 字符数 * 256（1/256个字符宽度）
		// 0: 序号列（较窄）
		sheet.setColumnWidth(0, 8 * 256);
		// 1: 名称列（较宽，容纳长文本）
		sheet.setColumnWidth(1, 35 * 256);
		// 2: 合计/平均实际列
		sheet.setColumnWidth(2, 15 * 256);
		// 3-14: 月份列（1月至12月）
		for (int i = 3; i <= 14; i++) {
			sheet.setColumnWidth(i, 15 * 256);
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

	// 创建基础字符串样式（无缩进，供动态生成缩进样式使用）
	private CellStyle createBaseStringCellStyle(Workbook workbook) {
		CellStyle style = workbook.createCellStyle();
		style.setAlignment(HorizontalAlignment.LEFT);
		style.setVerticalAlignment(VerticalAlignment.CENTER);
		style.setBorderTop(BorderStyle.THIN);
		style.setBorderBottom(BorderStyle.THIN);
		style.setBorderLeft(BorderStyle.THIN);
		style.setBorderRight(BorderStyle.THIN);
		return style;
	}

	// 创建数值类型单元格样式（保留两位小数）
	private CellStyle createNumberCellStyle(Workbook workbook) {
		CellStyle style = workbook.createCellStyle();
		// 设置数值格式为两位小数
		DataFormat format = workbook.createDataFormat();
		style.setDataFormat(format.getFormat("0.00"));
		style.setAlignment(HorizontalAlignment.RIGHT); // 数值右对齐
		style.setVerticalAlignment(VerticalAlignment.CENTER);
		style.setBorderTop(BorderStyle.THIN);
		style.setBorderBottom(BorderStyle.THIN);
		style.setBorderLeft(BorderStyle.THIN);
		style.setBorderRight(BorderStyle.THIN);
		return style;
	}

	// 创建表头行
	private void createHeaderRow(Row headerRow, String twoColumnName, String threeColumnName, CellStyle headerStyle) {
		for (int i = 0; i < 15; i++) {
			Cell cell = headerRow.createCell(i);
			if (i == 0) {
				cell.setCellValue("序号");
			} else if (i == 1) {
				cell.setCellValue(twoColumnName);
			} else if (i == 2) {
				cell.setCellValue(threeColumnName);
			} else {
				int month = i - 2;
				String value = StrUtil.format("{}月", month);
				cell.setCellValue(value);
			}
			cell.setCellStyle(headerStyle);
		}

	}

	private Map<String, Entity> dataToMap(List<Entity> dataList) {
		Map<String, Entity> dataMap = new HashMap<>();
		for (Entity entity : dataList) {
			String id = entity.getStr("id");
			dataMap.put(id, entity);
		}
		return dataMap;
	}

	private List<Entity> getRootNodes(List<Entity> dataList) {
		List<Entity> rootNodes = new ArrayList<>();
		for (Entity entity : dataList) {
			String parentId = entity.getStr("parent");
			if ("-1".equals(parentId)) {
				rootNodes.add(entity);
			}
		}
		return rootNodes;
	}

	// 递归写入树形数据，实现折叠功能
	private int writeTreeData(Sheet sheet, Entity node, Map<String, Entity> dataMap, int rowNum, int level, CellStyle baseStringStyle, CellStyle numberStyle, List<String> fieldNames, Workbook workbook) {
		// 记录当前节点行号
		int currentRow = rowNum++;
		// 创建行并写入当前节点数据
		Row row = sheet.createRow(currentRow);
		int cellIndex = 0;

		// 为当前层级创建带缩进的样式（仅用于name列）
		CellStyle indentedStyle = createIndentedStyle(workbook, baseStringStyle, level);

		for (String fieldName : fieldNames) {
			Cell cell = row.createCell(cellIndex++);
			Object value = node.get(fieldName);
			// 对name列应用带缩进的样式，其他字符串列应用基础样式
			if ("name".equals(fieldName)) {
				// name列：使用带缩进的样式
				if (value != null) {
					cell.setCellValue(value.toString());
				} else {
					cell.setCellValue("");
				}
				cell.setCellStyle(indentedStyle);
			} else if (value instanceof BigDecimal) {
				// 数值列：使用数值样式
				BigDecimal numberValue = (BigDecimal) value;
				cell.setCellValue(numberValue.doubleValue());
				cell.setCellStyle(numberStyle);
			} else if (value != null) {
				// 其他字符串列：使用基础字符串样式（无缩进）
				cell.setCellValue(value.toString());
				cell.setCellStyle(baseStringStyle);
			} else {
				// 空值处理
				cell.setCellValue("");
				cell.setCellStyle(baseStringStyle);
			}
		}

		// 查找子节点并排序
		String nodeId = node.getStr("id");
		List<Entity> children = new ArrayList<>();
		for (Entity child : dataMap.values()) {
			String parentId = child.getStr("parent");
			if (nodeId.equals(parentId)) {
				children.add(child);
			}
		}

		// 按serial_number排序子节点
		Collections.sort(children, createSerialNumberComparator());

		// 递归处理子节点
		int firstChildRow = rowNum; // 记录第一个子节点的行号
		for (Entity child : children) {
			rowNum = writeTreeData(sheet, child, dataMap, rowNum, level + 1, baseStringStyle, numberStyle, fieldNames, workbook);
		}

		// 按分组级别决定是否折叠
		if (firstChildRow < rowNum) { // 存在子节点才需要分组
			int groupLevel = level + 1; // 分组级别 = 当前节点层级 + 1
			// 规则：第1级分组（根节点的子节点）默认展开，第2级及以上默认折叠
			boolean isCollapsed = groupLevel != 1;
			sheet.groupRow(firstChildRow, rowNum - 1); // 建立子节点分组
			sheet.setRowGroupCollapsed(groupLevel, isCollapsed); // 设置折叠状态
		}

		return rowNum;
	}

	// 保存Workbook到文件
	private String saveWorkbook(Workbook workbook) throws Exception {
		// 创建临时文件
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
		String datetimeString = format.format(new Date());
		File tempFile = File.createTempFile("预算填报导出_" + datetimeString, ".xlsx");
		try (FileOutputStream fos = new FileOutputStream(tempFile)) {
			workbook.write(fos);
		}
		return tempFile.getAbsolutePath();
	}

	// 创建serial_number字段的比较器，用于xx.xx.xx格式的字符串排序
	private Comparator<Entity> createSerialNumberComparator() {
		return (entity1, entity2) -> {
			String sn1 = entity1.getStr("serial_number");
			String sn2 = entity2.getStr("serial_number");

			// 处理空值情况
			if (sn1 == null && sn2 == null)
				return 0;
			if (sn1 == null)
				return -1;
			if (sn2 == null)
				return 1;

			// 分割成数字数组
			String[] parts1 = sn1.split("\\.");
			String[] parts2 = sn2.split("\\.");

			// 比较每一级数字
			int minLength = Math.min(parts1.length, parts2.length);
			for (int i = 0; i < minLength; i++) {
				try {
					int num1 = Integer.parseInt(parts1[i]);
					int num2 = Integer.parseInt(parts2[i]);
					if (num1 != num2) {
						return Integer.compare(num1, num2);
					}
				} catch (NumberFormatException e) {
					// 如果解析失败，使用字符串比较
					return parts1[i].compareTo(parts2[i]);
				}
			}

			// 如果前面的部分都相同，短的排在前面
			return Integer.compare(parts1.length, parts2.length);
		};
	}

	// 根据层级创建带缩进的样式（基于基础字符串样式复制，仅修改缩进属性）
	private CellStyle createIndentedStyle(Workbook workbook, CellStyle baseStyle, int level) {
		CellStyle indentedStyle = workbook.createCellStyle();
		// 复制基础样式的所有属性（对齐方式、边框等）
		indentedStyle.cloneStyleFrom(baseStyle);
		// 设置缩进量：层级每增加1，缩进增加2个字符（POI缩进最大值为15，超过会报错）
		short indent = (short) Math.min(level * 2, 15);
		indentedStyle.setIndention(indent);
		return indentedStyle;
	}

}
