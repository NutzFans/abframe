<%@page pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>

<%
	//获取标签中使用的国际化资源信息
	String meunQuery  = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("menuManager_l_query");  //密码设置
%>

<html>
<head>
<title></title>
</head>
<body topmargin="0" leftmargin="0">
    <w:tabPanel id="menuManagerTab" height="100%" width="100%">
        <w:tabPage id="menuManager" tabType="iframe" title="<%=meunQuery%>" url="org.gocom.abframe.rights.menu.MenuQuery.flow?_eosFlowAction=tab" >
        </w:tabPage>
    </w:tabPanel>
</body>
</html>