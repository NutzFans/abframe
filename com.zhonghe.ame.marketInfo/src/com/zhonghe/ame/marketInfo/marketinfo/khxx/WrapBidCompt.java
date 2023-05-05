package com.zhonghe.ame.marketInfo.marketinfo.khxx;

import static com.eos.system.annotation.ParamType.CONSTANT;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import cn.hutool.core.collection.ListUtil;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.ArrayUtil;
import cn.hutool.core.util.ObjUtil;

import com.eos.foundation.data.DataObjectUtil;
import com.eos.foundation.database.DatabaseExt;
import com.eos.system.annotation.Bizlet;
import com.eos.system.annotation.BizletParam;

import commonj.sdo.DataObject;

@Bizlet("对导出市场经营信息数据的包装")
public class WrapBidCompt {

	@Bizlet("包装要导出市场经营的数据")
	public DataObject[] warp(DataObject[] dataObjects) {
		List<DataObject> warpExcelDatas = new ArrayList<DataObject>();
		for (int i = 0; i < dataObjects.length; i++) {
			String recordDate = DateUtil.format(dataObjects[i].getDate("recordDate"), "yyyy-MM");
			String bidDate = DateUtil.format(dataObjects[i].getDate("bidDate"), "yyyy-MM-dd");
			dataObjects[i].setString("recordDate", recordDate);
			dataObjects[i].setString("bidDate", bidDate);
			warpExcelDatas.add(dataObjects[i]);
			int bidId = dataObjects[i].getInt("id");
			DataObject[] compets = this.queryCompetByBidId(bidId);
			if (ArrayUtil.isNotEmpty(compets)) {
				warpExcelDatas.addAll(Arrays.asList(compets));
			}
		}
		return ArrayUtil.toArray(warpExcelDatas, DataObject.class);
	}

	private DataObject[] queryCompetByBidId(int bidId) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("bidId", bidId);
		Object[] objects = DatabaseExt.queryByNamedSql("default", "com.zhonghe.ame.payment.payMent.queryCompetByBidId", map);
		DataObject[] dataObjects = DataObjectUtil.convertDataObjects(objects, "commonj.sdo.DataObject", true);
		return dataObjects;
	}

}
