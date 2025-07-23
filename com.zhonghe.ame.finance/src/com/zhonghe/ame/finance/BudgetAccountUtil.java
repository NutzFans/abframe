package com.zhonghe.ame.finance;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import cn.hutool.core.text.CharSequenceUtil;
import cn.hutool.core.util.ArrayUtil;
import cn.hutool.core.util.NumberUtil;
import cn.hutool.db.Entity;
import cn.hutool.db.Session;

import com.eos.common.connection.DataSourceHelper;
import com.eos.foundation.data.DataObjectUtil;
import com.eos.foundation.database.DatabaseExt;
import com.eos.foundation.database.DatabaseUtil;
import com.eos.system.annotation.Bizlet;

import commonj.sdo.DataObject;

@Bizlet("预算主体工具类")
public class BudgetAccountUtil {

	@Bizlet("导入Excel数据")
	public String importExcel(String excelFilePath) {
		try {
			Sheet excelSheet = this.getSheet(excelFilePath);
			DataObject[] dataObjects = this.getDataObjects(excelSheet);
			DatabaseUtil.insertEntityBatch("default", dataObjects);
			return "导入数据成功";
		} catch (Exception e) {
			e.printStackTrace();
			return "导入数据失败！";
		}

	}

	// 获取excelsheet
	private Sheet getSheet(String excelFilePath) throws Exception {
		InputStream is = new FileInputStream(excelFilePath);
		if (CharSequenceUtil.endWith(excelFilePath, ".xlsx", true)) {
			return new XSSFWorkbook(is).getSheetAt(0);
		} else {
			return new HSSFWorkbook(is).getSheetAt(0);
		}
	}

	// 获取入库的数据集
	private DataObject[] getDataObjects(Sheet excelSheet) throws Exception {
		List<DataObject> dataObjects = new ArrayList<DataObject>();

		for (int rowNum = 1; rowNum <= excelSheet.getLastRowNum(); rowNum++) {
			Row excelRow = excelSheet.getRow(rowNum);
			DataObject dataObject = DataObjectUtil.createDataObject("com.zhonghe.ame.finance.budgetAccount.ZhCaiwuBudgetAccount");
			DatabaseExt.getPrimaryKey(dataObject);
			// 预算主体
			Cell nameCell = excelRow.getCell(0);
			dataObject.set("name", nameCell != null ? nameCell.getStringCellValue() : null);
			// 主体代码
			Cell codeCell = excelRow.getCell(1);
			dataObject.set("code", codeCell != null ? codeCell.getStringCellValue() : null);
			// 主体排序
			Cell sortingCell = excelRow.getCell(2);
			dataObject.set("sorting", sortingCell != null ? NumberUtil.parseInt(String.valueOf(sortingCell.getNumericCellValue())) : 1);
			// 预算填报组织
			Cell orgCell = excelRow.getCell(3);
			dataObject.set("fillingInOrg", orgCell != null ? orgCell.getStringCellValue() : null);

			dataObjects.add(dataObject);
		}

		return ArrayUtil.toArray(dataObjects, DataObject.class);
	}

}
