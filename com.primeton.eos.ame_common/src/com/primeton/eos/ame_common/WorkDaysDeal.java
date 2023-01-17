/**
 * 
 */
package com.primeton.eos.ame_common;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.poi.ss.usermodel.DateUtil;

import com.eos.foundation.database.DatabaseExt;
import com.eos.foundation.database.DatabaseUtil;
import com.eos.system.annotation.Bizlet;
import com.primeton.components.scriptengine.model.DataContext;
import com.primeton.ext.system.utility.ReflectUtil;
import com.raqsoft.expression.function.math.Hash;

import commonj.sdo.DataObject;
import commonj.sdo.helper.DataFactory;

/**
 * @author zyl
 * @date 2016-07-14 17:05:09
 *
 */
@Bizlet("")
public class WorkDaysDeal {

	/**
	 * @param startDate
	 * @param endDate
	 * @return
	 * @author zyl
	 */
	@Bizlet("")
	public static int getWorkDays(Date startDate, Date endDate) {
		// TODO 自动生成的方法存根
		int totalWorkDays = 0;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar calendar = Calendar.getInstance();
		while (!startDate.after(endDate)) {
        	calendar.setTime(startDate);
        	DataObject misIsworkday = DataFactory.INSTANCE.create("com.primeton.eos.common.newdataset","MisIsworkday");
        	misIsworkday.setDate("moddate",startDate);
        	int count = DatabaseUtil.expandEntityByTemplate("default", misIsworkday, misIsworkday);
        	//如果未在是否工作日表中查到数据,就判断是否是周末,不是周末就是工作日
        	if(count == 0){
        		if(!(calendar.get(Calendar.DAY_OF_WEEK) == 1 || calendar.get(Calendar.DAY_OF_WEEK) == 7)){
        			totalWorkDays ++;
        		}
        	}else{	//如果在是否工作日表中查到数据,就判断值是否为y,为y就是工作日
        		String isworkday = misIsworkday.getString("isworkday");
				if (isworkday.equals("y")){
					totalWorkDays++;
				}
        	}
            startDate = getNext(startDate);
        }
		return totalWorkDays;
	}
	
	/**
	 * 判断这个日期是否是工作日
	 * @param date
	 * @return
	 */
	@Bizlet("isWorkDay")
	public boolean isWorkDay(Date date){
		boolean flag = false;
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		DataObject misIsworkday = DataFactory.INSTANCE.create("com.primeton.eos.common.newdataset","MisIsworkday");
    	misIsworkday.setDate("moddate",date);
    	int count = DatabaseUtil.expandEntityByTemplate("default", misIsworkday, misIsworkday);
    	//如果未在是否工作日表中查到数据,就判断是否是周末,不是周末就是工作日
    	if(count == 0){
    		if(!(calendar.get(Calendar.DAY_OF_WEEK) == 1 || calendar.get(Calendar.DAY_OF_WEEK) == 7)){
    			flag = true;
    		}
    	}else{	//如果在是否工作日表中查到数据,就判断值是否为y,为y就是工作日
    		String isworkday = misIsworkday.getString("isworkday");
			if (isworkday.equals("y")){
				flag = true;
			}
    	}
		return flag;
	}
	
	/**
	 * 判断这个日期是否是法定节假日
	 * @param date
	 * @return
	 */
	@Bizlet("isHoliday")
	public boolean isHoliday(Date date){
		boolean flag = true;
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		DataObject misIsworkday = DataFactory.INSTANCE.create("com.primeton.eos.common.newdataset","MisIsworkday");
    	misIsworkday.setDate("moddate",date);
    	int count = DatabaseUtil.expandEntityByTemplate("default", misIsworkday, misIsworkday);
    	//如果在是否工作日表中查到数据,就判断值是否为y,为y就是工作日
		String isworkday = misIsworkday.getString("isworkday");
		if(count==0){
			flag = false;
		}else{
			if (isworkday.equals("y")){
				flag = false;
			}
		}
		return flag;
	}
	
