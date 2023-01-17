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
public class incomeDeal2 {

	/**
	 * @param param
	 * @return
	 * @author HuangQinJin
	 */
	@Bizlet("")
	public static void incomeDeal(long contractid,String contnum,String lx,DataObject[] param) {
		// TODO �Զ���ɷ������
		String[] incomename = {"income161","income162","income163","income164","income16"};
		for(int i=0;i<param.length;i++){
			if(param[i].get("incomeid") == null && (param[i].get("incometype").equals("11") || param[i].get("incometype").equals("12") || param[i].get("incometype").equals("13"))){
				try {
					DataObject income = DataFactory.INSTANCE.create("com.primeton.mis.newcont.newCont", "NewCsIncome");
					DatabaseExt.getPrimaryKey(income);
					income.set("newCsContract/contractid", contractid);
					income.set("contnum",contnum);
					income.set("incometype", param[i].get("incometype"));
					income.set("income11", new BigDecimal(0));
					income.set("income121", new BigDecimal(0));
					income.set("income122", new BigDecimal(0));
					income.set("income123", new BigDecimal(0));
					income.set("income124", new BigDecimal(0));
					income.set("income131", new BigDecimal(0));
					income.set("income132", new BigDecimal(0));
					income.set("income133", new BigDecimal(0));
					income.set("income134", new BigDecimal(0));
					income.set("income141", new BigDecimal(0));
					income.set("income142", new BigDecimal(0));
					income.set("income143", new BigDecimal(0));
					income.set("income144", new BigDecimal(0));
					income.set("income151", new BigDecimal(0));
					income.set("income152", new BigDecimal(0));
					income.set("income153", new BigDecimal(0));
					income.set("income154", new BigDecimal(0));
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
		if(param[3].get("incomeid") == null){
			DatabaseExt.getPrimaryKey(income1);
		}else{
			income1 = param[3];
		}
		if(param[4].get("incomeid") == null){
			DatabaseExt.getPrimaryKey(income21);
		}else{
			income21 = param[4];
		}
		if(param[5].get("incomeid") == null){
			DatabaseExt.getPrimaryKey(income22);
		}else{
			income22 = param[5];
		}
		if(param[6].get("incomeid") == null){
			DatabaseExt.getPrimaryKey(income23);
		}else{
			income23 = param[6];
		}
		if(param[7].get("incomeid") == null){
			DatabaseExt.getPrimaryKey(income2);
		}else{
			income2 = param[7];
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
		DecimalFormat df = new DecimalFormat("0.00");
		for(int i=0;i<incomename.length;i++){
			income1.set(incomename[i], new BigDecimal(df.format(new BigDecimal(param[0].getDouble(incomename[i])+param[1].getDouble(incomename[i])+param[2].getDouble(incomename[i])))));
			income21.set(incomename[i], new BigDecimal(df.format(new BigDecimal(param[0].getDouble(incomename[i])/1.17))));
			income22.set(incomename[i], new BigDecimal(df.format(new BigDecimal(param[1].getDouble(incomename[i])/1.06))));
			income23.set(incomename[i], new BigDecimal(df.format(new BigDecimal(param[2].getDouble(incomename[i])/1.06))));
			income2.set(incomename[i], new BigDecimal(df.format(new BigDecimal(income21.getDouble(incomename[i])+income22.getDouble(incomename[i])+income23.getDouble(incomename[i])))));
		}
		DatabaseUtil.saveEntity("default", income1);
		DatabaseUtil.saveEntity("default", income21);
		DatabaseUtil.saveEntity("default", income22);
		DatabaseUtil.saveEntity("default", income23);
		DatabaseUtil.saveEntity("default", income2);
	}

}
