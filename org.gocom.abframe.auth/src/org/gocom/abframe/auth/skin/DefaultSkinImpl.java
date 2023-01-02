/*******************************************************************************
 * $Header: /cvsroot/MIS10/src/NEWERP/org.gocom.abframe.auth/src/org/gocom/abframe/auth/skin/DefaultSkinImpl.java,v 1.1 2013/06/02 19:53:26 huangqj Exp $
 * $Revision: 1.1 $
 * $Date: 2013/06/02 19:53:26 $
 *
 *==============================================================================
 *
 * Copyright (c) 2001-2010 Primeton Technologies, Ltd.
 * All rights reserved.
 * 
 * Created on 2010-12-20
 *******************************************************************************/


package org.gocom.abframe.auth.skin;

import javax.servlet.http.HttpServletRequest;

import org.gocom.abframe.ABFConfigKey;

import com.eos.data.datacontext.IUserObject;
import com.eos.system.utility.StringUtil;

public class DefaultSkinImpl implements ISkinConvertor {

	/**
	 * 从request中获取用户的当前layout
	 */
	public String getLayout(HttpServletRequest request) {
		String layout = null;
		IUserObject user = (IUserObject) request.getSession().getAttribute(IUserObject.KEY_IN_CONTEXT);
		if (user != null) {
			layout = (String) user.getAttributes().get(ABFConfigKey.SKIN_LAYOUTATTR.getConfigValue());
		}
		return StringUtil.isNullOrBlank(layout) ? ABFConfigKey.SKIN_DEFAULT_LAYOUT.getConfigValue() : layout;
	}

	public String getStyle(HttpServletRequest request) {
		String style = null;
		IUserObject user = (IUserObject) request.getSession().getAttribute(IUserObject.KEY_IN_CONTEXT);
		if (user != null) {
			style = (String) user.getAttributes().get(ABFConfigKey.SKIN_STYLEATTR.getConfigValue());
		}
		return StringUtil.isNullOrBlank(style) ? ABFConfigKey.SKIN_DEFAULT_STYLE.getConfigValue() : style;
	}

}
