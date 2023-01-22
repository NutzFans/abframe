<%@page pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>

<%
	//获取标签中使用的国际化资源信息
	String menurebuild = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("menuRebuild_l_userCustMenu"); //个人菜单重组
%>
<html>
<head>
<title></title>
</head>
<body topmargin="0" leftmargin="0">
    <w:tabPanel id="menurebuildManagerTab" height="100%" width="100%">
        <w:tabPage id="menurebuildManager" tabType="iframe" title="<%=menurebuild%>" url="org.gocom.abframe.rights.menu.MenuRebuild.flow?_eosFlowAction=tab" >
        </w:tabPage>
    </w:tabPanel>
</body>
</html>