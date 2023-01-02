package org.gocom.bps.wfclient.process;

import com.eos.system.annotation.Bizlet;
import com.eos.workflow.api.BPSServiceClientFactory;
import com.eos.workflow.api.IBPSServiceClient;
import com.eos.workflow.api.IWFDefinitionQueryManager;
import com.primeton.bps.component.manager.api.BPSMgrServiceClientFactory;
import com.primeton.bps.component.manager.api.IBPSMgrServiceClient;
import com.primeton.workflow.api.WFServiceException;
import com.primeton.workflow.bizresource.manager.api.IWFBizCatalog4PermManager;
import com.primeton.workflow.manager.api.IBPSWSManager;

@Bizlet("客户端Facade")
public class WSServiceClientFacade {
	
	@Bizlet("取得管理的BPS客户端")
	public static IBPSServiceClient getWSServiceClient() {
		IBPSServiceClient client = null;
        try {
            client = BPSServiceClientFactory.getDefaultClient();
        } catch (WFServiceException e) {
            throw new RuntimeException("Bps MgrClient[" + "default" + "] is not existed!");
        }
        return client;

	}
	
	@Bizlet("取得管理的BPS客户端")
	public static IBPSMgrServiceClient getWSMgrServiceClient() {
		IBPSMgrServiceClient client = null;
        try {
            client = BPSMgrServiceClientFactory.getDefaultClient();
        } catch (WFServiceException e) {
            throw new RuntimeException("Bps MgrClient[" + "default" + "] is not existed!");
        }
        return client;

	}
	
	@Bizlet("获取Perm业务目录管理服务")
	public static IWFBizCatalog4PermManager getWFBizCatalog4PermManager() {
		return getWSMgrServiceClient().getWFBizCatalog4PermManager();
	}
	
	@Bizlet("获取Workspace管理服务")
	public static IBPSWSManager getBPSWSManager() {
		return getWSMgrServiceClient().getBPSWSManager();
	}
	
	@Bizlet("获取流程管理服务")
	public static  IWFDefinitionQueryManager getDefinitionQueryManager() {
		return getWSServiceClient().getDefinitionQueryManager();
	}
}