	/**  
     * 计算两个日期之间的工作日（先计算出两个日期之间除去周六周日的所有的天数，再加上是否工作日表中对应是工作日的天数减去对应非工作日的天数） 
     * @param begDate 较小的时间 
     * @param endDate  较大的时间 
     * @return 工作日天数 
     * @throws ParseException 
     * @author zhuhx 
     */  
	@Bizlet("")
	public int getWorkDaysnew (Date begDate, Date endDate) throws Exception {
		// TODO 自动生成的方法存根
		if (begDate.after(endDate))
            throw new Exception("日期范围非法");
        // 总天数
        int days = (int) ((endDate.getTime() - begDate.getTime()) / (24 * 60 * 60 * 1000)) + 1;
        // 总周数，
        int weeks = days / 7;
        //除去周六周日的总天数
        int rs = 0;
        // 整数周
        if (days % 7 == 0) {
            rs = days - 2 * weeks;
        }
        else {
            Calendar begCalendar = Calendar.getInstance();
            Calendar endCalendar = Calendar.getInstance();
            begCalendar.setTime(begDate);
            endCalendar.setTime(endDate);
            // 周日为1，周六为7
            int beg = begCalendar.get(Calendar.DAY_OF_WEEK);
            int end = endCalendar.get(Calendar.DAY_OF_WEEK);
            if (beg > end) {
                rs = days - 2 * (weeks + 1);
            } else if (beg < end) {
                if ((end != 7 && beg == 1)||(end == 7 && beg != 1)) {
                    rs = days - 2 * weeks - 1;
                } else {
                    rs = days - 2 * weeks;
                }
            } else {
                if (beg == 1 || beg == 7) {
                    rs = days - 2 * weeks - 1;
                } else {
                    rs = days - 2 * weeks;
                }
            }
        }
        //节假日表中所有的非工作日
       String startdate= com.eos.foundation.common.utils.DateUtil.format(begDate, "yyyy-MM-dd");
       String endDate1= com.eos.foundation.common.utils.DateUtil.format(endDate, "yyyy-MM-dd");
        HashMap param = new HashMap();
        param.put("isworkday", "n");
        param.put("begDate", startdate);
        param.put("endDate", endDate1);
        Object[] list = DatabaseExt.queryByNamedSql("default", "com.primeton.eos.ame_budget.getPropl.selectIsworkday", param);
        DataObject result = (DataObject) list[0];
        int count1=result.getInt("count1");
        //节假日表中所有的工作日
        param.put("isworkday", "y");
        Object[] list1 = DatabaseExt.queryByNamedSql("default", "com.primeton.eos.ame_budget.getPropl.selectIsworkday", param);
        DataObject result1 = (DataObject) list1[0];
        int count2=result1.getInt("count1");
		return rs-count1+count2;
	}
	
	/**  
     * 计算两个日期之间的工作日（计算两个日期之间除去法定节假日的天数） 
     * @param begDate 较小的时间 
     * @param endDate  较大的时间 
     * @return 工作日天数 
     * @throws ParseException 
     * @author zhuhx 
     */  
	@Bizlet("")
	public int getDaysnh (Date begDate, Date endDate) throws Exception {
		// TODO 自动生成的方法存根
		if (begDate.after(endDate))
            throw new Exception("日期范围非法");
        // 总天数
        int days = (int) ((endDate.getTime() - begDate.getTime()) / (24 * 60 * 60 * 1000)) + 1;
        //节假日表中所有的非工作日
       String startdate= com.eos.foundation.common.utils.DateUtil.format(begDate, "yyyy-MM-dd");
       String endDate1= com.eos.foundation.common.utils.DateUtil.format(endDate, "yyyy-MM-dd");
        HashMap param = new HashMap();
        param.put("isworkday", "n");
        param.put("begDate", startdate);
        param.put("endDate", endDate1);
        Object[] list = DatabaseExt.queryByNamedSql("default", "com.primeton.eos.ame_budget.getPropl.selectIsworkday", param);
        DataObject result = (DataObject) list[0];
        int count1=result.getInt("count1");
        //节假日表中所有的工作日
        param.put("isworkday", "y");
        Object[] list1 = DatabaseExt.queryByNamedSql("default", "com.primeton.eos.ame_budget.getPropl.selectIsworkday", param);
        DataObject result1 = (DataObject) list1[0];
        int count2=result1.getInt("count1");
		return days-count1+count2;
	}
	
	/**  
     * 计算两个日期之间相差的天数  
     * @param smdate 较小的时间 
     * @param bdate  较大的时间 
     * @return 相差天数 
     * @throws ParseException  
     */  
	@Bizlet("")
    public static int daysBetween(Date startDate,Date endDate) throws ParseException    
    {    
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");  
        startDate=sdf.parse(sdf.format(startDate));  
        endDate=sdf.parse(sdf.format(endDate));  
        Calendar cal = Calendar.getInstance();    
        cal.setTime(startDate);    
        long time1 = cal.getTimeInMillis();                 
        cal.setTime(endDate);    
        long time2 = cal.getTimeInMillis();         
        long between_days=(time2-time1)/(1000*3600*24);  
            
       return Integer.parseInt(String.valueOf(between_days))+1;           
    }    
      
