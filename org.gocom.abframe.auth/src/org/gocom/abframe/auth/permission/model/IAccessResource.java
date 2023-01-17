/*******************************************************************************
 * $Header: /cvsroot/MIS10/src/NEWERP/org.gocom.abframe.auth/src/org/gocom/abframe/auth/permission/model/IAccessResource.java,v 1.1 2013/06/02 19:53:45 huangqj Exp $
 * $Revision: 1.1 $
 * $Date: 2013/06/02 19:53:45 $
 *
 *==============================================================================
 *
 * Copyright (c) 2001-2010 Primeton Technologies, Ltd.
 * All rights reserved.
 * 
 * Created on 2010-12-1
 *******************************************************************************/

/**
 *
 * 可访问资源模型<BR>
 * abframe中可控的所有资源接口
 * @author charles
 * caisy (mailto:caisy@primeton.com)
 */
package org.gocom.abframe.auth.permission.model;

import java.io.Serializable;
import java.util.Map;

public interface IAccessResource extends Serializable {
	
	/**
	 * 资源编号
	 * <pre>
	 * 资源编号与资源类型应能唯一标识一个资源
	 * </pre>
	 * @return 资源编号
	 */
	public String getResourceId();
	/**
	 * 资源类型
	 * 	 <pre>
	 * 资源类型与资源编号应能唯一标识一个资源
	 * </pre>
	 * @return 资源类型
	 */
	public String getResourceType();
	/**
	 * 资源的URI标识
	 * 如：页面流的全名
	 *        逻辑流的全名等
	 * @return URI标识
	 */
	public String getResourceUri();

	/**
	 * 资源的附加信息
	 * @return
	 */
	public Map getResouceAttributes();
}
