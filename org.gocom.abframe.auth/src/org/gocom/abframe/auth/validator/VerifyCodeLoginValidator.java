/*******************************************************************************
 * $Header: /cvsroot/MIS10/src/NEWERP/org.gocom.abframe.auth/src/org/gocom/abframe/auth/validator/VerifyCodeLoginValidator.java,v 1.1 2013/06/02 19:53:50 huangqj Exp $
 * $Revision: 1.1 $
 * $Date: 2013/06/02 19:53:50 $
 *
 *==============================================================================
 *
 * Copyright (c) 2001-2006 Primeton Technologies, Ltd.
 * All rights reserved.
 * 
 * Created on 2008-11-24
 *******************************************************************************/


package org.gocom.abframe.auth.validator;

import com.eos.data.datacontext.DataContextManager;
import com.eos.data.datacontext.IDataContext;
import com.eos.data.datacontext.ISessionMap;
import com.eos.engine.core.IValidateRule;
import com.eos.engine.core.ValidateResult;

/**
 * 
 * 验证码校验器<BR>
 *
 * @author 翁增仁
 * wengzr (mailto:wengzr@primeton.com)
 */
/*
 * 修改历史
 * $Log: VerifyCodeLoginValidator.java,v $
 * Revision 1.1  2013/06/02 19:53:50  huangqj
 * *** empty log message ***
 *
 * Revision 1.4  2010/12/01 03:23:14  caisy
 * 配置文件读取方式修改
 *
 * Revision 1.3  2010/11/30 16:12:23  caisy
 * 编码改为UTF-8
 *
 * Revision 1.2  2009/03/30 05:39:39  caisy
 * 代码规范
 *
 * Revision 1.1  2009/01/05 02:34:57  caisy
 * abframe二期初始版本
 *
 * Revision 1.1  2008/11/24 13:43:43  wengzr
 * Added:增加验证码可配置,和验证码校验器VerifyCodeLoginValidator
 *
 */
public class VerifyCodeLoginValidator implements IValidateRule{

	public void validate(String[] params, IDataContext dataContext, ValidateResult result) {
		String verifyCode=dataContext.getString(params[0].trim());
		if(verifyCode!=null){
			
			ISessionMap sessionMap=DataContextManager.current().getSessionCtx();
			if(sessionMap!=null){
				if(!verifyCode.equals(sessionMap.get("verifyCode"))){
					result.addValidateErrorCode("verifyCode", "校验码错误！");
				}
			}
		}
		
	}

}
