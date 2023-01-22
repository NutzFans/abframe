/**
 * 
 */
package com.primeton.eos.ame_dailyoffice;

import java.util.UUID;

import org.apache.commons.lang.ArrayUtils;

import com.eos.data.datacontext.DataContextManager;
import com.eos.data.datacontext.IMUODataContext;
import com.eos.data.datacontext.IUserObject;
import com.eos.foundation.MailInfo;
import com.eos.foundation.database.DatabaseUtil;
import com.eos.foundation.eoscommon.BusinessDictUtil;
import com.eos.foundation.impl.MailInfoImpl;
import com.eos.system.annotation.Bizlet;

import commonj.sdo.DataObject;
import commonj.sdo.helper.DataFactory;

/**
 * @author zhengquan
 * @date 2019-02-28 10:04:19
 *
 */
@Bizlet("")
public class ProcessUtil {

	
	/**数据源：default*/
	public final static String DATASOURCE_DEFAULT = "default";
	/**数据源：OA*/
	public final static String DATASOURCE_OA = "OA";
	
	/**
	 * 获取32位uuid
	 * @return
	 */
	@Bizlet("")
	public static void  getUUID(DataObject obj,String pk){
		String uuid =  getUUID();
		obj.set(pk, uuid); 
	}
	
	/**
	 * 获取32位uuid
	 * @return
	 */
	@Bizlet("")
	public static String  getUUID(){
		 String uuid =  UUID.randomUUID().toString().replaceAll("-", "");
		 return uuid;
	}
	
	
	/**
	 * 根据流程id查询工作项
	 * @param processInstId
	 * @param state
	 * @param isQueryHistory
	 * @return
	 */
	@Bizlet("")
	public static DataObject []  queryWorkItemByProcInstId(long processInstId,String state,boolean isQueryHistory){
		DataObject criteria = DataFactory.INSTANCE.create("com.primeton.das.criteria","criteriaType");
		criteria.set("_entity", "com.eos.workflow.data.WFWorkItem");
		criteria.set("_expr[1]/processInstID",processInstId);
		criteria.set("_expr[2]/currentState", state);
		criteria.set("_expr[2]/_op", "in");
		//查询流程下面正在运行或待领取的工作项
		DataObject [] workItems =  DatabaseUtil.queryEntitiesByCriteriaEntity("default", criteria);
		if(ArrayUtils.isEmpty(workItems) && isQueryHistory){
			criteria = DataFactory.INSTANCE.create("com.primeton.das.criteria","criteriaType");
			criteria.set("_entity", "com.primeton.bps.web.bizform.components.back.backData.WfHWorkitem");
			criteria.set("_expr[1]/processInstID",processInstId);
			workItems =  DatabaseUtil.queryEntitiesByCriteriaEntity(DATASOURCE_DEFAULT, criteria);
		}
		return workItems;
		
	}
	
	public static MailInfo getMailInfo() {
		MailInfo mail = new MailInfoImpl();
		mail.setFrom(BusinessDictUtil.getDictName("AME_SYSCONF", "emailAccount"));
		mail.setPassword(BusinessDictUtil.getDictName("AME_SYSCONF", "emailPassword"));
		mail.setSmtpHost(BusinessDictUtil.getDictName("AME_SYSCONF", "emailSmtpHost"));
		mail.setSmtpPort(Integer.parseInt(BusinessDictUtil.getDictName("AME_SYSCONF", "emailSmtpPort")));
		mail.setUserName(mail.getFrom());
		mail.setMessageFormat("HTML");
		return mail;
	}
	
	
	public static String subStringStr(String str){
		String [] strArray = str.split("\\.");
		
		return strArray[strArray.length-1];
	}
	
	/**
	 * 设置流程相关变量
	 * @param processInstId
	 * @param map
	 * @throws WFServiceException
	 *//*
	@Bizlet("")
	public static void setProcessRelaData(Long processInstId,Map<String,Object> map) throws WFServiceException {
		IWFProcessInstManager processInstManager = BPSServiceClientFactory.getDefaultClient().getProcessInstManager();
		int state = processInstManager.getProcessInstState(processInstId);
		if(null != processInstId && ( ProcessState.RUNNING == state || ProcessState.NOTSTARTED == state)){
			IWFRelativeDataManager WFRelativeDataManager = BPFFServiceFactory.getWFRelativeDataManager();
			WFRelativeDataManager.setRelativeDataBatch(processInstId, map);
		}
	}*/

	 /**
	 * 获取当前登录userObject对象
	 * @return
	 */
	public static IUserObject getCurrUserObject(){
		IMUODataContext muoContext = DataContextManager.current()
				.getMUODataContext();
		IUserObject currUserObject = null;
		if(null != muoContext){
			currUserObject = muoContext.getUserObject();
		}
		return currUserObject;
	}  
	
	/**
	 * @param userid
	 * description 通过userid获取除虚拟部门以外的上级部门
	 * @author zhengquan
	 * @time 2019年04月11日 17点37分
	 * @return
	 */
	@Bizlet("获取部门id和部门名称")
	public DataObject queryOrgDataByUserid(String userid){
		DataObject data = null;
		DataObject criteriaEntity = DataFactory.INSTANCE.create("com.primeton.das.criteria","criteriaType");
		criteriaEntity.set("_entity","com.primeton.eos.ame_dailyoffice.dailyoffice.QueryOrgLevel");
		criteriaEntity.set("_expr[1]/userid",userid);
		DataObject [] datas  = DatabaseUtil.queryEntitiesByCriteriaEntity("default", criteriaEntity);
		if(!ArrayUtils.isEmpty(datas)){
			String orgLevel = datas[0].getString("orglevel");
			String orgid = datas[0].getString("orgid");
			if("5".equals(orgLevel)){
				orgid = datas[0].getString("parentorgid");
			}
			DataObject criteriaEntity1 = DataFactory.INSTANCE.create("com.primeton.das.criteria","criteriaType");
			criteriaEntity1.set("_entity","com.primeton.eos.ame_dailyoffice.dailyoffice.QueryOrgDataPartly");
			criteriaEntity1.set("_expr[1]/orgid",orgid);
			DataObject [] orgDatas  = DatabaseUtil.queryEntitiesByCriteriaEntity("default", criteriaEntity1);
			if(!ArrayUtils.isEmpty(orgDatas)){
				data = orgDatas[0];
			}
		}
		return data;
	}
}
