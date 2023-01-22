/*******************************************************************************
 * $Header: /cvsroot/MIS10/src/NEWERP/org.gocom.abframe.auth/src/org/gocom/abframe/auth/auth/sso/cas/AbframeInitContext.java,v 1.1 2013/06/02 19:53:49 huangqj Exp $
 * $Revision: 1.1 $
 * $Date: 2013/06/02 19:53:49 $
 *
 *==============================================================================
 *
 * Copyright (c) 2001-2010 Primeton Technologies, Ltd.
 * All rights reserved.
 * 
 * Created on 2010-12-31
 *******************************************************************************/


package org.gocom.abframe.auth.auth.sso.cas;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.FilterChain;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.eos.access.http.OnlineUserManager;
import com.eos.data.datacontext.DataContextManager;
import com.eos.data.datacontext.IMUODataContext;
import com.eos.data.datacontext.IUserObject;
import com.eos.data.datacontext.UserObject;
import com.primeton.ext.access.http.HttpMapContextFactory;
import com.primeton.ext.common.muo.MUODataContextHelper;

import edu.yale.its.tp.cas.client.IContextInit;

public class AbframeInitContext implements IContextInit {
	
	private static final Log log = LogFactory.getLog(""+AbframeInitContext.class);
	
	public String getTranslatorUser(String userId) {
		return userId;
	}

	public void initContext(ServletRequest request, ServletResponse response, FilterChain fc, String userId) {
		HttpServletRequest servletRequest = (HttpServletRequest)request;
		HttpSession sesson= servletRequest.getSession();
		String sessionId = "[sessionId:" + sesson.getId() + "]";
		try
		{
			log.info("[ABFrame][start to Login][user:"+userId+"]"+sessionId);
		UserObject userObject=new UserObject();
		
		if(userId==null){
			userObject.setUserId("guest");
		}else{			
			userObject.setUserId(userId);
			userObject = initSessionUserObject(userId);	//传入userId创建UserObject对象,调用逻辑流初始化session
		}
		DataContextManager.current().setMapContextFactory(new HttpMapContextFactory(request,response));
		OnlineUserManager.login(userObject);
		
		if (userObject != null) {
			Map<Object, Object> map = new HashMap<Object, Object>();
			map.put(IUserObject.KEY_IN_CONTEXT, userObject);
			IMUODataContext muo = MUODataContextHelper.create(map);
			DataContextManager.current().setMUODataContext(muo);
		}
		
		}
		catch(Throwable e)
		{
			log.error("[ABFrame][user login failure!][user:"+userId+"]"+sessionId, e);
		}

	}
	
	/**
	 * 初始化Session数据
	 * @param userId
	 * @param request
	 * @param response
	 * @return
	 * @throws Throwable 
	 */
	public UserObject initSessionUserObject(String userId) throws Throwable{
		//逻辑构件全称
		String componentName="org.gocom.abframe.auth.LoginManager";
		//逻辑流名称
		String logicName="initUserObject";
		
		com.eos.engine.component.ILogicComponent comp =
			com.primeton.ext.engine.component.LogicComponentFactory.create(componentName);

		commonj.sdo.DataObject acOperator = commonj.sdo.helper.DataFactory.INSTANCE.create(
				"org.gocom.abframe.dataset.privilege","AcOperator");
		
		Object[] params = {acOperator};
		acOperator.set("userid", userId);
		Object[] returnValues =null;
	
		returnValues=comp.invoke(logicName, params);
										
		
		return (com.eos.data.datacontext.UserObject)returnValues[0];
	}
	
}