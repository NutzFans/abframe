/*******************************************************************************
 * $Header: /cvsroot/MIS10/src/NEWERP/org.gocom.abframe.auth/src/org/gocom/abframe/ABFContribution.java,v 1.1 2013/06/02 19:53:42 huangqj Exp $
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

import com.eos.common.config.ConfigurationFactory;
import com.eos.infra.config.Configuration;

/**
 * 
 * 构件包配置
 *
 * @author charles (mailto:caisy@primeton.com)
 */
/*
 * Modify history
 * $Log: ABFContribution.java,v $
 * Revision 1.1  2013/06/02 19:53:42  huangqj
 * *** empty log message ***
 *
 * Revision 1.1  2010/12/07 03:09:46  caisy
 * abframe配置读取方式修改
 *
 */
public enum ABFContribution {
	/** 认证 构件包配置  **/
	Auth("org.gocom.abframe.auth"),
	/** 机构管理 构件包配置  **/
	Org("org.gocom.abframe.org"), 
	/** 权限管理 构件包配置  **/
	Rights("org.gocom.abframe.rights"), 
	/** 工具 构件包配置  **/
	Tools("org.gocom.abframe.tools");
	private String name;

	ABFContribution(String name) {
		this.name = name;
	}

	public String getName() {
		return name;
	}

	/**
	 * 返回构件包配置信息
	 * 
	 * @return 配置信息
	 */
	public Configuration getConfig() {
		return ConfigurationFactory.getContributionConfiguration(name);
	}

	@Override
	public String toString() {
		return name;
	}
}