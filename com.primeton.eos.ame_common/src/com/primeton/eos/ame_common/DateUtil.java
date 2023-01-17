package com.primeton.eos.ame_common;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.Calendar;
import java.util.Date;

import com.eos.system.annotation.Bizlet;

public class DateUtil {
	
	/**
	 * 增加时间
	 * @param date 
	 * @param type Calendar.MINUTE=12 为分钟
	 * @param num 加多长时间
	 * @return
	 */
	@Bizlet("时间操作（增/减）")
	public static Date addDates(Date date,int type,String num){
		if(num==null||num.equals("")){
			num = "5";//默认为5分钟
		}
		int number = Integer.valueOf(num);
		return addDates(date,type,number);
	}
	
	
	/**
	 * 增加时间
	 * @param date
	 * @param type Calendar.MINUTE=12 为分钟
	 * @param num 加多长时间
	 * @return
	 */
	@Bizlet("时间操作（增/减）")
	public static Date addDates(Date date,int type,int num){
		Calendar rightNow = Calendar.getInstance();
		rightNow.setTime(date);
		//rightNow.add(Calendar.YEAR,-1);//日期减1年
		//rightNow.add(Calendar.MONTH,3);//日期加3个月
		//rightNow.add(Calendar.DAY_OF_YEAR,addDates);//日期加addDates天
		rightNow.add(type, num);
		return rightNow.getTime();
	}
	
	/**
	 * 
	 * @param ruleTime 格式如下   9:30 
	 * @param type  (1:上班,2:下班)与考勤详情(AME_ATTENDANCE_DETAIL)中 考勤类型(CLOCKTYPE)的值保持一致
	 * @return
	 */
	@Bizlet("校验是否迟到/早退")
	public static String check(String ruleTime,String type){
		Calendar cal = Calendar.getInstance();
		int hours =cal.get(Calendar.HOUR_OF_DAY);
		int min = cal.get(Calendar.MINUTE);
		String flag = "0";
		String[] hms = ruleTime.split(":");
		int hours_rule = Integer.parseInt(hms[0]);
		int min_rule = Integer.parseInt(hms[1]);
		if(type.equals("1")){//上班
			if(hours>hours_rule){
				flag ="1";//迟到
			}else if(hours_rule==hours){
				if(min>min_rule){
					flag ="1";//迟到
				}
			}
		}else{//下班
			if(hours_rule>hours){
				flag ="2";//迟到
			}else if(hours_rule==hours){
				if(min_rule>min){
					flag ="2";//迟到
				}
			}
			
		}	
		return flag;
	}
	
	/**
	 * 将传入的时间ruleTime，减去minute分钟
	 * @param ruleTime 格式：9:30
	 * @param minute  分钟数
	 * @return
	 */
	@Bizlet("转换时间")
	public static Calendar changeTime(String ruleTime,int minute){
		String[] hms = ruleTime.split(":");
		int hours_rule = Integer.parseInt(hms[0]);
		int min_rule = Integer.parseInt(hms[1]);
		
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.HOUR_OF_DAY, hours_rule);
		cal.set(Calendar.MINUTE, min_rule);
		cal.set(Calendar.MINUTE, cal.get(Calendar.MINUTE)-minute);
		return cal;
	}
	
	/**
	 * 将传入的时间，减去N分钟
	 * @param ruleTime 时间格式如：9:30
	 * @param minute 分钟数
	 * @return
	 */
	@Bizlet("转换时间")
	public static String[] changeTime(String ruleTime,String minute){
		int num = Integer.parseInt(minute);
		Calendar cal = changeTime(ruleTime,num);
		String hours = String.valueOf(cal.get(Calendar.HOUR_OF_DAY));
		String minutes = String.valueOf(cal.get(Calendar.MINUTE));
		String[] hms = {hours,minutes};
		return hms;
	}
	
	/**
	 * 计算当天的工时
	 * @param inDate
	 * @param outDate
	 * @return
	 */
	@Bizlet("计算总工时")
	public static double totailHours(Date inDate,Date outDate){
		BigDecimal change = new BigDecimal(3600000);
		BigDecimal times = new BigDecimal(outDate.getTime()-inDate.getTime());
		BigDecimal hours = times.divide(change,2,BigDecimal.ROUND_HALF_UP);
		return hours.doubleValue();
	}
	
	
	/**
	 * 获取今天星期几
	 * @param strDate
	 * @return
	 */
	@Bizlet("获取星期几")
	public static String getDayOfTheWeek(String strDate) {
	    String[][] strArray = {{"MONDAY", "一"}, {"TUESDAY", "二"}, {"WEDNESDAY", "三"}, {"THURSDAY", "四"}, {"FRIDAY", "五"}, {"SATURDAY", "六"}, {"SUNDAY", "日"}};
	    LocalDate date = LocalDate.parse(strDate);
	    String k = String.valueOf(date.getDayOfWeek());
	    //获取行数
	    for (int i = 0; i < strArray.length; i++) {
	        if (k.equals(strArray[i][0])) {
	            k = strArray[i][1];
	            break;
	        }
	    }
	    return "星期" + k;
	}
}
