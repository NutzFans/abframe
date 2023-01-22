/**
 * 
 */
package com.primeton.eos.ame_dailyoffice;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.ArrayUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.mail.EmailException;
import org.gocom.bps.web.bizform.BPFFServiceFactory;
import org.quartz.CronExpression;

import com.alibaba.fastjson.JSON;
import com.eos.data.datacontext.IUserObject;
import com.eos.data.datacontext.UserObject;
import com.eos.engine.component.ILogicComponent;
import com.eos.foundation.MailInfo;
import com.eos.foundation.data.DataObjectUtil;
import com.eos.foundation.database.DatabaseUtil;
import com.eos.foundation.eoscommon.BusinessDictUtil;
import com.eos.runtime.core.TraceLoggerFactory;
import com.eos.system.annotation.Bizlet;
import com.eos.system.logging.Logger;
import com.eos.workflow.api.BPSServiceClientFactory;
import com.primeton.eos.ame_common.AmeSendMailUtil;
import com.primeton.eos.ame_common.MailManager;
import com.primeton.eos.ame_common.WeChatUtil;
import com.primeton.ext.engine.component.LogicComponentFactory;

import commonj.sdo.DataObject;
import commonj.sdo.helper.CopyHelper;
import commonj.sdo.helper.DataFactory;
/**
 * @author xuan
 * @date 2019-03-05 16:25:24
 *
 */
@Bizlet("会议管理")
public class HyglUtil extends BusinessFormBaseUtil{
	
	public static final String SMS_CONFIG="SMS_CONFIG";
	public static final String AME_WE_CHAT="AME_WE_CHAT";
	public static final String WE_APP="WE_APP";

	private static Logger log = TraceLoggerFactory.getLogger(WeChatUtil.class);
	
	/**
	 * @param formData
	 * @return
	 * @throws Exception
	 */
	@Bizlet
	public String handle(DataObject formData, boolean sfzq, String zqlx, Date zqkssj, Date zqjssj,String cronExpression,String agentid) throws Exception {	
		String wechatreturnid=null;//创建日程的返回值
		
		//周期性会议
		if(sfzq == true) {
			List<DataObject> lstPeriodDate = getPeriodDate(formData, zqlx, zqkssj, zqjssj,cronExpression);
			if(!CollectionUtils.isEmpty(lstPeriodDate)) {
				for(DataObject period : lstPeriodDate) {
					String hykssj = period.getString("hykssj");
					String hyjssj = period.getString("hyjssj");
					System.out.println(hykssj+"开始时间");
					System.out.println(hyjssj+"结束时间");
					//取会议开始时间的时间戳
					String tmpstartString = hykssj+":00";
					Long	timeLoginStart = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(tmpstartString).getTime();
					String timeLoginStartsString= timeLoginStart+"";
					String timeLoginStartsStringStart=timeLoginStartsString.substring(0, 10);
					timeLoginStart=Long.parseLong(timeLoginStartsStringStart);//当天会议结束时间时间戳
					System.out.println(timeLoginStart);
					//取会议结束时间的时间戳
					String tmpEndString = hyjssj+":00";
					Long	timeLoginEnd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(tmpEndString).getTime();
					String timeLoginEndString = timeLoginEnd+"";
					String timeLoginEndStringEnd = timeLoginEndString.substring(0, 10);
					timeLoginEnd=Long.parseLong(timeLoginEndStringEnd);//当天会议结束时间时间戳
					//创建企业微信日程安排
					String chryid = formData.getString("chryid");
					String tqfz = formData.getString("tqfz");
				    Long sfhyqtx = Long.parseLong(formData.getString("sfhyqtx"));

					Long tqfz1 = null;
					if (sfhyqtx==1) {
					      tqfz1 = Long.parseLong(tqfz)*60;

					}else {
						sfhyqtx=(long) 0;
					}
				    // Long tqfz1 = Long.parseLong(tqfz)*60;
					String[] arr = new String(chryid).split("[\\,]");   //用split对会议参与者按逗号分割成数组						
					ArrayList<User> users=new ArrayList<User>();
					User user;
					for (int i = 0; i < arr.length; i++) {
						user = new User();
						user.setUserid(arr[i]);
						users.add(user);
						//创建微信会议日程					
					}
					JSON.toJSONString(users);
					//这里因为系统的周期和企业微信的周期不一样，仅每日是一样的，所以这里吧系统的每日周期和企业微信的每日联系起来
					long isrepeat=0;
					wechatreturnid=WeChatUtil.creatCalendarArrange( formData.getString("zcrid"), timeLoginStart, timeLoginEnd, JSON.toJSONString(users), formData.getString("hyzt"), formData.getString("hyycap"), sfhyqtx,isrepeat,tqfz1,agentid);
				}
			}
		} else {
			String hykssj = formData.getString("hykssj");
			String hyjssj = formData.getString("hyjssj");
			
			//取会议开始时间的时间戳
			String tmpstartString = hykssj+":00";
			Long	timeLoginStart = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(tmpstartString).getTime();
			String timeLoginStartsString = timeLoginStart+"";
			String timeLoginStartsStringStart = timeLoginStartsString.substring(0, 10);
			timeLoginStart=Long.parseLong(timeLoginStartsStringStart);//当天会议结束时间时间戳
			System.out.println(timeLoginStart);
			//取会议结束时间的时间戳
			String tmpEndString = hyjssj+":00";
			Long timeLoginEnd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(tmpEndString).getTime();
			String timeLoginEndString = timeLoginEnd+"";
			String timeLoginEndStringEnd = timeLoginEndString.substring(0, 10);
			timeLoginEnd = Long.parseLong(timeLoginEndStringEnd);//当天会议结束时间时间戳
			System.out.println(timeLoginEnd);
			//创建企业微信日程安排
			String chryid = formData.getString("chryid");
			String tqfz = formData.getString("tqfz");
			//String sfhyqtx=formData.getString("sfhyqtx");
			
		    Long sfhyqtx = Long.parseLong(formData.getString("sfhyqtx"));

			Long tqfz1 = null;
			if (sfhyqtx==1) {
			      tqfz1 = Long.parseLong(tqfz)*60;

			}else {
				sfhyqtx=(long) 0;
			}
		     
			String[] arr = new String(chryid).split("[\\,]");   //用split对会议参与者按逗号分割成数组
			ArrayList<User> users = new ArrayList<User>();
			User user;
			for (int i = 0; i < arr.length; i++) {
				user = new User();
				user.setUserid(arr[i]);
				users.add(user);
			}
			JSON.toJSONString(users);
			long is_repeat=0;
			wechatreturnid=WeChatUtil.creatCalendarArrange( formData.getString("zcrid"), timeLoginStart, timeLoginEnd, JSON.toJSONString(users), formData.getString("hyzt"), formData.getString("hyycap"), sfhyqtx,is_repeat,tqfz1,agentid);
		}
		
		
		return wechatreturnid;
	}
	
