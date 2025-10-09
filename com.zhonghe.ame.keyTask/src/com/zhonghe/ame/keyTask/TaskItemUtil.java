package com.zhonghe.ame.keyTask;

import java.util.ArrayList;
import java.util.List;

import cn.hutool.core.util.ArrayUtil;
import cn.hutool.core.util.StrUtil;

import com.eos.system.annotation.Bizlet;

import commonj.sdo.DataObject;

@Bizlet("任务分解计划工具")
public class TaskItemUtil {

	@Bizlet("只筛选出待审核的任务进度情况数据")
	public DataObject[] filterData(DataObject[] itemDatas) throws Exception {
		List<DataObject> filterDatas = new ArrayList<DataObject>();
		for (int i = 0; i < itemDatas.length; i++) {
			DataObject itemData = itemDatas[i];
			if (StrUtil.isNotBlank(itemData.getString("taskStatus"))) {
				if (StrUtil.isBlank(itemData.getString("appStatus"))) {
					filterDatas.add(itemData);
				}
			}
		}
		return ArrayUtil.toArray(filterDatas, DataObject.class);
	}

}
