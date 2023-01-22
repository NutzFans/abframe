<%@page pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>
<%
	//获取标签中使用的国际化资源信息
	String function_query = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("applicationManager_l_functionQuery");
    String select = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("l_query_select");
           
%>
<html>
<head>
<title></title>
</head>
<body leftmargin="0" topmargin="0" >
<%--queryform configurationID:20080812110718 --%>
<h:form name="func_queryform" action="org.gocom.abframe.rights.application.FunctionManager.flow" checkType="blur" target="result" method="post" onsubmit="return checkForm(this);">
  <input type="hidden" name="_eosFlowAction" value="queryExcute"/>
  <w:panel id="panel1" width="100%" title="<%= function_query %>">
    <table align="center" border="0" width="100%" class="form_table">
      <tr>
        <td class="form_label">
          <b:message key="applicationManager_AcFunction.funcname"></b:message><b:message key="l_colon"></b:message>
        </td>
        <td colspan="1">
          <h:text property="function/_expr[1]/funcname"/>
          <h:hidden property="function/_expr[1]/_op" value="like"/>
          <h:hidden property="function/_expr[1]/_likeRule" value="all"/>
        </td>
        <td class="form_label">
          <b:message key="applicationManager_AcFunction.functype"></b:message><b:message key="l_colon"></b:message>
        </td>
        <td colspan="1">
          <d:select dictTypeId="ABF_FUNCTYPE" property="function/_expr[2]/functype" nullLabel="<%= select %>" style="width:133"/>
          <h:hidden property="function/_expr[2]/_op" value="="/>
        </td>
        <td class="form_label">
          <b:message key="applicationManager_AcFunction.parentFuncGroup"></b:message><b:message key="l_colon"></b:message>
        </td>
        <td colspan="1">
          <h:select id="funcGroup_select" property="function/_expr[3]/acFuncgroup.funcgroupid" style="width:133">
            <option value=""><b:message key="l_query_select"></b:message></option>            
			<h:options labelField="funcgroupname" valueField="funcgroupid" property="funcGroups"/>
		  </h:select>
          <h:hidden property="function/_expr[3]/_op" value="="/>  
        </td>
      </tr>
      <tr class="form_bottom">
        <td colspan="6" class="form_bottom">
          <input type="hidden" name="function/_entity" value="org.gocom.abframe.dataset.privilege.AcFunction">
          <b:message key="l_display_per_page"></b:message>
          <h:text size="2" property="page/length" value="10" validateAttr="minValue=1;maxValue=100;type=integer;isNull=true" />
          <input type="hidden" name="page/begin" value="0">
          <input type="hidden" name="page/isCount" value="true">
          <input type="submit" class="button" value='<b:message key="l_query"></b:message>'>
          <input type="submit" class="button" value='<b:message key="l_reset"></b:message>' onclick="javascript:document.forms['func_queryform'].reset(); return false;">
        </td>
      </tr>
    </table>
  </w:panel>
  <h:hidden property="function/_orderby[1]/_sort" value="asc"/>
  <h:hidden property="function/_orderby[1]/_property" value="funcname"/>
  <h:hidden property="function/_orderby[2]/_sort" value="asc"/>
  <h:hidden property="function/_orderby[2]/_property" value="functype"/>
  <h:hidden property="function/_orderby[3]/_sort" value="asc"/>
  <h:hidden property="function/_orderby[3]/_property" value="acFuncgroup.funcgroupname"/>
</h:form>
<iframe width="100%" height="800" marginHeight="0" scrolling="no" frameBorder="0" marginWidth="0" name="result"></iframe>
</body>
</html>
<script type="text/javascript">

  function query(){		
		document.func_queryform.submit();
	} // 提交form表单
  
  function custInit() {
      query();
  }
     //初始化页面按钮样
     eventManager.add(window,"load",custInit); 
     
</script>