<%@page pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>
<html>
<head>
<title></title>
</head>
<body class="eos-panel-table">
<%--dataform configurationID:20080815143000 --%>
<h:form name="funcReourceUpdate_dataform" action="org.gocom.abframe.rights.application.ResourceUpdate.flow" method="post">
  <h:hidden property="funcResource/resid"/>
  <h:hidden id = "function_code" property="funccode"/>
  <input type="hidden" name="_eosFlowAction" value="updateExcute"/>

    <table align="center" border="0" width="100%" class="form_table">     
      <tr>
        <td class="form_label" nowrap="nowrap">
          <b:message key="applicationManager_AcFuncresource.restype"></b:message><b:message key="l_colon"></b:message>
        </td>
        <td colspan="1">
          <d:select property="funcResource/restype" dictTypeId="ABF_RESOURCETYPE" style="width:133"/>
        </td>
        <td class="form_label" nowrap="nowrap">
          <b:message key="applicationManager_AcFuncresource.resname"></b:message><b:message key="l_colon"></b:message>
        </td>
        <td colspan="1">
          <h:text property="funcResource/resname"/>
        </td>
      </tr>
      <tr>
        <td class="form_label">
          <b:message key="applicationManager_AcFuncresource.respath"></b:message><b:message key="l_colon"></b:message>
        </td>
        <td colspan="3">
          <h:text property="funcResource/respath" style="width:92%"/>
        </td>
      </tr>
      <tr class="form_bottom">
        <td colspan="6">
          <input type="submit" class="button" value='<b:message key="l_save"></b:message>'>
          <input type="button" class="button" value='<b:message key="l_close"></b:message>' onclick="javascript:window.close();">
        </td>
      </tr>
    </table>

</h:form>
<l:equal property="funcResourcUpdate_result" targetValue="1" compareType="number" scope="request" >
<script>
  window['returnValue'] = $id("function_code").value;
  alert('<b:message key="applicationManager_m_updatefuncResource_success"></b:message>');
  window.close();
</script>
</l:equal>

<l:lessThan property="funcResourcUpdate_result" targetValue="0" compareType="number" scope="request">
<b:message key="applicationManager_m_addfuncResource_failure"></b:message>
</l:lessThan>
</body>
</html>