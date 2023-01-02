<%@page pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>

<html>
<head>
<title> <b:message key="opershortcutManager_l_title_opershortcut_query" /> </title>

<%
    String shortcutManager = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("opershortcutManager_l_title_opershortcut_query");
%>

</head>
<body leftmargin="0" topmargin="0">
    <w:tabPanel id="opershortcut" height="100%" width="100%"> <!-- 快捷菜单维护 -->
        <w:tabPage id="queryShortcut" tabType="iframe" title="<%=shortcutManager %>" url="org.gocom.abframe.rights.menu.OpershortcutManager.flow?_eosFlowAction=query" >
        </w:tabPage>
    </w:tabPanel>
</body>
</html>