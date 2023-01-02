/**
 * 
 */
package com.primeton.mis.newcont;


import java.math.BigDecimal;

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
public class incomeDeal {

	/**
	 * @param param
	 * @return
	 * @author HuangQinJin
	 */
	@Bizlet("")
	public static void incomeDeal(long contractid,String contnum,String lx,DataObject[] param) {
		// TODO 自动生成方法存根
		String[] incomename = {"income11","income121","income122","income123","income124","income131","income132","income133","income134","income141","income142","income143","income144","income151","income152","income153","income154","income16"};
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
					// TODO 自动生成 catch 块
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
		DatabaseExt.getPrimaryKey(income1);
		DatabaseExt.getPrimaryKey(income21);
		DatabaseExt.getPrimaryKey(income22);
		DatabaseExt.getPrimaryKey(income23);
		DatabaseExt.getPrimaryKey(income2);
		DatabaseExt.getPrimaryKey(income3);
		DatabaseExt.getPrimaryKey(income4);
		DatabaseExt.getPrimaryKey(income5);
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
		double sumscfyye = 0;
		double sumchye = 0;
		for(int i=0;i<incomename.length;i++){
			income1.set(incomename[i], new BigDecimal(param[0].getDouble(incomename[i])+param[1].getDouble(incomename[i])+param[2].getDouble(incomename[i])));
			income21.set(incomename[i], new BigDecimal(param[0].getDouble(incomename[i])/1.17));
			income22.set(incomename[i], new BigDecimal(param[1].getDouble(incomename[i])/1.06));
			income23.set(incomename[i], new BigDecimal(param[2].getDouble(incomename[i])/1.06));
			income2.set(incomename[i], new BigDecimal(income21.getDouble(incomename[i])+income22.getDouble(incomename[i])+income23.getDouble(incomename[i])));
			double scfyye = param[8].getDouble(incomename[i])+param[9].getDouble(incomename[i]);
			sumscfyye = sumscfyye + scfyye;
			sumchye = sumchye + scfyye - param[12].getDouble(incomename[i]);
			double prodincome = param[0].getDouble(incomename[i]);
			double servincome = param[1].getDouble(incomename[i]);
			if(servincome == 0){
				if(prodincome == 0){
					income3.set(incomename[i], new BigDecimal(sumscfyye));
					income5.set(incomename[i], new BigDecimal(sumchye));
					sumscfyye = sumchye;
				}else{
					if(lx != null && (lx.equals("产品+项目") || lx.equals("项目") || lx.equals("项目+MA"))){
						income3.set(incomename[i], new BigDecimal(sumscfyye));
						income4.set(incomename[i], new BigDecimal(0-sumscfyye));
						income5.set(incomename[i], new BigDecimal(0));
						sumscfyye = 0;
						sumchye = 0;
					}else{
						income3.set(incomename[i], new BigDecimal(sumscfyye));
						income5.set(incomename[i], new BigDecimal(sumchye));
						sumscfyye = sumchye;
					}
				}
			}else{
				income3.set(incomename[i], new BigDecimal(sumscfyye));
				income4.set(incomename[i], new BigDecimal(0-sumscfyye));
				income5.set(incomename[i], new BigDecimal(0));
				sumscfyye = 0;
				sumchye = 0;
			}
		};
		DatabaseUtil.insertEntity("default", income1);
		DatabaseUtil.insertEntity("default", income21);
		DatabaseUtil.insertEntity("default", income22);
		DatabaseUtil.insertEntity("default", income23);
		DatabaseUtil.insertEntity("default", income2);
		DatabaseUtil.insertEntity("default", income3);
		DatabaseUtil.insertEntity("default", income4);
		DatabaseUtil.insertEntity("default", income5);
	}

}
