/**
 * 
 */
package com.primeton.eos.ame_budget;



import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.util.HashMap;

import com.eos.foundation.database.DatabaseUtil;
import com.eos.system.annotation.Bizlet;

import commonj.sdo.DataObject;

/**
 * @author zhuhx
 * @date 2016-10-21 14:27:04
 *
 */
public class calData {

	/**
	 * @param budget1,budget2
	 * @return
	 * @author zhuhx
	 * @throws Throwable 
	 * @throws ParseException 
	 * @throws IOException 
	 * @throws BiffException 
	 * 汇总合同数据带来的计算
	 *//*
	@Bizlet("")
	public DataObject[] calContData(DataObject[] budget1,DataObject[] budget2) throws Throwable {
		if(budget2.length==0){
			 budget2   =   new   DataObject[4];
		}
		for(int i=0;i<=3;i++){
			commonj.sdo.DataObject aaa = commonj.sdo.helper.DataFactory.INSTANCE.create("com.primeton.eos.ame_budget.ame_budget","DeptBugdetVer");
			if(budget2[i]==null){
				budget2[i]  = aaa;
			}
			double netincome = budget2[i].getDouble("ntaxincome")-budget2[i].getDouble("subfee")-bustax;
			double pnetincome=budget2[i].getDouble("pntaxincome")-budget1[i].getDouble("psubfee")-budget2[i].getDouble("pntaxincome")*0.17*0.07;
			double snetincome=budget2[i].getDouble("sntaxincome")-budget1[i].getDouble("ssubfee")-budget2[i].getDouble("sntaxincome")*0.06*0.07;
			double mnetincome=budget2[i].getDouble("mntaxincome")-budget1[i].getDouble("msubfee")-budget2[i].getDouble("mntaxincome")*0.06*0.07;
			double profitBBonus = netincome-budget1[i].getDouble("currentcost")+budget1[i].getDouble("payback")-budget1[i].getDouble("assetlose");
			double profitABonus = profitBBonus-budget1[i].getDouble("bonus");
			budget1[i].setDouble("netincome", netincome);
			budget1[i].setDouble("profitABonus", profitABonus);
			budget1[i].setDouble("profitBBonus", profitBBonus);
			budget1[i].setDouble("contamt",budget2[i].getDouble("contamt"));
			budget1[i].setDouble("scontamt",budget2[i].getDouble("scontamt"));
			budget1[i].setDouble("mcontamt",budget2[i].getDouble("mcontamt"));
			budget1[i].setDouble("pcontamt",budget2[i].getDouble("pcontamt"));
			budget1[i].setDouble("pnetincome",pnetincome);
			budget1[i].setDouble("snetincome",snetincome);
			budget1[i].setDouble("mnetincome",mnetincome);
		}
		return budget1;
	}*/
	/**
	 * @param budget1,budget2
	 * @return
	 * @author zhuhx
	 * @throws Throwable 
	 * @throws ParseException 
	 * @throws IOException 
	 * @throws BiffException 
	 * 汇总收入数据带来的计算
	 */
	@Bizlet("")
	public DataObject[] calSrData(DataObject[] budget1,DataObject[] budget2,String year,String orgid) throws Throwable {
		if(budget2.length==0){
			 budget2   =   new   DataObject[4];
		}
		commonj.sdo.DataObject orgTemp = commonj.sdo.helper.DataFactory.INSTANCE.create("com.primeton.eos.ame_budget.ame_budget","BudgetOrg");
		orgTemp.set("orgid",orgid);
		orgTemp.set("year",year);
		DatabaseUtil.expandEntityByTemplate("default", orgTemp, orgTemp);
		String orgseqTemp = orgTemp.getString("orgseq");
		String [] orgids = orgseqTemp.split("\\.");
		commonj.sdo.DataObject budgetParaBs = commonj.sdo.helper.DataFactory.INSTANCE.create("com.primeton.eos.ame_budget.ame_budget","BudgetSharpara");
		commonj.sdo.DataObject budgetParaSt = commonj.sdo.helper.DataFactory.INSTANCE.create("com.primeton.eos.ame_budget.ame_budget","BudgetSharpara");
		commonj.sdo.DataObject budgetParaRe = commonj.sdo.helper.DataFactory.INSTANCE.create("com.primeton.eos.ame_budget.ame_budget","BudgetSharpara");
		for(int i = orgids.length-1;i>0;i--){//自低向上查找机构的分摊设置
			if(budgetParaBs.getString("caltype") == null){
				budgetParaBs.set("year", year);
				budgetParaBs.set("orgid", orgids[i]);
				budgetParaBs.set("sharterm", "B-PRATIO");
				DatabaseUtil.expandEntityByTemplate("default", budgetParaBs, budgetParaBs);
			}
			if(budgetParaSt.getString("caltype") == null){
				budgetParaSt.set("year", year);
				budgetParaSt.set("orgid", orgid);
				budgetParaSt.set("sharterm", "S-PRATIO");
				DatabaseUtil.expandEntityByTemplate("default", budgetParaSt, budgetParaSt);
			}
			if(budgetParaRe.getString("caltype") == null){
				budgetParaRe.set("year", year);
				budgetParaRe.set("orgid", orgid);
				budgetParaRe.set("sharterm", "R-PRATIO");
				DatabaseUtil.expandEntityByTemplate("default", budgetParaRe, budgetParaRe);
			}
		}
		
		commonj.sdo.DataObject budgetPara2 = commonj.sdo.helper.DataFactory.INSTANCE.create("com.primeton.eos.ame_budget.ame_budget","BudgetSharpara");
		budgetPara2.set("year", year);
		budgetPara2.set("orgid", orgid);
		budgetPara2.set("sharterm", "M-PRATIO");
		commonj.sdo.DataObject budgetlast = commonj.sdo.helper.DataFactory.INSTANCE.create("com.primeton.eos.ame_budget.ame_budget","DeptBugdetVer");
		budgetlast.set("year", Integer.parseInt(year)-1);
		budgetlast.set("quarter", "5");
		budgetlast.set("orgid", orgid);
		DatabaseUtil.expandEntityByTemplate("default", budgetPara2, budgetPara2);
		DatabaseUtil.expandEntityByTemplate("default", budgetlast, budgetlast);
		double pntaxincomeT = budget2[0].getDouble("pntaxincome")+budget2[1].getDouble("pntaxincome")+budget2[2].getDouble("pntaxincome")+budget2[3].getDouble("pntaxincome");
		double mntaxincomeT = budget2[0].getDouble("mntaxincome")+budget2[1].getDouble("mntaxincome")+budget2[2].getDouble("mntaxincome")+budget2[3].getDouble("mntaxincome");
		double taxincomeT = budget2[0].getDouble("taxincome")+budget2[1].getDouble("taxincome")+budget2[2].getDouble("taxincome")+budget2[3].getDouble("taxincome");
		double receamtT = budget1[0].getDouble("receamt")+budget1[1].getDouble("receamt")+budget1[2].getDouble("receamt")+budget1[3].getDouble("receamt");
		for(int i=0;i<=3;i++){
			commonj.sdo.DataObject aaa = commonj.sdo.helper.DataFactory.INSTANCE.create("com.primeton.eos.ame_budget.ame_budget","DeptBugdetVer");
			if(budget2[i]==null){
				budget2[i]  = aaa;
			}
			double bsfee = 0;
			if("1".equals(budgetParaBs.get("caltype"))){
				bsfee = budget1[i].getDouble("bsfee");
			}else{
				bsfee = (budget2[i].getDouble("pntaxincome")+budget2[i].getDouble("mntaxincome"))*budgetParaBs.getDouble("parameters");
			}
			double startfee = 0;
			if("1".equals(budgetParaSt.get("caltype"))){
				startfee = budget1[i].getDouble("startfee");
			}else{
				if(pntaxincomeT+mntaxincomeT==0){
				}else{
					startfee = budgetlast.getDouble("startfee")*(budget2[i].getDouble("pntaxincome")+budget2[i].getDouble("pntaxincome"))/(pntaxincomeT+mntaxincomeT);
				}
			}
			double rebate = 0;
			double accounts = 0;
			if(i==3){
				if("1".equals(budgetParaRe.get("caltype"))){
					rebate = budget1[i].getDouble("rebate");
				}else{
					if(budgetlast.getDouble("pntaxincome")==0){
						
					}else{
						if(pntaxincomeT/budgetlast.getDouble("pntaxincome")-1<=0){
							rebate=0; 
						}else{
							if(pntaxincomeT/budgetlast.getDouble("pntaxincome")-1<=0.1){
								rebate = budgetlast.getDouble("pntaxincome")*(pntaxincomeT/budgetlast.getDouble("pntaxincome")-1)*0.2*budgetParaRe.getDouble("parameters");
							}else{
								rebate = budgetlast.getDouble("pntaxincome")*0.1*0.2*budgetParaRe.getDouble("parameters")+budgetlast.getDouble("pntaxincome")*(pntaxincomeT/budgetlast.getDouble("pntaxincome")-1-0.1)*0.5*budgetParaRe.getDouble("parameters");
							}
						}
					}
				}
		    	accounts = budgetlast.getDouble("accounts")+taxincomeT-receamtT;

			}
			double comdshar =bsfee+startfee+rebate ;
			double commshar = 0;
			if("1".equals(budgetPara2.get("caltype"))){
				commshar = budget1[i].getDouble("commshar");
			}else{
				commshar = (budget2[i].getDouble("ntaxincome")-comdshar)*budgetPara2.getDouble("parameters");
			}
			double currentcost = comdshar+budget1[i].getDouble("comashar")+commshar+budget1[i].getDouble("salecost")+budget1[i].getDouble("servcost")
			    	-budget1[i].getDouble("outstock1")+budget1[i].getDouble("instock1")+budget1[i].getDouble("baddebts")+budget2[i].getDouble("bustax");
			double profitBBonus = budget2[i].getDouble("ntaxincome")+budget2[i].getDouble("payback")+budget1[i].getDouble("servtax")-currentcost;
			double profitABonus = profitBBonus-budget1[i].getDouble("bonus");
			double wptotalfee=budget2[i].getDouble("ntaxincome")+budget2[i].getDouble("payback")+budget1[i].getDouble("servtax");
			double cashflow = 0;
			if(i==0){
				cashflow = budget1[i].getDouble("receamt")+budget2[i].getDouble("payback")+budget1[i].getDouble("servtax")-currentcost-budget2[i].getDouble("taxincome")+budget2[i].getDouble("ntaxincome")-budgetlast.getDouble("bonus");
			}else{
				cashflow = budget1[i].getDouble("receamt")+budget2[i].getDouble("payback")+budget1[i].getDouble("servtax")-currentcost-budget2[i].getDouble("taxincome")+budget2[i].getDouble("ntaxincome");
			}
			double deviation = cashflow-profitBBonus;
			budget1[i].setDouble("profitABonus", profitABonus);
			budget1[i].setDouble("profitBBonus", profitBBonus);
			budget1[i].setDouble("currentcost", currentcost);
			budget1[i].setDouble("comdshar", comdshar);
			budget1[i].setDouble("rebate", rebate);
			budget1[i].setDouble("startfee", startfee);
			budget1[i].setDouble("bsfee", bsfee);
			budget1[i].setDouble("accounts", accounts);
			budget1[i].setDouble("commshar", commshar);
			budget1[i].setDouble("wptotalfee", wptotalfee);
			budget1[i].setDouble("cashflow", cashflow);
			budget1[i].setDouble("deviation", deviation);
			budget1[i].setDouble("payback",budget2[i].getDouble("payback"));
			budget1[i].setDouble("bustax",budget2[i].getDouble("bustax"));
			budget1[i].setDouble("taxincome",budget2[i].getDouble("taxincome"));
			budget1[i].setDouble("ptaxincome",budget2[i].getDouble("ptaxincome"));
			budget1[i].setDouble("mtaxincome",budget2[i].getDouble("mtaxincome"));
			budget1[i].setDouble("staxincome",budget2[i].getDouble("staxincome"));
			budget1[i].setDouble("ntaxincome",budget2[i].getDouble("ntaxincome"));
			budget1[i].setDouble("pntaxincome",budget2[i].getDouble("pntaxincome"));
			budget1[i].setDouble("mntaxincome",budget2[i].getDouble("mntaxincome"));
			budget1[i].setDouble("sntaxincome",budget2[i].getDouble("sntaxincome"));
		}
		return budget1;
	}
	
