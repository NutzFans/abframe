<%@page pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>
<html>
<head>
<title></title>

<%
	//获取标签中使用的国际化资源信息
	String funcGroup_update = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("applicationManager_l_funcGroupUpdate");
           
%>
</head>
<body>
<h:form name="updateFuncGroup" action="org.gocom.abframe.rights.application.FunctionGroupManager.flow" method="post">
<input type="hidden" name="_eosFlowAction" value="updateExcute">
<h:hidden id = "funcGroup_id" property="funcGroup/funcgroupid"/>
<%--dataform configurationID:20080813160302 --%>
<w:panel id="panel1" width="100%" title="<%= funcGroup_update %>">
  <table align="center" border="0" width="100%" class="form_table">
    <tr>
      <td class="form_label">
        <b:message key="applicationManager_AcFuncGroup.funcgroupname"></b:message><b:message key="l_colon"></b:message>
      </td>
      <td colspan="1">
        <h:text property="funcGroup/funcgroupname"/>
      </td>
      <td class="form_label">
        <b:message key="applicationManager_AcFuncGroup.isleaf"></b:message><b:message key="l_colon"></b:message>
      </td>
      <td colspan="1">
        <d:select dictTypeId="ABF_YESORNO" property="funcGroup/isleaf" style="width:133"/>
      </td>
    </tr>
    <tr>
      <td class="form_label">
        <b:message key="applicationManager_AcFunction.parentFuncGroup"></b:message><b:message key="l_colon"></b:message>
      </td>
      <td colspan="3">
        <b:write property = "funcgroupid"/>
      </td>
    </tr>
    <tr class="form_bottom">
      <td colspan="6">
        <input type="submit" class="button" value='<b:message key="l_save"></b:message>'>
        <input type="submit" class="button" value='<b:message key="l_reset"></b:message>' onclick="javascript:document.forms['updateFuncGroup'].reset(); return false;">
      </td>
    </tr>
  </table>
</w:panel>
</h:form>
</body>
<script>
  <l:present property="isRefreshNode">	
	<l:equal property="isRefreshNode" targetValue="true">
      parent.parent.IFRAMEAppFuncTree.DTree.getSelectNode().reloadChild();
	</l:equal>	
  </l:present>	
</script>
<l:equal property="isSuccess" targetValue="1" compareType="number" scope="request" >
<script>
  window['returnValue'] = $id("funcGroup_id").value;
  window.close();
</script>
</l:equal>

<l:lessThan property="isSuccess" targetValue="-1" compareType="number" scope="request">
<b:message key="applicationManager_m_updatefuncGroup_failure"></b:message>
</l:lessThan>
</html>