/*******************************************************************************
 * $Header: /cvsroot/MIS10/src/NEWERP/org.gocom.abframe.auth/src/org/gocom/abframe/auth/taglib/PermissionTag.java,v 1.1 2013/06/02 19:53:28 huangqj Exp $
 * $Revision: 1.1 $
 * $Date: 2013/06/02 19:53:28 $
 *
 *==============================================================================
 *
 * Copyright (c) 2001-2006 Primeton Technologies, Ltd.
 * All rights reserved.
 *
 * Created on 2008-8-17
 *******************************************************************************/


package org.gocom.abframe.auth.taglib;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;

import org.gocom.abframe.auth.bizlet.PermissionUtil;

import com.eos.access.authorization.CheckedResult;
import com.eos.data.datacontext.IUserObject;
import com.eos.foundation.eoscommon.LogUtil;
import com.eos.web.taglib.basic.BaseIteratorTagSupport;

/**
 *
 * 权限标签<BR>
 * 当在页面的按钮或其他html元素设置了权限标签时，只有有功能权限的操作员才能看到，否则隐藏不显示.如：
 * <pre>
 *    &lt;abframe:permission  property="buttonId" iterateId="id1"  value="id1" scope="[s|f|r]">
 *      &lt;input type="button" value="提交" onClick="doSubmit();"/>
 *    &lt;/abframe:permission>
 *    property=存放function定义中url值的xpath
 *    iterateId=迭代的根对象
 *    value = 常量url 
 *    scope =  property的所在范围
 * </pre>
 *
 * @author 翁增仁
 * wengzr (mailto:wengzr@primeton.com)
 */
/*
 * 修改历史
 * $Log: PermissionTag.java,v $
 * Revision 1.1  2013/06/02 19:53:28  huangqj
 * *** empty log message ***
 *
 * Revision 1.10  2010/12/09 06:29:33  caisy
 * 重构haspermission返回值
 *
 * Revision 1.9  2010/12/02 06:48:44  caisy
 * 增加异常日志输出
 *
 * Revision 1.8  2010/12/02 05:53:48  caisy
 * 增加initAttributes方法
 *
 * Revision 1.7  2010/12/01 10:01:05  caisy
 * 权限校验抽取为公用方法
 *
 * Revision 1.6  2010/12/01 03:23:14  caisy
 * 配置文件读取方式修改
 *
 * Revision 1.5  2010/11/30 16:12:23  caisy
 * 编码改为UTF-8
 *
 * Revision 1.4  2009/04/14 03:54:32  caisy
 * 资源权限控制
 *
 * Revision 1.3  2009/03/30 05:39:39  caisy
 * 代码规范
 *
 * Revision 1.2  2009/01/21 05:24:54  caisy
 * 消除编译警告
 *
 * Revision 1.1  2009/01/05 02:34:57  caisy
 * abframe二期初始版本
 *
 */
public class PermissionTag extends BaseIteratorTagSupport{
	
	/**
	 * Comment for <code>serialVersionUID</code>
	 */
	private static final long serialVersionUID = 8121152106347375612L;

	@Override public int doStartTag() {
		try{
		initAttributes();
		Object obj = this.getOutput();
        String url =(obj==null)?null:obj.toString();	
        HttpServletRequest request=(HttpServletRequest)pageContext.getRequest();
		IUserObject userObject=(IUserObject)request.getSession().getAttribute(IUserObject.KEY_IN_CONTEXT);
		if ( CheckedResult.THREAD_ACCESSED_PASS.equals(PermissionUtil.hasPermission(url,userObject))) {
			return EVAL_BODY_INCLUDE;			
		} else {
			return SKIP_BODY;
		}		
		}catch(Exception e){
			LogUtil.logError("权限标签执行出错!", e, (Object)null);
			return SKIP_BODY;
		}
	}
	@Override  public void initAttributes() throws JspException {
	         super.initAttributes();
	}
	/**
	 * 获得输出的对象
	 *
	 * @return
	 */
	private String getOutput() {
	   Object	propertyObject = this.getPropertyValue();
		// 如果proprety取值为null,取value属性的值
		if (propertyObject != null) {
			return propertyObject.toString();
		} else {
			return this.getValue();
		}
	}
}
