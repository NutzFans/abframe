package com.primeton.eos.ame_budget;


import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Date;

import jxl.CellType;
import jxl.NumberCell;

import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.eos.foundation.data.DataContextUtil;
import com.eos.foundation.database.DatabaseExt;
import com.eos.foundation.database.DatabaseUtil;
import com.eos.foundation.eoscommon.BusinessDictUtil;
import com.eos.system.annotation.Bizlet;

import commonj.sdo.DataObject;

/**
 * @author zhuhx
 * @date 2016-07-27 14:27:04
 *
 */
public class importBudgetNew {

	/**
	 * @param filePath
	 * @return
	 * @author zhuhx
	 * @throws IOException 
	 */
	@SuppressWarnings("deprecation")
	@Bizlet("importBudget")

	public static String importBudgetNew(String versionid,String projectId,String filePath) throws IOException {
		// TODO �Զ���ɷ������
		String a = "s";
		commonj.sdo.DataObject org = commonj.sdo.helper.DataFactory.INSTANCE.create("com.primeton.rdmgr.data.rd","RdProject");
		org.setString("projectId", projectId);
		DatabaseUtil.expandEntityByTemplate("default", org, org);
		String p=org.getString("projectno");
//		try {
			Workbook workbook = null;
	        InputStream is = new FileInputStream(filePath);
	        workbook = new XSSFWorkbook(is);
	        int sheetnum = workbook.getNumberOfSheets();
	        Sheet sheet = null;
	        Sheet sheet1 = null;
	        Sheet sheet2 = null;
	        if(sheetnum == 1){
	        	sheet = workbook.getSheetAt(0);
	        }else{
	        	sheet = workbook.getSheetAt(0);
	        	sheet1 = workbook.getSheetAt(3); 
	        	sheet2 = workbook.getSheetAt(4);
	        }
			String projectno =sheet.getRow(2).getCell(5).getStringCellValue();
			projectno=projectno.trim();
			if(!p.equals(projectno)){
				a="w";
				return a; 
			}
			//读取项目预算
			int contamt =(int) sheet.getRow(9).getCell(3).getNumericCellValue();
			int pcontamt =(int) sheet.getRow(10).getCell(3).getNumericCellValue();
			int scontamt = (int) sheet.getRow(11).getCell(3).getNumericCellValue();
			int mcontamt = (int) sheet.getRow(12).getCell(3).getNumericCellValue();
			int pnetincome = (int) sheet.getRow(13).getCell(3).getNumericCellValue();
			int pntaxincome = (int) sheet.getRow(14).getCell(3).getNumericCellValue();
			int sntaxincome = (int) sheet.getRow(15).getCell(3).getNumericCellValue();
			int mntaxincome = (int) sheet.getRow(16).getCell(3).getNumericCellValue();
			int ppayback = (int) sheet.getRow(17).getCell(3).getNumericCellValue();
			int pconsultfee = (int) sheet.getRow(23).getCell(3).getNumericCellValue();
			//int psubfee = (int) sheet.getRow(18).getCell(3).getNumericCellValue();
			int pcostsum = (int) sheet.getRow(18).getCell(3).getNumericCellValue();
			int pcosts =(int) sheet.getRow(19).getCell(3).getNumericCellValue();
			int pempcost = (int) sheet.getRow(20).getCell(3).getNumericCellValue();
			int pdircost = (int) sheet.getRow(21).getCell(3).getNumericCellValue();
			int poutcost = (int) sheet.getRow(22).getCell(3).getNumericCellValue();
			int expfmaincost = (int) sheet.getRow(24).getCell(3).getNumericCellValue();
			int othfee = (int) sheet.getRow(25).getCell(3).getNumericCellValue();
			int expthirdpay = (int) sheet.getRow(26).getCell(3).getNumericCellValue();
			int pgrossprofit = (int) sheet.getRow(27).getCell(3).getNumericCellValue();
			float labortransf = (float) sheet.getRow(39).getCell(1).getNumericCellValue();//工时转换系数
			Date budgetdate =  sheet.getRow(4).getCell(5).getDateCellValue();
			Date startdate = sheet.getRow(7).getCell(1).getDateCellValue();
			Date enddate = sheet.getRow(7).getCell(5).getDateCellValue();
			float b = (float) sheet.getRow(28).getCell(3).getNumericCellValue();
			b=b*100;
			java.text.DecimalFormat   df=new   java.text.DecimalFormat("#.#");   
			String pgprate = df.format(b)+"%"; 
			String budgetmaker = sheet.getRow(5).getCell(5).getStringCellValue();
			String tpexplain = sheet.getRow(26).getCell(4).getStringCellValue();
			String fmainexpain = sheet.getRow(24).getCell(4).getStringCellValue();
			commonj.sdo.DataObject budget = commonj.sdo.helper.DataFactory.INSTANCE.create("com.primeton.eos.ame_budget.ame_budget","PrjBugdetVer");
			budget.setInt("contamt", contamt);
			budget.setInt("pcontamt", pcontamt);
			budget.setInt("scontamt", scontamt);
			budget.setInt("mcontamt", mcontamt);
			budget.setInt("pnetincome", pnetincome);
			budget.setInt("pntaxincome", pntaxincome);
			budget.setInt("sntaxincome", sntaxincome);
			budget.setInt("mntaxincome", mntaxincome);
			budget.setInt("ppayback", ppayback);
			budget.setInt("pconsultfee", pconsultfee);
//			budget.setInt("psubfee", psubfee);
			budget.setInt("pcostsum", pcostsum);
			budget.setInt("pcosts", pcosts);
			budget.setInt("pempcost", pempcost);
			budget.setInt("pdircost", pdircost);
			budget.setInt("poutcost", poutcost);
			budget.setInt("expfmaincost", expfmaincost);
			budget.setInt("othfee", othfee);
			budget.setFloat("labortransf", labortransf);
			budget.setInt("expthirdpay", expthirdpay);
			budget.setInt("pgrossprofit", pgrossprofit);
			budget.setString("pgprate", pgprate);
			budget.setString("projectid", projectId);
			budget.setString("versionid", versionid);
			budget.setString("budstatus", "0");
			budget.setString("iscversion", "0");
			budget.setString("budgetmaker", budgetmaker);
			budget.setString("tpexplain", tpexplain);
			budget.setString("fmainexpain", fmainexpain);
			budget.setDate("budgetdate", budgetdate);
			budget.setDate("startdate", startdate);
			budget.setDate("enddate", enddate);
			DatabaseExt.getPrimaryKey(budget);
			DatabaseUtil.insertEntity("default", budget);
			
			//读取直接费用明细
			if(sheet1 != null ){
				int rowNum1 = sheet1.getLastRowNum();
				int expflag=0;//标志直接费用的开始结束，0代表不取当前excel的值作为直接费用，1代表开始取当前excel单元格的值
				ArrayList<DataObject> explist = new ArrayList<DataObject>();
				for(int i=0;i<=rowNum1;i++){
					org.apache.poi.ss.usermodel.Cell expcell1=sheet1.getRow(i).getCell(2);
					org.apache.poi.ss.usermodel.Cell expcell2=sheet1.getRow(i).getCell(0);
					org.apache.poi.ss.usermodel.Cell expcell3=sheet1.getRow(i).getCell(3);
					org.apache.poi.ss.usermodel.Cell expcell4=sheet1.getRow(i).getCell(4);
					double budgetfee = 0;
					String budgetmemo1 = null;
					if(expcell2.getCellType()==expcell2.CELL_TYPE_STRING){
						if(expcell2.getStringCellValue().equals("直接费用预算汇总")){//结束
							expflag=0;
							break;
						}
					}
					if(expcell1!=null){
						if(expcell1.getCellType()==expcell1.CELL_TYPE_STRING){
							if(expcell1.getStringCellValue().equals("直接费用项")){//开始
								expflag=1;
								continue;
							}
						}
						
						if(expflag==1){
							commonj.sdo.DataObject expdict = commonj.sdo.helper.DataFactory.INSTANCE.create("org.gocom.abframe.dataset.tools","EosDictEntry");
							expdict.set("eosDictType.dicttypeid", "AME_EXPTYPE");
							expdict.set("dictname", expcell1.getStringCellValue());
							int expcount = DatabaseUtil.expandEntityByTemplate("default", expdict, expdict);
							if(expcount==1){
								budgetfee =  expcell3.getNumericCellValue();
								budgetmemo1 = (String) expcell4.getStringCellValue();
								commonj.sdo.DataObject pdirtemp = commonj.sdo.helper.DataFactory.INSTANCE.create("com.primeton.eos.ame_budget.ame_budget","PrjBugdetExp");
								pdirtemp.setDouble("budgetfee", budgetfee);
								pdirtemp.setString("budgetmemo", budgetmemo1);
								pdirtemp.setInt("pbid", budget.getInt("pbid"));
								pdirtemp.setString("expid", expdict.getString("dictid"));
								explist.add(pdirtemp);
							}
							
						}
					}
				}
				
				commonj.sdo.DataObject[] pdircosts = new DataObject[explist.size()];
				for(int i=0;i<explist.size();i++){
					pdircosts[i]  = explist.get(i);
				}
				DatabaseUtil.insertEntityBatch("default", pdircosts);
			}
			//读取人力投入预算明细(循环动态获取，)
			if(sheet2 != null){
				int rowNum = sheet2.getLastRowNum();
					int j=0;
					int k=0;
					//以“序号”为开始标志位，以“合计”为结束标志位 获取到起始位置
					for(int i = 0; i <= rowNum; i++){
						org.apache.poi.ss.usermodel.Cell cell1=sheet2.getRow(i).getCell((short)1);
						org.apache.poi.ss.usermodel.Cell cell5=sheet2.getRow(i).getCell(2);
						if(cell1!=null){
							if(cell1.getCellType()==cell1.CELL_TYPE_STRING){
								if((cell1.getStringCellValue()).equals("序号")){
									j=i+1;
								}
								if((cell1.getStringCellValue()).equals("合计")){
									k=i-1;
									break;
								}
							}
						}
						if(cell5.getCellType()==cell5.CELL_TYPE_BLANK&&j>0){
							k=i-1;
							break;
						}
					}
					commonj.sdo.DataObject[] pempcosts = new DataObject[k-j+1];
					for(int i=0;i<pempcosts.length;i++){
						commonj.sdo.DataObject aaa = commonj.sdo.helper.DataFactory.INSTANCE.create("com.primeton.eos.ame_budget.ame_budget","PrjBudgetHu");
						pempcosts[i]  = aaa;
					}
					//获取有效套别
					commonj.sdo.DataObject para = commonj.sdo.helper.DataFactory.INSTANCE.create("com.primeton.eos.common.newdataset","ParaPercostset");
					para.set("currentstate","1");
					DatabaseUtil.expandEntityByTemplate("default", para, para);
					int m=0;
					for(int i=j;i<=k;i++){
						commonj.sdo.DataObject dict = commonj.sdo.helper.DataFactory.INSTANCE.create("com.primeton.eos.common.newdataset","MisPrice");
						commonj.sdo.DataObject dict1 = commonj.sdo.helper.DataFactory.INSTANCE.create("org.gocom.abframe.dataset.tools","EosDictEntry");
						commonj.sdo.DataObject dict2 = commonj.sdo.helper.DataFactory.INSTANCE.create("org.gocom.abframe.dataset.tools","EosDictEntry");
						pempcosts[m].setString("empname", (String) sheet2.getRow(i).getCell(2).getStringCellValue());
						pempcosts[m].setFloat("ppratio", (float)sheet2.getRow(i).getCell(3).getNumericCellValue());
						pempcosts[m].set("percostid",para.get("percostid"));
						String degree=null;
						org.apache.poi.ss.usermodel.Cell cell3=sheet2.getRow(i).getCell((short)4);
						if(cell3!=null){
							degree=(String) sheet2.getRow(i).getCell(4).getStringCellValue();
							dict.set("percostid", para.get("percostid"));
							dict.setString("degreename", degree);
							DatabaseUtil.expandEntityByTemplate("default", dict, dict);
							pempcosts[m].setString("degree",dict.getString("degree"));
						}
						//判断是否外包
						if(degree!=null && !degree.equals("")){
							if(degree.contains("外包")){
								pempcosts[m].setString("resource","2");
							}else {
								String resource=(String) sheet2.getRow(i).getCell(5).getStringCellValue();
								dict1.setString("eosDictType.dicttypeid", "MIS_PRICETYPE");
								dict1.setString("dictname", resource);
								DatabaseUtil.expandEntityByTemplate("default", dict1, dict1);
								pempcosts[m].set("resource",dict1.getString("dictid"));
							}
						}else{
							a="O";
							return a;
							
							/*String resource=(String) sheet2.getRow(i).getCell(5).getStringCellValue();
					dict1.setString("dicttypeid", "AME_INOROUT");
					dict1.setString("dictname", resource);
					DatabaseUtil.expandEntityByTemplate("default", dict1, dict1);
					pempcosts[m].set("resource",dict1.getString("dictid"));*/
						}
						org.apache.poi.ss.usermodel.Cell cell2=sheet2.getRow(i).getCell((short)6);
						String istravel=null;
						if(cell2!=null){
							istravel=(String) sheet2.getRow(i).getCell(6).getStringCellValue();
							dict2.setString("eosDictType.dicttypeid", "ABF_YESORNO");
							dict2.setString("dictname", istravel);
							DatabaseUtil.expandEntityByTemplate("default", dict2, dict2);
							pempcosts[m].setString("istravel",dict2.getString("dictid"));
						}
						pempcosts[m].setFloat("dayprice", (float) sheet2.getRow(i).getCell(7).getNumericCellValue());
						pempcosts[m].setDate("expindate", sheet2.getRow(i).getCell(8).getDateCellValue());
						pempcosts[m].setDate("expoutdate", sheet2.getRow(i).getCell(9).getDateCellValue());
						pempcosts[m].setInt("naturaldays", (int) sheet2.getRow(i).getCell(10).getNumericCellValue());
						pempcosts[m].setFloat("workdays", (float) sheet2.getRow(i).getCell(11).getNumericCellValue());
						pempcosts[m].setDouble("pempcost", sheet2.getRow(i).getCell(12).getNumericCellValue());
						float dtravelfee = 0;
						if(istravel!=null){
							if(istravel.equals("是")){
								String fee= BusinessDictUtil.getDictName("AME_SYSCONF", "DTRAVALLOW");
								dtravelfee =new Float(fee); 
							}
						}
						pempcosts[m].setFloat("dtravelfee", dtravelfee);
						pempcosts[m].setInt("pbid", budget.getInt("pbid"));
						float travdays = (int) sheet2.getRow(i).getCell(10).getNumericCellValue()*(float)sheet2.getRow(i).getCell(3).getNumericCellValue();
						pempcosts[m].setFloat("travdays", travdays);
						DatabaseExt.getPrimaryKey(pempcosts[m]);
						m++;
					}
					DatabaseUtil.insertEntityBatch("default", pempcosts);
			}
			
		/*} catch (Exception e) {
			// TODO �Զ���� catch ��
			e.printStackTrace();
			
		}*/
		
		return a;
	}

