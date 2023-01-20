package com.primeton.eos.ame_common;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections4.CollectionUtils;
import org.apache.commons.lang.StringUtils;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.eos.foundation.eoscommon.BusinessDictUtil;
import com.eos.runtime.core.TraceLoggerFactory;
import com.eos.system.annotation.Bizlet;
import com.eos.system.logging.Logger;

public class TXEmailUtils {
	
	private static Logger loger = TraceLoggerFactory.getLogger(TXEmailUtils.class);
	
	//@Bizlet("批量校验邮箱账号")
	public static Map<String,Object> batchCheckAccount(List<String> accounts){
		String url = BusinessDictUtil.getDictName("TX_EMAIL", "BATCH_CHECK_EMAIL_URL");
		Map< String, Object> retMap = new HashMap<String, Object>();
		if(CollectionUtils.isEmpty(accounts)){
			retMap.put("status", -1);//要检查的账号不能为空
		}
		Map< String, Object> map = new HashMap<String, Object>();
	    map.put("userlist", accounts);
	    HttpsClientUtil.doPostForJson(url, map);
		return retMap;
	}
	
	
	/**
	 * 校验所有的邮箱账号，包括邮件组邮箱账号也可以校验
	 * 返回0时，此邮箱账号可以作为新邮箱账号开通
	 * @param email
	 * @return
	 */
	@Bizlet("校验邮箱账号")
	public static int checkAccount(String email){
		String url = BusinessDictUtil.getDictName("TX_EMAIL", "BATCH_CHECK_EMAIL_URL");
		if(StringUtils.isEmpty(email)){
			return 1;//账号为空
		}
		List<String> accounts = new ArrayList<String>();
		accounts.add(email);
		Map< String, Object> map = new HashMap<String, Object>();
	    map.put("userlist", accounts);
	    JSONObject obj = HttpsClientUtil.doPostForJson(url, map);
	    if(obj==null){
	    	return 2;//调用接口失败
	    }else{
	    	int errcode = obj.getIntValue("errcode");//接口返回业务状态码
			if(errcode==0){//创建成功
				//获取校验结果集
		    	JSONArray users = obj.getJSONArray("list");
		    	//获取单个结果（因为只传一个账号所以只需要获取第一个）
		    	JSONObject user = users.getJSONObject(0);
		    	//帐号类型。-1:帐号号无效; 0:帐号名未被占用; 1:主帐号; 2:别名帐号; 3:邮件群组帐号（接口文档返回的枚举值）
		    	int type = user.getIntValue("type");
		    	if(type==0){
		    		return 0;
		    	}else{
		    		return 3;//账号被占用或者无效
		    	}
			}else{
				return 4;//调用接口业务逻辑处理失败
			}
	    }
	}
	
	/**
	 * 
	 * @param userId 成员UserID。企业邮帐号名，邮箱格式
	 * @param name 成员名称。长度为1~64个字节
	 * @param mobile 手机号码
	 * @param extid 编号 
	 * @param gender 性别。1表示男性，2表示女性
	 */
	@Bizlet("创建新员工邮箱账号")
	public static Integer createUserAcc(String userId,String name,String mobile,String extid,String gender){
		String url = BusinessDictUtil.getDictName("TX_EMAIL", "CREATE_USER_EMAIL_URL");
		//从数据字典中获取“普元信息技术股份有限公司”部门id
		String departmentId = BusinessDictUtil.getDictName("TX_EMAIL", "DEPARTMENT_ID");
		//新邮箱初始密码
		String orignalPassword = BusinessDictUtil.getDictName("TX_EMAIL", "EMAIL_ORIGIONAL_PASSWORD");
		Map<String, Object> paramMap = new HashMap<String, Object>();
		List<BigInteger> departmentIds = new ArrayList<BigInteger>();
		//目前默认加到 “普元信息技术股份有限公司”这个部门后续如有需要再改造
		departmentIds.add(new BigInteger(departmentId));
		paramMap.put("userid", userId);
		paramMap.put("name", name);
		paramMap.put("department", departmentIds);
		paramMap.put("mobile", mobile);
		paramMap.put("extid", extid);
		paramMap.put("gender", gender);
		paramMap.put("password", orignalPassword);
		paramMap.put("cpwd_login", 1);	//用户重新登录时是否重设密码, 登陆重设密码后，该标志位还原。0表示否，1表示是，缺省为0
		JSONObject jsonObj = HttpsClientUtil.doPostForJson(url, paramMap);
		if(jsonObj==null){
			return 2;//调用接口失败
		}else{
			int errcode = jsonObj.getIntValue("errcode");//接口返回业务状态码
			if(errcode==0){//创建成功
				return 0;//创建成功
			}else{
				return 3;//调用接口业务逻辑处理失败
			}
		}
	}
	/**
	 * 
	 * @param email
	 * @return
	 */
	@Bizlet("删除企业邮箱账号")
	public static Integer deleteUserAcc(String email){
		if(StringUtils.isEmpty(email)){
			return 1;//参数不能为空
		}
		String url = BusinessDictUtil.getDictName("TX_EMAIL", "DELETE_USER_EMAIL_URL");
		Map<String, String> querys = new HashMap<String, String>();
		querys.put("userid", email);
		JSONObject jsonObj = HttpsClientUtil.doGet(url, querys);
		if(jsonObj==null){
			return 2;//调用接口失败
		}else{
			int errcode = jsonObj.getIntValue("errcode");//接口返回业务状态码
			if(errcode==0){//删除企业个人邮箱账户成功
				return 0;//删除成功
			}else{
				return 3;//调用接口业务逻辑处理失败
			}
		}
	}
	
