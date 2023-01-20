/**
 * 
 */
package com.primeton.rdmgr.labor;


import java.text.ParseException;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;

import com.eos.foundation.data.DataContextUtil;
import com.eos.foundation.database.DatabaseExt;
import com.eos.foundation.database.DatabaseUtil;
import com.eos.system.annotation.Bizlet;

import commonj.sdo.DataObject;

/**
 * @author zhuhx
 * @date 2016-05-18 10:36:06
 *
 */
@Bizlet("")
public class calDate {
	@Bizlet("")
	public static void calDate(int finyear, int finmonth, String servsyb) {
		// TODO �Զ���ɷ������
		commonj.sdo.DataObject misFin = commonj.sdo.helper.DataFactory.INSTANCE.create("com.primeton.eos.common.newdataset","MisFinperiod");
		misFin.setInt("finyear",finyear);
		misFin.setInt("finmonth",finmonth);
		DatabaseUtil.expandEntityByTemplate("default", misFin, misFin);
		Date startdate = misFin.getDate("startdate");//���µ���ʼ����
		Date enddate = misFin.getDate("enddate");//���µĽ�������
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
		commonj.sdo.DataObject RdCheck = commonj.sdo.helper.DataFactory.INSTANCE.create("com.primeton.rdmgr.data.rd","RdCheck");
		commonj.sdo.DataObject misIsworkday = commonj.sdo.helper.DataFactory.INSTANCE.create("com.primeton.eos.common.newdataset","MisIsworkday");
		String userid = "";
		String username = "";
		while (tempdate.before(enddate) || tempdate.equals(enddate)){
			Calendar cal = Calendar.getInstance();
			cal.setTime(tempdate);
			int week = cal.get(Calendar.DAY_OF_WEEK);
			misIsworkday.setDate("moddate",tempdate);
			int count = DatabaseUtil.countByTemplate("default", misIsworkday);
			commonj.sdo.DataObject RdLabor = commonj.sdo.helper.DataFactory.INSTANCE.create("com.primeton.rdmgr.data.rd","RdLaborDetail");
			if(count == 0){//�������û�����ⶨ��
				if(week == 1 || week == 7){//�������գ�Ĭ���Ƿǹ�����
					for(int i=0;i<list.length;i++){
						DataObject emp = (DataObject) list[i];
						userid = emp.getString("USERID");
						username = emp.getString("EMPNAME");
						RdLabor.setDate("laborDate", tempdate);
						RdLabor.setString("userId", userid);
						int count1 = DatabaseUtil.countByTemplate("default", RdLabor);
						if(count1 != 0){
							RdCheck.setString("userId", userid);
							RdCheck.setString("userName", username);
							RdCheck.setString("isWorkday", "n");
							RdCheck.setDate("laborDate", tempdate);
							RdCheck.setString("servsyb", servsyb);
							RdCheck.setInt("finyear", finyear);
							RdCheck.setInt("finmonth", finmonth);
							DatabaseExt.getPrimaryKey(RdCheck);
							DatabaseUtil.insertEntity("default", RdCheck);
							RdCheck.setBigDecimal("rdCheckid", null);
						}
					}
				}else{
					for(int i=0;i<list.length;i++){
						DataObject emp = (DataObject) list[i];
						userid = emp.getString("USERID");
						username = emp.getString("EMPNAME");
						RdLabor.setDate("laborDate", tempdate);
						RdLabor.setString("userId", userid);
						int count1 = DatabaseUtil.countByTemplate("default", RdLabor);
						if(count1 == 0){
							RdCheck.setString("userId", userid);
							RdCheck.setString("userName", username);
							RdCheck.setString("isWorkday", "y");
							RdCheck.setDate("laborDate", tempdate);
							RdCheck.setString("servsyb", servsyb);
							RdCheck.setInt("finyear", finyear);
							RdCheck.setInt("finmonth", finmonth);
							DatabaseExt.getPrimaryKey(RdCheck);
							DatabaseUtil.insertEntity("default", RdCheck);
							RdCheck.setBigDecimal("rdCheckid", null);
						}
					}
				}
					
			}else{
				String isworkday = misIsworkday.getString("isworkday");//�Ƿ�����
				if(isworkday.equals("n")){
						for(int i=0;i<list.length;i++){
							DataObject emp = (DataObject) list[i];
							userid = emp.getString("USERID");
							username = emp.getString("EMPNAME");
							RdLabor.setDate("laborDate", tempdate);
							RdLabor.setString("userId", userid);
							int count1 = DatabaseUtil.countByTemplate("default", RdLabor);
							if(count1 != 0){
								RdCheck.setString("userId", userid);
								RdCheck.setString("userName", username);
								RdCheck.setString("isWorkday", "n");
								RdCheck.setDate("laborDate", tempdate);
								RdCheck.setString("servsyb", servsyb);
								RdCheck.setInt("finyear", finyear);
								RdCheck.setInt("finmonth", finmonth);
								DatabaseExt.getPrimaryKey(RdCheck);
								DatabaseUtil.insertEntity("default", RdCheck);
								RdCheck.setBigDecimal("rdCheckid", null);
							}
						}
					
				}else if(isworkday.equals("y")){
					for(int i=0;i<list.length;i++){
						DataObject emp = (DataObject) list[i];
						userid = emp.getString("USERID");
						username = emp.getString("EMPNAME");
						RdLabor.setDate("laborDate", tempdate);
						RdLabor.setString("userId", userid);
						int count1 = DatabaseUtil.countByTemplate("default", RdLabor);
						if(count1 == 0){
							RdCheck.setString("userId", userid);
							RdCheck.setString("userName", username);
							RdCheck.setString("isWorkday", "y");
							RdCheck.setDate("laborDate", tempdate);
							RdCheck.setString("servsyb", servsyb);
							RdCheck.setInt("finyear", finyear);
							RdCheck.setInt("finmonth", finmonth);
							DatabaseExt.getPrimaryKey(RdCheck);
							DatabaseUtil.insertEntity("default", RdCheck);
							RdCheck.setBigDecimal("rdCheckid", null);
						}
					}
				}
			}
			cal.add(Calendar.DAY_OF_MONTH,1);
			tempdate = cal.getTime();
		}
	}

}

