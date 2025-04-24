package com.zhonghe.ame.contractPact;

import java.util.HashMap;

import cn.hutool.core.text.CharSequenceUtil;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;

import com.eos.foundation.data.DataObjectUtil;
import com.eos.foundation.database.DatabaseExt;
import com.eos.system.annotation.Bizlet;

import commonj.sdo.DataObject;

@Bizlet("组织机构操作工具类")
public class OrgUtil {

	@Bizlet("获取提供组织对应的二级组织信息")
	public HashMap<String, String> getSecOrg(String orgId) {
		HashMap<String, String> map = new HashMap<String, String>();
		DataObject org = this.queryOrgById(orgId);
		if (ObjectUtil.isNotNull(org)) {
			String orgseq = org.getString("ORGSEQ");
			if (CharSequenceUtil.startWith(orgseq, ".1111.")) {
				DataObject data = this.queryOrgById("1111");
				if (ObjectUtil.isNotNull(data)) {
					map.put("ORGID", data.getString("ORGID"));
					map.put("ORGNAME", data.getString("ORGNAME"));
					map.put("ORGTYPE", "10"); // 中核上海供应链
				}
			} else {
				String[] splitToArray = CharSequenceUtil.splitToArray(orgseq, ".");
				if (splitToArray.length >= 3) {
					String secOrg = splitToArray[2];
					if (CharSequenceUtil.isNotBlank(secOrg)) {
						DataObject data = this.queryOrgById(secOrg);
						if (ObjectUtil.isNotNull(data)) {
							map.put("ORGID", data.getString("ORGID"));
							map.put("ORGNAME", data.getString("ORGNAME"));
							map.put("ORGTYPE", this.getOrgType(secOrg));
						}
					}
				}
			}
		}
		return map;
	}

	private DataObject queryOneEntity(String sqlName, HashMap<String, Object> parameter) {
		Object[] objects = DatabaseExt.queryByNamedSql("default", sqlName, parameter);
		DataObject[] dataObjects = DataObjectUtil.convertDataObjects(objects, "commonj.sdo.DataObject", true);
		if (dataObjects != null && dataObjects.length > 0) {
			return dataObjects[0];
		}
		return null;
	}

	private DataObject queryOrgById(String orgId) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("orgId", orgId);
		DataObject org = queryOneEntity("com.zhonghe.ame.contractPact.chargeContract.queryOrgById", map);
		return org;
	}

	private DataObject queryDictById(String dictId) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("dictId", dictId);
		DataObject dict = queryOneEntity("com.zhonghe.ame.contractPact.chargeContract.queryDictById", map);
		return dict;
	}

	private String getOrgType(String secOrgId) {
		DataObject dict = this.queryDictById(secOrgId);
		if (ObjectUtil.isNotNull(dict)) {
			String dictTypeId = dict.getString("DICTTYPEID");
			if (StrUtil.equals("ORG_CLASS_FUNCTIONAL_DEP", dictTypeId)) {
				return "1"; // 职能部门
			}
			if (StrUtil.equals("ORG_CLASS_SERVICE_CENTER", dictTypeId)) {
				return "2"; // 业务中心
			}
			if (StrUtil.equals("ORG_CLASS_SUPERVISION_CENTER", dictTypeId)) {
				return "3"; // 设备监理中心
			}
			if (StrUtil.equals("ORG_CLASS_DIVISION_DEP", dictTypeId)) {
				return "4"; // 事业部
			}
			if (StrUtil.equals("ORG_CLASS_BRANCH_OFFICE", dictTypeId)) {
				return "5"; // 分公司
			}
			return null;
		}
		return null;
	}

}
