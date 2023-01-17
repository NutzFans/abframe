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

import jxl.CellType;
import jxl.DateCell;
import jxl.NumberCell;
import jxl.Sheet;
import jxl.Workbook;

import com.eos.foundation.database.DatabaseExt;
import com.eos.foundation.database.DatabaseUtil;
import com.eos.system.annotation.Bizlet;

import commonj.sdo.DataObject;

/**
 * @author xuqq
 * @date 2017-03-30 16:47:08
 *
 */
@Bizlet("")
public class ReadDrawback {

	/**
	 * @author xuqq
	 * 
	 */
	@Bizlet("")
	public static commonj.sdo.DataObject[]  readDrawback(String filePath) {
		try {
			ArrayList<commonj.sdo.DataObject> listFail = new ArrayList<DataObject>();
			ArrayList<commonj.sdo.DataObject> listOK = new ArrayList<DataObject>();

			Workbook book = Workbook.getWorkbook(new File(filePath));

			//得到第一页 sheet 
			//页Sheet是从0开始索引的 
			Sheet sheet = book.getSheet(0);
			int rowNum = sheet.getRows();
			for (int i = 2; i < rowNum; i++) {
				String sellername = sheet.getCell(0, i).getContents();
				BigDecimal sum = new BigDecimal(0.0);
				BigDecimal taxsum = new BigDecimal(0.0);
				BigDecimal divtax = new BigDecimal(0.0);
				Date date = null;
				String content = sheet.getCell(5, i).getContents();
				int orgid = 0;
				String orgname = sheet.getCell(6, i).getContents();
				
				//金额
				if (sheet.getCell(1, i).getType() == CellType.NUMBER) {
					NumberCell cellIncomeMoney1 = (NumberCell) sheet.getCell(1,i);
					Double income_money1 = cellIncomeMoney1.getValue();
					sum = BigDecimal.valueOf(income_money1);
				} else if (sheet.getCell(1, i).getType() != CellType.EMPTY) {
					sum = new BigDecimal(sheet.getCell(1, i).getContents());
				}
				//税额
				if (sheet.getCell(2, i).getType() == CellType.NUMBER) {
					NumberCell celltaxsum = (NumberCell) sheet.getCell(2,i);
					Double tax_sum = celltaxsum.getValue();
					taxsum = BigDecimal.valueOf(tax_sum);
				} else if (sheet.getCell(2, i).getType() != CellType.EMPTY) {
					taxsum = new BigDecimal(sheet.getCell(2, i).getContents());
				}
				//退税差异
				if (sheet.getCell(3, i).getType() == CellType.NUMBER) {
					NumberCell celldivtax = (NumberCell) sheet.getCell(3,i);
					Double div_sum = celldivtax.getValue();
					divtax = BigDecimal.valueOf(div_sum);
				} else if (sheet.getCell(3, i).getType() != CellType.EMPTY) {
					divtax = new BigDecimal(sheet.getCell(3, i).getContents());
				}
				
				//认证日期
				CellType ctDate = sheet.getCell(4, i).getType();
				if (ctDate == CellType.DATE) {
					DateCell cellDate = (DateCell) sheet.getCell(4, i);
					date = cellDate.getDate();
				}
				if (ctDate == CellType.NUMBER) {
					String dateString = dayAddition(Integer.valueOf(sheet.getCell(4, i).getContents()));
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					sdf.setLenient(false);
					date = sdf.parse(dateString);
				}
				if(ctDate == CellType.LABEL){
					String dateString = sheet.getCell(4, i).getContents();
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					sdf.setLenient(false);
					date = sdf.parse(dateString);
				}
				
				//销售id
				commonj.sdo.DataObject org = commonj.sdo.helper.DataFactory.INSTANCE.create("org.gocom.abframe.dataset.organization","OmOrganization");
				org.setString("orgname", orgname);
				DatabaseUtil.expandEntityByTemplate("default", org, org);
				orgid = org.getInt("orgid");
				
				commonj.sdo.DataObject drawback = commonj.sdo.helper.DataFactory.INSTANCE.create("com.primeton.xbb.importExcel.newdataset","ErpDrawback");
				drawback.set("sellername", sellername);
				drawback.set("sum", sum);
				drawback.set("taxsum", taxsum);
				drawback.set("divtax", divtax);
				drawback.set("date", date);
				drawback.set("content", content);
				drawback.set("orgid", orgid);
				drawback.set("orgname", orgname);
				if ( orgid != 0 && date != null) {
					DatabaseExt.getPrimaryKey(drawback);
					listOK.add(drawback);
				} else {
					listFail.add(drawback);
				}
			}
			book.close();
			DataObject[] incomeOK = new DataObject[listOK.size()];
			DatabaseUtil.insertEntityBatch("default", listOK.toArray(incomeOK));
			DataObject[] incomeFails = new DataObject[listFail.size()];
			return listFail.toArray(incomeFails);
		}catch (Exception e) {
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

}
