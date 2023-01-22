/**
 * 
 */
package com.primeton.eos.ame_dailyoffice;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.collections.MapUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.poi.util.StringUtil;
import org.gocom.bps.web.bizform.BPFFServiceFactory;
import org.json.simple.JSONObject;
import org.springframework.transaction.annotation.Transactional;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.eos.data.datacontext.UserObject;
import com.eos.foundation.data.DataObjectUtil;
import com.eos.foundation.database.DatabaseExt;
import com.eos.foundation.database.DatabaseUtil;
import com.eos.foundation.eoscommon.BusinessDictUtil;
import com.eos.system.annotation.Bizlet;
import com.eos.workflow.api.BPSServiceClientFactory;
import com.eos.workflow.api.IBPSServiceClient;
import com.eos.workflow.api.IWFProcessInstManager;
import com.eos.workflow.data.WFWorkItem;
import com.eos.workflow.omservice.WFParticipant;
import com.primeton.eos.ame_common.WeChatUtil;
import com.primeton.workflow.api.WFServiceException;
import com.raq.expression.function.convert.ToBigDecimal;

import commonj.sdo.DataObject;
import commonj.sdo.helper.DataFactory;

/**
 * @author zhengquan
 * @date 2019-02-28 09:39:45
 * @description 印章保存的基本方法
 *
 */
@Bizlet("handle方法")
public abstract class BusinessFormBaseUtil {
	/** 实体全名 */
	public final static String QNAME = "entityName";
	/** 主键字段名称 */
	protected final static String PKFILEDNAME = "pkFiledName";
	
	/**
	 * @param formData 数据信息
	 * @param keyField 数据主键
	 * @author zhengquan
	 * @time 2019-03-01 16点52分
	 * @description 传入数据以及数据的主键来判断是更新还是插入数据
	 * @return
	 */
	protected Map<String,Object> handle(DataObject formData, String keyField){
		Map<String,Object> map = new HashMap<String,Object>();
		map = saveOrUpdateBunessData(formData,keyField);
		return map;
	}
	
