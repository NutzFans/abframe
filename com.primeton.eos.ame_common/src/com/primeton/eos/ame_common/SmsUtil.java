package com.primeton.eos.ame_common;

import java.util.HashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.eos.foundation.eoscommon.BusinessDictUtil;
import com.eos.system.annotation.Bizlet;

public class SmsUtil {
	
	/**
	 * 发送短信接口
	 * @param url 短信接口地址
	 * @param user 短信平台账户
	 * @param pwd  短信平台账户密码
	 * @param mobile 接收者手机号码
	 * @param msg    短信内容
	 * @param needStatus 是否需要状态推送
	 * @param extno 扩展
	 * @return
	 */
	@Bizlet("发送短信接口")
	public String sendSms(String url,String user,String pwd,String mobile,String msg,
			boolean needStatus,String extno){
		String return_str = "";
		Map<String,String> params = new HashMap<String,String>();
		params.put("un", user);
		params.put("pw", pwd);
		params.put("phone", mobile);
		params.put("rd",String.valueOf(needStatus?1:0));
		params.put("msg", msg);
		params.put("ex", extno);
		try {
			return_str = HttpClientUtil.post(url, params);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(return_str!=null){
			return_str = return_str.replaceAll("\n", ",");
		}
		return return_str;
			
	}
	
	/**
	 * 
	 * @param url
	 * @param user
	 * @param pwd
	 * @return
	 */
	@Bizlet("短信条数余额查询接口")
	public String queryBalance(String url,String user,String pwd){
		String return_str = "";
		Map<String,String> params = new HashMap<String,String>();
		params.put("un", user);
		params.put("pw", pwd);
		try {
			return_str = HttpClientUtil.post(url, params);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(return_str!=null){
			return_str = return_str.replaceAll("\n", ",");
		}
		return return_str;
	}
	
	/**
	 * 
	 * 校验手机号码是否合法
	 * @param user
	 * @param telphone
	 * @return
	 */
	@Bizlet("校验手机号码是否合法")
	public String checkTelPhone(Map paramsMap,String status){
		String telphone = (String)paramsMap.get("telphone");
		
		if(telphone ==null || telphone.trim().equals("")){
			//手机号不能为空
			paramsMap.put("msgInfo", "手机号码不能为空");
			return "900";
		}
		//去掉空格
		telphone = telphone.replaceAll(" ", "");
		//从字典中取判断规则
		String reg = BusinessDictUtil.getDictName("SMS_CONFIG", "PHONE_REG");
		Pattern p = Pattern.compile(reg);
		int telphone_number = 1;
		
		if(telphone.contains(",")){
			String[] telphones = telphone.split(",");
			telphone_number = telphones.length;
			for(int i =0;i<telphone_number;i++){
				String temp_telphone = telphones[i];
				if(temp_telphone!=null && !temp_telphone.equals("")){
					Matcher m = p.matcher(temp_telphone);
					if(!m.matches()){
						//打印日志
						paramsMap.put("msgInfo", "手机号码:"+temp_telphone+",格式不正确");
						status = "901";			
						break;
					}
				}else{//存在手机号为空的情况
					paramsMap.put("msgInfo", "中间存在手机号为空");
					status = "902";
					break;
				}
			}
		}else{
			Matcher m = p.matcher(telphone);
			boolean flag = m.matches();
			if(!flag){
				paramsMap.put("msgInfo", "手机号:"+telphone+",格式不正确");
				status = "901";
			}
		}
		paramsMap.put("telphoneNumber",telphone_number);
		return status;
	}
	
	/**
	 * 
	 * @param paramsMap
	 * @param status
	 * @return
	 */
	@Bizlet("校验短信内容")
	public static  String checkSmsContent(Map paramsMap,String status){
		if(!status.equals("999")){
			return status;
		}
		String smsContent = (String)paramsMap.get("smsContent");
		String sign = (String)paramsMap.get("sign");
		int number = sign.length();
		if(smsContent ==null || smsContent.trim().equals("")){
			//短信内容不能为空
			paramsMap.put("msgInfo", "短信内容不能为空");
			return "910";
		}else{
			//去掉空格
			smsContent = smsContent.replaceAll(" ", "");
			if(smsContent.equals("")){
				paramsMap.put("msgInfo", "短信内容不能为空");
				return "910";
			}
			paramsMap.put("wordNumber", smsContent.length()+number);
		}
		
		return status;
	}
	
	/**
	 * 
	 * @param paramsMap
	 * @param status
	 * @return
	 */
	@Bizlet("校验接收人姓名")
	public static String checkName(Map paramsMap,String status){
		if(!status.equals("999")){
			return status;
		}
		
		String userName = (String)paramsMap.get("userName");
		
		
		if(userName ==null || userName.trim().equals("")){
			//手机号不能为空
			paramsMap.put("msgInfo", "接收人姓名不能为空");
			return "920";
		}
		//去掉中间空格
		userName = userName.replaceAll(" ", "");
		int personNumber = 1;
		if(userName.contains(",")){
			String[] names =  userName.split(",");
			personNumber =names.length;
			for(int i =0;i<personNumber;i++ ){
				String name = names[i];
				if(name==null||name.equals("")){
					paramsMap.put("msgInfo", "接受人的姓名存在为空");
					status = "921";
					break;
				}
			}
		}
		paramsMap.put("personNumber", personNumber);
		return status;
	}
	
	/**
	 * 
	 * @param paramsMap
	 * @param status
	 * @return
	 */
	@Bizlet("校验接收人姓名与接收人个数是否匹配")
	public static String checkNumber(Map paramsMap,String status){
		if(!status.equals("999")){
			return status;
		}
		int personNumber = (Integer)paramsMap.get("personNumber");
		int telphoneNumber = (Integer)paramsMap.get("telphoneNumber");
		if(personNumber !=telphoneNumber){
			paramsMap.put("msgInfo", "接受人的手机号码个数与姓名个数不匹配");
			status = "930";
		}
		return status;
	}
	/**
	 * 
	 * @param wordNumber
	 * @param maxLenght
	 * @param personNumber
	 * @return
	 */
	@Bizlet("计算总条数")
	public static void count(Map paramsMap ,String maxLenght){
		int personNumber = (Integer)paramsMap.get("personNumber");
	    int wordNumber = (Integer)paramsMap.get("wordNumber");
	    int max = Integer.valueOf(maxLenght);
	    int count =0;
	    //如果大于70，每条按照67个字符算，（长短信）最多500个字符
	    if(wordNumber>max){
	    	max = max-3;
	    }
	    if(wordNumber%max==0){
	    	count =personNumber*(wordNumber/max);
	    }else{
	    	count =personNumber*(wordNumber/max +1);
	    }
		paramsMap.put("count", count);
	}
	
	
	/**
	 * 
	 * @param content
	 * @return
	 */
	@Bizlet("短信内容解析")
	public static String[] returnContent(String content){
		return content.split(",");
	}
}
