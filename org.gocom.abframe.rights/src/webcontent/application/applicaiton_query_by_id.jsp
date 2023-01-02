<%@page pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>

<html>
<head>
<title></title>

<%
	//获取标签中使用的国际化资源信息
	String application_info = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("applicationManager_l_applicationInfo");
           
%>

<script> 
  
  <l:present property="isRefreshRoot">	
	<l:equal property="isRefreshRoot" targetValue="true">
      window.parent.parent.frames["IFRAMEAppFuncTree"].location.reload();
	</l:equal>	
  </l:present> // 修改应用信息刷新动态树root节点

</script>
</head>
<body leftmargin="0" topmargin="0" >
<h:form name="appUpdate_datafrm" action="org.gocom.abframe.rights.application.ApplicationManager.flow" method="post">
<input type="hidden" name="_eosFlowAction" value="updateInfo">
<h:hidden property = "appid"/>
<%--dataform configurationID:20080807133351 --%>
  <table align="center" border="0" width="100%" class="form_table">
    <tr>
       <td colspan="6" class="eos-panel-title">&nbsp;&nbsp;<%=application_info%></td>
    </tr>
    <tr>
      <td class="form_label">
        <b:message key="applicationManager_AcApplication.appname"></b:message><b:message key="l_colon"></b:message>
      </td>
      <td colspan="1">
        <h:text property="appExpand/appname" validateAttr="allowNull=false;"/><font style="color:red">*</font>
      </td>
      <td class="form_label">
        <b:message key="applicationManager_AcApplication.appcode"></b:message><b:message key="l_colon"></b:message>
      </td>
      <td colspan="1">
        <h:text property="appExpand/appcode" readonly="true" /><font style="color:red">*</font>
      </td>
    </tr>
    <tr>
      <td class="form_label">
        <b:message key="applicationManager_AcApplication.apptype"></b:message><b:message key="l_colon"></b:message>
      </td>
      <td colspan="1">
        <d:select property="appExpand/apptype" dictTypeId="ABF_APPTYPE" style="width:133"/>
      </td>
      <td class="form_label">
        <b:message key="applicationManager_AcApplication.isopen"></b:message><b:message key="l_colon"></b:message>
      </td>
      <td colspan="1">
        <d:select property="appExpand/isopen" dictTypeId="ABF_YESORNO" style="width:133"/>
      </td>
    </tr>
    <tr>
      <td class="form_label">
        <b:message key="applicationManager_AcApplication.opendate"></b:message><b:message key="l_colon"></b:message>
      </td>
      <td colspan="1">
        <w:date property="appExpand/opendate"/>
      </td>
      <td class="form_label">
        <b:message key="applicationManager_AcApplication.url"></b:message><b:message key="l_colon"></b:message>
      </td>
      <td colspan="1">
        <h:text property="appExpand/url"/>
      </td>
    </tr>
    <tr>
      <td class="form_label">
        <b:message key="applicationManager_AcApplication.ipaddr"></b:message><b:message key="l_colon"></b:message>
      </td>
      <td colspan="1">
        <h:text property="appExpand/ipaddr"/>
      </td>
      <td class="form_label">
        <b:message key="applicationManager_AcApplication.ipport"></b:message><b:message key="l_colon"></b:message>
      </td>
      <td colspan="1">
        <h:text property="appExpand/ipport"/>
      </td>
    </tr>
    <tr>
      <td class="form_label">
        <b:message key="applicationManager_AcApplication.appdesc"></b:message><b:message key="l_colon"></b:message>
      </td>
      <td colspan="3">
        <h:text property="appExpand/appdesc" size="78"/>
      </td>
    </tr>
    <tr class="form_bottom">
      <td colspan="6">
        <input type="submit" class="button" value='<b:message key="l_save"></b:message>'>
      </td>
    </tr>
  </table>
</h:form>
</body>
</html>