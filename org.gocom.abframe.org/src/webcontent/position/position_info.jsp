<%@page pageEncoding="UTF-8"%><%
	//岗位基本信息
	String posi_base_info = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("positionManager_l_positionBase");
	//下级岗位
	String sub_position = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("positionManager_l_subPosition");
	//人员列表
	String posi_emp_list =  com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("positionManager_l_positionEmp");
	//岗位权限
	String posi_role = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("positionManager_l_positionRole");
%>
<html>
<head>
<%@include file="/common.jsp"%>
</head>
<body topmargin="0" leftmargin="0">
<l:present property="position/positionid">
	<w:tabPanel id="posiInfoTab"  height="100%"  width="100%">  
	    <w:tabPage cache="true" allowReload="true" id="thisPosiInfo"  tabType="iframe" title="<%=posi_base_info %>" url="org.gocom.abframe.org.position.PositionManager.flow">
	        <h:param name="_eosFlowAction" value="posiBaseInfo"/>  <!--  岗位基本信息 -->
	        <h:param property="position/positionid"/>
	    </w:tabPage>
	    <w:tabPage cache="true" allowReload="true" id="nextPosiList" tabType="iframe" title="<%=sub_position %>" url="org.gocom.abframe.org.position.PositionManager.flow">
	        <h:param name="_eosFlowAction" value="subPosiInfo"/>   <!-- 下级岗位 -->
	        <h:param  property="position/positionid"/>
	        <h:param  property="position/positype"/>
	        <h:param  property="position/omOrganization/orgid"/>
	        <h:param  property="position/omPosition/positionid"/>
	        <h:param  property="position/omDuty/dutyid"/>
	    </w:tabPage>
	    <w:tabPage cache="true" allowReload="true" id="empList" tabType="iframe" title="<%= posi_emp_list%>" url="org.gocom.abframe.org.position.PositionManager.flow">
	        <h:param name="_eosFlowAction" value="empPosList"/>    <!-- 岗位人员  -->
	        <h:param property="position/positionid"/>
	    </w:tabPage>
	    <w:tabPage cache="true" allowReload="true" id="posiPri" tabType="iframe" title="<%=posi_role %>" url="org.gocom.abframe.org.position.PositionManager.flow">
	        <h:param name="_eosFlowAction" value="posiRole"/>      <!-- 岗位权限  -->	    
			<h:param name="oPartyrole/partytype" value="position" />
			<h:param name="oPartyrole/partyid" property="position/positionid" />
	    </w:tabPage>	    
	</w:tabPanel>
</l:present>
</body>
</html>