	private static Date getNext(Date date) { 
        Calendar calendar = Calendar.getInstance(); 
        calendar.setTime(date); 
        calendar.add(Calendar.DATE, 1); 
        return calendar.getTime(); 
    }
	public static int getDutyDays(Date startDate,Date endDate) {
		int result = 0; 
		Date s =  ReflectUtil.deepClone(startDate);
		try {
			commonj.sdo.DataObject misIsworkday = commonj.sdo.helper.DataFactory.INSTANCE.create("com.primeton.csoms.report.Csaccept","MisIsworkday");
			while (s.before(endDate) || s.equals(endDate)) {
				misIsworkday.setDate("moddate",s);
				int count = DatabaseUtil.expandEntityByTemplate("default", misIsworkday, misIsworkday);
				if(count == 0){
					if (s.getDay() != 6 && s.getDay() != 0){ 
						result++;
					}
				} else {
					String isworkday = misIsworkday.getString("isworkday");
					if (isworkday.equals("y")){
						result++;
					}
				}
				s.setDate(s.getDate() + 1); 
			}
		} catch (Exception e) {
			// TODO: handle exception
			
		}
		return result; 
	}
	
	/**
	 * 获取当前时间上个月的工作日天数
	 * @param date
	 * @return
	 * @throws ParseException
	 */
	@Bizlet("")
	public static int getAfterMonthWordDays(Date date) throws ParseException{
		Map<String, Date> map = getFirstday_Lastday_Month(date);
        Date afterMonthDayDate = map.get("lastYMD");
		Date monthStart = getMonthStart(afterMonthDayDate); 
        Date monthEnd = getMonthEnd(afterMonthDayDate); 
        int workDays = getWorkDays(monthStart, monthEnd);
        return workDays;
	}
	
	/**
	 * 获取上个月的第一天和最后一天
	 * @param date
	 * @return
	 * @throws ParseException 
	 */
	@Bizlet("")
	public static Map<String, Date> getFirstday_Lastday_Month(Date date) throws ParseException {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        calendar.add(Calendar.MONTH, -1);
        Date theDate = calendar.getTime();
        
        //上个月第一天
        GregorianCalendar gcLast = (GregorianCalendar) Calendar.getInstance();
        gcLast.setTime(theDate);
        gcLast.set(Calendar.DAY_OF_MONTH, 1);
        String day_first = df.format(gcLast.getTime());
        Date day_first_yMd = df.parse(day_first);

        //上个月最后一天
        calendar.add(Calendar.MONTH, 1);    //加一个月
        calendar.set(Calendar.DATE, 1);        //设置为该月第一天
        calendar.add(Calendar.DATE, -1);    //再减一天即为上个月最后一天
        String day_last = df.format(calendar.getTime());
        Date day_last_yMd = df.parse(day_last);

        Map<String, Date> map = new HashMap<String, Date>();
        map.put("firstYMD", day_first_yMd);
        map.put("lastYMD", day_last_yMd);
        return map;
    }
	
	private static Date getMonthStart(Date date) { 
        Calendar calendar = Calendar.getInstance(); 
        calendar.setTime(date); 
        int index = calendar.get(Calendar.DAY_OF_MONTH); 
        calendar.add(Calendar.DATE, (1 - index)); 
        return calendar.getTime(); 
    } 
	
	/**
	 * 获取当前日期所在月的最后一天的日期
	 * @param date
	 * @return
	 */
	@Bizlet("获取当月的最后一天")
	public static Date getMonthEnd(Date date) { 
        Calendar calendar = Calendar.getInstance(); 
        calendar.setTime(date); 
        calendar.add(Calendar.MONTH, 1); 
        int index = calendar.get(Calendar.DAY_OF_MONTH); 
        calendar.add(Calendar.DATE, (-index)); 
        return calendar.getTime(); 
    }
    
