<%@page pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>
<html>
<head>
<title></title>

<%
	//获取标签中使用的国际化资源信息
	String funcGroup_info = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("applicationManager_l_funcGroup_info");
    String subFuncGroup_list = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("applicationManager_l_subFuncGroup_list");
    String function_list = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("applicationManager_l_function_list");
            
%>

</head>
<body leftmargin="0" topmargin="0" rightmargin="0">
<w:tabPanel height="100%" id="funcGroup_panel" width="100%">
  
  <w:tabPage cache="false" id="funcGroupInfo" tabType="iframe" title="<%= funcGroup_info %>" url="org.gocom.abframe.rights.application.FunctionGroupManager.flow">
    <h:param name="_eosFlowAction" value="query"/>
    <h:param name="funcgroupid" property="funcgroupid"/>
  </w:tabPage>
  
  <w:tabPage cache="false" id="sunFuncGroup" tabType="iframe" title="<%= subFuncGroup_list %>" url="org.gocom.abframe.rights.application.FunctionGroupManager.flow">
    <h:param name="_eosFlowAction" value="querySubFuncGroup"/>
    <h:param name="funcgroupid" property="funcgroupid"/>
  </w:tabPage>

  <w:tabPage cache="false" id="funcList" tabType="iframe" title="<%= function_list %>" url="org.gocom.abframe.rights.application.FunctionManager.flow">
    <h:param name="_eosFlowAction" value="queryByFuncGroup"/>
    <h:param name="funcgroupid" property="funcgroupid"/>   
  </w:tabPage>
  
</w:tabPanel>
</body>
</html>