	/**
	 * @param budget1,budget2
	 * @return
	 * @author zhuhx
	 * @throws Throwable 
	 * @throws ParseException 
	 * @throws IOException 
	 * @throws BiffException 
	 * 汇总收款数据带来的计算
	 */
	@Bizlet("")
	public DataObject[] calSkData(DataObject[] budget1,DataObject[] budget2,String year,String orgid) throws Throwable {
		if(budget2.length==0){
			 budget2   =   new   DataObject[4];
		}
		commonj.sdo.DataObject budgetlast = commonj.sdo.helper.DataFactory.INSTANCE.create("com.primeton.eos.ame_budget.ame_budget","DeptBugdetVer");
		budgetlast.set("year", Integer.parseInt(year)-1);
		budgetlast.set("quarter", "5");
		budgetlast.set("orgid", orgid);
		DatabaseUtil.expandEntityByTemplate("default", budgetlast, budgetlast);
		double taxincomeT = budget1[0].getDouble("taxincome")+budget1[1].getDouble("taxincome")+budget1[2].getDouble("taxincome")+budget1[3].getDouble("taxincome");
		double receamtT = budget2[0].getDouble("receamt")+budget2[1].getDouble("receamt")+budget2[2].getDouble("receamt")+budget2[3].getDouble("receamt");
		for(int i=0;i<=3;i++){
			commonj.sdo.DataObject aaa = commonj.sdo.helper.DataFactory.INSTANCE.create("com.primeton.eos.ame_budget.ame_budget","DeptBugdetVer");
			if(budget2[i]==null){
				budget2[i]  = aaa;
			}
			double accounts = 0;
			if(i==3){
		    	accounts = budgetlast.getDouble("accounts")+taxincomeT-receamtT;

			}
			double cashflow = 0;
			if(i==0){
				cashflow = budget2[i].getDouble("receamt")+budget1[i].getDouble("payback")+budget1[i].getDouble("servtax")-budget1[i].getDouble("currentcost")-budget1[i].getDouble("taxincome")+budget1[i].getDouble("ntaxincome")-budgetlast.getDouble("bonus");
			}else{
				cashflow = budget2[i].getDouble("receamt")+budget1[i].getDouble("payback")+budget1[i].getDouble("servtax")-budget1[i].getDouble("currentcost")-budget1[i].getDouble("taxincome")+budget1[i].getDouble("ntaxincome");
			}
			budget1[i].setDouble("cashflow", cashflow);
			budget1[i].setDouble("accounts", accounts);
			budget1[i].setDouble("receamt", budget2[i].getDouble("receamt"));
		}
		return budget1;
	}
	
	/**
	 * @param budget1,budget2
	 * @return
	 * @author zhuhx
	 * @throws Throwable 
	 * @throws ParseException 
	 * @throws IOException 
	 * @throws BiffException 
	 * 汇总外部采购数据带来的计算
	 */
	@Bizlet("")
	public DataObject[] calSubData(DataObject[] budget1,DataObject[] budget2) throws Throwable {
		if(budget2.length==0){
			 budget2   =   new   DataObject[4];
		}
		for(int i=0;i<=3;i++){
			commonj.sdo.DataObject aaa = commonj.sdo.helper.DataFactory.INSTANCE.create("com.primeton.eos.ame_budget.ame_budget","DeptBugdetVer");
			if(budget2[i]==null){
				budget2[i]  = aaa;
			}
			double pnetincome=budget1[i].getDouble("pntaxincome")-budget2[i].getDouble("psubfee")-budget1[i].getDouble("pntaxincome")*0.17*0.07;
			double snetincome=budget1[i].getDouble("sntaxincome")-budget2[i].getDouble("ssubfee")-budget1[i].getDouble("sntaxincome")*0.06*0.07;
			double mnetincome=budget1[i].getDouble("mntaxincome")-budget2[i].getDouble("msubfee")-budget1[i].getDouble("mntaxincome")*0.06*0.07;
			double netincome = mnetincome+pnetincome+snetincome;
			double profitBBonus = netincome-budget1[i].getDouble("currentcost")+budget1[i].getDouble("payback")-budget1[i].getDouble("assetlose")-budget1[i].getDouble("servtax");
			double profitABonus = profitBBonus-budget1[i].getDouble("bonus");
			budget1[i].setDouble("netincome", netincome);
			budget1[i].setDouble("profitABonus", profitABonus);
			budget1[i].setDouble("profitBBonus", profitBBonus);
			budget1[i].setDouble("psubfee",budget2[i].getDouble("psubfee"));
			budget1[i].setDouble("ssubfee",budget2[i].getDouble("ssubfee"));
			budget1[i].setDouble("msubfee",budget2[i].getDouble("msubfee"));
			budget1[i].setDouble("subfee",budget2[i].getDouble("subfee"));
			budget1[i].setDouble("pnetincome",pnetincome);
			budget1[i].setDouble("snetincome",snetincome);
			budget1[i].setDouble("mnetincome",mnetincome);
		}
		return budget1;
	}
	
	/**
	 * @param budget1,budget2
	 * @return
	 * @author zhuhx
	 * @throws Throwable 
	 * @throws ParseException 
	 * @throws IOException 
	 * @throws BiffException 
	 * 汇总自有服务成本数据带来的计算
	 */
	@Bizlet("")
	public DataObject[] calSelfServData(DataObject[] budget1,DataObject[] budget2,String year,String orgid) throws Throwable {
		if(budget2.length==0){
			 budget2   =   new   DataObject[4];
		}
		commonj.sdo.DataObject budgetlast = commonj.sdo.helper.DataFactory.INSTANCE.create("com.primeton.eos.ame_budget.ame_budget","DeptBugdetVer");
		budgetlast.set("year", Integer.parseInt(year)-1);
		budgetlast.set("quarter", "5");
		budgetlast.set("orgid", orgid);
		DatabaseUtil.expandEntityByTemplate("default", budgetlast, budgetlast);
		for(int i=0;i<=3;i++){
			commonj.sdo.DataObject aaa = commonj.sdo.helper.DataFactory.INSTANCE.create("com.primeton.eos.ame_budget.ame_budget","DeptBugdetVer");
			if(budget2[i]==null){
				budget2[i]  = aaa;
			}
			double servcost = budget1[i].getDouble("pmsubfee")+budget2[i].getDouble("totalfee")+budget1[i].getDouble("prosubfee")+budget1[i].getDouble("inoutfee");
			double currentcost = budget1[i].getDouble("comdshar")+budget1[i].getDouble("comashar")+budget1[i].getDouble("commshar")+budget1[i].getDouble("salecost")+servcost
			    	-budget1[i].getDouble("outstock1")+budget1[i].getDouble("instock1")+budget1[i].getDouble("baddebts")+budget1[i].getDouble("bustax");
			double profitBBonus = budget1[i].getDouble("ntaxincome")+budget1[i].getDouble("payback")+budget1[i].getDouble("servtax")-currentcost;
			double profitABonus = profitBBonus-budget1[i].getDouble("bonus");
			double cashflow = 0;
			if(i==0){
				cashflow = budget1[i].getDouble("receamt")+budget1[i].getDouble("payback")+budget1[i].getDouble("servtax")-currentcost-budget1[i].getDouble("taxincome")+budget1[i].getDouble("ntaxincome")-budgetlast.getDouble("bonus");
			}else{
				cashflow = budget1[i].getDouble("receamt")+budget1[i].getDouble("payback")+budget1[i].getDouble("servtax")-currentcost-budget1[i].getDouble("taxincome")+budget1[i].getDouble("ntaxincome");
			}
			double deviation = cashflow-profitBBonus;
			budget1[i].setDouble("cashflow", cashflow);
			budget1[i].setDouble("currentcost", currentcost);
			budget1[i].setDouble("profitABonus", profitABonus);
			budget1[i].setDouble("profitBBonus", profitBBonus);
			budget1[i].setDouble("servcost", servcost);
			budget1[i].setDouble("deviation", deviation);
			budget1[i].setDouble("selfservcost",budget2[i].getDouble("totalfee"));
		}
		return budget1;
	}
	
