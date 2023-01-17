/**
 * 
 */
package com.primeton.eos.ame_dailyoffice;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.MapUtils;
import org.apache.commons.lang.ArrayUtils;
import org.apache.commons.lang.StringUtils;
import org.gocom.bps.web.bizform.BPFFServiceFactory;

import com.eos.data.datacontext.IUserObject;
import com.eos.data.datacontext.UserObject;
import com.eos.foundation.MailInfo;
import com.eos.foundation.database.DatabaseUtil;
import com.eos.system.annotation.Bizlet;
import com.eos.workflow.api.BPSServiceClientFactory;
import com.eos.workflow.data.WFProcessInst;
import com.eos.workflow.data.WFWorkItem;
import com.eos.workflow.omservice.WFParticipant;
import com.eos.workflow.omservice.WIParticipantInfo;
import com.primeton.eos.ame_common.AmeSendMailUtil;
import com.primeton.eos.ame_common.WeChatUtil;

import commonj.sdo.DataObject;
import commonj.sdo.helper.DataFactory;

/**
 * @author zhengquan
 * @date 2019-02-27 17:34:28
 *
 */
@Bizlet("")
public class YzglUtil extends BusinessFormBaseUtil{
	@Override
	protected Map<String, Object> getBusinessDataMap() {
		// TODO 自动生成的方法存根
		return null;
	}
	

	/**
	 * @author zhengquan
	 * @time 2019年3月1号
	 * @param formData 表单信息
	 * @return
	 * @description 保存以及跟新印章使用信息
	 */
	@Bizlet("保存以及更新印章使用信息")
	public Map<String, Object> handle(DataObject formData,DataObject MisOpinion) {
		//设置意见表里面不为空的数据
		String processinstid = formData.getString("processinstid");
		if(!StringUtils.isEmpty(processinstid)){
			MisOpinion.set("processinstid",processinstid);
		}else MisOpinion.set("processinstid","0");
		formData.set("lclx", "YZSY");
		formData.set("lclxmc", "印章使用流程");
		//获取当前登陆人员信息
		IUserObject curUser = ProcessUtil.getCurrUserObject();
		String userid = curUser.getUserId();
		String username = curUser.getUserName();
		String orgid = curUser.getUserOrgId();
		String orgname = curUser.getUserOrgName();
		MisOpinion.set("userid",userid);
		MisOpinion.set("operatorname",username);
		MisOpinion.set("orgid",orgid);
		MisOpinion.set("orgname",orgname);
		MisOpinion.set("time",new Date());
		String workItemid = MisOpinion.getString("workitemid");
		if(StringUtils.isEmpty(workItemid)){
			MisOpinion.set("workitemid","-1");
			MisOpinion.set("workitemname", "发起印章使用申请流程");
			MisOpinion.set("activitydefid","yzsy_fqyzsylc");
		}
		super.saveOpinion(MisOpinion);
		//更新附件信息
		String dh = formData.getString("dh");
		String fileIds = formData.getString("fileids");
		String groupId = "yzsy";
		if(!"null".equals(fileIds))
		super.updateFiles(fileIds,groupId,dh);
		
		return super.handle(formData,"yzglid");
	}
	
	/**
	 * @param formData
	 * @author zhengquan
	 * @time 2019-3-1 16点42分
	 * @description 根据数据实体查询印章使用数据
	 * @return
	 * @throws Exception
	 */
	@Bizlet("查询印章使用列表")
	public DataObject [] querySealUseList(DataObject page,DataObject criteria) throws Exception {
		String cbName = "com.primeton.eos.ame_dailyoffice.dailyoffice.AmeYzsyProcess" + "|" + "yzsqrq";
		return super.queryBusinessList(cbName,page,criteria);
	}
	
	/**
	 * @param formData
	 * @param extDataMap
	 * @return
	 * @throws Exception
	 */
	@Bizlet("查询印章使用数据")
	public DataObject queryData(DataObject formData,String pkName) throws Exception {
		return super.queryBusinessData(formData,pkName);
	}
	
	/**
	 * @param formDatas
	 * @return
	 */
	@Bizlet("删除印章使用数据")
	public boolean deleteDatas(DataObject[] formDatas){
			return super.delete(formDatas,"yzglid");
	}
	
