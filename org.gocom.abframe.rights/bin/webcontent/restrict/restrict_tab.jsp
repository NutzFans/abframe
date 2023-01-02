<%@page pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>
<html>
<head>
<title></title>
<%
	//约束管理
    String restrictManager = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("restrictManager_l_title_restrictManager");
%>
</head>
<body leftmargin="0" topmargin="0">
    <w:tabPanel id="restrict" height="100%" width="100%">
        <w:tabPage id="restrictManager" tabType="iframe" title="<%=restrictManager %>" url="org.gocom.abframe.rights.RestrictManager.flow?_eosFlowAction=restrict" >
        </w:tabPage>
    </w:tabPanel>
</body>
</html>