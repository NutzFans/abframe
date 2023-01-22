<%@page pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>
<%
	//人员基本信息
	String baseinfoTitle=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("orgSubMaintain_l_title_modifyEmpOpr");
	//所属机构
	String empBelongTitle=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("orgSubMaintain_l_title_maintainEmpBelong");
	//人员权限
	String rightTitle=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("orgSubMaintain_l_title_maintainPowerEmp");
%>
<html>
<body topmargin="0" leftmargin="0">
	<w:tabPanel id="posiInfoTab"  height="100%"  width="100%">  
		<w:tabPage cache="true" allowReload="true" id="baseinfo" tabType="iframe" title="<%=baseinfoTitle%>" url="org.gocom.abframe.org.employee.EmployeeManager.flow">
			<h:param name="_eosFlowAction" value="baseinfo" />
			<h:param name="emp/empid" property="emp/empid" />
		</w:tabPage>
		<w:tabPage cache="true" allowReload="true" id="empBelong" tabType="iframe" title="<%=empBelongTitle%>" url="org.gocom.abframe.org.employee.EmployeeManager.flow">
		    <h:param name="_eosFlowAction" value="empBelong" />
			<h:param name="emp/empid" property="emp/empid" />
		</w:tabPage>
		<l:present property="emp/operatorid">
			<w:tabPage cache="true" allowReload="true" id="right" tabType="iframe" title="<%=rightTitle%>" url="org.gocom.abframe.org.employee.EmployeeManager.flow">
			    <h:param name="_eosFlowAction" value="right" />
			    <h:param name="oPartyrole/partytype" value="employee" />
				<h:param name="oPartyrole/partyid" property="emp/empid" />
			</w:tabPage>
		</l:present>   
	</w:tabPanel>
</body>
</html>
