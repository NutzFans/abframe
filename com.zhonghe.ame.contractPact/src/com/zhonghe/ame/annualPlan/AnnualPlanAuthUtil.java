package com.zhonghe.ame.annualPlan;

import java.util.HashMap;
import java.util.List;

import cn.hutool.core.text.CharSequenceUtil;
import cn.hutool.core.util.StrUtil;

import com.eos.foundation.data.DataObjectUtil;
import com.eos.foundation.database.DatabaseExt;
import com.eos.system.annotation.Bizlet;
import commonj.sdo.DataObject;

@Bizlet("收款/开票计划 数据权限")
public class AnnualPlanAuthUtil {

	@Bizlet("是否有全部数据的查看权限")
	public boolean isAllDataAuth(String userId, String userOrgId, String authCode) {
		DataObject[] authDataObjects = this.queryAuthConfigByCodeAndLevel(authCode, 1);
		DataObject authConfig = authDataObjects[0];
		String roleStrs = authConfig.getString("ROLE");
		String orgStrs = authConfig.getString("ORG");
		String userStrs = authConfig.getString("USERID");
		DataObject[] roleDataObjects = this.queryRoleByUserId(userId);
		if (this.includeRole(roleDataObjects, roleStrs)) {
			return true;
		}
		if (this.includeOrg(userOrgId, orgStrs)) {
			return true;
		}
		if (this.includeUser(userId, userStrs)) {
			return true;
		}
		return false;
	}
	
	@Bizlet("是否有部分数据的查看权限")
	public boolean isPartDataAuth(String userId, String userOrgId, String authCode){
		DataObject[] authDataObjects = this.queryAuthConfigByCodeAndLevel(authCode, 2);
		DataObject authConfig = authDataObjects[0];
		String roleStrs = authConfig.getString("ROLE");
		String orgStrs = authConfig.getString("ORG");
		String userStrs = authConfig.getString("USERID");
		DataObject[] roleDataObjects = this.queryRoleByUserId(userId);
		if (this.includeRole(roleDataObjects, roleStrs)) {
			return true;
		}
		if (this.includeOrg(userOrgId, orgStrs)) {
			return true;
		}
		if (this.includeUser(userId, userStrs)) {
			return true;
		}
		return false;		
	}

	private DataObject[] queryAuthConfigByCodeAndLevel(String authCode, int orgLevel) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("code", authCode);
		map.put("orglevel", orgLevel);
		Object[] objects = DatabaseExt.queryByNamedSql("default", "com.zhonghe.ame.annualPlan.annualPlan.queryAuthConfigByCodeAndLevel", map);
		DataObject[] dataObjects = DataObjectUtil.convertDataObjects(objects, "commonj.sdo.DataObject", true);
		return dataObjects;
	}

	private DataObject[] queryRoleByUserId(String userId) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		Object[] objects = DatabaseExt.queryByNamedSql("default", "com.zhonghe.ame.annualPlan.annualPlan.queryRoleByUserId", map);
		DataObject[] dataObjects = DataObjectUtil.convertDataObjects(objects, "commonj.sdo.DataObject", true);
		return dataObjects;
	}

	private boolean includeRole(DataObject[] roleDataObjects, String roleStrs) {
		List<String> roleList = CharSequenceUtil.split(roleStrs, ',');
		for (int i = 0; i < roleDataObjects.length; i++) {
			String role = roleDataObjects[i].getString("ROLEID");
			if (roleList.contains(role)) {
				return true;
			}
		}
		return false;
	}

	private boolean includeOrg(String userOrgId, String orgStrs) {
		if (CharSequenceUtil.isNotBlank(orgStrs)) {
			List<String> orgList = CharSequenceUtil.split(orgStrs, ',');
			return orgList.contains(userOrgId);
		} else {
			return false;
		}
	}

	private boolean includeUser(String userId, String userStrs) {
		if (CharSequenceUtil.isNotBlank(userStrs)) {
			List<String> userList = CharSequenceUtil.split(userStrs, ',');
			return userList.contains(userId);
		} else {
			return false;
		}
	}

}
