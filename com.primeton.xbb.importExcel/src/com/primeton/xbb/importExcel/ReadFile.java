/**
 * 
 */
package com.primeton.xbb.importExcel;

import java.io.File;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import com.eos.foundation.database.DatabaseExt;
import com.eos.foundation.database.DatabaseUtil;
import com.eos.system.annotation.Bizlet;

import commonj.sdo.DataObject;

/**
 * @author jiangnan
 * @date 2014-02-12 17:18:05
 *
 */
import jxl.CellType;
import jxl.DateCell;
import jxl.NumberCell;
import jxl.Sheet;
import jxl.Workbook;

@Bizlet("")
public class ReadFile {
	/**
	 * @param fileName
	 * @param filePath 
	 */
	@Bizlet("readFile")
	public static commonj.sdo.DataObject[] readFile(String filePath) {
		try {
			ArrayList<commonj.sdo.DataObject> listFail = new ArrayList<DataObject>();
			ArrayList<commonj.sdo.DataObject> listOK = new ArrayList<DataObject>();

			Workbook book = Workbook.getWorkbook(new File(filePath));

			//得到第一页 sheet 
			//页Sheet是从0开始索引的 
			Sheet sheet = book.getSheet(0);
			int rowNum = sheet.getRows();
			//			int columNum=sheet.getColumns();
			for (int i = 2; i < rowNum; i++) {

				/*2019-03-21 修改
				 * INCOME_EXCEL_STYLE:	
				 *0:contractno	
				 1:income_date	
				 2:custname	
				 3:projectname
				 4:INCOME_MONEY  	
				 5:jrservmoney	
				 6:sales_user_name
				 
				 生成：
				 pk_income	
				 sales_user_id	
				 deptid	secondDeptId
				 */
				String contractno = sheet.getCell(0, i).getContents();
				Date income_date = null;
				String custname = sheet.getCell(2, i).getContents();
				String projectname = sheet.getCell(3, i).getContents();
				BigDecimal income_money = new BigDecimal(0.0);
				BigDecimal jrservmoney = new BigDecimal(0.0);
				
				String sales_user_name = sheet.getCell(6, i).getContents();
				String sales_user_id = null;
				commonj.sdo.DataObject org = commonj.sdo.helper.DataFactory.INSTANCE.create("org.gocom.abframe.dataset.organization","OmOrganization");
				org.setString("orgname", sales_user_name);
				DatabaseUtil.expandEntityByTemplate("default", org, org);
				sales_user_id = org.getString("orgid");
 
				CellType ctDate = sheet.getCell(1, i).getType();
				if (ctDate == CellType.DATE) {
					DateCell cellDate = (DateCell) sheet.getCell(1, i);
					income_date = cellDate.getDate();
				}
				if (ctDate == CellType.NUMBER) {
					String dateString = dayAddition(Integer.valueOf(sheet.getCell(1, i).getContents()));
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					sdf.setLenient(false);
					income_date = sdf.parse(dateString);
				}
				if (sheet.getCell(4, i).getType() == CellType.NUMBER) {
					NumberCell cellIncomeMoney = (NumberCell) sheet.getCell(4,i);
					Double income_moneyD = cellIncomeMoney.getValue();
					income_money = BigDecimal.valueOf(income_moneyD);
				} else if (sheet.getCell(4, i).getType() != CellType.EMPTY) {
					income_money = new BigDecimal(sheet.getCell(4, i).getContents());
				}
				if (sheet.getCell(5, i).getType() == CellType.NUMBER) {
					NumberCell cellJrservmoney = (NumberCell) sheet.getCell(5,i);
					Double jrservmoneyD = cellJrservmoney.getValue();
					jrservmoney = BigDecimal.valueOf(jrservmoneyD);
				} else if (sheet.getCell(5, i).getType() != CellType.EMPTY) {
					jrservmoney = new BigDecimal(sheet.getCell(5, i).getContents());
				}
				commonj.sdo.DataObject income = commonj.sdo.helper.DataFactory.INSTANCE.create("com.primeton.xbb.importExcel.newdataset","ErpIncome");
				income.set("contractno", contractno);
				income.set("incomeDate", income_date);
				income.set("custname", custname);
				income.set("projectname", projectname);
				income.set("incomeMoney", income_money);
				income.set("jrservmoney", jrservmoney);
				income.set("salesUserName", sales_user_name);
				income.set("salesUserId", sales_user_id);
				if (income_date != null) {
					DatabaseExt.getPrimaryKey(income);
					listOK.add(income);
				} else {
					listFail.add(income);
				}
			}
			book.close();
			DataObject[] incomeOK = new DataObject[listOK.size()];
			//批量增加和修改id
			DatabaseUtil.insertEntityBatch("default", listOK.toArray(incomeOK));
			DatabaseExt.executeNamedSql("default","com.primeton.eos.common.empNumDeal.updateIncome", null);
			DataObject[] incomeFails = new DataObject[listFail.size()];
			return listFail.toArray(incomeFails);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	//读Excel日期变为数值的处理方法，日期相加天数  
	public static String dayAddition(int num) throws Exception {
		SimpleDateFormat timeformat = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date date = timeformat.parse("1900-1-1");
		Calendar a = Calendar.getInstance();
		a.setTime(date);
		a.add(Calendar.DATE, (num - 2));
		return timeformat.format(a.getTime());
	}

	@Bizlet("delete")
	public String delete(String year) {
		return year + "";
	}

}
