<%@page pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>

<%
	//获取标签中使用的国际化资源信息
	String opershort = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("opershortcutManager_l_opershortcutQuery"); //快捷菜单查询
%>
<html>
<head>
<title></title>
</head>
<body topmargin="0" leftmargin="0">
    <w:tabPanel id="opershortManagerTab" height="100%" width="100%">
        <w:tabPage id="opershortManager" tabType="iframe" title="<%=opershort%>" url="org.gocom.abframe.rights.menu.OpershortcutManager.flow?_eosFlowAction=query" >
        </w:tabPage>
    </w:tabPanel>
</body>
</html>