	@Bizlet("更新日程")
	public String updaterc (DataObject formData, boolean sfzq, String zqlx, Date zqkssj, Date zqjssj,String cronExpression,String agentid,String schedule_id) throws Exception {	
		String wechatreturnid=null;//创建日程的返回值
		
		//周期性会议
		if(sfzq == true) {
			List<DataObject> lstPeriodDate = getPeriodDate(formData, zqlx, zqkssj, zqjssj,cronExpression);
			if(!CollectionUtils.isEmpty(lstPeriodDate)) {
				for(DataObject period : lstPeriodDate) {
					String hykssj = period.getString("hykssj");
					String hyjssj = period.getString("hyjssj");
					System.out.println(hykssj+"开始时间");
					System.out.println(hyjssj+"结束时间");
					//取会议开始时间的时间戳
					String tmpstartString = hykssj+":00";
					Long	timeLoginStart = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(tmpstartString).getTime();
					String timeLoginStartsString= timeLoginStart+"";
					String timeLoginStartsStringStart=timeLoginStartsString.substring(0, 10);
					timeLoginStart=Long.parseLong(timeLoginStartsStringStart);//当天会议结束时间时间戳
					System.out.println(timeLoginStart);
					//取会议结束时间的时间戳
					String tmpEndString = hyjssj+":00";
					Long	timeLoginEnd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(tmpEndString).getTime();
					String timeLoginEndString = timeLoginEnd+"";
					String timeLoginEndStringEnd = timeLoginEndString.substring(0, 10);
					timeLoginEnd=Long.parseLong(timeLoginEndStringEnd);//当天会议结束时间时间戳
					//创建企业微信日程安排
					String chryid = formData.getString("chryid");
					String tqfz = formData.getString("tqfz");
				    Long sfhyqtx = Long.parseLong(formData.getString("sfhyqtx"));

					Long tqfz1 = null;
					if (sfhyqtx==1) {
					      tqfz1 = Long.parseLong(tqfz)*60;

					}else {
						sfhyqtx=(long) 0;
					}
				    // Long tqfz1 = Long.parseLong(tqfz)*60;
					String[] arr = new String(chryid).split("[\\,]");   //用split对会议参与者按逗号分割成数组						
					ArrayList<User> users=new ArrayList<User>();
					User user;
					for (int i = 0; i < arr.length; i++) {
						user = new User();
						user.setUserid(arr[i]);
						users.add(user);
						//创建微信会议日程					
					}
					JSON.toJSONString(users);
					//这里因为系统的周期和企业微信的周期不一样，仅每日是一样的，所以这里吧系统的每日周期和企业微信的每日联系起来
					long isrepeat=0;
					wechatreturnid=WeChatUtil.updateCalendarArrange( formData.getString("zcrid"), timeLoginStart, timeLoginEnd, JSON.toJSONString(users), formData.getString("hyzt"), formData.getString("hyycap"), sfhyqtx,isrepeat,tqfz1,agentid,schedule_id);
				}
			}
		} else {
			String hykssj = formData.getString("hykssj");
			String hyjssj = formData.getString("hyjssj");
			
			//取会议开始时间的时间戳
			String tmpstartString = hykssj+":00";
			Long	timeLoginStart = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(tmpstartString).getTime();
			String timeLoginStartsString = timeLoginStart+"";
			String timeLoginStartsStringStart = timeLoginStartsString.substring(0, 10);
			timeLoginStart=Long.parseLong(timeLoginStartsStringStart);//当天会议结束时间时间戳
			System.out.println(timeLoginStart);
			//取会议结束时间的时间戳
			String tmpEndString = hyjssj+":00";
			Long timeLoginEnd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(tmpEndString).getTime();
			String timeLoginEndString = timeLoginEnd+"";
			String timeLoginEndStringEnd = timeLoginEndString.substring(0, 10);
			timeLoginEnd = Long.parseLong(timeLoginEndStringEnd);//当天会议结束时间时间戳
			System.out.println(timeLoginEnd);
			//创建企业微信日程安排
			String chryid = formData.getString("chryid");
			String tqfz = formData.getString("tqfz");
			//String sfhyqtx=formData.getString("sfhyqtx");
			
		    Long sfhyqtx = Long.parseLong(formData.getString("sfhyqtx"));

			Long tqfz1 = null;
			if (sfhyqtx==1) {
			      tqfz1 = Long.parseLong(tqfz)*60;

			}else {
				sfhyqtx=(long) 0;
			}
		     
			String[] arr = new String(chryid).split("[\\,]");   //用split对会议参与者按逗号分割成数组
			ArrayList<User> users = new ArrayList<User>();
			User user;
			for (int i = 0; i < arr.length; i++) {
				user = new User();
				user.setUserid(arr[i]);
				users.add(user);
			}
			JSON.toJSONString(users);
			long is_repeat=0;
			wechatreturnid=WeChatUtil.updateCalendarArrange( formData.getString("zcrid"), timeLoginStart, timeLoginEnd, JSON.toJSONString(users), formData.getString("hyzt"), formData.getString("hyycap"), sfhyqtx,is_repeat,tqfz1,agentid,schedule_id);
		}
		
		
		return wechatreturnid;
	}
	
	
	/**
	 * 发送通知消息
	 * @param formData
	 * @param sfzq
	 * @param zqlx
	 * @param zqkssj
	 * @param zqjssj
	 * @throws EmailException 
	 */
	@Bizlet("发送通知消息")
	public void sendMessage(DataObject formData, boolean sfzq, String zqlx, Date zqkssj, Date zqjssj) throws EmailException {
		List<String> lstUserId = new ArrayList<String>();
		List<String> lstMailAddr = new ArrayList<String>();
		
		String notice = formData.getString("tzfs");//通知方式
		List<String> noticeTypes = new ArrayList<>();
		if(notice != null && StringUtils.isNotEmpty(notice)) {
			noticeTypes = Arrays.asList(notice.split(","));
		}
		
		String chryid = formData.getString("chryid");
		String currentEmpId = formData.getString("currentEmpId"); //会议发起人
		String managerIds = formData.getString("managerIds"); //会议室管理员
		String chairId = formData.getString("zcrid");//主持人
		//String managerNames = formData.getString("managerNames"); 
	
		List<String> attendeeArr=new ArrayList<>(Arrays.asList(new String(chryid).split("[\\,]")));   //用split对会议参与者按逗号分割成数组
		attendeeArr.add(currentEmpId);
		attendeeArr.add(chairId);
		
		List<String> managerIdArr = new ArrayList<>(); 
		if (managerIds != null && StringUtils.isNotEmpty(managerIds)) {
			managerIdArr = Arrays.asList(managerIds.split(","));
		}
		
		List<String> lstContent1 = getContent1(formData, sfzq, zqlx, zqkssj, zqjssj);
		String content1 = "";
		for (int i = 0; i < attendeeArr.size(); i++) {
			//System.out.println(arr[i]);
			List<UserObject> lstUserInfo = super.getUserInfoByEmpId(attendeeArr.get(i));
			for(UserObject uo : lstUserInfo) {
				
				if(!lstUserId.contains(uo.getUserId())) lstUserId.add(uo.getUserId());
				if(!lstMailAddr.contains(uo.getUserMail())) lstMailAddr.add(uo.getUserMail());

			}
			
		}	
		//短信通知
		if (noticeTypes.contains("1")) {
			for (int i = 0; i < lstUserId.size(); i++) {
				//拿手机号
				List<UserMobileno> listMobilenos =getMobilenoInfoByUserid(lstUserId.get(i));
				for (UserMobileno uo:listMobilenos) {
					content1 = StringUtils.join(lstContent1.toArray(), "\r\n");
					content1 = content1.replace("&nbsp;", " ");
					content1 = "会议通知\r\n" + content1;
					String nameString=uo.getName();
					String mobileString=uo.getMobileno();
					//取计提费用
						ILogicComponent comp1 = LogicComponentFactory.create("com.primeton.eos.ame_common.smsPlatform");
			        	String operationName1 = "sendSms";
			        	Object[] params1 = {nameString,mobileString,content1,"2","1",true,null};
			    		try {
			    			Object[] list7 = null;
		    	    		list7 = comp1.invoke(operationName1, params1);
						} catch (Throwable e) {
							log.error(e);
						}
				}
			}
			
		}
		
		List<String> managerMailAddr = new ArrayList<String>();
		for (int i = 0; i < managerIdArr.size(); i++) {
			List<UserObject> userInfo = super.getUserInfoByEmpId(managerIdArr.get(i));
			for(UserObject uo : userInfo) {
				if(!managerMailAddr.contains(uo.getUserMail())) managerMailAddr.add(uo.getUserMail());
			}
			
		}
		

		List<String> lstContent = getContent(formData, sfzq, zqlx, zqkssj, zqjssj);
		
		
		//发送邮件
		if (noticeTypes.contains("0")) {
			if(lstMailAddr.size() > 0) {
				
				doMailSend(formData, sfzq, zqlx, zqkssj, zqjssj, lstMailAddr, false);
			}
			
			if (!managerMailAddr.isEmpty()) {
				doMailSend(formData, sfzq, zqlx, zqkssj, zqjssj, managerMailAddr, true);
			}
		}
				
		//发送微信通知
		if (noticeTypes.contains("2")) {

			if(lstUserId.size() > 0) {
				String idsString = BusinessDictUtil.getDictName(AME_WE_CHAT, "agentid");

				String content = StringUtils.join(lstContent.toArray(), "\r\n");
				content = content.replace("&nbsp;", " ");
				content = "【会议通知】\r\n" + content;
				System.out.println(StringUtils.join(lstUserId.toArray(), "|"));
				WeChatUtil.sendWXMsg(StringUtils.join(lstUserId.toArray(), "|"), "", "", content, idsString);
			}
		}		
	}

