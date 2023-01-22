/**
 * 
 */
package com.primeton.eos.machine;

import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import com.eos.system.annotation.Bizlet;

/**
 * @author Administrator
 * @date 2014-11-13 17:52:00
 *
 */
@Bizlet("")
public class getAmount {

	/**
	 * @param buyTime
	 * @param nowdate
	 * @param endTime
	 * @param scrapTime
	 * @param depreciableAmount
	 * @param status
	 * @return
	 * @author Administrator
	 */
	@Bizlet("")
	public static BigDecimal getCurrentDepreciableAmount(String buyTime,
			int year1,int month1, String scrapTime, BigDecimal depreciableAmount,
			short status) {
		int result1 = 0;
		int result2 = 0;
		int result3 = 0;
		BigDecimal currentDepreciableAmount = null;
		int year = Integer.parseInt(buyTime.substring(0, 4));
		int month = Integer.parseInt(buyTime.substring(5, 7));
		int currentYear = year1;
		int currentMonth = month1;
		result1 = currentYear * 12 + currentMonth;
		result3 = year * 12 + month;
		Boolean isScr = isScrap(status);
		if (isScr == true) {
			int scrapYear = Integer.parseInt(scrapTime.substring(0, 4));
			int scrapMonth = Integer.parseInt(scrapTime.substring(5, 7));
			result2 = scrapYear * 12 + scrapMonth;
			if (result1 > result2) {
				currentDepreciableAmount = new BigDecimal(0.00);
			}else if(result1 == result3){
				currentDepreciableAmount = new BigDecimal(0.00);
			}else {
				currentDepreciableAmount = depreciableAmount;
			}
		} else {
			if (result1 == result3) {
				currentDepreciableAmount = new BigDecimal(0.00);
			} else {
				currentDepreciableAmount = depreciableAmount;
			}
		}
		return currentDepreciableAmount;
	}

	/**
	 * @param nowdate
	 * @param endTime
	 * @param status
	 * @param net
	 * @return
	 * @author Administrator
	 */
	@Bizlet("")
	public static BigDecimal scrapDepreciableAmount(int year1,int month1,
			String scrapTime, short status, BigDecimal forzenNet) {
		BigDecimal scrapDepreciableAmount = null;
		Boolean isScr = isScrap(status);
		int result1 = 0;
		int result2 = 0;
		int currentYear = year1;
		int currentMonth = month1;
		result1 = currentYear * 12 + currentMonth;
		if (isScr == true) {
			int scrapYear = Integer.parseInt(scrapTime.substring(0, 4));
			int scrapMonth = Integer.parseInt(scrapTime.substring(5, 7));
			result2 = scrapYear * 12 + scrapMonth;
			if (result1 == result2) {
				scrapDepreciableAmount = forzenNet;
			} else {
				scrapDepreciableAmount = new BigDecimal(0.00);
			}
		} else {
			scrapDepreciableAmount = new BigDecimal(0.00);
		}
		return scrapDepreciableAmount;
	}

	/**
	 * @param nowdate 
	 * @param endTime 
	 * @param status 
	 * @param assetAmount 
	 * @param hasdepreciableAmount 
	 * @param hasdepreciable_amount 
	 * @param finTime 
	 * @param buyTime 
	 * @param scrapTime 
	 * @param depreciableAmount 
	 * @return
	 * @author Administrator
	 */

	@Bizlet("")
	public static BigDecimal[] getNet(int year1,int month1, String endTime,
			short status, BigDecimal assetAmount,
			BigDecimal hasdepreciableAmount, String buyTime, String scrapTime,
			BigDecimal depreciableAmount) {
		BigDecimal[] allnet = new BigDecimal[2];
		BigDecimal net = null;
		BigDecimal forzenNet = null;
		int result1 = 0;
		int result2 = 0;
		int currentYear = year1;
		int currentMonth = month1;
		result1 = currentYear * 12 + currentMonth;
		Boolean isScr = isScrap(status);
		if (isScr == true) {
			int scrapYear = Integer.parseInt(scrapTime.substring(0, 4));
			int scrapMonth = Integer.parseInt(scrapTime.substring(5, 7));
			result2 = scrapYear * 12 + scrapMonth;
			if (result1 < result2) {
				net = assetAmount.subtract(hasdepreciableAmount);
				forzenNet = new BigDecimal(0.00);
			} else if (result1 == result2) {
				net = assetAmount.subtract(hasdepreciableAmount);
				forzenNet = net;
				net = new BigDecimal(0.00);
			} else {
				net = new BigDecimal(0.00);
				int month = getMonth(buyTime, scrapTime);
				forzenNet = assetAmount.subtract(depreciableAmount
						.multiply(new BigDecimal(month)));
			}
		} else {
			net = assetAmount.subtract(hasdepreciableAmount);
			forzenNet = new BigDecimal(0.00);
		}
		allnet[0] = net;
		allnet[1] = forzenNet;
		return allnet;
	}

	/**
	 * @param buyTime
	 //	 * @param scrapTime
	 * @return
	 * @author Administrator
	 */
	@Bizlet("")
	public static int getMonth(String buyTime, String scrapTime) {
		int result = 0;
		int result1 = 0;
		int result2 = 0;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar c1 = Calendar.getInstance();
		Calendar c2 = Calendar.getInstance();
		try {
			c1.setTime(sdf.parse(buyTime));
			c2.setTime(sdf.parse(scrapTime));
		} catch (ParseException e) {
			// TODO 自动生成 catch 块
			e.printStackTrace();
		}
		result1 = c2.get(Calendar.YEAR) - c1.get(Calendar.YEAR);
		result2 = c2.get(Calendar.MONTH) - c1.get(Calendar.MONTH);
		if (result1 > 0) {
			result = result1 * 12 + result2;
		} else {
			result = result2;
		}
		return result;
	}

	/**
	 * @param status
	 * @return
	 * @author Administrator
	 */
	@Bizlet("")
	public static boolean isScrap(short status) {
		Boolean isScrap = false;
		if (status == 4) {
			isScrap = true;
		}
		return isScrap;
	}

}
