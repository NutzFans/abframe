package com.zhonghe.ame.contractPact;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import cn.hutool.core.util.ArrayUtil;

import com.eos.foundation.data.DataObjectUtil;
import com.eos.foundation.database.DatabaseExt;
import com.eos.system.annotation.Bizlet;

import commonj.sdo.DataObject;

@Bizlet("包装付费合同数据")
public class WrapPayContractInfo {

	@Bizlet("包装付费合同数据")
	public DataObject[] wrap(DataObject[] dataObjects) {
		List<DataObject> warpDatas = new ArrayList<DataObject>();
		for (int i = 0; i < dataObjects.length; i++) {
			String payId = dataObjects[i].getString("id");
			DataObject[] payPlans = this.queryPayPlanByPayId(payId);
			if (ArrayUtil.isNotEmpty(payPlans)) {
				dataObjects[i].setString("isPayPlan", "1");
			} else {
				dataObjects[i].setString("isPayPlan", "0");
			}
			warpDatas.add(dataObjects[i]);
		}
		return ArrayUtil.toArray(warpDatas, DataObject.class);
	}

	private DataObject[] queryPayPlanByPayId(String payId) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("payId", payId);
		Object[] objects = DatabaseExt.queryByNamedSql("default", "com.zhonghe.ame.payContract.payContract.queryPayPlanByPayId", map);
		DataObject[] dataObjects = DataObjectUtil.convertDataObjects(objects, "commonj.sdo.DataObject", true);
		return dataObjects;
	}

}