	/**
	 * @param formData 数据信息
	 * @param keyField 数据主键
	 * @author zhengquan
	 * @time 2019-03-01 16点52分
	 * @description 传入数据以及数据的主键来判断是更新还是插入数据
	 * @return
	 */
	private Map<String,Object> saveOrUpdateBunessData(DataObject formData, String keyField) {
		if(StringUtils.isBlank(keyField)) return null;
		int iResult = 0;
		DataObject obj = formData;
		String keyValue = obj.getString(keyField);
		//判断主键是否为空，若为空则给它赋uuid
		if(StringUtils.isBlank(keyValue)) {
			keyValue = ProcessUtil.getUUID();
			obj.set(keyField, keyValue);
		}
		DataObject sourceData = DataObjectUtil.createDataObject(DataObjectUtil.getEntityName(obj));
		sourceData.set(keyField, keyValue);
		//通过查询主键数据判断数据库里面是否有这条数据，若有，就更新这条数据，若没有则插入数据
		iResult = DatabaseUtil.expandEntity("default", sourceData);
		if(iResult > 0) {
			DatabaseUtil.updateEntity("default", obj);
		} else {
			DatabaseUtil.insertEntity("default", obj);
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put(keyField, keyValue);
		return map;
	}
	
	
	/**
	 * 各业务子类各自实现此方法，用于返回 主键字段名称、业务大类名称、业务小类名称、流程定义名称、流程实例名称、流程实例描述
	 * 
	 * @return
	 */
	protected abstract Map<String, Object> getBusinessDataMap();

	/**
	 * 用于返回:主键字段名称、业务大类名称、业务小类名称、流程定义名称、流程实例名称、流程实例描述
	 * 
	 * @param dataObject
	 * @return
	 */
	public Map<String, Object> getBusinessDataMap(DataObject dataObject) {
		Map<String, Object> map = getBusinessDataMap();
		if (MapUtils.isEmpty(map) && null != dataObject) {

			map = new HashMap<String, Object>();
			//String hysqid = dataObject.getString("hysqid");
			//DataObject hycy = getYwslByhysqid(hysqid);
			//业务类型
			map.put(QNAME, "com.primeton.eos.ame_dailyoffice.hygl.AmeHysq");
			map.put(PKFILEDNAME, "hysqid");
		}
		return map;
	}
	/**
	* @Title: 
	* @Description: 根据业务ID查询报批信息
	* @param @param hysqid
	* @param @return  参数
	* @return DataObject  返回类型
	* @throws
	*/
	public static  DataObject getYwslByhysqid(String hysqid){
		DataObject criteria = DataFactory.INSTANCE.create("com.primeton.das.criteria", "criteriaType");
		criteria.set("_entity","com.primeton.eos.ame_dailyoffice.hygl.AmeHysq");
		criteria.set("_expr[1]/hysqid",hysqid);//主键ID
		DataObject[] bpxxs = DatabaseUtil.queryEntitiesByCriteriaEntity("default", criteria);
		DataObject obj = null;
		if(bpxxs != null && bpxxs.length>0){
			obj = bpxxs[0];
		}else{
			obj = null;
		}
		return obj;
	}

	/**
	 * @author zhengquan
	 * @time 2019-03-01 17点00分
	 * @description 通过数据实体名查询数据库中所有的数据
	 * @param cbName 数据实体名称
	 * @return
	 */
	public DataObject [] queryBusinessList(String cbName,DataObject page,DataObject criteria) {
		String [] arrData = cbName.split("\\|");
		cbName = arrData[0];
		String orderProperty = arrData[1];
		//设置分页查询条件
		page.set("isCount",true);
		criteria.set("_entity",cbName);
		criteria.set("_orderby/_property",orderProperty);
		criteria.set("_orderby/_sort","desc");
		DataObject [] sjclxxs  = DatabaseExt.queryEntitiesByCriteriaEntityWithPage("default", criteria , page);
		for (DataObject sjclxx : sjclxxs) {
			String lczt = null;
			String state = sjclxx.getString("currentstate");
			if(StringUtils.isEmpty(state)) state = "0";
			switch (Integer.parseInt(state)){
				case 0: lczt = "新增";break;
				case 1: lczt = "未启动";break;
				case 2: lczt = "运行";break;
				case 3: lczt = "挂起";break;
				case 7: lczt = "完成";break;
				case 8: lczt = "终止";break;
				default: lczt = "数据异常";break;
			}
			sjclxx.set("lczt", lczt);
		}
		return sjclxxs;
	}

	public DataObject queryBusinessData(DataObject formData,String pkName) {
		String pkValue = formData.getString(pkName);
		String cbName = DataObjectUtil.getEntityName(formData);
		DataObject data = null;
		DataObject criteriaEntity = DataFactory.INSTANCE.create("com.primeton.das.criteria","criteriaType");
		criteriaEntity.set("_entity",cbName);
		criteriaEntity.set("_expr[1]/"+pkName,pkValue);
		DataObject [] datas  = DatabaseUtil.queryEntitiesByCriteriaEntity("default", criteriaEntity);
		if (DataObjectUtil.getSizeOrLength(datas) > 0) {
			data = datas[0];
		}
		return data;
	}

	public boolean delete(DataObject[] formDatas, String pkName) {
		boolean flag = false;
		for (DataObject formData : formDatas) {
			//在每次循环之后需要重置flag的标识为false，防止有未删除的数据也会返回true
			flag = false;
			String pkValue = formData.getString(pkName);
			String cbName = DataObjectUtil.getEntityName(formData);
			DataObject criteriaEntity = DataFactory.INSTANCE.create("com.primeton.das.criteria","criteriaType");
			criteriaEntity.set("_entity",cbName);
			criteriaEntity.set("_expr[1]/"+pkName,pkValue);
			DataObject[] objs = DatabaseUtil.queryEntitiesByCriteriaEntity("default", criteriaEntity);
			
			DataObject criteria2 = DataFactory.INSTANCE.create("com.primeton.das.criteria", "criteriaType");
			criteria2.set("_entity","com.primeton.eos.ame_dailyoffice.hygl.AmeHycy");
			criteria2.set("_expr[1]/hysqid",pkValue);//主键ID
			DataObject[] bpxxs = DatabaseUtil.queryEntitiesByCriteriaEntity("default", criteria2);
			
			//删除企业微信的日程信息

			for(DataObject tt:objs){
				String wechatreturnid1= tt.getString("wechatreturnid");
				
				//根据agentid获取secert
				DataObject[] dicts = BusinessDictUtil.getDictInfoByType("AME_WE_APP");
				String	corpsecret = null;
				for(int i=0;i<dicts.length;i++){
					if(dicts[i].get("dictID").equals("11111")){
						corpsecret = (String) dicts[i].get("filter1");
					}
				}
				
				//String agentid="vZvQVOEZCjSQ2Hh9g6jiiwOIz7o2-mXpdBt-iEmhPTk";
				WeChatUtil.deleteCalendarArrange(corpsecret, wechatreturnid1);
			}
			
		
			//删除系统中的日程信息
			DatabaseUtil.deleteEntityBatch("default",objs);
			//删除会议参与者
			DatabaseUtil.deleteEntityBatch("default",bpxxs);

			flag = true;
		}
		return flag;
	};

	
	/**
	 * 以主键形式保存表单信息
	 * 
	 * @param formData    业务数据
	 * @return
	 */
	@Bizlet
	@Transactional
	protected Map<String, Object> handle2(DataObject formData) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map = saveOrUpdateBusinessData(formData);
		return map;
	}
	
