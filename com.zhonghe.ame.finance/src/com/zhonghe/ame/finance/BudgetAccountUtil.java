package com.zhonghe.ame.finance;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import cn.hutool.core.text.CharSequenceUtil;
import cn.hutool.core.util.ArrayUtil;
import cn.hutool.core.util.NumberUtil;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
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

	@Bizlet("获取预算主体列表(排除掉没有设置填报组织的)")
	public List<Map<String, String>> getBudgetAccountList() throws Exception {
		Session dbSession = new Session(DataSourceHelper.getDataSource());
		String querySql = "SELECT id, name, filling_in_org, code FROM zh_caiwu_budget_account WHERE filling_in_org IS NOT NULL ORDER BY sorting ASC";
		List<Entity> budgetAccountList = dbSession.query(querySql);

		List<Map<String, String>> result = budgetAccountList.stream().map(budgetAccount -> {
			Map<String, String> map = new HashMap<>();
			map.put("id", budgetAccount.getStr("id"));
			map.put("name", budgetAccount.getStr("name"));
			map.put("fillingInOrg", budgetAccount.getStr("filling_in_org"));
			map.put("code", budgetAccount.getStr("code"));
			return map;
		}).collect(Collectors.toList());

		return result;
	}

	@Bizlet("获取预算主体列表(根据提供的组织ID)")
	public HashMap<String, Object> getBudgetAccountListByOrgId(String orgId) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		String secOrgStr = "";
		DataObject org = this.queryOrgById(orgId);
		if (ObjectUtil.isNotNull(org)) {
			String orgseq = org.getString("ORGSEQ");
			if (CharSequenceUtil.startWith(orgseq, ".1111.")) {
				DataObject data = this.queryOrgById("1111");
				if (ObjectUtil.isNotNull(data)) {
					secOrgStr = data.getString("ORGID");
				}
			} else {
				String[] splitToArray = CharSequenceUtil.splitToArray(orgseq, ".");
				if (splitToArray.length >= 3) {
					String secOrg = splitToArray[2];
					if (CharSequenceUtil.isNotBlank(secOrg)) {
						DataObject data = this.queryOrgById(secOrg);
						if (ObjectUtil.isNotNull(data)) {
							secOrgStr = data.getString("ORGID");
						}
					}
				}
			}
		}

		if (StrUtil.isNotBlank(secOrgStr)) {
			Session dbSession = new Session(DataSourceHelper.getDataSource());
			String querySql = "SELECT id, name, filling_in_org FROM zh_caiwu_budget_account WHERE filling_in_org IS NOT NULL ORDER BY sorting ASC";
			List<Entity> budgetAccountList = dbSession.query(querySql);
			final String bjStr = secOrgStr;
			budgetAccountList = budgetAccountList.stream().filter(budget -> StrUtil.equals(budget.getStr("filling_in_org"), bjStr)).collect(Collectors.toList());
			String budgetAccountIds = budgetAccountList.stream().map(budget -> budget.getStr("id")).collect(Collectors.joining(","));
			map.put("ids", budgetAccountIds);
			map.put("list", budgetAccountList);
		}

		return map;
	}

	private DataObject queryOrgById(String orgId) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("orgId", orgId);
		DataObject org = queryOneEntity("com.zhonghe.ame.contractPact.chargeContract.queryOrgById", map);
		return org;
	}

	private DataObject queryOneEntity(String sqlName, HashMap<String, Object> parameter) {
		Object[] objects = DatabaseExt.queryByNamedSql("default", sqlName, parameter);
		DataObject[] dataObjects = DataObjectUtil.convertDataObjects(objects, "commonj.sdo.DataObject", true);
		if (dataObjects != null && dataObjects.length > 0) {
			return dataObjects[0];
		}
		return null;
	}

}