	/**
	 * 
	 * @param formData
	 * @param sfzq
	 * @param zqlx
	 * @param zqkssj
	 * @param zqjssj
	 * @param mailAddr
	 * @param currentEmpName
	 * @param isAttendee 是否为发给会议室管理员的邮件
	 */
	private void doMailSend(DataObject formData, boolean sfzq, String zqlx,
			Date zqkssj, Date zqjssj, List<String> mailAddr, boolean isManager) {
		Map<String, String> params = new HashMap<>();
		params.put("mailtype", isManager ? "79" : "78");
		
		String currentEmpName = formData.getString("currentEmpName"); 
		String hykssj = formData.getString("hykssj");
		String hyjssj = formData.getString("hyjssj");
		String chrymc = formData.getString("chrymc");

		if(!StringUtils.isBlank(chrymc)) {
			if(chrymc.endsWith(";")) chrymc = chrymc.substring(0, chrymc.length() - 1);
			chrymc = chrymc.replace(";", "、");
		}

		String dateStr = "";
		if(sfzq) {//会议周期
			SimpleDateFormat sfdDate = new SimpleDateFormat("yyyy-MM-dd");
			dateStr = sfdDate.format(zqkssj) + "至" + sfdDate.format(zqjssj) + "(" + zqlx + ")";
		} else {
			dateStr = hykssj.substring(0, 10);
		}
		params.put("subject", formData.getString("hyzt"));//主题
		params.put("date", dateStr);//会议日期
		params.put("time", hykssj.substring(11) + " - " + hyjssj.substring(11));//会议时间
		params.put("room", formData.getString("hysmc"));//会议室
		params.put("attendee", chrymc);//参会人
		params.put("initiator", currentEmpName); //发起人
		if (!isManager) {
			params.put("agenda", formData.getString("hyycap"));//会议议程
		} else {
			params.put("prepare", formData.getString("hyzbsm"));//准备说明
		}
		
		try {
			MailInfo mail = ProcessUtil.getMailInfo();
			mail.setTo(mailAddr);
			MailManager.createMailInstance(mail, params);
			AmeSendMailUtil.sendMail(mail);
		} catch (Exception e) {
			log.error(e);
		}
	}
	
	
	public List<UserMobileno> getMobilenoInfoByUserid(String userId) {
		List<UserMobileno> lstUserInfo = new ArrayList<UserMobileno>();
		
		if(!StringUtils.isBlank(userId)) {
			userId = userId.replace(";", ",");
			DataObject criteria = DataFactory.INSTANCE.create("com.primeton.das.criteria", "criteriaType");
			criteria.set("_entity", "com.primeton.eos.ame_dailyoffice.hygl.OmEmployee");
		//	criteria.set("_expr[1]/empid", userId);
			criteria.set("_expr[1]/userid", userId);
			criteria.set("_expr[1]/_op", "in");
			DataObject[] arrUser = DatabaseUtil.queryEntitiesByCriteriaEntity("default", criteria);
			
			for(DataObject user : arrUser) {
				String mobileno = user.getString("mobileno");
				String name = user.getString("empname");

				UserMobileno uo = new UserMobileno();
				uo.setMobileno(mobileno);
				uo.setName(name);;

				lstUserInfo.add(uo);
			}
		}
		
		return lstUserInfo;
	}
	
	
	