	/**
	 * 保存业务表单数据
	 * 
	 * @param formData
	 *            业务数据
	 * @return
	 * @throws NumberFormatException
	 * @throws WFServiceException
	 * @throws
	 * @throws WFServiceException
	 */
	@Bizlet
	public Map<String, Object> saveOrUpdateBusinessData(DataObject formData) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		beforeSaveOrUpdateBusinessData(formData);
		
		String hysqid = getDataObjectPkValue(formData);
		Map<String, Object> businessDataMap = getBusinessDataMap(formData);
		String pkFiledName = (String) businessDataMap.get(PKFILEDNAME);
		if (StringUtils.isBlank(hysqid)) {
			ProcessUtil.getUUID(formData, pkFiledName);
		}
		//以前根据页面传参判断是插入还是更新，现改为根据主键判断
		DataObject sourceFormData = DataObjectUtil.createDataObject((String)businessDataMap.get(QNAME));
		sourceFormData.set(pkFiledName, getDataObjectPkValue(formData));
		int n = DatabaseUtil.expandEntity("default", sourceFormData);
		
		if(n == 0){
			DatabaseExt.insertEntityCascade("default", formData);
		}else{
			DatabaseExt.updateEntityCascade("default", formData, new String[] {});
		}

		afterSaveOrUpdateBusinessData(formData);
		map.put("id", hysqid);
		return map;
	}
	
	/**
	 * 获取DataObjec主键值
	 * 
	 * @param dataObject
	 * @return
	 */
	protected String getDataObjectPkValue(DataObject dataObject) {
		String pkValue = null;
		Map<String, Object> map = getBusinessDataMap(dataObject);
		String pkFiledName = (String) map.get(PKFILEDNAME);
		if (dataObject != null && StringUtils.isNotBlank(pkFiledName)) {
			pkValue = dataObject.getString(pkFiledName);
		}
		return pkValue;
	}
	
	/**
	 * 保存或修改业务数据前执行
	 * 
	 * @param formData
	 * @param wfOptMsgDato
	 * @param extDataMap
	 * @return
	 */
	@SuppressWarnings({ "unused"})
	protected Map<String, Object> beforeSaveOrUpdateBusinessData(
			DataObject formData) {
		handleBusinessCascadeData(formData);
		Map<String, Object> dataMap = getBusinessDataMap(formData);
		String hysqid = getDataObjectPkValue(formData);		
		return null;
	}
	
	/**
	 * 处理业务数据级联信息
	 * 
	 * @param formData
	 */
	
	@Transactional
	protected void handleBusinessCascadeData(DataObject formData) {
	}
	
	/**
	 * 保存或修改业务数据后执行
	 * 
	 * @param formData
	 */
	@SuppressWarnings("unused")
	protected Map<String, Object> afterSaveOrUpdateBusinessData(
			DataObject formData)
			throws WFServiceException, NumberFormatException {
		String ajid = getDataObjectPkValue(formData);
		String processinstid = formData.getString("processinstid");

		Boolean isSetProcRelaData = true;		
		return null;
	}
	
	/**
	 * @author zhengquan
	 * @time 2019年3月23 11点10分
	 * @description 储存意见表中的数据
	 * @param misOpinion
	 */
	public void saveOpinion(DataObject misOpinion) {
		DatabaseExt.getPrimaryKey(misOpinion);
		DatabaseUtil.insertEntity("default", misOpinion);
	};
	
	/**
	 * @author zhengquan
	 * @Time 2019年3月23 11点12分
	 * @param processinstid
	 * @description 查询意见表中的数据
	 * @return
	 */
	protected DataObject[] queryOpinion(String processinstid){
		DataObject criteriaEntity = DataFactory.INSTANCE.create("com.primeton.das.criteria","criteriaType");
		criteriaEntity.set("_entity","com.primeton.eos.ame_dailyoffice.dailyoffice.MisOpinion");
		criteriaEntity.set("_expr[1]/processinstid",processinstid);
		DataObject [] datas  = DatabaseUtil.queryEntitiesByCriteriaEntity("default", criteriaEntity);
		return datas;
	}

	public DataObject modifyYzProcess(Long workItemID, DataObject misOpinion) throws Exception {
		//获取工作项信息
		WFWorkItem workitem = WorkItemHelper.queryWorkItemDetail(workItemID);
		//更新意见表数据
		Long workitemid = workitem.getWorkItemID();
		String activityInstName = workitem.getActivityInstName();
		String activityId = workitem.getActivityDefID();
		misOpinion.set("workitemid",workitemid.toString());
		misOpinion.set("workitemname",activityInstName);
		misOpinion.set("activitydefid",activityId);
		//获取处理结果
		String auditstatus = misOpinion.getString("auditstatus");
		Long activityInstID = workitem.getActivityInstID();
		IBPSServiceClient bpsServerClient = BPSServiceClientFactory.getDefaultClient();
		IWFProcessInstManager wfProcessInstManager = bpsServerClient.getProcessInstManager();
		Long processinstid = workitem.getProcessInstID();
		//回退标识
		String backFlag = misOpinion.getString("backTo");
		//终止流程
		if("2".equals(auditstatus)){
			wfProcessInstManager.terminateProcessInstance(processinstid);
			return misOpinion;
		}
		//回退到上一个环节
		if(!StringUtils.isEmpty(backFlag)){
			bpsServerClient.getBackActivityManager().backActivity(activityInstID, backFlag, "simple");
			return misOpinion;
		}
		//完成当前环节工作项
		BPFFServiceFactory.getWFWorkItemManager().finishWorkItem(workItemID, false);
		
		return misOpinion;
	}

	/**
	 * @author zhengquan
	 * @time 2019年4月3号19点52分
	 * @param fileIds
	 * @param groupId
	 * @param relationId
	 */
	public void updateFiles(String fileIds, String groupId, String relationId) {
		String [] fileids = fileIds.split(",");
		for (String fileid : fileids) {
			DataObject criteriaEntity = DataObjectUtil.createDataObject("org.gocom.abframe.dataset.tools.AtFileupload");
			criteriaEntity.set("fileId",fileid);
			criteriaEntity.set("relationId",relationId);
			criteriaEntity.set("groupId",groupId);
			DatabaseUtil.updateEntity("default", criteriaEntity);
		}
		
	}
	
	/**
	 * 获取参与者相关的用户信息
	 * @param lstWFParti
	 * @return
	 */
	public List<UserObject> getUserInfoById(List<WFParticipant> lstWFParti) {
		List<String> lstUserId = new ArrayList<String>();
		
		if(!CollectionUtils.isEmpty(lstWFParti)) {
			for(WFParticipant wfpart : lstWFParti) {
				lstUserId.add(wfpart.getId());
			}
		}

		return getUserInfoByEmpId(StringUtil.join(lstUserId.toArray(), ","));
	}
		
	/**
	 * 获取参与者相关的用户信息
	 * @param wfParti
	 * @return
	 */
	public List<UserObject> getUserInfoById(WFParticipant wfParti) {
		return getUserInfoByEmpId(wfParti.getId());
	}
	
	/**
	 * 获取参与者相关的用户信息
	 * @param userId			对应empid，多个使用逗号或者分号分隔
	 * @return
	 */
	public List<UserObject> getUserInfoByEmpId(String userId) {
		List<UserObject> lstUserInfo = new ArrayList<UserObject>();
		
		if(!StringUtils.isBlank(userId)) {
			userId = userId.replace(";", ",");
			DataObject criteria = DataFactory.INSTANCE.create("com.primeton.das.criteria", "criteriaType");
			criteria.set("_entity", "com.primeton.eos.ame_dailyoffice.hygl.OmEmployee");
		//	criteria.set("_expr[1]/empid", userId);
			criteria.set("_expr[1]/userid", userId);
			criteria.set("_expr[1]/_op", "in");
			DataObject[] arrUser = DatabaseUtil.queryEntitiesByCriteriaEntity("default", criteria);
			
			for(DataObject user : arrUser) {
				String userid = user.getString("userid");
				String userMail = user.getString("oemail");
				UserObject uo = new UserObject();
				uo.setUserId(userid);
				uo.setUserMail(userMail);
				lstUserInfo.add(uo);
			}
		}
		
		return lstUserInfo;
	}
	
	/**
	 * 获取参与者相关的用户信息
	 * @param userId			对应empid，多个使用逗号或者分号分隔
	 * @return
	 */
	public List<UserObject> getUserInfoByUserId(String userId) {
		List<UserObject> lstUserInfo = new ArrayList<UserObject>();
		
		if(!StringUtils.isBlank(userId)) {
			userId = userId.replace(";", ",");
			DataObject criteria = DataFactory.INSTANCE.create("com.primeton.das.criteria", "criteriaType");
			criteria.set("_entity", "com.primeton.eos.ame_dailyoffice.hygl.OmEmployee");
			criteria.set("_expr[1]/userid", userId);
			criteria.set("_expr[1]/_op", "in");
			DataObject[] arrUser = DatabaseUtil.queryEntitiesByCriteriaEntity("default", criteria);
			
			for(DataObject user : arrUser) {
				String userid = user.getString("userid");
				String userMail = user.getString("oemail");
				UserObject uo = new UserObject();
				uo.setUserId(userid);
				uo.setUserMail(userMail);
				lstUserInfo.add(uo);
			}
		}
		
		return lstUserInfo;
	}

	public DataObject[] queryBusinessList(String cbName) {
		DataObject criteriaEntity = DataFactory.INSTANCE.create("com.primeton.das.criteria","criteriaType");
		criteriaEntity.set("_entity",cbName);
		DataObject [] sjclxx  = DatabaseUtil.queryEntitiesByCriteriaEntity("default", criteriaEntity);
		return sjclxx;
	}
	
	/**
	 * @author zhengquan
	 * @time 2019-05-14 9:45
	 * @description 简单查询列表数据
	 * @param cbName
	 * @param page
	 * @param criteria
	 * @return
	 */
	public DataObject [] queryListSimply(String cbName,DataObject page,DataObject criteria) {
		//设置分页查询条件
		page.set("isCount",true);
		criteria.set("_entity",cbName);
		DataObject [] sjclxxs  = DatabaseExt.queryEntitiesByCriteriaEntityWithPage("default", criteria , page);
		for (DataObject sjclxx : sjclxxs) {
			String hyszyCh = null;
			if("true".equals(sjclxx.getString("hyszt"))){
				hyszyCh = "正常使用";
			}else{
				hyszyCh = "维护中";
			}
			
			sjclxx.set("hysztch",hyszyCh);
		}
		return sjclxxs;
	}
}
