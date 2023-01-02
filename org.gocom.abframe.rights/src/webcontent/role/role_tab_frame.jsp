<%@page pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>
<html>
<body leftmargin="0" topmargin="0" rightmargin="0" bottommargin="0">
<%
	//获取默认Tab项
	String defaultTab="operatorQuery";
	//操作员
	String operator = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("roleManager_l_title_operator");
	//机构
	String organization = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("roleManager_l_title_organization");
	//工作组
	String workgroup = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("roleManager_l_title_workgroup");
	//岗位
	String position = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("roleManager_l_title_position");
	//职务
	String duty = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("roleManager_l_title_duty");
 %>

<w:tabPanel bodyStyle="" defaultTab="<%=defaultTab%>" height="100%" id="orgInfo" titleStyle="" width="100%">
  <w:tabPage cache="false" id="operatorQuery" tabType="iframe" title="<%=operator %>" url="org.gocom.abframe.rights.role.AssignRole.flow">    <!-- 操作员 -->
  	<h:param name="_eosFlowAction" value="operatorQuery"/>
  	<h:param name="acRole/roleid" property="acRole/roleid"/>
  	<h:param name="acRole/roletype" property="acRole/roletype"/>
  </w:tabPage>
  <w:tabPage cache="false" id="orgQuery" tabType="iframe" title="<%=organization %>" url="org.gocom.abframe.rights.role.AssignRole.flow">    <!-- 机构 -->
  <h:param name="_eosFlowAction" value="orgQuery"/>
   <h:param name="acRole/roleid" property="acRole/roleid"/>
   <h:param name="isAjaxSubmit" value="true"/>
  </w:tabPage>

  <w:tabPage cache="false" id="groupQuery" tabType="iframe" title="<%=workgroup %>" url="org.gocom.abframe.rights.role.AssignRole.flow">    <!-- 工作组 -->
  <h:param name="_eosFlowAction" value="groupQuery"/>
   <h:param name="acRole/roleid" property="acRole/roleid"/>   
  </w:tabPage>
  
  <w:tabPage cache="false" id="positionQuery" tabType="iframe" title="<%=position %>" url="org.gocom.abframe.rights.role.AssignRole.flow">    <!-- 岗位 -->
  <h:param name="_eosFlowAction" value="positionQuery"/>
   <h:param name="acRole/roleid" property="acRole/roleid"/>   
  </w:tabPage>

  <w:tabPage cache="false" id="dutyQuery" tabType="iframe" title="<%=duty %>" url="org.gocom.abframe.rights.role.AssignRole.flow">    <!-- 职务 -->
  <h:param name="_eosFlowAction" value="dutyQuery"/>
   <h:param name="acRole/roleid" property="acRole/roleid"/>  
  </w:tabPage>
</w:tabPanel>
</body>
</html>