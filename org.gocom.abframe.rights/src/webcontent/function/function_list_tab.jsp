<%@page pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>

<html>
<head>
<title></title>

<%
	//获取标签中使用的国际化资源信息
	String function_list = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("applicationManager_l_function_list");
           
%>

</head>
<body leftmargin="0" topmargin="0">
<w:tabPanel height="100%" id="funcList_panel" width="100%">

  <w:tabPage cache="false" id="funcGroupList" tabType="iframe" title="<%= function_list %>" url="org.gocom.abframe.rights.application.FunctionManager.flow">
    <h:param name = "_eosFlowAction" value = "query"/>
  </w:tabPage>
  
</w:tabPanel>
</body>
</html>