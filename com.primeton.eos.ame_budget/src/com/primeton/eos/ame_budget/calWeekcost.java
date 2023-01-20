/**
 * 
 */
package com.primeton.eos.ame_budget;



import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;

import com.eos.engine.component.ILogicComponent;
import com.eos.foundation.database.DatabaseExt;
import com.eos.foundation.database.DatabaseUtil;
import com.eos.system.annotation.Bizlet;
import com.primeton.eos.ame_common.WorkDaysDeal;
import com.primeton.ext.engine.component.LogicComponentFactory;

import commonj.sdo.DataObject;

/**
 * @author zhuhx
 * @date 2016-07-27 14:27:04
 *
 */
public class calWeekcost {

	/**
	 * @param startdate
	 * @return
	 * @author zhuhx
	 * @throws Throwable 
	 * @throws ParseException 
	 * @throws IOException 
	 * @throws BiffException 
	 */
	@Bizlet("")
	public static String calWeekcost(Date budstartdate,Date budenddate,Date startdate,Date findate,String projectid,int pdircosts,int pcusltfee,String projectno,double pcosts) throws Throwable {
		Calendar cal = Calendar.getInstance();
		cal.setTime(startdate);
		int startyear=cal.get(Calendar.YEAR);//项目开始日期的年份
		int week1 = cal.get(Calendar.DAY_OF_WEEK);//开始日期对应星期几
		cal.setTime(findate);
		int week2 = cal.get(Calendar.DAY_OF_WEEK);//当前结束日期对应的星期数
		int day1=9-week1;//开始日期对应下周一相差的天数
		int day2=0;//结束日期对应上周日相差的天数
		if(week2==1){
			 day2=7;
		}else {
			 day2=week2-1;
		}
		Calendar now = Calendar.getInstance();  
        now.setTime(startdate);  
        now.set(Calendar.DATE, now.get(Calendar.DATE) + day1);  
        Date begdate= now.getTime();//开始日期下周一的日期  
        now.setTime(findate);  
        now.set(Calendar.DATE, now.get(Calendar.DATE) - day2);  
        Date enddate= now.getTime();
        now.setTime(begdate);//结束日期上周日的日期
        long time1 = now.getTimeInMillis();
        now.setTime(enddate);
        long time2 = now.getTimeInMillis();
        long between_days=(time2-time1)/(1000*3600*24);
        int days=Integer.parseInt(String.valueOf(between_days))+1;//新的开始日期与结束日期相差的天数
        int weeks=days/7;//新的开始日期与结束日期总的周次
        //按周做循环
        Date date1=null;//周开始日期
    	Date date2=null;//周结束日期
    	Date nowdate=new Date();//当前日期
    	now.setTime(nowdate);
    	now.set(Calendar.DAY_OF_MONTH, now.getActualMinimum(Calendar.DAY_OF_MONTH));
    	Date monthstart=now.getTime();//当前月的月初
    	double tobucost = 0;
    	double tocost =0;
    	double antocost=0;
    	int y=0;
		int totalworkdays=new WorkDaysDeal().getWorkDaysnew(startdate,findate);//总的工作日
		int budtotalworkdays= 0;
		if(budstartdate != null &&budenddate!= null ){
			budtotalworkdays=new WorkDaysDeal().getWorkDaysnew(budstartdate,budenddate);//总的预算工作日
		}
    	commonj.sdo.DataObject[] pexecut = new DataObject[weeks+2];
    	for(int i=0;i<=weeks+1;i++){
        	if(i==0){
        		date1=startdate;
        		now.setTime(begdate);  
                now.set(Calendar.DATE, now.get(Calendar.DATE) - 1);  
                date2= now.getTime();  
        	}else if(i==1){
        		date1=begdate; 
                now.set(Calendar.DATE, now.get(Calendar.DATE) + 7);
        		date2=now.getTime();
        	}else if(i==weeks+1){
    			now.setTime(date1);  
    			now.set(Calendar.DATE, now.get(Calendar.DATE) + 7);  
    			date1= now.getTime();  
    			date2=findate;
        	}else {
        		now.setTime(date1);  
                now.set(Calendar.DATE, now.get(Calendar.DATE) + 7);  
                date1= now.getTime();
                now.set(Calendar.DATE, now.get(Calendar.DATE) + 6);
        		date2=now.getTime();
        	}
        	//周实际直接费用
        	HashMap param = new HashMap();
        	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        	String s = sdf.format(date1);
        	date1 =  sdf.parse(s);
        	param.put("startdate", date1);
        	date2.setHours(23);
        	date2.setMinutes(59);
        	date2.setSeconds(59);
        	param.put("enddate", date2);
        	param.put("projectid", projectid);
        	Object[] list = DatabaseExt.queryByNamedSql("default", "com.primeton.eos.ame_budget.getPropl.getWeekActPdir", param);
        	double pdircost=0;
        	if(list.length!=0){
        		DataObject result = (DataObject) list[0];
        		pdircost= result.getDouble("pdircost");
        	}
        	//周人力实际成本
        	Object[] list1 = DatabaseExt.queryByNamedSql("default", "com.primeton.eos.ame_budget.getPropl.getWeekActPemp", param);
        	double pempcost= 0;
        	int weactnum = 0;
        	float weactwork =0;
        	if(list1.length!=0){
        		DataObject result1 = (DataObject) list1[0];
            	pempcost= result1.getDouble("pempcost");
            	weactnum = result1.getInt("count1");//周实际内部人数
            	weactwork = result1.getFloat("acthours");//周实际内部工作量
        	}
        	
        	//周外包实际成本（调用外包结算逻辑流，若外包结算为0则查测算费用）
        	ILogicComponent comp = LogicComponentFactory.create("com.primeton.eos.ame_pur.settle");
        	String operationName = "getOutFeeStatSettle";
    		// 逻辑流的输入参数
        	Date monthstartdate = date1;
        	Date monthenddate = date2;
    		Object[] params = {monthstartdate,monthenddate,projectno,null,"1",null,"xmcb"};
    		Object[] list2 = null;
    		list2 = comp.invoke(operationName, params);
    		double settlefeeTemp= ((BigDecimal) list2[2]).doubleValue(); 
    		//取计提费用
			ILogicComponent comp1 = LogicComponentFactory.create("com.primeton.eos.ame_pur.settle");
        	String operationName1 = "getOutFeeStatpreSettle1";
        	Object[] params1 = {monthstartdate,monthenddate,projectno,null,"1",null,"xmcb"};
    		Object[] list3 = null;
    		list3 = comp1.invoke(operationName1, params1);
    		double settlefeeTemp1= ((BigDecimal) list3[2]).doubleValue();
    		double settlefeeTemp2=settlefeeTemp+settlefeeTemp1;
    		//若结算费用和计提费用均为0，并且该周期为当月则取当月的测算费用
    		double settlefeeTemp3=0;
    		//取最后结算和计提的截止日期
        	HashMap paras = new HashMap();
        	paras.put("projectno", "'"+projectno+"'");
        	paras.put("costtype","1");
    		Object[] listDate = DatabaseExt.queryByNamedSql("default", "com.primeton.eos.ame_budget.getPropl.CalPrjdate", paras);
    		DataObject result = (DataObject) listDate[0];
    		Date lastdate= result.getDate("enddate");
    		if(lastdate!=null&&!lastdate.equals("")){
        		if(nowdate.after(lastdate)&&date2.after(lastdate)){
	        		if(date2.after(nowdate)&&date1.after(lastdate)){
	    				monthstartdate=date1;
	    				monthenddate=nowdate;
	    				ILogicComponent comp2 = LogicComponentFactory.create("com.primeton.eos.ame_pur.settle");
	    	        	String operationName2 = "getOutFeeStatGuess";
	    	        	Object[] params2 = {monthstartdate,monthenddate,projectno,null,"1","0","xmcb"};
	    	    		Object[] list7 = null;
	    	    		list7 = comp2.invoke(operationName2, params2);
	    	    		settlefeeTemp3= ((BigDecimal) list7[0]).doubleValue();
	    			}else if(date2.after(nowdate)&&(!date1.after(lastdate))){
	    				now.setTime(lastdate);  
	                    now.set(Calendar.DATE, now.get(Calendar.DATE) + 1);  
	    				monthstartdate=now.getTime();
	    				monthenddate=nowdate;
	    				ILogicComponent comp2 = LogicComponentFactory.create("com.primeton.eos.ame_pur.settle");
	    	        	String operationName2 = "getOutFeeStatGuess";
	    	        	Object[] params2 = {monthstartdate,monthenddate,projectno,null,"1","0","xmcb"};
	    	    		Object[] list7 = null;
	    	    		list7 = comp2.invoke(operationName2, params2);
	    	    		settlefeeTemp3= ((BigDecimal) list7[0]).doubleValue();
	    			}else if((!date2.after(nowdate))&&date1.after(lastdate)){
	    				monthstartdate=date1;
	    				monthenddate=date2;
	    				ILogicComponent comp2 = LogicComponentFactory.create("com.primeton.eos.ame_pur.settle");
	    	        	String operationName2 = "getOutFeeStatGuess";
	    	        	Object[] params2 = {monthstartdate,monthenddate,projectno,null,"1","0","xmcb"};
	    	    		Object[] list7 = null;
	    	    		list7 = comp2.invoke(operationName2, params2);
	    	    		settlefeeTemp3= ((BigDecimal) list7[0]).doubleValue();
	    			}else if((!date2.after(nowdate))&&date2.after(lastdate)&&(!date1.after(lastdate))){
	    				now.setTime(lastdate);  
	                    now.set(Calendar.DATE, now.get(Calendar.DATE) + 1);  
	    				monthstartdate=now.getTime();
	    				monthenddate=date2;
	    				ILogicComponent comp2 = LogicComponentFactory.create("com.primeton.eos.ame_pur.settle");
	    	        	String operationName2 = "getOutFeeStatGuess";
	    	        	Object[] params2 = {monthstartdate,monthenddate,projectno,null,"1","0","xmcb"};
	    	    		Object[] list7 = null;
	    	    		list7 = comp2.invoke(operationName2, params2);
	    	    		settlefeeTemp3= ((BigDecimal) list7[0]).doubleValue();
	    			}
        		}
        	}
    		double settlefee=settlefeeTemp2+settlefeeTemp3;
    		settlefee = settlefee;
    		
    		//周外包实际人数
    		param.put("projectno", projectno);
    		Object[] list6 = DatabaseExt.queryByNamedSql("default", "com.primeton.eos.ame_budget.getPropl.getWeekPoutnum", param);
        	DataObject result6 = (DataObject) list6[0];
        	int weactoutnum= result6.getInt("count1");

        	//周外部采购实际成本（调用外包结算逻辑流，若外包结算为0则查测算费用）
        	ILogicComponent compa = LogicComponentFactory.create("com.primeton.eos.ame_pur.settle");
        	String operationNamea = "getOutFeeStatSettle";
    		// 逻辑流的输入参数
        	Date monthstartdatea = date1;
        	Date monthenddatea = date2;
    		Object[] parama = {monthstartdatea,monthenddatea,projectno,null,"0",null,"xmcb"};
    		Object[] list2a = null;
    		list2a = comp.invoke(operationNamea, parama);
    		double settlefeeTempa= ((BigDecimal) list2a[2]).doubleValue(); 
    		//取计提费用
			ILogicComponent comp1a = LogicComponentFactory.create("com.primeton.eos.ame_pur.settle");
        	String operationName1a = "getOutFeeStatpreSettle1";
        	Object[] params1a = {monthstartdatea,monthenddatea,projectno,null,"0",null,"xmcb"};
    		Object[] list3a = null;
    		list3a = comp1.invoke(operationName1a, params1a);
    		double settlefeeTemp1a= ((BigDecimal) list3a[2]).doubleValue();
    		double settlefeeTemp2a=settlefeeTempa+settlefeeTemp1a;
    		//若结算费用和计提费用均为0，并且该周期为当月则取当月的测算费用
    		double settlefeeTemp3a=0;
    		//取最后结算和计提的截止日期
        	HashMap parasa = new HashMap();
        	parasa.put("projectno", "'"+projectno+"'");
        	parasa.put("costtype","0");
    		Object[] listDatea = DatabaseExt.queryByNamedSql("default", "com.primeton.eos.ame_budget.getPropl.CalPrjdate", parasa);
    		DataObject resulta = (DataObject) listDatea[0];
    		Date lastdatea= resulta.getDate("enddate");
    		if(lastdatea!=null&&!lastdatea.equals("")){
        		if(nowdate.after(lastdatea)&&date2.after(lastdatea)){
	        		if(date2.after(nowdate)&&date1.after(lastdatea)){
	    				monthstartdatea=date1;
	    				monthenddatea=nowdate;
	    				ILogicComponent comp2a = LogicComponentFactory.create("com.primeton.eos.ame_pur.settle");
	    	        	String operationName2a = "getOutFeeStatGuess";
	    	        	Object[] params2a = {monthstartdatea,monthenddatea,projectno,null,"0",null,"xmcb"};
	    	    		Object[] list7a = null;
	    	    		list7a = comp2a.invoke(operationName2a, params2a);
	    	    		settlefeeTemp3a= ((BigDecimal) list7a[0]).doubleValue();
	    			}else if(date2.after(nowdate)&&(!date1.after(lastdatea))){
	    				now.setTime(lastdatea);  
	                    now.set(Calendar.DATE, now.get(Calendar.DATE) + 1);  
	    				monthstartdatea=now.getTime();
	    				monthenddatea=nowdate;
	    				ILogicComponent comp2a = LogicComponentFactory.create("com.primeton.eos.ame_pur.settle");
	    	        	String operationName2a = "getOutFeeStatGuess";
	    	        	Object[] params2a = {monthstartdate,monthenddate,projectno,null,"0",null,"xmcb"};
	    	    		Object[] list7a = null;
	    	    		list7a = comp2a.invoke(operationName2a, params2a);
	    	    		settlefeeTemp3a= ((BigDecimal) list7a[0]).doubleValue();
	    			}else if((!date2.after(nowdate))&&date1.after(lastdatea)){
	    				monthstartdatea=date1;
	    				monthenddatea=date2;
	    				ILogicComponent comp2a = LogicComponentFactory.create("com.primeton.eos.ame_pur.settle");
	    	        	String operationName2a = "getOutFeeStatGuess";
	    	        	Object[] params2a = {monthstartdatea,monthenddatea,projectno,null,"0",null,"xmcb"};
	    	    		Object[] list7a = null;
	    	    		list7a = comp2a.invoke(operationName2a, params2a);
	    	    		settlefeeTemp3a= ((BigDecimal) list7a[0]).doubleValue();
	    			}else if((!date2.after(nowdate))&&date2.after(lastdatea)&&(!date1.after(lastdatea))){
	    				now.setTime(lastdatea);  
	                    now.set(Calendar.DATE, now.get(Calendar.DATE) + 1);  
	    				monthstartdatea=now.getTime();
	    				monthenddatea=date2;
	    				ILogicComponent comp2a = LogicComponentFactory.create("com.primeton.eos.ame_pur.settle");
	    	        	String operationName2a = "getOutFeeStatGuess";
	    	        	Object[] params2a = {monthstartdatea,monthenddatea,projectno,null,"0",null,"xmcb"};
	    	    		Object[] list7a = null;
	    	    		list7a = comp2a.invoke(operationName2a, params2a);
	    	    		settlefeeTemp3a= ((BigDecimal) list7a[0]).doubleValue();
	    			}
        		}
        	}
    		double settlefeea=settlefeeTemp2a+settlefeeTemp3a;
    		settlefeea = settlefeea;
        	
        	//周人力预算成本
    		double pbempcost=0;
    		param.put("resource", "'0','1'");
    		Object[] list4 = DatabaseExt.queryByNamedSql("default", "com.primeton.eos.ame_budget.getPropl.getWeekBudPemp", param);
    		for(int j=0;j<list4.length;j++){
				DataObject result4 = (DataObject) list4[j];
				float dayprice= result4.getFloat("dayprice");
				float ppratio= result4.getFloat("ppratio");
				float labortransf= result4.getFloat("labortransf");//工时转换系数
				Date startdate1=result4.getDate("startdate");
				Date enddate1=result4.getDate("enddate");
				String resource = result4.getString("resource");
				int workdays=new WorkDaysDeal().getWorkDaysnew(startdate1,enddate1);
				if("0".equals(resource)){//内部价需要计算工时转换系数
					if(labortransf==0){//工时转换系数没值
						pbempcost=pbempcost+workdays*dayprice*ppratio;
					}else{
						pbempcost=pbempcost+workdays*dayprice*ppratio*labortransf;
					}
				}else{
					pbempcost=pbempcost+workdays*dayprice*ppratio;
				}
    		}
    		//周外包预算成本
    		double pboutcost=0;
    		param.put("resource", "'2'");
    		Object[] list5 = DatabaseExt.queryByNamedSql("default", "com.primeton.eos.ame_budget.getPropl.getWeekBudPemp", param);
    		for(int j=0;j<list5.length;j++){
				DataObject result5 = (DataObject) list5[j];
				float dayprice= result5.getFloat("dayprice");
				float ppratio= result5.getFloat("ppratio"); //项目使用比例
				Date startdate1=result5.getDate("startdate");//人员实际周开始日期
				Date enddate1=result5.getDate("enddate");//人员实际周结束日期
				int workdays=new WorkDaysDeal().getWorkDaysnew(startdate1,enddate1);//实际周工作日
				pboutcost=pboutcost+workdays*dayprice*ppratio;
    		}
    		//周直接费用预算成本
    		double perpbdircost= 0;
    		double pbdircost=0;
    		double perwbcost= 0;
    		double wbcost=0;
    		if(budtotalworkdays!=0){
    			perpbdircost=pdircosts/budtotalworkdays;//每日直接费用预算成本
    			perwbcost=pcusltfee/budtotalworkdays;//每日外部采购预算成本
    			if(date2.before(budstartdate)||date1.after(budenddate)){
    				pbdircost=0;
    				wbcost = 0;
    			}else if(!date2.before(budstartdate)&&date1.before(budstartdate)){
    				Date newdate1 = budstartdate;
    				int weworkdays=new WorkDaysDeal().getWorkDaysnew(newdate1,date2);//周工作日
    				pbdircost=perpbdircost*weworkdays;
    				wbcost=perwbcost*weworkdays;
    			}else if(!date1.after(budenddate) && date2.after(budenddate)){
    				Date newdate2 = budenddate;
    				int weworkdays=new WorkDaysDeal().getWorkDaysnew(date1,newdate2);//周工作日
    				pbdircost=perpbdircost*weworkdays;
    				wbcost=perwbcost*weworkdays;
    			}else if(!date1.before(budstartdate)&& !date2.after(budenddate)){
    				int weworkdays=new WorkDaysDeal().getWorkDaysnew(date1,date2);//周工作日
    				pbdircost=perpbdircost*weworkdays;
    				wbcost=perwbcost*weworkdays;
    			}else{
    				int weworkdays=new WorkDaysDeal().getWorkDaysnew(budstartdate,budenddate);//周工作日
    				pbdircost=perpbdircost*weworkdays;
    				wbcost=perwbcost*weworkdays;
    			}
    		}
    		//本周周期
    		String cycle= new java.text.SimpleDateFormat("yyyy/MM/dd").format(date1)+"-"+new java.text.SimpleDateFormat("yyyy/MM/dd").format(date2);
    		//周次
    		int weekly1=i+1;
    		String weekly="W"+weekly1;
    		//周预算成本
    		double webucost = pbempcost+pboutcost+pbdircost+wbcost;
    		//周实际成本
    		double weactcost = pempcost+pdircost+settlefee+settlefeea;
    		//累计预算，累计成本
    		if(i==0){
    			tobucost=webucost+pcosts;
    			tocost=weactcost;
    		}else{
    			tobucost=webucost+pexecut[i-1].getDouble("tobucost");
    			tocost=weactcost+pexecut[i-1].getDouble("tocost");
    		}
    		//当年累计成本
    		now.setTime(date1);
    		int date1year=now.get(Calendar.YEAR);
    		now.set(Calendar.DATE, now.get(Calendar.DATE) - 1);  
    		//上期最后一天年份
    		int lastyear  =now.get(Calendar.YEAR);
    		now.setTime(date2);
    		int date2year=now.get(Calendar.YEAR);
    		if(i==0){
    			antocost=weactcost;
    		}else{
    			if(date1year!=date2year){
        			antocost=weactcost+pexecut[i-1].getDouble("antocost");
        			y=1;
        		}else {
        			if(startyear==date1year){
        				antocost=weactcost+pexecut[i-1].getDouble("antocost");
        			}else {
        				if(y==1){
        					antocost=weactcost;
        					y=0;
        				}else if(y==0){
        					if(date1year!=lastyear){
        						antocost=weactcost;
        					}else{
        						antocost=weactcost+pexecut[i-1].getDouble("antocost");
        					}
        				}
        			}
        		}
    		}
    		//将计算得出的结果存入数据库表中
    		commonj.sdo.DataObject aaa = commonj.sdo.helper.DataFactory.INSTANCE.create("com.primeton.eos.ame_budget.ame_budget","PrjExecutTra");
    		pexecut[i]  = aaa;
    		pexecut[i].setLong("projectid",  Long.parseLong(projectid));
    		pexecut[i].setString("cycle", cycle);
    		pexecut[i].setString("weekly", weekly);
    		pexecut[i].setDouble("webudpemp", pbempcost);
    		pexecut[i].setDouble("webudpdir", pbdircost);
    		pexecut[i].setDouble("webudpwb", wbcost);
    		pexecut[i].setDouble("webudpout", pboutcost);
    		pexecut[i].setDouble("webucost", webucost);
    		pexecut[i].setDouble("tobucost", tobucost);
    		pexecut[i].setDouble("weactpemp", pempcost);
    		pexecut[i].setDouble("weactpdir", pdircost);
    		pexecut[i].setDouble("weactpout", settlefee);
    		pexecut[i].setDouble("weactpwb", settlefeea);
    		pexecut[i].setDouble("weactcost", weactcost);
    		pexecut[i].setDouble("tocost", tocost);
    		pexecut[i].setDouble("antocost", antocost);
    		pexecut[i].setInt("weactnum", weactnum);
    		pexecut[i].setFloat("weactwork", weactwork);
    		pexecut[i].setInt("weactoutnum", weactoutnum);
    		pexecut[i].setDate("lastcaldate", new Date());
    		DatabaseExt.getPrimaryKey(pexecut[i]);
        }
    	DatabaseUtil.insertEntityBatch("default", pexecut);
		return null;
		
	}
	@Bizlet("")
	public HashMap calGuess(Date enddate,String projectno) throws Throwable {
		Calendar now = Calendar.getInstance();  
		Date nowdate=new Date();//当前日期
    	now.setTime(nowdate);
    	now.set(Calendar.DAY_OF_MONTH, now.getActualMinimum(Calendar.DAY_OF_MONTH));
    	Date monthstart=now.getTime();//当前月的月初
    	double settlefeeTemp3=0;
    	HashMap hm = new HashMap();
    	if(enddate.before(nowdate)){
    		now.setTime(enddate);  
            now.set(Calendar.DATE, now.get(Calendar.DATE) + 1);  
    		Date monthstartdate= now.getTime();
			Date monthenddate=nowdate;
			ILogicComponent comp2 = LogicComponentFactory.create("com.primeton.eos.ame_pur.settle");
        	String operationName2 = "getOutFeeStatGuess";
        	Object[] params2 = {monthstartdate,monthenddate,projectno,null,"1","0","xmcb"};
    		Object[] list7 = null;
    		list7 = comp2.invoke(operationName2, params2);
    		settlefeeTemp3= ((BigDecimal) list7[0]).doubleValue();
    		hm.put("startdate",monthstartdate);
        	hm.put("enddate", nowdate);
    	}else {
    		settlefeeTemp3= 0;
    		hm.put("startdate",null);
        	hm.put("enddate", null);
    	}
    	hm.put("type","测算");
    	hm.put("poutcost", settlefeeTemp3);
		return hm;
		
	}
	
}