	/**
	 * 获取邮件正文
	 * @param formData
	 * @param sfzq
	 * @param zqlx
	 * @param zqkssj
	 * @param zqjssj
	 * @return
	 */
	
	public List<String> getContent1(DataObject formData, boolean sfzq, String zqlx, Date zqkssj, Date zqjssj) {
		List<String> lstContent = new ArrayList<String>();
		SimpleDateFormat sfdDate = new SimpleDateFormat("yyyy-MM-dd");
		String hyzt = formData.getString("hyzt");
		String hysmc = formData.getString("hysmc");
		String hykssj = formData.getString("hykssj");
		String hyjssj = formData.getString("hyjssj");
		String chrymc = formData.getString("chrymc");
		//String zqlxmc = formData.getString("zqlxmc");
		if(!StringUtils.isBlank(chrymc)) {
			if(chrymc.endsWith(";")) chrymc = chrymc.substring(0, chrymc.length() - 1);
			chrymc = chrymc.replace(";", "、");
		}
		lstContent.add("主&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;题：&nbsp;&nbsp;" + hyzt);
		if(sfzq) {
			lstContent.add("会议周期：&nbsp;&nbsp;" + sfdDate.format(zqkssj) + "至" + sfdDate.format(zqjssj) + "(" + zqlx + ")");
		} else {
			lstContent.add("会议日期：&nbsp;&nbsp;" + hykssj.substring(0, 10));
		}
		lstContent.add("会议时间：&nbsp;&nbsp;" + hykssj.substring(11) + " - " + hyjssj.substring(11));
		lstContent.add("会&nbsp;&nbsp;议&nbsp;&nbsp;室：&nbsp;&nbsp;" + hysmc);
		lstContent.add("参&nbsp;&nbsp;会&nbsp;&nbsp;人：&nbsp;&nbsp;" + chrymc);
		
		return lstContent;
	}
	
