<%@page pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>

<html>
<head>
<title></title>

<%
	//获取标签中使用的国际化资源信息
	String application_list = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("applicationManager_l_applicationList");
           
%>

</head>
<body leftmargin="0" topmargin="0" style="overflow: auto">
<w:tabPanel height="100%" id="applications_panel" width="100%">
  <w:tabPage cache="false" id="appList" tabType="iframe" title="<%= application_list %>" url="org.gocom.abframe.rights.application.ApplicationManager.flow">
    <h:param name = "_eosFlowAction" value = "queryAll"/>
  </w:tabPage>
</w:tabPanel>
</body>
</html>