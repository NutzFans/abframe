/**
 * 
 */
package com.primeton.eos.ame_income;


import java.math.BigDecimal;
import java.text.DecimalFormat;

import com.eos.foundation.database.DatabaseExt;
import com.eos.foundation.database.DatabaseUtil;
import com.eos.system.annotation.Bizlet;

import commonj.sdo.DataObject;
import commonj.sdo.helper.DataFactory;

/**
 * @author HuangQinJin
 * @date 2015-12-30 11:18:18
 *
 */
@Bizlet("")
public class incomeCostDeal {

	/**
	 * @param param
	 * @return
	 * @author HuangQinJin
	 */
	@Bizlet("")
	public static void incomeCostDeal(DataObject[] param) {
		DecimalFormat df = new DecimalFormat("0.00");
		double scfyRgSum = 0;
		double scfyWbSum = 0;
		double stockJzAll = 0;
		for(int i=0;i<param.length;i++){
			try {
				DataObject contStock = DataFactory.INSTANCE.create("com.primeton.eos.ame_income.contCost", "CsContStock");
				contStock.set("contnum", param[i].get("CONTNUM"));
				contStock.set("finyear", param[i].get("FINYEAR"));
				contStock.set("finmonth", param[i].get("FINMONTH"));
				contStock.set("incomeProd", df.format(new BigDecimal(param[i].getDouble("INCOME_PROD"))));
				contStock.set("incomeServ", df.format(new BigDecimal(param[i].getDouble("INCOME_SERV"))));
				contStock.set("incomeMa", df.format(new BigDecimal(param[i].getDouble("INCOME_MA"))));
				contStock.set("income", df.format(new BigDecimal(param[i].getDouble("INCOME"))));
				contStock.set("incomeProdNet", df.format(new BigDecimal(param[i].getDouble("INCOME_PROD_NET"))));
				contStock.set("incomeServNet", df.format(new BigDecimal(param[i].getDouble("INCOME_SERV_NET"))));
				contStock.set("incomeMaNet", df.format(new BigDecimal(param[i].getDouble("INCOME_MA_NET"))));
				contStock.set("incomeNet", df.format(new BigDecimal(param[i].getDouble("INCOME_NET"))));
				contStock.set("scfyRg", df.format(new BigDecimal(param[i].getDouble("SCFY_RG"))));
				contStock.set("scfyWb", df.format(new BigDecimal(param[i].getDouble("SCFY_WB"))));
				contStock.set("scfyBx", df.format(new BigDecimal(param[i].getDouble("SCFY_BX"))));
				contStock.set("scfy", df.format(new BigDecimal(param[i].getDouble("SCFY"))));
				scfyRgSum = scfyRgSum + param[i].getDouble("SCFY_RG");
				scfyWbSum = scfyWbSum + param[i].getDouble("SCFY_WB");
				stockJzAll = stockJzAll + param[i].getDouble("STOCK_JZ");
				if(param[i].getDouble("CBJZ") != 0 && param[i].getDouble("STOCK_NET") == 0){
					contStock.set("cbjzRg", new BigDecimal(df.format(new BigDecimal(0-scfyRgSum))));
					contStock.set("cbjzWb", new BigDecimal(df.format(new BigDecimal(0-scfyWbSum))));
					contStock.set("stockRg", df.format(new BigDecimal(param[i].getDouble("STOCK_RG"))));
					contStock.set("stockWb", df.format(new BigDecimal(param[i].getDouble("STOCK_WB"))));
					scfyRgSum = 0;
					scfyWbSum = 0;
				}else if(param[i].getDouble("CBJZ") != 0 && param[i].getDouble("STOCK_NET") != 0){
					contStock.set("cbjzRg", new BigDecimal(df.format(new BigDecimal(0-scfyRgSum+param[i].getDouble("STOCK_NET")))));
					contStock.set("cbjzWb", new BigDecimal(df.format(new BigDecimal(0-scfyWbSum))));
					contStock.set("stockRg", df.format(new BigDecimal(param[i].getDouble("STOCK_RG")+param[i].getDouble("STOCK_NET"))));
					contStock.set("stockWb", df.format(new BigDecimal(param[i].getDouble("STOCK_WB"))));
					scfyRgSum = param[i].getDouble("STOCK_NET");
					scfyWbSum = 0;
				}else{
					contStock.set("cbjzRg", df.format(new BigDecimal(param[i].getDouble("CBJZ_RG"))));
					contStock.set("cbjzWb", df.format(new BigDecimal(param[i].getDouble("CBJZ_WB"))));
					contStock.set("stockRg", new BigDecimal(df.format(new BigDecimal(scfyRgSum))));
					contStock.set("stockWb", new BigDecimal(df.format(new BigDecimal(scfyWbSum))));
				}
				contStock.set("cbjzBx", df.format(new BigDecimal(param[i].getDouble("CBJZ_BX"))));
				contStock.set("cbjz", df.format(new BigDecimal(param[i].getDouble("CBJZ"))));
				contStock.set("stockBx", df.format(new BigDecimal(param[i].getDouble("STOCK_BX"))));
				contStock.set("stock", df.format(new BigDecimal(param[i].getDouble("STOCK_NET")+stockJzAll)));
				contStock.set("stockJz", df.format(new BigDecimal(param[i].getDouble("STOCK_JZ"))));
				contStock.set("stockJzAll", new BigDecimal(df.format(new BigDecimal(stockJzAll))));
				contStock.set("stockNet", df.format(new BigDecimal(param[i].getDouble("STOCK_NET"))));
				contStock.set("memo", "20170213_财务核算反转");
				contStock.set("status", "0");
				DatabaseUtil.insertEntity("default", contStock);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * @param param
	 * @return
	 * @author HuangQinJin
	 */
	@Bizlet("")
	public static void incomeCostDeal1(DataObject[] param) {
		DecimalFormat df = new DecimalFormat("0.00");
		double scfyRgSum = 0;
		double scfyWbSum = 0;
		double stockJzAll = 0;
		for(int i=0;i<param.length;i++){
			try {
				DataObject contStock = DataFactory.INSTANCE.create("com.primeton.eos.ame_income.contCost", "CsContStock");
				contStock.set("contnum", param[i].get("CONTNUM"));
				contStock.set("finyear", param[i].get("FINYEAR"));
				contStock.set("finmonth", param[i].get("FINMONTH"));
				contStock.set("incomeProd", df.format(new BigDecimal(param[i].getDouble("INCOME_PROD"))));
				contStock.set("incomeServ", df.format(new BigDecimal(param[i].getDouble("INCOME_SERV"))));
				contStock.set("incomeMa", df.format(new BigDecimal(param[i].getDouble("INCOME_MA"))));
				contStock.set("income", df.format(new BigDecimal(param[i].getDouble("INCOME"))));
				contStock.set("incomeProdNet", df.format(new BigDecimal(param[i].getDouble("INCOME_PROD_NET"))));
				contStock.set("incomeServNet", df.format(new BigDecimal(param[i].getDouble("INCOME_SERV_NET"))));
				contStock.set("incomeMaNet", df.format(new BigDecimal(param[i].getDouble("INCOME_MA_NET"))));
				contStock.set("incomeNet", df.format(new BigDecimal(param[i].getDouble("INCOME_NET"))));
				contStock.set("scfyRg", df.format(new BigDecimal(param[i].getDouble("SCFY_RG"))));
				contStock.set("scfyWb", df.format(new BigDecimal(param[i].getDouble("SCFY_WB"))));
				contStock.set("scfyBx", df.format(new BigDecimal(param[i].getDouble("SCFY_BX"))));
				contStock.set("scfy", df.format(new BigDecimal(param[i].getDouble("SCFY"))));
				if(i==0){
					scfyRgSum = scfyRgSum + param[i].getDouble("STOCK_RG");
					scfyWbSum = scfyWbSum + param[i].getDouble("STOCK_WB");
				}else{
					scfyRgSum = scfyRgSum + param[i].getDouble("SCFY_RG");
					scfyWbSum = scfyWbSum + param[i].getDouble("SCFY_WB");
				}
				stockJzAll = stockJzAll + param[i].getDouble("STOCK_JZ_ALL");
				if(param[i].getDouble("CBJZ") != 0 && param[i].getDouble("STOCK_NET") == 0){
					contStock.set("cbjzRg", new BigDecimal(df.format(new BigDecimal(0-scfyRgSum))));
					contStock.set("cbjzWb", new BigDecimal(df.format(new BigDecimal(0-scfyWbSum))));
					contStock.set("stockRg", df.format(new BigDecimal(param[i].getDouble("STOCK_RG"))));
					contStock.set("stockWb", df.format(new BigDecimal(param[i].getDouble("STOCK_WB"))));
					scfyRgSum = 0;
					scfyWbSum = 0;
				}else if(param[i].getDouble("CBJZ") != 0 && param[i].getDouble("STOCK_NET") != 0 && param[i].getString("FLAG").equals("0")){
					contStock.set("cbjzRg", new BigDecimal(df.format(new BigDecimal(0-scfyRgSum+param[i].getDouble("STOCK_NET")))));
					contStock.set("cbjzWb", new BigDecimal(df.format(new BigDecimal(0-scfyWbSum))));
					contStock.set("stockRg", df.format(new BigDecimal(param[i].getDouble("STOCK_RG")+param[i].getDouble("STOCK_NET"))));
					contStock.set("stockWb", df.format(new BigDecimal(param[i].getDouble("STOCK_WB"))));
					scfyRgSum = param[i].getDouble("STOCK_NET");
					scfyWbSum = 0;
				}else if(param[i].getDouble("CBJZ") != 0 && param[i].getDouble("STOCK_NET") != 0 && param[i].getString("FLAG").equals("1")){
					contStock.set("cbjzRg", new BigDecimal(df.format(new BigDecimal(0-scfyRgSum))));
					contStock.set("cbjzWb", new BigDecimal(df.format(new BigDecimal(0-scfyWbSum))));
					contStock.set("stockRg", df.format(new BigDecimal(param[i].getDouble("STOCK_RG"))));
					contStock.set("stockWb", df.format(new BigDecimal(param[i].getDouble("STOCK_WB"))));
					scfyRgSum = param[i].getDouble("STOCK_RG");
					scfyWbSum = param[i].getDouble("STOCK_WB");
				}else{
					contStock.set("cbjzRg", df.format(new BigDecimal(param[i].getDouble("CBJZ_RG"))));
					contStock.set("cbjzWb", df.format(new BigDecimal(param[i].getDouble("CBJZ_WB"))));
					contStock.set("stockRg", new BigDecimal(df.format(new BigDecimal(scfyRgSum))));
					contStock.set("stockWb", new BigDecimal(df.format(new BigDecimal(scfyWbSum))));
				}
				contStock.set("cbjzBx", df.format(new BigDecimal(param[i].getDouble("CBJZ_BX"))));
				contStock.set("cbjz", df.format(new BigDecimal(param[i].getDouble("CBJZ"))));
				contStock.set("stockBx", df.format(new BigDecimal(param[i].getDouble("STOCK_BX"))));
				contStock.set("stock", df.format(new BigDecimal(param[i].getDouble("STOCK_NET")+stockJzAll)));
				contStock.set("stockJz", df.format(new BigDecimal(param[i].getDouble("STOCK_JZ"))));
				contStock.set("stockJzAll", new BigDecimal(df.format(new BigDecimal(stockJzAll))));
				contStock.set("stockNet", df.format(new BigDecimal(param[i].getDouble("STOCK_NET"))));
				contStock.set("memo", "20180116_财务核算反转");
				contStock.set("status", "0");
				if(i != 0){
					DatabaseUtil.insertEntity("default", contStock);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}
