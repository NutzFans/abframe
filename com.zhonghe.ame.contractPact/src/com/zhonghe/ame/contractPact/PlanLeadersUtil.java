package com.zhonghe.ame.contractPact;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import cn.hutool.core.util.ArrayUtil;

import com.eos.foundation.data.DataObjectUtil;
import com.eos.foundation.database.DatabaseExt;
import com.eos.system.annotation.Bizlet;

import commonj.sdo.DataObject;

@Bizlet("采购立项获取采购需求单位分管领导")
public class PlanLeadersUtil {

	@Bizlet("采购立项获取采购需求单位分管领导")
	public DataObject[] getLeaders(String orgId, String dicttypeid) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("orgids", orgId);
		Object[] objects = DatabaseExt.queryByNamedSql("default", "com.zhonghe.ame.contractPact.feameAgreement.getPlanLeaders", map);
		DataObject[] dataObjects = DataObjectUtil.convertDataObjects(objects, "commonj.sdo.DataObject", true);
		if (dataObjects.length > 0) {
			List<DataObject> warpDatas = new ArrayList<DataObject>();
			HashMap<String, String> tempMap = new HashMap<String, String>();
			for (int i = 0; i < dataObjects.length; i++) {
				String judge = dataObjects[i].getString("judge");
				if (judge.equals("1")) {
					warpDatas.add(dataObjects[i]);
				} else {
					HashMap<String, Object> param = new HashMap<String, Object>();
					param.put("dicttypeid", dicttypeid);
					param.put("orgid", dataObjects[i].getString("orgcode"));
					Object[] pobjects = DatabaseExt.queryByNamedSql("default", "com.zhonghe.ame.contractPact.feameAgreement.getFuncSpr", param);
					DataObject[] pdataObjects = DataObjectUtil.convertDataObjects(pobjects, "commonj.sdo.DataObject", true);
					if (pdataObjects.length > 0 && !tempMap.containsKey(pdataObjects[0].getString("id"))) {
						warpDatas.add(pdataObjects[0]);
						tempMap.put(pdataObjects[0].getString("id"), pdataObjects[0].getString("id"));
					}
				}
			}
			return ArrayUtil.toArray(warpDatas, DataObject.class);
		} else {
			return null;
		}
	}

}