	/**
	 * @param budget1,budget2
	 * @return
	 * @author zhuhx
	 * @throws Throwable 
	 * @throws ParseException 
	 * @throws IOException 
	 * @throws BiffException 
	 * 汇总人月外包数据带来的计算
	 */
	@Bizlet("")
	public DataObject[] calPmSubData(DataObject[] budget1,DataObject[] budget2,String year,String orgid) throws Throwable {
		if(budget2.length==0){
			 budget2   =   new   DataObject[4];
		}
		commonj.sdo.DataObject budgetlast = commonj.sdo.helper.DataFactory.INSTANCE.create("com.primeton.eos.ame_budget.ame_budget","DeptBugdetVer");
		budgetlast.set("year", Integer.parseInt(year)-1);
		budgetlast.set("quarter", "5");
		budgetlast.set("orgid", orgid);
		DatabaseUtil.expandEntityByTemplate("default", budgetlast, budgetlast);
		for(int i=0;i<=3;i++){
			commonj.sdo.DataObject aaa = commonj.sdo.helper.DataFactory.INSTANCE.create("com.primeton.eos.ame_budget.ame_budget","DeptBugdetVer");
			if(budget2[i]==null){
				budget2[i]  = aaa;
			}
			double servcost = budget2[i].getDouble("totalfee")+budget1[i].getDouble("selfservcost")+budget1[i].getDouble("prosubfee")+budget1[i].getDouble("inoutfee");
			double currentcost = budget1[i].getDouble("comdshar")+budget1[i].getDouble("comashar")+budget1[i].getDouble("commshar")+budget1[i].getDouble("salecost")+servcost
			    	-budget1[i].getDouble("outstock1")+budget1[i].getDouble("instock1")+budget1[i].getDouble("baddebts")+budget1[i].getDouble("bustax");
			double profitBBonus = budget1[i].getDouble("ntaxincome")+budget1[i].getDouble("payback")+budget1[i].getDouble("servtax")-currentcost;
			double profitABonus = profitBBonus-budget1[i].getDouble("bonus");
			double cashflow = 0;
			if(i==0){
				cashflow = budget1[i].getDouble("receamt")+budget1[i].getDouble("payback")+budget1[i].getDouble("servtax")-currentcost-budget1[i].getDouble("taxincome")+budget1[i].getDouble("ntaxincome")-budgetlast.getDouble("bonus");
			}else{
				cashflow = budget1[i].getDouble("receamt")+budget1[i].getDouble("payback")+budget1[i].getDouble("servtax")-currentcost-budget1[i].getDouble("taxincome")+budget1[i].getDouble("ntaxincome");
			}			
			double deviation = cashflow-profitBBonus;
			budget1[i].setDouble("cashflow", cashflow);
			budget1[i].setDouble("deviation", deviation);
			budget1[i].setDouble("currentcost", currentcost);
			budget1[i].setDouble("profitABonus", profitABonus);
			budget1[i].setDouble("profitBBonus", profitBBonus);
			budget1[i].setDouble("servcost", servcost);
			budget1[i].setDouble("pmsubfee",budget2[i].getDouble("totalfee"));
		}
		return budget1;
	}
	
	/**
	 * @param budget1,budget2
	 * @return
	 * @author zhuhx
	 * @throws Throwable 
	 * @throws ParseException 
	 * @throws IOException 
	 * @throws BiffException 
	 * 汇总项目分包数据带来的计算
	 */
	@Bizlet("")
	public DataObject[] calProSubData(DataObject[] budget1,DataObject[] budget2,String year,String orgid) throws Throwable {
		if(budget2.length==0){
			 budget2   =   new   DataObject[4];
		}
		commonj.sdo.DataObject budgetlast = commonj.sdo.helper.DataFactory.INSTANCE.create("com.primeton.eos.ame_budget.ame_budget","DeptBugdetVer");
		budgetlast.set("year", Integer.parseInt(year)-1);
		budgetlast.set("quarter", "5");
		budgetlast.set("orgid", orgid);
		DatabaseUtil.expandEntityByTemplate("default", budgetlast, budgetlast);
		for(int i=0;i<=3;i++){
			commonj.sdo.DataObject aaa = commonj.sdo.helper.DataFactory.INSTANCE.create("com.primeton.eos.ame_budget.ame_budget","DeptBugdetVer");
			if(budget2[i]==null){
				budget2[i]  = aaa;
			}
			double servcost = budget1[i].getDouble("pmsubfee")+budget1[i].getDouble("selfservcost")+budget2[i].getDouble("totalfee")+budget1[i].getDouble("inoutfee");
			double currentcost = budget1[i].getDouble("comdshar")+budget1[i].getDouble("comashar")+budget1[i].getDouble("commshar")+budget1[i].getDouble("salecost")+servcost
			    	-budget1[i].getDouble("outstock1")+budget1[i].getDouble("instock1")+budget1[i].getDouble("baddebts")+budget1[i].getDouble("bustax");
			double profitBBonus = budget1[i].getDouble("ntaxincome")+budget1[i].getDouble("payback")+budget1[i].getDouble("servtax")-currentcost;
			double profitABonus = profitBBonus-budget1[i].getDouble("bonus");
			double cashflow = 0;
			if(i==0){
				cashflow = budget1[i].getDouble("receamt")+budget1[i].getDouble("payback")+budget1[i].getDouble("servtax")-currentcost-budget1[i].getDouble("taxincome")+budget1[i].getDouble("ntaxincome")-budgetlast.getDouble("bonus");
			}else{
				cashflow = budget1[i].getDouble("receamt")+budget1[i].getDouble("payback")+budget1[i].getDouble("servtax")-currentcost-budget1[i].getDouble("taxincome")+budget1[i].getDouble("ntaxincome");
			}	
			double deviation = cashflow-profitBBonus;
			budget1[i].setDouble("cashflow", cashflow);
			budget1[i].setDouble("deviation", deviation);
			budget1[i].setDouble("currentcost", currentcost);
			budget1[i].setDouble("profitABonus", profitABonus);
			budget1[i].setDouble("profitBBonus", profitBBonus);
			budget1[i].setDouble("servcost", servcost);
			budget1[i].setDouble("prosubfee",budget2[i].getDouble("totalfee"));
		}
		return budget1;
	}
	
	/**
	 * @param budget1,budget2
	 * @return
	 * @author zhuhx
	 * @throws Throwable 
	 * @throws ParseException 
	 * @throws IOException 
	 * @throws BiffException 
	 * 汇总净买入数据带来的计算
	 */
	@Bizlet("")
	public DataObject[] calInOutData(DataObject[] budget1,DataObject[] budget2,String year,String orgid) throws Throwable {
		if(budget2.length==0){
			 budget2   =   new   DataObject[4];
		}
		commonj.sdo.DataObject budgetlast = commonj.sdo.helper.DataFactory.INSTANCE.create("com.primeton.eos.ame_budget.ame_budget","DeptBugdetVer");
		budgetlast.set("year", Integer.parseInt(year)-1);
		budgetlast.set("quarter", "5");
		budgetlast.set("orgid", orgid);
		DatabaseUtil.expandEntityByTemplate("default", budgetlast, budgetlast);
		for(int i=0;i<=3;i++){
			commonj.sdo.DataObject aaa = commonj.sdo.helper.DataFactory.INSTANCE.create("com.primeton.eos.ame_budget.ame_budget","DeptBugdetVer");
			if(budget2[i]==null){
				budget2[i]  = aaa;
			}
			double servcost = budget1[i].getDouble("pmsubfee")+budget1[i].getDouble("selfservcost")+budget1[i].getDouble("prosubfee")+budget2[i].getDouble("totalfee");
			double currentcost = budget1[i].getDouble("comdshar")+budget1[i].getDouble("comashar")+budget1[i].getDouble("commshar")+budget1[i].getDouble("salecost")+servcost
			    	-budget1[i].getDouble("outstock1")+budget1[i].getDouble("instock1")+budget1[i].getDouble("baddebts")+budget1[i].getDouble("bustax");
			double profitBBonus = budget1[i].getDouble("ntaxincome")+budget1[i].getDouble("payback")+budget1[i].getDouble("servtax")-currentcost;
			double profitABonus = profitBBonus-budget1[i].getDouble("bonus");
			double cashflow = 0;
			if(i==0){
				cashflow = budget1[i].getDouble("receamt")+budget1[i].getDouble("payback")+budget1[i].getDouble("servtax")-currentcost-budget1[i].getDouble("taxincome")+budget1[i].getDouble("ntaxincome")-budgetlast.getDouble("bonus");
			}else{
				cashflow = budget1[i].getDouble("receamt")+budget1[i].getDouble("payback")+budget1[i].getDouble("servtax")-currentcost-budget1[i].getDouble("taxincome")+budget1[i].getDouble("ntaxincome");
			}	
			double deviation = cashflow-profitBBonus;
			budget1[i].setDouble("cashflow", cashflow);
			budget1[i].setDouble("deviation", deviation);
			budget1[i].setDouble("currentcost", currentcost);
			budget1[i].setDouble("profitABonus", profitABonus);
			budget1[i].setDouble("profitBBonus", profitBBonus);
			budget1[i].setDouble("servcost", servcost);
			budget1[i].setDouble("inoutfee",budget2[i].getDouble("totalfee"));
		}
		return budget1;
	}
	
