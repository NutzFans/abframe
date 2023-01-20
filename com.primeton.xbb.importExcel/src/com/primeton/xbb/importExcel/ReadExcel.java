/**
 * 
 */
package com.primeton.xbb.importExcel;

import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import jxl.CellType;
import jxl.DateCell;
import jxl.NumberCell;
import jxl.Sheet;
import jxl.Workbook;
import jxl.read.biff.BiffException;

import com.eos.foundation.database.DatabaseExt;
import com.eos.foundation.database.DatabaseUtil;
import com.eos.system.annotation.Bizlet;
import commonj.sdo.DataObject;

/**
 * @author jiangnan
 * @date 2014-02-27 23:23:40
 * 
 */
@Bizlet("ReadExcel")
public class ReadExcel {

	/**
	 * @param filePath
	 * @return
	 * @author jiangnan
	 * @throws IOException
	 * @throws BiffException
	 */
	@Bizlet("read")
	public static ArrayList<String[]> read(String filePath) {
		ArrayList<String[]> list = new ArrayList<String[]>();

		Workbook book;
		try {
			book = Workbook.getWorkbook(new File(filePath));
		} catch (BiffException e) {
			list.add(new String[] { "type error: " + e.getMessage() });
			return list;
		} catch (IOException e) {
			list.add(new String[] { "IO error:" + e.getMessage() });
			return list;
		}

		// 得到第一页 sheet
		// 页Sheet是从0开始索引的
		Sheet sheet = book.getSheet(0);
		int rowNum = sheet.getRows();
		int columNum = sheet.getColumns();
		for (int i = 0; i < rowNum; i++) {
			String[] contents = new String[columNum];

			for (int j = 0; j < columNum; j++) {

				String content = sheet.getCell(j, i).getContents();
				contents[j] = content;
			}
			list.add(contents);
		}

		book.close();
		return list;
	}

	public static void main(String[] args) throws BiffException, IOException {
		List<String[]> list = read("C:/test.xls");
		List<String> errors = new ArrayList<String>();
		for (int i = 0; i < list.size(); i++) {
			String[] ss = list.get(i);
			for (int j = 0; j < ss.length; j++) {
				String s = ss[j];
				try {
					if (j == 0) {

					}
					if (j == 1) {
						BigDecimal bd;
						bd = new BigDecimal(s);
						System.out.println(bd);
					}
				} catch (NumberFormatException e) {
					errors.add("zai di: " + j + " hang chu le wenti, message: " + e.getMessage());
				}
			}

		}

	}

