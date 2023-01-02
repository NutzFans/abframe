<%@page pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>

<html>
<head>
<title></title>

<script>
  
  function checkInputName(obj){
    var myAjax = new Ajax("org.gocom.abframe.rights.application.FunctionManager.queryFunctionByFunccode.biz");
    myAjax.addParam("functionTemp/funccode",obj.value);
    myAjax.submit();
    var returnValue = myAjax.getValue("/root/data/isValid");
    if(returnValue == -1){
      f_alert(obj,'<b:message key="applicationManager_m_addUpdateFunc_isValid"></b:message>');
      $id("save_btn").disabled = true;
      return false;
    }
    else{
      $id("save_btn").disabled = false;
      return true;
    }
    checkInput(obj);
  } // 功能代码唯一性校验
  
  function submit(){
    function_datafrm.submit();
    window.close();
  } //提交form表单
</script>

<script>
  <l:present property="isRefreshNode">	
	<l:equal property="isRefreshNode" targetValue="true">
      parent.IFRAMEAppFuncTree.DTree.getSelectNode().reloadChild(); //刷新动态树节点
	</l:equal>	
  </l:present>	
</script>

<l:equal property="isSuccess" targetValue="1" compareType="number" scope="request" >
<script>
  alert('<b:message key="applicationManager_m_addfunc_success"></b:message>');
  window.close(); //关闭新增功能弹出页面
</script>
</l:equal>

<l:lessThan property="isSuccess" targetValue="-1" compareType="number" scope="request">
<b:message key="applicationManager_m_addfunc_failure"></b:message>
</l:lessThan>
</head>
<body class="eos-panel-table">
<h:form name="function_datafrm" action="org.gocom.abframe.rights.application.FunctionAdd.flow" method="post">
<input type="hidden" name="_eosFlowAction" value="addExcute">
<h:hidden id = "funcGroup_id" property="funcgroupid"/>
<%--dataform configurationID:20080814114029 --%>

  <table align="center" border="0" width="100%" class="form_table">
    <tr>
      <td class="form_label" nowrap="nowrap">
        <b:message key="applicationManager_AcFunction.funcname"></b:message><b:message key="l_colon"></b:message>
      </td>
      <td colspan="1">
        <h:text property="function/funcname" validateAttr="maxLength=128;allowNull=false;"/><font style="color:red">*</font>
      </td>
      <td class="form_label" nowrap="nowrap">
        <b:message key="applicationManager_AcFunction.funccode"></b:message><b:message key="l_colon"></b:message>
      </td>
      <td colspan="1">
        <h:text property="function/funccode" validateAttr="maxLength=40;allowNull=false" onblur="checkInputName(this)"/><font style="color:red">*</font>
      </td>
    </tr>
    <tr>
      <td class="form_label" nowrap="nowrap">
        <b:message key="applicationManager_AcFunction.functype"></b:message><b:message key="l_colon"></b:message>
      </td>
      <td colspan="1">
        <d:select dictTypeId="ABF_FUNCTYPE" property="function/functype" style="width:133"/>
      </td>
      <td class="form_label" nowrap="nowrap">
        <b:message key="applicationManager_AcFunction.ismenu"></b:message><b:message key="l_colon"></b:message>
      </td>
      <td colspan="1">
        <d:select property="function/ismenu" dictTypeId="ABF_YESORNO" value="n" style="width:133"/>
      </td>
    </tr>
    <tr>
      <td class="form_label" nowrap="nowrap">
        <b:message key="applicationManager_AcFunction.funcaction"></b:message><b:message key="l_colon"></b:message>
      </td>
      <td colspan="3">
        <h:text property="function/funcaction" style="width:96%"/>
      </td>
    </tr>
    <tr>
      <td class="form_label" nowrap="nowrap">
        <b:message key="applicationManager_AcFunction.parainfo"></b:message><b:message key="l_colon"></b:message>
      </td>
      <td colspan="3">
        <h:text property="function/parainfo" style="width:96%"/>
      </td>
    </tr>
    <tr>
      <td class="form_label" nowrap="nowrap">
        <b:message key="applicationManager_AcFunction.funcdesc"></b:message><b:message key="l_colon"></b:message>
      </td>
      <td colspan="3">
        <h:text property="function/funcdesc" style="width:96%"/>
      </td>
    </tr>
    <tr class="form_bottom">
      <td colspan="6">
        <input id="save_btn" type="button" class="button" value='<b:message key="l_save"></b:message>' onclick="javascript:submit();">
        <input type="submit" class="button" value='<b:message key="l_close"></b:message>' onclick="javascript:window.close();">
      </td>
    </tr>
  </table>

</h:form>
</body>
</html>