/**
 * 
 */
package com.zhonghe.ame.payment;

import org.apache.commons.lang.StringUtils;

import com.eos.foundation.data.DataObjectUtil;
import com.eos.foundation.database.DatabaseExt;
import com.eos.foundation.database.DatabaseUtil;
import com.eos.system.annotation.Bizlet;
import com.ibm.icu.math.BigDecimal;
import com.ibm.icu.text.DecimalFormat;

import commonj.sdo.DataObject;

/**
 * @author huangqj
 * @date 2022-10-28 15:09:09
 *
 */
@Bizlet("")
public class PayMentBean {
	
	public static final String CONTRACTID = "contract_id";
	public static final String  DEFAULT = "default";
	public static DecimalFormat fnum = new DecimalFormat("##0.0000000000000000"); 
	
	
	@Bizlet("")
	public String queryPaid(DataObject[] yfs,String contractNo){
		String paidSum = "";
		String valueStr = "0.00";
		BigDecimal yf = new BigDecimal(valueStr);
		BigDecimal add = null;
		String sum = null;
		for (int i = 0; i < yfs.length; i++) {
			DataObject dataObject = yfs[i];
			sum = (String) dataObject.get("apply_pay_contract_sum");
			BigDecimal yfj = new BigDecimal(sum);
			add = yf.add(yfj);
			yf = add;
		}
		if (add == null) {
			paidSum = "0.00";
		}else {
			paidSum = String.valueOf(add);
		}
		return paidSum;
	}
	@Bizlet("")
	public String contractBalance(String contractSum,String paidSum){
		DecimalFormat dFormat = new DecimalFormat("0.00");
		double c = Double.parseDouble(contractSum);
		double d = Double.parseDouble(paidSum);
		String contractBalance = dFormat.format( c - d);
		return contractBalance;
	}
	
	public static boolean isNullOrEmpty(String str) {
		return StringUtils.isEmpty(str) || StringUtils.isBlank(str);
	}
}