	/**
	 * @param budget1,budget2
	 * @return
	 * @author zhuhx
	 * @throws Throwable 
	 * @throws ParseException 
	 * @throws IOException 
	 * @throws BiffException 
	 * 汇总自有销售费用数据带来的计算
	 */
	@Bizlet("")
	public DataObject[] calSelfSaleData(DataObject[] budget1,DataObject[] budget2,String year,String orgid) throws Throwable {
		if(budget2.length==0){
			 budget2   =   new   DataObject[4];
		}
		commonj.sdo.DataObject budgetlast = commonj.sdo.helper.DataFactory.INSTANCE.create("com.primeton.eos.ame_budget.ame_budget","DeptBugdetVer");
		budgetlast.set("year", Integer.parseInt(year)-1);
		budgetlast.set("quarter", "5");
		budgetlast.set("orgid", orgid);
		DatabaseUtil.expandEntityByTemplate("default", budgetlast, budgetlast);
		for(int i=0;i<=3;i++){
			commonj.sdo.DataObject aaa = commonj.sdo.helper.DataFactory.INSTANCE.create("com.primeton.eos.ame_budget.ame_budget","DeptBugdetVer");
			if(budget2[i]==null){
				budget2[i]  = aaa;
			}
			double salecost = budget1[i].getDouble("nquosalecost")+budget2[i].getDouble("totalfee");
			double currentcost = budget1[i].getDouble("comdshar")+budget1[i].getDouble("comashar")+budget1[i].getDouble("commshar")+salecost+budget1[i].getDouble("servcost")
			    	-budget1[i].getDouble("outstock1")+budget1[i].getDouble("instock1")+budget1[i].getDouble("baddebts")+budget1[i].getDouble("bustax");
			double profitBBonus = budget1[i].getDouble("ntaxincome")+budget1[i].getDouble("payback")+budget1[i].getDouble("servtax")-currentcost;
			double profitABonus = profitBBonus-budget1[i].getDouble("bonus");
			double cashflow = 0;
			if(i==0){
				cashflow = budget1[i].getDouble("receamt")+budget1[i].getDouble("payback")+budget1[i].getDouble("servtax")-currentcost-budget1[i].getDouble("taxincome")+budget1[i].getDouble("ntaxincome")-budgetlast.getDouble("bonus");
			}else{
				cashflow = budget1[i].getDouble("receamt")+budget1[i].getDouble("payback")+budget1[i].getDouble("servtax")-currentcost-budget1[i].getDouble("taxincome")+budget1[i].getDouble("ntaxincome");
			}	
			double deviation = cashflow-profitBBonus;
			budget1[i].setDouble("cashflow", cashflow);
			budget1[i].setDouble("deviation", deviation);
			budget1[i].setDouble("currentcost", currentcost);
			budget1[i].setDouble("profitABonus", profitABonus);
			budget1[i].setDouble("profitBBonus", profitBBonus);
			budget1[i].setDouble("salecost", salecost);
			budget1[i].setDouble("selfsalecost",budget2[i].getDouble("totalfee"));
		}
		return budget1;
	}
	
	/**
	 * @param budget1,budget2
	 * @return
	 * @author zhuhx
	 * @throws Throwable 
	 * @throws ParseException 
	 * @throws IOException 
	 * @throws BiffException 
	 * 汇总非额度销售费用数据带来的计算
	 */
	@Bizlet("")
	public DataObject[] calNqSaleData(DataObject[] budget1,DataObject[] budget2,String year,String orgid) throws Throwable {
		if(budget2.length==0){
			 budget2   =   new   DataObject[4];
		}
		commonj.sdo.DataObject budgetlast = commonj.sdo.helper.DataFactory.INSTANCE.create("com.primeton.eos.ame_budget.ame_budget","DeptBugdetVer");
		budgetlast.set("year", Integer.parseInt(year)-1);
		budgetlast.set("quarter", "5");
		budgetlast.set("orgid", orgid);
		DatabaseUtil.expandEntityByTemplate("default", budgetlast, budgetlast);
		for(int i=0;i<=3;i++){
			commonj.sdo.DataObject aaa = commonj.sdo.helper.DataFactory.INSTANCE.create("com.primeton.eos.ame_budget.ame_budget","DeptBugdetVer");
			if(budget2[i]==null){
				budget2[i]  = aaa;
			}
			double salecost = budget2[i].getDouble("totalfee")+budget1[i].getDouble("selfsalecost");
			double currentcost = budget1[i].getDouble("comdshar")+budget1[i].getDouble("comashar")+budget1[i].getDouble("commshar")+salecost+budget1[i].getDouble("servcost")
			    	-budget1[i].getDouble("outstock1")+budget1[i].getDouble("instock1")+budget1[i].getDouble("baddebts")+budget1[i].getDouble("bustax");
			double profitBBonus = budget1[i].getDouble("ntaxincome")+budget1[i].getDouble("payback")+budget1[i].getDouble("servtax")-currentcost;
			double profitABonus = profitBBonus-budget1[i].getDouble("bonus");
			double cashflow = 0;
			if(i==0){
				cashflow = budget1[i].getDouble("receamt")+budget1[i].getDouble("payback")+budget1[i].getDouble("servtax")-currentcost-budget1[i].getDouble("taxincome")+budget1[i].getDouble("ntaxincome")-budgetlast.getDouble("bonus");
			}else{
				cashflow = budget1[i].getDouble("receamt")+budget1[i].getDouble("payback")+budget1[i].getDouble("servtax")-currentcost-budget1[i].getDouble("taxincome")+budget1[i].getDouble("ntaxincome");
			}	
			double deviation = cashflow-profitBBonus;
			budget1[i].setDouble("cashflow", cashflow);
			budget1[i].setDouble("deviation", deviation);
			budget1[i].setDouble("currentcost", currentcost);
			budget1[i].setDouble("profitABonus", profitABonus);
			budget1[i].setDouble("profitBBonus", profitBBonus);
			budget1[i].setDouble("salecost", salecost);
			budget1[i].setDouble("nquosalecost",budget2[i].getDouble("totalfee"));
		}
		return budget1;
	}
	
	/**
	 * @param budget1,budget2
	 * @return
	 * @author zhuhx
	 * @throws Throwable 
	 * @throws ParseException 
	 * @throws IOException 
	 * @throws BiffException 
	 * 汇总服务成本数据带来的计算
	 */
	@Bizlet("")
	public DataObject[] calServData(DataObject[] budget1,DataObject[] budget2) throws Throwable {
		if(budget2.length==0){
			 budget2   =   new   DataObject[4];
		}
		for(int i=0;i<=3;i++){
			commonj.sdo.DataObject aaa = commonj.sdo.helper.DataFactory.INSTANCE.create("com.primeton.eos.ame_budget.ame_budget","DeptBugdetVer");
			if(budget2[i]==null){
				budget2[i]  = aaa;
			}
			double currentcost = budget1[i].getDouble("salecost")+budget2[i].getDouble("servcost")+budget1[i].getDouble("commshar")+budget1[i].getDouble("comdshar")+budget1[i].getDouble("comashar")+budget1[i].getDouble("deptdcost")+budget1[i].getDouble("deptmcost")-budget1[i].getDouble("outstock")+budget1[i].getDouble("instock")+budget1[i].getDouble("baddebts");
			double profitBBonus = budget1[i].getDouble("netincome")-currentcost+budget1[i].getDouble("payback")-budget1[i].getDouble("assetlose")-budget1[i].getDouble("servtax");
			double profitABonus = profitBBonus-budget1[i].getDouble("bonus");
			budget1[i].setDouble("currentcost", currentcost);
			budget1[i].setDouble("profitABonus", profitABonus);
			budget1[i].setDouble("profitBBonus", profitBBonus);
			budget1[i].setDouble("servcost",budget2[i].getDouble("servcost"));
		}
		return budget1;
	}
	
	/**
	 * @param budget1,budget2
	 * @return
	 * @author zhuhx
	 * @throws Throwable 
	 * @throws ParseException 
	 * @throws IOException 
	 * @throws BiffException 
	 * 汇总销售费用数据带来的计算
	 */
	@Bizlet("")
	public DataObject[] calSaleData(DataObject[] budget1,DataObject[] budget2) throws Throwable {
		if(budget2.length==0){
			 budget2   =   new   DataObject[4];
		}
		for(int i=0;i<=3;i++){
			commonj.sdo.DataObject aaa = commonj.sdo.helper.DataFactory.INSTANCE.create("com.primeton.eos.ame_budget.ame_budget","DeptBugdetVer");
			if(budget2[i]==null){
				budget2[i]  = aaa;
			}
			double currentcost = budget2[i].getDouble("salecost")+budget1[i].getDouble("servcost")+budget1[i].getDouble("commshar")+budget1[i].getDouble("comdshar")+budget1[i].getDouble("comashar")+budget1[i].getDouble("deptdcost")+budget1[i].getDouble("deptmcost")-budget1[i].getDouble("outstock")+budget1[i].getDouble("instock")+budget1[i].getDouble("baddebts");
			double profitBBonus = budget1[i].getDouble("netincome")-currentcost+budget1[i].getDouble("payback")-budget1[i].getDouble("assetlose")-budget1[i].getDouble("servtax");
			double profitABonus = profitBBonus-budget1[i].getDouble("bonus");
			budget1[i].setDouble("currentcost", currentcost);
			budget1[i].setDouble("profitABonus", profitABonus);
			budget1[i].setDouble("profitBBonus", profitBBonus);
			budget1[i].setDouble("salecost",budget2[i].getDouble("salecost"));
		}
		return budget1;
	}
	
	/**
	 * @param budget1,budget2
	 * @return
	 * @author zhuhx
	 * @throws Throwable 
	 * @throws ParseException 
	 * @throws IOException 
	 * @throws BiffException 
	 * 汇总管理费用数据带来的计算
	 */
	@Bizlet("")
	public DataObject[] calDeptmData(DataObject[] budget1,DataObject[] budget2) throws Throwable {
		if(budget2.length==0){
			 budget2   =   new   DataObject[4];
		}
		for(int i=0;i<=3;i++){
			commonj.sdo.DataObject aaa = commonj.sdo.helper.DataFactory.INSTANCE.create("com.primeton.eos.ame_budget.ame_budget","DeptBugdetVer");
			if(budget2[i]==null){
				budget2[i]  = aaa;
			}
			double currentcost = budget1[i].getDouble("salecost")+budget1[i].getDouble("servcost")+budget1[i].getDouble("commshar")+budget1[i].getDouble("comdshar")+budget1[i].getDouble("comashar")+budget1[i].getDouble("deptdcost")+budget2[i].getDouble("deptmcost")-budget1[i].getDouble("outstock")+budget1[i].getDouble("instock")+budget1[i].getDouble("baddebts");
			double profitBBonus = budget1[i].getDouble("netincome")-currentcost+budget1[i].getDouble("payback")-budget1[i].getDouble("assetlose")-budget1[i].getDouble("servtax");
			double profitABonus = profitBBonus-budget1[i].getDouble("bonus");
			budget1[i].setDouble("currentcost", currentcost);
			budget1[i].setDouble("profitABonus", profitABonus);
			budget1[i].setDouble("profitBBonus", profitBBonus);
			budget1[i].setDouble("deptmcost",budget2[i].getDouble("deptmcost"));
		}
		return budget1;
	}
	
