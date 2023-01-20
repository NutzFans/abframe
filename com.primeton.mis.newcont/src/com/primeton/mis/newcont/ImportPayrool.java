/**
 * 
 */
package com.primeton.mis.newcont;

import java.io.FileInputStream;
import java.io.InputStream;




import java.math.BigDecimal;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.eos.foundation.common.utils.DateUtil;
import com.eos.foundation.database.DatabaseExt;
import com.eos.foundation.database.DatabaseUtil;
import com.eos.system.annotation.Bizlet;
import com.raq.expression.function.New;

import commonj.sdo.DataObject;

/**
 * @author mengyy
 * @date 2018-04-11 11:00:07
 *
 */
public class ImportPayrool {

	/**
	 * @param args
	 * @author mengyy
	 */
	@SuppressWarnings("resource")
	@Bizlet("importPayrool")
	public static int importPayrool(String filePath,String userId) throws Exception {
		Workbook workbook = null;
        InputStream is = new FileInputStream(filePath);
        workbook = new XSSFWorkbook(is);
        Sheet sheet = workbook.getSheetAt(0);
        int total=0;
        if(sheet != null ){
        	int rowNum = sheet.getLastRowNum();
        	String year = sheet.getRow(1).getCell(3).getStringCellValue();
        	String month = sheet.getRow(1).getCell(4).getStringCellValue();
        	year = year.substring(0, 4);
        	if(month.length()==2){
        		month=month.substring(0,1);
        	}else{
        		month=month.substring(0,2);
        	}
        	if(rowNum>3){
        		commonj.sdo.DataObject feetype = commonj.sdo.helper.DataFactory.INSTANCE.create("com.primeton.eos.ame_fee.expRei","ExpFeetype");
        		feetype.setString("exptype", "S");
        		feetype.setString("isleaf", "1");
        		commonj.sdo.DataObject[] feetypes = DatabaseUtil.queryEntitiesByTemplate("default",feetype);
	        	commonj.sdo.DataObject[] amepayrools = new DataObject[(rowNum-3)*(feetypes.length)];
				for(int i=0;i<amepayrools.length;i++){
					commonj.sdo.DataObject aaa = commonj.sdo.helper.DataFactory.INSTANCE.create("com.primeton.mis.newcont.newCont","AmePayroll");
					amepayrools[i]  = aaa;
				}
				int m=0;
	        	for(int i=3;i<rowNum;i++){
	        		for(int j=0;j<feetypes.length;j++){
	        			if(sheet.getRow(i).getCell(4+j).getNumericCellValue() != 0){//为空的数据不导入
							commonj.sdo.DataObject dict = commonj.sdo.helper.DataFactory.INSTANCE.create("org.gocom.abframe.dataset.tools","EosDictEntry");
							commonj.sdo.DataObject dict1 = commonj.sdo.helper.DataFactory.INSTANCE.create("org.gocom.abframe.dataset.tools","EosDictEntry");
							commonj.sdo.DataObject dict2 = commonj.sdo.helper.DataFactory.INSTANCE.create("org.gocom.abframe.dataset.tools","EosDictEntry");
							amepayrools[m].setString("year", year);
							amepayrools[m].setString("month", month);
							amepayrools[m].setString("operatorid", userId);
							amepayrools[m].setString("status", "0");
							amepayrools[m].setDate("createdate", DateUtil.getJVMDate());
							org.apache.poi.ss.usermodel.Cell cell=sheet.getRow(i).getCell((short)0);
							String company=null;
							if(cell!=null){
								company=(String) sheet.getRow(i).getCell(0).getStringCellValue();
								dict.setString("eosDictType/dicttypeid", "company");
								dict.setString("dictname", company);
								DatabaseUtil.expandEntityByTemplate("default", dict, dict);
								amepayrools[m].setString("company",dict.getString("dictid"));
							}
							org.apache.poi.ss.usermodel.Cell cell1=sheet.getRow(i).getCell((short)1);
							String costtype=null;
							if(cell1!=null){
								costtype=(String) sheet.getRow(i).getCell(1).getStringCellValue();
								dict1.setString("eosDictType/dicttypeid", "AME_U8_SUBJECT");
								dict1.setString("dictname", costtype);
								DatabaseUtil.expandEntityByTemplate("default", dict1, dict1);
								amepayrools[m].setString("costtype",dict1.getString("dictid"));
							}
							org.apache.poi.ss.usermodel.Cell cell2=sheet.getRow(i).getCell((short)2);
							String issenior=null;
							if(cell2!=null){
								issenior=(String) sheet.getRow(i).getCell(2).getStringCellValue();
								dict2.setString("eosDictType/dicttypeid", "MIS_YN");
								dict2.setString("dictname", issenior);
								DatabaseUtil.expandEntityByTemplate("default", dict2, dict2);
								amepayrools[m].setString("issenior",dict2.getString("dictid"));
							}
							amepayrools[m].setString("orgname",(String) sheet.getRow(i).getCell(3).getStringCellValue());
							
							commonj.sdo.DataObject feetype1 = commonj.sdo.helper.DataFactory.INSTANCE.create("com.primeton.eos.ame_fee.expRei","ExpFeetype");
			        		feetype1.setString("exptype", "S");
			        		feetype1.setString("feetypename", sheet.getRow(2).getCell(4+j).getStringCellValue().trim());
			        		feetype1.setString("isleaf", "1");
			        		DatabaseUtil.expandEntityByTemplate("default", feetype1, feetype1);
							amepayrools[m].setDouble("basicpay",sheet.getRow(i).getCell(4+j).getNumericCellValue());
							amepayrools[m].setString("expFeetype/feetypecode",feetype1.getString("feetypecode"));
						
							DatabaseExt.getPrimaryKey(amepayrools[m]);
							m++;
						}
						System.out.println(sheet.getRow(2).getCell(4+j).getStringCellValue().trim());
				
	        		}
	        	}
	        	DatabaseUtil.insertEntityBatch("default", Arrays.copyOfRange(amepayrools, 0, m));
	        	total=m+1;
        	}
        }
        return total;
	}

}
