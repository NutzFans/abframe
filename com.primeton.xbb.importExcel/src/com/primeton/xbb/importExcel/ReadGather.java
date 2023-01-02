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
 * @date 2017-03-30 10:55:15
 *
 */
@Bizlet("ReadGather")
public class ReadGather {

	/**
	 * @author xuqq
	 * 
	 */
	@Bizlet("")
	public static commonj.sdo.DataObject[] readGather(String filePath) {
		try {
			ArrayList<commonj.sdo.DataObject> listFail = new ArrayList<DataObject>();
			ArrayList<commonj.sdo.DataObject> listOK = new ArrayList<DataObject>();

			Workbook book = Workbook.getWorkbook(new File(filePath));

			//得到第一页 sheet 
			//页Sheet是从0开始索引的 
			Sheet sheet = book.getSheet(0);
			int rowNum = sheet.getRows();
			for (int i = 2; i < rowNum; i++) {
				String contractno = sheet.getCell(0, i).getContents();
				String custname = sheet.getCell(1, i).getContents();
				int custid = 0;
				Date gatherdate = null;
				BigDecimal gathermon = new BigDecimal(0.0);
				String salename = sheet.getCell(4, i).getContents();
				String saleid = "";
				String sybname = sheet.getCell(5, i).getContents();
				int sybid = 0;
				String secondorgname = sheet.getCell(6, i).getContents();
				int secondorgid=0;
				String orgname = sheet.getCell(7, i).getContents();
				int orgid = 0;
				String gatheryear = sheet.getCell(8, i).getContents();
				
				//收款日期
				CellType ctDate = sheet.getCell(2, i).getType();
				if (ctDate == CellType.DATE) {
					DateCell cellDate = (DateCell) sheet.getCell(2, i);
					gatherdate = cellDate.getDate();
				}
				if (ctDate == CellType.NUMBER) {
					String dateString = dayAddition(Integer.valueOf(sheet.getCell(2, i).getContents()));
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					sdf.setLenient(false);
					gatherdate = sdf.parse(dateString);
				}
				if(ctDate == CellType.LABEL){
					String dateString = sheet.getCell(2, i).getContents();
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					sdf.setLenient(false);
					gatherdate = sdf.parse(dateString);
				}
				//收款金额
				if (sheet.getCell(3, i).getType() == CellType.NUMBER) {
					NumberCell cellIncomeMoney1 = (NumberCell) sheet.getCell(3,i);
					Double income_money1 = cellIncomeMoney1.getValue();
					gathermon = BigDecimal.valueOf(income_money1);
				} else if (sheet.getCell(3, i).getType() != CellType.EMPTY) {
					gathermon = new BigDecimal(sheet.getCell(3, i).getContents());
				}
				//客户id
				commonj.sdo.DataObject cust = commonj.sdo.helper.DataFactory.INSTANCE.create("com.primeton.xbb.importExcel.newdataset","MisCustinfo");
				cust.setString("custname", custname);
				DatabaseUtil.expandEntityByTemplate("default", cust, cust);
				custid = cust.getInt("custid");
				//销售id
				commonj.sdo.DataObject sale = commonj.sdo.helper.DataFactory.INSTANCE.create("org.gocom.abframe.dataset.organization","OmEmployee");
				sale.setString("empname", salename);
				DatabaseUtil.expandEntityByTemplate("default", sale, sale);
				saleid = sale.getString("userid");
				//事业部id
				commonj.sdo.DataObject syb = commonj.sdo.helper.DataFactory.INSTANCE.create("org.gocom.abframe.dataset.organization","OmOrganization");
				syb.setString("orgname", sybname);
				DatabaseUtil.expandEntityByTemplate("default", syb, syb);
				sybid = syb.getInt("orgid");
				//二级部门id
				commonj.sdo.DataObject secondorg = commonj.sdo.helper.DataFactory.INSTANCE.create("org.gocom.abframe.dataset.organization","OmOrganization");
				secondorg.setString("orgname", secondorgname);
				DatabaseUtil.expandEntityByTemplate("default", secondorg, secondorg);
				secondorgid = secondorg.getInt("orgid");
				//部门id
				commonj.sdo.DataObject org = commonj.sdo.helper.DataFactory.INSTANCE.create("org.gocom.abframe.dataset.organization","OmOrganization");
				org.setString("orgname", orgname);
				DatabaseUtil.expandEntityByTemplate("default", org, org);
				orgid = org.getInt("orgid");
				
				commonj.sdo.DataObject gather = commonj.sdo.helper.DataFactory.INSTANCE.create("com.primeton.xbb.importExcel.newdataset","ErpGather");
				gather.set("contractno", contractno);
				gather.set("custname", custname);
				gather.set("custid", custid);
				gather.set("gatherdate", gatherdate);
				gather.set("gathermon", gathermon);
				gather.set("salename", salename);
				gather.set("saleid", saleid);
				gather.set("sybname", sybname);
				gather.set("sybid", sybid);
				gather.set("secondorgname", secondorgname);
				gather.set("secondorgid", secondorgid);
				gather.set("orgname", orgname);
				gather.set("orgid", orgid);
				gather.set("gatheryear", gatheryear);
				if (gatheryear != null && orgid != 0 && gatherdate != null) {
					DatabaseExt.getPrimaryKey(gather);
					listOK.add(gather);
				} else {
					listFail.add(gather);
				}
			}
			book.close();
			DataObject[] incomeOK = new DataObject[listOK.size()];
			DatabaseUtil.insertEntityBatch("default", listOK.toArray(incomeOK));
			DataObject[] incomeFails = new DataObject[listFail.size()];
			return listFail.toArray(incomeFails);
			//			int columNum=sheet.getColumns();
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