	/**
	 * @param budget1,budget2
	 * @return
	 * @author zhuhx
	 * @throws Throwable 
	 * @throws ParseException 
	 * @throws IOException 
	 * @throws BiffException 
	 * 汇总资产减值损失数据带来的计算
	 */
	@Bizlet("")
	public DataObject[] calassetData(DataObject[] budget1,DataObject[] budget2) throws Throwable {
		if(budget2.length==0){
			 budget2   =   new   DataObject[4];
		}
		for(int i=0;i<=3;i++){
			commonj.sdo.DataObject aaa = commonj.sdo.helper.DataFactory.INSTANCE.create("com.primeton.eos.ame_budget.ame_budget","DeptBugdetVer");
			if(budget2[i]==null){
				budget2[i]  = aaa;
			}
			double profitBBonus = budget1[i].getDouble("ntaxincome")-budget1[i].getDouble("currentcost")+budget1[i].getDouble("payback")-budget2[i].getDouble("assetlose")+budget1[i].getDouble("servtax");
			double profitABonus = profitBBonus-budget1[i].getDouble("bonus");
			double cashflow = budget1[i].getDouble("receamt")+budget1[i].getDouble("payback")+budget1[i].getDouble("servtax")-budget1[i].getDouble("currentcost")-budget1[i].getDouble("taxincome")+budget1[i].getDouble("ntaxincome")-profitABonus*0.065;
			double deviation = cashflow-profitBBonus;
			budget1[i].setDouble("deviation", deviation);
			budget1[i].setDouble("cashflow", cashflow);
			budget1[i].setDouble("profitABonus", profitABonus);
			budget1[i].setDouble("profitBBonus", profitBBonus);
			budget1[i].setDouble("assetlose",budget2[i].getDouble("assetlose"));
		}
		return budget1;
	}
	
	/**
	 * @param budget1,budget2
	 * @return
	 * @author zhuhx
	 * @throws Throwable 
	 * @throws ParseException 
	 * @throws IOException 
	 * @throws BiffException 
	 * 汇总存货数据带来的计算
	 */
	@Bizlet("")
	public DataObject[] calstockData(DataObject[] budget1,DataObject[] budget2) throws Throwable {
		if(budget2.length==0){
			 budget2   =   new   DataObject[4];
		}
		for(int i=0;i<=3;i++){
			commonj.sdo.DataObject aaa = commonj.sdo.helper.DataFactory.INSTANCE.create("com.primeton.eos.ame_budget.ame_budget","DeptBugdetVer");
			if(budget2[i]==null){
				budget2[i]  = aaa;
			}
			double currentcost = budget1[i].getDouble("currentcost")-budget1[i].getDouble("instock")+budget1[i].getDouble("outstock")+budget2[i].getDouble("instock")-budget2[i].getDouble("outstock");
			double profitBBonus = budget1[i].getDouble("profitBBonus")-currentcost+budget1[i].getDouble("currentcost");
			double profitABonus = profitBBonus-budget1[i].getDouble("bonus");
			double cashflow = budget1[i].getDouble("receamt")+budget1[i].getDouble("payback")+budget1[i].getDouble("servtax")-budget1[i].getDouble("currentcost")-budget1[i].getDouble("taxincome")+budget1[i].getDouble("ntaxincome")-profitABonus*0.065;
			double deviation = budget1[i].getDouble("cashflow")-profitBBonus;
			budget1[i].setDouble("cashflow", cashflow);
			budget1[i].setDouble("deviation", deviation);
			budget1[i].setDouble("profitABonus", profitABonus);
			budget1[i].setDouble("profitBBonus", profitBBonus);
			budget1[i].setDouble("instock",budget2[i].getDouble("instock"));
			budget1[i].setDouble("outstock",budget2[i].getDouble("outstock"));
			budget1[i].setDouble("currentcost", currentcost);
		}
		return budget1;
	}
	
	/**
	 * @param budget1,budget2
	 * @return
	 * @author zhuhx
	 * @throws Throwable 
	 * @throws ParseException 
	 * @throws IOException 
	 * @throws BiffException 
	 * 汇总服务税抵扣数据带来的计算
	 */
	@Bizlet("")
	public DataObject[] calservtaxData(DataObject[] budget1,DataObject[] budget2,String year,String orgid) throws Throwable {
		if(budget2.length==0){
			 budget2   =   new   DataObject[4];
		}
		commonj.sdo.DataObject budgetlast = commonj.sdo.helper.DataFactory.INSTANCE.create("com.primeton.eos.ame_budget.ame_budget","DeptBugdetVer");
		budgetlast.set("year", Integer.parseInt(year)-1);
		budgetlast.set("quarter", "5");
		budgetlast.set("orgid", orgid);
		DatabaseUtil.expandEntityByTemplate("default", budgetlast, budgetlast);
		for(int i=0;i<=3;i++){
			commonj.sdo.DataObject aaa = commonj.sdo.helper.DataFactory.INSTANCE.create("com.primeton.eos.ame_budget.ame_budget","DeptBugdetVer");
			if(budget2[i]==null){
				budget2[i]  = aaa;
			}
			
			double profitBBonus = budget1[i].getDouble("ntaxincome")+budget1[i].getDouble("payback")+budget2[i].getDouble("servtax")-budget1[i].getDouble("currentcost");
			double profitABonus = profitBBonus-budget1[i].getDouble("bonus");
			double deviation = budget1[i].getDouble("cashflow")-profitBBonus;
			double cashflow = 0;
			if(i==0){
				cashflow = budget1[i].getDouble("receamt")+budget1[i].getDouble("payback")+budget2[i].getDouble("servtax")-budget1[i].getDouble("currentcost")-budget1[i].getDouble("taxincome")+budget1[i].getDouble("ntaxincome")-budgetlast.getDouble("bonus");
			}else{
				cashflow = budget1[i].getDouble("receamt")+budget1[i].getDouble("payback")+budget2[i].getDouble("servtax")-budget1[i].getDouble("currentcost")-budget1[i].getDouble("taxincome")+budget1[i].getDouble("ntaxincome");
			}	
			budget1[i].setDouble("deviation", deviation);
			budget1[i].setDouble("cashflow", cashflow);
			budget1[i].setDouble("profitABonus", profitABonus);
			budget1[i].setDouble("profitBBonus", profitBBonus);
			budget1[i].setDouble("servtax",budget2[i].getDouble("servtax"));
		}
		return budget1;
	}
	
	/**
	 * @param budget1,budget2
	 * @return
	 * @author zhuhx
	 * @throws Throwable 
	 * @throws ParseException 
	 * @throws IOException 
	 * @throws BiffException 
	 * 汇总坏账核销带来的计算
	 */
	@Bizlet("")
	public DataObject[] calbaddebtsData(DataObject[] budget1,DataObject[] budget2,String year,String orgid) throws Throwable {
		if(budget2.length==0){
			 budget2   =   new   DataObject[4];
		}
		commonj.sdo.DataObject budgetlast = commonj.sdo.helper.DataFactory.INSTANCE.create("com.primeton.eos.ame_budget.ame_budget","DeptBugdetVer");
		budgetlast.set("year", Integer.parseInt(year)-1);
		budgetlast.set("quarter", "5");
		budgetlast.set("orgid", orgid);
		DatabaseUtil.expandEntityByTemplate("default", budgetlast, budgetlast);
		for(int i=0;i<=3;i++){
			commonj.sdo.DataObject aaa = commonj.sdo.helper.DataFactory.INSTANCE.create("com.primeton.eos.ame_budget.ame_budget","DeptBugdetVer");
			if(budget2[i]==null){
				budget2[i]  = aaa;
			}
			double currentcost = budget1[i].getDouble("comdshar")+budget1[i].getDouble("comashar")+budget1[i].getDouble("commshar")+budget1[i].getDouble("salecost")+budget1[i].getDouble("servcost")
			    	-budget1[i].getDouble("outstock1")+budget1[i].getDouble("instock1")+budget2[i].getDouble("baddebts")+budget1[i].getDouble("bustax");
			double profitBBonus = budget1[i].getDouble("ntaxincome")+budget1[i].getDouble("payback")+budget1[i].getDouble("servtax")-currentcost;
			double profitABonus = profitBBonus-budget1[i].getDouble("bonus");
			double deviation = budget1[i].getDouble("cashflow")-profitBBonus;
			double cashflow = 0;
			if(i==0){
				cashflow = budget1[i].getDouble("receamt")+budget1[i].getDouble("payback")+budget1[i].getDouble("servtax")-budget1[i].getDouble("currentcost")-budget1[i].getDouble("taxincome")+budget1[i].getDouble("ntaxincome")-budgetlast.getDouble("bonus");
			}else{
				cashflow = budget1[i].getDouble("receamt")+budget1[i].getDouble("payback")+budget1[i].getDouble("servtax")-budget1[i].getDouble("currentcost")-budget1[i].getDouble("taxincome")+budget1[i].getDouble("ntaxincome");
			}	
			budget1[i].setDouble("cashflow", cashflow);
			budget1[i].setDouble("deviation", deviation);
			budget1[i].setDouble("profitABonus", profitABonus);
			budget1[i].setDouble("profitBBonus", profitBBonus);
			budget1[i].setDouble("baddebts",budget2[i].getDouble("baddebts"));
			budget1[i].setDouble("currentcost", currentcost);
		}
		return budget1;
	}
	
