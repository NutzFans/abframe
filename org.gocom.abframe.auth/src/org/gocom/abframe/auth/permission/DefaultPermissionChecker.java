/*******************************************************************************
 * $Header: /cvsroot/MIS10/src/NEWERP/org.gocom.abframe.auth/src/org/gocom/abframe/auth/permission/DefaultPermissionChecker.java,v 1.1 2013/06/02 19:53:48 huangqj Exp $
 * $Revision: 1.1 $
 * $Date: 2013/06/02 19:53:48 $
 *
 *==============================================================================
 *
 * Copyright (c) 2001-2006 Primeton Technologies, Ltd.
 * All rights reserved.
 * 
 * Created on 2008-8-12
 *******************************************************************************/


package org.gocom.abframe.auth.permission;

import java.util.Iterator;

import org.gocom.abframe.auth.cache.PermissionCacheManager;
import org.gocom.abframe.auth.permission.model.BaseFunction;
import org.gocom.abframe.auth.permission.model.FunctionModel;
import org.gocom.abframe.auth.permission.model.OperatorFunction;
import org.gocom.abframe.auth.permission.model.RoleFunction;
import org.gocom.abframe.auth.permission.model.RoleModel;

/**
 * 
 * 默认权限校验实现类<BR>
 *
 * @author 翁增仁
 * wengzr (mailto:wengzr@primeton.com)
 */
/*
 * 修改历史
 * $Log: DefaultPermissionChecker.java,v $
 * Revision 1.1  2013/06/02 19:53:48  huangqj
 * *** empty log message ***
 *
 * Revision 1.8  2011/03/28 06:35:17  caisy
 * �ر�Ȩ��У���жϴ���δ�������ܵ���Ȩģʽ
 *
 * Revision 1.7  2011/03/28 06:19:07  caisy
 * 特别开通设置
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
 * Revision 1.3  2009/03/30 05:39:38  caisy
 * 代码规范
 *
 * Revision 1.2  2009/01/21 05:24:54  caisy
 * 消除编译警告
 *
 * Revision 1.1  2009/01/05 02:34:50  caisy
 * abframe二期初始版本
 *
 * Revision 1.1  2008/10/07 09:25:50  wengzr
 * *** empty log message ***
 *
 * Revision 1.7  2008/09/25 16:35:51  wengzr
 * Update:重构缓存模块,将CacheLoader以及CacheManager移入cache包
 * 并修改缓存模型删除模型中的名称XXXname字段
 *
 * Revision 1.6  2008/09/07 07:40:10  wengzr
 * Update:修改权限校验接口
 *
 * Revision 1.5  2008/08/31 11:27:56  wengzr
 * Update:修改获取操作员所有权限过滤重复角色ID
 *
 * Revision 1.4  2008/08/18 14:19:49  wengzr
 * 提交CVS
 *
 * Revision 1.3  2008/08/17 08:12:56  wengzr
 * Update:增加LDAP,SSO默认实现
 *
 * Revision 1.2  2008/08/14 15:46:45  wengzr
 * 提交CVS
 *
 * Revision 1.1  2008/08/13 15:55:59  wengzr
 * 提交CVS
 *
 */
public class DefaultPermissionChecker extends BasePermissionChecker{

	/**
	 * Comment for <code>serialVersionUID</code>
	 */
	private static final long serialVersionUID = 4544582373536964707L;


	public DefaultPermissionChecker(){
		
	}

	/**
	 * 检查角色的资源权限,由于无法获知该资源是属于哪个功能入口，因此搜索该角色拥有的所有资源
	 * 
	 * @param role 角色模型
	 * @param action 资源路径
	 * @return 有权限返回true,否则返回false
	 */
	private boolean checkResourcePermission(RoleModel role,String action){
		Iterator<FunctionModel> functions=role.getFunctions().values().iterator();
		while(functions.hasNext()){
			FunctionModel functionModel=functions.next();
			if(functionModel.getResources().containsKey(action)){
				return true;
			}
		}
		return false;
	}
	
	/**
	 * 检查对应角色的功能权限
	 * @param role 角色对象
	 * @param action 资源路径
	 * @return 有权限返回true,否则返回false
	 */
	private boolean checkFunctionPermission(RoleModel role,String action){
		FunctionModel functionModel=role.getFunctions().get(action);
		if(functionModel!=null){
			BaseFunction function=functionModel.getFunction();
			if(function instanceof OperatorFunction){
				return AUTH_TYPE_ON.equals(((OperatorFunction)function).getAuthtype())?true:false;
			}
			else if(function instanceof RoleFunction){
				return true;
			}
		}
		return false;
	}
	
	
	public int checkAdditionalPermission(String operatorid,String action,boolean isResource) {
		
		RoleModel roleModel=PermissionCacheManager.getPermissionByOperator(operatorid);
		if(roleModel!=null){
			//当前是资源检查
			if(isResource){
				//只支持功能的特别限定
				return AUTH_TYPE_RESULT_NONE;				
			}else{
			    FunctionModel func = (FunctionModel) roleModel.getFunctions().get(action);
				if(func!=null){
					boolean auth = "y".equalsIgnoreCase(((OperatorFunction)func.getFunction()).getAuthtype());
					return auth?AUTH_TYPE_RESULT_ON:AUTH_TYPE_RESULT_OFF;
				}
				else {
					return AUTH_TYPE_RESULT_NONE;
				}				
			}
		}
		return AUTH_TYPE_RESULT_NONE;
	}

	
	public boolean checkRolePermission(String roleid, String action,boolean isResource) {
		RoleModel roleModel=PermissionCacheManager.getPermissionByRole(roleid);
		if(roleModel!=null){
			//当前是资源检查
			if(isResource){
				return checkResourcePermission(roleModel, action);
				
			}else{
				return checkFunctionPermission(roleModel, action);
			}
			
		}
		return false;
	}


}
