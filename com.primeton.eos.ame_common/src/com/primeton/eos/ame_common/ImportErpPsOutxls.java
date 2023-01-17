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
 * @author xuqq
 * @date 2016-12-29 17:54:56
 *
 */
@Bizlet("")
public class ImportErpPsOutxls {

	/**
	 * @param year
	 * @param month
	 * @param path
	 * @return
	 * @author xuqq
	 * @throws IOException 
	 * @throws BiffException 
	 */
	@Bizlet("")
	public static String importErpPsOutxls(String year, String month,
			String path) throws BiffException, IOException {
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
		int k=0;
		//以“工时ID”为开始标志位，以空为结束标志位 获取到起始位置
        for (int i=0;i<rowNum1;++i){
        	Cell cell1=sheet.getCell(1,i);
        	if(cell1.getType() != CellType.EMPTY){
        		if((cell1.getContents()).equals("唯一键，工时导出包含")){
					++j;
				}else if((cell1.getContents()).equals("工时ID")){
					++j;
				}else{
					++k;
				}
        	}else{
				++k;
			}
        }
        
        //创建导入的数组
        commonj.sdo.DataObject[] ErpPsout = new DataObject[k];
		for(int i=0;i<ErpPsout.length;i++){
			commonj.sdo.DataObject aaa = commonj.sdo.helper.DataFactory.INSTANCE.create("com.primeton.eos.ame_common.ame_common","ErpPsout");
			ErpPsout[i]  = aaa;
		}
		int m=0;
		for(int i=j;i<rowNum1;++i){
			Cell cell1=sheet.getCell(1,i);
			if(cell1.getType()==CellType.NUMBER || cell1.getType()==CellType.EMPTY){
				System.out.println("==========================================第：" + String.valueOf(i+1)+"行。");
        		//成本类型
				if(sheet.getCell(23,i).getType()==CellType.EMPTY){
					a=a+"第"+String.valueOf(i+1)+"行导入失败，成本类型必填；";
					++m;
					continue;
				}else{
					commonj.sdo.DataObject dict1 = commonj.sdo.helper.DataFactory.INSTANCE.create("org.gocom.abframe.dataset.tools","EosDictEntry");
					dict1.setString("eosDictType.dicttypeid", "AME_LABORTYPE");
					dict1.setString("dictname", sheet.getCell(23,i).getContents());
            		DatabaseUtil.expandEntityByTemplate("default", dict1, dict1);
            		ErpPsout[m].setString("pkCorp", dict1.getString("dictid"));
            		ErpPsout[m].setString("costmemo", dict1.getString("dictid"));
				}
				//变更说明
				if(sheet.getCell(0,i).getType()==CellType.EMPTY){
					ErpPsout[m].setString("changememo", null);
				}else{
					ErpPsout[m].setString("changememo", sheet.getCell(0,i).getContents());
				}
				//工时id
				if(sheet.getCell(1,i).getType()!=CellType.EMPTY){
					double laborDetailId = ((NumberCell)sheet.getCell(1,i)).getValue();
					ErpPsout[m].setDouble("laborDetailId", laborDetailId);
				}
				
				//日期
				if(sheet.getCell(2,i).getType()==CellType.EMPTY){
					ErpPsout[m].setDate("serviceDate", null);
				}else{
					DateCell serviceDate = (DateCell) sheet.getCell(2, i);
					ErpPsout[m].setDate("serviceDate", serviceDate.getDate());
				}
				
				//工号
				if(sheet.getCell(3,i).getType()==CellType.EMPTY){
					ErpPsout[m].setString("empCode", null);
				}else{
					ErpPsout[m].setString("empCode", sheet.getCell(3,i).getContents());
				}
				
				//姓名
				if(sheet.getCell(4,i).getType()==CellType.EMPTY){
					ErpPsout[m].setString("empName", null);
				}else{
					ErpPsout[m].setString("empName", sheet.getCell(4,i).getContents());
				}
				
				//级别
				if(sheet.getCell(5,i).getType()==CellType.EMPTY){
					ErpPsout[m].setString("degree", null);
				}else{
					ErpPsout[m].setString("degree", sheet.getCell(5,i).getContents());
				}
				
				//部门
				if(sheet.getCell(6,i).getType()==CellType.EMPTY){
					ErpPsout[m].setString("empOrgname", null);
				}else{
					ErpPsout[m].setString("empOrgname", sheet.getCell(6,i).getContents());
				}
				
				//客户
				if(sheet.getCell(7,i).getType()==CellType.EMPTY){
					ErpPsout[m].setString("custname", null);
				}else{
					ErpPsout[m].setString("custname", sheet.getCell(7,i).getContents());
				}
				
				//项目编号
				if(sheet.getCell(8,i).getType()==CellType.EMPTY){
					ErpPsout[m].setString("prjNum", null);
				}else{
					ErpPsout[m].setString("prjNum", sheet.getCell(8,i).getContents());
				}
				
				//项目名称
				if(sheet.getCell(9,i).getType()==CellType.EMPTY){
					ErpPsout[m].setString("prjName", null);
				}else{
					ErpPsout[m].setString("prjName", sheet.getCell(9,i).getContents());
				}
				
				//受益人
				if(sheet.getCell(10,i).getType()==CellType.EMPTY){
					ErpPsout[m].setString("buyEmpname", null);
					ErpPsout[m].setString("buyOrgname", null);
				}else{
					ErpPsout[m].setString("buyEmpname", sheet.getCell(10,i).getContents());
					ErpPsout[m].setString("buyOrgname", sheet.getCell(10,i).getContents());
				}
				
				//一级部门
				if(sheet.getCell(11,i).getType()==CellType.EMPTY){
					ErpPsout[m].setString("buyYjname", null);
				}else{
					ErpPsout[m].setString("buyYjname", sheet.getCell(11,i).getContents());
				}
				
				//二级部门
				if(sheet.getCell(12,i).getType()==CellType.EMPTY){
					ErpPsout[m].setString("buyEjname", null);
				}else{
					ErpPsout[m].setString("buyEjname", sheet.getCell(12,i).getContents());
				}
				
				//三级部门
				if(sheet.getCell(13,i).getType()==CellType.EMPTY){
					ErpPsout[m].setString("buySjname", null);
				}else{
					ErpPsout[m].setString("buySjname", sheet.getCell(13,i).getContents());
				}
				
				//项目活动
				if(sheet.getCell(14,i).getType()==CellType.EMPTY){
					ErpPsout[m].setString("taskname", null);
				}else{
					ErpPsout[m].setString("taskname", sheet.getCell(14,i).getContents());
				}
				
				//单价
				if(sheet.getCell(15,i).getType()==CellType.EMPTY){
					ErpPsout[m].setDouble("unitPrice", 0);
				}else{
					if(sheet.getCell(15,i).getType()==CellType.NUMBER){
						double unitPrice = ((NumberCell)sheet.getCell(15,i)).getValue();
						ErpPsout[m].setDouble("unitPrice", unitPrice);
					}else{
						a=a+"第"+String.valueOf(i+1)+"行导入失败，单价必须为数字；";
						continue;
					}
				}
				
				//工时
				if(sheet.getCell(16,i).getType()==CellType.EMPTY){
					ErpPsout[m].setDouble("workingHours", 0);
				}else{
					if(sheet.getCell(16,i).getType()==CellType.NUMBER){
						double workingHours = ((NumberCell)sheet.getCell(16,i)).getValue();
						ErpPsout[m].setDouble("workingHours", workingHours);
					}else{
						a=a+"第"+String.valueOf(i+1)+"行导入失败，工时必须为数字；";
						continue;
					}
				}
				
				//其中加班工时
				if(sheet.getCell(17,i).getType()==CellType.EMPTY){
					ErpPsout[m].setDouble("otwHours", 0);
				}else{
					if(sheet.getCell(17,i).getType()==CellType.NUMBER){
						double otwHours = ((NumberCell)sheet.getCell(17,i)).getValue();
						ErpPsout[m].setDouble("otwHours", otwHours);
					}else{
						a=a+"第"+String.valueOf(i+1)+"行导入失败，其中加班工时必须为数字；";
						continue;
					}
				}
				
				//初始成本
				if(sheet.getCell(18,i).getType()==CellType.EMPTY){
					ErpPsout[m].setDouble("oldcosts", 0);
				}else{
					if(sheet.getCell(18,i).getType()==CellType.NUMBER){
						double oldcosts = ((NumberCell)sheet.getCell(18,i)).getValue();
						ErpPsout[m].setDouble("oldcosts", oldcosts);
					}else{
						a=a+"第"+String.valueOf(i+1)+"行导入失败，初始成本必须为数字；";
						continue;
					}
				}
				
				//结算成本
				Cell abc=sheet.getCell(19,i);
				if(sheet.getCell(19,i).getType()==CellType.EMPTY){
					ErpPsout[m].setDouble("costs", 0);
				}else{
					if(sheet.getCell(19,i).getType()==CellType.NUMBER){
						double costs = ((NumberCell)sheet.getCell(19,i)).getValue();
						ErpPsout[m].setDouble("costs", costs);
					}else{
						a=a+"第"+String.valueOf(i+1)+"行导入失败，结算成本必须为数字；";
						continue;
					}
				}
				
				//工作内容
				if(sheet.getCell(20,i).getType()==CellType.EMPTY){
					ErpPsout[m].setString("content", null);
				}else{
					ErpPsout[m].setString("content", sheet.getCell(20,i).getContents());
				}
				
				//项目所属部门
				if(sheet.getCell(21,i).getType()==CellType.EMPTY){
					ErpPsout[m].setString("buyParentorgname", null);
				}else{
					ErpPsout[m].setString("buyParentorgname", sheet.getCell(21,i).getContents());
				}
				
				//商务合同编号
				if(sheet.getCell(22,i).getType()==CellType.EMPTY){
					ErpPsout[m].setString("contnum", null);
				}else{
					ErpPsout[m].setString("contnum", sheet.getCell(22,i).getContents());
				}
				
				//年月
				ErpPsout[m].setString("year",year);
				if(month.indexOf("0")!=-1 && !month.equals("10")){
					month = month.substring(1,2);
				}
				ErpPsout[m].setString("month",month);
				ErpPsout[m].setString("checkStatus","1");
				//创建主键后导入
    			DatabaseExt.getPrimaryKey(ErpPsout[m]);
    			DatabaseUtil.insertEntity("default", ErpPsout[m]);
        		
        		m++;
			}else{
				a=a+"第"+String.valueOf(i+1)+"行导入失败，工时id需为数字，或者置空；";
				++m;
				continue;
			}
		}
		DatabaseExt.executeNamedSql("default","com.primeton.eos.common.empNumDeal.updateErpPsOut", null);
		return a;
	}

}
