/*******************************************************************************
 * $Header: /cvsroot/MIS10/src/NEWERP/org.gocom.abframe.auth/src/org/gocom/abframe/auth/permission/model/RoleFunction.java,v 1.1 2013/06/02 19:53:45 huangqj Exp $
 * $Revision: 1.1 $
 * $Date: 2013/06/02 19:53:45 $
 *
 *==============================================================================
 *
 * Copyright (c) 2001-2006 Primeton Technologies, Ltd.
 * All rights reserved.
 * 
 * Created on 2008-8-14
 *******************************************************************************/


package org.gocom.abframe.auth.permission.model;

/**
 * 
 * 
 *TODO 建议改为接口  charles
 * @author 翁增仁
 * wengzr (mailto:wengzr@primeton.com)
 */
/*
 * 修改历史
 * $Log: RoleFunction.java,v $
 * Revision 1.1  2013/06/02 19:53:45  huangqj
 * *** empty log message ***
 *
 * Revision 1.6  2010/12/03 09:46:10  caisy
 * 删除无用代码
 *
 * Revision 1.5  2010/12/01 03:23:14  caisy
 * 配置文件读取方式修改
 *
 * Revision 1.4  2010/11/30 16:12:23  caisy
 * 编码改为UTF-8
 *
 * Revision 1.3  2009/03/30 05:39:38  caisy
 * 代码规范
 *
 * Revision 1.2  2009/01/21 05:24:54  caisy
 * 消除编译警告
 *
 * Revision 1.1  2009/01/05 02:34:57  caisy
 * abframe二期初始版本
 *
 * Revision 1.1  2008/10/07 09:25:49  wengzr
 * *** empty log message ***
 *
 * Revision 1.1  2008/08/13 15:55:59  wengzr
 * 提交CVS
 *
 */
public class RoleFunction extends BaseFunction{
	
	/**
	 * Comment for <code>serialVersionUID</code>
	 */
	private static final long serialVersionUID = 4874433788854521957L;
	private String roleid;

	public String getRoleid() {
		return roleid;
	}

	public void setRoleid(String roleid) {
		this.roleid = roleid;
	}


	

}
