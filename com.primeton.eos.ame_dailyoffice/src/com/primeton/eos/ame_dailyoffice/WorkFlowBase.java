package com.primeton.eos.ame_dailyoffice;

import com.eos.data.datacontext.DataContextManager;
import com.eos.data.datacontext.IMUODataContext;
import com.eos.data.datacontext.IUserObject;
import com.eos.workflow.api.BPSServiceClientFactory;
import com.eos.workflow.api.IBPSServiceClient;
import com.eos.workflow.api.IWFActivityInstManager;
import com.eos.workflow.api.IWFAppointActivityManager;
import com.eos.workflow.api.IWFDefinitionQueryManager;
import com.eos.workflow.api.IWFNotificationManager;
import com.eos.workflow.api.IWFProcessInstManager;
import com.eos.workflow.api.IWFRelativeDataManager;
import com.eos.workflow.api.IWFWorkItemDrawbackManager;
import com.eos.workflow.api.IWFWorkItemManager;
import com.primeton.workflow.api.WFServiceException;

public class WorkFlowBase {

	
	/**启动**/
	public final static String START = "start";
	/**完成**/
	public final static String COMPLETE = "complete";
	/**终止**/
	public final static String TERMINAT = "terminat";
	
	protected  static  IWFProcessInstManager  processInstManager  ;
	protected  static  IWFActivityInstManager activityInstManager ;
	protected  static  IWFWorkItemManager     workItemManager ;
	protected  static  IWFDefinitionQueryManager    definitionQueryManager ;
	protected  static  IWFNotificationManager    notificationManager ;
	protected  static  IWFRelativeDataManager   relativeDataManager ;
	protected  static  IWFWorkItemDrawbackManager   drawBackManager ;
	protected  static  IWFAppointActivityManager   appointActivityManager ;

	static {
		try {
			IBPSServiceClient client = BPSServiceClientFactory.getDefaultClient();
			processInstManager = client.getProcessInstManager();
			activityInstManager = client.getActivityInstManager();
			workItemManager = client.getWorkItemManager();
			definitionQueryManager = 	client.getDefinitionQueryManager();
			notificationManager = client.getNotificationManager();
			relativeDataManager = client.getRelativeDataManager();
			drawBackManager = client.getWorkItemDrawbackManager();
			appointActivityManager = client.getAppointActivityManager();
		} catch (WFServiceException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
	}
	 /**
		 * 获取当前登录userObject对象
		 * @return
		 */
	public static IUserObject getCurrUserObject(){
		IMUODataContext muoContext = DataContextManager.current()
				.getMUODataContext();
		IUserObject currUserObject = muoContext.getUserObject();
		return currUserObject;
	}


}
