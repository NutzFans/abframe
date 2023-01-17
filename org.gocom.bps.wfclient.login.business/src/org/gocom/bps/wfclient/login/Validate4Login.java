/*******************************************************************************
 * $Header: /cvsroot/MIS10/src/NEWERP/org.gocom.bps.wfclient.login.business/src/org/gocom/bps/wfclient/login/Validate4Login.java,v 1.1 2016/05/31 05:39:19 huangqj Exp $
 * $Revision: 1.1 $
 * $Date: 2016/05/31 05:39:19 $
 *
 *==============================================================================
 *
 * Copyright (c) 2001-2006 Primeton Technologies, Ltd.
 * All rights reserved.
 * 
 * Created on 2008-1-14
 *******************************************************************************/


package org.gocom.bps.wfclient.login;


import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import com.eos.access.http.LocaleHelper;
import com.eos.access.http.OnlineUserManager;
import com.eos.data.datacontext.DataContextManager;
import com.eos.data.datacontext.ISessionMap;
import com.eos.data.datacontext.IUserObject;
import com.eos.data.datacontext.UserObject;
import com.eos.runtime.core.TraceLoggerFactory;
import com.eos.system.annotation.Bizlet;
import com.eos.system.logging.Logger;
import com.eos.workflow.api.BPSServiceClientFactory;
import com.eos.workflow.omservice.IWFPermissionService;

import org.gocom.bps.wfclient.common.CommonUtil;

import com.primeton.ext.common.muo.MUODataContextHelper;
import com.primeton.ext.data.datacontext.http.MUODataContext;
import com.primeton.workflow.api.WFServiceException;
import com.primeton.workflow.model.consts.RunTimeConst;

/**
 * TODO 此处填写 class 信息
 *
 * @author wanglei (mailto:wanglei@primeton.com)
 */

@Bizlet()
public class Validate4Login {
	
	private static Logger log = TraceLoggerFactory.getLogger(Validate4Login.class);
	
	@Bizlet("validate4Login")
	public static int validate4Login(UserObject userObj, String userName,String pwd,String domainID,String language) throws WFServiceException {
		int result = 0;
		boolean isNewUserObject = false;
		if (userObj == null) {
			userObj = new UserObject();
			isNewUserObject = true;
		}

		userObj.setUserId(userName);

		userObj.getAttributes().put(RunTimeConst.TENANT_ID, domainID);
		if (isNewUserObject) {
			Map map = new HashMap();
			map.put(IUserObject.KEY_IN_CONTEXT, userObj);
			MUODataContext context = new MUODataContext(map, new String[] { UserObject.KEY_IN_CONTEXT });
			DataContextManager.current().setMUODataContext(context);
		}

		try {
			IWFPermissionService service = BPSServiceClientFactory.getDefaultClient().getWFPermissionService();
			boolean success = service.validate(userObj.getUserId(), pwd, null);
			if (success) {
				success = service.hasPermission(userObj.getUserId(), IWFPermissionService.PERM_BPSCLIENT);
			}

			if (success) {
				userName = CommonUtil.getPaticipantName(null, userName);
				userObj.setUserName(userName);
				OnlineUserManager.login(userObj);
				
				Locale locale = null;
				if ("zh".equals(language)) {
					locale = new Locale("zh", "CN");
				}
				if ("en".equals(language)) {
					locale = new Locale("en", "US");
				}
				ISessionMap sessionMap = DataContextManager.current().getSessionCtx();
				if (sessionMap == null) {
					sessionMap = MUODataContextHelper.getMapContextFactory().getSessionMap();
				}
				sessionMap.put(LocaleHelper.LOCALE_ATTRIBUTE_NAME, locale);
				result = 1;
			}
		} catch (Exception e) {
			log.debug(e);
		}
		return result;
	}

}

