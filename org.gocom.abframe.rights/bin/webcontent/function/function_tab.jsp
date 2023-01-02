<%@page pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>

<html>
<head>
<title></title>

<%
	//获取标签中使用的国际化资源信息
	String function_list = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("applicationManager_l_function_list");
    String funcResource_list = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("applicationManager_l_funcResource_list");
            
%>

</head>
<body leftmargin="0" topmargin="0" rightmargin="0">
<w:tabPanel height="100%" id="function_panel" width="100%" defaultTab="functionInfo">

  <w:tabPage cache="false" id="functionInfo" tabType="iframe" title="<%= function_list %>" url="org.gocom.abframe.rights.application.ResourceManager.flow">
    <h:param name = "_eosFlowAction" value = "queryFuncInfo"/>
    <h:param name = "funccode" property = "funccode"/>
  </w:tabPage>

  <w:tabPage cache="false" id="funcResourceList" tabType="iframe" title="<%= funcResource_list %>" url="org.gocom.abframe.rights.application.ResourceManager.flow">
    <h:param name = "_eosFlowAction" value = "queryFuncResources"/>
    <h:param name = "funccode" property = "funccode"/>
  </w:tabPage>
  
</w:tabPanel>
</body>
</html>