	public List<String> getContent(DataObject formData, boolean sfzq, String zqlx, Date zqkssj, Date zqjssj) {
		List<String> lstContent = new ArrayList<String>();
		SimpleDateFormat sfdDate = new SimpleDateFormat("yyyy-MM-dd");
		String hyzt = formData.getString("hyzt");
		String hysmc = formData.getString("hysmc");
		String hykssj = formData.getString("hykssj");
		String hyjssj = formData.getString("hyjssj");
		String chrymc = formData.getString("chrymc");
		String hyycap =formData.getString("hyycap");
		//String zqlxmc = formData.getString("zqlxmc");
		if(!StringUtils.isBlank(chrymc)) {
			if(chrymc.endsWith(";")) chrymc = chrymc.substring(0, chrymc.length() - 1);
			chrymc = chrymc.replace(";", "、");
		}
		lstContent.add("主&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;题：&nbsp;&nbsp;" + hyzt);
		if(sfzq) {
			lstContent.add("会议周期：&nbsp;&nbsp;" + sfdDate.format(zqkssj) + "至" + sfdDate.format(zqjssj) + "(" + zqlx + ")");
		} else {
			lstContent.add("会议日期：&nbsp;&nbsp;" + hykssj.substring(0, 10));
		}
		lstContent.add("会议时间：&nbsp;&nbsp;" + hykssj.substring(11) + " - " + hyjssj.substring(11));
		lstContent.add("会&nbsp;&nbsp;议&nbsp;&nbsp;室：&nbsp;&nbsp;" + hysmc);
		lstContent.add("参&nbsp;&nbsp;会&nbsp;&nbsp;人：&nbsp;&nbsp;" + chrymc);
		lstContent.add("会&nbsp;&nbsp;议&nbsp;&nbsp;议&nbsp;&nbsp;程：&nbsp;&nbsp;\r\n" + hyycap);
		
		return lstContent;
	}
	
	/**
	 * @param formData
	 * @param zqlx
	 * @param zqkssj
	 * @param zqjssj
	 * @return
	 * @throws ParseException 
	 */
	@SuppressWarnings("deprecation")
	public List<DataObject> getPeriodDate(DataObject formData, String zqlx, Date zqkssj, Date zqjssj,String cronExpression) throws ParseException {
		List<DataObject> lstRsult = new ArrayList<DataObject>();
		//拿取表单中的信息
		System.out.println(formData);
		Calendar calendar = Calendar.getInstance();
		SimpleDateFormat sfdTime = new SimpleDateFormat("HH:mm");
		SimpleDateFormat sfdDate = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat sfdDateTime = new SimpleDateFormat("yyyy-MM-dd HH:mm");
									
		String startTime = sfdTime.format(sfdDateTime.parse(formData.getString("hykssj")));
		String endTime = sfdTime.format(sfdDateTime.parse(formData.getString("hyjssj")));
		Date startDate = zqkssj;
		Date dd = new Date(); 
		CronExpression exp = new CronExpression(cronExpression);
		dd=exp.getNextValidTimeAfter(dd);
		if ("每日".equals(zqlx)) {
			
		}
		//拿到在周期内开始时间的触发时间
		while ( dd.compareTo(zqkssj)<0) {
			System.out.println(dd);
			dd=exp.getNextValidTimeAfter(dd);
			}
			while(startDate.compareTo(zqjssj) <= 0 && dd.compareTo(zqjssj)<=0 ) {
				//判断周期是不是每两周
				if (zqlx.length()==6) {
					dd.setDate(dd.getDate()+7);
				}
				calendar.setTime(dd);
				startDate = calendar.getTime();
			
				DataObject objDate = DataObjectUtil.createDataObject("com.primeton.das.datatype.AnyType");
				String tmpStartDate = sfdDate.format(startDate) + " " + startTime;
				String tmpEndDate = sfdDate.format(startDate) + " " + endTime;
				objDate.set("hykssj", tmpStartDate);
				objDate.set("hyjssj", tmpEndDate);
			
				lstRsult.add(objDate);
				
				System.out.println(tmpStartDate+"-"+tmpEndDate);
				dd = exp.getNextValidTimeAfter(dd);

				
				
			//	calendar.setTime(startDate);
				/*if("0".equals(zqlx)) {   //每天
					calendar.set(Calendar.DAY_OF_YEAR, calendar.get(Calendar.DAY_OF_YEAR) + 1);
					System.out.println(calendar);
				} else if("1".equals(zqlx)) {	//每周
					calendar.set(Calendar.WEEK_OF_YEAR, calendar.get(Calendar.WEEK_OF_YEAR) + 1);
				} else if("2".equals(zqlx)) {	//每两周
					calendar.set(Calendar.WEEK_OF_YEAR, calendar.get(Calendar.WEEK_OF_YEAR) + 2);
				} else if("3".equals(zqlx)) {	//每月
					calendar.set(Calendar.MONTH, calendar.get(Calendar.MONTH) + 1);
				}
				*/
				System.out.println(startDate);

			}
		
		System.out.println(lstRsult);
		
		return lstRsult;
		
	}
	
