package com.zhonghe.ame.contractPact;

import static com.eos.system.annotation.ParamType.CONSTANT;

import java.util.HashMap;
import java.util.Map;

import cn.hutool.core.util.ObjUtil;
import cn.hutool.core.util.StrUtil;

import com.eos.foundation.data.DataObjectUtil;
import com.eos.foundation.database.DatabaseExt;
import com.eos.system.annotation.Bizlet;
import com.eos.system.annotation.BizletParam;

import commonj.sdo.DataObject;

@Bizlet("组织机构操作工具类")
public class OrgUtil {

	@Bizlet("获取提供组织对应的二级组织信息")
	public HashMap<String, String> getSecOrg(String orgId) {
		HashMap<String, String> map = new HashMap<String, String>();
		DataObject org = this.queryOrgById(orgId);
		if (ObjUtil.isNotNull(org)) {
			String orgseq = org.getString("ORGSEQ");
			String[] splitToArray = StrUtil.splitToArray(orgseq, ".");
			if (splitToArray.length >= 3) {
				String secOrg = splitToArray[2];
				if (StrUtil.isNotBlank(secOrg)) {
					DataObject data = this.queryOrgById(secOrg);
					if (ObjUtil.isNotNull(data)) {
						map.put("ORGID", data.getString("ORGID"));
						map.put("ORGNAME", data.getString("ORGNAME"));
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

}