	/**
	 * 给员工添加到指定邮件组
	 * @param groupAcc（指定的邮件组邮箱账号）
	 * @param userAccList（需要添加的成员邮箱集合）
	 * @return
	 */
	@Bizlet("将员工邮箱添加到指定邮件组中")
	public static Integer addUserAccToGoup(String groupAcc,String userAcc){
		if(StringUtils.isEmpty(userAcc)||StringUtils.isEmpty(groupAcc)){
			return 1;//参数不能为空
		}
		Map<String, Object> paramMap = new HashMap<String, Object>();
		//因为只有更新接口，并未更新会覆盖原来数据，所以更新之前先去查询原有邮件组的数据
		JSONObject oldJsonObj = queryEmailGropuByEmailAcc(groupAcc);
		String groupid = oldJsonObj.getString("groupid");
		paramMap.put("groupid", groupid);
		String groupname = oldJsonObj.getString("groupname");
		paramMap.put("groupname", groupname);
		JSONArray oldUserArray = oldJsonObj.getJSONArray("userlist");
		List<String>  userlist = JSON.parseArray(oldUserArray.toString(),String.class);
		//在原有的邮件组账号中添加新的员工账号
		userlist.add(userAcc);
		paramMap.put("userlist", userlist);
		JSONArray groupArray = oldJsonObj.getJSONArray("grouplist");
		if(!groupArray.isEmpty()){
			List<String> grouplist = JSON.parseArray(groupArray.toString(),String.class);
			paramMap.put("grouplist", grouplist);
		}
		JSONArray departmentArray = oldJsonObj.getJSONArray("department");
		if(!departmentArray.isEmpty()){
			List<Integer> departmentList = JSON.parseArray(departmentArray.toString(),Integer.class);
			paramMap.put("department", departmentList);
		}
		paramMap.put("allow_type", oldJsonObj.getIntValue("allow_type"));
		JSONArray allow_userArray = oldJsonObj.getJSONArray("allow_userlist");
		if(!allow_userArray.isEmpty()){
			List<String> allow_userlist = JSON.parseArray(allow_userArray.toString(),String.class);
			paramMap.put("allow_userlist", allow_userlist);
		}
		loger.debug("更新邮件组之前查询到原有的邮件组信息为：["+oldJsonObj.toString()+"]");
		String url = BusinessDictUtil.getDictName("TX_EMAIL", "GROUP_UPDATE_URL");
		loger.debug("更新后的邮件组信息为：["+paramMap.toString()+"]");
		JSONObject jsonObj = HttpsClientUtil.doPostForJson(url, paramMap);
		if(jsonObj==null){
			return 2;//调用接口失败
		}else{
			int errcode = jsonObj.getIntValue("errcode");//接口返回业务状态码
			if(errcode==0){//添加成功
				return 0;//添加成功
			}else{
				return 3;//调用接口业务逻辑处理失败
			}
		}
	}
	
