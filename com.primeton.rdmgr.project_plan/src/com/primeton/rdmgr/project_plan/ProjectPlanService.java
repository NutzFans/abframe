/**
 * 
 */
package com.primeton.rdmgr.project_plan;

import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.eos.data.datacontext.DataContextManager;
import com.eos.data.datacontext.ISessionMap;
import com.eos.data.datacontext.IUserObject;
import com.eos.foundation.PageCond;
import com.eos.spring.DASDaoSupport;
import com.eos.workflow.api.BPSServiceClientFactory;
import com.eos.workflow.api.IBPSServiceClient;
import com.eos.workflow.data.WFWorkItem;
import com.eos.workflow.omservice.WFParticipant;
import com.primeton.data.sdo.impl.DataObjectImpl;
import com.primeton.ext.common.muo.MUODataContextHelper;
import com.primeton.rdmgr.project_plan.projectPlanManager.AmeProjectPlan;
import com.primeton.rdmgr.project_plan.projectPlanManager.impl.AmeProjectPlanDetailImpl;
import com.primeton.rdmgr.project_plan.projectPlanManager.impl.AmeProjectPlanImpl;
import com.primeton.workflow.api.WFReasonableException;
import com.primeton.workflow.api.WFServiceException;

import commonj.sdo.DataObject;

import org.codehaus.jettison.json.JSONArray;
import org.codehaus.jettison.json.JSONException;
import org.codehaus.jettison.json.JSONObject;

/**
 * <pre>
 * Title: 程序的中文名称
 * Description: 程序功能的描述
 * </pre>
 * @author ganli
 * @version 1.00.00
 * 
 */
/*
 * 修改历史
 * $log$
 */
