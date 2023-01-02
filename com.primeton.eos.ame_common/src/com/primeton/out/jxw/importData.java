/**
 * 
 */
package com.primeton.out.jxw;

import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;

import jxl.CellType;
import jxl.NumberCell;
import jxl.Sheet;
import jxl.Workbook;

import com.eos.system.annotation.Bizlet;

import commonj.sdo.DataObject;

/**
 * @author zhuhx
 * @date 2016-07-27 14:27:04
 *
 */
public class importData {

	/**
	 * @param filePath
	 * @return
	 * @author huangqj
	 * @throws IOException 
	 */
	@Bizlet("importData")

	public static DataObject[] importData2016(String filePath) throws IOException {
		ArrayList<commonj.sdo.DataObject> listOK = new ArrayList<DataObject>();
		try {
			Workbook book = Workbook.getWorkbook(new File(filePath));
	        Sheet sheet2 = book.getSheet(0);
			int rowNum = sheet2.getRows();
			//以“序号”为开始标志位，以“合计”为结束标志位 获取到起始位置
			String ORG_NO = "";
			String NAME = "";
			String USER_DEFINE2 = "";
			String BUSICODE = "";
			String REGIST_ADDRESS = "";
			String OTHER_ADDRESS1 = "";
			double c0  =0;
			double c03  =0;
			
			for(int i = 1; i < rowNum; i++){
				System.out.println(i);
				commonj.sdo.DataObject data = commonj.sdo.helper.DataFactory.INSTANCE.create("commonj.sdo","DataObject");
				NAME = sheet2.getCell(0,i).getContents().replaceAll("'", "");
				ORG_NO = sheet2.getCell(1,i).getContents().replaceAll("'", "");
				USER_DEFINE2 = sheet2.getCell(2,i).getContents().replaceAll("'", "");
				BUSICODE = sheet2.getCell(3,i).getContents().replaceAll("'", "");
				REGIST_ADDRESS = sheet2.getCell(4,i).getContents().replaceAll("'", "");
				OTHER_ADDRESS1 = sheet2.getCell(5,i).getContents().replaceAll("'", "");
				c0  =((NumberCell) sheet2.getCell(6 ,i)).getValue();
				c03  =((NumberCell) sheet2.getCell(8 ,i)).getValue();
				data.set("NAME", NAME);
				data.set("ORG_NO", ORG_NO);
				data.set("USER_DEFINE2", USER_DEFINE2);
				data.set("BUSICODE", BUSICODE);
				data.set("REGIST_ADDRESS", REGIST_ADDRESS);
				data.set("OTHER_ADDRESS1", OTHER_ADDRESS1);
				data.set("QUXIAN","13");
				data.set("c0",c0);
				data.set("c03",c03);
				if(!ORG_NO.equals("")){
					listOK.add(data);
				}
			}
			DataObject[] listData = new DataObject[listOK.size()];
			return listOK.toArray(listData);
		}catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	@Bizlet("importData")

	public static DataObject[] importData2017(String filePath) throws IOException {
		ArrayList<commonj.sdo.DataObject> listOK = new ArrayList<DataObject>();
		try {
			Workbook book = Workbook.getWorkbook(new File(filePath));
	        Sheet sheet2 = book.getSheet(0);
			int rowNum = sheet2.getRows();
			//以“序号”为开始标志位，以“合计”为结束标志位 获取到起始位置
			String USER_DEFINE2 = "";
			String ORG_NO = "";
			String QUXIAN = "09";
			String NAME = "";
			String BUSICODE = "";
			double C0_16 = 0;
			double C0_17 = 0;
			
			for(int i = 1; i < rowNum; i++){
				String IS16 = "1";
				String IS17 = "1";
				commonj.sdo.DataObject data = commonj.sdo.helper.DataFactory.INSTANCE.create("commonj.sdo","DataObject");
				USER_DEFINE2 = sheet2.getCell(0,i).getContents().replaceAll("'", "");
				if(USER_DEFINE2.length() == 18){
					ORG_NO = USER_DEFINE2.substring(8, 17);
				}else if(USER_DEFINE2.length() == 15){
					ORG_NO = USER_DEFINE2.substring(6);
				}else{
					ORG_NO = "";
				}
				NAME = sheet2.getCell(1,i).getContents().replaceAll("'", "");
				BUSICODE = sheet2.getCell(2,i).getContents().replaceAll("'", "");
				if(BUSICODE.length() == 6){
					BUSICODE = BUSICODE.substring(2);
				}
				C0_16 = ((NumberCell) sheet2.getCell(13,i)).getValue();
				C0_17 = ((NumberCell) sheet2.getCell(14,i)).getValue();
				data.set("USER_DEFINE2", USER_DEFINE2);
				data.set("NAME", NAME);
				data.set("ORG_NO", ORG_NO);
				data.set("QUXIAN", QUXIAN);
				data.set("BUSICODE", BUSICODE);
				data.set("C0_16", C0_16);
				data.set("C0_17", C0_17);
				if(C0_16 == 0){
					IS16 = "0";
				}
				if(C0_17 == 0){
					IS17 = "0";
				}
				data.set("IS16", IS16);
				data.set("IS17", IS17);
				if(!ORG_NO.equals("")){
					listOK.add(data);
				}
			}
			DataObject[] listData = new DataObject[listOK.size()];
			return listOK.toArray(listData);
		}catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}