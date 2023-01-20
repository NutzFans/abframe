/**
 * 
 */
package com.primeton.eos.machine;

import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.GregorianCalendar;

import com.eos.system.annotation.Bizlet;

/**
 * @author Administrator
 * @date 2014-10-20 15:19:34
 * 
 */
@Bizlet("")
public class getDate {
	@Bizlet("")
	public static String getEndTime(String buyTime, Integer depreciableTime) {
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		Date d = null;
		try {
			d = sf.parse(buyTime);
		} catch (ParseException e) {
			// TODO 自动生成 catch 块
			e.printStackTrace();
		}
		GregorianCalendar gc = new GregorianCalendar();
		gc.setTime(d);
		gc.add(2,depreciableTime);
		return sf.format(gc.getTime());
	}

	/**
	 * @param status 
	 * @param scrapTime 
	 * @param nowdate 
	 * @param buyTime 
	 * @param param
	 * @return
	 */
	@Bizlet("")
	public static int getMonth(String buyTime, int year1, int month1,
			String scrapTime, Short status) {
		int result = 0;
		int result1 = 0;
		int result2 = 0;
		int result3 = 0;
		int year = Integer.parseInt(buyTime.substring(0, 4));
		int month = Integer.parseInt(buyTime.substring(5, 7));
		int currentYear = year1;
		int currentMonth = month1;
		result1 = currentYear * 12 + currentMonth;
		result3 = year * 12 + month;
		if (status == 4) {
			int scrapYear = Integer.parseInt(scrapTime.substring(0, 4));
			int scrapMonth = Integer.parseInt(scrapTime.substring(5, 7));
			result2 = scrapYear * 12 + scrapMonth;
			if (result1 >= result2) {
				result = result2 - result3;
			} else {
				result = result1 - result3;
			}
		} else {
			result = result1 - result3;
		}
		return result;
	}

	/**
	 * @param date
	 * @param endtime
	 * @return
	 */
	@Bizlet("")
	public static int checkEndTime(int year1, int month1, String endtime) {
		// TODO 自动生成方法存根
		int result = 0;
		int result1 = 0;
		int result2 = 0;
		int currentYear = year1;
		int currentMonth = month1;
		int endYear = Integer.parseInt(endtime.substring(0, 4));
		int endMonth = Integer.parseInt(endtime.substring(5, 7));
		result1 = currentYear * 12 + currentMonth;
		result2 = endYear * 12 + endMonth;
		if (result1 > result2) {
			result = 1;
		}
		return result;
	}

	/**
	 * @param date
	 * @return
	 */
	@Bizlet("")
	public static int[] getYearAndMonth(String date) {
		int[] current=new int[2];
		int year = Integer.parseInt(date.substring(0, 4));
		int month = Integer.parseInt(date.substring(5, 7));
		current[0] = year;
		current[1] = month;
		return current;
	}
}
