/**
 * 
 */
package com.primeton.eos.ame_dailyoffice;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.MapUtils;
import org.apache.commons.lang.ArrayUtils;
import org.apache.commons.lang.StringUtils;
import org.gocom.abframe.bps.om.BPSOMDBUtil;
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
 * @date 2019-03-05 14:10:21
 *
 */
@Bizlet("")
public class FgsyzglUtil extends BusinessFormBaseUtil {

	/* （非 Javadoc）
	 * @see com.primeton.eos.ame_dailyoffice.BusinessFormBaseUtil#getBusinessDataMap()
	 */
	@Override
	protected Map<String, Object> getBusinessDataMap() {
		// TODO 自动生成的方法存根
		return null;
	}
	
	@Bizlet("保存以及更新分公司印章使用信息")
	public Map<String,Object> handle(DataObject formData){
		return super.handle(formData, "fgsyzsyid");
	}
	
	@Bizlet("创建分公司印章使用流程")
	public DataObject createSealUseProcess(String ywlx,DataObject formData,DataObject MisOpinion,String isSave) throws Exception{
		Map<String, Object> procRelaDataMap = null;
		
		//拼接processInstName，processInstDesc
		String dh = formData.getString("dh");
		String username = formData.getString("username");
		//String orgid = formData.getString("orgid");
		String yysyyjwjmc = formData.getString("yysyyjwjmc");
		if(yysyyjwjmc.length() > 30){
			yysyyjwjmc = yysyyjwjmc.substring(0, 30) + "...";
		}
		BusinessParam businessParam = AmeConstants.YWLX_UTIL_MAP.get(ywlx);
		String processDefName = businessParam.getProcessDefName();
		String processInstName = username + "发起单号为" + dh + "【" + yysyyjwjmc + "】" + businessParam.getProcessInstName();
		String processInstDesc = username + "发起单号为" + dh + "【" + yysyyjwjmc + "】" + businessParam.getProcessInstDesc();
		String yzssdw = formData.getString("yzssdw");
		//获取分公司部门领导人信息
		DataObject managerData = queryManager(yzssdw); 
		WFParticipant leader = new WFParticipant(managerData.getString("userid"), managerData.getString("empname"), "person");
		if(businessParam != null){
			if(MapUtils.isEmpty(procRelaDataMap)) {
				procRelaDataMap = new HashMap<String,Object>();
			}
			procRelaDataMap.put("leaders", leader);		//设置审批环节参与者
		}
		//set相关数据
//		DataObject[] emplist = getEmpList(MisOpinion.getString("checkerid"));
//		for (DataObject emp : emplist) {
//			WFParticipant leader = new WFParticipant(emp.getString("userid"), emp.getString("empname"), "person");
//			if(businessParam != null){
//				if(MapUtils.isEmpty(procRelaDataMap)) {
//					procRelaDataMap = new HashMap<String,Object>();
//				}
//				procRelaDataMap.put("leaders", leader);		//设置审批环节参与者
//			}
//		}
		procRelaDataMap.put("sealKeeper",queryFgsyzzl(yzssdw, "fgsyzgly")); //设置分公司管理员环节参与者
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
	/**
	 * 查询分公司部门管理员信息
	 * */
	private DataObject queryManager(String orgid) throws Exception {
		String cbName = "com.primeton.eos.ame_dailyoffice.dailyoffice.QueryManagerData";
		DataObject criteriaEntity = DataFactory.INSTANCE.create("com.primeton.das.criteria","criteriaType");
		criteriaEntity.set("_entity",cbName);
		criteriaEntity.set("_expr[1]/orgid",orgid);
		DataObject [] datas  = DatabaseUtil.queryEntitiesByCriteriaEntity("default", criteriaEntity);
		return datas[0];
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
		formData.set("lclx", "FGSYZSY");
		formData.set("lclxmc", "分公司印章使用流程");
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
			MisOpinion.set("workitemname", "发起印章外借申请流程");
			MisOpinion.set("activitydefid","yzsy_fqyzsylc");
		}
		//更新附件信息
		String dh = formData.getString("dh");
		String fileIds = formData.getString("fileids");
		String groupId = "fgsyzsy";
		if(fileIds != null)
		super.updateFiles(fileIds,groupId,dh);
		super.saveOpinion(MisOpinion);
		return super.handle(formData,"yzglid");
	}
	
	/**
	 * @param orgid 	部门id
	 * @param roleid 	角色id
	 * @author zhengquan
	 * @return 
	 * @description 获取分公司印章查看助理的参与者
	 * @return
	 */
	public List<WFParticipant> queryFgsyzzl(String orgid,String roleid){
		List<WFParticipant> assistants = new LinkedList<WFParticipant>();
		Map<String, String> parameterMap = new HashMap<String, String>();
		// 查询计提记录导出凭证
		parameterMap.put("ROLEID", roleid);
		parameterMap.put("ORGID", orgid);
		DataObject[] emps = BPSOMDBUtil.queryDataObjectsNamedSql("com.primeton.eos.ame_dailyoffice.dailyofficedata.getSealKeeper", parameterMap);
		for (DataObject emp : emps) {
			assistants.add(new WFParticipant(emp.getString("userid"), emp.getString("empname"), "person"));
		}
		return assistants;
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
}
