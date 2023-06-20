package com.zhonghe.ame.contractPact;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import cn.hutool.core.util.ArrayUtil;
import cn.hutool.core.util.ObjUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.db.Entity;
import cn.hutool.db.Session;

import com.eos.common.connection.DataSourceHelper;
import com.eos.foundation.data.DataObjectUtil;
import com.eos.foundation.database.DatabaseExt;
import com.eos.system.annotation.Bizlet;

import commonj.sdo.DataObject;

@Bizlet("包装开票管理excel导出")
public class WrapInvoiceExcelInfo {

	@Bizlet("包装开票管理excel导出 - 增加二级组织内容")
	public DataObject[] wrap(DataObject[] dataObjects) {
		List<DataObject> warpDatas = new ArrayList<DataObject>();
		for (int i = 0; i < dataObjects.length; i++) {
			String implementOrg = dataObjects[i].getString("implementOrg");
			HashMap<String, String> secOrg = this.getSecOrg(implementOrg);
			dataObjects[i].setString("secOrgName", secOrg.get("ORGNAME"));
			warpDatas.add(dataObjects[i]);
		}
		return ArrayUtil.toArray(warpDatas, DataObject.class);
	}

	// 获取提供组织对应的二级组织信息
	private HashMap<String, String> getSecOrg(String orgId) {
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