	/**
	 * 创建会议申请
	 * @param formData
	 * @param hykssj
	 * @param hyjssj
	 * @return
	 */
	public DataObject createHysq(DataObject formData, String hysid, String hykssj, String hyjssj,String wechatreturnid,String cronExpression) {
		DataObject objResult = CopyHelper.INSTANCE.copy(formData);
		IUserObject uo = ProcessUtil.getCurrUserObject();
		String hysqid = objResult.getString("hysqid");
		if(StringUtils.isBlank(hysqid)) {
			hysqid = ProcessUtil.getUUID();
			objResult.set("hysqid", hysqid);
		}
		//获取会议申请日期
		String hysqsj="";   
	    Date dt = new Date();   
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");   
	    hysqsj = sdf.format(dt);   
		objResult.set("hysqsj", hysqsj);
		objResult.set("hykssj", hykssj);
		objResult.set("hyjssj", hyjssj);
		objResult.set("fqrid", uo.getUserId());
		objResult.set("fqrmc", uo.getUserName());
		objResult.set("wechatreturnid", wechatreturnid);
		objResult.set("cronexpress", cronExpression);
		return objResult;
	}
	
	/**
	 * 创建参会人员实体
	 * @param formData
	 * @return
	 */
	public List<DataObject> createChry(DataObject formData) {
		List<DataObject> lstResult = new ArrayList<DataObject>();
		
		String ryids = formData.getString("chryid");
		String rymcs = formData.getString("chrymc");
		String hysqid = formData.getString("hysqid");
		if(!StringUtils.isBlank(ryids)) {
			String[] arrRyid = ryids.split(",");
			String[] arrRymc = rymcs.split(",");
			for(int i = 0, iLen = arrRyid.length; i < iLen; i++) {
				if(StringUtils.isBlank(arrRyid[i])) continue;
				DataObject obj = DataObjectUtil.createDataObject("com.primeton.eos.ame_dailyoffice.hygl.AmeHycy");
				obj.set("hycyid", ProcessUtil.getUUID());
				obj.set("hysqid", hysqid);
				obj.set("cyzid", arrRyid[i]);
				obj.set("cyzmc", arrRymc[i]);
				lstResult.add(obj);
			}
		}
		return lstResult;
	}
	
	/**
	 * 验证会议室能否申请
	 * @param hysid
	 * @param hykssj
	 * @param hyjssj
	 * @return
	 */
	@Bizlet("验证会议室能否申请")
	public boolean checkRoomOccupy(String hysqid, String hysid, String hykssj, String hyjssj) {
		boolean bResult = false;
		DataObject criteria = DataFactory.INSTANCE.create("com.primeton.das.criteria", "criteriaType");
		criteria.set("_entity", "com.primeton.eos.ame_dailyoffice.hygl.AmeHysq");
		criteria.set("_expr[1]/hysid", hysid);
		criteria.set("_expr[2]/spzt", 1);
		criteria.set("_or[1]/_and[1]/_expr[1]/hykssj", hykssj);
		criteria.set("_or[1]/_and[1]/_expr[1]/_op", ">");
		criteria.set("_or[1]/_and[1]/_expr[2]/hykssj", hyjssj);
		criteria.set("_or[1]/_and[1]/_expr[2]/_op", "<");
		criteria.set("_or[1]/_and[2]/_expr[1]/hykssj", hykssj);
		criteria.set("_or[1]/_and[2]/_expr[1]/_op", "<=");
		criteria.set("_or[1]/_and[2]/_expr[2]/hyjssj", hyjssj);
		criteria.set("_or[1]/_and[2]/_expr[2]/_op", ">=");
		criteria.set("_or[1]/_and[3]/_expr[1]/hyjssj", hykssj);
		criteria.set("_or[1]/_and[3]/_expr[1]/_op", ">");
		criteria.set("_or[1]/_and[3]/_expr[2]/hyjssj", hyjssj);
		criteria.set("_or[1]/_and[3]/_expr[2]/_op", "<");
		criteria.set("_or[1]/_and[4]/_expr[1]/hykssj", hykssj);
		criteria.set("_or[1]/_and[4]/_expr[1]/_op", ">=");
		criteria.set("_or[1]/_and[4]/_expr[2]/hyjssj", hyjssj);
		criteria.set("_or[1]/_and[4]/_expr[2]/_op", "<=");
		
		if(!StringUtils.isBlank(hysqid)) criteria.set("_not[1]/_expr[1]/hysqid", hysqid);
		int iCount = DatabaseUtil.count("default", criteria);
		if(iCount > 0) bResult = true;

		return bResult;
	}
	
