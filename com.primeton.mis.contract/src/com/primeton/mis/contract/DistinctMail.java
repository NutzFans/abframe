/**
 * 
 */
package com.primeton.mis.contract;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.util.HashSet;
import java.util.Iterator;

import com.eos.system.annotation.Bizlet;

/**
 * @author Administrator
 * @date 2015-01-07 10:48:16
 *
 */
@Bizlet("distinctMail")
public class DistinctMail {

	/**
	 * @param emailInfo
	 * @return
	 * @author Administrator
	 */
	@Bizlet("")
	public static String getDistinctMail(String emailInfo) {
		// TODO �Զ���ɷ������
		String aa = "";
		String aaArray[] = emailInfo.split(",");
		HashSet<String> hs = new HashSet<String>();
		for (String s : aaArray) {
			hs.add(s);
		}
		Iterator<String> it = hs.iterator();
		if (it.hasNext()) {
			aa = hs.toString().concat(",").replace("[","").replace("]","");
		}
		aa = aa.substring(0, aa.length()-1);
		return aa;
	}
	
	@Bizlet("")
	public static String formatMon(BigDecimal mon) {
		DecimalFormat df =new DecimalFormat("##,##0.00");
		String aa = df.format(mon);
		return aa;
	}
}
