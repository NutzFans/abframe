<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@include file="/common.jsp"%>
<%	//获取标签中使用的国际化资源信息
	String function_info = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("applicationManager_l_function_info");
%>
<html>
<head>
<title></title>
<script>   
  <l:present property="isRefreshParent">	
	<l:equal property="isRefreshParent" targetValue="true">
      parent.parent.IFRAMEAppFuncTree.DTree.getRootNode().reloadChild();
	</l:equal>	
  </l:present>	// 动态树新增、修改操作后刷新父节点
  
</script>
</head>
<body leftmargin="0" topmargin="0" >
<%--dataform configurationID:20080814200927 --%>
<h:form name="function_dataform" action="org.gocom.abframe.rights.application.ResourceManager.flow" method="post">
  <input type="hidden" name="_eosFlowAction" value="updateFuncInfo"/>
  <h:hidden property="funccode"/>
    <table align="center" border="0" width="100%" class="form_table">
      <tr>
       <td colspan="6" class="eos-panel-title">&nbsp;&nbsp;<%=function_info%></td>
      </tr>
      <tr>
        <td class="form_label">
          <b:message key="applicationManager_AcFunction.funcname"></b:message><b:message key="l_colon"></b:message>
        </td>
        <td >
          <h:text property="function/funcname" validateAttr="allowNull=false;"/><font style="color:red">*</font>
        </td>
        <td class="form_label">
          <b:message key="applicationManager_AcFunction.funccode"></b:message><b:message key="l_colon"></b:message>
        </td>
        <td >
          <h:text property="function/funccode" readonly="true"/><font style="color:red">*</font>
        </td>
      </tr>
      <tr>
        <td class="form_label">
          <b:message key="applicationManager_AcFunction.functype"></b:message><b:message key="l_colon"></b:message>
        </td>
        <td >
          <d:select property="function/functype" dictTypeId="ABF_FUNCTYPE" style="width:133"/>
        </td>
        <td class="form_label">
          <b:message key="applicationManager_AcFunction.ismenu"></b:message><b:message key="l_colon"></b:message>
        </td>
        <td >
          <d:select property="function/ismenu" dictTypeId="ABF_YESORNO" style="width:133"/>
        </td>
      </tr>
      <tr>
        <td class="form_label">
          <b:message key="applicationManager_AcFunction.funcaction"></b:message><b:message key="l_colon"></b:message>
        </td>
        <td colspan="3">
          <h:text property="function/funcaction" style="width:100%"/>
        </td>
    </tr>
      <tr>
        <td class="form_label">
          <b:message key="applicationManager_AcFunction.parainfo"></b:message><b:message key="l_colon"></b:message>
        </td>
        <td colspan="3">
          <h:text property="function/parainfo" style="width:100%"/>
        </td>
      </tr>
      
      <tr>
        <td class="form_label">
          <b:message key="applicationManager_AcFunction.funcdesc"></b:message><b:message key="l_colon"></b:message>
        </td>
        <td colspan="3">
          <h:text property="function/funcdesc" style="width:100%"/>
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