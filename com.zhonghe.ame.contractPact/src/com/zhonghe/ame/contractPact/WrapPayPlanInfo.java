package com.zhonghe.ame.contractPact;

import static com.eos.system.annotation.ParamType.CONSTANT;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import cn.hutool.core.util.ArrayUtil;
import cn.hutool.core.util.NumberUtil;
import cn.hutool.core.util.StrUtil;

import com.eos.foundation.data.DataObjectUtil;
import com.eos.foundation.database.DatabaseExt;
import com.eos.system.annotation.Bizlet;
import com.eos.system.annotation.BizletParam;

import commonj.sdo.DataObject;

@Bizlet("包装付款计划数据")
public class WrapPayPlanInfo {

	@Bizlet("包装付款计划数据")
	public DataObject[] wrap(DataObject[] dataObjects) {
		List<DataObject> warpDatas = new ArrayList<DataObject>();
		for (int i = 0; i < dataObjects.length; i++) {
			String contractNo = dataObjects[i].getString("contractNo");
			if (StrUtil.isNotBlank(contractNo)) {
				DataObject[] invoices = this.queryPayMentByNo(contractNo);
				if (ArrayUtil.isNotEmpty(invoices)) {
					dataObjects[i].setString("isInvoice", "1");
				} else {
					dataObjects[i].setString("isInvoice", "0");
				}
			} else {
				dataObjects[i].setString("isInvoice", "0");
			}
			warpDatas.add(dataObjects[i]);
		}
		return ArrayUtil.toArray(warpDatas, DataObject.class);
	}

	private DataObject[] queryPayMentByNo(String contractNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("contractNo", contractNo);
		Object[] objects = DatabaseExt.queryByNamedSql("default", "com.zhonghe.ame.annualPlan.annualPlan.queryPayMentByNo", map);
		DataObject[] dataObjects = DataObjectUtil.convertDataObjects(objects, "commonj.sdo.DataObject", true);
		return dataObjects;
	}

}
