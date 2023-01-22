/**
 * 
 */
package com.primeton.eos.ame_common;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;

import jxl.CellType;

import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.eos.foundation.database.DatabaseExt;
import com.eos.foundation.database.DatabaseUtil;
import com.eos.system.annotation.Bizlet;

import commonj.sdo.DataObject;

/**
 * @author xuqq
 * @date 2016-12-29 17:52:36
 *
 */
@Bizlet("")
public class ImportErpPsOut {

	/**
	 * @param year
	 * @param month
	 * @param path
	 * @return
	 * @throws IOException 
	 */
	@Bizlet("")
	public static String importErpPsOut(String year, String month, String path) throws IOException {
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
		int k=0;
		//以“工时ID”为开始标志位，以空为结束标志位 获取到起始位置
        for (int i=0;i<=rowNum1;++i){
        	org.apache.poi.ss.usermodel.Cell cell1=sheet.getRow(i).getCell(1);
        	if(cell1 != null){
        		if(cell1.getCellType()==cell1.CELL_TYPE_STRING){
        			if((cell1.getStringCellValue()).equals("唯一键，工时导出包含")){
        				++j;
        			}else if((cell1.getStringCellValue()).equals("工时ID")){
        				++j;
        			}else{
        				++k;
        			}
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
		for(int i=j;i<=rowNum1;++i){
			org.apache.poi.ss.usermodel.Cell cell1=sheet.getRow(i).getCell(1);
			if(cell1.getCellType() == cell1.CELL_TYPE_NUMERIC || cell1==null){
				System.out.println("==========================================第：" + String.valueOf(i+1)+"行。");
        		//成本类型
				if(sheet.getRow(i).getCell(23)==null){
					a=a+"第"+String.valueOf(i+1)+"行导入失败，成本类型必填；";
					++m;
					continue;
				}else{
					commonj.sdo.DataObject dict1 = commonj.sdo.helper.DataFactory.INSTANCE.create("org.gocom.abframe.dataset.tools","EosDictEntry");
					dict1.setString("eosDictType.dicttypeid", "AME_LABORTYPE");
					dict1.setString("dictname", sheet.getRow(i).getCell(23).getStringCellValue());
            		DatabaseUtil.expandEntityByTemplate("default", dict1, dict1);
            		ErpPsout[m].setString("pkCorp", dict1.getString("dictid"));
            		ErpPsout[m].setString("costmemo", dict1.getString("dictid"));
				}
				//变更说明
				if(sheet.getRow(i).getCell(0)==null){
					ErpPsout[m].setString("changememo", null);
				}else{
					ErpPsout[m].setString("changememo", sheet.getRow(i).getCell(0).getStringCellValue());
				}
				//工时id
				double laborDetailId = sheet.getRow(i).getCell(1).getNumericCellValue();
				ErpPsout[m].setDouble("laborDetailId", laborDetailId);
				
				//日期
				if(sheet.getRow(i).getCell(2)==null){
					ErpPsout[m].setDate("serviceDate", null);
				}else{
					ErpPsout[m].setDate("serviceDate", sheet.getRow(i).getCell(2).getDateCellValue());
				}
				
				//工号
				if(sheet.getRow(i).getCell(3)==null){
					ErpPsout[m].setString("empCode", null);
				}else{
					ErpPsout[m].setString("empCode", sheet.getRow(i).getCell(3).getStringCellValue());
				}
				
				//姓名
				if(sheet.getRow(i).getCell(4)==null){
					ErpPsout[m].setString("empName", null);
				}else{
					ErpPsout[m].setString("empName", sheet.getRow(i).getCell(4).getStringCellValue());
				}
				
				//级别
				if(sheet.getRow(i).getCell(5)==null){
					ErpPsout[m].setString("degree", null);
				}else{
					ErpPsout[m].setString("degree", sheet.getRow(i).getCell(5).getStringCellValue());
				}
				
				//部门
				if(sheet.getRow(i).getCell(6)==null){
					ErpPsout[m].setString("empOrgname", null);
				}else{
					ErpPsout[m].setString("empOrgname", sheet.getRow(i).getCell(6).getStringCellValue());
				}
				
				//客户
				if(sheet.getRow(i).getCell(7)==null){
					ErpPsout[m].setString("custname", null);
				}else{
					ErpPsout[m].setString("custname", sheet.getRow(i).getCell(7).getStringCellValue());
				}
				
				//项目编号
				if(sheet.getRow(i).getCell(8)==null){
					ErpPsout[m].setString("prjNum", null);
				}else{
					ErpPsout[m].setString("prjNum", sheet.getRow(i).getCell(8).getStringCellValue());
				}
				
				//项目名称
				if(sheet.getRow(i).getCell(9)==null){
					ErpPsout[m].setString("prjName", null);
				}else{
					ErpPsout[m].setString("prjName", sheet.getRow(i).getCell(9).getStringCellValue());
				}
				
				//受益人
				if(sheet.getRow(i).getCell(10)==null){
					ErpPsout[m].setString("buyEmpname", null);
					ErpPsout[m].setString("buyOrgname", null);
				}else{
					ErpPsout[m].setString("buyEmpname", sheet.getRow(i).getCell(10).getStringCellValue());
					ErpPsout[m].setString("buyOrgname", sheet.getRow(i).getCell(10).getStringCellValue());
				}
				
				//一级部门
				if(sheet.getRow(i).getCell(11)==null){
					ErpPsout[m].setString("buyYjname", null);
				}else{
					ErpPsout[m].setString("buyYjname", sheet.getRow(i).getCell(11).getStringCellValue());
				}
				
				//二级部门
				if(sheet.getRow(i).getCell(12)==null){
					ErpPsout[m].setString("buyEjname", null);
				}else{
					ErpPsout[m].setString("buyEjname", sheet.getRow(i).getCell(12).getStringCellValue());
				}
				
				//三级部门
				if(sheet.getRow(i).getCell(13)==null){
					ErpPsout[m].setString("buySjname", null);
				}else{
					ErpPsout[m].setString("buySjname", sheet.getRow(i).getCell(13).getStringCellValue());
				}
				
				//项目活动
				if(sheet.getRow(i).getCell(14)==null){
					ErpPsout[m].setString("taskname", null);
				}else{
					ErpPsout[m].setString("taskname", sheet.getRow(i).getCell(14).getStringCellValue());
				}
				
				//单价
				if(sheet.getRow(i).getCell(15)==null){
					ErpPsout[m].setDouble("unitPrice", 0);
				}else{
					if(sheet.getRow(i).getCell(15).getCellType()==sheet.getRow(i).getCell(15).CELL_TYPE_NUMERIC){
						double unitPrice = sheet.getRow(i).getCell(15).getNumericCellValue();
						ErpPsout[m].setDouble("unitPrice", unitPrice);
					}else{
						a=a+"第"+String.valueOf(i+1)+"行导入失败，单价必须为数字；";
						continue;
					}
				}
				
				//工时
				if(sheet.getRow(i).getCell(16)==null){
					ErpPsout[m].setDouble("workingHours", 0);
				}else{
					if(sheet.getRow(i).getCell(16).getCellType()==sheet.getRow(i).getCell(16).CELL_TYPE_NUMERIC){
						double workingHours = sheet.getRow(i).getCell(16).getNumericCellValue();
						ErpPsout[m].setDouble("workingHours", workingHours);
					}else{
						a=a+"第"+String.valueOf(i+1)+"行导入失败，工时必须为数字；";
						continue;
					}
				}
				
				//其中加班工时
				if(sheet.getRow(i).getCell(17)==null){
					ErpPsout[m].setDouble("otwHours", 0);
				}else{
					if(sheet.getRow(i).getCell(17).getCellType()==sheet.getRow(i).getCell(17).CELL_TYPE_NUMERIC){
						double otwHours =sheet.getRow(i).getCell(17).getNumericCellValue();
						ErpPsout[m].setDouble("otwHours", otwHours);
					}else{
						a=a+"第"+String.valueOf(i+1)+"行导入失败，其中加班工时必须为数字；";
						continue;
					}
				}
				
				//初始成本
				if(sheet.getRow(i).getCell(18)==null){
					ErpPsout[m].setDouble("oldcosts", 0);
				}else{
					if(sheet.getRow(i).getCell(18).getCellType()==sheet.getRow(i).getCell(18).CELL_TYPE_NUMERIC){
						double oldcosts = sheet.getRow(i).getCell(18).getNumericCellValue();
						ErpPsout[m].setDouble("oldcosts", oldcosts);
					}else{
						a=a+"第"+String.valueOf(i+1)+"行导入失败，初始成本必须为数字；";
						continue;
					}
				}
				
				//结算成本
				if(sheet.getRow(i).getCell(19)==null){
					ErpPsout[m].setDouble("costs", 0);
				}else{
					if(sheet.getRow(i).getCell(19).getCellType()==sheet.getRow(i).getCell(19).CELL_TYPE_NUMERIC){
						double costs = sheet.getRow(i).getCell(19).getNumericCellValue();
						ErpPsout[m].setDouble("costs", costs);
					}else{
						a=a+"第"+String.valueOf(i+1)+"行导入失败，结算成本必须为数字；";
						continue;
					}
				}
				
				//工作内容
				if(sheet.getRow(i).getCell(20)==null){
					ErpPsout[m].setString("content", null);
				}else{
					ErpPsout[m].setString("content", sheet.getRow(i).getCell(20).getStringCellValue());
				}
				
				//项目所属部门
				if(sheet.getRow(i).getCell(21)==null){
					ErpPsout[m].setString("buyParentorgname", null);
				}else{
					ErpPsout[m].setString("buyParentorgname", sheet.getRow(i).getCell(21).getStringCellValue());
				}
				
				//商务合同编号
				if(sheet.getRow(i).getCell(22)==null){
					ErpPsout[m].setString("contnum", null);
				}else{
					ErpPsout[m].setString("contnum", sheet.getRow(i).getCell(22).getStringCellValue());
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
