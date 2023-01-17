<%@page pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>
<html>
<head>
<title></title>

<%
	//获取标签中使用的国际化资源信息
	String application_info = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("applicationManager_l_application_info");
    String funcGroup_list = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("applicationManager_l_funcGroup_list");
           
%>

</head>
<body  leftmargin="0" topmargin="0" rightmargin="0" >
<w:tabPanel height="100%" id="application_panel" width="100%" defaultTab="applicationInfo">

  <w:tabPage cache="false" id="applicationInfo" tabType="iframe" title="<%= application_info %>" url="org.gocom.abframe.rights.application.ApplicationManager.flow">
    <h:param name = "_eosFlowAction" value = "queryById"/>
    <h:param name = "appid" property = "appid"/>
  </w:tabPage>

  <w:tabPage cache="false" id="funcGroupList" tabType="iframe" title="<%= funcGroup_list %>" url="org.gocom.abframe.rights.application.ApplicationManager.flow">
    <h:param name = "_eosFlowAction" value = "queryFuncGroups"/>
    <h:param name = "appid" property = "appid"/>
  </w:tabPage>
  
</w:tabPanel>
</body>
</html>