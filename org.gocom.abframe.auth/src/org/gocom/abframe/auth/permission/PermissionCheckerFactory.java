/*******************************************************************************
 * $Header: /cvsroot/MIS10/src/NEWERP/org.gocom.abframe.auth/src/org/gocom/abframe/auth/permission/PermissionCheckerFactory.java,v 1.1 2013/06/02 19:53:48 huangqj Exp $
 * $Revision: 1.1 $
 * $Date: 2013/06/02 19:53:48 $
 *
 *==============================================================================
 *
 * Copyright (c) 2001-2006 Primeton Technologies, Ltd.
 * All rights reserved.
 *
 * Created on 2008-8-14
 *******************************************************************************/

package org.gocom.abframe.auth.permission;

import org.apache.commons.pool.BasePoolableObjectFactory;
import org.apache.commons.pool.ObjectPool;
import org.apache.commons.pool.impl.StackObjectPool;

import com.eos.data.datacontext.IUserObject;
import com.eos.runtime.core.TraceLoggerFactory;
import com.eos.system.logging.Logger;

/**
 *
 * 权限校验者创建工厂类<BR>
 * TODO:对象池未起到优化作用，需要修改
 *
 * @author 翁增仁
 * wengzr (mailto:wengzr@primeton.com)
 */
/*
 * 修改历史
 * $Log: PermissionCheckerFactory.java,v $
 * Revision 1.1  2013/06/02 19:53:48  huangqj
 * *** empty log message ***
 *
 * Revision 1.5  2010/12/07 03:09:46  caisy
 * abframe配置读取方式修改
 *
 * Revision 1.4  2010/12/01 03:23:14  caisy
 * 配置文件读取方式修改
 *
 * Revision 1.3  2010/11/30 16:12:23  caisy
 * 编码改为UTF-8
 *
 * Revision 1.2  2009/03/30 05:39:38  caisy
 * 代码规范
 *
 * Revision 1.1  2009/01/05 02:34:50  caisy
 * abframe二期初始版本
 *
 * Revision 1.1  2008/10/07 09:25:50  wengzr
 * *** empty log message ***
 *
 * Revision 1.5  2008/09/17 12:54:45  wengzr
 * Update:修改在标签和JSP中判断用户是否登录方式
 *
 * Revision 1.4  2008/09/11 13:55:57  wengzr
 * Update:修改登录实现方式和权限校验BUG
 *
 * Revision 1.3  2008/08/31 08:14:02  wengzr
 * Update:重构登录模块
 *
 * Revision 1.2  2008/08/17 08:12:56  wengzr
 * Update:增加LDAP,SSO默认实现
 *
 * Revision 1.1  2008/08/14 15:46:45  wengzr
 * 提交CVS
 *
 */
public class PermissionCheckerFactory {

	private static boolean COMMONS_POOL_ENABLED=true;

	private static final Logger logger = TraceLoggerFactory.getLogger(PermissionCheckerFactory.class);

	private static PermissionCheckerFactory _instance = new PermissionCheckerFactory();

	private ObjectPool _pool;

	private PermissionCheckerFactory() {
		_pool = new StackObjectPool(new Factory());
	}


	public static PermissionChecker create(IUserObject user, boolean checkGuest)throws Exception {

		PermissionChecker permissionChecker = null;

		//这里增加实例池的判断，先出实例池获取PermissionChecker，如果不存在则创建实例
		//否则直接从实例池获取该对象，并初始化init，以提高性能
		permissionChecker =null;

		if (COMMONS_POOL_ENABLED) {
			permissionChecker =(PermissionChecker)_instance._pool.borrowObject();
		}else{
			permissionChecker=new DefaultPermissionChecker();
		}

		permissionChecker.init(user, checkGuest);

		PermissionThreadLocal.setPermissionChecker(permissionChecker);

		return permissionChecker;
	}


	public static void recycle(PermissionChecker permissionChecker)throws Exception {

		if (COMMONS_POOL_ENABLED) {
			if (permissionChecker == null) {
				return;
			}
			logger.debug("Recycling:\t" + _instance._pool.getNumIdle() + "\t"+ _instance._pool.getNumActive());

			_instance._pool.returnObject(permissionChecker);

		} else if (permissionChecker != null) {
			permissionChecker.recycle();
		}
	}

	private class Factory extends BasePoolableObjectFactory {

		public Object makeObject() {
			try {
				return new DefaultPermissionChecker();
			}
			catch (Exception e) {
				logger.error(e);

				return null;
			}
		}

		public void passivateObject(Object obj) {
			PermissionChecker permissionChecker = (PermissionChecker)obj;

			permissionChecker.recycle();
		}

	}


}
