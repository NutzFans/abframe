<%@page pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>

<html>
<head>
<title></title>

<%
	//职务基本信息
	String duty_base_info = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("dutyManager_l_title_dutyBaseInfo");
	//下级职务
	String sub_duty = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("dutyManager_l_title_subDuty");
	//职务人员
	String duty_emp =  com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("dutyManager_l_title_dutyEmp");
	//职务权限
	String duty_role = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("dutyManager_l_title_dutyRole");
	//职务列表
	String duty_list = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("dutyManager_l_dutyList");
%>

</head>
<body topmargin="0" leftmargin="0">
<l:present property="duty/dutyid">
	<w:tabPanel id="dutyInfoTab"  height="100%"  width="100%">
	    <w:tabPage  id="thisDutyInfo"  tabType="iframe" title="<%=duty_base_info %>" url="org.gocom.abframe.org.duty.DutyInfo.flow">
	        <h:param name="_eosFlowAction" value="dutyBaseInfo"/>
	        <h:param name="duty/dutyid" property="duty/dutyid"/>
	        <h:param name="duty/dutytype" property="duty/dutytype"/>
	    </w:tabPage>
	    <w:tabPage id="nextDutyList" tabType="iframe" title="<%=sub_duty %>" url="org.gocom.abframe.org.duty.DutyInfo.flow">
	        <h:param name="duty/dutyid" property="duty/dutyid"/>
	        <h:param name="_eosFlowAction" value="subDutyInfo"/>
	        <h:param name="duty/dutytype" property="duty/dutytype"/>
	    </w:tabPage>
	    <w:tabPage id="empList" tabType="iframe" title="<%=duty_emp %>" url="org.gocom.abframe.org.duty.DutyInfo.flow">
	        <h:param name="duty/dutyid" property="duty/dutyid"/>
	        <h:param name="_eosFlowAction" value="empDutyList"/>
	        <h:param name="duty/dutytype" property="duty/dutytype"/>
	    </w:tabPage>
	    <w:tabPage id="dutyRole" tabType="iframe" title="<%=duty_role %>" url="org.gocom.abframe.org.duty.DutyInfo.flow">
	        <h:param name="duty/dutyid" property="duty/dutyid"/>
	        <h:param name="_eosFlowAction" value="dutyRole"/>
	        <h:param name="duty/dutytype" property="duty/dutytype"/>
	    </w:tabPage>
	</w:tabPanel>
</l:present>
<l:notPresent property="duty/dutyid">
    <w:tabPanel id="dutyInfoList" height="100%" width="100%">
        <w:tabPage id="dutyList" tabType="iframe" title="<%=duty_list %>" url="org.gocom.abframe.org.duty.DutyMain.flow">
        	<h:param name="_eosFlowAction" value="begin"/>
        	<h:param name="duty/dutytype" property="duty/dutytype"/>
        </w:tabPage>
    </w:tabPanel>
</l:notPresent>

</body>
</html>
