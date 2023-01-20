/**
 * 
 */
package com.primeton.eos.ame_pur;

import java.io.File;
import java.io.IOException;


import jxl.CellType;
import jxl.NumberCell;
import jxl.Sheet;
import jxl.Workbook;
import jxl.read.biff.BiffException;

import com.eos.system.annotation.Bizlet;

import commonj.sdo.DataObject;

/**
 * @author yaoyi
 * @date 2017-06-01 18:02:15
 *
 */
@Bizlet("")
public class outCount {

	/**
	 * 
	 * @param filePath
	 * @return
	 * @throws IOException
	 * @throws BiffException
	 */
	@Bizlet("importOutCount")
	public static DataObject [] importOutCount(String filePath) throws IOException, BiffException {
		Workbook book  =  Workbook.getWorkbook( new  File(filePath));
		Sheet sheet = book.getSheet(0);
		int rowNum = sheet.getRows();
		commonj.sdo.DataObject[] outCount = new DataObject[4];
		for(int i=0;i<4;i++){
			commonj.sdo.DataObject aaa = commonj.sdo.helper.DataFactory.INSTANCE.create("com.primeton.eos.ame_pur.ame","PurOutCount");
			outCount[i]  = aaa;
		}
		for(int i = 0; i < rowNum; i++){
			String str=sheet.getCell(0, i).getContents().replace(" ", "");
				if(str.equals("ID")){
					for(int m = 0;m<4;m++){
						if(sheet.getCell(m+4, i).getType() != CellType.EMPTY){
							NumberCell pcontamt = (NumberCell) sheet.getCell(m+4, i);
							outCount[m].setDouble("attendanceid",(double)pcontamt.getValue());
						}
					}
				}
				if(str.equals("项目编号")){
					for(int m = 0;m<4;m++){
						if(sheet.getCell(m+4, i).getType() != CellType.EMPTY){
							NumberCell mcontamt = (NumberCell) sheet.getCell(m+4, i);
							outCount[m].setDouble("projectno", (double)mcontamt.getValue());
						}
					}
				}
				if(str.equals("供应商ID")){
					for(int m = 0;m<4;m++){
						if(sheet.getCell(m+4, i).getType() != CellType.EMPTY){
							NumberCell scontamt = (NumberCell) sheet.getCell(m+4, i);
							outCount[m].setDouble("custid", (double)scontamt.getValue());
						}
					}
				}
				if(str.equals("人员编号")){
					for(int m = 0;m<4;m++){
						if(sheet.getCell(m+4, i).getType() != CellType.EMPTY){
							NumberCell receamt = (NumberCell) sheet.getCell(m+4, i);
							outCount[m].setDouble("outperno", (double)receamt.getValue());
						}
					}
				}
				if(str.equals("考勤年份")){
					for(int m = 0;m<4;m++){
						if(sheet.getCell(m+4, i).getType() != CellType.EMPTY){
							NumberCell ptaxincome = (NumberCell) sheet.getCell(m+4, i);
							outCount[m].setDouble("year", (double)ptaxincome.getValue());
						}
					}
				}
				if(str.equals("考勤月份")){
					for(int m = 0;m<4;m++){
						if(sheet.getCell(m+4, i).getType() != CellType.EMPTY){
							NumberCell mtaxincome = (NumberCell) sheet.getCell(m+4, i);
							outCount[m].setDouble("month", (double)mtaxincome.getValue());
						}
					}
				}
				if(str.equals("月标准天数")){
					for(int m = 0;m<4;m++){
						if(sheet.getCell(m+4, i).getType() != CellType.EMPTY){
							NumberCell staxincome = (NumberCell) sheet.getCell(m+4, i);
							outCount[m].setDouble("standarddays", (double)staxincome.getValue());
						}
					}
				}
				if(str.equals("出勤天数")){
					for(int m = 0;m<4;m++){
						if(sheet.getCell(m+4, i).getType() != CellType.EMPTY){
							NumberCell psubfee = (NumberCell) sheet.getCell(m+4, i);
							outCount[m].setDouble("attendancedays", (double)psubfee.getValue());
						}
					}
				}
				if(str.equals("补充天数")){
					for(int m = 0;m<4;m++){
						if(sheet.getCell(m+4, i).getType() != CellType.EMPTY){
							NumberCell msubfee = (NumberCell) sheet.getCell(m+4, i);
							outCount[m].setDouble("adddays", (double)msubfee.getValue());
						}
					}
				}
				if(str.equals("当月总出勤天数")){
					for(int m = 0;m<4;m++){
						if(sheet.getCell(m+4, i).getType() != CellType.EMPTY){
							NumberCell ssubfee = (NumberCell) sheet.getCell(m+4, i);
							outCount[m].setDouble("totaldays", (double)ssubfee.getValue());
						}
					}
				}
				if(str.equals("项目全勤天数（缺省为全勤天数）----由系统算，不允许修改")){
					for(int m = 0;m<4;m++){
						if(sheet.getCell(m+4, i).getType() != CellType.EMPTY){
							NumberCell servcost = (NumberCell) sheet.getCell(m+4, i);
							outCount[m].setDouble("defaultdays", (double)servcost.getValue());
						}
					}
				}
				if(str.equals("项目认定的出勤天数（缺省为全勤天数）----允许项目经理修改")){
					for(int m = 0;m<4;m++){
						if(sheet.getCell(m+4, i).getType() != CellType.EMPTY){
							NumberCell salecost = (NumberCell) sheet.getCell(m+4, i);
							outCount[m].setDouble("agreeddays", (double)salecost.getValue());
						}
					}
				}
				if(str.equals("调整说明")){
					for(int m = 0;m<4;m++){
						if(sheet.getCell(m+4, i).getType() != CellType.EMPTY){
							NumberCell deptmcost = (NumberCell) sheet.getCell(m+4, i);
							outCount[m].setDouble("remark", (double)deptmcost.getValue());
						}
					}
				}
				if(str.equals("考勤缺失天数")){
					for(int m = 0;m<4;m++){
						if(sheet.getCell(m+4, i).getType() != CellType.EMPTY){
							NumberCell deptdcost = (NumberCell) sheet.getCell(m+4, i);
							outCount[m].setDouble("updatedays", (double)deptdcost.getValue());
						}
					}
				}
				if(str.equals("计提考勤天数")){
					for(int m = 0;m<4;m++){
						if(sheet.getCell(m+4, i).getType() != CellType.EMPTY){
							NumberCell commshar = (NumberCell) sheet.getCell(m+4, i);
							outCount[m].setDouble("accrueddays", (double)commshar.getValue());
						}
					}
				}
				if(str.equals("迟到次数")){
					for(int m = 0;m<4;m++){
						if(sheet.getCell(m+4, i).getType() != CellType.EMPTY){
							NumberCell comashar = (NumberCell) sheet.getCell(m+4, i);
							outCount[m].setDouble("latenum", (double)comashar.getValue());
						}
					}
				}
				if(str.equals("早退次数")){
					for(int m = 0;m<4;m++){
						if(sheet.getCell(m+4, i).getType() != CellType.EMPTY){
							NumberCell comdshar = (NumberCell) sheet.getCell(m+4, i);
							outCount[m].setDouble("leavenum", (double)comdshar.getValue());
						}
					}
				}
				if(str.equals("未签到次数")){
					for(int m = 0;m<4;m++){
						if(sheet.getCell(m+4, i).getType() != CellType.EMPTY){
							NumberCell baddebts = (NumberCell) sheet.getCell(m+4, i);
							outCount[m].setDouble("signnum", (double)baddebts.getValue());
						}
					}
				}
				if(str.equals("未签退次数")){
					for(int m = 0;m<4;m++){
						if(sheet.getCell(m+4, i).getType() != CellType.EMPTY){
							NumberCell instock = (NumberCell) sheet.getCell(m+4, i);
							outCount[m].setDouble("signoutnum", (double)instock.getValue());
						}
					}
				}
				if(str.equals("单边考勤缺失次数（未签到+未签退）")){
					for(int m = 0;m<4;m++){
						if(sheet.getCell(m+4, i).getType() != CellType.EMPTY){
							NumberCell outstock = (NumberCell) sheet.getCell(m+4, i);
							outCount[m].setDouble("losedays", (double)outstock.getValue());
						}
					}
				}
				if(str.equals("人员单价")){
					for(int m = 0;m<4;m++){
						if(sheet.getCell(m+4, i).getType() != CellType.EMPTY){
							NumberCell assetlose = (NumberCell) sheet.getCell(m+4, i);
							outCount[m].setDouble("price", (double)assetlose.getValue());
						}
					}
				}
				if(str.equals("人月数（只保留三位小数）")){
					for(int m = 0;m<4;m++){
						if(sheet.getCell(m+4, i).getType() != CellType.EMPTY){
							NumberCell servtax = (NumberCell) sheet.getCell(m+4, i);
							outCount[m].setDouble("months", (double)servtax.getValue());
						}
					}
				}
				if(str.equals("计提成本测算（保留2位小数））")){
					for(int m = 0;m<4;m++){
						if(sheet.getCell(m+4, i).getType() != CellType.EMPTY){
							NumberCell servtax = (NumberCell) sheet.getCell(m+4, i);
							outCount[m].setDouble("accruedcost", (double)servtax.getValue());
						}
					}
				}
				if(str.equals("入场日期")){
					for(int m = 0;m<4;m++){
						if(sheet.getCell(m+4, i).getType() != CellType.EMPTY){
							NumberCell servtax = (NumberCell) sheet.getCell(m+4, i);
							outCount[m].setDouble("rcdate", (double)servtax.getValue());
						}
					}
				}
				if(str.equals("离场日期")){
					for(int m = 0;m<4;m++){
						if(sheet.getCell(m+4, i).getType() != CellType.EMPTY){
							NumberCell servtax = (NumberCell) sheet.getCell(m+4, i);
							outCount[m].setDouble("lcdate", (double)servtax.getValue());
						}
					}
				}
			}
		return outCount;
	}
	
}