	/**
	 * @param budget1,budget2
	 * @return
	 * @author zhuhx
	 * @throws Throwable 
	 * @throws ParseException 
	 * @throws IOException 
	 * @throws BiffException 
	 * 汇总研发费用数据带来的计算
	 */
	@Bizlet("")
	public DataObject[] calDeptdData(DataObject[] budget1,DataObject[] budget2) throws Throwable {
		if(budget2.length==0){
			 budget2   =   new   DataObject[4];
		}
		for(int i=0;i<=3;i++){
			commonj.sdo.DataObject aaa = commonj.sdo.helper.DataFactory.INSTANCE.create("com.primeton.eos.ame_budget.ame_budget","DeptBugdetVer");
			if(budget2[i]==null){
				budget2[i]  = aaa;
			}
			double currentcost = budget1[i].getDouble("salecost")+budget1[i].getDouble("servcost")+budget1[i].getDouble("commshar")+budget1[i].getDouble("comdshar")+budget1[i].getDouble("comashar")+budget2[i].getDouble("deptdcost")+budget1[i].getDouble("deptmcost")-budget1[i].getDouble("outstock")+budget1[i].getDouble("instock")+budget1[i].getDouble("baddebts");
			double profitBBonus = budget1[i].getDouble("netincome")-currentcost+budget1[i].getDouble("payback")-budget1[i].getDouble("assetlose")-budget1[i].getDouble("servtax");
			double profitABonus = profitBBonus-budget1[i].getDouble("bonus");
			budget1[i].setDouble("currentcost", currentcost);
			budget1[i].setDouble("profitABonus", profitABonus);
			budget1[i].setDouble("profitBBonus", profitBBonus);
			budget1[i].setDouble("deptdcost",budget2[i].getDouble("deptdcost"));
		}
		return budget1;
	}
	/**
	 * @param budget1,budget2,temp
	 * @return
	 * @author zhuhx
	 * @throws Throwable 
	 * @throws ParseException 
	 * @throws IOException 
	 * @throws BiffException 
	 * 汇总公司成本数据带来的计算
	 */
	@Bizlet("")
	public DataObject[] calComData(DataObject[] budget1,DataObject[] budget2,String temp,String year,String orgid) throws Throwable {
		if(budget2.length==0){
			 budget2   =   new   DataObject[4];
		}
		commonj.sdo.DataObject budgetlast = commonj.sdo.helper.DataFactory.INSTANCE.create("com.primeton.eos.ame_budget.ame_budget","DeptBugdetVer");
		budgetlast.set("year", Integer.parseInt(year)-1);
		budgetlast.set("quarter", "5");
		budgetlast.set("orgid", orgid);
		DatabaseUtil.expandEntityByTemplate("default", budgetlast, budgetlast);
		for(int i=0;i<=3;i++){
			commonj.sdo.DataObject aaa = commonj.sdo.helper.DataFactory.INSTANCE.create("com.primeton.eos.ame_budget.ame_budget","DeptBugdetVer");
			if(budget2[i]==null){
				budget2[i]  = aaa;
			}
			double cashflow = 0;
				if("9".equals(temp)){
					double currentcost = budget1[i].getDouble("comdshar")+budget1[i].getDouble("comashar")+budget2[i].getDouble("totalfee")+budget1[i].getDouble("salecost")+budget1[i].getDouble("servcost")
					    	-budget1[i].getDouble("outstock1")+budget1[i].getDouble("instock1")+budget1[i].getDouble("baddebts")+budget1[i].getDouble("bustax");
					double profitBBonus = budget1[i].getDouble("ntaxincome")+budget1[i].getDouble("payback")+budget1[i].getDouble("servtax")-currentcost;
					double profitABonus = profitBBonus-budget1[i].getDouble("bonus");
					if(i==0){
						cashflow = budget1[i].getDouble("receamt")+budget1[i].getDouble("payback")+budget1[i].getDouble("servtax")-currentcost-budget1[i].getDouble("taxincome")+budget1[i].getDouble("ntaxincome")-budgetlast.getDouble("bonus");
					}else{
						cashflow = budget1[i].getDouble("receamt")+budget1[i].getDouble("payback")+budget1[i].getDouble("servtax")-currentcost-budget1[i].getDouble("taxincome")+budget1[i].getDouble("ntaxincome");
					}	
					double deviation = cashflow-profitBBonus;
					budget1[i].setDouble("cashflow", cashflow);
					budget1[i].setDouble("deviation", deviation);
					budget1[i].setDouble("currentcost", currentcost);
					budget1[i].setDouble("profitABonus", profitABonus);
					budget1[i].setDouble("profitBBonus", profitBBonus);
					budget1[i].setDouble("commshar",budget2[i].getDouble("totalfee"));
				}else if("10".equals(temp)){
					double currentcost = budget2[i].getDouble("totalfee")+budget1[i].getDouble("comashar")+budget1[i].getDouble("commshar")+budget1[i].getDouble("salecost")+budget1[i].getDouble("servcost")
					    	-budget1[i].getDouble("outstock1")+budget1[i].getDouble("instock1")+budget1[i].getDouble("baddebts")+budget1[i].getDouble("bustax");
					double profitBBonus = budget1[i].getDouble("ntaxincome")+budget1[i].getDouble("payback")+budget1[i].getDouble("servtax")-currentcost;
					double profitABonus = profitBBonus-budget1[i].getDouble("bonus");
					if(i==0){
						cashflow = budget1[i].getDouble("receamt")+budget1[i].getDouble("payback")+budget1[i].getDouble("servtax")-currentcost-budget1[i].getDouble("taxincome")+budget1[i].getDouble("ntaxincome")-budgetlast.getDouble("bonus");
					}else{
						cashflow = budget1[i].getDouble("receamt")+budget1[i].getDouble("payback")+budget1[i].getDouble("servtax")-currentcost-budget1[i].getDouble("taxincome")+budget1[i].getDouble("ntaxincome");
					}	
					double deviation = cashflow-profitBBonus;
					budget1[i].setDouble("cashflow", cashflow);
					budget1[i].setDouble("deviation", deviation);
					budget1[i].setDouble("currentcost", currentcost);
					budget1[i].setDouble("profitABonus", profitABonus);
					budget1[i].setDouble("profitBBonus", profitBBonus);
					budget1[i].setDouble("comdshar",budget2[i].getDouble("totalfee"));
				}else {
					double currentcost = budget1[i].getDouble("comdshar")+budget2[i].getDouble("totalfee")+budget1[i].getDouble("commshar")+budget1[i].getDouble("salecost")+budget1[i].getDouble("servcost")
					    	-budget1[i].getDouble("outstock1")+budget1[i].getDouble("instock1")+budget1[i].getDouble("baddebts")+budget1[i].getDouble("bustax");
					double profitBBonus = budget1[i].getDouble("ntaxincome")+budget1[i].getDouble("payback")+budget1[i].getDouble("servtax")-currentcost;
					double profitABonus = profitBBonus-budget1[i].getDouble("bonus");
					if(i==0){
						cashflow = budget1[i].getDouble("receamt")+budget1[i].getDouble("payback")+budget1[i].getDouble("servtax")-currentcost-budget1[i].getDouble("taxincome")+budget1[i].getDouble("ntaxincome")-budgetlast.getDouble("bonus");
					}else{
						cashflow = budget1[i].getDouble("receamt")+budget1[i].getDouble("payback")+budget1[i].getDouble("servtax")-currentcost-budget1[i].getDouble("taxincome")+budget1[i].getDouble("ntaxincome");
					}	
					double deviation = cashflow-profitBBonus;
					budget1[i].setDouble("cashflow", cashflow);
					budget1[i].setDouble("deviation", deviation);
					budget1[i].setDouble("currentcost", currentcost);
					budget1[i].setDouble("profitABonus", profitABonus);
					budget1[i].setDouble("profitBBonus", profitBBonus);
					budget1[i].setDouble("comashar",budget2[i].getDouble("totalfee"));
				}
			}
		return budget1;
	}
	
	/**
	 * @param budget1
	 * @return
	 * @author zhuhx
	 * @throws Throwable 
	 * @throws ParseException 
	 * @throws IOException 
	 * @throws BiffException 
	 * 汇总成本数据带来的计算（统一）
	 */
	@Bizlet("")
	public DataObject[] calComCost(DataObject[] budget1,String temp,String year,String orgid) throws Throwable {
		DecimalFormat df = new DecimalFormat("##.##");
		commonj.sdo.DataObject budgetlast = commonj.sdo.helper.DataFactory.INSTANCE.create("com.primeton.eos.ame_budget.ame_budget","DeptBugdetVer");
		budgetlast.set("year", Integer.parseInt(year)-1);
		budgetlast.set("quarter", "5");
		budgetlast.set("orgid", orgid);
		DatabaseUtil.expandEntityByTemplate("default", budgetlast, budgetlast);
		for(int i=0;i<=3;i++){
			double servcost = budget1[i].getDouble("selfservcost")+budget1[i].getDouble("pmsubfee")+budget1[i].getDouble("prosubfee")+budget1[i].getDouble("inoutfee");
			double salecost = budget1[i].getDouble("selfsalecost")+budget1[i].getDouble("nquosalecost");
			double currentcost = budget1[i].getDouble("comdshar")+budget1[i].getDouble("comashar")+budget1[i].getDouble("commshar")+salecost+servcost
			    	-budget1[i].getDouble("outstock")+budget1[i].getDouble("instock")+budget1[i].getDouble("baddebts")+budget1[i].getDouble("bustax");
			double profitBBonus = budget1[i].getDouble("profitBBonus")-currentcost+budget1[i].getDouble("currentcost");
			double profitABonus = profitBBonus-budget1[i].getDouble("bonus");
			double cashflow = 0 ;
			if(i==0){
				cashflow = budget1[i].getDouble("receamt")+budget1[i].getDouble("payback")+budget1[i].getDouble("servtax")-currentcost-budget1[i].getDouble("taxincome")+budget1[i].getDouble("ntaxincome")-budgetlast.getDouble("bonus");
			}else{
				cashflow = budget1[i].getDouble("receamt")+budget1[i].getDouble("payback")+budget1[i].getDouble("servtax")-currentcost-budget1[i].getDouble("taxincome")+budget1[i].getDouble("ntaxincome");
			}	
			double deviation = cashflow-profitBBonus;
			BigDecimal currentcost1 = new java.math.BigDecimal( df.format(currentcost) );
			BigDecimal profitABonus1 = new java.math.BigDecimal( df.format(profitABonus) );
			BigDecimal profitBBonus1 = new java.math.BigDecimal( df.format(profitBBonus) );
			BigDecimal servcost1 = new java.math.BigDecimal( df.format(servcost) );
			BigDecimal salecost1 = new java.math.BigDecimal( df.format(salecost) );
			BigDecimal deviation1 = new java.math.BigDecimal( df.format(deviation) );
			BigDecimal cashflow1 = new java.math.BigDecimal( df.format(cashflow) );
			budget1[i].setBigDecimal("currentcost", currentcost1);
			budget1[i].setBigDecimal("profitABonus", profitABonus1);
			budget1[i].setBigDecimal("profitBBonus", profitBBonus1);
			budget1[i].setBigDecimal("servcost", servcost1);
			budget1[i].setBigDecimal("salecost", salecost1);
			budget1[i].setBigDecimal("deviation", deviation1);
			budget1[i].setBigDecimal("cashflow", cashflow1);
			}
		return budget1;
	}
	
