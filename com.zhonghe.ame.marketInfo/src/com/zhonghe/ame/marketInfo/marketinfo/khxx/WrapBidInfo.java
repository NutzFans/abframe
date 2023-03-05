package com.zhonghe.ame.marketInfo.marketinfo.khxx;

import static com.eos.system.annotation.ParamType.CONSTANT;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import cn.hutool.core.util.ArrayUtil;

import com.eos.foundation.data.DataObjectUtil;
import com.eos.foundation.database.DatabaseExt;
import com.eos.system.annotation.Bizlet;
import com.eos.system.annotation.BizletParam;

import commonj.sdo.DataObject;

@Bizlet("包装市场经营信息数据")
public class WrapBidInfo {
	
	@Bizlet("包装市场经营信息数据")
	public DataObject[] wrap(DataObject[] dataObjects){
		List<DataObject> warpDatas = new ArrayList<DataObject>();
		for (int i = 0; i < dataObjects.length; i++) {
			int bidId = dataObjects[i].getInt("id");
			DataObject[] compets = this.queryCompetByBidId(bidId);
			if (ArrayUtil.isNotEmpty(compets)) {
				dataObjects[i].setString("isCompet", "1");
			}else{
				dataObjects[i].setString("isCompet", "0");
			}
			warpDatas.add(dataObjects[i]);
		}
		return ArrayUtil.toArray(warpDatas, DataObject.class);
	}
	
	private DataObject[] queryCompetByBidId(int bidId) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("bidId", bidId);
		Object[] objects = DatabaseExt.queryByNamedSql("default", "com.zhonghe.ame.payment.payMent.queryCompetByBidId", map);
		DataObject[] dataObjects = DataObjectUtil.convertDataObjects(objects, "commonj.sdo.DataObject", true);
		return dataObjects;
	}
	
}
