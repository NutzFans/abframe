/**
 * 
 */
package com.primeton.eos.ame_common;

import java.io.File;
import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import jxl.Cell;
import jxl.CellType;
import jxl.DateCell;
import jxl.NumberCell;
import jxl.Sheet;
import jxl.Workbook;
import jxl.read.biff.BiffException;

import com.eos.foundation.data.DataContextUtil;
import com.eos.foundation.database.DatabaseExt;
import com.eos.foundation.database.DatabaseUtil;
import com.eos.foundation.eoscommon.BusinessDictUtil;
import com.eos.system.annotation.Bizlet;

import commonj.sdo.DataObject;

/**
 * @author EPCNB324
 * @date 2016-12-22 17:24:49
 *
 */
@Bizlet("")
public class ImportErpStaticCostxls {

	/**
	 * @param year
	 * @param month
	 * @param org
	 * @param path
	 * @return
	 * @author EPCNB324
	 * @throws IOException 
	 * @throws BiffException 
	 */
	@Bizlet("")
	public static String importErpStaticCostxls(String year, String month,String org, String path) throws BiffException, IOException {
		// TODO 自动生成的方法存根
		String a = "";//返回值
		
		//获取excel文件，支持只有一页的excel文件
		//Workbook workbook = null;
        //InputStream is = new FileInputStream(path);
		File file = new  File(path);
		Workbook workbook = Workbook.getWorkbook(file);
        Sheet sheet = workbook.getSheet(0);
        
        //读取数据
        int rowNum1 = sheet.getRows();
        
        int j=0;
        int n=0;
		int k=0;
		//以“科目名称”为开始标志位，以“合计”为结束标志位 获取到起始位置
		for(int i = 0; i <= rowNum1; i++){
			Cell cell1=sheet.getCell(3,i);
			Cell cell5=sheet.getCell(8,i);
			if(cell1.getType()!=CellType.EMPTY){
				if((cell1.getContents()).equals("科目名称")){
					++j;
				}
				if((cell1.getContents()).equals("合计")){
					k=i-1;
					break;
				}
			}
			if(cell5.getType()==CellType.EMPTY&&j>0){
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
		String ame= "AME_SUBJECT";
        for(int i=j;i<=k;i++){
        	Cell cell1=sheet.getCell(3, i);
        	if(cell1.getType() != CellType.EMPTY){
        		System.out.println("==========================================第：" + String.valueOf(i+1)+"行。");
            	//查找科目名称的业务字典
        		commonj.sdo.DataObject dict = commonj.sdo.helper.DataFactory.INSTANCE.create("org.gocom.abframe.dataset.tools","EosDictEntry");
    			dict.setString("eosDictType.dicttypeid",ame);
        		dict.setString("dictname", cell1.getContents());
        		int num = DatabaseUtil.expandEntityByTemplate("default", dict, dict);
        		if(num != 0){
        			commonj.sdo.DataObject bbb = commonj.sdo.helper.DataFactory.INSTANCE.create("com.primeton.eos.ame_common.ame_common","AmeErpstaticcost");
        			StaticCost[m].setString("org",org);
        			bbb.setString("org",org);
        			StaticCost[m].setString("year",year);
        			bbb.setString("year",year);
        			StaticCost[m].setString("month",month);
        			bbb.setString("month",month);
        			String x = dict.getString("dictid");
        			StaticCost[m].setString("subject",x);
        			bbb.setString("subject",x);
        			double f= ((NumberCell)sheet.getCell(8, i)).getValue();
        			int num1=DatabaseUtil.expandEntityByTemplate("default", bbb, bbb);
        			if(num1 == 0){
        				StaticCost[m].setDouble("staticcost", f);
        				DatabaseExt.getPrimaryKey(StaticCost[m]);
        				DatabaseUtil.saveEntity("default", StaticCost[m]);
        			}else{
        				StaticCost[m].setDouble("staticcost", f);
        				StaticCost[m].setBigDecimal("erpstaticcostid", bbb.getBigDecimal("erpstaticcostid"));
        				DatabaseUtil.updateEntity("default", StaticCost[m]);
        			}
        			m++;
        		DataContextUtil.deleteObject("dict");
        		}
        		else{
        			a=a+"第"+String.valueOf(i+1)+"行数据导入失败，请检查科目名称是否正确；";
        		}
        	}
        }
		return a;
	}

}
