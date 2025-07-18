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

@Bizlet("会计科目工具类")
public class LedgerAccountUtil {

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
		Map<String, String> categoryMap = this.getCategoryMap();

		for (int rowNum = 1; rowNum <= excelSheet.getLastRowNum(); rowNum++) {
			Row excelRow = excelSheet.getRow(rowNum);
			DataObject dataObject = DataObjectUtil.createDataObject("com.zhonghe.ame.finance.ledgerAccount.ZhCaiwuLedgerAccount");
			DatabaseExt.getPrimaryKey(dataObject);
			// 科目名称
			Cell nameCell = excelRow.getCell(0);
			dataObject.set("name", nameCell != null ? nameCell.getStringCellValue() : null);
			// 排序
			Cell sortingCell = excelRow.getCell(1);
			dataObject.set("sorting", sortingCell != null ? NumberUtil.parseInt(String.valueOf(sortingCell.getNumericCellValue())) : 1);
			// 科目分类
			Cell categoryCell = excelRow.getCell(2);
			dataObject.set("category", categoryCell != null ? categoryMap.get(categoryCell.getStringCellValue()) : null);
			// 职能部门 - 科目代码
			Cell znErpCodeCell = excelRow.getCell(3);
			dataObject.set("znErpCode", znErpCodeCell != null ? znErpCodeCell.getStringCellValue() : null);
			// 职能部门 - ERP预算及会计科目
			Cell znErpNameCell = excelRow.getCell(4);
			dataObject.set("znErpName", znErpNameCell != null ? znErpNameCell.getStringCellValue() : null);
			// 职能部门 - 科目说明
			Cell znErpRemarkCell = excelRow.getCell(5);
			dataObject.set("znErpRemark", znErpRemarkCell != null ? znErpRemarkCell.getStringCellValue() : null);
			// 项目部 - 科目代码
			Cell xmErpCodeCell = excelRow.getCell(6);
			dataObject.set("xmErpCode", xmErpCodeCell != null ? xmErpCodeCell.getStringCellValue() : null);
			// 项目部 - ERP预算及会计科目
			Cell xmErpNameCell = excelRow.getCell(7);
			dataObject.set("xmErpName", xmErpNameCell != null ? xmErpNameCell.getStringCellValue() : null);
			// 项目部 - 科目说明
			Cell xmErpRemarkCell = excelRow.getCell(8);
			dataObject.set("xmErpRemark", xmErpRemarkCell != null ? xmErpRemarkCell.getStringCellValue() : null);

			dataObjects.add(dataObject);
		}

		return ArrayUtil.toArray(dataObjects, DataObject.class);
	}

	// 获取科目分类Map对象
	private Map<String, String> getCategoryMap() throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		String querySql = "SELECT DICTID, DICTNAME FROM EOS_DICT_ENTRY WHERE DICTTYPEID = 'CW_KM_CLASS'";
		Session dbSession = new Session(DataSourceHelper.getDataSource());
		List<Entity> dictList = dbSession.query(querySql);
		for (Entity dict : dictList) {
			map.put(dict.getStr("DICTNAME"), dict.getStr("DICTID"));
		}
		return map;
	}

}
