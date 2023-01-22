/**
 * 
 */
package com.primeton.eos.ame_common;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import java_cup.internal_error;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Comment;
import org.apache.poi.ss.usermodel.DateUtil;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.tools.ant.filters.TokenFilter.Trim;

import com.eos.foundation.data.DataContextUtil;
import com.eos.foundation.database.DatabaseExt;
import com.eos.foundation.database.DatabaseUtil;
import com.eos.foundation.eoscommon.BusinessDictUtil;
import com.eos.system.annotation.Bizlet;

import commonj.sdo.DataObject;

/**
 * @author EPCNB324
 * @date 2016-12-22 17:04:57
 *
 */
@Bizlet("")
public class ImportErpStaticCost {

	/**
	 * @param year
	 * @param month
	 * @param org
	 * @param path
	 * @return
	 * @author EPCNB324
	 */
	@Bizlet("")
	public static String importErpStaticCost(String year, String month,String org, String path) throws IOException {
		// TODO 自动生成的方法存根
		
		String a = "";//返回值
		
		//获取excel文件，支持只有一页的excel文件
		Workbook workbook = null;
        InputStream is = null;
        is = new FileInputStream(path);
        workbook = new XSSFWorkbook(is);
        Sheet sheet = workbook.getSheetAt(0);
        
        //读取数据
        int rowNum1 = sheet.getLastRowNum();
        
        int j=0;
        int n=0;
		int k=0;
		//以“科目名称”为开始标志位，以“合计”为结束标志位 获取到起始位置
		for(int i = 0; i <= rowNum1; i++){
			org.apache.poi.ss.usermodel.Cell cell1=sheet.getRow(i).getCell(3);
			org.apache.poi.ss.usermodel.Cell cell5=sheet.getRow(i).getCell(8);
			if(cell1!=null){
				if(cell1.getCellType()==cell1.CELL_TYPE_STRING){
					if((cell1.getStringCellValue()).equals("科目名称")){
						++j;
					}
					if((cell1.getStringCellValue()).equals("合计")){
						k=i-1;
						break;
					}
				}
			}
			if(cell5.getCellType()==cell5.CELL_TYPE_BLANK&&j>0){
				++n;
			}
		}
		
		//创建导入的数组
		commonj.sdo.DataObject[] StaticCost = new DataObject[k-j-n+1];
		for(int i=0;i<StaticCost.length;i++){
			commonj.sdo.DataObject aaa = commonj.sdo.helper.DataFactory.INSTANCE.create("com.primeton.eos.ame_common.ame_common","AmeErpstaticcost");
			StaticCost[i]  = aaa;
		}
		int m=0;
        for(int i=j;i<=k;i++){
        	org.apache.poi.ss.usermodel.Cell cell1=sheet.getRow(i).getCell(3);
        	if(cell1 != null){
        		if(cell1.getCellType()==cell1.CELL_TYPE_STRING){
        			System.out.println("==========================================第：" + String.valueOf(i+1)+"行。");
            		//查找科目名称的业务字典
            		commonj.sdo.DataObject subject = commonj.sdo.helper.DataFactory.INSTANCE.create("org.gocom.abframe.dataset.tools","EosDictEntry");
            		subject.setString("eosDictType.dicttypeid", "AME_SUBJECT");
            		subject.setString("dictname", cell1.getStringCellValue());
            		int num = DatabaseUtil.expandEntityByTemplate("default", subject, subject);
            		if(num != 0){
            			commonj.sdo.DataObject bbb = commonj.sdo.helper.DataFactory.INSTANCE.create("com.primeton.eos.ame_common.ame_common","AmeErpstaticcost");
            			StaticCost[m].setString("org",org);
            			bbb.setString("org",org);
            			StaticCost[m].setString("year",year);
            			bbb.setString("year",year);
            			StaticCost[m].setString("month",month);
            			bbb.setString("month",month);
            			String x = subject.getString("dictid");
            			StaticCost[m].setString("subject",x);
            			bbb.setString("subject",x);
            			double f= sheet.getRow(i).getCell(8).getNumericCellValue();
            			int num1=DatabaseUtil.expandEntityByTemplate("default", bbb, bbb);
            			if( num1 == 0){
            				StaticCost[m].setDouble("staticcost", f);
            				DatabaseExt.getPrimaryKey(StaticCost[m]);
            				DatabaseUtil.saveEntity("default", StaticCost[m]);
            			}else{
            				StaticCost[m].setDouble("staticcost", f);
            				StaticCost[m].setBigDecimal("erpstaticcostid", bbb.getBigDecimal("erpstaticcostid"));
            				DatabaseUtil.updateEntity("default", StaticCost[m]);
            			}
            			
            			m++;
            		}
            		else{
            			a=a+"第"+String.valueOf(i+1)+"行导入失败，请检查科目名称是否正确；";
            		}
            	}
        	}
        }
		return a;
	}

}
