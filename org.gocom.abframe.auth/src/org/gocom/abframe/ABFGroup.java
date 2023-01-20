/*******************************************************************************
 * $Header: /cvsroot/MIS10/src/NEWERP/org.gocom.abframe.auth/src/org/gocom/abframe/ABFGroup.java,v 1.1 2013/06/02 19:53:42 huangqj Exp $
 * $Revision: 1.1 $
 * $Date: 2013/06/02 19:53:42 $
 *
 *==============================================================================
 *
 * Copyright (c) 2001-2010 Primeton Technologies, Ltd.
 * All rights reserved.
 * 
 * Created on 2010-12-4
 *******************************************************************************/

package org.gocom.abframe;

import com.eos.infra.config.Configuration.Group;

/**
 * 
 * 配置文件中的组
 * 
 * @author charles (mailto:caisy@primeton.com)
 */
/*
 * Modify history $Log: ABFGroup.java,v $
 * Modify history Revision 1.1  2013/06/02 19:53:42  huangqj
 * Modify history *** empty log message ***
 * Modify history
 * Modify history Revision 1.2  2010/12/20 07:10:13  caisy
 * Modify history ���ӻ�������
 * Modify history
 * Modify history Revision 1.1  2010/12/07 03:09:46  caisy
 * Modify history abframe配置读取方式修改
 * Modify history
 */
public enum ABFGroup {

	/** 登录相关配置 * */
	AUTH_ABFRAME_LOGIN(ABFModule.AUTH_ABFRAME, "login-config"),
	/** 缓存相关配置* */
	AUTH_ABFRAME_CACHE(ABFModule.AUTH_ABFRAME, "cache-config"),
	/** 权限相关配置 列在缓存组中的cacheloader会被全部加载 * */
	AUTH_ABFRAME_PERMISSION(ABFModule.AUTH_ABFRAME, "permission-config"),
	/** 业务日志相关配置* */
	AUTH_ABFRAME_BUSSLOG(ABFModule.AUTH_ABFRAME, "business-log"),
	/** LDAP相关配置 * */
	AUTH_ABFRAME_LDAP(ABFModule.AUTH_ABFRAME, "ldap-config") ,
	/** SKIN相关配置 * */
	AUTH_ABFRAME_SKIN(ABFModule.AUTH_ABFRAME, "skin-config") ;
	
	private final ABFModule module;

	private String name;

	ABFGroup(ABFModule module, String name) {
		this.module = module;
		this.name = name;
	}

	public ABFModule getModule() {
		return module;
	}

	public String getName() {
		return name;
	}

	/**
	 * 获得配置组信息
	 * 
	 * @return 配置组信息 
	 */
	public Group getGroupConfig() {
		return module.getModuleConfig().getGroup(name);
	}

	@Override
	public String toString() {
		return module.toString() + ":" + name;
	}
}
