/**
 * 
 */
package com.primeton.eos.ame_common;




import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import com.primeton.eos.ame_common.WorkDaysDeal;
import com.eos.system.annotation.Bizlet;











import commonj.sdo.DataObject;

/**
 * @author zhuhx
 * @date 2016-07-27 14:27:04
 *
 */
public class PjSj {

	/**
	 * @param startdate
	 * @return
	 * @author 朱海翔
	 * @throws Throwable 
	 * @throws ParseException 
	 * @throws IOException 
	 * @throws BiffException 
	 */
	@Bizlet("")
	public DataObject[] PjSj(DataObject [] datas)  {
		int length = datas.length;
		HashMap<String,DataObject> map = new HashMap<String,DataObject>();
		
		for(int i = 0;i<=length-1;i++){
			String operatorname = datas[i].getString("operatorname");
			String projectNo = datas[i].getString("projectNo");
			String custname = datas[i].getString("custname");
			String year = datas[i].getString("year");
			String month = datas[i].getString("month");
			String id = operatorname+"-"+projectNo+"-"+custname+"-"+year+"-"+month;
			DataObject temp = map.get(id);
			if(temp==null){
				map.put(id, datas[i]);
			}else{
				String empname = temp.getString("empname");
				String empname1 = datas[i].getString("empname");
				empname = empname+","+empname1;
				temp.setString("empname",empname);
			}
		}
		DataObject[] obj = new DataObject[map.size()];
		map.values().toArray(obj);
		map=null;
		return obj;
		
	}
	
	/**
	 * @param startdate
	 * @return
	 * @author 朱海翔
	 * @throws Throwable 
	 * @throws ParseException 
	 * @throws IOException 
	 * @throws BiffException 
	 */
	@Bizlet("拼接报销单号")
	public DataObject[] PjReiSj(DataObject [] datas)  {
		int length = datas.length;
		HashMap<String,DataObject> map = new HashMap<String,DataObject>();
		
		for(int i = 0;i<=length-1;i++){
			String processinstid = datas[i].getString("processinstid");
			if(processinstid == null || processinstid == ""){
				processinstid = "err";
			}
			DataObject temp = map.get(processinstid);
			if(temp==null){
				map.put(processinstid, datas[i]);
			}else{
				String expno = temp.getString("expno");
				String expno1 = datas[i].getString("expno");
				expno = expno+","+expno1;
				temp.setString("expno",expno);
			}
		}
		DataObject[] obj = new DataObject[map.size()];
		map.values().toArray(obj);
		map=null;
		return obj;
	}
	
	/**
	 * @param startdate
	 * @return
	 * @author 朱海翔
	 * @throws Exception 
	 * @throws Throwable 
	 * @throws IOException 
	 * 获取外包人员当月实际标准工作日
	 */
	@Bizlet("")
	public DataObject[] getBzDays(DataObject [] datas) throws Exception  {
		int length = datas.length;
		Map<String, Date> map = new HashMap();
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd hh:mm");
		for(int i = 0;i<=length-1;i++){
			String year = datas[i].getString("year");
			String month = datas[i].getString("month");
			Date lcdate = datas[i].getDate("lcdate");
			Date rcdate = datas[i].getDate("rcdate");
			int stddays = 0;
			Date start = null;
			Date end = null;
			try {
				map = WorkDaysDeal.getFirstday_Lastday_Month_Now(year, month, "01");
			} catch (ParseException e) {
				// TODO 自动生成的 catch 块
				e.printStackTrace();
			}
			long lcdateTemp =0;
			if(lcdate == null){
			}else{
				 lcdateTemp = lcdate.getTime();
			}
			long rcdateTemp =0;
			if(rcdate == null){
			}else{
				 rcdateTemp = rcdate.getTime();
			}
			long startdate = map.get("firstYMD").getTime();
			long enddate = map.get("lastYMD").getTime();
			if((lcdateTemp<startdate && lcdateTemp !=0)||(rcdateTemp>enddate && rcdateTemp !=0)){
			}else{
				if(rcdateTemp==0||rcdateTemp<startdate){
					start = map.get("firstYMD");
				}else{
					start = rcdate;
				}
				if(lcdateTemp<enddate && lcdateTemp != 0){
					end=lcdate;
				}else{
					end = map.get("lastYMD");
				}
				if(start != null && end != null && start.getTime()>end.getTime()){
				}else{
					stddays=new WorkDaysDeal().getWorkDaysnew(start,end);//总的工作日
				}
			}
			datas[i].set("stddays", stddays);
		}
		return datas;
		
	}
}
