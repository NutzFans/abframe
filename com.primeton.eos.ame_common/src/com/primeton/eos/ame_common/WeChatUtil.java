package com.primeton.eos.ame_common;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.ByteArrayInputStream;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.security.KeyStore;
import java.security.SecureRandom;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.Set;

import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.KeyManager;
import javax.net.ssl.KeyManagerFactory;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSocketFactory;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jdom.Document;
import org.jdom.Element;
import org.jdom.JDOMException;
import org.jdom.input.SAXBuilder;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;

import com.eos.data.datacontext.DataContextManager;
import com.eos.data.datacontext.IMUODataContext;
import com.eos.data.datacontext.IUserObject;
import com.eos.data.datacontext.UserObject;
import com.eos.engine.component.ILogicComponent;
import com.eos.foundation.common.utils.StringUtil;
import com.eos.foundation.database.DatabaseUtil;
import com.eos.foundation.eoscommon.BusinessDictUtil;
import com.eos.runtime.core.TraceLoggerFactory;
import com.eos.system.annotation.Bizlet;
import com.eos.system.logging.Logger;
import com.primeton.ext.common.muo.MUODataContextHelper;
import com.primeton.ext.engine.component.LogicComponentFactory;
import com.raqsoft.report.model.expression.function.convert.Char;

import commonj.sdo.DataObject;

public class WeChatUtil {
	private static Logger log = TraceLoggerFactory.getLogger(WeChatUtil.class);
	
	//微信企业号ID，不会变化
	public static final String AME_WE_CHAT="AME_WE_CHAT";
	public static final String AME_WE_PAY = "AME_WE_PAY";
	public static final String CORP_Id = BusinessDictUtil.getDictName(AME_WE_CHAT, "CORP_ID");
	//微信支付的商户号
	public final static String MCHID = BusinessDictUtil.getDictName(AME_WE_PAY, "MECH_ID");
	
	
	
	/**
	 * 获取邮箱访问权限的token
	 * @return
	 */
	@Bizlet("更新mailtoken")
	public static String getMailAccessToken(){
		//获取access_token的接口地址，而且，是采用get方式提交的
		String url = BusinessDictUtil.getDictName(AME_WE_CHAT, "MAILTOKEN_URL");
		String corpsecret = BusinessDictUtil.getDictName(AME_WE_CHAT, "MAILSECRECT");
		String CORP_Id = BusinessDictUtil.getDictName(AME_WE_CHAT, "MAILCORP_Id");
		String param = "corpid="+CORP_Id+"&corpsecret="+corpsecret;
		String str = HttpClientUtil.getMethodInvoke(url, param);
		JSONObject json = (JSONObject)JSONValue.parse(str);
		String access_token = (String)json.get("access_token");
		//如果这个没有，说明接口没有条用成功
		if(access_token==null){
			Long errcode = (Long)json.get("errcode");
			return errcode+"";
		}else{
			//将内容放入缓存中
			updateMailToken(access_token);
			return "SUCC";
		}
	}
	
	
	@Bizlet("更新mailtoken")
	public static void updateMailToken(String access_token){
		//更新自己的缓存
		Constants.CACHE_MAP.put(Constants.MAILACCESS_TOKEN, access_token);
	}
	
	
	@Bizlet("更新数钱游戏缓存")
	public static void updateMonGameToken(String userid,int values,String actmoneyid){
		HashMap value = Constants.CACHE_MAP1.get(actmoneyid);
		if(value!=null){
			value.put(userid, values);
		}else{
			 value = new HashMap<String, HashMap>();
			 value.put(userid, values);
			 Constants.CACHE_MAP1.put(actmoneyid, value);
		}
	}
	@Bizlet("获取数钱游戏缓存并排序")
	public static DataObject[] getMonCache(String key,int length,boolean isWait){
		if(isWait){
			try{   
				Thread.currentThread().sleep(5000);//毫秒   
			}catch(Exception e){}
		}
		HashMap value = Constants.CACHE_MAP1.get(key);
		if(value == null){
			DataObject[] newdata = new DataObject[0];
			return newdata;
		}else{
			List<Map.Entry<String, Integer>> infoIds =
				    new ArrayList<Map.Entry<String, Integer>>(value.entrySet());
			Collections.sort(infoIds, new Comparator<Map.Entry<String, Integer>>() {   
			    public int compare(Map.Entry<String, Integer> o1, Map.Entry<String, Integer> o2) {      
			    	return o2.getValue().compareTo(o1.getValue()); 
			        //return (o1.getKey()).toString().compareTo(o2.getKey());
			    }
			});
			int actlen = 0;
			if(length<=infoIds.size()&&length!=0){
				actlen = length;
			}else{
				actlen = infoIds.size();
			}
			DataObject[] newdata = new DataObject[actlen];
			for(int i=0;i<actlen;i++){
				commonj.sdo.DataObject aaa = commonj.sdo.helper.DataFactory.INSTANCE.create("com.primeton.ame.act.actData","AmeActivityMoned");
				newdata[i]  = aaa;
				newdata[i].set("userid",infoIds.get(i).getKey());
				newdata[i].set("countnum",infoIds.get(i).getValue());
			}
			return newdata;
		}
		
	}
	/**
	 * 
	 * @param userID   邮箱帐号，一旦生成，将不可修改，作为主键。
	 * @param name     姓名
	 * @param telphone  手机号码
	 * @param department 部门ID,用orgid即可
	 * @param gender 性别  1:男, 2:女
	 * @param position 职位信息,是中文，不是代码,可不选
	 * @return
	 */
	@Bizlet("增加邮箱用户")
	public static String addMailEmp(String userID,String name,String telphone,int department,String gender,String position,String password) {
		String url = BusinessDictUtil.getDictName(AME_WE_CHAT, "ADD_MAILEMP_URL");
		String access_token =  getMailCache(Constants.MAILACCESS_TOKEN);
		//如果是空，说明获取token失败了		
		if(access_token==null){
			return "1";
		}
		url = url+"?access_token="+access_token;
		JSONObject json = new JSONObject();
		json.put("userid", userID);
		json.put("name", name);
		int[] depts = {department};
		JSONArray pa = new JSONArray();
		pa.add(depts[0]);
		json.put("department", pa);
		json.put("mobile", telphone);
		json.put("gender", gender);
		if(!StringUtil.isBlank(position)){
			json.put("position", position);
		}
		String str = HttpClientUtil.post(url, json.toString());
		JSONObject return_json = (JSONObject)JSONValue.parse(str);
		Long errcode = (Long)return_json.get("errcode");
		//0为正确
		return String.valueOf(errcode);
	}
	
	/**
	 * 
	 * @param userID
	 * @param name
	 * @param telphone
	 * @param department
	 * @param gender
	 * @param email
	 * @param position
	 * @param status 如果是离职的，修改这个。启用/禁用成员。1表示启用成员，0表示禁用成员
	 * @return
	 */
	@Bizlet("修改邮箱用户")
	public static String updateMailEmp(String userID,String password) {
		String url = BusinessDictUtil.getDictName(AME_WE_CHAT, "UPDATE_MAILEMP_URL");
		String access_token = getMailCache(Constants.MAILACCESS_TOKEN);
		if(access_token==null){
			return "1";
		}
		url = url+"?access_token="+access_token;
		//如果userID为空，直接返回
		if(StringUtil.isBlank(userID)){
			return "";
		}
		JSONObject json = new JSONObject();
		json.put("userid", userID);
		
		if(!StringUtil.isBlank(password)){
			json.put("password", password);
		}
		
		String str = HttpClientUtil.post(url, json.toString());
		JSONObject return_json = (JSONObject)JSONValue.parse(str);
		Long errcode = (Long)return_json.get("errcode");
		//0为正确
		if(errcode==0){
			return String.valueOf(errcode);
		}else if(errcode==40014||errcode==42001){//token过期了
			String re_str = getMailAccessToken();
			if(re_str.equals("SUCC")){
				access_token = getMailCache(Constants.MAILACCESS_TOKEN);
						
				url = url.substring(0, url.lastIndexOf("=")+1)+access_token;
				str = HttpClientUtil.post(url, json.toString());
				return_json = (JSONObject)JSONValue.parse(str);
				errcode = (Long)return_json.get("errcode");
				return String.valueOf(errcode);
			}else{
				return String.valueOf(errcode);
			}
		}else{
			return String.valueOf(errcode);
		}
	}
	public static String getMailCache(String key){
		String value = Constants.CACHE_MAP.get(key);
		if(value==null){
			String re_Str = getMailAccessToken();
			if(re_Str.equals("SUCC")){
				value = Constants.CACHE_MAP.get(key);
			}else{
				value = null;
			}
		}
		return value;
	}
	
	/**
	 * 获取访问权限的token
	 * @return
	 */
	public static String getAccessToken(String corpsecret){
		//获取access_token的接口地址，而且，是采用get方式提交的
		//不同应用设置不同的access_token,根据传入的secert
		String url = BusinessDictUtil.getDictName(AME_WE_CHAT, "TOKEN_URL");
		//String corpsecret = BusinessDictUtil.getDictName(AME_WE_CHAT, "SECRECT");
		String param = "corpid="+CORP_Id+"&corpsecret="+corpsecret;
		String str = HttpClientUtil.getMethodInvoke(url, param);
		JSONObject json = (JSONObject)JSONValue.parse(str);
		String access_token = (String)json.get("access_token");
		//如果这个没有，说明接口没有条用成功
		if(access_token==null){
			Long errcode = (Long)json.get("errcode");
			return errcode+"";
		}else{
			//将内容放入缓存中
			updateTokenAndTicket(corpsecret,access_token);
			return "SUCC";
		}
	}
	
	public static String getCache(String key){
		String value = Constants.CACHE_MAP.get(key);
		if(value==null){
			String re_Str = getAccessToken(key);
			if(re_Str.equals("SUCC")){
				value = Constants.CACHE_MAP.get(key);
			}else{
				value = null;
			}
		}
		return value;
	}
	@Bizlet("更新token和ticket的数据字典")
	public static void updateTokenAndTicket(String corpsecret,String access_token){
		//更新自己的缓存
		Constants.CACHE_MAP.put(corpsecret, access_token);
		updateJSAPITicket(access_token);
		
		//更新数据字典
		//updateDict(AME_WE_CHAT,"TOKEN",access_token);
		//重载缓存,这个是重载所有，考虑只重载当前这个key，才最合理
		//BusinessDictUtil.reLoad();
	}
	
	/**
	 * 先获取JSAPI_TICKET,然后更新缓存中的jsapi_ticket
	 * @param access_token
	 */
	public static void updateJSAPITicket(String access_token){
		 String url = BusinessDictUtil.getDictName("AME_WE_CHAT", "JSAPI_TICKET_URL");
	     String param = "access_token=ACCESS_TOKEN&type=jsapi";
	     param = param.replace("ACCESS_TOKEN", access_token);
	     // 发起GET请求获取凭证
	     String return_msg = HttpClientUtil.getMethodInvoke(url, param);
	     JSONObject return_json = (JSONObject)JSONValue.parse(return_msg);
	     String ticket = (String)return_json.get("ticket");
	     //更新缓存
	     Constants.CACHE_MAP.put(Constants.JSAPI_TOKEN, ticket);
	     //WeChatUtil.updateDict("AME_WE_CHAT", "JSAPI_TICKET", ticket);
	}
	
	/**
	 * 更新数据字典
	 * @param cacheName
	 * @param key
	 * @param value
	 */
	public static void updateDict(String cacheName,String key,String value){
		commonj.sdo.DataObject eosDictEntry = commonj.sdo.helper.DataFactory.INSTANCE
				.create("org.gocom.abframe.dataset.tools",
						"EosDictEntry");
		eosDictEntry.setString("eosDictType/dicttypeid", cacheName);
		eosDictEntry.setString("dictid", key);
		eosDictEntry.setString("dictname", value);
		DatabaseUtil.updateEntity("default", eosDictEntry);
		
		
	}
	
	/**
	 * 
	 * @param touser 存放用户ID，多个采用|分割，最多支持1000，特殊情况，可支持@all,会向所有成员都发送
	 * @param toparty 按组织机构发送，多个采用|分割，最多支持100	
	 * @param totag  按标签发送，多个采用|分割，最多支持100	
	 * @param content 微信内容，最长不超过2048个字节
	 * @param agentid
	 * @return
	 */
	@Bizlet("发送微信文本消息接口")
	public static Long sendWXMsg(String touser,String toparty,String totag,String content,String agentid){
		//根据agentid获取secert
		DataObject[] dicts = BusinessDictUtil.getDictInfoByType("AME_WE_APP");
		String	corpsecret = null;
		for(int i=0;i<dicts.length;i++){
			if(dicts[i].get("dictID").equals(agentid)){
				corpsecret = (String) dicts[i].get("filter1");
			}
		}
		String access_token =  getCache(corpsecret);
		//如果是空，说明获取token失败了		
		if(access_token==null){
			return Long.valueOf("1");
		}
		String url = BusinessDictUtil.getDictName(AME_WE_CHAT, "SEND_MSG");
		url = url+"?access_token="+access_token;
		touser = touser.replaceAll(",", "|");
		//微信内容
		JSONObject msg = new JSONObject();
		msg.put("content", content);
				
		JSONObject json = new JSONObject();
		json.put("touser", touser);
		if(toparty!=null){
			json.put("toparty", toparty);
		}
		if(totag!=null){
			json.put("totag", totag);
		}
		 
		json.put("text", msg);
		json.put("agentid", agentid);
		json.put("msgtype", "text");//目前只支持文本型
		String params = json.toString();
		/**
		 * 如果不转换，微信接口异常
		 * 公司这个json的jar包，在转化json的时候，把部分标点换成转义符
		 * 暂时只是发现这个，其他的还不知道，这是一个隐患
		 */
		params = params.replace("\\u201C", "“");
		params = params.replace("\\u201D", "”");
		
		String return_msg = HttpClientUtil.post(url, params);
		JSONObject return_json = (JSONObject)JSONValue.parse(return_msg);
		Long errcode = (Long)return_json.get("errcode");
		if(errcode==0){
			return errcode;
		}else if(errcode==40014 || errcode==42001){//token过期了
			String re_str = getAccessToken(corpsecret);
			if(re_str.equals("SUCC")){
				access_token =  getCache(corpsecret);
				//如果是空，说明获取token失败了		
				if(access_token==null){
					return Long.valueOf("1");
				}
				
				url = url.substring(0, url.lastIndexOf("=")+1)+access_token;
				return_msg = HttpClientUtil.post(url, json.toString());
				return_json = (JSONObject)JSONValue.parse(return_msg);
				errcode = (Long)return_json.get("errcode");
				return errcode;
			}else{
				return errcode;
			}
		}else{
			return errcode;
		}
		
	}
	
	
	
