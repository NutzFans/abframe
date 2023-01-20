/**
 * 
 */
package com.primeton.eos.common;


import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import com.eos.foundation.database.DatabaseExt;
import com.eos.foundation.database.DatabaseUtil;
import commonj.sdo.DataObject;

/**
 * @author zhuhx
 * @date 2016-05-18 10:36:06
 *
 */
public class calDate {
	public static void calDate(int finyear, int finmonth, String servsyb) {
		// TODO 自动生成方法存根
		commonj.sdo.DataObject misFin = commonj.sdo.helper.DataFactory.INSTANCE.create("com.primeton.eos.common.newdataset","MisFinperiod");
		misFin.setInt("finyear",finyear);
		misFin.setInt("finmonth",finmonth);
		DatabaseUtil.expandEntityByTemplate("default", misFin, misFin);
		Date startdate = misFin.getDate("startdate");//本月的起始日期
		Date enddate = misFin.getDate("enddate");//本月的结束日期
		Date tempdate = startdate;
		HashMap param = new HashMap();
		if(servsyb.equals("6")){
			param.put("orgseq","'181'" );
		}else if(servsyb.equals("1")){
			param.put("orgseq", "'302'");
		}else if(servsyb.equals("2")){
			param.put("orgseq", "'36'");
		}else if(servsyb.equals("4")){
			param.put("orgseq", "'314'");
		}else if(servsyb.equals("5")){
			param.put("orgseq", "'319','316','317','318'");
		}else if(servsyb.equals("A")){
			param.put("orgseq", "'304'");
		}else if(servsyb.equals("B")){
			param.put("orgseq", "'34'");
		}else if(servsyb.equals("C")){
			param.put("orgseq", "'308'");
		}else if(servsyb.equals("D")){
			param.put("orgseq", "'309'");
		}else if(servsyb.equals("E")){
			param.put("orgseq", "'310'");
		}else if(servsyb.equals("F")){
			param.put("orgseq", "'35'");
		}else if(servsyb.equals("G")){
			param.put("orgseq", "'312'");
		}else if(servsyb.equals("H")){
			param.put("orgseq", "'313'");
		}else if(servsyb.equals("I")){
			param.put("orgseq", "'315'");
		}
		Object[] list = DatabaseExt.queryByNamedSql("default", "com.primeton.eos.common.newnamingsql.getUserid", param);
		while (tempdate.before(enddate) || tempdate.equals(enddate)){
			Calendar cal = Calendar.getInstance();
			cal.setTime(tempdate);
			int week = cal.get(Calendar.DAY_OF_WEEK);
			commonj.sdo.DataObject misIsworkday = commonj.sdo.helper.DataFactory.INSTANCE.create("com.primeton.eos.common.newdataset","MisIsworkday");
			misIsworkday.setDate("moddate",tempdate);
			int count = DatabaseUtil.expandEntityByTemplate("default", misIsworkday, misIsworkday);
			if(count == 0){//这个日期没有特殊定义
				if(week == 1 || week == 7){//周六周日，默认是非工作日
					for(int i=0;i<list.length;i++){
						DataObject emp = (DataObject) list[i];
						String userid = emp.getString("USERID");
						String username = emp.getString("EMPNAME");
						commonj.sdo.DataObject RdLabor = commonj.sdo.helper.DataFactory.INSTANCE.create("com.primeton.rdmgr.data.rd","RdLaborDetail");
						RdLabor.setDate("laborDate", tempdate);
						RdLabor.setString("userId", userid);
						int count1 = DatabaseUtil.expandEntityByTemplate("default", RdLabor, RdLabor);
						if(count1 != 0){
							commonj.sdo.DataObject RdCheck = commonj.sdo.helper.DataFactory.INSTANCE.create("com.primeton.rdmgr.data.rd","RdCheck");
							RdCheck.setString("userId", userid);
							RdCheck.setString("userName", username);
							RdCheck.setString("isWorkday", "n");
							RdCheck.setDate("laborDate", tempdate);
							DatabaseExt.getPrimaryKey(RdCheck);
							DatabaseUtil.insertEntity("default", RdCheck);
						}
					}
				}else{
					for(int i=0;i<list.length;i++){
						DataObject emp = (DataObject) list[i];
						String userid = emp.getString("USERID");
						String username = emp.getString("EMPNAME");
						commonj.sdo.DataObject RdLabor = commonj.sdo.helper.DataFactory.INSTANCE.create("com.primeton.rdmgr.data.rd","RdLaborDetail");
						RdLabor.setDate("laborDate", tempdate);
						RdLabor.setString("userId", userid);
						int count1 = DatabaseUtil.expandEntityByTemplate("default", RdLabor, RdLabor);
						if(count1 == 0){
							commonj.sdo.DataObject RdCheck = commonj.sdo.helper.DataFactory.INSTANCE.create("com.primeton.rdmgr.data.rd","RdCheck");
							RdCheck.setString("userId", userid);
							RdCheck.setString("userName", username);
							RdCheck.setString("isWorkday", "y");
							RdCheck.setDate("laborDate", tempdate);
							DatabaseExt.getPrimaryKey(RdCheck);
							DatabaseUtil.insertEntity("default", RdCheck);
						}
					}
				}
					
			}else{
				String isworkday = misIsworkday.getString("isworkday");//是否工作日
				if(isworkday.equals("n")){
						for(int i=0;i<list.length;i++){
							DataObject emp = (DataObject) list[i];
							String userid = emp.getString("USERID");
							String username = emp.getString("EMPNAME");
							commonj.sdo.DataObject RdLabor = commonj.sdo.helper.DataFactory.INSTANCE.create("com.primeton.rdmgr.data.rd","RdLaborDetail");
							RdLabor.setDate("laborDate", tempdate);
							RdLabor.setString("userId", userid);
							int count1 = DatabaseUtil.expandEntityByTemplate("default", RdLabor, RdLabor);
							if(count1 != 0){
								commonj.sdo.DataObject RdCheck = commonj.sdo.helper.DataFactory.INSTANCE.create("com.primeton.rdmgr.data.rd","RdCheck");
								RdCheck.setString("userId", userid);
								RdCheck.setString("userName", username);
								RdCheck.setString("isWorkday", "n");
								RdCheck.setDate("laborDate", tempdate);
								DatabaseExt.getPrimaryKey(RdCheck);
								DatabaseUtil.insertEntity("default", RdCheck);
							}
						}
					
				}else if(isworkday.equals("y")){
					for(int i=0;i<list.length;i++){
						DataObject emp = (DataObject) list[i];
						String userid = emp.getString("USERID");
						String username = emp.getString("EMPNAME");
						commonj.sdo.DataObject RdLabor = commonj.sdo.helper.DataFactory.INSTANCE.create("com.primeton.rdmgr.data.rd","RdLaborDetail");
						RdLabor.setDate("laborDate", tempdate);
						RdLabor.setString("userId", userid);
						int count1 = DatabaseUtil.expandEntityByTemplate("default", RdLabor, RdLabor);
						if(count1 == 0){
							commonj.sdo.DataObject RdCheck = commonj.sdo.helper.DataFactory.INSTANCE.create("com.primeton.rdmgr.data.rd","RdCheck");
							RdCheck.setString("userId", userid);
							RdCheck.setString("userName", username);
							RdCheck.setString("isWorkday", "n");
							RdCheck.setDate("laborDate", tempdate);
							DatabaseExt.getPrimaryKey(RdCheck);
							DatabaseUtil.insertEntity("default", RdCheck);
						}
					}
				}
			}
			cal.add(Calendar.DAY_OF_MONTH,1);
			tempdate =cal.getTime();
		}
		return;
	}

}

