package org.gocom.bps.wfclient.task.business;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.gocom.bps.wfclient.common.IWFBizFormForwardDriver;
import org.gocom.bps.wfclient.common.ServiceFactory;

import com.eos.das.entity.criteria.CriteriaType;
import com.eos.das.entity.criteria.ExprType;
import com.eos.das.entity.criteria.OrderbyType;
import com.eos.das.entity.criteria.impl.ExprTypeImpl;
import com.eos.das.entity.criteria.impl.OrderbyTypeImpl;
import com.eos.foundation.data.DataObjectUtil;
import com.eos.system.annotation.Bizlet;
import com.eos.workflow.api.BPSServiceClientFactory;
import com.eos.workflow.api.IWFAppointActivityManager;
import com.eos.workflow.api.IWFFreeFlowManager;
import com.eos.workflow.api.IWFRelativeDataManager;
import com.eos.workflow.api.IWFSecurityManager;
import com.eos.workflow.api.IWFWorkItemManager;
import com.eos.workflow.api.IWFWorklistQueryManager;
import com.primeton.workflow.api.WFReasonableException;
import com.primeton.workflow.api.WFServiceException;

import commonj.sdo.DataObject;

/**
 * 服务调用工具类
 * 
 * @author Administrator
 *
 */
@Bizlet("ServiceUtil")
public class ServiceUtil {
	
