package com.zhonghe.ame.annualPlan;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cn.hutool.core.collection.ListUtil;
import cn.hutool.core.util.ArrayUtil;
import cn.hutool.core.util.IdUtil;

import com.eos.foundation.data.DataObjectUtil;
import com.eos.foundation.database.DatabaseExt;
import com.eos.system.annotation.Bizlet;
import com.eos.system.annotation.BizletParam;
import com.sun.jmx.snmp.Timestamp;

import commonj.sdo.DataObject;

@Bizlet("收款/开票计划同步")
public class AnnualPlanSyncUtil {

	@Bizlet("生成需要同步到年度收入预算的数据")
	public DataObject[] generateSyncData(DataObject[] syncData) {
		List<DataObject> dataList = new ArrayList<DataObject>();
		DataObject[] annualPlanYears = this.queryAnnualPlanYear();
		if (annualPlanYears.length > 0) {
			Map<String, String> map = new HashMap<String, String>();
			for (int i = 0; i < annualPlanYears.length; i++) {
				DataObject dataObject = annualPlanYears[i];
				String id = dataObject.getString("id");
				String sourceId = dataObject.getString("sourceId");
				map.put(sourceId, id);
			}
			for (int i = 0; i < syncData.length; i++) {
				DataObject dataObject = syncData[i];
				String sourceId = dataObject.getString("id");
				if (map.containsKey(sourceId)) {
					dataObject.setString("id", map.get(sourceId));
				} else {
					dataObject.setString("id", IdUtil.fastSimpleUUID());
				}
				dataObject.setDate("createTime", new Date());
				dataObject.setString("sourceId", sourceId);
				dataObject.setString("dataSourceType", "1");
				dataList.add(dataObject);
			}
		} else {
			for (int i = 0; i < syncData.length; i++) {
				DataObject dataObject = syncData[i];
				String sourceId = dataObject.getString("id");
				dataObject.setDate("createTime", new Date());
				dataObject.setString("id", IdUtil.fastSimpleUUID());
				dataObject.setString("sourceId", sourceId);
				dataObject.setString("dataSourceType", "1");
				dataList.add(dataObject);
			}
		}
		return DataObjectUtil.convertDataObjects(ArrayUtil.toArray(dataList, DataObject.class), "com.zhonghe.ame.annualPlan.annualPlan.AnnualPlanYear", false);
	}

	public DataObject[] queryAnnualPlanYear() {
		HashMap<String, Object> map = new HashMap<String, Object>();
		Object[] objects = DatabaseExt.queryByNamedSql("default", "com.zhonghe.ame.annualPlan.annualPlan.queryAnnualPlanYear", map);
		DataObject[] dataObjects = DataObjectUtil.convertDataObjects(objects, "commonj.sdo.DataObject", true);
		return dataObjects;
	}

}
