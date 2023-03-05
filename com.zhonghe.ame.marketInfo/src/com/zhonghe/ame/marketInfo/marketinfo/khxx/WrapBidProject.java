package com.zhonghe.ame.marketInfo.marketinfo.khxx;

import static com.eos.system.annotation.ParamType.CONSTANT;

import java.util.ArrayList;
import java.util.List;

import cn.hutool.core.util.ArrayUtil;
import cn.hutool.core.util.StrUtil;

import com.eos.foundation.data.DataObjectUtil;
import com.eos.system.annotation.Bizlet;
import com.eos.system.annotation.BizletParam;

import commonj.sdo.DataObject;

@Bizlet("包装竞争对手共同投标信息")
public class WrapBidProject {

	@Bizlet("包装竞争对手共同投标信息")
	public DataObject[] wrap(DataObject[] dataObjects) {
		List<DataObject> warpDatas = new ArrayList<DataObject>();
		for (int i = 0; i < dataObjects.length; i++) {
			DataObject dataObject = DataObjectUtil.createDataObject("com.zhonghe.ame.marketInfo.bid.ZhCompetBidProjectEntity");
			DataObject dataObjectTwo = DataObjectUtil.createDataObject("com.zhonghe.ame.marketInfo.bid.ZhCompetBidProjectEntity");
			if (i > 0) {
				String projectName = dataObjects[i].getString("projectName");
				String prvProjectName = dataObjects[i - 1].getString("projectName");
				if (StrUtil.equals(projectName, prvProjectName)) {
					dataObject.setString("projectName", "");
					dataObject.setDate("recordDate", null);
					dataObject.setString("custname", "");
					dataObject.setInt("bidId", 0);
					dataObject.setInt("competId", dataObjects[i].getInt("competId"));
					dataObject.setString("competName", dataObjects[i].getString("competName"));
					dataObject.setString("competContractPrice", dataObjects[i].getString("competContractPrice"));
					dataObject.setString("bidResult", "");
					dataObject.setString("remark", "");
					warpDatas.add(dataObject);
				} else {
					dataObject.setString("projectName", dataObjects[i].getString("projectName"));
					dataObject.setDate("recordDate", dataObjects[i].getDate("recordDate"));
					dataObject.setString("custname", dataObjects[i].getString("custname"));
					dataObject.setInt("bidId", dataObjects[i].getInt("bidId"));
					dataObject.setInt("competId", 0);
					dataObject.setString("competName", dataObjects[i].getString("bidUnitsName"));
					dataObject.setString("competContractPrice", dataObjects[i].getString("contractPrice"));
					dataObject.setString("bidResult", dataObjects[i].getString("bidResult"));
					dataObject.setString("remark", dataObjects[i].getString("remark"));
					warpDatas.add(dataObject);
					dataObjectTwo.setString("projectName", "");
					dataObjectTwo.setDate("recordDate", null);
					dataObjectTwo.setString("custname", "");
					dataObjectTwo.setInt("bidId", 0);
					dataObjectTwo.setInt("competId", dataObjects[i].getInt("competId"));
					dataObjectTwo.setString("competName", dataObjects[i].getString("competName"));
					dataObjectTwo.setString("competContractPrice", dataObjects[i].getString("competContractPrice"));
					dataObjectTwo.setString("bidResult", "");
					dataObjectTwo.setString("remark", "");
					warpDatas.add(dataObjectTwo);
				}
			} else {
				dataObject.setString("projectName", dataObjects[i].getString("projectName"));
				dataObject.setDate("recordDate", dataObjects[i].getDate("recordDate"));
				dataObject.setString("custname", dataObjects[i].getString("custname"));
				dataObject.setInt("bidId", dataObjects[i].getInt("bidId"));
				dataObject.setInt("competId", 0);
				dataObject.setString("competName", dataObjects[i].getString("bidUnitsName"));
				dataObject.setString("competContractPrice", dataObjects[i].getString("contractPrice"));
				dataObject.setString("bidResult", dataObjects[i].getString("bidResult"));
				dataObject.setString("remark", dataObjects[i].getString("remark"));
				warpDatas.add(dataObject);
				dataObjectTwo.setString("projectName", "");
				dataObjectTwo.setDate("recordDate", null);
				dataObjectTwo.setString("custname", "");
				dataObjectTwo.setInt("bidId", 0);
				dataObjectTwo.setInt("competId", dataObjects[i].getInt("competId"));
				dataObjectTwo.setString("competName", dataObjects[i].getString("competName"));
				dataObjectTwo.setString("competContractPrice", dataObjects[i].getString("competContractPrice"));
				dataObjectTwo.setString("bidResult", "");
				dataObjectTwo.setString("remark", "");
				warpDatas.add(dataObjectTwo);
			}
		}
		return ArrayUtil.toArray(warpDatas, DataObject.class);
	}

	@Bizlet("数组转化为字符串")
	public String getArrayToString(DataObject[] dataObjects) {
		List<Integer> list = new ArrayList<Integer>();
		for (int i = 0; i < dataObjects.length; i++) {
			list.add(dataObjects[i].getInt("bidId"));
		}
		return StrUtil.join(",", list);
	}

}