	/**
	 * @param budget
	 * @return
	 * @author zhuhx
	 * @throws Throwable 
	 * @throws ParseException 
	 * @throws IOException 
	 * @throws BiffException 
	 * 预算数据的汇总
	 */
	@Bizlet("")
	public DataObject sumBudData(DataObject[] budget1) throws Throwable {
		commonj.sdo.DataObject budget = commonj.sdo.helper.DataFactory.INSTANCE.create("com.primeton.eos.ame_budget.ame_budget","DeptBugdetVer");
		double contamt=0;
		double pcontamt=0;
		double scontamt=0;
		double mcontamt=0;
		double receamt=0;
		double taxincome=0;
		double ptaxincome=0;
		double staxincome=0;
		double mtaxincome=0;
		double ntaxincome=0;
		double pntaxincome=0;
		double sntaxincome=0;
		double mntaxincome=0;
		double bustax=0;
		double currentcost=0;
		double servcost=0;
		double deviation=0;
		double selfservcost=0;
		double pmsubfee=0;
		double prosubfee=0;
		double inoutfee=0;
		double selfsalecost=0;
		double nquosalecost=0;
		double wptotalfee=0;
		double cashflow=0;
		double salecost=0;
		double commshar=0;
		double comashar=0;
		double comdshar=0;
		double startfee=0;
		double bsfee=0;
		double rebate=0;
		double accounts=0;
		double baddebts=0;
		double assetlose=0;
		double instock=0;
		double outstock=0;
		double payback=0;
		double servtax=0;
		double bonus=0;
		double profitBBonus=0;
		double profitABonus=0;
		for(int i=0;i<budget1.length;i++){
			 contamt=budget1[i].getDouble("contamt")+contamt;
	    	 pcontamt=budget1[i].getDouble("pcontamt")+pcontamt;
	    	 scontamt=budget1[i].getDouble("scontamt")+scontamt;
	    	 mcontamt=budget1[i].getDouble("mcontamt")+mcontamt;
	    	 receamt=budget1[i].getDouble("receamt")+receamt;
	    	 taxincome=budget1[i].getDouble("taxincome")+taxincome;
	    	 ptaxincome=budget1[i].getDouble("ptaxincome")+ptaxincome;
	    	 staxincome=budget1[i].getDouble("staxincome")+staxincome;
	    	 mtaxincome=budget1[i].getDouble("mtaxincome")+mtaxincome;
	    	 ntaxincome=budget1[i].getDouble("ntaxincome")+ntaxincome;
	    	 pntaxincome=budget1[i].getDouble("pntaxincome")+pntaxincome;
	    	 sntaxincome=budget1[i].getDouble("sntaxincome")+sntaxincome;
	    	 mntaxincome=budget1[i].getDouble("mntaxincome")+mntaxincome;
	    	 bustax=budget1[i].getDouble("bustax")+bustax;
	    	 currentcost=budget1[i].getDouble("currentcost")+currentcost;
	    	 servcost=budget1[i].getDouble("servcost")+servcost;
	    	 selfservcost=budget1[i].getDouble("selfservcost")+selfservcost;
	    	 pmsubfee=budget1[i].getDouble("pmsubfee")+pmsubfee;
	    	 prosubfee=budget1[i].getDouble("prosubfee")+prosubfee;
	    	 inoutfee=budget1[i].getDouble("inoutfee")+inoutfee;
	    	 selfsalecost=budget1[i].getDouble("selfsalecost")+selfsalecost;
	    	 nquosalecost=budget1[i].getDouble("nquosalecost")+nquosalecost;
	    	 wptotalfee=budget1[i].getDouble("wptotalfee")+wptotalfee;
	    	 cashflow=budget1[i].getDouble("cashflow")+cashflow;
	    	 deviation=budget1[i].getDouble("deviation")+deviation;
	    	 salecost=budget1[i].getDouble("salecost")+salecost;
	    	 commshar=budget1[i].getDouble("commshar")+commshar;
	    	 comashar=budget1[i].getDouble("comashar")+comashar;
	    	 comdshar=budget1[i].getDouble("comdshar")+comdshar;
	    	 startfee=budget1[i].getDouble("startfee")+startfee;
	    	 bsfee=budget1[i].getDouble("bsfee")+bsfee;
	    	 rebate=budget1[i].getDouble("rebate")+rebate;
	    	 accounts=budget1[i].getDouble("accounts")+accounts;
	    	 baddebts=budget1[i].getDouble("baddebts")+baddebts;
	    	 assetlose=budget1[i].getDouble("assetlose")+assetlose;
	    	 instock=budget1[i].getDouble("instock")+instock;
	    	 outstock=budget1[i].getDouble("outstock")+outstock;
	    	 payback=budget1[i].getDouble("payback")+payback;
	    	 servtax=budget1[i].getDouble("servtax")+servtax;
	    	 bonus=budget1[i].getDouble("bonus")+bonus;
	    	 profitBBonus=budget1[i].getDouble("profitBBonus")+profitBBonus;
	    	 profitABonus=budget1[i].getDouble("profitABonus")+profitABonus;
		}
		budget.setDouble("contamt", contamt);
		budget.setDouble("pcontamt", pcontamt);
		budget.setDouble("scontamt", scontamt);
		budget.setDouble("mcontamt", mcontamt);
		budget.setDouble("receamt", receamt);
		budget.setDouble("taxincome", taxincome);
		budget.setDouble("ptaxincome", ptaxincome);
		budget.setDouble("staxincome", staxincome);
		budget.setDouble("mtaxincome", mtaxincome);
		budget.setDouble("ntaxincome", ntaxincome);
		budget.setDouble("pntaxincome", pntaxincome);
		budget.setDouble("sntaxincome", sntaxincome);
		budget.setDouble("mntaxincome", mntaxincome);
		budget.setDouble("bustax", bustax);
		budget.setDouble("currentcost", currentcost);
		budget.setDouble("servcost", servcost);
		budget.setDouble("selfservcost", selfservcost);
		budget.setDouble("pmsubfee", pmsubfee);
		budget.setDouble("prosubfee", prosubfee);
		budget.setDouble("inoutfee", inoutfee);
		budget.setDouble("selfsalecost", selfsalecost);
		budget.setDouble("nquosalecost", nquosalecost);
		budget.setDouble("wptotalfee", wptotalfee);
		budget.setDouble("cashflow", cashflow);
		budget.setDouble("deviation", deviation);
		budget.setDouble("salecost", salecost);
		budget.setDouble("commshar", commshar);
		budget.setDouble("comashar", comashar);
		budget.setDouble("comdshar", comdshar);
		budget.setDouble("startfee", startfee);
		budget.setDouble("bsfee", bsfee);
		budget.setDouble("rebate", rebate);
		budget.setDouble("accounts", accounts);
		budget.setDouble("baddebts", baddebts);
		budget.setDouble("assetlose", assetlose);
		budget.setDouble("instock", instock);
		budget.setDouble("outstock", outstock);
		budget.setDouble("payback", payback);
		budget.setDouble("servtax", servtax);
		budget.setDouble("bonus", bonus);
		budget.setDouble("profitBBonus", profitBBonus);
		budget.setDouble("profitABonus", profitABonus);
		return budget;
		
	}
	