	@Bizlet("queryTaskList")
	public static DataObject[] queryTaskList(String personID, String permission, String scope, DataObject pagecond, String taskType, String processChName, String processInstName, String workItemName, String currentState, String catalogName) throws WFServiceException {
		IWFWorklistQueryManager queryManager = ServiceFactory.getWFWorklistQueryManager();
		CriteriaType wi = null;
		wi = CriteriaType.FACTORY.create();
		wi.set_entity("com.eos.workflow.data.WFWorkItem");
		ExprType expr = null;
		OrderbyType orderby = null;
		ArrayList<ExprType> list = new ArrayList<ExprType>(4);
		ArrayList<OrderbyType> listOrder = new ArrayList<OrderbyType>(1);
		String[] tempCond = {"processChName","processInstName","workItemName","currentState","catalogName"};
		for(int i=0;i<5;i++){
			try {
				expr = ExprTypeImpl.class.newInstance();
			} catch (InstantiationException e) {
				// TODO 自动生成的 catch 块
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				// TODO 自动生成的 catch 块
				e.printStackTrace();
			}
			expr.set_property(tempCond[i]);
			if(i == 0){
				expr.set_value(processChName);
			}else if(i == 1){
				expr.set_value(processInstName);
			}else if(i == 2){
				expr.set_value(workItemName);
			}
			expr.set_op("like");
			expr.set_likeRule("all");
			if(i == 3){
				expr.set_value(currentState);
				expr.set_op("=");
			}else if(i == 4){
				expr.set_value(catalogName);
				expr.set_op("=");
			}
			list.add(i, expr);
		}
		try {
			orderby = OrderbyTypeImpl.class.newInstance();
			if ("self".equals(taskType)) {
				orderby.set_property("createTime");
			}else if ("finishedSelf".equals(taskType)) {				
				orderby.set_property("endTime");
			}
			orderby.set_sort("desc");
			listOrder.add(orderby);
		} catch (InstantiationException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		wi.set_expr(list);
		wi.set_orderby(listOrder);
		if ("self".equals(taskType)) {
			DataObject[] taskList = queryManager.queryPersonWorkItems4SDO(personID, permission, scope, wi, null);
			if (taskList != null) {
				IWFSecurityManager secruityManager = ServiceFactory.getWFSecurityManager();
				IWFFreeFlowManager freeflowManager = ServiceFactory.getWFFreeFlowManager();
				IWFAppointActivityManager applintActivityManager = ServiceFactory.getWFAppointActivityManager();
				for (DataObject task : taskList) {
					long workItemID = task.getLong("workItemID");
					task.set("currentParticipant", personID);
					//验证已登陆人员是否具有工作项操作的权限
					task.set("hasAccessWorkItemPermission", secruityManager.hasAccessWorkItemPermission(workItemID));
					//是否是自由流
					task.set("isFreeActivity", freeflowManager.isFreeActivity(workItemID));
					//是否需要指派后继活动参与者
					task.set("isNeedAppointNextActivityParticipant", applintActivityManager.isNeedAppointNextActivityParticipant(workItemID));
				}
			}
			taskList=myPageCond(taskList, pagecond);
			return taskList;
		} else if ("finishedSelf".equals(taskType)) {
			DataObject[] taskList = queryManager.queryPersonFinishedWorkItems4SDO(personID, scope, wi, false, null);
			taskList=myPageCond(taskList, pagecond);
			return taskList;
		} else if ("entrust".equals(taskType)) {
			DataObject[] taskList = queryManager.queryPersonEntrustWorkItems4SDO(personID, scope, null);
			taskList=myPageCond(taskList, pagecond);
			return taskList;
		} else if ("finishedEntrust".equals(taskType)) {
			DataObject[] taskList = queryManager.queryPersonEntrustFinishedWorkItems4SDO(personID, scope, false, null);	
			taskList=myPageCond(taskList, pagecond);
			return taskList;
		} else {
			return new DataObject[0];
		}		
	}
	
	@Bizlet("executeWorkItem")
	public static void executeWorkItem(long workItemID, String submitType, 
			String personID, String reason, DataObject[] participants, long processInstID, Map<String, Object> workItemFormData) throws WFServiceException, WFReasonableException {
		if ("get".equals(submitType)) {//领取
			ServiceFactory.getWFWorkItemManager().assignWorkItemToSelf(workItemID);
		} else if ("cancelGet".equals(submitType)) {//取消领取
			ServiceFactory.getWFWorkItemManager().withdrawWorkItem(workItemID);
		} else if ("delegate".equals(submitType)) {
			ServiceFactory.getWFDelegateManager().delegateWorkItem4SDO(workItemID, participants, "DELEG");
			ServiceFactory.getWFProcessLogManager().addProcessLog4SDO(workItemID, "代办", personID, reason, null);
		} else if ("help".equals(submitType)) {
			ServiceFactory.getWFDelegateManager().delegateWorkItem4SDO(workItemID, participants, "HELP");
			ServiceFactory.getWFProcessLogManager().addProcessLog4SDO(workItemID, "协办", personID, reason, null);
		} else if ("redo".equals(submitType)) {
			ServiceFactory.getWFDelegateManager().redoDelegatedWorkItem(workItemID);
			ServiceFactory.getWFProcessLogManager().addProcessLog4SDO(workItemID, "重做", personID, reason, null);
		} else if ("reject".equals(submitType)) {
			ServiceFactory.getWFDelegateManager().rejectDelegatedWorkItem(workItemID);
			ServiceFactory.getWFProcessLogManager().addProcessLog4SDO(workItemID, "拒绝", personID, reason, null);
		} else if ("withdraw".equals(submitType)) {
			ServiceFactory.getWFDelegateManager().withdrawDelegatedWorkItem(workItemID);
			ServiceFactory.getWFProcessLogManager().addProcessLog4SDO(workItemID, "收回", personID, reason, null);
		} else {
			if ("save".equals(submitType)) {
				//保存工作项
				if (workItemFormData != null && workItemFormData.size() > 0) {
					IWFRelativeDataManager relativeDataManager = ServiceFactory.getWFRelativeDataManager();
					relativeDataManager.setRelativeDataBatch(processInstID, workItemFormData);
				}
			} else {
				IWFWorkItemManager workItemManager = ServiceFactory.getWFWorkItemManager();
	
				//如果自动表单不为空：保存相关数据，完成工作项
				if (workItemFormData != null && workItemFormData.size() > 0) {
					workItemManager.finishWorkItemWithRelativeData(workItemID, workItemFormData, false);				
				} else { // 完成工作项
					workItemManager.finishWorkItem(workItemID, false);
				}
			}
		}
	}
	
	@Bizlet("openBizform")
	public static boolean openBizform(long workItemID) throws WFServiceException{
		IWFBizFormForwardDriver manager = ServiceFactory.getWFBizFormForwardDriver();	
		return manager.isForwardBizFormClient(workItemID);
	}
	
	@Bizlet("doThingTask")
	public static void doThingTask(long workItemID, String reason) throws com.primeton.workflow.api.WFServiceException{
		IWFWorkItemManager workItemManager = BPSServiceClientFactory.getDefaultClient().getWorkItemManager();
		workItemManager.excutePressTask(workItemID, reason);    
	}
	
	public static DataObject[] myPageCond(DataObject[] list,DataObject pagecond) {
		int count=list.length;
		int length=pagecond.getInt("length");
		int totalPage=(int)Math.ceil((double)count/length);
		int begin=pagecond.getInt("begin");
		int currentPage=0;
		if(begin==0){
			currentPage=1;
		}else{
			currentPage=begin/length+1;
		}
		int end=currentPage*length;
		if (end>count)
			end=count;
		List resultList=new ArrayList();;
		for(int i=begin;i<end;i++){
			resultList.add(list[i]);
		}
		if(currentPage==1){
			pagecond.set("isFirst", true);
			pagecond.set("isLast", false);
		}else if (currentPage==totalPage){
			pagecond.set("isFirst",false);
			pagecond.set("isLast", true);
		}
		pagecond.set("count", count);
		pagecond.set("totalPage", totalPage);
		pagecond.set("currentPage", currentPage);
		DataObject[] result=DataObjectUtil.convertDataObjects(resultList, "com.eos.workflow.data.WFWorkItem", true);
		return result;
	}
	

}
