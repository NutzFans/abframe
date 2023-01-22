/**
 * 
 */
package com.primeton.eos.ame_inte;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;

import com.eos.access.http.OnlineUserManager;
import com.eos.data.datacontext.DataContextManager;
import com.eos.data.datacontext.IMUODataContext;
import com.eos.data.datacontext.IUserObject;
import com.eos.data.datacontext.UserObject;
import com.eos.engine.component.ILogicComponent;
import com.eos.foundation.database.DatabaseUtil;
import com.eos.system.annotation.Bizlet;
import com.primeton.ext.access.http.HttpMapContextFactory;
import com.primeton.ext.common.muo.MUODataContextHelper;
import com.primeton.ext.engine.component.LogicComponentFactory;

import commonj.sdo.DataObject;
import commonj.sdo.helper.DataFactory;

/**
 * @author weisz
 * @date 2020-08-05 10:06:53
 *
 */
@Bizlet("")
public class UserMappingHandler {

	private UserMappingHandler()  {}
	
	private static final ConcurrentHashMap<String, Map<String, Object>> USER_CACHE = new ConcurrentHashMap<String, Map<String, Object>>();
	
	@Bizlet
	public static UserObject handle(String token, String userId) {

		//暂时不用token 
		
		if (StringUtils.isEmpty(userId)) {
			return null;
		}
		
		if (USER_CACHE.get(userId) == null || isExpired(userId)) {
			String status = add(userId);
			if (!UserMappingCode.SUCCESS.equals(status)) {
				return null;
			}
		}
		
		return (UserObject) USER_CACHE.get(userId).get("user");
	}
	
	public static void loginMUO(UserObject userObject, HttpServletRequest request, HttpServletResponse response) {

		DataContextManager.current().setMapContextFactory(new HttpMapContextFactory(request, response));
		OnlineUserManager.login(userObject);

		if (userObject != null) {
			Map<Object, Object> map = new HashMap<Object, Object>();
			map.put(IUserObject.KEY_IN_CONTEXT, userObject);
			IMUODataContext muo = MUODataContextHelper.create(map);
			DataContextManager.current().setMUODataContext(muo);
		}
	}
	
	/**
	 * 初始化Session数据
	 * @param userId
	 * @return
	 * @throws Throwable
	 */
	public static UserObject initSessionUserObject(String userId) throws Throwable{
		//逻辑构件全称
		String componentName="org.gocom.abframe.auth.LoginManager";
		//逻辑流名称
		String logicName="initUserObject";
		
		ILogicComponent comp = LogicComponentFactory.create(componentName);
		DataObject acOperator = DataFactory.INSTANCE.create("org.gocom.abframe.dataset.privilege","AcOperator");
		
		Object[] params = {acOperator};
		acOperator.set("userid", userId);
		Object[] returnValues =null;
	
		returnValues=comp.invoke(logicName, params);
		return (com.eos.data.datacontext.UserObject)returnValues[0];
	}
	
	/**
	 * 查询用户添加到缓存
	 * @param userId
	 * @return
	 */
	private static String add(String userId) {
		//约定以邮箱来确定同一用户
		DataObject criteria = DataFactory.INSTANCE.create("com.primeton.das.criteria", "criteriaType");
		criteria.set("_entity", "org.gocom.abframe.dataset.organization.OmEmployee");
		criteria.set("_expr[1]/oemail", userId + "@primeton.com");
		criteria.set("_expr[1]/_op", "=");
		DataObject[] arrUser = DatabaseUtil.queryEntitiesByCriteriaEntity("default", criteria);
		if (arrUser == null || arrUser.length < 1) {
			return UserMappingCode.USER_NOT_FOUND;
		}
		List<UserObject> users = new ArrayList<UserObject>();
		for(DataObject user : arrUser) {
			//userMail, userName, userOrgId, userOrgName, userRealName, userRemoteIP, sessionId, uniqueId, attributes
			
			if ("on".equals(user.getString("empstatus"))) {
				UserObject uo = new UserObject();
				uo.setUserId(user.getString("userid"));
				uo.setUserMail(user.getString("oemail"));
				uo.setUserName(user.getString("empname"));
				//uo.setUserRealName(user.getString("realname"));
				users.add(uo);
			}
		}
		if (users.isEmpty()) {
			return UserMappingCode.USER_NOT_ON_DUTY;
		}
		//if (users.size() > 1) {
		//	return UserMappingCode.USER_MORE_THAN_ONE;
		//}
		//过期时间24小时
		long expiredTime = System.currentTimeMillis() + (1000 * 60 * 60 * 24);
		Map<String, Object> temp = new HashMap<>(2);
		temp.put("expire", expiredTime);
		temp.put("user", users.get(0));
		//TODO 计算token 
		//String token = "" ; 
		//暂时不用token
		USER_CACHE.put(userId, temp);
		return UserMappingCode.SUCCESS;
		
	}
	@Bizlet
	public static void clearAll() {
		USER_CACHE.clear();
	}
	
	
	private static boolean isExpired(String userId) {
		Long  expire = (Long) USER_CACHE.get(userId).get("expire");
		if(System.currentTimeMillis() > expire) {
			USER_CACHE.remove(userId);
			return true;
		}
		return false;
	}
	
	protected static class UserMappingCode {
		private UserMappingCode() {}
		
		public static final String SUCCESS = "1"; //成功
		
		public static final String TOKEN_EXPIRED = "100"; //token过期
		public static final String USER_NOT_FOUND = "101"; //用户未找到
		public static final String USER_MORE_THAN_ONE = "102";//找到多于1个用户
		public static final String USER_NOT_ON_DUTY = "103";//非在岗状态
		public static final String TOKEN_ILLEGAL = "104";//token非法
		
		private static final Map<String, String> ERROR_MAP = new HashMap<String, String>();
		
		static {
			put(TOKEN_EXPIRED, "token过期");
			//put(USER_NOT_FOUND, "用户未找到");
			//
		}
		
		private static void put(String key, String value) {
			ERROR_MAP.put(key, value);
		}
		
		public static String get(String key) {
			return ERROR_MAP.get(key);
		}
	}
}
