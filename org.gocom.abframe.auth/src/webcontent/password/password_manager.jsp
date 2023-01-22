<%@page pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>

<%
	//获取标签中使用的国际化资源信息
	String setPassword  = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("OperatorManager_l_manager_password");  //密码设置
%>

<html>
<head>
<title></title>
</head>
<body topmargin="0" leftmargin="0">
    <w:tabPanel id="passwordManagerTab" height="100%" width="100%">
        <w:tabPage id="passwordManager" tabType="iframe" title="Ame+系统密码设置" url="org.gocom.abframe.auth.PasswordChange.flow?_eosFlowAction=pdw" ><!-- 操作员管理 -->
        </w:tabPage>
    </w:tabPanel>
</body>
</html>