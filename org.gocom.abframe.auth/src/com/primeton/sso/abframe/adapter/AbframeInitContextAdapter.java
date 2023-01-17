/*******************************************************************************
 * $Header: /cvsroot/MIS10/src/NEWERP/org.gocom.abframe.auth/src/com/primeton/sso/abframe/adapter/AbframeInitContextAdapter.java,v 1.1 2016/04/14 07:15:35 huangqj Exp $
 * $Revision: 1.1 $
 * $Date: 2016/04/14 07:15:35 $
 *
 *==============================================================================
 *
 * Copyright (c) 2001-2006 Primeton Technologies, Ltd.
 * All rights reserved.
 * 
 * Created on 2009-11-13
 *******************************************************************************/

package com.primeton.sso.abframe.adapter;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.FilterChain;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.eos.data.datacontext.DataContextManager;
import com.eos.data.datacontext.IMUODataContext;
import com.eos.data.datacontext.IUserObject;
import com.eos.data.datacontext.UserObject;
import com.primeton.ext.common.muo.MUODataContextHelper;

import edu.yale.its.tp.cas.client.IContextInit;

public class AbframeInitContextAdapter implements IContextInit {

	private static final Log log = LogFactory.getLog(""
			+ AbframeInitContextAdapter.class);

	public String getTranslatorUser(String userId) {
		return userId;
	}

	public void initContext(ServletRequest request, ServletResponse response,
			FilterChain fc, String userId) {
		HttpServletRequest servletRequest = (HttpServletRequest) request;
		HttpSession sesson = servletRequest.getSession();
		String sessionId = "[sessionId:" + sesson.getId() + "]";
		if (userId == null) {
			throw new RuntimeException("Illegal user");
		}
		try {
			log.info("[ABFrame][start to Login][user:" + userId + "]"
					+ sessionId);
			UserObject userObject = new UserObject();
			userObject.setUserId(userId);
			loginMUO(userObject, servletRequest, (HttpServletResponse) response); // 先登陆一下，以便调用逻辑流
			userObject = initSessionUserObject(userId); // 传入userId创建UserObject对象,调用逻辑流初始化session
			loginMUO(userObject, servletRequest, (HttpServletResponse) response); // 登陆

		} catch (Throwable e) {
			log.error("[ABFrame][user login failure!][user:" + userId + "]"
					+ sessionId, e);
		}

	}

	/**
	 * 登陆
	 * 
	 * @param userObject
	 * @param request
	 * @param response
	 */
	public void loginMUO(UserObject userObject, HttpServletRequest request,
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
	public UserObject initSessionUserObject(String userId) throws Throwable {
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

}
