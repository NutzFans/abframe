package com.zhonghe.ame.purchase;

import java.util.List;

import com.eos.foundation.data.DataObjectUtil;
import com.eos.system.annotation.Bizlet;
import com.eos.workflow.data.WFWorkItem;

import commonj.sdo.DataObject;

@Bizlet("工作项处理工具类")
public class WorkItemUtil {

	@Bizlet("工作项处理")
	public DataObject getWorkItem(List<WFWorkItem> list) {
		DataObject dataObject = DataObjectUtil.createDataObject("com.eos.workflow.data.WFWorkItem");
		WFWorkItem wfWorkItem = list.get(0);
		dataObject.set("workItemName", wfWorkItem.getWorkItemName());
		dataObject.set("workItemID", wfWorkItem.getWorkItemID());
		dataObject.set("processInstID", wfWorkItem.getProcessInstID());
		
		return dataObject;
	}

}
