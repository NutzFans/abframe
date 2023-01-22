<%@page pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>
<html>
<%
	String defaultTab="orgList";

	//获取标签中使用的国际化资源信息
	String title=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("organizationmapManager_l_title_organization_list");
%>
<head>
<title><%=title%></title><!--组织机构列表  -->
</head>
<body topmargin="0" leftmargin="0">
<w:tabPanel bodyStyle="" defaultTab="<%=defaultTab%>" height="500" id="orgmapTab" titleStyle="" width="100%">
	<w:tabPage cache="false" id="orgList" tabType="iframe" title="<%=title%>" url="org.gocom.abframe.org.OrganizationmapManager.flow">
		<h:param name="_eosFlowAction" value="queryOrg" />						
	</w:tabPage>
</w:tabPanel>
</body>
</html>