	/**
	 * 将指定员工邮箱从指定邮件组中删除
	 * @param groupAcc（指定的邮件组邮箱账号）
	 * @param userAccList（需要从邮件组中删除的员工邮箱）
	 * @return
	 */
	@Bizlet("将指定员工邮箱从指定邮件组中删除")
	public static Integer deleteUserAccFromGoup(String groupAcc,List<String> userAccList){
		Map<String, Object> paramMap = new HashMap<String, Object>();
		//因为只有更新接口，并未更新会覆盖原来数据，所以更新之前先去查询原有邮件组的数据
		JSONObject oldJsonObj = queryEmailGropuByEmailAcc(groupAcc);
		String groupid = oldJsonObj.getString("groupid");
		paramMap.put("groupid", groupid);
		String groupname = oldJsonObj.getString("groupname");
		paramMap.put("groupname", groupname);
		JSONArray oldUserArray = oldJsonObj.getJSONArray("userlist");
		List<String>  userlist = JSON.parseArray(oldUserArray.toString(),String.class);
		if(CollectionUtils.isNotEmpty(userAccList)){
			//在原有的邮件组账号中删除员工账号
			userlist.removeAll(userAccList);
		}
		paramMap.put("userlist", userlist);
		JSONArray groupArray = oldJsonObj.getJSONArray("grouplist");
		if(!groupArray.isEmpty()){
			List<String> grouplist = JSON.parseArray(groupArray.toString(),String.class);
			paramMap.put("grouplist", grouplist);
		}
		JSONArray departmentArray = oldJsonObj.getJSONArray("department");
		if(!departmentArray.isEmpty()){
			List<Integer> departmentList = JSON.parseArray(departmentArray.toString(),Integer.class);
			paramMap.put("department", departmentList);
		}
		paramMap.put("allow_type", oldJsonObj.getIntValue("allow_type"));
		JSONArray allow_userArray = oldJsonObj.getJSONArray("allow_userlist");
		if(!allow_userArray.isEmpty()){
			List<String> allow_userlist = JSON.parseArray(allow_userArray.toString(),String.class);
			paramMap.put("allow_userlist", allow_userlist);
		}
		loger.debug("更新邮件组之前查询到原有的邮件组信息为：["+oldJsonObj.toString()+"]");
		String url = BusinessDictUtil.getDictName("TX_EMAIL", "GROUP_UPDATE_URL");
		loger.debug("更新后的邮件组信息为：["+paramMap.toString()+"]");
		JSONObject jsonObj = HttpsClientUtil.doPostForJson(url, paramMap);
		if(jsonObj==null){
			return 2;//调用接口失败
		}else{
			int errcode = jsonObj.getIntValue("errcode");//接口返回业务状态码
			if(errcode==0){//删除成功
				return 0;//删除成功
			}else{
				return 3;//调用接口业务逻辑处理失败
			}
		}
	}
	/**
	 * 根据邮件组账号查询邮件组信息
	 * @param groupEmailAcc
	 * @return
	 */
	public static JSONObject queryEmailGropuByEmailAcc(String groupEmailAcc){
		String url = BusinessDictUtil.getDictName("TX_EMAIL", "GROUP_QUERY_URL");
		Map<String, String> querys = new HashMap<String, String>();
		querys.put("groupid", groupEmailAcc);
		JSONObject jsonObject = HttpsClientUtil.doGet(url, querys);
		if(jsonObject==null){
			return null;//调用接口失败
		}else{
			int errcode = jsonObject.getIntValue("errcode");//接口返回业务状态码
			if(errcode==0){//创添加成功
				return jsonObject;//创添加成功
			}else{
				return null;//调用接口业务逻辑处理失败
			}
		}
	}
	/**
	 * 根据部门名称查询企业邮箱中的部门id
	 * @param departmentName(如：普元信息技术股份有限公司)
	 * @return
	 */
	public static BigInteger getDepartmentId(String departmentName){
		String url = BusinessDictUtil.getDictName("TX_EMAIL", "GET_DEPARTMENT_LIST_URL");
		Map<String, String> querys = new HashMap<String, String>();
		querys.put("id", "1");
		JSONObject jsonObj = HttpsClientUtil.doGet(url, querys);
		if(jsonObj==null){
			return null;//调用接口失败
		}else{
			int errcode = jsonObj.getIntValue("errcode");//接口返回业务状态码
			if(errcode==0){//创添加成功
				JSONArray departments=jsonObj.getJSONArray("department");
				Iterator<Object> it = departments.iterator();
				while(it.hasNext()){
					JSONObject obj = (JSONObject) it.next();
					String departName = obj.getString("name");
					if(departName.equals(departmentName)){
						BigInteger departId = obj.getBigInteger("id");
						return departId;
					}
				}
			}else{
				return null;//调用接口业务逻辑处理失败
			}
		}
		return null;
	}
}
