<%@page pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>

<%
	//获取标签中使用的国际化资源信息
	String busiList  = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("bizOrgManager_l_title_busidomain_list");  //密码设置
%>

<html>
<head>
<title></title>
</head>
<body topmargin="0" leftmargin="0">
    <w:tabPanel id="menuManagerTab" height="100%" width="100%">
        <w:tabPage id="menuManager" tabType="iframe" title="<%=busiList%>" url="org.gocom.abframe.org.busiorg.BusiDomainMaintain.flow?_eosFlowAction=tab" >
        </w:tabPage>
    </w:tabPanel>
</body>
</html>