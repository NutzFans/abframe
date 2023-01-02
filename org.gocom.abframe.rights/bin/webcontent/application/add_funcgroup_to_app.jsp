<%@page pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>

<html>
<head>
<title></title>

<l:equal property="retCode" targetValue="1" compareType="string" scope="request" >
<script>
  window['returnValue'] = $id("funcGroup_id").value;
  alert('<b:message key="applicationManager_m_addFuncGroup_success"></b:message>');
  window.close(); //关闭新增功能组弹出页面
</script>
</l:equal>

<l:lessThan property="retCode" targetValue="0" compareType="string" scope="request">
<b:message key="applicationManager_m_addFuncGroup_failure"></b:message>
</l:lessThan>
</head>
<body class="eos-panel-table">
<%--dataform configurationID:20080812203124 --%>
<h:form name="subFuncGroup_dataform" action="org.gocom.abframe.rights.application.FuncGroupAdd.flow" method="post">
<input type="hidden" name="_eosFlowAction" value="addExcute">
  <h:hidden id = "funcGroup_id" property = "funcGroup/funcgroupid"/>
  <h:hidden id = "appication_id" property="appid"/>
 
    <table align="center" border="0" width="446" class="form_table">
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
        <td colspan="3">
          <d:select dictTypeId="ABF_YESORNO" property="funcGroup/isleaf" value="y" style="width:133"/>
        </td>
      </tr>
      <tr class="form_bottom">
        <td colspan="6">
          <input type="submit" class="button" value='<b:message key="l_save"></b:message>'>&nbsp;
          <input type="submit" class="button" value='<b:message key="l_close"></b:message>' onclick="javascript:window.close();">
        </td>
      </tr>
    </table>
 
</h:form>
</body>
</html>