<%@page pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>
<html>
<head>
<title></title>
</head>
<body class="eos-panel-table">
<h:form name="updateFuncGroup" action="org.gocom.abframe.rights.application.FuncGroupUpdate.flow" method="post">
<input type="hidden" name="_eosFlowAction" value="updateExcute">
<h:hidden id = "funcGroup_id" property="funcGroup/funcgroupid"/>
<%--dataform configurationID:20080813160302 --%>

  <table align="center" border="0" width="100%" class="form_table">
    <tr>
      <td class="form_label">
        <b:message key="applicationManager_AcFuncGroup.funcgroupname"></b:message><b:message key="l_colon"></b:message>
      </td>
      <td colspan="1">
        <h:text property="funcGroup/funcgroupname"/>
      </td>
      <td class="form_label">
        <b:message key="applicationManager_AcFunction.parentFuncGroup"></b:message><b:message key="l_colon"></b:message>
      </td>
      <td colspan="3" width="30%">
        <b:write property = "funcGroup/acFuncgroup/funcgroupname"/>
      </td>
    </tr>
    <tr class="form_bottom">
      <td colspan="6">
        <input type="submit" class="button" value='<b:message key="l_save"></b:message>'>
        <input type="submit" class="button" value='<b:message key="l_close"></b:message>' onclick="javascript:window.close();">
      </td>
    </tr>
  </table>

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
  alert('<b:message key="applicationManager_m_updatefuncGroup_success"></b:message>');
  window.close();
</script>
</l:equal>

<l:lessThan property="isSuccess" targetValue="-1" compareType="number" scope="request">
<b:message key="applicationManager_m_updatefuncGroup_failure"></b:message>
</l:lessThan>
</html>