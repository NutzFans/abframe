package com.primeton.rdmgr.project_plan;

import java.text.ParseException;
import java.util.HashMap;

import org.codehaus.jettison.json.JSONException;

import com.eos.foundation.PageCond;
import com.primeton.workflow.api.WFReasonableException;
import com.primeton.workflow.api.WFServiceException;

import commonj.sdo.DataObject;

public interface IProjectPlanService {
	
	/**
	 * 查询项目的费用
	 * @param rdprojects
	 * @return
	 */
	public DataObject[] queryCost(DataObject[] rdprojects);
	
	/**
	 * 查询当前处于计划中的哪个阶段
	 * @param projectNo
	 * @return
	 */
	public String queryCurrentStage(String projectNo);
	
	/**
	 * 查询某项目的最新的前三个周报信息
	 * @param projectNo
	 * @return
	 */
	public DataObject[] query3Weekly(String projectNo);

	/**
	 * 查询某项目的周报信息
	 * @param condition
	 * @param pageCond
	 * @return
	 */
	public DataObject[] queryWeeklysWithPage(DataObject condition,PageCond pageCond);
	
	/**
	 * 查询最新的有效的项目计划信息
	 * @param projectNo
	 * @return
	 */
	public DataObject[] queryLatestPlan(DataObject project);
	
	/**
	 * 项目计划变更
	 * 		事务放在逻辑流（biz）中处理，用于保证事务的一致性。
	 * @param plans
	 * @return
	 */
	public boolean modifyProjectPlan(String plans) throws Exception;
	
	/**
	 * 查询最新的有效的项目计划信息
	 * @param projectNo
	 * @return
	 */
	public DataObject[] queryInAuditPlan(DataObject project);
	
	/**
	 * 按照计划阶段查询阶段和费用
	 *    并且计算出费用总和
	 * @param param
	 * @return
	 */
	public DataObject[] queryCostForStage(DataObject param);
	
	/**
	 * 结束审核环节的工作项
	 * @param audit
	 * @return
	 * @throws WFServiceException
	 * @throws WFReasonableException
	 */
	public String finishAuditWorkitem(HashMap audit) throws WFServiceException, WFReasonableException;
	
	/**
	 * 保存项目计划，并且结束工作项
	 * @return
	 */
	public String modifyPlanAndFinishWorkitem(String plans,HashMap workitem) throws JSONException, ParseException, WFServiceException,WFReasonableException;
	
	/**
	 * 正常结束流程时，更改计划的状态为0
	 * @param processinstid
	 * @return
	 */
	public boolean updatePlanState(long processinstid,String result);
	
	/**
	 * 查询人员作为业务合伙人的组织机构序列
	 * @param userid
	 * @return
	 */
	public String queryOrgSeq4Parter(String userid);
	
}
