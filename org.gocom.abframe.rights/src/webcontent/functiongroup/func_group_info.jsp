<%@page pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>
<html>
<head>
<title></title>

<%
	//获取标签中使用的国际化资源信息
	String function_info = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("applicationManager_l_function_info");      
%>

</head>
<body leftmargin="0" topmargin="0" >
<h:form name="funcGroupUpdate_datafrm" action="org.gocom.abframe.rights.application.FunctionGroupManager.flow" method="post">
<input type="hidden" name="_eosFlowAction" value="updateInfo">
<h:hidden property = "appid"/>
<h:hidden property = "funcgroupid"/>
<%--dataform configurationID:20080812171944 --%>
  <table align="center" border="0" width="100%" class="form_table">
    <tr>
       <td colspan="6" class="eos-panel-title">&nbsp;&nbsp;<%=function_info%></td>
    </tr>
    <tr>
      <td class="form_label">
        <b:message key="applicationManager_AcFuncGroup.funcgroupname"></b:message><b:message key="l_colon"></b:message>
      </td>
      <td colspan="1">
        <h:text property="funcGroup/funcgroupname" validateAttr="allowNull=false;"/><font style="color:red">*</font>
      </td>
      <td class="form_label">
        <b:message key="applicationManager_AcFunction.parentFuncGroup"></b:message><b:message key="l_colon"></b:message>
      </td>
      <td colspan="1" width="30%">
        <b:write property="funcGroup/acFuncgroup/funcgroupname"/>
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
<script> 
	// 动态树新增、修改操作后刷新父节点
  	<l:present property="isRefreshParent">	
		<l:equal property="isRefreshParent" targetValue="true">
      		parent.parent.IFRAMEAppFuncTree.DTree.getRootNode().reloadChild();
		</l:equal>	
  	</l:present>	
</script>
</html>