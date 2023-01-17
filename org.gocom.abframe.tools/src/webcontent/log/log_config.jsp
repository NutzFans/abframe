<%@page pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>

<html>
<head>
<title><b:message key="configManager_l_title_configLog"></b:message> </title>

<%
	//业务日志管理
    String logManager = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("configManager_l_title_logManager");
    //配置业务日志
    String configLog = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("configManager_l_title_configLog");
 %>

</head>
<body topmargin="0" leftmargin="0">
    <w:tabPanel id="logConfig" height="100%" width="100%">
        <w:tabPage id="operLogConfig" tabType="iframe" title="<%=logManager %>" url="org.gocom.abframe.tools.OperlogManager.flow">
        </w:tabPage>
        <w:tabPage id="operConfig" tabType="iframe" title="<%=configLog %>" url="org.gocom.abframe.tools.OperlogManager.flow?_eosFlowAction=config">
        </w:tabPage>
    </w:tabPanel>
</body>
</html>