	@Bizlet("readFile")
	public static commonj.sdo.DataObject[] readFile(String filePath) {
		try {
			ArrayList<commonj.sdo.DataObject> listFail = new ArrayList<DataObject>();
			ArrayList<commonj.sdo.DataObject> listOK = new ArrayList<DataObject>();

			Workbook book = Workbook.getWorkbook(new File(filePath));

			// 得到第一页 sheet
			// 页Sheet是从0开始索引的
			Sheet sheet = book.getSheet(0);
			int rowNum = sheet.getRows();
			// int columNum=sheet.getColumns();
			for (int i = 2; i < rowNum; i++) {

				/*
				 * INCOME_EXCEL_STYLE: 0:contractno 1:income_date 2:custname
				 * 3:projectname 4:income_money1 5:kpnr 6:srlb 7:PDLX 8:prodline
				 * 9:INCOME_MONEY 10:TAX 11:THIRDPAY 12:subcontracting
				 * 13:net_money 14:JRSERVMONEY 15:sales_user_name 16:deptname
				 * 17:secondDeptName
				 * 
				 * 生成： pk_income sales_user_id deptid secondDeptId
				 */
				String contractno = sheet.getCell(0, i).getContents();
				Date income_date = null;
				String custname = sheet.getCell(2, i).getContents();
				String projectname = sheet.getCell(3, i).getContents();
				BigDecimal incomeMoney1 = new BigDecimal(0.0);
				String kpnr = sheet.getCell(5, i).getContents();
				String srlb = sheet.getCell(6, i).getContents();
				String pdlx = sheet.getCell(7, i).getContents();
				String prodline = sheet.getCell(8, i).getContents();
				BigDecimal income_money = new BigDecimal(0.0);
				BigDecimal tax = new BigDecimal(0.0);
				BigDecimal thirdpay = new BigDecimal(0.0);
				BigDecimal subcontracting = new BigDecimal(0.0);
				BigDecimal net_money = new BigDecimal(0.0);
				BigDecimal jrservmoney = new BigDecimal(0.0);
				String sales_user_name = sheet.getCell(15, i).getContents();
				String deptname = sheet.getCell(16, i).getContents();
				String secondDeptName = sheet.getCell(17, i).getContents();
				String deptid = null;

				if (deptname.equals("政企")) {
					deptid = "34";
				} else if (deptname.equals("公共")) {
					deptid = "35";
				} else if (deptname.equals("金融")) {
					deptid = "36";
				} else if (deptname.equals("产品支持")) {
					deptid = "37";
				}

				CellType ctDate = sheet.getCell(1, i).getType();
				// System.out.println(ctDate+"-first ");

				if (ctDate == CellType.DATE) {
					DateCell cellDate = (DateCell) sheet.getCell(1, i);
					income_date = cellDate.getDate();
				}
				if (ctDate == CellType.NUMBER) {
					String dateString = dayAddition(Integer.valueOf(sheet
							.getCell(1, i).getContents()));
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					sdf.setLenient(false);
					income_date = sdf.parse(dateString);
				}

				// System.out.print(ctDate);

				if (sheet.getCell(4, i).getType() == CellType.NUMBER) {
					NumberCell cellIncomeMoney1 = (NumberCell) sheet.getCell(4,
							i);
					Double income_money1 = cellIncomeMoney1.getValue();
					incomeMoney1 = BigDecimal.valueOf(income_money1);
				} else if (sheet.getCell(4, i).getType() != CellType.EMPTY) {
					incomeMoney1 = new BigDecimal(sheet.getCell(4, i)
							.getContents());
				}

				if (sheet.getCell(9, i).getType() == CellType.NUMBER) {
					NumberCell cellIncomeMoney = (NumberCell) sheet.getCell(9,
							i);
					Double income_moneyD = cellIncomeMoney.getValue();
					income_money = BigDecimal.valueOf(income_moneyD);
				} else if (sheet.getCell(9, i).getType() != CellType.EMPTY) {
					income_money = new BigDecimal(sheet.getCell(9, i)
							.getContents());
				}

				if (sheet.getCell(10, i).getType() == CellType.NUMBER) {
					NumberCell cellTax = (NumberCell) sheet.getCell(10, i);
					Double taxD = cellTax.getValue();
					tax = BigDecimal.valueOf(taxD);
				} else if (sheet.getCell(10, i).getType() != CellType.EMPTY) {
					tax = new BigDecimal(sheet.getCell(10, i).getContents());
				}

				if (sheet.getCell(11, i).getType() == CellType.NUMBER) {
					NumberCell cellThirdpay = (NumberCell) sheet.getCell(11, i);
					Double thirdpayD = cellThirdpay.getValue();
					thirdpay = BigDecimal.valueOf(thirdpayD);
				} else if (sheet.getCell(11, i).getType() != CellType.EMPTY) {
					thirdpay = new BigDecimal(sheet.getCell(11, i)
							.getContents());
				}

				if (sheet.getCell(12, i).getType() == CellType.NUMBER) {
					NumberCell cellSkqrsr = (NumberCell) sheet.getCell(12, i);
					Double subcontractingD = cellSkqrsr.getValue();
					subcontracting = BigDecimal.valueOf(subcontractingD);
				} else if (sheet.getCell(12, i).getType() != CellType.EMPTY) {
					subcontracting = new BigDecimal(sheet.getCell(12, i)
							.getContents());
				}

				if (sheet.getCell(13, i).getType() == CellType.NUMBER) {
					NumberCell cellNetMoney = (NumberCell) sheet.getCell(13, i);
					Double net_moneyD = cellNetMoney.getValue();
					net_money = BigDecimal.valueOf(net_moneyD);
				} else if (sheet.getCell(13, i).getType() != CellType.EMPTY) {
					net_money = new BigDecimal(sheet.getCell(13, i)
							.getContents());
				}

				if (sheet.getCell(14, i).getType() == CellType.NUMBER) {
					NumberCell cellJrservmoney = (NumberCell) sheet.getCell(14,
							i);
					Double jrservmoneyD = cellJrservmoney.getValue();
					jrservmoney = BigDecimal.valueOf(jrservmoneyD);
				} else if (sheet.getCell(14, i).getType() != CellType.EMPTY) {
					jrservmoney = new BigDecimal(sheet.getCell(14, i)
							.getContents());
				}

				commonj.sdo.DataObject income = commonj.sdo.helper.DataFactory.INSTANCE
						.create("com.primeton.xbb.importExcel.newdataset",
								"ErpIncome");
				income.set("contractno", contractno);
				income.set("incomeDate", income_date);
				income.set("custname", custname);
				income.set("projectname", projectname);
				income.set("incomeMoney1", incomeMoney1);
				income.set("kpnr", kpnr);
				income.set("srlb", srlb);
				income.set("pdlx", pdlx);
				income.set("incomeMoney", income_money);
				income.set("prodline", prodline);
				income.set("tax", tax);
				income.set("thirdpay", thirdpay);
				income.set("netMoney", net_money);
				income.set("jrservmoney", jrservmoney);
				income.set("salesUserName", sales_user_name);
				income.set("deptname", deptname);
				income.set("deptid", deptid);
				income.set("subcontracting", subcontracting);
				income.set("seconddeptname", secondDeptName);

				if (income_date != null) {
					DatabaseExt.getPrimaryKey(income);
					listOK.add(income);

				} else {
					listFail.add(income);

				}
			}

			// System.out.println(list.get(list.size()-1));
			book.close();
			DataObject[] incomeOK = new DataObject[listOK.size()];
			// 批量增加和修改id
			DatabaseUtil.insertEntityBatch("default", listOK.toArray(incomeOK));
			DatabaseExt.executeNamedSql("default",
					"com.primeton.eos.common.empNumDeal.updateIncome", null);

			DataObject[] incomeFails = new DataObject[listFail.size()];
			return listFail.toArray(incomeFails);

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}

	// 读Excel日期变为数值的处理方法，日期相加天数
	public static String dayAddition(int num) throws Exception {
		SimpleDateFormat timeformat = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date date = timeformat.parse("1900-1-1");
		Calendar a = Calendar.getInstance();
		a.setTime(date);
		a.add(Calendar.DATE, (num - 2));
		return timeformat.format(a.getTime());

	}

}