	/**
	 * @param formData
	 * @param extDataMap
	 * @return
	 * @throws Exception
	 */
	@Bizlet("查询会议使用数据")
	public DataObject queryHyData(DataObject formData,String pkName) throws Exception {
		return super.queryBusinessData(formData,pkName);
	}
	
	


	@Override
	protected Map<String, Object> getBusinessDataMap() {
		// TODO 自动生成的方法存根
		return null;
	}
	//com.primeton.eos.ame_dailyoffice.hygl.AmeHysq
	//com.primeton.eos.ame_dailyoffice.hygl.queryHyglList
	@Bizlet("会议申请数据")
	public DataObject [] queryHyglList() throws Exception {
		String cbName = "com.primeton.eos.ame_dailyoffice.hygl.AmeHysq";
		return super.queryBusinessList(cbName);
	}
	
	
	
	/**
	 * 
	 * @param hysqid
	 */
	@Bizlet
	public DataObject[] queryHycx(DataObject criteria, DataObject page){
		return com.eos.foundation.database.DatabaseExt.queryEntitiesByCriteriaEntityWithPage("default", criteria, page);
	}
	
	/**
	 * 查询会议申请基本信息
	 * @param startTime
	 * @param endTime
	 * @return
	 */
	@Bizlet
	public DataObject[] queryHysqBaseInfo(String startTime,String endTime){
		DataObject criteria=DataFactory.INSTANCE.create("com.primeton.das.criteria","criteriaType");
		criteria.set("_entity", "com.primeton.eos.ame_dailyoffice.hygl.AmeHysq");
		criteria.set("_expr[1]/hykssj",startTime);
		criteria.set("_expr[1]/_op",">");
		criteria.set("_expr[2]/hyjssj",endTime);
		criteria.set("_expr[2]/_op","<");
		return DatabaseUtil.queryEntitiesByCriteriaEntity("default", criteria);
	}
	
	/**
	 * 我的会议申请
	 * @param hysqid
	 */
	@Bizlet
	public DataObject[] queryWsqdhy(String hysqid){
		IUserObject uo = ProcessUtil.getCurrUserObject();
		DataObject criteria=DataFactory.INSTANCE.create("com.primeton.das.criteria","criteriaType");
		criteria.set("_entity", "com.primeton.eos.ame_dailyoffice.hygl.AmeHysq");
		criteria.set("_expr[1]/hysqid",hysqid);
		criteria.set("_expr[1]/fqrid",uo.getUserId());	
		return DatabaseUtil.queryEntitiesByCriteriaEntity("default", criteria);
	}
	
	/**
	 * 我的会议查询
	 * @param hysqid
	 */
	@Bizlet
	public DataObject[] queryWdhy(String cyzid){
		DataObject criteria=DataFactory.INSTANCE.create("com.primeton.das.criteria","criteriaType");
		criteria.set("_entity", "com.primeton.eos.ame_dailyoffice.hygl.QueryHyglList");
		criteria.set("_expr[1]/cyzid",cyzid);	
		return DatabaseUtil.queryEntitiesByCriteriaEntity("default", criteria);
	}
	
	
	
	/**
	 * 结束会议
	 * @param hysqid
	 */
	@Bizlet
	public void updateHysqjssj(String hysqid){
		String currentTime = getSysDate();
		DataObject criteria = DataFactory.INSTANCE.create("com.primeton.das.criteria","criteriaType");
		criteria.set("_entity", "com.primeton.eos.ame_dailyoffice.hygl.AmeHysq");
		criteria.set("_expr[1]/hysqid",hysqid);	
		DataObject tmpEntity = DataObjectUtil.createDataObject("com.primeton.eos.ame_dailyoffice.hygl.AmeHysq");
		DatabaseUtil.expandEntityByCriteriaEntity("default", criteria, tmpEntity);
		String hyjssj = tmpEntity.getString("hyjssj");
		//如果当前时间大于会议的结束时间，无操作，若小于，则更新会议的结束时间为当前时间
		if(currentTime.compareTo(hyjssj) <= 0) {
			DataObject hysq = DataObjectUtil.createDataObject("com.primeton.eos.ame_dailyoffice.hygl.AmeHysq");
			hysq.set("hyjssj", currentTime);
			DatabaseUtil.updateEntityByCriteriaEntity("default", hysq, criteria);
		}
	}
	
