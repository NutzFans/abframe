<%@page pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>

<html>
<head>
<title></title>

<%
	//获取标签中使用的国际化资源信息
	String application_query = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("applicationManager_l_applicationQuery");
    String select = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("l_query_select");

%>

<script type="text/javascript">
  <l:present property="isRefreshRoot">
	<l:equal property="isRefreshRoot" targetValue="true">
	   window.parent.parent.parent.frames["IFRAMEAppFuncTree"].DTree.getRootNode().reloadChild(); // 刷新动态树
	</l:equal>
  </l:present>

  function query(){
		document.appQuery.submit();
	}// 提交form表单


  function custInit() {
      query();
  }
</script>

</head>
<body leftmargin="0" topmargin="0" style="overflow: auto">
<h:form name="appQuery" action="org.gocom.abframe.rights.application.ApplicationManager.flow" method="post" target="result">
<input type="hidden" name="_eosFlowAction" value="queryAllExcute">
<%--queryform configurationID:20080807094235 --%>
<w:panel id="panel1" title="<%= application_query %>">
  <table align="center" border="0" width="100%" class="form_table">
    <tr>
      <td class="form_label">
        <b:message key="applicationManager_AcApplication.appname"></b:message><b:message key="l_colon"></b:message>
      </td>
      <td colspan="1">
        <h:text property="application/_expr[1]/appname"/>
        <h:hidden property="application/_expr[1]/_op" value="like"/>
        <h:hidden property="application/_expr[1]/_likeRule" value="all"/>
      </td>
      <td class="form_label">
        <b:message key="applicationManager_AcApplication.apptype"></b:message><b:message key="l_colon"></b:message>
      </td>
      <td colspan="3">
        <d:select dictTypeId="ABF_APPTYPE" property="application/_expr[2]/apptype" nullLabel="<%= select %>" style="width:133"/>
        <h:hidden property="application/_expr[2]/_op" value="="/>
      </td>
    </tr>
    <tr class="form_bottom">
      <td colspan="6" class="form_bottom">
        <input type="hidden" name="application/_entity" value="org.gocom.abframe.dataset.privilege.AcApplication">
        <b:message key="l_display_per_page"></b:message>
        <h:text size="2" property="page/length" value="10" validateAttr="minValue=1;maxValue=100;type=integer;isNull=true" />
        <input type="hidden" name="page/begin" value="0">
        <input type="hidden" name="page/isCount" value="true">
        <input type="submit" class="button" value='<b:message key="l_query"></b:message>'>
        <input type="submit" class="button" value='<b:message key="l_reset"></b:message>' onclick="javascript:document.forms['appQuery'].reset(); return false;">
      </td>
    </tr>
  </table>
</w:panel>
<h:hidden property="application/_orderby[1]/_sort" value="asc"/>
<h:hidden property="application/_orderby[1]/_property" value="appid"/>
</h:form>
<iframe width="100%" marginHeight="0" height="396" scrolling="no" frameBorder="0" marginWidth="0" name="result"></iframe>
</body>
</html>

<script>
     //初始化页面按钮样式
     eventManager.add(window,"load",custInit);
</script>