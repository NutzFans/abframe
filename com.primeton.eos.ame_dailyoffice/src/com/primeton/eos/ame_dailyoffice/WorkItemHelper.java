/**
 * 
 */
package com.primeton.eos.ame_dailyoffice;

import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.commons.collections.MapUtils;
import org.apache.commons.lang.ArrayUtils;
import org.gocom.bps.web.bizform.WorkflowHelper;

import com.eos.das.entity.criteria.CriteriaType;
import com.eos.foundation.database.DatabaseUtil;
import com.eos.system.annotation.Bizlet;
import com.eos.workflow.data.WFWorkItem;
import com.eos.workflow.omservice.WIParticipantInfo;
import com.primeton.workflow.api.WFServiceException;
import com.primeton.workflow.model.consts.WorkItemState;
import commonj.sdo.DataObject;
import commonj.sdo.helper.DataFactory;

/**
 * @author shenyuanyang
 * @date 2017-09-28 15:47:42
 *
 */
@Bizlet("")
public class WorkItemHelper extends WorkFlowBase{
	/**
	 * 根据父流程Id查询工作项
	 * @param rootProcInstId
	 * @param states
	 * @param isQueryHistory
	 * @return
	 * @throws ParseException
	 */
	@Bizlet
	public static  DataObject [] queryWorkItemByRootProcId(Long rootProcInstId,String states,Boolean isQueryHistory) throws ParseException{
		Map<String,Object> param = new HashMap<String,Object> ();
		param.put("rootProcInstID", rootProcInstId);
		param.put("currentState", states);
		DataObject [] workItems = queryWorkItemByParam(param, isQueryHistory);
		return workItems;
	}

	/**
	 *根据参数查询工作项
	 * @param param
	 * @param isQueryHistory
	 * @return
	 * @throws ParseException
	 */
	@Bizlet
	public static  DataObject [] queryWorkItemByParam(Map<String,Object> param,Boolean isQueryHistory) throws ParseException{
		DataObject criteria = DataFactory.INSTANCE.create("com.primeton.das.criteria","criteriaType");
		if(MapUtils.isNotEmpty(param)){
			criteria.set("_entity", "org.gocom.bps.web.workflow.workflow.WFWorkItem");
			criteria.set("_orderby[1]/_property","startTime");
			criteria.set("_orderby[1]/_sort","asc");
			Set<String> keys = param.keySet();
			int i =1;
			for(String key:keys){
				if("currentState".equals(key)){
					criteria.set("_expr["+i+"]/currentState",param.get(key));
					criteria.set("_expr["+i+"]/_op","in");
				}else if("activityDefID".equals(key)){
					criteria.set("_expr["+i+"]/activityDefID",param.get(key));
					criteria.set("_expr["+i+"]/_op","in");
				}else{
					criteria.set("_expr["+i+"]/"+key, param.get(key));
				}
				i++;
			}
		}
		DataObject [] workItems =  DatabaseUtil.queryEntitiesByCriteriaEntity("default", criteria);
		if(ArrayUtils.isEmpty(workItems)  && isQueryHistory){
			criteria.set("_entity", "com.primeton.bps.web.bizform.components.back.backData.WfHWorkitem");
			DataObject [] workItemHistrory  =  DatabaseUtil.queryEntitiesByCriteriaEntity("default", criteria);
			workItems = (DataObject[]) ArrayUtils.addAll(workItems, workItemHistrory);
		}
		return workItems;
	}
	
	
	@Bizlet
	public static  DataObject [] queryWorkItemByCriteria(CriteriaType criteria) throws ParseException{
		criteria.set_entity("org.gocom.bps.web.workflow.workflow.WFWorkItem");
		DataObject [] workItems =  DatabaseUtil.queryEntitiesByCriteriaEntity("default", criteria);
		return workItems;
	}
	
	
	/**
	 * 结束工作项
	 * @param workItemId
	 * @param type 0:完成，1：终止
	 * @return
	 * @throws ParseException
	 */
	@Bizlet
	public static  String finishWorkItem(Long workItemId,Integer type) throws Exception{
		String retState = null;
		if(null != workItemId && workItemId>0){
			WFWorkItem workItem =  workItemManager.queryWorkItemDetail(workItemId);
			int state = workItem.getCurrentState();
			retState = state+"";
			//工作项处于运行或待领取
			if(WorkItemState.RUNNING == state || WorkItemState.WAITING_RECEIVE == state ){
				//完成工作项
				if(null == type || 0 == type){
					WorkflowHelper.finishWorkItem(workItemId);
				//终止工作项
				}else{
					workItemManager.terminateWorkItem(workItemId);
				}
			}
		}
		return retState;
	}
	
	
	/**
	 * @author guolei
	 * @date 2018年4月6日 下午12:24:15
	 * @description				查询工作项详情
	 * @param workItemID		工作项ID
	 * @return
	 * @throws WFServiceException
	 */
	@Bizlet
	public static WFWorkItem queryWorkItemDetail(long workItemID) throws WFServiceException {
		WFWorkItem workItem = workItemManager.queryWorkItemDetail(workItemID);
		return workItem;
	}
	
	/**
	 * 查询为完成的工作项
	 * @param activityInstId
	 * @return
	 * @throws ParseException
	 */
	public static DataObject [] queryNoFinishWorkItem(Long activityInstId) throws ParseException{
		Map<String,Object> param = new HashMap<String,Object>();
		param.put("activityInstID", activityInstId);
		param.put("currentState", WorkItemState.RUNNING+","+WorkItemState.WAITING_RECEIVE);
		DataObject[] workItems = queryWorkItemByParam(param, false);
		return workItems;
	}
	
	/*
	 * 通过流程实例id获取工作项信息
	 * @param processinsted
	 * @return
	 */
	public static DataObject[] queryWorkItemidByProcessinstid(long processInstID) throws ParseException{
		DataObject criteriaEntity = DataFactory.INSTANCE.create("com.primeton.das.criteria","criteriaType");
		criteriaEntity.set("_entity","com.primeton.eos.ame_dailyoffice.common.Wfworkitem");
		criteriaEntity.set("_expr[1]/processinstid",processInstID);
		DataObject [] workItems  = DatabaseUtil.queryEntitiesByCriteriaEntity("default", criteriaEntity);
		return workItems;
	}
	
	/**
	 * 查询参与者
	 * @param workItemId
	 * @return
	 * @throws WFServiceException
	 */
	public static List<WIParticipantInfo> queryWorkItemParticipantInfo(long workItemId) throws WFServiceException {
		return workItemManager.queryWorkItemParticipantInfo(workItemId);
	}
}
	
	
	
