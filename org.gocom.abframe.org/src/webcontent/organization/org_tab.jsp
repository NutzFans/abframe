<%@page pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>
<%
	String sDeftab="queryCondOrg";	
	Object rootObj = com.eos.web.taglib.util.XpathUtil.getDataContextRoot("request", pageContext);
	String propertyValue=(String)com.eos.web.taglib.util.XpathUtil.getObjectByXpath(rootObj, "sDeftab");
	if(propertyValue!=null && !"".equals(propertyValue)){
		sDeftab=propertyValue;
	};
	
	//获取标签中使用的国际化资源信息
	String title=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("orgSubMaintain_l_title_orgMng");
	String queryCondOrg=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("orgSubMaintain_l_title_queryCondOrg");
	String queryCondEmp=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("orgSubMaintain_l_title_queryCondEmp");
	String modifySelfOrg=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("orgSubMaintain_l_title_modifySelfOrg");
	String maintainSubOrg=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("orgSubMaintain_l_title_maintainSubOrg");
	String maintainSubPosi=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("orgSubMaintain_l_title_maintainSubPosi");
	String maintainEmpOrg=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("orgSubMaintain_l_title_maintainEmpOrg");
	String maintainPowerOrg=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("orgSubMaintain_l_title_maintainPowerOrg");
	%>	
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title><%=title%></title>
</head>
<body topmargin="0" leftmargin="0">
  <w:tabPanel defaultTab="<%=sDeftab%>" id="tabPan" height="100%" width="100%">
	<l:equal property="sNodetype" targetValue="rootorg" >
		<w:tabPage cache="false" id="queryCondOrg" tabType="iframe" title="<%=queryCondOrg%>" url="org.gocom.abframe.org.organization.OrganizationInfo.flow">
			<h:param name="_eosFlowAction" value="queryCondOrg" />			
		</w:tabPage>
		<w:tabPage cache="false" id="queryCondEmp" tabType="iframe" title="<%=queryCondEmp%>" url="org.gocom.abframe.org.organization.OrganizationInfo.flow">
			<h:param name="_eosFlowAction" value="queryCondEmp" />			
		</w:tabPage>
		<l:in property="userObject/userId" scope="session" targetValue="0646">
			<w:tabPage cache="false" id="empDeal" tabType="iframe" title="人员数据转移" url="/abframe/org/emp/emp_deal.jsp"></w:tabPage>
		</l:in>
		<w:tabPage cache="false" id="exportCondEmp" tabType="iframe" title="人员数据导出" url="org.gocom.abframe.org.employee.EmpCondExport.flow">
			<h:param name="_eosFlowAction" value="exportCondEmp" />			
		</w:tabPage>
	</l:equal>
	<l:equal property="sNodetype" targetValue="org" >
		<w:tabPage  cache="true" allowReload="true" tabType="iframe" id="modifySelfOrg" title="<%=modifySelfOrg%>" url="org.gocom.abframe.org.organization.OrganizationInfo.flow">
			<h:param name="_eosFlowAction" value="modifySelfOrg" />
			<h:param name="oOrg/orgid" property="oOrg/orgid" />
			<h:param name="oOrg/orglevel" property="oOrg/orglevel" />
			<h:param name="oOrg/orgseq" property="oOrg/orgseq" />
		</w:tabPage>
		<w:tabPage  cache="true" allowReload="true" tabType="iframe" id="maintainSubOrg" title="<%=maintainSubOrg%>" url="org.gocom.abframe.org.organization.OrganizationInfo.flow">
			<h:param name="_eosFlowAction" value="maintainSubOrg" /> 
			<h:param name="oOrg/orgid" property="oOrg/orgid" />
			<h:param name="oOrg/orglevel" property="oOrg/orglevel" />
			<h:param name="oOrg/orgseq" property="oOrg/orgseq" />
		</w:tabPage>
		<w:tabPage  cache="true" allowReload="true"  id="maintainSubPosi" tabType="iframe" title="<%=maintainSubPosi%>" url="org.gocom.abframe.org.organization.OrganizationInfo.flow">
			<h:param name="_eosFlowAction" value="maintainSubPosi" /> 
			<h:param name="position/omOrganization/orgid"  property="oOrg/orgid" />			
			<h:param name="position/positype"  value="organization" />
		</w:tabPage>
		<w:tabPage cache="true" allowReload="true" id="maintainEmpOrg" tabType="iframe" title="<%=maintainEmpOrg%>" url="org.gocom.abframe.org.organization.OrganizationInfo.flow">
			<h:param name="_eosFlowAction" value="maintainEmpOrg" /> 
			<h:param name="oOrg/orgid" property="oOrg/orgid" />
			<h:param name="oOrg/orglevel" property="oOrg/orglevel" />
			<h:param name="oOrg/orgseq" property="oOrg/orgseq" />			
		</w:tabPage>  
		<w:tabPage cache="true" allowReload="true" id="maintainPowerOrg" tabType="iframe" title="<%=maintainPowerOrg%>" url="org.gocom.abframe.org.organization.OrganizationInfo.flow"  >
  		    <h:param name="_eosFlowAction" value="right" />
			<h:param name="oPartyrole/partytype" value="organization" />
			<h:param name="oPartyrole/partyid" property="oOrg/orgid" />			
		</w:tabPage>
	</l:equal>	
  </w:tabPanel>
</body>
</html>
