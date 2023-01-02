<%@page pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>
<html>
<head>
<title></title>
</head>
<body leftmargin="0" topmargin="0">
<% 
	//获取默认Tab项
	String str = request.getParameter("currentTab"); 
	//功能权限
	String func = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("roleManager_l_title_funcPrivilege");
	//String data = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("roleManager_l_title_dataPrivilege");
	//权限分配
	String assign = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("roleManager_l_title_privilegeAssign");
%>
<script>
   /*
    * 选中功能权限Tab
    */
   function selectFunc() {      
       parent.currentTab = "func";
   }
   /*
    * 选中权限分配Tab
    */
   function selectAssign() {         
       parent.currentTab = "assign";
   }
</script> 
<w:tabPanel id="roleAuth" defaultTab="@currentTab" >
  <w:tabPage id="func" tabType="iframe" title="<%=func %>"  url="org.gocom.abframe.rights.role.PrivilegeManager.flow" onSelectFunc="selectFunc">    <!-- 功能权限 -->
    <h:param name="acRole/roleid" property="acRole/roleid"/>
    <h:param name="acRole/appid" property="acRole/appid"/>
  </w:tabPage>
  <%--<w:tabPage id="data" tabType="iframe" title="<%=data %>" url=""></w:tabPage>--%>    <!-- 数据权限 -->
  <w:tabPage id="assign" tabType="iframe" title="<%=assign %>"  url="org.gocom.abframe.rights.role.AssignRole.flow" onSelectFunc="selectAssign">    <!-- 权限分配 -->
    <h:param name="acRole/roleid" property="acRole/roleid"/>
    <h:param name="acRole/appid" property="acRole/appid"/>
  </w:tabPage>  
  </w:tabPanel>
</body>
</html>