	/**
	 * @param formDatas
	 * @return
	 */
	@Bizlet("保存印章使用数据")
	public Map<String, Object> saveDatas(DataObject formData){
		//更新附件信息
		String dh = formData.getString("dh");
		String fileIds = formData.getString("fileids");
		String lclx = formData.getString("lclx");
		String groupId = null;
		if("YZSY".equals(lclx)){
			groupId = "yzsy";
		}else{
			groupId = "fgsyzsy";
		}
		if(!"null".equals(fileIds))
		super.updateFiles(fileIds,groupId,dh);
		
		return super.handle(formData,"yzglid");
	}
	
	@Bizlet("创建用章使用流程")
	public DataObject createSealUseProcess(String ywlx,DataObject formData,DataObject MisOpinion,String isSave) throws Exception{
		Map<String, Object> procRelaDataMap = null;
		
		//拼接processInstName，processInstDesc
		String flowFlag = null;
		String dh = formData.getString("dh");
		String username = formData.getString("username");
		String yysyyjwjmc = formData.getString("yysyyjwjmc");
		
		//判断如果为分公司部门就提交到分公司部门负责人审批
		String orgname = formData.getString("orgname");
		if(orgname.contains("分公司")){
			flowFlag = "1";
		}else flowFlag = "0";
		if(yysyyjwjmc.length() > 30){
			yysyyjwjmc = yysyyjwjmc.substring(0, 30) + "...";
		}
		BusinessParam businessParam = AmeConstants.YWLX_UTIL_MAP.get(ywlx);
		String processDefName = businessParam.getProcessDefName();
		String processInstName = username + "发起单号为" + dh + "【" + yysyyjwjmc + "】" + businessParam.getProcessInstName();
		String processInstDesc = username + "发起单号为" + dh + "【" + yysyyjwjmc + "】" + businessParam.getProcessInstDesc();
		
		//set相关数据
		DataObject[] emplist = getEmpList(MisOpinion.getString("checkerid"));
		for (DataObject emp : emplist) {
			WFParticipant leader = new WFParticipant(emp.getString("userid"), emp.getString("empname"), "person");
			if(businessParam != null){
				if(MapUtils.isEmpty(procRelaDataMap)) {
					procRelaDataMap = new HashMap<String,Object>();
				}
				procRelaDataMap.put("leader", leader);		//设置审批环节参与者
			}
		}
		procRelaDataMap.put("flowFlag", flowFlag);
		//创建流程实例，并设置相关数据
		long processInstID = BPSServiceClientFactory.getDefaultClient().getProcessInstManager().createAndStartProcInstAndSetRelativeData(
				processDefName,
				processInstName,
				processInstDesc,
				false,
				procRelaDataMap
			);
		formData.set("processinstid",processInstID);
		if("1".equals(isSave)){
		DataObject[] workItems = WorkItemHelper.queryWorkItemidByProcessinstid(processInstID);
		if(!ArrayUtils.isEmpty(workItems)){
			Long workitemid = workItems[0].getLong("workitemid");
			BPFFServiceFactory.getWFWorkItemManager().finishWorkItem(workitemid, false);
			}
		}
		return formData;
	}


	private DataObject[] getEmpList(String checkerid) {
		DataObject criteriaEntity = DataFactory.INSTANCE.create("com.primeton.das.criteria","criteriaType");
		criteriaEntity.set("_entity","org.gocom.abframe.dataset.organization.OmEmployee");
		criteriaEntity.set("_expr[1]/_property","userid");
		criteriaEntity.set("_expr[1]/_op","in");
		criteriaEntity.set("_expr[1]/_value",checkerid);
		DataObject [] datas  = DatabaseUtil.queryEntitiesByCriteriaEntity("default", criteriaEntity);
		return datas;
	}
	
	@Bizlet("查询意见数据")
	public DataObject[] queryOpinion(String processinstid){
		DataObject[] data = super.queryOpinion(processinstid);
		return data;
	}
	
