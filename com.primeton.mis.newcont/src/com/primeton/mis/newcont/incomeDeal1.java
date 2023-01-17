/**
 * 
 */
package com.primeton.mis.newcont;


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
public class incomeDeal1 {

	/**
	 * @param param
	 * @return
	 * @author HuangQinJin
	 */
	@Bizlet("")
	public static void incomeDeal(long contractid,String contnum,String lx,DataObject[] param) {
		// TODO �Զ���ɷ������
		String[] incomename = {"income1712","income16"};
		for(int i=0;i<param.length;i++){
			if(param[i].get("incomeid") == null && (param[i].get("incometype").equals("11") || param[i].get("incometype").equals("12") || param[i].get("incometype").equals("13") || param[i].get("incometype").equals("31") || param[i].get("incometype").equals("32") || param[i].get("incometype").equals("6"))){
				try {
					DataObject income = DataFactory.INSTANCE.create("com.primeton.mis.newcont.newCont", "NewCsIncome");
					DatabaseExt.getPrimaryKey(income);
					income.set("newCsContract/contractid", contractid);
					income.set("contnum",contnum);
					income.set("incometype", param[i].get("incometype"));
					for(int j=0;j<incomename.length;j++){
						income.set(incomename[j], new BigDecimal(0));
					};
					DatabaseUtil.insertEntity("default", income);
				} catch (Exception e) {
					// TODO �Զ���� catch ��
					e.printStackTrace();
				}
			}
		}
		DataObject income1 = DataFactory.INSTANCE.create("com.primeton.mis.newcont.newCont", "NewCsIncome");
		DataObject income21 = DataFactory.INSTANCE.create("com.primeton.mis.newcont.newCont", "NewCsIncome");
		DataObject income22 = DataFactory.INSTANCE.create("com.primeton.mis.newcont.newCont", "NewCsIncome");
		DataObject income23 = DataFactory.INSTANCE.create("com.primeton.mis.newcont.newCont", "NewCsIncome");
		DataObject income2 = DataFactory.INSTANCE.create("com.primeton.mis.newcont.newCont", "NewCsIncome");
		DataObject income3 = DataFactory.INSTANCE.create("com.primeton.mis.newcont.newCont", "NewCsIncome");
		DataObject income4 = DataFactory.INSTANCE.create("com.primeton.mis.newcont.newCont", "NewCsIncome");
		DataObject income5 = DataFactory.INSTANCE.create("com.primeton.mis.newcont.newCont", "NewCsIncome");
		if(param[3].get("incomeid") == null){
			DatabaseExt.getPrimaryKey(income1);
		}else{
			income1.setLong("incomeid", param[3].getInt("incomeid"));
		}
		if(param[4].get("incomeid") == null){
			DatabaseExt.getPrimaryKey(income21);
		}else{
			income21.setLong("incomeid", param[4].getInt("incomeid"));
		}
		if(param[5].get("incomeid") == null){
			DatabaseExt.getPrimaryKey(income22);
		}else{
			income22.setLong("incomeid", param[5].getInt("incomeid"));
		}
		if(param[6].get("incomeid") == null){
			DatabaseExt.getPrimaryKey(income23);
		}else{
			income23.setLong("incomeid", param[6].getInt("incomeid"));
		}
		if(param[7].get("incomeid") == null){
			DatabaseExt.getPrimaryKey(income2);
		}else{
			income2.setLong("incomeid", param[7].getInt("incomeid"));
		}
		if(param[10].get("incomeid") == null){
			DatabaseExt.getPrimaryKey(income3);
		}else{
			income3.setLong("incomeid", param[10].getInt("incomeid"));
			income3.set("income16", new BigDecimal(0));
		}
		if(param[11].get("incomeid") == null){
			DatabaseExt.getPrimaryKey(income4);
		}else{
			income4.setLong("incomeid", param[11].getInt("incomeid"));
			income4.set("income16", new BigDecimal(0));
		}
		if(param[13].get("incomeid") == null){
			DatabaseExt.getPrimaryKey(income5);
		}else{
			income5.setLong("incomeid", param[13].getInt("incomeid"));
			income5.set("income16", new BigDecimal(0));
		}
		income1.set("newCsContract/contractid", contractid);
		income1.set("contnum",contnum);
		income1.set("incometype", "1");
		income21.set("newCsContract/contractid", contractid);
		income21.set("contnum",contnum);
		income21.set("incometype", "21");
		income22.set("newCsContract/contractid", contractid);
		income22.set("contnum",contnum);
		income22.set("incometype", "22");
		income23.set("newCsContract/contractid", contractid);
		income23.set("contnum",contnum);
		income23.set("incometype", "23");
		income2.set("newCsContract/contractid", contractid);
		income2.set("contnum",contnum);
		income2.set("incometype", "2");
		income3.set("newCsContract/contractid", contractid);
		income3.set("contnum",contnum);
		income3.set("incometype", "3");
		income4.set("newCsContract/contractid", contractid);
		income4.set("contnum",contnum);
		income4.set("incometype", "4");
		income5.set("newCsContract/contractid", contractid);
		income5.set("contnum",contnum);
		income5.set("incometype", "5");
		double scfyye = 0;
		double sumscfyye = param[13].getDouble("income1711");
		double sumchye = param[13].getDouble("income1711");
		Object[] listConv = DatabaseExt.queryByNamedSql("default", "com.primeton.mis.newcont.contractApply.getIncomesByContractid", contractid);
		DecimalFormat df = new DecimalFormat("0.00");
		for(int i=0;i<incomename.length;i++){
			income1.set(incomename[i], new BigDecimal(df.format(new BigDecimal(param[0].getDouble(incomename[i])+param[1].getDouble(incomename[i])+param[2].getDouble(incomename[i])))));
			income21.set(incomename[i], new BigDecimal(df.format(new BigDecimal(param[0].getDouble(incomename[i])/1.17))));
			income22.set(incomename[i], new BigDecimal(df.format(new BigDecimal(param[1].getDouble(incomename[i])/1.06))));
			income23.set(incomename[i], new BigDecimal(df.format(new BigDecimal(param[2].getDouble(incomename[i])/1.06))));
			income2.set(incomename[i], new BigDecimal(df.format(new BigDecimal(income21.getDouble(incomename[i])+income22.getDouble(incomename[i])+income23.getDouble(incomename[i])))));
			scfyye = param[8].getDouble(incomename[i])+param[9].getDouble(incomename[i]);
			sumscfyye = sumscfyye + scfyye;
			sumchye = sumchye + scfyye - param[12].getDouble(incomename[i]);
			double prodincome = param[0].getDouble(incomename[i]);
			double servincome = param[1].getDouble(incomename[i]);
			boolean isCanJZ = false;
			String quarter = null;
			if(incomename[i].equals("income1712")){
				quarter = "201712";
			}else if(incomename[i].equals("income16")){
				quarter = "2018";
			}
			for(int j=0;j<listConv.length;j++){
				DataObject conv = (DataObject) listConv[j];
				if(quarter.equals(conv.getString("YEARMONTH"))){
					isCanJZ = true;
				}
			}
			if(isCanJZ == true){
				income3.set(incomename[i], new BigDecimal(df.format(new BigDecimal(sumscfyye))));
				income4.set(incomename[i], new BigDecimal(df.format(new BigDecimal(0-sumscfyye))));
				income5.set(incomename[i], new BigDecimal(0));
				sumscfyye = 0;
				sumchye = 0;
			}else{
				income3.set(incomename[i], new BigDecimal(df.format(new BigDecimal(sumscfyye))));
				income4.set(incomename[i], new BigDecimal(0));
				income5.set(incomename[i], new BigDecimal(df.format(new BigDecimal(sumchye))));
				sumscfyye = sumchye;
			}
		};
		//DatabaseUtil.saveEntity("default", income1);
		//DatabaseUtil.saveEntity("default", income21);
		//DatabaseUtil.saveEntity("default", income22);
		//DatabaseUtil.saveEntity("default", income23);
		//DatabaseUtil.saveEntity("default", income2);
		DatabaseUtil.saveEntity("default", income3);
		DatabaseUtil.saveEntity("default", income4);
		DatabaseUtil.saveEntity("default", income5);
	}

}
