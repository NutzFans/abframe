<%@page pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>
<html>
<%
	//获取标签中使用的国际化资源信息
	String title=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("orgSubMaintain_l_title_modifyPosi");
	String pleaseSelect=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("l_pleaseSelect");
	String selectUpperPosi=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("orgSubMaintain_l_title_selectUpperPosi");
	String selectPosi=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("orgSubMaintain_l_title_selectPosi");
	String selectDuty=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("orgSubMaintain_l_title_selectDuty");
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title><%=title%></title>
</head>
<body topmargin="0" leftmargin="0">

<h:form name="dataform1" action="org.gocom.abframe.org.organization.PosiSelfModify.flow" checkType="blur" target="_self" method="post" onsubmit="return checkForm(this);">
	<input type="hidden" name="_eosFlowAction" value="mdf" />

	<w:panel id="panel1" width="100%" title="修改岗位">
		<table align="center" border="0" width="100%" class="form_table">
			<h:hidden property="oPosi/omOrganization/orgid" />
			<tr>
				<td class="form_label" width="15%"><!--所属机构-->
          			<b:message key="orgSubMaintain_OmPosition.omOrganization.orgid"/><b:message key="l_colon"/>
				</td>
				<td colspan="1" width="35%"><h:text property="oPosi/omOrganization/orgname" readonly="true"/></td>
				<td class="form_label" width="15%"><!--上级岗位-->
          			<b:message key="orgSubMaintain_OmPosition.omPosition.positionid"/><b:message key="l_colon"/>
				</td>
				<td colspan="1">
              		<w:lookup property="oPosi/omPosition/positionid" disabled="true" validateAttr="allowNull=true;message=上级岗位可以为空" readonly="true" displayProperty="oPosi/omPosition/posiname" lookupUrl="/abframe/org/position/position_tree.jsp" dialogTitle="<%=selectUpperPosi%>" width="350" height="430"></w:lookup>
              	</td>
			</tr>
			<tr>
				<td class="form_label"><!--岗位名称-->
          			<b:message key="orgSubMaintain_OmPosition.positionid"/><b:message key="l_colon"/>
				</td>
				<td colspan="1">
              		<w:lookup property="oPosi/positionid" disabled="true" validateAttr="allowNull=false;message=岗位不能为空" readonly="false" displayProperty="oPosi/posiname" lookupUrl="/abframe/org/position/position_tree.jsp" dialogTitle="<%=selectPosi%>" width="350" height="430"></w:lookup>
				</td>
			</tr>
			<tr>
				<td class="form_label"><!--职务ID-->
          			<b:message key="orgSubMaintain_OmPosition.omDuty.dutyid"/><b:message key="l_colon"/>
				<td colspan="1">
              		<w:lookup property="oPosi/omDuty/dutyid" disabled="true" validateAttr="allowNull=false;message=职务不能为空" readonly="false" displayProperty="oPosi/omDuty/dutyname" lookupUrl="/abframe/org/duty/duty_tree.jsp" dialogTitle="<%=selectDuty%>" width="350" height="430"></w:lookup>
				</td>		
				<td class="form_label"><!--岗位状态-->
          			<b:message key="orgSubMaintain_OmPosition.status"/><b:message key="l_colon"/>
				</td>
				<td colspan="1"><d:select dictTypeId="ABF_POSISTATUS" property="oPosi/status" style="width:133" nullLabel="<%=pleaseSelect%>"/></td>
			</tr>
			<tr>
				<td class="form_label"><!--生效日期-->
          			<b:message key="orgSubMaintain_OmPosition.startdate"/><b:message key="l_colon"/>
				</td>
				<td colspan="1"><w:date property="oPosi/startdate" /></td>			
				<td class="form_label"><!--失效日期-->
          			<b:message key="orgSubMaintain_OmPosition.enddate"/><b:message key="l_colon"/>
				
				</td>
				<td colspan="1"><w:date property="oPosi/enddate" /></td>			
			</tr>		
			<tr class="form_bottom">
				<td colspan="4">
					<input type="submit" class="button" value="<b:message key='l_save' />"> 
				</td>
			</tr>
		</table>
	</w:panel>
</h:form>

</body>
</html>
