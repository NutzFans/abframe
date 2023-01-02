/*******************************************************************************
 * $Header: /cvsroot/MIS10/src/NEWERP/org.gocom.abframe.auth/src/org/gocom/abframe/auth/skin/ISkinConvertor.java,v 1.1 2013/06/02 19:53:26 huangqj Exp $
 * $Revision: 1.1 $
 * $Date: 2013/06/02 19:53:26 $
 *
 *==============================================================================
 *
 * Copyright (c) 2001-2010 Primeton Technologies, Ltd.
 * All rights reserved.
 * 
 * Created on 2010-12-16
 *******************************************************************************/


package org.gocom.abframe.auth.skin;

import javax.servlet.http.HttpServletRequest;

import org.gocom.abframe.auth.bizlet.SkinUtil;

public interface ISkinConvertor {
	public static final ISkinConvertor INSTANCE=SkinUtil.initISkinConvertor();
	/**
	 * 获取 layout 
	 * @param request  
	 * @return  layout
	 */
      public String getLayout(HttpServletRequest request);
      
      /**
       * 获取 style 
       * @param request
       * @return style
       */
      public String getStyle(HttpServletRequest request);
      
}
