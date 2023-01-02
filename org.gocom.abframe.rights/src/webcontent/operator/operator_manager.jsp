<%@page pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>

<%
	//获取标签中使用的国际化资源信息
	String operator = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("OperatorManager_l_operator"); //操作员
	String manager  = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("OperatorManager_l_manager");  //管理
%>
<html>
<head>
<title><b:message key="OperatorManager_l_operator"></b:message><b:message key="OperatorManager_l_manager"></b:message></title><!-- 操作员管理 -->
</head>
<body topmargin="0" leftmargin="0">
    <w:tabPanel id="operatorManagerTab" height="100%" width="100%">
        <w:tabPage id="operatorManager" tabType="iframe" title="<%=operator + manager%>" url="org.gocom.abframe.rights.OperatorManager.flow?_eosFlowAction=query" ><!-- 操作员管理 -->
        </w:tabPage>
    </w:tabPanel>
</body>
</html>