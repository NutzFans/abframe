package com.zhonghe.ame.contractPact;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import cn.hutool.core.util.ArrayUtil;

import com.eos.foundation.data.DataObjectUtil;
import com.eos.foundation.database.DatabaseExt;
import com.eos.system.annotation.Bizlet;

import commonj.sdo.DataObject;

@Bizlet("包装收费合同数据")
public class WrapChargeContractInfo {

	@Bizlet("包装收费合同数据")
	public DataObject[] wrap(DataObject[] dataObjects) {
		List<DataObject> warpDatas = new ArrayList<DataObject>();
		for (int i = 0; i < dataObjects.length; i++) {
			String chargeId = dataObjects[i].getString("id");
			DataObject[] chargePlans = this.queryChargePlanByChargeId(chargeId);
			if (ArrayUtil.isNotEmpty(chargePlans)) {
				dataObjects[i].setString("isChargePlan", "1");
			} else {
				dataObjects[i].setString("isChargePlan", "0");
			}
			warpDatas.add(dataObjects[i]);
		}
		return ArrayUtil.toArray(warpDatas, DataObject.class);
	}

	private DataObject[] queryChargePlanByChargeId(String chargeId) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("chargeId", chargeId);
		Object[] objects = DatabaseExt.queryByNamedSql("default", "com.zhonghe.ame.payContract.payContract.queryChargePlanByChargeId", map);
		DataObject[] dataObjects = DataObjectUtil.convertDataObjects(objects, "commonj.sdo.DataObject", true);
		return dataObjects;
	}

}