    /**
     * 获取当前日期的月初和月末
     * @param year
     * @param month
     * @param day
     * @return
     * @throws ParseException
     */
    @Bizlet("")
    public static Map<String, Date> getFirstday_Lastday_Month_Now(String year,String month,String day) throws ParseException {
		String temp;
		if(day.isEmpty()){
			temp = year + "-" + month + "-01";
		}else{
			temp = year + "-" + month + "-" + day;
		}
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		Date tempDate = df.parse(temp);
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(tempDate);
        calendar.add(Calendar.MONTH, 0);
        Date theDate = calendar.getTime();
        
        //本月第一天
        GregorianCalendar gcLast = (GregorianCalendar) Calendar.getInstance();
        gcLast.setTime(theDate);
        gcLast.set(Calendar.DAY_OF_MONTH, 1);
        String day_first = df.format(gcLast.getTime());
        Date day_first_yMd = df.parse(day_first);

        //本月最后一天
        calendar.add(Calendar.MONTH, 1);  
        calendar.set(Calendar.DAY_OF_MONTH, 0);
        String day_last = df.format(calendar.getTime());
        Date day_last_yMd = df.parse(day_last);

        Map<String, Date> map = new HashMap<String, Date>();
        map.put("firstYMD", day_first_yMd);
        map.put("lastYMD", day_last_yMd);
        return map;
    }
    /**
     * 给定一个日期，获取当前日期的月初和月末,并计算改月的工作日的天数
     * @param date1
     * @return
     * @throws Exception 
     */
    @Bizlet("")
    public static int getMonthdays(Date date1) throws Exception {
    	Calendar now = Calendar.getInstance(); 
    	now.setTime(date1);
    	now.set(Calendar.DAY_OF_MONTH, now.getActualMinimum(Calendar.DAY_OF_MONTH));
    	Date monthstart=now.getTime();//当前月的月初
    	now.set(Calendar.DAY_OF_MONTH, now.getActualMaximum(Calendar.DAY_OF_MONTH));
    	Date monthend = now.getTime();//当前月的月末
        int workDays = new WorkDaysDeal().getWorkDaysnew(monthstart, monthend);
        return workDays;
    }
    
    /**
     * 计算传入日期的某几天前或者几天后的日期。
     * @param date
     * @return
     */
    @Bizlet("")
    public static Date getRealDay(Date date,int days){
    	Calendar now = Calendar.getInstance();  
    	now.setTime(date);  
        now.set(Calendar.DATE, now.get(Calendar.DATE) + days); 
        Date realDate= now.getTime();
    	return realDate;
    }
    
    /**
     * 获取传入日期的前一天的日期。
     * @param date
     * @return
     */
    @Bizlet("")
    public static Date getBeforeDay(Date date){
    	Calendar now = Calendar.getInstance();  
    	now.setTime(date);  
        now.set(Calendar.DATE, now.get(Calendar.DATE) - 1); 
        Date beforeDate= now.getTime();
    	return beforeDate;
    }
    
    /**
	 * @param 
	 * @return
	 * @author 姚毅
	 * 获取当前年份并转成字符串
	 */
	@Bizlet("")
	public static String getYear()  {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy"); 
        Date date = new Date(); 
        String formatDate = sdf.format(date); 
		return formatDate;
	}
	
	/**
	 * @param 
	 * @return
	 * @author 孟月月
	 * 返回某个时间段的所有日期
	 */
	@Bizlet("findDates")
	public static List<Date> findDates(Date begin, Date end) {
		List<Date> lDate = new ArrayList<Date>();
        lDate.add(begin);
        Calendar calBegin = Calendar.getInstance();
        calBegin.setTime(begin);
        Calendar calEnd = Calendar.getInstance();
        calEnd.setTime(end);
        while (end.after(calBegin.getTime())) {
            calBegin.add(Calendar.DAY_OF_MONTH, 1);
            lDate.add(calBegin.getTime());
        }
        return lDate;
    }
	
	/**
	 * @param 当前时间
	 * @return MAP集合 before 上个年月 after 下个年月 now 当前年月
	 * @author 姚毅
	 * 返回某个时间的上个年月,当前年月,下一个年月
	 */
	@Bizlet("getYearMonth")
	public static Map<String, String> getYearMonth(Date date) {
		SimpleDateFormat dft = new SimpleDateFormat("yyyyMM");
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		//当前年月
        String now = dft.format(c.getTime());
        //上个年月
        c.setTime(date);
        c.add(Calendar.MONTH, -1);
        String before = dft.format(c.getTime());
        //下个年月
        c.setTime(date);
        c.add(Calendar.MONTH, 1);
        String after = dft.format(c.getTime());
        //下下个年月
        c.setTime(date);
        c.add(Calendar.MONTH, 2);
        String afters = dft.format(c.getTime());
        //放入集合
        Map<String,String> map = new HashMap<String, String>();
        map.put("now", now);
        map.put("before", before);
        map.put("after", after);
        map.put("afters", afters);
        return map;
    }
	
}