	/**
	 * @return
	 */
	public String getSysDate() {
		Date date= new Date();//创建一个时间对象，获取到当前的时间
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");//设置时间显示格式
		String currentTime = sdf.format(date);//将当前时间格式化为需要的类型
		return currentTime;
	}
	
	//取消会议	
	/**
	 * @param formDatas
	 * @return
	 */
	@Bizlet("取消会议")
	public boolean deleteHysq(DataObject[] formDatas){
			return super.delete(formDatas,"hysqid");
	}
			
	/**
	 * 校验会议室是否被占用
	 * @param hykssj
	 * @param hyjssj
	 * @param hysids
	 * @param sFqrid   //会议发起人ID(用来取消提交回退件时"会议室被占用"的提示)
	 * @return
	 */
	@Bizlet("")
	public List<String> checkSave(String hykssj,String hyjssj,String hysids,String hysqid,String flag){
		
		if(StringUtils.isBlank(hysids)){
			return null;
		}
		
		DataObject criteria=DataFactory.INSTANCE.create("com.primeton.das.criteria","criteriaType");
		criteria.set("_entity", "com.geostar.gtgh.oa.officeaffairs.affairsdataset.HysqBaseInfo");
		criteria.set("_and[1]/_or[1]/_expr[1]/hykssj",hykssj);
		criteria.set("_and[1]/_or[1]/_expr[1]/_op",">");
		criteria.set("_and[1]/_or[1]/_expr[2]/hyjssj",hykssj);
		criteria.set("_and[1]/_or[1]/_expr[2]/_op",">");
		criteria.set("_and[1]/_or[2]/_expr[1]/hykssj",hyjssj);
		criteria.set("_and[1]/_or[2]/_expr[1]/_op","<");
		criteria.set("_and[1]/_or[2]/_expr[2]/hyjssj",hyjssj);
		criteria.set("_and[1]/_or[2]/_expr[2]/_op","<");
		
		String hysidstemp = hysids.replaceAll("\\|", ",");
		
		criteria.set("_and[1]/_expr[1]/hysid",hysidstemp);
		criteria.set("_and[1]/_expr[1]/_op","in");
		
		DataObject[] dataObj = DatabaseUtil.queryEntitiesByCriteriaEntity("default", criteria);
		
		if(dataObj.length>0 && StringUtils.isNotEmpty(hysids)){
			List<String> list = new ArrayList<String>() ;
			String[] aHysids=hysids.split("\\|");
			for(int i = 0;i < dataObj.length;i++){
				for(int j = 0;j < aHysids.length;j++){
					if("1".equals(flag)){
						if(dataObj[i].get("hysid").equals(aHysids[j]) && !dataObj[i].get("hysqid").equals(hysqid)){
							list.add((String) dataObj[i].get("hysmc"));
						}
					}
					if("0".equals(flag)){
						System.out.println(dataObj[i].get("hysid"));
						System.out.println(aHysids[j]);
						if(dataObj[i].get("hysid").equals(aHysids[j])){
							list.add((String) dataObj[i].get("hysmc"));
						}
					}
				}
			}
			HashSet<String> h  =   new  HashSet<String>(list);
		    list.clear();
		    list.addAll(h);
			return list;
		}
		return null;
	}
	
	@Bizlet("创建会议管理流程")
	public DataObject createSealUseProcess(String ywlx,DataObject formData) throws Exception{
		Map<String, Object> procRelaDataMap = null;
		
		//拼接processInstName，processInstDesc
		String hyzt = formData.getString("hyzt");
		String username = formData.getString("fqrmc");
		BusinessParam businessParam = AmeConstants.YWLX_UTIL_MAP.get("HYGL");
		String processDefName = businessParam.getProcessDefName();
		String processInstName = username + "发起的关于" + hyzt+ businessParam.getProcessInstName();
		String processInstDesc = username + "发起的关于" + hyzt+ businessParam.getProcessInstDesc();
				
		//创建流程实例，并设置相关数据
		long processInstID = BPSServiceClientFactory.getDefaultClient().getProcessInstManager().createAndStartProcInstAndSetRelativeData(
				processDefName,
				processInstName,
				processInstDesc,
				false,
				procRelaDataMap
			);
		formData.set("processinstid",processInstID);
		
		DataObject[] workItems = WorkItemHelper.queryWorkItemidByProcessinstid(processInstID);
		if(!ArrayUtils.isEmpty(workItems)){
			Long workitemid = workItems[0].getLong("workitemid");
			
			BPFFServiceFactory.getWFWorkItemManager().finishWorkItem(workitemid, false);
		}
		return formData;
	}
	
	@SuppressWarnings("unused")
	private DataObject[] getEmpList(String checkerid) {
		DataObject criteriaEntity = DataFactory.INSTANCE.create("com.primeton.das.criteria","criteriaType");
		criteriaEntity.set("_entity","org.gocom.abframe.dataset.organization.OmEmployee");
		criteriaEntity.set("_expr[1]/_property","userid");
		criteriaEntity.set("_expr[1]/_op","in");
		criteriaEntity.set("_expr[1]/_value",checkerid);
		DataObject [] datas  = DatabaseUtil.queryEntitiesByCriteriaEntity("default", criteriaEntity);
		return datas;
	}

}
