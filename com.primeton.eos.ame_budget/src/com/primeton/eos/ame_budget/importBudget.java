/**
 * 
 */
package com.primeton.eos.ame_budget;


import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import jxl.CellType;
import jxl.NumberCell;
import jxl.Sheet;
import jxl.Workbook;
import jxl.read.biff.BiffException;

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
@Bizlet("importBudget")
public class importBudget {

	/**
	 * @param filePath
	 * @return
	 * @author zhuhx
	 * @throws ParseException 
	 * @throws IOException 
	 * @throws BiffException 
	 */
	@Bizlet("")
	public static String importBudget(String versionid,String projectId,String filePath) throws ParseException, BiffException, IOException {
		// TODO �Զ���ɷ������
		String a = "s";
		commonj.sdo.DataObject org = commonj.sdo.helper.DataFactory.INSTANCE.create("com.primeton.rdmgr.data.rd","RdProject");
		org.setString("projectId", projectId);
		DatabaseUtil.expandEntityByTemplate("default", org, org);
		String p=org.getString("projectno");
//		try {
			Workbook book  =  Workbook.getWorkbook( new  File(filePath));
			int sheetnum = book.getNumberOfSheets();
	        Sheet sheet = null;
	        Sheet sheet1 = null;
	        Sheet sheet2 = null;
	        if(sheetnum == 1){
	        	sheet = book.getSheet(0);
	        }else{
	        	sheet = book.getSheet(0);
				sheet1 = book.getSheet(3);
				sheet2 = book.getSheet(4);
	        }
			
			String projectno = sheet.getCell(5, 2).getContents();
			projectno=projectno.trim();
			if(!p.equals(projectno)){
				a="w";
				return a; 
			}
			//读取项目预算
			int contamt =0;
			if(sheet.getCell(3, 9).getType() != CellType.EMPTY){
				NumberCell cellcontamt = (NumberCell) sheet.getCell(3,9);
				contamt = (int)cellcontamt.getValue();
			}
			int pcontamt =0;
			if(sheet.getCell(3, 10).getType() != CellType.EMPTY){
				NumberCell cellpcontamt = (NumberCell) sheet.getCell(3,10);
			    pcontamt = (int)cellpcontamt.getValue();
			}
			int scontamt=0;
			if(sheet.getCell(3, 11).getType() != CellType.EMPTY){
				NumberCell cellscontamt = (NumberCell) sheet.getCell(3, 11);
				scontamt = (int)cellscontamt.getValue();
			}
			int mcontamt = 0;
			if(sheet.getCell(3, 12).getType() != CellType.EMPTY){
				NumberCell cellmcontamt = (NumberCell) sheet.getCell(3, 12);
				mcontamt = (int)cellmcontamt.getValue();
			}
			int pnetincome = 0;
			if(sheet.getCell(3, 13).getType() != CellType.EMPTY){
				NumberCell cellpnetincome = (NumberCell) sheet.getCell(3, 13);
				pnetincome = (int)cellpnetincome.getValue();
			}
			int pntaxincome = 0;
			if(sheet.getCell(3, 14).getType() != CellType.EMPTY){
				NumberCell cellpntaxincome = (NumberCell) sheet.getCell(3, 14);
				pntaxincome = (int)cellpntaxincome.getValue();
			}
			int sntaxincome = 0;
			if(sheet.getCell(3, 15).getType() != CellType.EMPTY){
				NumberCell cellsntaxincome = (NumberCell) sheet.getCell(3, 15);
				sntaxincome = (int)cellsntaxincome.getValue();
			}
			int mntaxincome = 0;
			if(sheet.getCell(3, 16).getType() != CellType.EMPTY){
				NumberCell cellmntaxincome = (NumberCell) sheet.getCell(3,16);
				mntaxincome = (int)cellmntaxincome.getValue();
			}
			int ppayback = 0;
			if(sheet.getCell(3, 17).getType() != CellType.EMPTY){
				NumberCell cellppayback = (NumberCell) sheet.getCell(3, 17);
				ppayback = (int)cellppayback.getValue();
			}
			/*int pconsultfee = 0;
			if(sheet.getCell(3, 18).getType() != CellType.EMPTY){
				NumberCell cellpconsultfee = (NumberCell) sheet.getCell(3, 18);
				pconsultfee = (int)cellpconsultfee.getValue();
			}*/
			int pconsultfee = 0;
			if(sheet.getCell(3, 18).getType() != CellType.EMPTY){
				NumberCell cellpsubfee = (NumberCell) sheet.getCell(3, 23);
				pconsultfee = (int)cellpsubfee.getValue();
			}
			int pcostsum = 0;
			if(sheet.getCell(3, 19).getType() != CellType.EMPTY){
				NumberCell cellpcostsum = (NumberCell) sheet.getCell(3,18);
				pcostsum = (int)cellpcostsum.getValue();
			}
			int pcosts = 0;
			if(sheet.getCell(3, 20).getType() != CellType.EMPTY){
				NumberCell cellpcosts = (NumberCell) sheet.getCell(3, 19);
				pcosts = (int)cellpcosts.getValue();
			}
			int pempcost = 0;
			if(sheet.getCell(3, 21).getType() != CellType.EMPTY){
				NumberCell cellpempcost = (NumberCell) sheet.getCell(3, 20);
				pempcost = (int)cellpempcost.getValue();
			}
			int pdircost = 0;
			if(sheet.getCell(3, 22).getType() != CellType.EMPTY){
				NumberCell cellpdircost = (NumberCell) sheet.getCell(3, 21);
				pdircost = (int)cellpdircost.getValue();
			}
			int poutcost = 0;
			if(sheet.getCell(3, 23).getType() != CellType.EMPTY){
				NumberCell cellpoutcost = (NumberCell) sheet.getCell(3, 22);
				poutcost = (int)cellpoutcost.getValue();
			}
			int expfmaincost = 0;
			if(sheet.getCell(3, 24).getType() != CellType.EMPTY){
				NumberCell cellexpfmaincost = (NumberCell) sheet.getCell(3, 24);
				expfmaincost = (int)cellexpfmaincost.getValue();
			}
			int othfee = 0;
			if(sheet.getCell(3, 25).getType() != CellType.EMPTY){
				NumberCell cellothfee = (NumberCell) sheet.getCell(3, 25);
				othfee = (int)cellothfee.getValue();
			}
			int expthirdpay = 0;
			if(sheet.getCell(3, 26).getType() != CellType.EMPTY){
				NumberCell cellexpthirdpay = (NumberCell) sheet.getCell(3, 26);
				expthirdpay = (int)cellexpthirdpay.getValue();
			}
			int pgrossprofit = 0;
			if(sheet.getCell(3, 27).getType() != CellType.EMPTY){
				NumberCell cellpgrossprofit = (NumberCell) sheet.getCell(3, 27);
				pgrossprofit = (int)cellpgrossprofit.getValue();
			}
			float labortransf = 0;
			if(sheet.getCell(1, 39).getType() != CellType.EMPTY){
				NumberCell celllabortransf = (NumberCell) sheet.getCell(1, 39);
				labortransf = (float)celllabortransf.getValue();
			}
			Date budgetdate = null;
			String cellbudgetdate=null;
			if(sheet.getCell(5, 4).getType() != CellType.EMPTY){
				 cellbudgetdate = sheet.getCell(5, 4).getContents();
			}
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");  
			Date startdate = null;
			String cellstartdate = null;
			if(sheet.getCell(1, 7).getType() != CellType.EMPTY){
				cellstartdate = sheet.getCell(1, 7).getContents();
			}
			Date enddate = null;
			String cellenddate=null;
			if(sheet.getCell(5, 7).getType() != CellType.EMPTY){
			   cellenddate = sheet.getCell(5, 7).getContents();
			}
			if(cellbudgetdate!=null && !cellbudgetdate.equals("")){
				budgetdate=sdf.parse(cellbudgetdate);
			}
			if(cellenddate!=null && !cellenddate.equals("")){
				enddate=sdf.parse(cellenddate);
			}
			if(cellstartdate!=null && !cellstartdate.equals("")){
				startdate=sdf.parse(cellstartdate);
			}
			String pgprate = sheet.getCell(3, 28).getContents();
			String budgetmaker = null;
			if(sheet.getCell(5, 4).getType() != CellType.EMPTY){
				budgetmaker = sheet.getCell(5, 5).getContents();
			}
			String tpexplain = null;
			if(sheet.getCell(4, 26).getType() != CellType.EMPTY){
				tpexplain = sheet.getCell(4, 26).getContents();
			}
			String fmainexpain = null;
			if(sheet.getCell(4, 24).getType() != CellType.EMPTY){
				fmainexpain = sheet.getCell(4, 24).getContents();
			}
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
			//budget.setInt("psubfee", psubfee);
			budget.setInt("pcostsum", pcostsum);
			budget.setInt("pcosts", pcosts);
			budget.setInt("pempcost", pempcost);
			budget.setInt("pdircost", pdircost);
			budget.setInt("poutcost", poutcost);
			budget.setInt("expfmaincost", expfmaincost);
			budget.setInt("othfee", othfee);
			budget.setInt("expthirdpay", expthirdpay);
			budget.setInt("pgrossprofit", pgrossprofit);
			budget.setFloat("labortransf", labortransf);
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
			if(sheet1 != null){
				int rowNum1 = sheet1.getRows();
				int expflag=0;//标志直接费用的开始结束，0代表不取当前excel的值作为直接费用，1代表开始取当前excel单元格的值
				ArrayList<DataObject> explist = new ArrayList<DataObject>();
				for(int i=0;i<=rowNum1;i++){
					double budgetfee = 0;
					String budgetmemo1 = null;
					if(sheet1.getCell(2, i).getContents().equals("直接费用项")){//开始
						expflag=1;
						continue;
					}
					if(sheet1.getCell(1, i).getContents().equals("直接费用预算汇总")){//结束
						expflag=0;
						break;
					}
					if(expflag==1){
						commonj.sdo.DataObject expdict = commonj.sdo.helper.DataFactory.INSTANCE.create("org.gocom.abframe.dataset.tools","EosDictEntry");
						expdict.set("eosDictType.dicttypeid", "AME_EXPTYPE");
						expdict.set("dictname", sheet1.getCell(2, i).getContents());
						int expcount = DatabaseUtil.expandEntityByTemplate("default", expdict, expdict);
						if(expcount==1){
							if(sheet1.getCell(3, i).getType() != CellType.EMPTY){
								NumberCell budgetfee1 = (NumberCell) sheet1.getCell(3, i);
								budgetfee = (int)budgetfee1.getValue();
							}
							if(sheet1.getCell(4, i).getType() != CellType.EMPTY){
								budgetmemo1=sheet1.getCell(4, i).getContents();
							}
							commonj.sdo.DataObject pdirtemp = commonj.sdo.helper.DataFactory.INSTANCE.create("com.primeton.eos.ame_budget.ame_budget","PrjBugdetExp");
							pdirtemp.setDouble("budgetfee", budgetfee);
							pdirtemp.setString("budgetmemo", budgetmemo1);
							pdirtemp.setInt("pbid", budget.getInt("pbid"));
							pdirtemp.setString("expid", expdict.getString("dictid"));
							explist.add(pdirtemp);
						}
					}
				}
				commonj.sdo.DataObject[] pdircosts = new DataObject[explist.size()];
				for(int i=0;i<explist.size();i++){
					pdircosts[i]  = explist.get(i);
				}
				DatabaseUtil.insertEntityBatch("default", pdircosts);
			}
			//读取人力投入预算费用明细
			if(sheet2 != null ){
				int rowNum = sheet2.getRows();
				int j=0;
				int k=0;
				//以“序号”为开始标志位，以“合计”为结束标志位 获取到起始位置
				for(int i = 0; i <= rowNum; i++){
					if(sheet2.getCell(1, i).getType() != CellType.EMPTY){
						
						if(sheet2.getCell(1, i).getContents().equals("序号")){
							j=i+1;
						}
						if(sheet2.getCell(1, i).getContents().equals("合计")){
							k=i-1;
							break;
						}
					}
					if(sheet2.getCell(2, i).getType()== CellType.EMPTY&&j>0){
						k=i-1;
						break;
					}
				}
				commonj.sdo.DataObject[] pempcosts = new DataObject[k-j+1];
				for(int i=0;i<pempcosts.length;i++){
					commonj.sdo.DataObject aaa = commonj.sdo.helper.DataFactory.INSTANCE.create("com.primeton.eos.ame_budget.ame_budget","PrjBudgetHu");
					pempcosts[i]  = aaa;
				}
				int n=0;
				
				//获取有效套别
				commonj.sdo.DataObject para = commonj.sdo.helper.DataFactory.INSTANCE.create("com.primeton.eos.common.newdataset","ParaPercostset");
				para.set("currentstate","1");
				DatabaseUtil.expandEntityByTemplate("default", para, para);
				for(int i=j;i<=k;i++){
					commonj.sdo.DataObject dict = commonj.sdo.helper.DataFactory.INSTANCE.create("com.primeton.eos.common.newdataset","MisPrice");
					commonj.sdo.DataObject dict1 = commonj.sdo.helper.DataFactory.INSTANCE.create("org.gocom.abframe.dataset.tools","EosDictEntry");
					commonj.sdo.DataObject dict2 = commonj.sdo.helper.DataFactory.INSTANCE.create("org.gocom.abframe.dataset.tools","EosDictEntry");
					String empname = null;
					if(sheet2.getCell(2, i).getType() != CellType.EMPTY){
						empname=sheet2.getCell(2, i).getContents();
					}
					float ppratio = 0;
					if(sheet2.getCell(3, i).getType() != CellType.EMPTY){
						NumberCell ppratio1 = (NumberCell) sheet2.getCell(3, i);
						ppratio = (float)ppratio1.getValue();
					}
					pempcosts[n].setString("empname", empname);
					pempcosts[n].setFloat("ppratio", ppratio);
					pempcosts[n].set("percostid",para.get("percostid"));
					String degree = null;
					if(sheet2.getCell(4, i).getType() != CellType.EMPTY){
						degree=sheet2.getCell(4, i).getContents();
						dict.set("percostid", para.get("percostid"));
						dict.setString("degreename", degree);
						DatabaseUtil.expandEntityByTemplate("default", dict, dict);
						pempcosts[n].setString("degree",dict.getString("degree"));
					}
					//判断是否外包
					if(degree!=null && !degree.equals("")){
						if(degree.contains("外包")){
							pempcosts[n].setString("resource","2");
						}else {
							String resource = null;
							if(sheet2.getCell(5, i).getType() != CellType.EMPTY){
								resource=sheet2.getCell(5, i).getContents();
								dict1.setString("eosDictType.dicttypeid", "MIS_PRICETYPE");
								dict1.setString("dictname", resource);
								DatabaseUtil.expandEntityByTemplate("default", dict1, dict1);
								resource=dict1.getString("dictid");
								pempcosts[n].set("resource",resource);
							}
						}
					}else {
						a="O";
						return a;
					}
					
					String istravel = null;
					if(sheet2.getCell(6, i).getType() != CellType.EMPTY){
						istravel=sheet2.getCell(6, i).getContents();
						dict2.setString("eosDictType.dicttypeid", "ABF_YESORNO");
						dict2.setString("dictname", istravel);
						DatabaseUtil.expandEntityByTemplate("default", dict2, dict2);
						istravel=dict2.getString("dictid");
						pempcosts[n].setString("istravel",istravel);
					}
					float dayprice = 0;
					if(sheet2.getCell(7, i).getType() != CellType.EMPTY){
						NumberCell dayprice1 = (NumberCell) sheet2.getCell(7, i);
						dayprice = (float)dayprice1.getValue();
					}
					pempcosts[n].setFloat("dayprice", dayprice);
					String cellexpindate=null;
					Date expindate=null;
					if(sheet2.getCell(8, i).getType() != CellType.EMPTY){
						cellexpindate = sheet2.getCell(8, i).getContents();
						expindate=sdf.parse(cellexpindate);
					}
					String cellexpoutdate=null;
					Date expoutdate=null;
					if(sheet2.getCell(9, i).getType() != CellType.EMPTY){
						cellexpoutdate = sheet2.getCell(9, i).getContents();
						expoutdate=sdf.parse(cellexpoutdate);
					}
					int naturaldays = 0;
					if(sheet2.getCell(10, i).getType() != CellType.EMPTY){
						NumberCell naturaldays1 = (NumberCell) sheet2.getCell(10, i);
						naturaldays = (int)naturaldays1.getValue();
					}
					float workdays = 0;
					if(sheet2.getCell(11, i).getType() != CellType.EMPTY){
						NumberCell workdays1 = (NumberCell) sheet2.getCell(11, i);
						workdays = (float)workdays1.getValue();
					}
					double pempcost1 = 0;
					if(sheet2.getCell(12, i).getType() != CellType.EMPTY){
						NumberCell pempcost2 = (NumberCell) sheet2.getCell(12, i);
						pempcost1 = (double)pempcost2.getValue();
					}
					pempcosts[n].setDate("expindate", expindate);
					pempcosts[n].setDate("expoutdate", expoutdate);
					pempcosts[n].setInt("naturaldays", naturaldays);
					pempcosts[n].setFloat("workdays", workdays);
					pempcosts[n].setDouble("pempcost", pempcost1);
					float dtravelfee = 0;
					if(istravel!=null){
						if(istravel.equals("是")){
							String fee= BusinessDictUtil.getDictName("AME_SYSCONF", "DTRAVALLOW");
							dtravelfee =new Float(fee); 
						}
					}
					pempcosts[n].setFloat("dtravelfee", dtravelfee);
					pempcosts[n].setInt("pbid", budget.getInt("pbid"));
					float travdays = naturaldays*ppratio;
					pempcosts[n].setFloat("travdays", travdays);
					DatabaseExt.getPrimaryKey(pempcosts[n]);
					n++;
				}
				DatabaseUtil.insertEntityBatch("default", pempcosts);
			}
		/*	
		} catch (Exception e) {
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
	 * @throws BiffException 
	 */	
	@Bizlet("importDepBudget")
	public static DataObject [] importDepBudget(String filePath) throws IOException, BiffException {
		// TODO �Զ���ɷ������
		Workbook book  =  Workbook.getWorkbook( new  File(filePath));
		Sheet sheet = book.getSheet(0);
		int rowNum = sheet.getRows();
		commonj.sdo.DataObject[] budget = new DataObject[4];
		for(int i=0;i<4;i++){
			commonj.sdo.DataObject aaa = commonj.sdo.helper.DataFactory.INSTANCE.create("com.primeton.eos.ame_budget.ame_budget","DeptBugdetVer");
			budget[i]  = aaa;
		}
		for(int i = 0; i < rowNum; i++){
			String str=sheet.getCell(0, i).getContents().replace(" ", "");
				if(str.equals("1.1产品合同额")){
					for(int m = 0;m<4;m++){
						if(sheet.getCell(m+4, i).getType() != CellType.EMPTY){
							NumberCell pcontamt = (NumberCell) sheet.getCell(m+4, i);
							budget[m].setDouble("pcontamt", (double)pcontamt.getValue());
						}
					}
				}
				if(str.equals("1.2MA合同额")){
					for(int m = 0;m<4;m++){
						if(sheet.getCell(m+4, i).getType() != CellType.EMPTY){
							NumberCell mcontamt = (NumberCell) sheet.getCell(m+4, i);
							budget[m].setDouble("mcontamt", (double)mcontamt.getValue());
						}
					}
				}
				if(str.equals("1.3服务合同额")){
					for(int m = 0;m<4;m++){
						if(sheet.getCell(m+4, i).getType() != CellType.EMPTY){
							NumberCell scontamt = (NumberCell) sheet.getCell(m+4, i);
							budget[m].setDouble("scontamt", (double)scontamt.getValue());
						}
					}
				}
				if(str.equals("二、收款额")){
					for(int m = 0;m<4;m++){
						if(sheet.getCell(m+4, i).getType() != CellType.EMPTY){
							NumberCell receamt = (NumberCell) sheet.getCell(m+4, i);
							budget[m].setDouble("receamt", (double)receamt.getValue());
						}
					}
				}
				if(str.equals("3.1产品收入")){
					for(int m = 0;m<4;m++){
						if(sheet.getCell(m+4, i).getType() != CellType.EMPTY){
							NumberCell ptaxincome = (NumberCell) sheet.getCell(m+4, i);
							budget[m].setDouble("ptaxincome", (double)ptaxincome.getValue());
						}
					}
				}
				if(str.equals("3.2MA收入")){
					for(int m = 0;m<4;m++){
						if(sheet.getCell(m+4, i).getType() != CellType.EMPTY){
							NumberCell mtaxincome = (NumberCell) sheet.getCell(m+4, i);
							budget[m].setDouble("mtaxincome", (double)mtaxincome.getValue());
						}
					}
				}
				if(str.equals("3.3服务收入")){
					for(int m = 0;m<4;m++){
						if(sheet.getCell(m+4, i).getType() != CellType.EMPTY){
							NumberCell staxincome = (NumberCell) sheet.getCell(m+4, i);
							budget[m].setDouble("staxincome", (double)staxincome.getValue());
						}
					}
				}
				if(str.equals("5.1产品分包及外部采购")){
					for(int m = 0;m<4;m++){
						if(sheet.getCell(m+4, i).getType() != CellType.EMPTY){
							NumberCell psubfee = (NumberCell) sheet.getCell(m+4, i);
							budget[m].setDouble("psubfee", (double)psubfee.getValue());
						}
					}
				}
				if(str.equals(" 5.2MA分包及外部采购")){
					for(int m = 0;m<4;m++){
						if(sheet.getCell(m+4, i).getType() != CellType.EMPTY){
							NumberCell msubfee = (NumberCell) sheet.getCell(m+4, i);
							budget[m].setDouble("msubfee", (double)msubfee.getValue());
						}
					}
				}
				if(str.equals("5.3服务分包及外部采购")){
					for(int m = 0;m<4;m++){
						if(sheet.getCell(m+4, i).getType() != CellType.EMPTY){
							NumberCell ssubfee = (NumberCell) sheet.getCell(m+4, i);
							budget[m].setDouble("ssubfee", (double)ssubfee.getValue());
						}
					}
				}
				if(str.equals("其中：自有服务成本")){
					for(int m = 0;m<4;m++){
						if(sheet.getCell(m+4, i).getType() != CellType.EMPTY){
							NumberCell servcost = (NumberCell) sheet.getCell(m+4, i);
							budget[m].setDouble("selfservcost", (double)servcost.getValue());
						}
					}
				}
				if(str.equals("其中：人月外包")){
					for(int m = 0;m<4;m++){
						if(sheet.getCell(m+4, i).getType() != CellType.EMPTY){
							NumberCell salecost = (NumberCell) sheet.getCell(m+4, i);
							budget[m].setDouble("pmsubfee", (double)salecost.getValue());
						}
					}
				}
				if(str.equals("其中：项目分包")){
					for(int m = 0;m<4;m++){
						if(sheet.getCell(m+4, i).getType() != CellType.EMPTY){
							NumberCell servcost = (NumberCell) sheet.getCell(m+4, i);
							budget[m].setDouble("prosubfee", (double)servcost.getValue());
						}
					}
				}
				if(str.equals("其中：净买入")){
					for(int m = 0;m<4;m++){
						if(sheet.getCell(m+4, i).getType() != CellType.EMPTY){
							NumberCell salecost = (NumberCell) sheet.getCell(m+4, i);
							budget[m].setDouble("inoutfee", (double)salecost.getValue());
						}
					}
				}
				if(str.equals("其中：自有销售费用")){
					for(int m = 0;m<4;m++){
						if(sheet.getCell(m+4, i).getType() != CellType.EMPTY){
							NumberCell servcost = (NumberCell) sheet.getCell(m+4, i);
							budget[m].setDouble("selfsalecost", (double)servcost.getValue());
						}
					}
				}
				if(str.equals("其中：非额度销售费用")){
					for(int m = 0;m<4;m++){
						if(sheet.getCell(m+4, i).getType() != CellType.EMPTY){
							NumberCell salecost = (NumberCell) sheet.getCell(m+4, i);
							budget[m].setDouble("nquosalecost", (double)salecost.getValue());
						}
					}
				}
				if(str.equals("8.3部门管理费用")){
					for(int m = 0;m<4;m++){
						if(sheet.getCell(m+4, i).getType() != CellType.EMPTY){
							NumberCell deptmcost = (NumberCell) sheet.getCell(m+4, i);
							budget[m].setDouble("deptmcost", (double)deptmcost.getValue());
						}
					}
				}
				if(str.equals("8.4部门研发费用")){
					for(int m = 0;m<4;m++){
						if(sheet.getCell(m+4, i).getType() != CellType.EMPTY){
							NumberCell deptdcost = (NumberCell) sheet.getCell(m+4, i);
							budget[m].setDouble("deptdcost", (double)deptdcost.getValue());
						}
					}
				}
				if(str.equals("8.3公司管理分摊") || str.equals("8.3公司管理费用")|| str.equals("8.3管理费用")){
					for(int m = 0;m<4;m++){
						if(sheet.getCell(m+4, i).getType() != CellType.EMPTY){
							NumberCell commshar = (NumberCell) sheet.getCell(m+4, i);
							budget[m].setDouble("commshar", (double)commshar.getValue());
						}
					}
				}
				if(str.equals("8.4公司市场分摊") || str.equals("8.4公司市场费用")|| str.equals("8.4市场费用")){
					for(int m = 0;m<4;m++){
						if(sheet.getCell(m+4, i).getType() != CellType.EMPTY){
							NumberCell comashar = (NumberCell) sheet.getCell(m+4, i);
							budget[m].setDouble("comashar", (double)comashar.getValue());
						}
					}
				}
				if(str.equals("8.5研发费用分成") || str.equals("8.5公司研发费用")){
					for(int m = 0;m<4;m++){
						if(sheet.getCell(m+4, i).getType() != CellType.EMPTY){
							NumberCell comdshar = (NumberCell) sheet.getCell(m+4, i);
							budget[m].setDouble("comdshar", (double)comdshar.getValue());
						}
					}
				}
				if(str.equals("其中：起步费")){
					for(int m = 0;m<4;m++){
						if(sheet.getCell(m+4, i).getType() != CellType.EMPTY){
							NumberCell startfee = (NumberCell) sheet.getCell(m+4, i);
							budget[m].setDouble("startfee", (double)startfee.getValue());
						}
					}
				}
				if(str.equals("其中：基础比例分成费")){
					for(int m = 0;m<4;m++){
						if(sheet.getCell(m+4, i).getType() != CellType.EMPTY){
							NumberCell bsfee = (NumberCell) sheet.getCell(m+4, i);
							budget[m].setDouble("bsfee", (double)bsfee.getValue());
						}
					}
				}
				if(str.equals("其中：超额返利（减项）")){
					for(int m = 0;m<4;m++){
						if(sheet.getCell(m+4, i).getType() != CellType.EMPTY){
							NumberCell rebate = (NumberCell) sheet.getCell(m+4, i);
							budget[m].setDouble("rebate", (double)rebate.getValue());
						}
					}
				}
				
				if(str.equals("8.6坏账核销")){
					for(int m = 0;m<4;m++){
						if(sheet.getCell(m+4, i).getType() != CellType.EMPTY){
							NumberCell baddebts = (NumberCell) sheet.getCell(m+4, i);
							budget[m].setDouble("baddebts", (double)baddebts.getValue());
						}
					}
				}
				if(str.equals("加：转入存货成本")){
					for(int m = 0;m<4;m++){
						if(sheet.getCell(m+4, i).getType() != CellType.EMPTY){
							NumberCell instock = (NumberCell) sheet.getCell(m+4, i);
							budget[m].setDouble("instock", (double)instock.getValue());
						}
					}
				}
				if(str.equals("减：转出存货成本")){
					for(int m = 0;m<4;m++){
						if(sheet.getCell(m+4, i).getType() != CellType.EMPTY){
							NumberCell outstock = (NumberCell) sheet.getCell(m+4, i);
							budget[m].setDouble("outstock", (double)outstock.getValue());
						}
					}
				}
				if(str.equals("九、资产减值损失")){
					for(int m = 0;m<4;m++){
						if(sheet.getCell(m+4, i).getType() != CellType.EMPTY){
							NumberCell assetlose = (NumberCell) sheet.getCell(m+4, i);
							budget[m].setDouble("assetlose", (double)assetlose.getValue());
						}
					}
				}
				if(str.equals("六、服务税抵扣")){
					for(int m = 0;m<4;m++){
						if(sheet.getCell(m+4, i).getType() != CellType.EMPTY){
							NumberCell servtax = (NumberCell) sheet.getCell(m+4, i);
							budget[m].setDouble("servtax", (double)servtax.getValue());
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
	 * @throws BiffException 
	 */	
	@Bizlet("importCk")
	public static String importCk(String filePath) throws IOException, BiffException {
		// TODO �Զ���ɷ������
		Workbook book  =  Workbook.getWorkbook( new  File(filePath));
		Sheet sheet = book.getSheet(0);
		int rowNum = sheet.getRows();
		String expnos = "";
		for(int i = 1; i < rowNum; i++){
			String str=sheet.getCell(4, i).getContents().replace(" ", "");
			String isck=sheet.getCell(5, i).getContents().replace(" ", "");
			if(sheet.getCell(4, i).getType() != CellType.EMPTY){
				if("是".equals(isck)){
					if(expnos == ""){
						expnos = str;
					}else{
						expnos = expnos + ","+str;
					}
				}
			}
		}
		return expnos;
	}

}