	/**
	 * @param filePath
	 * @return
	 * @author zhuhx
	 * @throws IOException 
	 */	
	@Bizlet("importDepBudgetNew")
	public static DataObject [] importDepBudgetNew(String filePath) throws IOException {
		// TODO �Զ���ɷ������
			Workbook workbook = null;
	        InputStream is = new FileInputStream(filePath);
	        workbook = new XSSFWorkbook(is);
            Sheet sheet = workbook.getSheetAt(0);
			int rowNum = sheet.getLastRowNum();
			commonj.sdo.DataObject[] budget = new DataObject[4];
			for(int i=0;i<4;i++){
				commonj.sdo.DataObject aaa = commonj.sdo.helper.DataFactory.INSTANCE.create("com.primeton.eos.ame_budget.ame_budget","DeptBugdetVer");
				budget[i]  = aaa;
			}
			for(int i = 0; i <= rowNum; i++){
				org.apache.poi.ss.usermodel.Cell cell1=sheet.getRow(i).getCell(0);
				if(cell1!=null){
					if(cell1.getCellType()==cell1.CELL_TYPE_STRING){
						String str = cell1.getStringCellValue().replace(" ", "");
						if(str.equals("1.1产品合同额")){
							for(int m = 0;m<4;m++){
								budget[m].setDouble("pcontamt", sheet.getRow(i).getCell(m+4).getNumericCellValue());
							}
						}
						if(str.equals("1.2MA合同额")){
							for(int m = 0;m<4;m++){
								budget[m].setDouble("mcontamt", sheet.getRow(i).getCell(m+4).getNumericCellValue());
							}
						}
						if(str.equals("1.3服务合同额")){
							for(int m = 0;m<4;m++){
								budget[m].setDouble("scontamt", sheet.getRow(i).getCell(m+4).getNumericCellValue());
							}
						}
						if(str.equals("二、收款额")){
							for(int m = 0;m<4;m++){
								budget[m].setDouble("receamt", sheet.getRow(i).getCell(m+4).getNumericCellValue());
							}
						}
						if(str.equals("3.1产品收入")){
							for(int m = 0;m<4;m++){
								budget[m].setDouble("ptaxincome", sheet.getRow(i).getCell(m+4).getNumericCellValue());
							}
						}
						if(str.equals("3.2MA收入")){
							for(int m = 0;m<4;m++){
								budget[m].setDouble("mtaxincome", sheet.getRow(i).getCell(m+4).getNumericCellValue());
							}
						}
						if(str.equals("3.3服务收入")){
							for(int m = 0;m<4;m++){
								budget[m].setDouble("staxincome", sheet.getRow(i).getCell(m+4).getNumericCellValue());
							}
						}
						if(str.equals("5.1产品分包及外部采购")){
							for(int m = 0;m<4;m++){
								budget[m].setDouble("psubfee", sheet.getRow(i).getCell(m+4).getNumericCellValue());
							}
						}
						if(str.equals(" 5.2MA分包及外部采购")){
							for(int m = 0;m<4;m++){
								budget[m].setDouble("msubfee", sheet.getRow(i).getCell(m+4).getNumericCellValue());
							}
						}
						if(str.equals("5.3服务分包及外部采购")){
							for(int m = 0;m<4;m++){
								budget[m].setDouble("ssubfee", sheet.getRow(i).getCell(m+4).getNumericCellValue());
							}
						}
						if(str.equals("其中：自有服务成本")){
							for(int m = 0;m<4;m++){
								budget[m].setDouble("selfservcost", sheet.getRow(i).getCell(m+4).getNumericCellValue());
							}
						}
						if(str.equals("其中：人月外包")){
							for(int m = 0;m<4;m++){
								budget[m].setDouble("pmsubfee", sheet.getRow(i).getCell(m+4).getNumericCellValue());
							}
						}
						if(str.equals("其中：项目分包")){
							for(int m = 0;m<4;m++){
								budget[m].setDouble("prosubfee", sheet.getRow(i).getCell(m+4).getNumericCellValue());
							}
						}
						if(str.equals("其中：净买入")){
							for(int m = 0;m<4;m++){
								budget[m].setDouble("inoutfee", sheet.getRow(i).getCell(m+4).getNumericCellValue());
							}
						}
						if(str.equals("其中：自有销售费用")){
							for(int m = 0;m<4;m++){
								budget[m].setDouble("selfsalecost", sheet.getRow(i).getCell(m+4).getNumericCellValue());
							}
						}
						if(str.equals("其中：非额度销售费用")){
							for(int m = 0;m<4;m++){
								budget[m].setDouble("nquosalecost", sheet.getRow(i).getCell(m+4).getNumericCellValue());
							}
						}
						if(str.equals("8.3公司管理分摊") || str.equals("8.3公司管理费用")){
							for(int m = 0;m<4;m++){
								budget[m].setDouble("commshar", sheet.getRow(i).getCell(m+4).getNumericCellValue());
							}
						}
						if(str.equals("8.4公司市场分摊") || str.equals("8.4公司市场费用")){
							for(int m = 0;m<4;m++){
								budget[m].setDouble("comashar", sheet.getRow(i).getCell(m+4).getNumericCellValue());
							}
						}
						if(str.equals("8.5研发费用分成") || str.equals("8.5公司研发费用")){
							for(int m = 0;m<4;m++){
								budget[m].setDouble("comdshar", sheet.getRow(i).getCell(m+4).getNumericCellValue());
							}
						}
						if(str.equals("8.6坏账核销")){
							for(int m = 0;m<4;m++){
								budget[m].setDouble("baddebts", sheet.getRow(i).getCell(m+4).getNumericCellValue());
							}
						}
						if(str.equals("加：转入存货成本")){
							for(int m = 0;m<4;m++){
								budget[m].setDouble("instock", sheet.getRow(i).getCell(m+4).getNumericCellValue());
							}
						}
						if(str.equals("减：转出存货成本")){
							for(int m = 0;m<4;m++){
								budget[m].setDouble("outstock", sheet.getRow(i).getCell(m+4).getNumericCellValue());
							}
						}
						if(str.equals("九、资产减值损失")){
							for(int m = 0;m<4;m++){
								budget[m].setDouble("assetlose", sheet.getRow(i).getCell(m+4).getNumericCellValue());
							}
						}
						if(str.equals("六、服务税抵扣")){
							for(int m = 0;m<4;m++){
								budget[m].setDouble("servtax", sheet.getRow(i).getCell(m+4).getNumericCellValue());
							}
						}
					}
				}
			}
		return budget;
	}
	
	/**
	 * @param filePath
	 * @return
	 * @author zhuhx
	 * @throws IOException 
	 */	
	@Bizlet("importCkNew")
	public static String importCkNew(String filePath) throws IOException {
		// TODO �Զ���ɷ������
			Workbook workbook = null;
	        InputStream is = new FileInputStream(filePath);
	        workbook = new XSSFWorkbook(is);
            Sheet sheet = workbook.getSheetAt(0);
			int rowNum = sheet.getLastRowNum();
			String expnos = "";
			for(int i = 1; i <= rowNum; i++){
				org.apache.poi.ss.usermodel.Cell cell1=sheet.getRow(i).getCell(4);
				if(cell1!=null){
					if(cell1.getCellType()==cell1.CELL_TYPE_STRING){
						String str = cell1.getStringCellValue();
						String isck = sheet.getRow(i).getCell(5).getStringCellValue();
						if("是".equals(isck)){
							if(expnos ==""){
								expnos = str;
							}else{
								expnos = expnos +","+str;
							}
						}
					}
				}
			}
		return expnos;
	}
}