	/**
	 * @param budget1,budget2
	 * @return
	 * @author zhuhx
	 * @throws Throwable 
	 * @throws ParseException 
	 * @throws IOException 
	 * @throws BiffException 
	 * 计算同比增长
	 */
	@Bizlet("")
	public DataObject calGrowth(DataObject budget1,DataObject budget2) throws Throwable {
		commonj.sdo.DataObject budget = commonj.sdo.helper.DataFactory.INSTANCE.create("com.primeton.eos.ame_budget.ame_budget","DeptBugdetVer");
		double contamt=0;
		double pcontamt=0;
		double scontamt=0;
		double mcontamt=0;
		double receamt=0;
		double taxincome=0;
		double ptaxincome=0;
		double staxincome=0;
		double mtaxincome=0;
		double ntaxincome=0;
		double pntaxincome=0;
		double sntaxincome=0;
		double mntaxincome=0;
		double bustax=0;
		double currentcost=0;
		double servcost=0;
		double deviation=0;
		double selfservcost=0;
		double pmsubfee=0;
		double prosubfee=0;
		double inoutfee=0;
		double selfsalecost=0;
		double nquosalecost=0;
		double wptotalfee=0;
		double cashflow=0;
		double salecost=0;
		double commshar=0;
		double comashar=0;
		double comdshar=0;
		double startfee=0;
		double bsfee=0;
		double rebate=0;
		double accounts=0;
		double baddebts=0;
		double assetlose=0;
		double instock=0;
		double outstock=0;
		double payback=0;
		double servtax=0;
		double bonus=0;
		double profitBBonus=0;
		double profitABonus=0;
		if(budget2.getDouble("contamt")!=0){
			 contamt=budget1.getDouble("contamt")/budget2.getDouble("contamt")-1;
		}
		if(budget2.getDouble("pcontamt")!=0){
			 pcontamt=budget1.getDouble("pcontamt")/budget2.getDouble("pcontamt")-1;
		}
		if(budget2.getDouble("scontamt")!=0){
			scontamt=budget1.getDouble("scontamt")/budget2.getDouble("scontamt")-1;
		}
		if(budget2.getDouble("mcontamt")!=0){
			mcontamt=budget1.getDouble("mcontamt")/budget2.getDouble("mcontamt")-1;
		}
		if(budget2.getDouble("receamt")!=0){
			receamt=budget1.getDouble("receamt")/budget2.getDouble("receamt")-1;
		}
		if(budget2.getDouble("taxincome")!=0){
			taxincome=budget1.getDouble("taxincome")/budget2.getDouble("taxincome")-1;
		}
		if(budget2.getDouble("ptaxincome")!=0){
			ptaxincome=budget1.getDouble("ptaxincome")/budget2.getDouble("ptaxincome")-1;
		}
		if(budget2.getDouble("staxincome")!=0){
			staxincome=budget1.getDouble("staxincome")/budget2.getDouble("staxincome")-1;
		}
		if(budget2.getDouble("mtaxincome")!=0){
			mtaxincome=budget1.getDouble("mtaxincome")/budget2.getDouble("mtaxincome")-1;
		}
		if(budget2.getDouble("ntaxincome")!=0){
			ntaxincome=budget1.getDouble("ntaxincome")/budget2.getDouble("ntaxincome")-1;
		}
		if(budget2.getDouble("pntaxincome")!=0){
			pntaxincome=budget1.getDouble("pntaxincome")/budget2.getDouble("pntaxincome")-1;
		}
		if(budget2.getDouble("sntaxincome")!=0){
			sntaxincome=budget1.getDouble("sntaxincome")/budget2.getDouble("sntaxincome")-1;
		}
		if(budget2.getDouble("mntaxincome")!=0){
			mntaxincome=budget1.getDouble("mntaxincome")/budget2.getDouble("mntaxincome")-1;
		}
		if(budget2.getDouble("bustax")!=0){
			bustax=budget1.getDouble("bustax")/budget2.getDouble("bustax")-1;
		}
		if(budget2.getDouble("currentcost")!=0){
			currentcost=budget1.getDouble("currentcost")/budget2.getDouble("currentcost")-1;
		}
		if(budget2.getDouble("servcost")!=0){
			servcost=budget1.getDouble("servcost")/budget2.getDouble("servcost")-1;
		}
		if(budget2.getDouble("selfservcost")!=0){
			selfservcost=budget1.getDouble("selfservcost")/budget2.getDouble("selfservcost")-1;
		}
		if(budget2.getDouble("pmsubfee")!=0){
			pmsubfee=budget1.getDouble("pmsubfee")/budget2.getDouble("pmsubfee")-1;
		}
		if(budget2.getDouble("prosubfee")!=0){
			prosubfee=budget1.getDouble("prosubfee")/budget2.getDouble("prosubfee")-1;
		}
		if(budget2.getDouble("inoutfee")!=0){
			inoutfee=budget1.getDouble("inoutfee")/budget2.getDouble("inoutfee")-1;
		}
		if(budget2.getDouble("selfsalecost")!=0){
			selfsalecost=budget1.getDouble("selfsalecost")/budget2.getDouble("selfsalecost")-1;
		}
		if(budget2.getDouble("nquosalecost")!=0){
			nquosalecost=budget1.getDouble("nquosalecost")/budget2.getDouble("nquosalecost")-1;
		}
		if(budget2.getDouble("wptotalfee")!=0){
			wptotalfee=budget1.getDouble("wptotalfee")/budget2.getDouble("wptotalfee")-1;
		}
		if(budget2.getDouble("cashflow")!=0){
			cashflow=budget1.getDouble("cashflow")/budget2.getDouble("cashflow")-1;
		}
		if(budget2.getDouble("deviation")!=0){
			deviation=budget1.getDouble("deviation")/budget2.getDouble("deviation")-1;
		}
		if(budget2.getDouble("salecost")!=0){
			salecost=budget1.getDouble("salecost")/budget2.getDouble("salecost")-1;
		}
		if(budget2.getDouble("commshar")!=0){
			commshar=budget1.getDouble("commshar")/budget2.getDouble("commshar")-1;
		}
		if(budget2.getDouble("comdshar")!=0){
			comdshar=budget1.getDouble("comdshar")/budget2.getDouble("comdshar")-1;
		}
		if(budget2.getDouble("startfee")!=0){
			startfee=budget1.getDouble("startfee")/budget2.getDouble("startfee")-1;
		}
		if(budget2.getDouble("bsfee")!=0){
			bsfee=budget1.getDouble("bsfee")/budget2.getDouble("bsfee")-1;
		}
		if(budget2.getDouble("rebate")!=0){
			rebate=budget1.getDouble("rebate")/budget2.getDouble("rebate")-1;
		}
		if(budget2.getDouble("accounts")!=0){
			accounts=budget1.getDouble("accounts")/budget2.getDouble("accounts")-1;
		}
		if(budget2.getDouble("comashar")!=0){
			comashar=budget1.getDouble("comashar")/budget2.getDouble("comashar")-1;
		}
		if(budget2.getDouble("baddebts")!=0){
			baddebts=budget1.getDouble("baddebts")/budget2.getDouble("baddebts")-1;
		}
		if(budget2.getDouble("assetlose")!=0){
			assetlose=budget1.getDouble("assetlose")/budget2.getDouble("assetlose")-1;
		}
		
		if(budget2.getDouble("instock")!=0){
			instock=budget1.getDouble("instock")/budget2.getDouble("instock")-1;
		}
		if(budget2.getDouble("outstock")!=0){
			outstock=budget1.getDouble("outstock")/budget2.getDouble("outstock")-1;
		}
		if(budget2.getDouble("payback")!=0){
			payback=budget1.getDouble("payback")/budget2.getDouble("payback")-1;
		}
		if(budget2.getDouble("servtax")!=0){
			servtax=budget1.getDouble("servtax")/budget2.getDouble("servtax")-1;
		}
		if(budget2.getDouble("bonus")!=0){
			bonus=budget1.getDouble("bonus")/budget2.getDouble("bonus")-1;
		}
		if(budget2.getDouble("profitBBonus")!=0){
			profitBBonus=budget1.getDouble("profitBBonus")/budget2.getDouble("profitBBonus")-1;
		}
		if(budget2.getDouble("profitABonus")!=0){
			profitABonus=budget1.getDouble("profitABonus")/budget2.getDouble("profitABonus")-1;
		}
		
		budget.setDouble("contamt", contamt);
		budget.setDouble("pcontamt", pcontamt);
		budget.setDouble("scontamt", scontamt);
		budget.setDouble("mcontamt", mcontamt);
		budget.setDouble("receamt", receamt);
		budget.setDouble("taxincome", taxincome);
		budget.setDouble("ptaxincome", ptaxincome);
		budget.setDouble("staxincome", staxincome);
		budget.setDouble("mtaxincome", mtaxincome);
		budget.setDouble("ntaxincome", ntaxincome);
		budget.setDouble("pntaxincome", pntaxincome);
		budget.setDouble("sntaxincome", sntaxincome);
		budget.setDouble("mntaxincome", mntaxincome);
		budget.setDouble("bustax", bustax);
		budget.setDouble("currentcost", currentcost);
		budget.setDouble("servcost", servcost);
		budget.setDouble("selfservcost", selfservcost);
		budget.setDouble("pmsubfee", pmsubfee);
		budget.setDouble("prosubfee", prosubfee);
		budget.setDouble("inoutfee", inoutfee);
		budget.setDouble("selfsalecost", selfsalecost);
		budget.setDouble("nquosalecost", nquosalecost);
		budget.setDouble("wptotalfee", wptotalfee);
		budget.setDouble("cashflow", cashflow);
		budget.setDouble("deviation", deviation);
		budget.setDouble("salecost", salecost);
		budget.setDouble("commshar", commshar);
		budget.setDouble("comashar", comashar);
		budget.setDouble("comdshar", comdshar);
		budget.setDouble("startfee", startfee);
		budget.setDouble("bsfee", bsfee);
		budget.setDouble("rebate", rebate);
		budget.setDouble("accounts", accounts);
		budget.setDouble("baddebts", baddebts);
		budget.setDouble("assetlose", assetlose);
		budget.setDouble("instock", instock);
		budget.setDouble("outstock", outstock);
		budget.setDouble("payback", payback);
		budget.setDouble("servtax", servtax);
		budget.setDouble("bonus", bonus);
		budget.setDouble("profitBBonus", profitBBonus);
		budget.setDouble("profitABonus", profitABonus);
		return budget;
		
	}
	
	/**
	 * @param budget1
	 * @return
	 * @author zhuhx
	 * @throws Throwable 
	 * @throws ParseException 
	 * @throws IOException 
	 * @throws BiffException 
	 * 设置父预算（用于预算锁定时循环计算子部门分摊数据）
	 */
	@Bizlet("")
	public HashMap setParBudget(DataObject[] budget,HashMap parbudget,String orgid) throws Throwable {
		if(parbudget != null){
			parbudget.put(orgid, budget);
		}else{
			parbudget = new HashMap();
			parbudget.put(orgid, budget);
		}
		return parbudget;
	}
	
	/**
	 * @param budget1
	 * @return
	 * @author zhuhx
	 * @throws Throwable 
	 * @throws ParseException 
	 * @throws IOException 
	 * @throws BiffException 
	 * 获取父预算（用于预算锁定时循环计算子部门分摊数据）
	 */
	@Bizlet("")
	public DataObject[] getParBudget(HashMap parbudget,String parentorgid) throws Throwable {
		DataObject[] budget = (DataObject[]) parbudget.get(parentorgid);
		return budget;
	}
	
}