	@Bizlet("调整流程")
	public Map<String, Object> modifySealUse(Long workItemID,DataObject misOpinion,DataObject formData){
		Map<String, Object> map = null;
		try {
			super.modifyYzProcess(workItemID,misOpinion);
			map = handle(formData,misOpinion);
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		return map;
	}
	
	/**
	 * @param processInst			流程实例对象
	 * @param workItem				工作项对象
	 * @throws Exception 
	 */
	@Bizlet("发送消息")
	public void sendMessage(WFProcessInst processInst, WFWorkItem workItem) throws Exception {
		List<String> lstEmpId = new ArrayList<String>();
		List<WIParticipantInfo> lstParti = WorkItemHelper.queryWorkItemParticipantInfo(workItem.getWorkItemID());
		for(WIParticipantInfo parti : lstParti) {
			if("role".equalsIgnoreCase(parti.getTypeCode())) {
				DataObject criteria = DataFactory.INSTANCE.create("com.primeton.das.criteria", "criteriaType");
				criteria.set("_entity", "org.gocom.abframe.dataset.privilege.RoleOperator");
				criteria.set("_expr[1]/roleid", parti.getId());
				criteria.set("_expr[2]/status", "running");
				DataObject[] arrUser = DatabaseUtil.queryEntitiesByCriteriaEntity("default", criteria);
				for(DataObject user : arrUser) {
					lstEmpId.add(user.getString("userid"));
				}
			} else {
				lstEmpId.add(parti.getId());
			}
		}
		List<String> lstUserId = new ArrayList<String>();
		List<String> lstMailAddr = new ArrayList<String>();
		List<UserObject> lstUserInfo = super.getUserInfoByUserId(StringUtils.join(lstEmpId.toArray(), ","));
		for(UserObject uo : lstUserInfo) {
			if(!lstUserId.contains(uo.getUserId())) lstUserId.add(uo.getUserId());
			if(!lstMailAddr.contains(uo.getUserMail())) lstMailAddr.add(uo.getUserMail());
		}
		
		String weChatContent = getContent(processInst, workItem);
		String mailContent = getMailContent(processInst, workItem);
		//发送邮件
		if(lstMailAddr.size() > 0) {
			MailInfo mail = ProcessUtil.getMailInfo();
			mail.setSubject("印章申请待办任务通知");
			mail.setTo(lstMailAddr);
			mail.setMessage(mailContent);
			AmeSendMailUtil.sendMail(mail);
		}
		
		//发送微信通知
		if(lstUserId.size() > 0) {
			weChatContent = "【印章申请待办任务通知】\r\n" + weChatContent;
			WeChatUtil.sendWXMsg(StringUtils.join(lstUserId.toArray(), "|"), "", "", weChatContent, "1000002");
		}
	}
	
	/**
	 * 获取邮件或微信通知内容
	 * @param processInst
	 * @param workItem
	 * @return
	 */
	public String getContent(WFProcessInst processInst, WFWorkItem workItem) {
		//获取工作项id
		Long workItemID = workItem.getWorkItemID();
		//获取个人事项待办链接
		String linkPerson = WeChatUtil.linkOfContent("1");
		//获取待办链接
		String linkTask = WeChatUtil.linkOfTaskList(workItemID, "任务处理");
		String content = "";
		String processInstName = processInst.getProcessInstName();
		String curHjmc = workItem.getActivityInstName();
		content = processInstName + "在\"" + curHjmc + "\"环节产生了一条属于你的新任务，请点击\"" + linkTask + "\"进入流程处理页面，或者点击\""+linkPerson +"\"查看更多任务。";
		return content;
	}
	/**
	 * 获取邮件通知内容
	 * @param processInst
	 * @param workItem
	 * @return
	 */
	private String getMailContent(WFProcessInst processInst, WFWorkItem workItem) {
			String content = "";
			String processInstName = processInst.getProcessInstName();
			String curHjmc = workItem.getActivityInstName();
			content = processInstName + "在\"" + curHjmc + "\"环节产生了一条属于你的新任务。";
			return content;
	}
	
	/**
	 * @param processInst			流程实例对象
	 * @param workItem				工作项对象
	 * @throws Exception 
	 */
	@Bizlet("通过流程实例id获取此案件的状态")
	public String getStateByProcessinstid(String processinstid){
		String state = null;
		DataObject criteria = DataFactory.INSTANCE.create("com.primeton.das.criteria","criteriaType");
		criteria.set("_entity","com.primeton.eos.ame_dailyoffice.common.Wfprocessinst");
		criteria.set("_expr[1]/processinstid",processinstid);//主键ID
		DataObject [] processinst  = DatabaseUtil.queryEntitiesByCriteriaEntity("default", criteria);
		if(processinst.length > 0){
			state = processinst[0].getString("currentstate");
		}
		return state;
	}
}