public class ProjectPlanService extends DASDaoSupport implements
		IProjectPlanService {

	/**
	 * 
	 */
	public ProjectPlanService() {
		// TODO 自动生成的构造函数存根
	}
	
	public DataObject[] queryCost(DataObject[] rdprojects) {
		if(rdprojects!=null)
		for(DataObject rdproject:rdprojects){
			//查询合同金额
			DataObject[] cost1=this.getDASTemplate().queryByNamedSql(DataObject.class, "com.primeton.rdmgr.project_plan.projectPlanNamingsql.queryContractAmount", rdproject);
			if(cost1!=null&&cost1.length>0){
				rdproject.set("contsum", cost1[0].get(0));
			}
			//查询预算成本
			DataObject[] cost2=this.getDASTemplate().queryByNamedSql(DataObject.class, "com.primeton.rdmgr.project_plan.projectPlanNamingsql.queryBudgetCost", rdproject);
			if(cost2!=null&&cost2.length>0){
				rdproject.set("pcostsum", cost2[0].get(0));
			}
			//查询实际成本
			DataObject[] cost3=this.getDASTemplate().queryByNamedSql(DataObject.class, "com.primeton.rdmgr.project_plan.projectPlanNamingsql.queryCost", rdproject);
			if(cost3!=null&&cost3.length>0){
				rdproject.set("cost", cost3[0].get(0));
			}
			//查询最新周报的时间
			if(!rdproject.isSet("reporttime")){
				DataObject[] reporttime=this.getDASTemplate().queryByNamedSql(DataObject.class, "com.primeton.rdmgr.project_plan.projectPlanNamingsql.queryLatestWeekly", rdproject);
				if(reporttime!=null&&reporttime.length>0){
					rdproject.set("reporttime", reporttime[0].getDate("ptime"));
				}
			}
			//查询最新计划提交的时间
			if(!rdproject.isSet("ptime")){
				DataObject[] ptime=this.getDASTemplate().queryByNamedSql(DataObject.class, "com.primeton.rdmgr.project_plan.projectPlanNamingsql.queryPlanPtime", rdproject);
				if(ptime!=null&&ptime.length>0){
					rdproject.set("ptime", ptime[0].getDate("ptime"));
				}
			}
		}
		return rdprojects;
	}

	public String queryCurrentStage(String projectNo) {
		String stage=null;
		Date currentTime = new Date();
		//1、通过项目编号查询项目的有效的计划信息
		Map<String,Object> condition = new HashMap<String,Object>();
		condition.put("projectNo", projectNo);
		condition.put("state", "1");
		DataObject[] plans=this.getDASTemplate().queryByNamedSql(DataObject.class, "com.primeton.rdmgr.project_plan.projectPlanNamingsql.queryProjectPlan", condition);
		
		if(plans==null||plans.length==0){
			stage="0";//无计划
			return stage;
		}
		int cycleIndex=0;
		int size=plans.length;
		for(DataObject plan:plans){
			cycleIndex+=1;
			Date startTime = plan.getDate("startTime");
			Date endTime = plan.getDate("endTime");
			if( (cycleIndex==1) && (currentTime.compareTo(startTime)<0) ){
				stage="-1";//早于项目计划
				break;
			}
			
			if(currentTime.compareTo(startTime)>=0&&(currentTime.compareTo(endTime)<0)){
				if(stage!=null)
					stage=stage+","+plan.getString("stage");
				else
					stage=plan.getString("stage");
			}
		}
		if(stage==null||stage.equals("")){
			stage="1";//晚于项目计划
		}
		return stage;
	}

	public DataObject[] query3Weekly(String projectNo) {
		Map<String,Object> condition = new HashMap<String,Object>();
		condition.put("projectNo", projectNo);
		DataObject[] weekly=this.getDASTemplate().queryByNamedSql(DataObject.class, "com.primeton.rdmgr.project_plan.projectPlanNamingsql.query3Weekly", condition);
		return weekly;
	}

	public DataObject[] queryWeeklysWithPage(DataObject condition,PageCond pageCond) {
		DataObject[] obj = this.getDASTemplate().queryByNamedSqlWithPage(DataObject.class, "com.primeton.rdmgr.project_plan.projectPlanNamingsql.queryWeeklys", pageCond, condition);
		return obj;
	}

	public DataObject[] queryLatestPlan(DataObject param) {
		
		DataObject[] obj = this.getDASTemplate().queryByNamedSql(DataObject.class, "com.primeton.rdmgr.project_plan.projectPlanNamingsql.queryLatestPlan", param);
		return obj;
	}

	public boolean modifyProjectPlan(String plans) throws Exception {
		JSONArray array = new JSONArray(plans);
		boolean isFirst = false;
		String projectNo=null,projectName = null;
		int versionNo = 0;
	
		AmeProjectPlanImpl plan = new AmeProjectPlanImpl();
		this.getDASTemplate().getPrimaryKey(plan);
		AmeProjectPlanDetailImpl detail = null;
		AmeProjectPlanDetailImpl[] details = new AmeProjectPlanDetailImpl[array.length()];
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		
		for(int i=0;i<array.length();i++){
			JSONObject jsonobject = (JSONObject) array.get(i);
			if(projectNo==null){
				projectNo = jsonobject.getString("projectNo");
				projectName = jsonobject.getString("projectName");
				if(jsonobject.isNull("versionNo")){
					isFirst = true;
				}else{
					versionNo=Integer.parseInt(String.valueOf(jsonobject.get("versionNo")));
				}
			}
			String stage=String.valueOf(jsonobject.get("stage"));
			
			Date startTime=format.parse(jsonobject.getString("startTime").substring(0, 10));
			Date endTime=format.parse(jsonobject.getString("endTime").substring(0, 10));
			detail=new AmeProjectPlanDetailImpl();
			detail.setStage(stage);
			detail.setStartTime(startTime);
			detail.setEndTime(endTime);
			detail.setAmeProjectPlan(plan);
			details[i] = detail;
		}
		plan.setProjectNo(projectNo);
		plan.setVersionNo(versionNo+1);
		plan.setProjectName(projectName);
		IUserObject userobject = getCurrentUseObject();
		plan.setSubmitter(userobject.getUserId());
		plan.setPtime(new Date());
		
		//如果不是第一次,启动流程
		if(!isFirst){
			plan.setState("0");//审批中
			Map<String,Object> arguments = new HashMap<String,Object>();
			arguments.put("participants", getAuditors(projectNo));
			IBPSServiceClient client=BPSServiceClientFactory.getDefaultClient();
			long processInstId = client.getProcessInstManager()
					.createAndStartProcInstAndSetRelativeData(
							"com.primeton.rdmgr.project_plan.projectPlanChange", userobject.getUserName()+"变更了‘"+projectName+"’的项目计划", "项目计划变更",
							false, arguments);
			List<WFWorkItem> workitems = client.getWorkItemManager().queryNextWorkItemsByProcessInstID(processInstId, false);
			if(workitems!=null&&workitems.size()>0)
				client.getWorkItemManager().finishWorkItem(workitems.get(0).getWorkItemID(), false);
			plan.setProcessinstid(BigDecimal.valueOf(processInstId));
		}else{
			plan.setState("1");//有效
			plan.setProcessinstid(null);
		}
		this.getDASTemplate().insertEntity(plan);
		this.getDASTemplate().insertEntityBatch(details);
		return true;
	}
	
	private WFParticipant[] getAuditors(String projectNo){
		WFParticipant[] participants= null;
		Map<String,Object> condition = new HashMap<String,Object>();
		condition.put("projectNo", projectNo);
		String orgids = "";
		DataObject[] orgseqs = this.getDASTemplate().queryByNamedSql(DataObject.class, "com.primeton.rdmgr.project_plan.projectPlanNamingsql.queryOrgseq", condition);
		if(orgseqs!=null&&orgseqs.length>0){
			String orgseq = orgseqs[0].getString("orgseq");
			String[] obj1 = orgseq.split("\\.");
			if(obj1.length==4){
				orgids+=","+obj1[2];
			}else if(obj1.length>=5){
				orgids+=","+obj1[2]+","+obj1[3];
			}
		}
		if(!orgids.equals("")){
			orgids = orgids.substring(1);
			condition.clear();
			condition.put("orgid", orgids);
			condition.put("currentuserid", getCurrentUseObject().getUserId());
			participants = this.getDASTemplate().queryByNamedSql(WFParticipant.class, "com.primeton.rdmgr.project_plan.projectPlanNamingsql.queryAudtors", condition);
		}
		return participants;
	}
	
	private IUserObject getCurrentUseObject() {
		ISessionMap session = DataContextManager.current().getSessionCtx();
		if (session == null||session.isEmpty()) {
			try {
				session = MUODataContextHelper.getMapContextFactory().getSessionMap();
			} catch (Exception e) {
			}
		}
		if (session == null||session.isEmpty()) {
			return DataContextManager.current().getMUODataContext().getUserObject();
		}
		return session.getUserObject();
	}

	public DataObject[] queryInAuditPlan(DataObject project){
		DataObject[] obj = this.getDASTemplate().queryByNamedSql(DataObject.class, "com.primeton.rdmgr.project_plan.projectPlanNamingsql.queryInAuditPlan", project);
		return obj;
	}

	public DataObject[] queryCostForStage(DataObject param) {
		DataObject[] stages = this.getDASTemplate().queryByNamedSql(DataObject.class, "com.primeton.rdmgr.project_plan.projectPlanNamingsql.queryLatestPlan", param);
		DataObject[] auditstages = this.getDASTemplate().queryByNamedSql(DataObject.class, "com.primeton.rdmgr.project_plan.projectPlanNamingsql.queryInAuditPlan", param);
		boolean flag=false;
		if(auditstages!=null&&auditstages.length>0){
			flag=true;
		}
		DataObject stage = null;
		for(int i=0;i<stages.length;i++){
			stage = stages[i];
			
			if(flag){
				stage.set("startTime2",auditstages[i].getString("startTime"));
				stage.set("endTime2",auditstages[i].getString("endTime"));
			}
			
			//工时成本
			int cost = 0;
			DataObject[] timecost = this.getDASTemplate().queryByNamedSql(DataObject.class, "com.primeton.rdmgr.project_plan.projectPlanNamingsql.queryTimeCost", stage);
			if(timecost!=null&&timecost.length>0){
				stage.set("timeCost", timecost[0].getInt(0));
				cost+=timecost[0].getInt(0);
			}
			//费用成本
			DataObject[] feecosts = this.getDASTemplate().queryByNamedSql(DataObject.class, "com.primeton.rdmgr.project_plan.projectPlanNamingsql.queryFeeCost", stage);
			if(feecosts!=null&&feecosts.length>0){
				stage.set("feeCost", feecosts[0].getInt(0));
				cost+=feecosts[0].getInt(0);
			}
			
			
			//外包成本
			DataObject[] outcosts = this.getDASTemplate().queryByNamedSql(DataObject.class, "com.primeton.rdmgr.project_plan.projectPlanNamingsql.queryOutCost", stage);
			if(outcosts!=null&&outcosts.length>0){
				stage.set("outCost", outcosts[0].getInt("poutcost"));
				cost+=outcosts[0].getInt(0);
			}
			//项目外部采购(不含税)成本
			DataObject[] purchasecosts = this.getDASTemplate().queryByNamedSql(DataObject.class, "com.primeton.rdmgr.project_plan.projectPlanNamingsql.queryPurchaseCost", stage);
			if(purchasecosts!=null&&purchasecosts.length>0){
				stage.set("purchaseCost", purchasecosts[0].getInt("poutcost"));
				cost+=purchasecosts[0].getInt(0);
			}
			//实际成本
			
			stage.set("startTime", stage.getString("startTime"));
			stage.set("endTime", stage.getString("endTime"));
			
			stage.set("cost",cost);
		}
		return stages;
	}

	public String finishAuditWorkitem(HashMap audit) throws WFServiceException, WFReasonableException {
		IBPSServiceClient client=BPSServiceClientFactory.getDefaultClient();
		if(!String.valueOf(audit.get("result")).equals("2")){
			//1、计算通过率
			DataObject[] obj = this.getDASTemplate().queryByNamedSql(DataObject.class, "com.primeton.rdmgr.project_plan.projectPlanNamingsql.queryPassingRate", audit);
			float rat = obj[0].getFloat(0);
			client.getRelativeDataManager().setRelativeData(Long.parseLong(String.valueOf(audit.get("processinstid"))), "passingRate", rat);
			//2、结束工作项
			Long workItemId = Long.parseLong(String.valueOf(audit.get("workitemid")));
			
			client.getWorkItemManager().finishWorkItem(workItemId, false);
			
		}else if(String.valueOf(audit.get("result")).equals("2")){
			client.getProcessInstManager().terminateProcessInstance(Long.parseLong(String.valueOf(audit.get("processinstid"))));
			updatePlanState(Long.parseLong(String.valueOf(audit.get("processinstid"))),"2");
		}
		return "true";
	}
	
	public boolean updatePlanState(long processinstid,String result){
		//修改项目计划状态为有效
		HashMap<String,Object> condition = new HashMap<String,Object>();
		condition.put("processinstid", processinstid);
		condition.put("result", result);
		this.getDASTemplate().executeNamedSql("com.primeton.rdmgr.project_plan.projectPlanNamingsql.updatePlanState", condition);
		return true;
	}

	public String modifyPlanAndFinishWorkitem(String plans,HashMap workitem) throws JSONException, ParseException, WFServiceException, WFReasonableException {
		JSONArray array = new JSONArray(plans);
	
		AmeProjectPlanDetailImpl detail = null;
		AmeProjectPlanDetailImpl[] details = new AmeProjectPlanDetailImpl[array.length()];
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		AmeProjectPlanImpl plan = new AmeProjectPlanImpl();
		
		for(int i=0;i<array.length();i++){
			JSONObject jsonobject = (JSONObject) array.get(i);
			String stage=String.valueOf(jsonobject.get("stage"));
			Date startTime=format.parse(jsonobject.getString("startTime"));
			Date endTime=format.parse(jsonobject.getString("endTime"));
			detail=new AmeProjectPlanDetailImpl();
			detail.setStage(stage);
			detail.setStartTime(startTime);
			detail.setEndTime(endTime);
			plan.setPlanId(BigDecimal.valueOf(jsonobject.getLong("planId")));
			detail.setAmeProjectPlan(plan);
			details[i] = detail;
		}
		HashMap condition = new HashMap();
		condition.put("planId", plan.getPlanId());
		this.getDASTemplate().executeNamedSql("com.primeton.rdmgr.project_plan.projectPlanNamingsql.deletePlanDetail", condition);//先删除计划详情，然后在增加
		this.getDASTemplate().insertEntityBatch(details);
		
		long processinstid=Long.parseLong(workitem.get("processinstid")+"");
		long workitemid=Long.parseLong(workitem.get("workitemid")+"");
		IBPSServiceClient client=BPSServiceClientFactory.getDefaultClient();
		client.getRelativeDataManager().setRelativeData(processinstid, "passingRate", "0");
		client.getWorkItemManager().finishWorkItem(workitemid, false);
		return "true";
	}

	public String queryOrgSeq4Parter(String userid) {
		HashMap obj = new HashMap();
		obj.put("busiparter", userid);
		DataObjectImpl[] objs = this.getDASTemplate().queryByNamedSql(DataObjectImpl.class, "com.primeton.rdmgr.project_plan.projectPlanNamingsql.queryOrgSeq4Parter", obj);
		if(objs!=null&&objs.length>0){
			return objs[0].getString(0);
		}
		return null;
	}
	
}