	/**
	 * 人员的DataObject
	 * @param exportData
	 * @return
	 */
	@Bizlet("导出用户信息")
	public static String exportUserCSV(DataObject[] exportData) {
		String path="D://";
		File dir = new File(path);
		File csvFile = null;
		BufferedWriter csvFileOutputStream = null;
		try {
			if(!dir.exists()){
				dir.mkdir();
			}
			csvFile = new File(dir,"primenton_user.cvs");
			// UTF-8使正确读取分隔符"," 
			csvFileOutputStream = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(
			 csvFile), "UTF-8"), 1024);
			
			// 写入文件头部 
			csvFileOutputStream.write("姓名,帐号,微信号,手机号,邮箱,所在部门,职位");
			//换行
			csvFileOutputStream.newLine();
			// 写入文件内容 
			for(int i=0;i<exportData.length;i++){
				DataObject data = exportData[i];
				String userid= data.getString("userid");
				String empname= data.getString("empname");
				String mail= data.getString("oemail");
				String mobileno= data.getString("mobileno");
				
				String degree= data.getString("degree");
				
				int orgid= data.getInt("orgid");
				
				csvFileOutputStream.write(empname);
				csvFileOutputStream.write(",");
				
				csvFileOutputStream.write(userid);
				csvFileOutputStream.write(",");
				
				csvFileOutputStream.write(" ,");
				
				csvFileOutputStream.write(mobileno);
				csvFileOutputStream.write(",");
				
				csvFileOutputStream.write(""+mail);
				csvFileOutputStream.write(",");
				
				csvFileOutputStream.write(""+orgid);
				csvFileOutputStream.write(",");
				
				csvFileOutputStream.write(""+degree);
				csvFileOutputStream.newLine();
			}
			csvFileOutputStream.flush();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				csvFileOutputStream.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return csvFile.getAbsolutePath();
	}
	
	/**
	 * 组织机构的DataObject
	 * @return
	 */
	@Bizlet("导出cvs文件")
	public static File createCSVFile(DataObject[] exportData) {
		String filePath = BusinessDictUtil.getDictName(AME_WE_CHAT, "CVSPATH");
		File csvFile = null;
		BufferedWriter csvFileOutputStream = null;
		try {
			//定义文件名格式并创建 //C:/Users/devil_sh/Desktop/
			csvFile =File.createTempFile("primeton_org", ".csv", new File(filePath));
			// UTF-8使正确读取分隔符"," 
			csvFileOutputStream = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(
			 csvFile), "UTF-8"), 1024);
			// 写入文件头部 
			csvFileOutputStream.write("部门名称");
			csvFileOutputStream.write(",");
			csvFileOutputStream.write("部门ID");
			csvFileOutputStream.write(",");
			csvFileOutputStream.write("父部门ID");
			csvFileOutputStream.write(",");
			csvFileOutputStream.write("排序");
			//换行
			csvFileOutputStream.newLine();
			// 写入文件内容 
			for(int i=0;i<exportData.length;i++){
				DataObject data = exportData[i];
				String name= data.getString("orgname");
				int orgid= data.getInt("orgid");
				int parentorgid= data.getInt("omOrganization/orgid");
				int sortNo = data.getInt("sortno");
				csvFileOutputStream.write(name);
				csvFileOutputStream.write(",");
				
				csvFileOutputStream.write(""+orgid);
				csvFileOutputStream.write(",");
				
				csvFileOutputStream.write(""+parentorgid);
				csvFileOutputStream.write(",");
				
				csvFileOutputStream.write(""+sortNo);
				csvFileOutputStream.newLine();
			}
			csvFileOutputStream.flush();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				csvFileOutputStream.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return csvFile;
	}
	
	/**
	 * 
	 * @param userID   对于emp的userID，一旦生成，将不可修改，作为主键。
	 * @param name     姓名
	 * @param telphone  手机号码
	 * @param department 部门ID,用orgid即可
	 * @param gender 性别  1:男, 2:女
	 * @param email 公司邮箱
	 * @param position 职位信息,是中文，不是代码,可不选
	 * @return
	 */
	@Bizlet("增加用户")
	public static String addEmp(String userID,String name,String telphone,int department,String gender,String email,String position,String agentid) {
		String url = BusinessDictUtil.getDictName(AME_WE_CHAT, "ADD_EMP_URL");
		//根据agentid获取secert
		DataObject[] dicts = BusinessDictUtil.getDictInfoByType("AME_WE_APP");
		String	corpsecret = null;
		for(int i=0;i<dicts.length;i++){
			if(dicts[i].get("dictID").equals(agentid)){
				corpsecret = (String) dicts[i].get("filter1");
			}
		}
		String access_token =  getCache(corpsecret);
		//如果是空，说明获取token失败了		
		if(access_token==null){
			return "1";
		}
		url = url+"?access_token="+access_token;
		JSONObject json = new JSONObject();
		json.put("userid", userID);
		json.put("name", name);
		
		int[] depts = {department};
		JSONArray pa = new JSONArray();
		pa.add(depts[0]);
		json.put("department", pa);
		json.put("mobile", telphone);
		json.put("gender", gender);
		json.put("email", email);
		if(!StringUtil.isBlank(position)){
			json.put("position", position);
		}
		String str = HttpClientUtil.post(url, json.toString());
		JSONObject return_json = (JSONObject)JSONValue.parse(str);
		Long errcode = (Long)return_json.get("errcode");
		//0为正确
		if(errcode==0){
			return String.valueOf(errcode);
		}else if(errcode==40014 || errcode==42001){//token过期了
			String re_str = getAccessToken(corpsecret);
			if(re_str.equals("SUCC")){
				access_token = getCache(corpsecret);
						
				url = url.substring(0, url.lastIndexOf("=")+1)+access_token;
				str = HttpClientUtil.post(url, json.toString());
				return_json = (JSONObject)JSONValue.parse(str);
				errcode = (Long)return_json.get("errcode");
				return String.valueOf(errcode);
			}else{
				return String.valueOf(errcode);
			}
		}else{
			return String.valueOf(errcode);
		}
	}
	
	/**
	 * 
	 * @param department 部门ID,用orgid即可
	 * @return
	 */
	@Bizlet("获取个人信息")
	public static  JSONObject getEmp(String userid,String agentid) {
		String url = BusinessDictUtil.getDictName(AME_WE_CHAT, "GETUSER_URL");
		//根据agentid获取secert
		DataObject[] dicts = BusinessDictUtil.getDictInfoByType("AME_WE_APP");
		String	corpsecret = null;
		for(int i=0;i<dicts.length;i++){
			if(dicts[i].get("dictID").equals(agentid)){
				corpsecret = (String) dicts[i].get("filter1");
			}
		}
		String access_token = getCache(corpsecret);
		//String access_token = "O7x4RIDBZuNcXbAwbE5l3ZFgPoV03BL7Glq-rk6dP6HjQjbdLixqyuERb9ZHpo-C-e34ZvPNRFX09WlljYwcam_ffclS8nU9J-JWUHjYMt1uxjpVZ54WiTKPWfl-oju6hVa5M038tQBiCvBA7GkG4-ZYzf3dw4XUX6bwCFzpxXR38q2VeEJWQaf5t23qdH2eWuDoR4BOurmE2zQMoOAYjT-zL1AwS7HCMmM70TBxmOtDXvuI7LhhyrnXfvHKBP1DUacvNB8nTld6v7cWM1nrwJtU0aYZuOK3IFisBu33PHg";
		//如果是空，说明获取token失败了		
		if(access_token==null){
			return new JSONObject();
		}
		JSONObject json = new JSONObject();
		//"department_id=1000000000&status=0&access_token="+access_token;
		
		String str = HttpClientUtil.getMethodInvoke(url, "userid="+userid+"&access_token="+access_token);
		JSONObject return_json = (JSONObject)JSONValue.parse(str);
		Long errcode = (Long)return_json.get("errcode");
		if(errcode==0){
			return return_json;
		}else if(errcode==40014 || errcode==42001){//token过期了
			String re_str = getAccessToken(corpsecret);
			if(re_str.equals("SUCC")){
				return getEmp(userid,agentid);
			}else{
				return return_json;
			}
		}else{
			return return_json;
		}
		//0为正确
	}
	
	/**
	 * 
	 * @param department 部门ID,用orgid即可
	 * @return
	 */
	@Bizlet("查询全部用户")
	public static  JSONObject queryEmp(int department,String agentid) {
		String url = BusinessDictUtil.getDictName(AME_WE_CHAT, "ALLUSERINFO_URL");
		//根据agentid获取secert
		DataObject[] dicts = BusinessDictUtil.getDictInfoByType("AME_WE_APP");
		String	corpsecret = null;
		for(int i=0;i<dicts.length;i++){
			if(dicts[i].get("dictID").equals(agentid)){
				corpsecret = (String) dicts[i].get("filter1");
			}
		}
		String access_token = getCache(corpsecret);
		//如果是空，说明获取token失败了		
		if(access_token==null){
			return new JSONObject();
		}
		JSONObject json = new JSONObject();
		//"department_id=1000000000&status=0&access_token="+access_token;
		
		String str = HttpClientUtil.getMethodInvoke(url, "department_id="+department+"&status=0&access_token="+access_token);
		JSONObject return_json = (JSONObject)JSONValue.parse(str);
		Long errcode = (Long)return_json.get("errcode");
		if(errcode==0){
			return return_json;
		}else if(errcode==40014 || errcode==42001){//token过期了
			String re_str = getAccessToken(corpsecret);
			if(re_str.equals("SUCC")){
				return queryEmp(department, agentid);
			}else{
				return return_json;
			}
		}else{
			return return_json;
		}
		//0为正确
	}
	
	/**
	 * 
	 * @param department 部门ID,用orgid即可
	 * @return
	 */
	@Bizlet("查询全部用户详细信息")
	public static  JSONObject queryEmpDetail(int department,String agentid) {
		String url = BusinessDictUtil.getDictName(AME_WE_CHAT, "DETAILUSERINFO_URL");
		//根据agentid获取secert
		DataObject[] dicts = BusinessDictUtil.getDictInfoByType("AME_WE_APP");
		String	corpsecret = null;
		for(int i=0;i<dicts.length;i++){
			if(dicts[i].get("dictID").equals(agentid)){
				corpsecret = (String) dicts[i].get("filter1");
			}
		}
		String access_token = getCache(corpsecret);
		if(access_token==null){
			return new JSONObject();
		}
		//String access_token ="UxpdqSBY5bTD3wlHDed7-gTwq2COx2cSv5MCF0zm9esIpioxhs6DVd6rdTTGFeWG";
		//url = url+"?access_token="+access_token;
		JSONObject json = new JSONObject();
		//"department_id=1000000000&status=0&access_token="+access_token;
		
		String str = HttpClientUtil.getMethodInvoke(url, "department_id="+department+"&status=0&fetch_child=1&access_token="+access_token);
		JSONObject return_json = (JSONObject)JSONValue.parse(str);
		Long errcode = (Long)return_json.get("errcode");
		if(errcode==0){
			return return_json;
		}else if(errcode==40014 || errcode==42001){//token过期了
			String re_str = getAccessToken(corpsecret);
			if(re_str.equals("SUCC")){
				
				return queryEmpDetail( department, agentid);
			}else{
				return return_json;
			}
		}else{
			return return_json;
		}
		//0为正确
	}
	
	/**
	 * 
	 * @param userID   
	 * @return
	 */
	@Bizlet("删除用户")
	public static String deleteEmp(String userid,String agentid) {
		String url = BusinessDictUtil.getDictName(AME_WE_CHAT, "DELETE_URL");
		//根据agentid获取secert
		DataObject[] dicts = BusinessDictUtil.getDictInfoByType("AME_WE_APP");
		String	corpsecret = null;
		for(int i=0;i<dicts.length;i++){
			if(dicts[i].get("dictID").equals(agentid)){
				corpsecret = (String) dicts[i].get("filter1");
			}
		}
		String access_token = getCache(corpsecret);
		if(access_token==null){
			return "1";
		}		
		JSONObject json = new JSONObject();
		json.put("userid", userid);
		String str = HttpClientUtil.getMethodInvoke(url, "userid="+userid+"&access_token="+access_token);
		JSONObject return_json = (JSONObject)JSONValue.parse(str);
		Long errcode = (Long)return_json.get("errcode");
		if(errcode==0){
			return String.valueOf(errcode);
		}else if(errcode==40014 || errcode==42001){//token过期了
			String re_str = getAccessToken(corpsecret);
			if(re_str.equals("SUCC")){
				
				return deleteEmp(userid,agentid);
			}else{
				return String.valueOf(errcode);
			}
		}else{
			return String.valueOf(errcode);
		}
		//0为正确
	}
	/**
	 * 
	 * @param userID   
	 * @return
	 */
	@Bizlet("拼接错误信息")
	public static HashMap concatErr(String userid,HashMap map,String errcode) {
		Object a = map.get(errcode);
	
		boolean b = map.containsKey(errcode);
		if(b==true){
			userid = userid+","+a;
		}
		map.put(errcode, userid);
        
		return map;
	}
	
	/**
	 * 
	 * @param userID   
	 * @return
	 */
	@Bizlet("将hashmap转换为dataobject")
	public static commonj.sdo.DataObject[] convertDataob(HashMap map) {
		
        java.util.Set set = map.keySet();
       Object[] keys = set.toArray();
       commonj.sdo.DataObject[] maps = new DataObject[keys.length];
       for(int i=0;i<maps.length;i++){
			commonj.sdo.DataObject aaa = commonj.sdo.helper.DataFactory.INSTANCE.create("com.primeton.eos.ame_budget.ame_budget","BudgetTemp");
			maps[i]  = aaa;
		}
       for(int i = 0;i<keys.length;i++){
    	   String key = keys[i].toString();
    	   Object userid = map.get(key);
    	   String key1 = BusinessDictUtil.getDictName("AME_WE_STATUS", key);
    	   maps[i].set("error", key1);
    	   maps[i].set("userid", userid);
       }
       
		/*if(a != null){
			//userid = userid+","+a.get(userid);
		}*/
		//0为正确
		return maps;
	}
	
	/**
	 * 
	 * @param userID
	 * @param name
	 * @param telphone
	 * @param department
	 * @param gender
	 * @param email
	 * @param position
	 * @param status 如果是离职的，修改这个。启用/禁用成员。1表示启用成员，0表示禁用成员
	 * @return
	 */
	@Bizlet("修改用户")
	public static String updateEmp(String userID,String name,String telphone,DataObject[] department,String gender,String email,String position,String status,String agentid) {
		String url = BusinessDictUtil.getDictName(AME_WE_CHAT, "UPDATE_EMP_URL");
		//根据agentid获取secert
		DataObject[] dicts = BusinessDictUtil.getDictInfoByType("AME_WE_APP");
		String	corpsecret = null;
		for(int i=0;i<dicts.length;i++){
			if(dicts[i].get("dictID").equals(agentid)){
				corpsecret = (String) dicts[i].get("filter1");
			}
		}
		String access_token = getCache(corpsecret);
		if(access_token==null){
			return "1";
		}
		url = url+"?access_token="+access_token;
		//如果userID为空，直接返回
		if(StringUtil.isBlank(userID)){
			return "";
		}
		JSONObject json = new JSONObject();
		json.put("userid", userID);
		
		if(!StringUtil.isBlank(name)){
			json.put("name", name);
		}
		
		if(department!=null || department.length!=0){
			//调整部门
			JSONArray pa = new JSONArray();
			JSONArray isleader = new JSONArray();
			for(int i=0;i<department.length;i++){
				int orgid = department[i].getInt("orgid");
				int leader = department[i].getInt("isleader");
				pa.add(orgid);
				isleader.add(leader);
			}
			
			json.put("department", pa);
			json.put("is_leader_in_dept", isleader);
		}
		if(!StringUtil.isBlank(gender)){
			json.put("gender", gender);
		}
		
		if(!StringUtil.isBlank(telphone)){
			json.put("mobile", telphone);
		}
		
		if(!StringUtil.isBlank(email)){
			json.put("email", email);
		}
		
		if(!StringUtil.isBlank(position)){
			json.put("position", position);
		}
		
		if(!StringUtil.isBlank(status)){
			json.put("enable", status);
		}
		
		String str = HttpClientUtil.post(url, json.toString());
		JSONObject return_json = (JSONObject)JSONValue.parse(str);
		Long errcode = (Long)return_json.get("errcode");
		//0为正确
		if(errcode==0){
			return String.valueOf(errcode);
		}else if(errcode==40014 || errcode==42001){//token过期了
			String re_str = getAccessToken(corpsecret);
			if(re_str.equals("SUCC")){
				access_token = getCache(corpsecret);
						
				url = url.substring(0, url.lastIndexOf("=")+1)+access_token;
				str = HttpClientUtil.post(url, json.toString());
				return_json = (JSONObject)JSONValue.parse(str);
				errcode = (Long)return_json.get("errcode");
				return String.valueOf(errcode);
			}else{
				return String.valueOf(errcode);
			}
		}else{
			return String.valueOf(errcode);
		}
	}
	
	/**
	 * 
	 * @param exportData 导出组织机构DataObject
	 * @return
	 */
	@Bizlet("批量增加组织机构")
	public static String batchAddDept(DataObject[] exportData){
		//
		File file = createCSVFile(exportData);
		String mediaId = "";
		try {
			 mediaId = upload("",file);
		} catch (IOException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		String jobid = addDept(mediaId);
		return jobid;
	}
	
	public static String addDept(String mediaId){
		String url = BusinessDictUtil.getDictName(AME_WE_CHAT, "ADD_EMP_URL");
		String access_token = getCache(Constants.ACCESS_TOKEN);
		if(access_token==null){
			return "1";
		}
				//BusinessDictUtil.getDictName(AME_WE_CHAT, "TOKEN");
		url = url+"?access_token="+access_token;
		JSONObject json = new JSONObject();
		json.put("media_id", mediaId);
		String str =HttpClientUtil.post(url, json.toString());
		JSONObject return_json = (JSONObject)JSONValue.parse(str);
		Long errcode = (Long)return_json.get("errcode");
		String jobId = "";
		if(errcode==0){
			jobId = (String)return_json.get("jobid");
		}
		return jobId;
	}
	
	public static String upload(String url, File file) throws IOException {  
	    String result = null;  
	    if (!file.exists() || !file.isFile()) {  
	    	throw new IOException("文件不存在");  
	    }  
	    /** 
	    * 第一部分 
	    */  
	    URL urlObj = new URL(url);  
	    // 连接  
	    HttpURLConnection con = (HttpURLConnection) urlObj.openConnection();  
	    /** 
	    * 设置关键值 
	    */  
	    con.setRequestMethod("POST"); // 以Post方式提交表单，默认get方式  
	    con.setDoInput(true);  
	    con.setDoOutput(true);  
	    con.setUseCaches(false); // post方式不能使用缓存  
	  
	    // 设置请求头信息  
	    con.setRequestProperty("Connection", "Keep-Alive");  
	    con.setRequestProperty("Charset", "UTF-8");  
	    // 设置边界  
	    String BOUNDARY = "----------" + System.currentTimeMillis();  
	    con.setRequestProperty("Content-Type", "multipart/form-data; boundary="+ BOUNDARY);  
	  
	    // 请求正文信息  
	    StringBuilder sb = new StringBuilder();  
	    sb.append("--"); // 必须多两道线  
	    sb.append(BOUNDARY);  
	    sb.append("\r\n");  
	    sb.append("Content-Disposition: form-data;name=\"file\";filename=\""+ file.getName() + "\"\r\n");  
	    sb.append("Content-Type:application/octet-stream\r\n\r\n");  
	  
	  
	    byte[] head = sb.toString().getBytes("utf-8");  
	    // 获得输出流  
	    OutputStream out = new DataOutputStream(con.getOutputStream());  
	    // 输出表头  
	    out.write(head);  
	    // 文件正文部分  
	    // 把文件已流文件的方式 推入到url中  
	    DataInputStream in = new DataInputStream(new FileInputStream(file));  
	    int bytes = 0;  
	    byte[] bufferOut = new byte[1024];  
	    while ((bytes = in.read(bufferOut)) != -1) {  
	    	out.write(bufferOut, 0, bytes);  
	    }  
	    in.close();  
	  
	  
	    // 结尾部分  
	    byte[] foot = ("\r\n--" + BOUNDARY + "--\r\n").getBytes("utf-8");// 定义最后数据分隔线  
	  
	  
	    out.write(foot);  
	  
	  
	    out.flush();  
	    out.close();  
	  
	  
	    StringBuffer buffer = new StringBuffer();  
	    BufferedReader reader = null;  
	    try {  
	    // 定义BufferedReader输入流来读取URL的响应  
	    	reader = new BufferedReader(new InputStreamReader(con.getInputStream()));  
	    	String line = null;  
	    	while ((line = reader.readLine()) != null) {  
	    		buffer.append(line);  
	    	}  
		    if(result==null){  
		    	result = buffer.toString();  
		    }  
	    } catch (IOException e) {  
	    	System.out.println("发送POST请求出现异常！" + e);  
	    	e.printStackTrace();  
	    	throw new IOException("数据读取异常");  
	    } finally {  
	    	if(reader!=null){  
	    		reader.close();  
	    	}  
	    }  
	    JSONObject jsonObj = (JSONObject) JSONValue.parse(result);
	    String mediaId =(String)jsonObj.get("media_id");
	    
	    return mediaId;  
	}  
	
	/**
	 * 
	 * @param id
	 * @param name
	 * @param parentid
	 * @param department
	 * @param order
	 * @return
	 */
	@Bizlet("增加部门")
	public static String addDept(int id,String name,int parentid,int order,String agentid) {
		String url = BusinessDictUtil.getDictName(AME_WE_CHAT, "ADD_DEPT_URL");
		//根据agentid获取secert
		DataObject[] dicts = BusinessDictUtil.getDictInfoByType("AME_WE_APP");
		String	corpsecret = null;
		for(int i=0;i<dicts.length;i++){
			if(dicts[i].get("dictID").equals(agentid)){
				corpsecret = (String) dicts[i].get("filter1");
			}
		}
		String access_token = getCache(corpsecret);
		if(access_token==null){
			return "1";
		}
		url = url+"?access_token="+access_token;
		//如果userID为空，直接返回
		
		JSONObject json = new JSONObject();
		json.put("id", id);
		json.put("name", name);
		json.put("parentid", parentid);
		json.put("order", order);
		
		String str = HttpClientUtil.post(url, json.toString());
		JSONObject return_json = (JSONObject)JSONValue.parse(str);
		Long errcode = (Long)return_json.get("errcode");
		//0为正确
		if(errcode==0){
			return String.valueOf(errcode);
		}else if(errcode==40014 || errcode==42001){//token过期了
			String re_str = getAccessToken(corpsecret);
			if(re_str.equals("SUCC")){
				access_token = getCache(corpsecret);
						
				url = url.substring(0, url.lastIndexOf("=")+1)+access_token;
				str = HttpClientUtil.post(url, json.toString());
				return_json = (JSONObject)JSONValue.parse(str);
				errcode = (Long)return_json.get("errcode");
				return String.valueOf(errcode);
			}else{
				return String.valueOf(errcode);
			}
		}else{
			return String.valueOf(errcode);
		}
	}
	
	/**
	 * 不可修改id,如果非要修改ID,只能删除之后，再做修改，但是删除的时候，必须保证没有下级机构
	 * @param id
	 * @param name
	 * @param parentid
	 * @param department
	 * @param order
	 * @return
	 */
	@Bizlet("修改部门")
	public static String updateDept(int id,String name,int parentid,int order,String agentid) {
		String url = BusinessDictUtil.getDictName(AME_WE_CHAT, "UPDATE_DEPT_URL");
		//根据agentid获取secert
		DataObject[] dicts = BusinessDictUtil.getDictInfoByType("AME_WE_APP");
		String	corpsecret = null;
		for(int i=0;i<dicts.length;i++){
			if(dicts[i].get("dictID").equals(agentid)){
				corpsecret = (String) dicts[i].get("filter1");
			}
		}
		String access_token = getCache(corpsecret);
		if(access_token==null){
			return "1";
		}
		url = url+"?access_token="+access_token;
		//如果userID为空，直接返回
		JSONObject json = new JSONObject();
		json.put("id", id);
		json.put("name", name);
		json.put("parentid", parentid);
		json.put("order", order);
		
		String str = HttpClientUtil.post(url, json.toString());
		JSONObject return_json = (JSONObject)JSONValue.parse(str);
		Long errcode = (Long)return_json.get("errcode");
		//0为正确
		if(errcode==0){
			return String.valueOf(errcode);
		}else if(errcode==40014 || errcode==42001){//token过期了
			String re_str = getAccessToken(corpsecret);
			if(re_str.equals("SUCC")){
				access_token = getCache(corpsecret);
						
				url = url.substring(0, url.lastIndexOf("=")+1)+access_token;
				str = HttpClientUtil.post(url, json.toString());
				return_json = (JSONObject)JSONValue.parse(str);
				errcode = (Long)return_json.get("errcode");
				return String.valueOf(errcode);
			}else{
				return String.valueOf(errcode);
			}
		}else{
			return String.valueOf(errcode);
		}
	}
	
	@Bizlet("删除部门")
	public static String deleteDept(int id,String agentid) {
		String url = BusinessDictUtil.getDictName(AME_WE_CHAT, "DROP_DEPT_URL");
		//根据agentid获取secert
		DataObject[] dicts = BusinessDictUtil.getDictInfoByType("AME_WE_APP");
		String	corpsecret = null;
		for(int i=0;i<dicts.length;i++){
			if(dicts[i].get("dictID").equals(agentid)){
				corpsecret = (String) dicts[i].get("filter1");
			}
		}
		String access_token = getCache(corpsecret);
		if(access_token==null){
			return "1";
		}
		url = url+"?access_token="+access_token;
		//如果userID为空，直接返回
		JSONObject json = new JSONObject();
		json.put("id", id);
		
		String str = HttpClientUtil.post(url, json.toString());
		JSONObject return_json = (JSONObject)JSONValue.parse(str);
		Long errcode = (Long)return_json.get("errcode");
		//0为正确
		if(errcode==0){
			return String.valueOf(errcode);
		}else if(errcode==40014 || errcode==42001){//token过期了
			String re_str = getAccessToken(corpsecret);
			if(re_str.equals("SUCC")){
				access_token = getCache(corpsecret);
						
				url = url.substring(0, url.lastIndexOf("=")+1)+access_token;
				str = HttpClientUtil.post(url, json.toString());
				return_json = (JSONObject)JSONValue.parse(str);
				errcode = (Long)return_json.get("errcode");
				return String.valueOf(errcode);
			}else{
				return String.valueOf(errcode);
			}
		}else{
			return String.valueOf(errcode);
		}
	}
	
	/**
	 * 通过用户ID,初始化用户的Session
	 * @param userId
	 * @param request
	 * @param response
	 */
	public static void wechatLogin(String userId,HttpServletRequest request,
			HttpServletResponse response){
		
		UserObject userObject = new UserObject();
		userObject.setUserId(userId);
		loginMUO(userObject, request, (HttpServletResponse) response); // 先登陆一下，以便调用逻辑流
		try {
			userObject = initSessionUserObject(userId);
		} catch (Throwable e) {
			e.printStackTrace();
		} // 传入userId创建UserObject对象,调用逻辑流初始化session
		loginMUO(userObject, request, (HttpServletResponse) response); 
		try {
			opLog.saveop("微信登录", "系统管理", "6", "人员工号:"+userObject.getUserId()+",姓名:"+userObject.getUserName()+"登录系统");
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}
	
	@Bizlet("用户登陆")
	public static void loginMUO(UserObject userObject, HttpServletRequest request,
			HttpServletResponse response) {

		com.eos.data.datacontext.DataContextManager.current()
				.setMapContextFactory(
						new com.primeton.ext.access.http.HttpMapContextFactory(
								request, response));
		com.eos.access.http.OnlineUserManager.login(userObject);

		if (userObject != null) {
			Map<Object, Object> map = new HashMap<Object, Object>();
			map.put(IUserObject.KEY_IN_CONTEXT, userObject);
			IMUODataContext muo = MUODataContextHelper.create(map);
			DataContextManager.current().setMUODataContext(muo);
		}
	}

	/**
	 * 初始化Session数据
	 * 
	 * @param userId
	 * @param request
	 * @param response
	 * @return
	 * @throws Throwable
	 */
	@Bizlet("初始化用户信息")
	public static UserObject initSessionUserObject(String userId) throws Throwable {
		// 逻辑构件全称
		String componentName = "org.gocom.abframe.auth.LoginManager";
		// 逻辑流名称
		String logicName = "initUserObject";

		com.eos.engine.component.ILogicComponent comp = com.primeton.ext.engine.component.LogicComponentFactory
				.create(componentName);

		commonj.sdo.DataObject acOperator = commonj.sdo.helper.DataFactory.INSTANCE
				.create("org.gocom.abframe.dataset.privilege", "AcOperator");

		Object[] params = { acOperator };
		acOperator.set("userid", userId);
		Object[] returnValues = null;

		returnValues = comp.invoke(logicName, params);

		return (com.eos.data.datacontext.UserObject) returnValues[0];
	}
	
	
	public static boolean  checkUser(String userId) throws Throwable {
		// 逻辑构件全称
		String componentName = "com.primeton.eos.ame_common.weChatPlatform";
		// 逻辑流名称
		String logicName = "checkEmpByUserID";
		ILogicComponent comp = LogicComponentFactory.create(componentName);

		Object[] params = { userId };
		Object[] returnValues = null;

		returnValues = comp.invoke(logicName, params);
		String flag = (String)returnValues[0];
		if(flag.equals("1")){
			return true;
		}else{
			return false;
		}
	}
	
	/**
	 * 
	 * @param text
	 * @param params
	 * @return
	 */
	@Bizlet("处理微信内容中的链接")
	public static String linkOfContent(String text,String params,String funcName){
		String redirect_uri = BusinessDictUtil.getDictName(AME_WE_CHAT, "WE_REDIRECT_URI");
		String agentid = BusinessDictUtil.getDictName(AME_WE_CHAT, "agentid_link");
		redirect_uri = redirect_uri+"?"+params+"&agentid="+agentid;
		String content = "<a href='";
		String uri = URLEncoder.encode(redirect_uri);
		String end = "'>"+text+"</a>";
		
		StringBuffer sb = new StringBuffer();
		sb.append("https://open.weixin.qq.com/connect/oauth2/authorize?appid=")
		  .append(CORP_Id)
		  .append("&redirect_uri=")
		  .append(uri)
		  .append("&response_type=code")
		  .append("&scope=snsapi_base")
		  .append("&state=")
		  .append(funcName)
		  .append("#wechat_redirect");
		content = content+sb.toString()+end;
		return content;
		
	}
	
	/**
	 * 
	 * @param text
	 * @param params
	 * @return
	 */
	@Bizlet("处理微信内容中的链接")
	public static String linkOfController(String processinstid,String funcName){
		String redirect_uri = BusinessDictUtil.getDictName("AME_SYSCONF", "AMEPATH");
		String agentid = BusinessDictUtil.getDictName(AME_WE_CHAT, "agentid_link");
		redirect_uri = redirect_uri+"common/wechatAme.jsp?processinstid="+processinstid+"&agentid="+agentid;
		String uri = URLEncoder.encode(redirect_uri);
		
		StringBuffer sb = new StringBuffer();
		sb.append("https://open.weixin.qq.com/connect/oauth2/authorize?appid=")
		  .append(CORP_Id)
		  .append("&redirect_uri=")
		  .append(uri)
		  .append("&response_type=code")
		  .append("&scope=snsapi_base")
		  .append("&state=")
		  .append(funcName)
		  .append("#wechat_redirect");
		
		String url=sb.toString();
		String shorturl = BaiDuUtil.generateShortUrl(url);
		return shorturl;
	}
	
	
	@Bizlet("处理微信内容中的链接")
	public static String linkOfContent(String text,String params){
		String redirect_uri = BusinessDictUtil.getDictName(AME_WE_CHAT, "WE_REDIRECT_URI");
		redirect_uri = redirect_uri+"?agentid=5";
		String content = "<a href='";
		String uri = URLEncoder.encode(redirect_uri);
		String end = "'>"+text+"</a>";
		
		StringBuffer sb = new StringBuffer();
		sb.append("https://open.weixin.qq.com/connect/oauth2/authorize?appid=")
		  .append(CORP_Id)
		  .append("&redirect_uri=")
		  .append(uri)
		  .append("&response_type=code")
		  .append("&scope=snsapi_base")
		  .append("&state=")
		  .append(params)
		  .append("#wechat_redirect");
		content = content+sb.toString()+end;
		return content;
		
	}
	

	@Bizlet("处理微信内容中的链接")
	public static String linkOfContent(String state){
		//获取微信跳转到阿米加系统中的地址
		String redirect_uri = BusinessDictUtil.getDictName(AME_WE_CHAT, "WE_REDIRECT_URI");
		redirect_uri = redirect_uri+"?agentid=5";
		String uri = URLEncoder.encode(redirect_uri);
		String content = "<a href='";
		String end = "'>待办任务</a>";
		/**
		 * appid:为企业号的id，是固定的
		 * redirect_uri:是企业自定义的地址
		 * response_type:返回类型，此时固定为：code
		 * scope:应用授权作用域，此时固定为：snsapi_base 
		 * state:可用来传自己的参数,但是，只支持数字和字母，可考虑用可逆加密方式用来处理多个参数,可以考虑用代码标示，定义跳转到什么页面
		 * #wechat_redirect:微信终端使用此参数判断是否需要带上身份信息
		 */
		StringBuffer sb = new StringBuffer();
		sb.append("https://open.weixin.qq.com/connect/oauth2/authorize?appid=")
		  .append(CORP_Id)
		  .append("&redirect_uri=")
		  .append(uri)
		  .append("&response_type=code")
		  .append("&scope=snsapi_base")
		  .append("&state=")
		  .append(state)
		  .append("#wechat_redirect");
		//state
		content = content+sb.toString()+end;
		return content;
	}
	
	@Bizlet("处理微信内容中某条待办的链接")
	public static String linkOfTaskList(Long workItemID,String text){
		String content = "<a href='";
		String redirect_uri = BusinessDictUtil.getDictName(AME_WE_CHAT, "WE_REDIRECT_URI");
		String agentid = BusinessDictUtil.getDictName(AME_WE_CHAT, "agentid_link");
		redirect_uri = redirect_uri+"?workItemID="+workItemID+"&agentid="+agentid;
		String uri = URLEncoder.encode(redirect_uri);
		String end = "'>"+text+"</a>";
		StringBuffer sb = new StringBuffer();
		sb.append("https://open.weixin.qq.com/connect/oauth2/authorize?appid=")
		  .append(CORP_Id)
		  .append("&redirect_uri=")
		  .append(uri)
		  .append("&response_type=code")
		  .append("&scope=snsapi_base")
		  .append("&state=W")
		  .append(workItemID)
		  .append("#wechat_redirect");
		content = content+sb.toString()+end;
		return content;
	}
	
	public static String getUserInfo(String code,String agentid){
		//根据agentid获取secert
		DataObject[] dicts = BusinessDictUtil.getDictInfoByType("AME_WE_APP");
		String	corpsecret = null;
		for(int i=0;i<dicts.length;i++){
			if(dicts[i].get("dictID").equals(agentid)){
				corpsecret = (String) dicts[i].get("filter1");
			}
		}
		String access_token = Constants.CACHE_MAP.get(corpsecret);
				//BusinessDictUtil.getDictName(AME_WE_CHAT, "TOKEN");
		String url = BusinessDictUtil.getDictName(AME_WE_CHAT, "USERINFO_URL");
		String msg =  HttpClientUtil.getMethodInvoke(url, "access_token="+access_token+"&code="+code);
		
		JSONObject json = (JSONObject)JSONValue.parse(msg);
		if(json!=null){
			Long errcode = (Long)json.get("errcode");
			if(errcode!=null){
				if(errcode==40014 || errcode==42001){//token过期了
					String re_str = getAccessToken(corpsecret);
					if(re_str.equals("SUCC")){
						return getUserInfo(code,agentid);
					}else{
						return "TOKEN_FAIL";
					}
				}else{
					return "FAIL";
				}
			}
			String userId = (String)json.get("UserId");
			if(userId!=null){
				return userId;
			}else{
				return "FAIL";
			}
		}else{
			log.info("获取用户信息，返回结果为:"+msg);
			return "FAIL";
		}
	}
	
	public static Cookie getTgt(String userId){
		String url = BusinessDictUtil.getDictName(AME_WE_CHAT, "TGT_URL");
		String tgt =HttpClientUtil.getMethodInvoke(url,"userId="+userId);
		Cookie cookie = null;
		if(tgt!=null){
			cookie = new Cookie("CASTGC",tgt);
		    cookie.setSecure(true);//必须的,用户保密
		    cookie.setDomain("ame.primeton.com");
		    cookie.setPath("/sso-server");         
		    cookie.setVersion(0);
		    return cookie;
		}
		return null;
	}
	
	@Bizlet("发送微信红包||企业微信红包")
	public static void redEnvelopes(HashMap params){
		String isWork = BusinessDictUtil.getDictName(AME_WE_PAY, "ISWORK");
		//支付接口，这里可以不用写
		int agentID = (Integer)params.get("agentID");
		String userID = (String)params.get("userID");
		JSONObject json = getOpenId(agentID,userID);
		Long errcode = (Long)json.get("errcode");
		if(errcode!=0){
			String errmsg = (String)json.get("errmsg");
			params.put("result_code", "FAIL");
			params.put("err_code_des", errmsg);
			//return return_strs;
		}else{
			String openid = (String)json.get("openid");
			String appid  = (String)json.get("appid");
			params.put("re_openid", openid);
			String re_str;
			//设置签名
			if(isWork.equals("1")){
				params.put("wxappid", CORP_Id);
				signToQY(params);
				signQ(params);
				//报文
				String xmlStr = paramsToQY(params);
				re_str = pay(xmlStr);
				try {
					Map<String,String> map = doXMLParse(re_str);
					String result_code = map.get("result_code");
					params.put("result_code", result_code);
					String err_code_des = map.get("err_code_des");
					if(err_code_des != null){
						err_code_des = err_code_des.replaceAll("[\r\n]?", "");
					}
					params.put("code_des", err_code_des);
				} catch (JDOMException e) {
					// TODO 自动生成的 catch 块
					e.printStackTrace();
				} catch (IOException e) {
					// TODO 自动生成的 catch 块
					e.printStackTrace();
				}
			}else{
				params.put("wxappid", appid);
				sign(params);
				//报文
				String xmlStr = params(params);
				re_str = pay(xmlStr);
				try {
					Map<String,String> map = doXMLParse(re_str);
					String result_code = map.get("result_code");
					params.put("result_code", result_code);
					String err_code_des = map.get("err_code_des");
					err_code_des = err_code_des.replaceAll("[\r\n]?", "");
					params.put("code_des", err_code_des);
				} catch (JDOMException e) {
					// TODO 自动生成的 catch 块
					e.printStackTrace();
				} catch (IOException e) {
					// TODO 自动生成的 catch 块
					e.printStackTrace();
				}
			}
		}
	}
	
	/**
	 * 对企业微信红包的参数进行签名处理
	 * @param params
	 */
	public static void signToQY(HashMap params){
		
		String act_name = (String)params.get("act_name");
		String send_name = (String)params.get("send_name");
		String wishing = (String)params.get("wishing");
		String remark = (String)params.get("remark");
		
		
		StringBuffer signW = new StringBuffer();
		//随机字符串
		String nonce_str = getNonceStr();
		params.put("nonce_str", nonce_str);
		
		//活动名称
		signW.append("act_name=").append(act_name);
        
       
        //商户订单号，这里暂不考虑，先生成一个
        String billno = generateBillno();
        
        signW.append("&mch_billno=").append(billno);
        
        params.put("mch_billno", billno);
        
        signW.append("&mch_id=").append(MCHID);
        params.put("mch_id",MCHID);
        
        signW.append("&nonce_str=").append(nonce_str);
        
        
        //用户对应的openid 
        String re_openid = (String)params.get("re_openid");
        signW.append("&re_openid=").append(re_openid);
        
        //备注
        //sign.append("&remark=").append(remark);
        
        //总金额
        //以分为单位
        int total_amount = (Integer)params.get("total_amount");
        signW.append("&total_amount=").append(total_amount);
        
        //这里，并不一定是企业号的ID。可能是企业号里面的一个应用的appid,一般情况下只用到agentid
        String wxappid = (String)params.get("wxappid");        
        signW.append("&wxappid=").append(wxappid);
        
        /* String key = BusinessDictUtil.getDictName(AME_WE_PAY, "API_KEY");
        sign.append("&key=").append(key);
        params.put("key", key);*/
      /*  String parames = sign.toString();       
        String sign_str = MD5Util.MD5Encode(parames, "UTF-8").toUpperCase();
        params.put("sign", sign_str);*/
        
        //获取企业微信的签名
        String key1 = BusinessDictUtil.getDictName(AME_WE_PAY, "PAY_SECRET");
        signW.append("&secret=").append(key1);
        //params.put("secret", key1);
        String parames1 = signW.toString();      
        String sign_str1 = MD5Util.MD5Encode(parames1, "UTF-8").toUpperCase();
        params.put("workwx_sign", sign_str1);
	}
	
	/**
	 * 调用微信红包接口
	 * @param data
	 * @return
	 */
	private static String pay(String data){
		String url;
		String isWork = BusinessDictUtil.getDictName(AME_WE_PAY, "ISWORK");
		if(isWork.equals("1")){
			url = BusinessDictUtil.getDictName(AME_WE_PAY, "PAYCOMPANY_URL");
		}else{
			url = BusinessDictUtil.getDictName(AME_WE_PAY, "PAY_URL");
		}
		String path = BusinessDictUtil.getDictName(AME_WE_PAY, "CERTS_PATH");
		//证书完整路径
		String certFile = path+File.separator+"apiclient_cert.p12";
		//String certFile = "F://certs/apiclient_cert.p12";
		StringBuffer message = new StringBuffer();
        try {
            KeyStore keyStore  = KeyStore.getInstance("PKCS12");
            FileInputStream instream = new FileInputStream(new File(certFile));
            keyStore.load(instream, MCHID.toCharArray());
         
            Set<KeyManager> keymanagers = new HashSet<KeyManager>();
            
            KeyManagerFactory kmfactory = KeyManagerFactory.getInstance(KeyManagerFactory.getDefaultAlgorithm());
            kmfactory.init(keyStore, MCHID.toCharArray());
            KeyManager[] kms = kmfactory.getKeyManagers();
            if (kms != null) {
              for (int i = 0; i < kms.length; i++) {
                keymanagers.add(kms[i]);
              }
            }
            SSLContext sslcontext = SSLContext.getInstance("SSL");
            SecureRandom random = new SecureRandom();
            if(!keymanagers.isEmpty()){
            	sslcontext.init(keymanagers.toArray(new KeyManager[keymanagers.size()]), null,random);
            }else{
            	sslcontext.init(null, null,random);
            }
            SSLSocketFactory sf = sslcontext.getSocketFactory();
            URL myURL = new URL(url); 
            // 创建HttpsURLConnection对象，并设置其SSLSocketFactory对象 
            HttpsURLConnection httpsConn = (HttpsURLConnection) myURL.openConnection(); 

            httpsConn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");
            httpsConn.setRequestProperty("Cache-Control", "max-age=0");
            httpsConn.setRequestProperty("X-Requested-With", "XMLHttpRequest");
            httpsConn.setRequestProperty("User-Agent", "Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0)");
            httpsConn.setDoOutput(true);
            httpsConn.setSSLSocketFactory(sf); 
            //报文
            httpsConn.getOutputStream().write(data.getBytes("UTF-8"));  
           
            // 取得该连接的输入流，以读取响应内容 
            InputStreamReader insr = new InputStreamReader(httpsConn.getInputStream()); 
            int code = httpsConn.getResponseCode();
            if(HttpsURLConnection.HTTP_OK == code){
            	if(insr!=null){
                	BufferedReader bufferedReader = new BufferedReader(insr);
                	String text = bufferedReader.readLine();
                    while (text != null) {
                    	//必须转字符集，不然会出现乱码。
                    	String context = new String(text.getBytes("gbk"), "utf-8");
                    	context = context.replaceAll("[\r\n?]?", "");
                        message.append(context);
                        text =  bufferedReader.readLine();
                    }
                }
            }
            // 读取服务器的响应内容并显示 
            
            
        }catch(Exception e){
        	System.out.println(e);
        }
        return message.toString();
	}
	
	/**
	 * 通过userid和应用ID，获取用户对应的appid和openid,主要应用于微信红包功能
	 * @param agentID 应用ID
	 * @param userId  
	 * @return
	 * 范围报文示例
	 * {"errcode":0,"errmsg":"ok","openid":"oHmKEwR7tVrXKH-V1jLkIwwCmjqw","appid":"wx4e563df1d2919573"}
	 */
	public static JSONObject getOpenId(int agentID,String userID){
		String url = BusinessDictUtil.getDictName(AME_WE_PAY, "OPENID_URL");
		//根据agentid获取secert
		DataObject[] dicts = BusinessDictUtil.getDictInfoByType("AME_WE_APP");
		String	corpsecret = null;
		for(int i=0;i<dicts.length;i++){
			if(dicts[i].get("dictID").equals(String.valueOf(agentID))){
				corpsecret = (String) dicts[i].get("filter1");
			}
		}
		String token = getCache(corpsecret);
		//String token = "W99eHZDlhM5xB-OAuLTceI-Y6oUYEkqQIepl4gXYz_YZdKdlCrjMsx-R07zBv7fyc15kI0jJAVoT-hPK6dRSUE9_fayRv7k3cFf4EXkT_wjzY-eFzK46HjsSlGVnfll9V6ZS-CuzcFI4rXRYZ_a-otFCh_Sy5F33HE1YgFv2iBVFvje8VgYJNcS9jAPMDqEtGmQKXKkNpFN_GZrdlfGpEMWgjO2N4hrHqDUTv8iIvvk";
		if(token==null){
			return new JSONObject();
		}
		
		url = url+"?access_token="+token;
		JSONObject json = new JSONObject();
		json.put("userid", userID);
		json.put("agentid", agentID);
		
		String return_msg = HttpClientUtil.post(url, json.toString());
		JSONObject return_json = (JSONObject)JSONValue.parse(return_msg);
		
		Long errcode = (Long)return_json.get("errcode");
		if(errcode==0){
			return return_json;
		}else if(errcode==40014 || errcode==42001){//token过期了
			String re_str = getAccessToken(corpsecret);
			if(re_str.equals("SUCC")){
				token = getCache(corpsecret);
						
				url = url.substring(0, url.lastIndexOf("=")+1)+token;
				return_msg = HttpClientUtil.post(url, json.toString());
				return_json = (JSONObject)JSONValue.parse(return_msg);
				return return_json;
			}else{
				return return_json;
			}
		}else{
			return return_json;
		}
	}
	
	/**
	 * 解析xml,返回第一级元素键值对。如果第一级元素有子节点，则此节点的值是子节点的xml数据。
	 * @param strxml
	 * @return
	 * @throws JDOMException
	 * @throws IOException
	 */
	public static Map<String,String> doXMLParse(String strxml) throws JDOMException, IOException {
		strxml = strxml.replaceFirst("encoding=\".*\"", "encoding=\"UTF-8\"");

		if(null == strxml || "".equals(strxml)) {
			return null;
		}
		
		Map<String,String> m = new HashMap<String,String>();
		
		InputStream in = new ByteArrayInputStream(strxml.getBytes("UTF-8"));
		SAXBuilder builder = new SAXBuilder();
		Document doc = builder.build(in);
		Element root = doc.getRootElement();
		List<Element> list = root.getChildren();
		Iterator<Element> it = list.iterator();
		while(it.hasNext()) {
			Element e =  it.next();
			String name = e.getName();
			String value = "";
			List<Element> children = e.getChildren();
			if(children.isEmpty()) {
				value = e.getTextNormalize();
			} else {
				value = getChildrenText(children);
			}
			
			m.put(name, value);
		}
		
		//关闭流
		in.close();
		
		return m;
	}
	
	/**
	 * 获取子结点的xml
	 * @param children
	 * @return String
	 */
	public static String getChildrenText(List children) {
		StringBuffer sb = new StringBuffer();
		if(!children.isEmpty()) {
			Iterator<Element> it = children.iterator();
			while(it.hasNext()) {
				Element e =  it.next();
				String name = e.getName();
				String value = e.getTextNormalize();
				List<Element> list = e.getChildren();
				sb.append("<" + name + ">");
				if(!list.isEmpty()) {
					sb.append(getChildrenText(list));
				}
				sb.append(value);
				sb.append("</" + name + ">");
			}
		}
		
		return sb.toString();
	}
	
	/**
	 * 企业微信红包组装接口报文。
	 * @param params
	 * @return
	 */
	private static String paramsToQY(HashMap params){
		String sign = (String)params.get("sign");
		String workwx_sign = (String)params.get("workwx_sign");
		String act_name = (String)params.get("act_name");
		String wishing = (String)params.get("wishing");
		String remark = (String)params.get("remark");
		String send_name = (String)params.get("send_name");
		
		String mch_billno = (String)params.get("mch_billno");
		String mch_id = (String)params.get("mch_id");
		String wxappid = (String)params.get("wxappid");
		
		String re_openid = (String)params.get("re_openid");
		int total_amount = (Integer) params.get("total_amount");
		int total_num = (Integer)params.get("total_num");
		String client_ip = (String)params.get("client_ip");
		String nonce_str = (String)params.get("nonce_str");
		int agentID = (Integer)params.get("agentID");
		
		StringBuffer xml = new StringBuffer("<xml>");
		xml.append("<nonce_str>").append(nonce_str).append("</nonce_str>")
			.append("<sign>").append(sign).append("</sign>")
		   .append("<mch_billno>").append(mch_billno).append("</mch_billno>")
		   .append("<mch_id>").append(mch_id).append("</mch_id>")
		   .append("<wxappid>").append(CORP_Id).append("</wxappid>")
		   .append("<send_name>").append(send_name).append("</send_name>")
		   .append("<re_openid>").append(re_openid).append("</re_openid>")
		   .append("<total_amount>").append(total_amount).append("</total_amount>")
		   .append("<agentid>").append(agentID).append("</agentid>")
		   .append("<wishing>").append(wishing).append("</wishing>")
		   .append("<act_name>").append(act_name).append("</act_name>")
		   .append("<remark>").append(remark).append("</remark>")
		   .append("<workwx_sign>").append(workwx_sign).append("</workwx_sign>")
		   .append("</xml>");
		
		return xml.toString();
	}
	/**
	 * 组装接口报文。
	 * @param params
	 * @return
	 */
	private static String params(HashMap params){
		String sign = (String)params.get("sign");
		String act_name = (String)params.get("act_name");
		String send_name = (String)params.get("send_name");
		String wishing = (String)params.get("wishing");
		String remark = (String)params.get("remark");
		
		String mch_billno = (String)params.get("mch_billno");
		String mch_id = (String)params.get("mch_id");
		String wxappid = (String)params.get("wxappid");
		
		String re_openid = (String)params.get("re_openid");
		int total_amount = (Integer) params.get("total_amount");
		int total_num = (Integer)params.get("total_num");
		String client_ip = (String)params.get("client_ip");
		String nonce_str = (String)params.get("nonce_str");
		
		StringBuffer xml = new StringBuffer("<xml>");
		xml.append("<sign><![CDATA[").append(sign).append("]]></sign>")
		   .append("<mch_billno><![CDATA[").append(mch_billno).append("]]></mch_billno>")
		   .append("<mch_id><![CDATA[").append(mch_id).append("]]></mch_id>")
		   .append("<wxappid><![CDATA[").append(wxappid).append("]]></wxappid>")
		   .append("<send_name><![CDATA[").append(send_name).append("]]></send_name>")
		   .append("<re_openid><![CDATA[").append(re_openid).append("]]></re_openid>")
		   .append("<total_amount><![CDATA[").append(total_amount).append("]]></total_amount>")
		   .append("<total_num><![CDATA[").append(total_num).append("]]></total_num>")
		   .append("<wishing><![CDATA[").append(wishing).append("]]></wishing>")
		   .append("<client_ip><![CDATA[").append(client_ip).append("]]></client_ip>")
		   .append("<act_name><![CDATA[").append(act_name).append("]]></act_name>")
		   .append("<nonce_str><![CDATA[").append(nonce_str).append("]]></nonce_str>")
		   .append("<remark><![CDATA[").append(remark).append("]]></remark>")
		   .append("</xml>");
		
		return xml.toString();
	}
	
	/**
	 * 生成随机码
	 * @return
	 */
	public static String getNonceStr() {
		Random random = new Random();
		return MD5Util.MD5Encode(String.valueOf(random.nextInt(10000)), "GBK");
	}
	
	/**
	 * 对微信红包的参数进行签名处理
	 * @param params
	 */
	public static void signQ(HashMap params){
		
		String act_name = (String)params.get("act_name");
		//String send_name = (String)params.get("send_name");
		String wishing = (String)params.get("wishing");
		String remark = (String)params.get("remark");
		int agentID = (Integer)params.get("agentID");
		String wsign = (String)params.get("workwx_sign");
		String nonce_str = (String)params.get("nonce_str");
		String billno =  (String)params.get("mch_billno");
		
		StringBuffer sign = new StringBuffer();
		//随机字符串
		//String nonce_str = getNonceStr();
		//params.put("nonce_str", nonce_str);
		
		//活动名称
        sign.append("act_name=").append(act_name);
        
        sign.append("&agentid=").append(agentID);
        //商户订单号，这里暂不考虑，先生成一个
        
        		//generateBillno();
        sign.append("&mch_billno=").append(billno);
        params.put("mch_billno", billno);
        
        sign.append("&mch_id=").append(MCHID);
        params.put("mch_id",MCHID);
        
        sign.append("&nonce_str=").append(nonce_str);
        
        
        //用户对应的openid 
        String re_openid = (String)params.get("re_openid");
        sign.append("&re_openid=").append(re_openid);
        
        //备注
        sign.append("&remark=").append(remark);
        

        //总金额
        //以分为单位
        int total_amount = (Integer)params.get("total_amount");
        sign.append("&total_amount=").append(total_amount);
     
        //红包祝福语
        //String wishing  = (String)params.get("wishing");
        sign.append("&wishing=").append(wishing);
        
        sign.append("&workwx_sign=").append(wsign);
        
        //这里，并不一定是企业号的ID。可能是企业号里面的一个应用的appid,一般情况下只用到agentid
        String wxappid = (String)params.get("wxappid");        
        sign.append("&wxappid=").append(wxappid);
        
        String key = BusinessDictUtil.getDictName(AME_WE_PAY, "API_KEY");
        sign.append("&key=").append(key);
        params.put("key", key);
        
        String parames = sign.toString();       
        String sign_str = MD5Util.MD5Encode(parames, "UTF-8").toUpperCase();
        params.put("sign", sign_str);
        
	}
	
	
	/**
	 * 对微信红包的参数进行签名处理
	 * @param params
	 */
	public static void sign(HashMap params){
		
		String act_name = (String)params.get("act_name");
		String send_name = (String)params.get("send_name");
		String wishing = (String)params.get("wishing");
		String remark = (String)params.get("remark");
		
		
		StringBuffer signE = new StringBuffer();
		//随机字符串
		String nonce_str = getNonceStr();
		params.put("nonce_str", nonce_str);
		
		//活动名称
		signE.append("act_name=").append(act_name);
        
        //客户端IP
        //公司的外网IP:210.13.127.98
        String client_ip = (String)params.get("client_ip");
        signE.append("&client_ip=").append(client_ip);
        
        //商户订单号，这里暂不考虑，先生成一个
        String billno = generateBillno();
        signE.append("&mch_billno=").append(billno);
        params.put("mch_billno", billno);
        
        signE.append("&mch_id=").append(MCHID);
        params.put("mch_id",MCHID);
        
        signE.append("&nonce_str=").append(nonce_str);
        
        
        //用户对应的openid 
        String re_openid = (String)params.get("re_openid");
        signE.append("&re_openid=").append(re_openid);
        
        //备注
        signE.append("&remark=").append(remark);
        
        //商户名称
        signE.append("&send_name=").append(send_name);
        
        //总金额
        //以分为单位
        int total_amount = (Integer)params.get("total_amount");
        signE.append("&total_amount=").append(total_amount);
        
        //红包发送总人数
        int total_num = (Integer)params.get("total_num");
        signE.append("&total_num=").append(total_num);
        
        //红包祝福语
        //String wishing  = (String)params.get("wishing");
        signE.append("&wishing=").append(wishing);
        
        //这里，并不一定是企业号的ID。可能是企业号里面的一个应用的appid,一般情况下只用到agentid
        String wxappid = (String)params.get("wxappid");
        
        signE.append("&wxappid=").append(wxappid);
        String key = BusinessDictUtil.getDictName(AME_WE_PAY, "API_KEY");

        signE.append("&key=").append(key);
        params.put("key", key);
        String parames = signE.toString();
       
       String sign_str = MD5Util.MD5Encode(parames, "UTF-8").toUpperCase();
       params.put("sign", sign_str);
	}
	
	/**
	 * 生成商户订单号，
	 * @return
	 */
	public static String generateBillno(){
		StringBuffer  billno = new StringBuffer(); 
		billno.append(MCHID);
		
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		billno.append(year);
		int month = cal.get(Calendar.MONTH);
		month = month+1;
		if(month>9){
			billno.append(month);
		}else{
			billno.append("0").append(month);
		}

		int day = cal.get(Calendar.DAY_OF_MONTH);
		billno.append(day);
		
		
		int hour = cal.get(Calendar.HOUR_OF_DAY);
		if(hour>9){
			billno.append(hour);
		}else{
			billno.append("0").append(hour);
		}
		
		int minutes = cal.get(Calendar.MINUTE);
		if(minutes>9){
			billno.append(minutes);
		}else{
			billno.append("0").append(minutes);
		}
		
		int second = cal.get(Calendar.SECOND);
		if(second>9){
			billno.append(second);
		}else{
			billno.append("0").append(second);
		}
		
		int millisecond = cal.get(Calendar.MILLISECOND);
		if(millisecond<10){
			billno.append("000").append(millisecond);
		}else if(millisecond>9 && millisecond<100){
			billno.append("00").append(millisecond);
		}else if(millisecond>99 && millisecond<1000){
			billno.append("0").append(millisecond);
		}
		return billno.toString();
	}
	
    /**
     * 通过循环解析流对象，将文件写入自己的服务器 
     * @param mediaId 
     * @return 存取状态
     */
    @Bizlet("拿图片路径")
    public static String saveImageToDisk(String mediaId) throws Exception {  
    	
    	//根据agentid获取secert
    	/*DataObject[] dicts = BusinessDictUtil.getDictInfoByType("AME_WE_APP");
    	String	corpsecret = null;
    	for(int i=0;i<dicts.length;i++){
    		if(dicts[i].get("dictID").equals(agentid)){
    			corpsecret = (String) dicts[i].get("filter1");
    		}
    	}*/
    	String corpsecret = "oz4CdPL6MIQA9HPVI3ntpU1cJx-hnJIAug9eOEg5h7e8Lp7CzPSIwQaZL7gXIUpK";
        String accessToken = getCache(corpsecret);
        //String accessToken = "r1z8ipwyfX7oekXHS32Cirkpvqhz16hp-S0eeUtoMphxTSS8sUe9XoBj6-uPSn5e8g_IGuwI0v91anntK8LcDkAR6WLuEhVuMS5AcXZpdJIY6i4ERtehKG-3D5hhIJmZFF1DSz8PpVvBoN4mH4wUnj8eML4uJ64f0XyXzqUdOHGdbVrVJ40SbNhY7sXhXKtJd2UdEknTnL3x5mJf05pV_A";
        InputStream inputStream = getInputStream(accessToken, mediaId); 
        //定义图片路径
        String picPath = BusinessDictUtil.getDictName(AME_WE_CHAT, "ACT_DOWNLOAD_TEMPORARY");
        //String picPath = "D:/AME76/NEWERP1/apps_config/default/work_temp/upload/MyPicture/";
        //定义图片名称
        String picName = mediaId;
        // 循环取出流中的数据
        byte[] data = new byte[1024];  
        int len = 0;  
        FileOutputStream fileOutputStream = null;  
        try {  
            fileOutputStream = new FileOutputStream(picPath+picName+".jpg");  
            while ((len = inputStream.read(data)) != -1) {  
                fileOutputStream.write(data, 0, len);  
            }  
            log.info("Write the fileInputStream is successful");
        } catch (IOException e) {  
        	log.info("Write the fileInputStream is error");
        } finally {  
            if (inputStream != null) {  
                try {  
                    inputStream.close();  
                } catch (IOException e) { 
                	log.info("Close the fileInputStream is error");
                }  
            }  
            if (fileOutputStream != null) {  
                try {  
                    fileOutputStream.close();  
                } catch (IOException e) {  
                	log.info("Close the fileInputStream is error"+e);
                }  
            }  
        }  
        return (picName+".jpg");
    }
    
    /**
     * 根据文件id下载文件 
     * @param accessToken
     * @param mediaId 
     * @return 文件流对象
     */
    public static InputStream getInputStream(String accessToken,String mediaId) {  
        InputStream is = null;  
        String url = BusinessDictUtil.getDictName(AME_WE_CHAT, "MEDIA_GET_URL");
        String downloadUrl = url+"?access_token="+ accessToken + "&media_id=" + mediaId;
        try {  
            URL urlGet = new URL(downloadUrl);  
            HttpURLConnection http = (HttpURLConnection) urlGet.openConnection();  
            http.setRequestMethod("GET"); // 必须是get方式请求  
            http.setRequestProperty("Content-Type","application/x-www-form-urlencoded");  
            http.setDoOutput(true);  
            http.setDoInput(true);  
            System.setProperty("sun.net.client.defaultConnectTimeout", "30000");// 连接超时30秒  
            System.setProperty("sun.net.client.defaultReadTimeout", "30000"); // 读取超时30秒  
            http.connect();  
            // 获取文件转化为byte流  
            is = http.getInputStream();  
            // 获取所有响应头字段
            Map<String, List<String>> map = http.getHeaderFields();
            // 遍历所有的响应头字段
            for (String key : map.keySet()) {
            	log.info(key + "--->" + map.get(key));
            	if("Error-Code".equals(key)){
            		log.info("imagekey:"+key);
            		log.info("imagekey1:"+map.get(key).toString());
            		if(map.get(key).toString().equals("42001")||map.get(key).toString().equals("40014")||map.get(key).toString().equals("[42001]")){//token过期了
            			String corpsecret = "oz4CdPL6MIQA9HPVI3ntpU1cJx-hnJIAug9eOEg5h7e8Lp7CzPSIwQaZL7gXIUpK";
            			String re_str = getAccessToken(corpsecret);
            			if(re_str.equals("SUCC")){
            				accessToken =  getCache(corpsecret);
            				//如果是空，说明获取token失败了		
            				if(accessToken==null){
            					log.info("Failed to getAccessToken");
            				}else{
            					try {  
            						String downloadUrlNew = url+"?access_token="+ accessToken + "&media_id=" + mediaId;
            						URL urlGetNew = new URL(downloadUrlNew);  
            			            HttpURLConnection httpNew = (HttpURLConnection) urlGetNew.openConnection();  
            			            httpNew.setRequestMethod("GET"); // 必须是get方式请求  
            			            httpNew.setRequestProperty("Content-Type","application/x-www-form-urlencoded");  
            			            httpNew.setDoOutput(true);  
            			            httpNew.setDoInput(true);  
            			            System.setProperty("sun.net.client.defaultConnectTimeout", "30000");// 连接超时30秒  
            			            System.setProperty("sun.net.client.defaultReadTimeout", "30000"); // 读取超时30秒  
            			            httpNew.connect();  
            			            // 获取文件转化为byte流  
            			            is = httpNew.getInputStream();
            			         } catch (Exception e) {  
        			            	log.info("Failed to convert inputStream from weixin server"+e);
            			         }  
            				}
            			}else{
            				log.info("Failed to getAccessToken");
            			}
            		}
            	}
            }
        } catch (Exception e) {  
        	log.info("Failed to convert inputStream from weixin server"+e);
        }  
        return is;  
  
    }
    
    /**
	 * 
	 * @param touser 存放用户ID，多个采用|分割，最多支持1000，特殊情况，可支持@all,会向所有成员都发送
	 * @param toparty 按组织机构发送，多个采用|分割，最多支持100	
	 * @param totag  按标签发送，多个采用|分割，最多支持100	
	 * @param msgtype 消息类型，此时固定为：news
	 * @param content 微信内容，最长不超过2048个字节
	 * @param agentid 企业应用的id，整型。可在应用的设置页面查看
	 * @param articles 图文消息，一个图文消息支持1到8条图文
	 * @param title 标题，不超过128个字节，超过会自动截断
	 * @param description 描述，不超过512个字节，超过会自动截断
	 * @param url 点击后跳转的链接。
	 * @param picurl 图文消息的图片链接，支持JPG、PNG格式，较好的效果为大图640320，小图8080。
	 * @param btntxt 按钮文字，仅在图文数为1条时才生效。 默认为“阅读全文”， 不超过4个文字，超过自动截断。该设置只在企业微信上生效，微信插件上不生效。
	 * @return
	 */
	@Bizlet("发送微信图文消息接口")
	public static Long sendWXNews(String touser,String toparty,String totag,String agentid,
			String title,String description,String url,String picurl){
		//根据agentid获取secert
		DataObject[] dicts = BusinessDictUtil.getDictInfoByType("AME_WE_APP");
		String	corpsecret = null;
		for(int i=0;i<dicts.length;i++){
			if(dicts[i].get("dictID").equals(agentid)){
				corpsecret = (String) dicts[i].get("filter1");
			}
		}
		String access_token =  getCache(corpsecret);
		//String access_token = "LDfNDJHbh1tBj0ywWmkVMy2aGSHzW3Y2lf-SLyOahfNo5aXTiqg0Y82VLs3tcAIQlyxTPEsVDK1YPHsUJnax7WXzCI0yTmxBOCM_g5-49dX6jj5cQreTwKcmO5OWM-P-oFkLuRS5MjqYCXPWaZMQ21f-BdzPKkhp5sIL4JWL0oa-6upkcm-Fy2OlrXrPemNmuCDF26tF0x9aqjpfRnBc6g";
		//如果是空，说明获取token失败了		
		if(access_token==null){
			return Long.valueOf("1");
		}
		//业务字典获取微信发送接口
		String postUrl = BusinessDictUtil.getDictName(AME_WE_CHAT, "SEND_MSG");
		postUrl = postUrl+"?access_token="+access_token;
		touser = touser.replaceAll(",", "|");
		
		//定义内容参数  —— 微信内容
		JSONArray info = new JSONArray();
		Map<String,String> map = new HashMap<String, String>();
		map.put("title", title);
		map.put("description", description);
		map.put("url", url);
		map.put("picurl", picurl);
		info.add(map);
		
		JSONObject content = new JSONObject();
		content.put("articles", info);
		
		JSONObject json = new JSONObject();
		json.put("touser", touser);
		json.put("agentid", agentid);
		json.put("msgtype", "news");
		json.put("news", content);
		if(toparty!=null){
			json.put("toparty", toparty);
		}
		if(totag!=null){
			json.put("totag", totag);
		}
		String params = json.toString();
		/**
		 * 如果不转换，微信接口异常
		 * 公司这个json的jar包，在转化json的时候，把部分标点换成转义符
		 * 暂时只是发现这个，其他的还不知道，这是一个隐患
		 */
		params = params.replace("\\u201C", "“");
		params = params.replace("\\u201D", "”");
		
		String return_msg = HttpClientUtil.post(postUrl, params);
		JSONObject return_json = (JSONObject)JSONValue.parse(return_msg);
		Long errcode = (Long)return_json.get("errcode");
		if(errcode==0){
			return errcode;
		}else if(errcode==40014 || errcode==42001){//token过期了
			String re_str = getAccessToken(corpsecret);
			if(re_str.equals("SUCC")){
				access_token =  getCache(corpsecret);
				//如果是空，说明获取token失败了		
				if(access_token==null){
					return Long.valueOf("1");
				}
				
				postUrl = postUrl.substring(0, postUrl.lastIndexOf("=")+1)+access_token;
				return_msg = HttpClientUtil.post(postUrl, json.toString());
				return_json = (JSONObject)JSONValue.parse(return_msg);
				errcode = (Long)return_json.get("errcode");
				return errcode;
			}else{
				return errcode;
			}
		}else{
			return errcode;
		}
		
	}
	
	/**
     *创建标签     
     * @param tagname 必须  标签名称，长度限制为32个字（汉字或英文字母），标签名不可与其他标签重名。
     * @param tagid 可选  标签id，非负整型，指定此参数时新增的标签会生成对应的标签id，不指定时则以目前最大的id自增。
     * @return
     */
	@Bizlet("创建一个标签")
    public static String creTag(String tagname,String agentid){
		//根据agentid获取secert
		DataObject[] dicts = BusinessDictUtil.getDictInfoByType("AME_WE_APP");
		String	corpsecret = null;
		for(int i=0;i<dicts.length;i++){
			if(dicts[i].get("dictID").equals(agentid)){
				corpsecret = (String) dicts[i].get("filter1");
			}
		}
    	//从缓存里获取token
    	String access_token =  getCache(corpsecret);
    	//String access_token = "P6y2gfcWW1SWoCwMBm858VKiXjD6JOtIjdWRhzq1ZiylYpnaXhXdweURzrsxXAwlbz_OpObEDa0_gDGxX55uZXOw8wUMHO2yu4RgM5JRwQ1bVud_BVc6U4MPDWnRx0PDaxAd-3ORouQQwpq2PwqNcXG5S911WVphMn47o9A3BlnoKRGFIXHSXgK4cZdBOJbm23r8zb495JEvGHacQ2g2w-qVLyIoKdOQbbNHKwoO29c";
    	//如果是空，说明获取token失败了		
		if(access_token==null){
			return "1";
		}
    	//业务字典获取微信获取标签接口接口
		String postUrl = BusinessDictUtil.getDictName(AME_WE_CHAT, "CREATE_TAG");
		
		JSONObject json = new JSONObject();
		json.put("tagname", tagname);
		String params = json.toString();
		
        postUrl = postUrl +"?access_token="+access_token;//拼接请求地址
        String return_msg = HttpClientUtil.post(postUrl,params);//请求
        
        //处理返回值
        JSONObject return_json = (JSONObject)JSONValue.parse(return_msg);
        String errcode = return_json.get("errcode").toString();
		if(errcode.equals("0")){
			return "SUCC";
		}else if(errcode.equals("40014")|| errcode.equals("42001")){//token过期了
			String re_str = getAccessToken(corpsecret);
			if(re_str.equals("SUCC")){
				access_token =  getCache(corpsecret);
				//如果是空，说明获取token失败了		
				if(access_token==null){
					return "1";
				}
				postUrl = postUrl +"?access_token="+access_token;//拼接请求地址
				return_msg = HttpClientUtil.post(postUrl,params);
				return_json = (JSONObject)JSONValue.parse(return_msg);
				errcode = return_json.get("errcode").toString();
				if(errcode.equals("0")){
					return "SUCC";
				}else{
					return errcode;
				}
			}else{
				return errcode;
			}
		}else{
			return errcode;
		}
    }
	
	/**
     * 获取所有标签     
     * @return
     */
    @Bizlet("获取所有标签")
    public static String getTagList(String agentid){
    	//根据agentid获取secert
		DataObject[] dicts = BusinessDictUtil.getDictInfoByType("AME_WE_APP");
		String	corpsecret = null;
		for(int i=0;i<dicts.length;i++){
			if(dicts[i].get("dictID").equals(agentid)){
				corpsecret = (String) dicts[i].get("filter1");
			}
		}
    	//从缓存里获取token
    	String access_token =  getCache(corpsecret);
    	//String access_token = "P6y2gfcWW1SWoCwMBm858VKiXjD6JOtIjdWRhzq1ZiylYpnaXhXdweURzrsxXAwlbz_OpObEDa0_gDGxX55uZXOw8wUMHO2yu4RgM5JRwQ1bVud_BVc6U4MPDWnRx0PDaxAd-3ORouQQwpq2PwqNcXG5S911WVphMn47o9A3BlnoKRGFIXHSXgK4cZdBOJbm23r8zb495JEvGHacQ2g2w-qVLyIoKdOQbbNHKwoO29c";
    	//如果是空，说明获取token失败了		
		if(access_token==null){
			return "1";
		}
    	//业务字典获取微信获取标签接口接口
		String postUrl = BusinessDictUtil.getDictName(AME_WE_CHAT, "GET_TAG_LIST");
        postUrl = postUrl +"?access_token="+access_token;//拼接请求地址
        String return_msg = HttpClientUtil.post(postUrl,"");//请求
        
        //处理返回值
        JSONObject return_json = (JSONObject)JSONValue.parse(return_msg);
        String errcode = return_json.get("errcode").toString();
		if(errcode.equals("0")){
			String taglist = return_json.get("taglist").toString();
			return taglist;
		}else if(errcode.equals("40014") || errcode.equals("42001") ){//token过期了
			String re_str = getAccessToken(corpsecret);
			if(re_str.equals("SUCC")){
				access_token =  getCache(corpsecret);
				//如果是空，说明获取token失败了		
				if(access_token==null){
					return "1";
				}
				postUrl = postUrl +"?access_token="+access_token;//拼接请求地址
				return_msg = HttpClientUtil.post(postUrl,"");
				return_json = (JSONObject)JSONValue.parse(return_msg);
				errcode = return_json.get("errcode").toString();
				if(errcode.equals("0")){
					String taglist = return_json.get("taglist").toString();
					return taglist;
					
				}else{
					return errcode;
				}
			}else{
				return errcode;
			}
		}else{
			return errcode;
		}
    }
    
    /**
     * 更新某个标签     
     * @return
     */
    @Bizlet("修改一个标签")
    public static String upTagList(String tagid,String tagname,String agentid){
    	//根据agentid获取secert
		DataObject[] dicts = BusinessDictUtil.getDictInfoByType("AME_WE_APP");
		String	corpsecret = null;
		for(int i=0;i<dicts.length;i++){
			if(dicts[i].get("dictID").equals(agentid)){
				corpsecret = (String) dicts[i].get("filter1");
			}
		}
    	//从缓存里获取token
    	String access_token =  getCache(corpsecret);
    	//String access_token = "P6y2gfcWW1SWoCwMBm858VKiXjD6JOtIjdWRhzq1ZiylYpnaXhXdweURzrsxXAwlbz_OpObEDa0_gDGxX55uZXOw8wUMHO2yu4RgM5JRwQ1bVud_BVc6U4MPDWnRx0PDaxAd-3ORouQQwpq2PwqNcXG5S911WVphMn47o9A3BlnoKRGFIXHSXgK4cZdBOJbm23r8zb495JEvGHacQ2g2w-qVLyIoKdOQbbNHKwoO29c";
    	//如果是空，说明获取token失败了		
		if(access_token==null){
			return "1";
		}
		
		JSONObject json = new JSONObject();
		json.put("tagid", tagid);
		json.put("tagname", tagname);
		String params = json.toString();
		
    	//业务字典获取微信获取标签接口接口
		String postUrl = BusinessDictUtil.getDictName(AME_WE_CHAT, "UPDATE_TAG");
        postUrl = postUrl +"?access_token="+access_token;//拼接请求地址
        String return_msg = HttpClientUtil.post(postUrl,params);//请求
        
        //处理返回值
        JSONObject return_json = (JSONObject)JSONValue.parse(return_msg);
        String errcode = return_json.get("errcode").toString();
		if(errcode.equals("0")){
			return "SUCC";
		}else if(errcode.equals("40014") || errcode.equals("42001")){//token过期了
			String re_str = getAccessToken(corpsecret);
			if(re_str.equals("SUCC")){
				access_token =  getCache(corpsecret);
				//如果是空，说明获取token失败了		
				if(access_token==null){
					return "1";
				}
				postUrl = postUrl +"?access_token="+access_token;//拼接请求地址
				return_msg = HttpClientUtil.post(postUrl,params);
				return_json = (JSONObject)JSONValue.parse(return_msg);
				errcode = return_json.get("errcode").toString();
				if(errcode=="0"){
					return "SUCC";
				}else{
					return errcode;
				}
			}else{
				return errcode;
			}
		}else{
			return errcode;
		}
    }
    
    /**
     * 删除某个标签     
     * @return
     */
    @Bizlet("删除一个标签")
    public static String delTagList(String tagid,String agentid){
    	//根据agentid获取secert
		DataObject[] dicts = BusinessDictUtil.getDictInfoByType("AME_WE_APP");
		String	corpsecret = null;
		for(int i=0;i<dicts.length;i++){
			if(dicts[i].get("dictID").equals(agentid)){
				corpsecret = (String) dicts[i].get("filter1");
			}
		}
    	//从缓存里获取token
    	String access_token =  getCache(corpsecret);
    	//String access_token = "P6y2gfcWW1SWoCwMBm858VKiXjD6JOtIjdWRhzq1ZiylYpnaXhXdweURzrsxXAwlbz_OpObEDa0_gDGxX55uZXOw8wUMHO2yu4RgM5JRwQ1bVud_BVc6U4MPDWnRx0PDaxAd-3ORouQQwpq2PwqNcXG5S911WVphMn47o9A3BlnoKRGFIXHSXgK4cZdBOJbm23r8zb495JEvGHacQ2g2w-qVLyIoKdOQbbNHKwoO29c";
    	//如果是空，说明获取token失败了		
		if(access_token==null){
			return "1";
		}
    	//业务字典获取微信获取标签接口接口
		String postUrl = BusinessDictUtil.getDictName(AME_WE_CHAT, "DELETE_TAG");
        postUrl = postUrl +"?access_token="+access_token+"&tagid="+tagid;//拼接请求地址
        String return_msg = HttpClientUtil.post(postUrl,"");//请求
        
        //处理返回值
        JSONObject return_json = (JSONObject)JSONValue.parse(return_msg);
        String errcode = return_json.get("errcode").toString();
		if(errcode.equals("0")){
			return "SUCC";
		}else if(errcode.equals("40014")|| errcode.equals("42001")){//token过期了
			String re_str = getAccessToken(corpsecret);
			if(re_str.equals("SUCC")){
				access_token =  getCache(corpsecret);
				//如果是空，说明获取token失败了		
				if(access_token==null){
					return "1";
				}
				postUrl = postUrl +"?access_token="+access_token+"&tagid="+tagid;//拼接请求地址
				return_msg = HttpClientUtil.post(postUrl,"");
				return_json = (JSONObject)JSONValue.parse(return_msg);
				errcode = return_json.get("errcode").toString();
				if(errcode.equals("0")){
					return "SUCC";
				}else{
					return errcode;
				}
			}else{
				return errcode;
			}
		}else{
			return errcode;
		}
    }
    
    
    
    /**
     * 获取标签下所有成员      权限说明：无限制，但返回列表仅包含应用可见范围的成员；第三方可获取自己创建的标签及应用可见范围内的标签详情
     * @param access_token 必须  调用接口凭证
	 * @param tagid 必须  标签id
     * @return
     */
    @Bizlet("获取标签下所有成员")
    public static String getTagUser(String tagid,String agentid){
    	//根据agentid获取secert
		DataObject[] dicts = BusinessDictUtil.getDictInfoByType("AME_WE_APP");
		String	corpsecret = null;
		for(int i=0;i<dicts.length;i++){
			if(dicts[i].get("dictID").equals(agentid)){
				corpsecret = (String) dicts[i].get("filter1");
			}
		}
    	//从缓存里获取token
    	String access_token =  getCache(corpsecret);
    	//String access_token = "P6y2gfcWW1SWoCwMBm858VKiXjD6JOtIjdWRhzq1ZiylYpnaXhXdweURzrsxXAwlbz_OpObEDa0_gDGxX55uZXOw8wUMHO2yu4RgM5JRwQ1bVud_BVc6U4MPDWnRx0PDaxAd-3ORouQQwpq2PwqNcXG5S911WVphMn47o9A3BlnoKRGFIXHSXgK4cZdBOJbm23r8zb495JEvGHacQ2g2w-qVLyIoKdOQbbNHKwoO29c";
    	//如果是空，说明获取token失败了		
		if(access_token==null){
			return "1";
		}
    	//业务字典获取微信获取标签接口接口
		String postUrl = BusinessDictUtil.getDictName(AME_WE_CHAT, "GET_TAG_MEMBER");
        postUrl = postUrl +"?access_token="+access_token+"&tagid="+ tagid;//拼接请求地址
        String return_msg = HttpClientUtil.post(postUrl,"");//请求
        
        //处理返回值
        JSONObject return_json = (JSONObject)JSONValue.parse(return_msg);
        String errcode = return_json.get("errcode").toString();
		if(errcode.equals("0")){
			String userlist = return_json.get("userlist").toString();
			return userlist;
		}else if(errcode.equals("40014") || errcode.equals("42001")){//token过期了
			String re_str = getAccessToken(corpsecret);
			if(re_str.equals("SUCC")){
				access_token =  getCache(corpsecret);
				//如果是空，说明获取token失败了		
				if(access_token==null){
					return "1";
				}
				postUrl = postUrl +"?access_token="+access_token+"&tagid="+ tagid;//拼接请求地址
				return_msg = HttpClientUtil.post(postUrl,"");
				return_json = (JSONObject)JSONValue.parse(return_msg);
				errcode = return_json.get("errcode").toString();
				if(errcode.equals("0")){
					String userlist = return_json.get("userlist").toString();
					return userlist;
				}else{
					return errcode;
				}
			}else{
				return errcode;
			}
		}else{
			return errcode;
		}
    }
    
    /**
     * 增加标签成员 
     * @param access_token 必须  调用接口凭证
	 * @param tagid 必须  标签id
     * @return
     */
    @Bizlet("增加标签成员")
    public static String addTagUser(String tagid,String users,String agentid){
    	//根据agentid获取secert
		DataObject[] dicts = BusinessDictUtil.getDictInfoByType("AME_WE_APP");
		String	corpsecret = null;
		for(int i=0;i<dicts.length;i++){
			if(dicts[i].get("dictID").equals(agentid)){
				corpsecret = (String) dicts[i].get("filter1");
			}
		}
    	//从缓存里获取token
    	String access_token =  getCache(corpsecret);
    	//String access_token = "P6y2gfcWW1SWoCwMBm858VKiXjD6JOtIjdWRhzq1ZiylYpnaXhXdweURzrsxXAwlbz_OpObEDa0_gDGxX55uZXOw8wUMHO2yu4RgM5JRwQ1bVud_BVc6U4MPDWnRx0PDaxAd-3ORouQQwpq2PwqNcXG5S911WVphMn47o9A3BlnoKRGFIXHSXgK4cZdBOJbm23r8zb495JEvGHacQ2g2w-qVLyIoKdOQbbNHKwoO29c";
    	//如果是空，说明获取token失败了		
		if(access_token==null){
			return "1";
		}
		//定义内容参数  —— 新增标签人员
		String[] userlist = users.split(",");
		int b = Integer.valueOf(tagid).intValue();//将tagid转化为int类型
		
		JSONArray arr = new JSONArray();
		for(int i = 0;i<userlist.length;i++){
			String aa = userlist[i].replace("\"", "");
			arr.add(aa);
		}
		JSONObject date = new JSONObject();
		date.put("tagid",b);
		date.put("userlist",arr);
		String params = date.toString();
		//业务字典获取微信获取标签接口接口
		String postUrl = BusinessDictUtil.getDictName(AME_WE_CHAT, "ADD_TAG_USERS");
		
        postUrl = postUrl +"?access_token="+access_token;//拼接请求地址
        String return_msg = HttpClientUtil.post(postUrl,params);//请求
        
        //处理返回值
        JSONObject return_json = (JSONObject)JSONValue.parse(return_msg);
        String errcode = return_json.get("errcode").toString();
		if(errcode.equals("0")){
			return "SUCC";
		}else if(errcode.equals("40014") || errcode.equals("42001")){//token过期了
			String re_str = getAccessToken(corpsecret);
			if(re_str.equals("SUCC")){
				access_token =  getCache(corpsecret);
				//如果是空，说明获取token失败了		
				if(access_token==null){
					return "1";
				}
				postUrl = postUrl +"?access_token="+access_token;//拼接请求地址
				return_msg = HttpClientUtil.post(postUrl,params);//请求
				return_json = (JSONObject)JSONValue.parse(return_msg);
				errcode = return_json.get("errcode").toString();
				if(errcode.equals("0")){
					return "SUCC";
				}else{
					return errcode;
				}
			}else{
				return errcode;
			}
		}else{
			return errcode;
		}
    }
    
    /**
     * 删除标签成员 
     * @param access_token 必须  调用接口凭证
	 * @param tagid 必须  标签id
     * @return
     */
    @Bizlet("删除标签成员")
    public static String delTagUser(String tagid,String users,String agentid){
    	//根据agentid获取secert
		DataObject[] dicts = BusinessDictUtil.getDictInfoByType("AME_WE_APP");
		String	corpsecret = null;
		for(int i=0;i<dicts.length;i++){
			if(dicts[i].get("dictID").equals(agentid)){
				corpsecret = (String) dicts[i].get("filter1");
			}
		}
    	//从缓存里获取token
    	String access_token =  getCache(corpsecret);
    	//String access_token = "P6y2gfcWW1SWoCwMBm858VKiXjD6JOtIjdWRhzq1ZiylYpnaXhXdweURzrsxXAwlbz_OpObEDa0_gDGxX55uZXOw8wUMHO2yu4RgM5JRwQ1bVud_BVc6U4MPDWnRx0PDaxAd-3ORouQQwpq2PwqNcXG5S911WVphMn47o9A3BlnoKRGFIXHSXgK4cZdBOJbm23r8zb495JEvGHacQ2g2w-qVLyIoKdOQbbNHKwoO29c";
    	//如果是空，说明获取token失败了		
		if(access_token==null){
			return "1";
		}
		
		//定义内容参数  —— 删除标签人员
		String[] userlist = users.split(",");
		int b = Integer.valueOf(tagid).intValue();//将tagid转化为int类型
		
		JSONArray arr = new JSONArray();
		for(int i = 0;i<userlist.length;i++){
			String aa = userlist[i].replace("\"", "");
			arr.add(aa);
		}
		JSONObject json = new JSONObject();
		json.put("tagid",b);
		json.put("userlist", arr);
		String params = json.toString();
		//业务字典获取微信获取标签接口接口
		String postUrl = BusinessDictUtil.getDictName(AME_WE_CHAT, "DELETE_TAG_USERS");
        postUrl = postUrl +"?access_token="+access_token;//拼接请求地址
        String return_msg = HttpClientUtil.post(postUrl,params);//请求
        
        //处理返回值
        JSONObject return_json = (JSONObject)JSONValue.parse(return_msg);
        String errcode = return_json.get("errcode").toString();
		if(errcode.equals("0")){
			return "SUCC";
		}else if(errcode.equals("40014") || errcode.equals("42001")){//token过期了
			String re_str = getAccessToken(corpsecret);
			if(re_str.equals("SUCC")){
				access_token =  getCache(corpsecret);
				//如果是空，说明获取token失败了		
				if(access_token==null){
					return "1";
				}
				postUrl = postUrl +"?access_token="+access_token;//拼接请求地址
				return_msg = HttpClientUtil.post(postUrl,params);//请求
				return_json = (JSONObject)JSONValue.parse(return_msg);
				errcode = return_json.get("errcode").toString();
				if(errcode.equals("0")){
					return "SUCC";
				}else{
					return errcode;
				}
			}else{
				return errcode;
			}
		}else{
			return errcode;
		}
    }
    
    
   

    @Bizlet("更新企业微信日程安排的接口")
	public static String  updateCalendarArrange(String organizer,Long start_time,Long end_time,String arr,String summary,String description,Long is_remind,Long is_repeat,
			Long remind_before_event_secs,String schedule_id,String agentid){
		//根据agentid获取secert
		DataObject[] dicts = BusinessDictUtil.getDictInfoByType("AME_WE_APP");
		String	corpsecret = null;
		for(int i=0;i<dicts.length;i++){
			if(dicts[i].get("dictID").equals(agentid)){
				corpsecret = (String) dicts[i].get("filter1");
			}
		}
		String access_token =  getCache(corpsecret);
		//如果是空，说明获取token失败了		

		if(access_token==null){
			return "1";
		}
		String url = BusinessDictUtil.getDictName(AME_WE_CHAT, "ADD_CALENDER");
		url = url+"?access_token="+access_token;
		JSONObject json = new JSONObject();
		if(organizer!=null){
			json.put("organizer", organizer);//.日程组织者
		}
		json.put("schedule_id", schedule_id);//.日程id
		json.put("start_time", start_time);//.日程开始时间
		json.put("end_time", end_time);//.日程结束时间
		json.put("summary", summary);//日程主题
		json.put("description", description);//.日程信息
		json.put("attendees", arr);//.日程参与者id

		//日程内容
		JSONObject reminders=new JSONObject();
	
		reminders.put("is_remind", is_remind);
		reminders.put("remind_before_event_secs", remind_before_event_secs);//提前提醒时间
		if (is_repeat==1) {
			reminders.put("is_repeat", is_repeat);
			reminders.put("repeat_type",0);

		}
		//reminders.put("is_repeat", null);
		//reminders.put("repeat_type",null);
		json.put("reminders", reminders);//.是否提前提醒

		//json.put("location", "hahha");//.日程地址
		//json.put("cal_id", "fsdfsd");//.日历

		JSONObject json1 = new JSONObject();
		json1.put("schedule", json);//将全部参数传入schedule
		String params = json1.toString();
		/**
		 * 如果不转换，微信接口异常
		 * 公司这个json的jar包，在转化json的时候，把部分标点换成转义符
		 * 暂时只是发现这个，其他的还不知道，这是一个隐患
		 * 需要更换json包
		 */
		params = params.replace("\\u201C", "“");
		params = params.replace("\\u201D", "”");
		params = params.replace("\\", "");
		params = params.replaceAll("\"\\[", "[");
		params = params.replaceAll("]\"", "]");

		
		String return_msg = HttpClientUtil.post(url, params);
		JSONObject return_json = (JSONObject)JSONValue.parse(return_msg);
        String errcode = return_json.get("errcode").toString();

		if(errcode.equals("0")){
			return errcode;
		}else if(errcode.equals("40014") || errcode.equals("42001")){//token过期了
			System.out.println("token过期了");
			String re_str = getAccessToken(corpsecret);
			if(re_str.equals("SUCC")){
				access_token =  getCache(corpsecret);
				//如果是空，说明获取token失败了		
				if(access_token==null){
					return "1";
				}
				
				url = url.substring(0, url.lastIndexOf("=")+1)+access_token;
				return_msg = HttpClientUtil.post(url, json.toString());
				return_json = (JSONObject)JSONValue.parse(return_msg);
				errcode = (String)return_json.get("errcode");
				return errcode;
			}else{
				return errcode;
			}
		}else{
			return errcode;
		}
    }
    
    @Bizlet("创建企业微信日程安排的接口")
   	public static String  creatCalendarArrange(String organizer,Long start_time,Long end_time,String arr,String summary,String description,Long is_remind,Long is_repeat,
   			Long remind_before_event_secs,String agentid){
   		//根据agentid获取secert
   		DataObject[] dicts = BusinessDictUtil.getDictInfoByType("AME_WE_APP");
   		String	corpsecret = null;
   		for(int i=0;i<dicts.length;i++){
   			if(dicts[i].get("dictID").equals(agentid)){
   				corpsecret = (String) dicts[i].get("filter1");
   			}
   		}
   		String access_token =  getCache(corpsecret);
   		//如果是空，说明获取token失败了		

   		if(access_token==null){
   			return "1";
   		}
   		String url = BusinessDictUtil.getDictName(AME_WE_CHAT, "ADD_CALENDER");
   		url = url+"?access_token="+access_token;
   		JSONObject json = new JSONObject();
   		if(organizer!=null){
   			json.put("organizer", organizer);//.日程组织者
   		}

   		json.put("start_time", start_time);//.日程开始时间
   		json.put("end_time", end_time);//.日程结束时间
   		json.put("summary", summary);//日程主题
   		json.put("description", description);//.日程信息
   		json.put("attendees", arr);//.日程参与者id

   		//日程内容
   		JSONObject reminders=new JSONObject();
   	
   		reminders.put("is_remind", is_remind);
   		reminders.put("remind_before_event_secs", remind_before_event_secs);//提前提醒时间
   		if (is_repeat==1) {
   			reminders.put("is_repeat", is_repeat);
   			reminders.put("repeat_type",0);

   		}
   		//reminders.put("is_repeat", null);
   		//reminders.put("repeat_type",null);
   		json.put("reminders", reminders);//.是否提前提醒

   		//json.put("location", "hahha");//.日程地址
   		//json.put("cal_id", "fsdfsd");//.日历

   		JSONObject json1 = new JSONObject();
   		json1.put("schedule", json);//将全部参数传入schedule
   		String params = json1.toString();
   		/**
   		 * 如果不转换，微信接口异常
   		 * 公司这个json的jar包，在转化json的时候，把部分标点换成转义符
   		 * 暂时只是发现这个，其他的还不知道，这是一个隐患
   		 * 需要更换json包
   		 */
   		params = params.replace("\\u201C", "“");
   		params = params.replace("\\u201D", "”");
   		params = params.replace("\\", "");
   		params = params.replaceAll("\"\\[", "[");
   		params = params.replaceAll("]\"", "]");

   		
   		String return_msg = HttpClientUtil.post(url, params);
   		JSONObject return_json = (JSONObject)JSONValue.parse(return_msg);
           String errcode = return_json.get("errcode").toString();
           String schedule_id = return_json.get("schedule_id").toString();

   		if(errcode.equals("0")){
   			return schedule_id;
   		}else if(errcode.equals("40014") || errcode.equals("42001")){//token过期了
   			System.out.println("token过期了");
   			String re_str = getAccessToken(corpsecret);
   			if(re_str.equals("SUCC")){
   				access_token =  getCache(corpsecret);
   				//如果是空，说明获取token失败了		
   				if(access_token==null){
   					return "1";
   				}
   				
   				url = url.substring(0, url.lastIndexOf("=")+1)+access_token;
   				return_msg = HttpClientUtil.post(url, json.toString());
   				return_json = (JSONObject)JSONValue.parse(return_msg);
   				System.out.println(return_json);
   				errcode = (String)return_json.get("errcode");
   				return errcode;
   			}else{
   				return errcode;
   			}
   		}else{
   			return errcode;
   		}
       }
    
    @Bizlet("取消企业微信日程安排的接口")
    public static String deleteCalendarArrange(String agentid,String wechatreturnid){
    	
    	//根据agentid获取secert
		DataObject[] dicts = BusinessDictUtil.getDictInfoByType("AME_WE_APP");
		String	corpsecret = null;
		for(int i=0;i<dicts.length;i++){
			if(dicts[i].get("dictID").equals(agentid)){
				corpsecret = (String) dicts[i].get("filter1");
			}
		}
		String access_token =  getCache(agentid);
		
    //	String access_token=agentid;
		//如果是空，说明获取token失败了		

		if(access_token==null){
			return "1";
		}
		String url = BusinessDictUtil.getDictName(AME_WE_CHAT, "DELETE_CALENDER");
		url = url+"?access_token="+access_token;
		JSONObject json = new JSONObject();
		json.put("schedule_id", wechatreturnid);
		String params = json.toString();
		/**
		 * 如果不转换，微信接口异常
		 * 公司这个json的jar包，在转化json的时候，把部分标点换成转义符
		 * 暂时只是发现这个，其他的还不知道，这是一个隐患
		 * 需要更换json包
		 */
		params = params.replace("\\u201C", "“");
		params = params.replace("\\u201D", "”");
		params = params.replace("\\", "");
		

		
		String return_msg = HttpClientUtil.post(url, params);
		JSONObject return_json = (JSONObject)JSONValue.parse(return_msg);
        String errcode = return_json.get("errcode").toString();
    	
    	 if(errcode.equals("40014") || errcode.equals("42001")){//token过期了
 			System.out.println("token过期了");
 			String re_str = getAccessToken(corpsecret);
 			if(re_str.equals("SUCC")){
 				access_token =  getCache(corpsecret);
 				//如果是空，说明获取token失败了		
 				if(access_token==null){
 					return "1";
 				}
 				
 				url = url.substring(0, url.lastIndexOf("=")+1)+access_token;
 				return_msg = HttpClientUtil.post(url, json.toString());
 				return_json = (JSONObject)JSONValue.parse(return_msg);
 				System.out.println(return_json);
 				errcode = (String)return_json.get("errcode");
 				return errcode;
 			}else{
 				return errcode;
 			}
 		}else{
 			return errcode;
 		}
    }
	   
	
}
    
	

