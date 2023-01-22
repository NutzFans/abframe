<%@page pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>

<html>
<head>
<title></title>

<%
	//获取标签中使用的国际化资源信息
	String function_update = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("applicationManager_l_functionUpdate");
           
%>

<script>
  
  function getFunccode(obj){
    code = obj.value;
    document.funcUpdate_dataform.funccodeTemp.value = code;
  } //页面加载时获取原始功能代码
    
  function checkInputName(obj){
    if(document.funcUpdate_dataform.funccodeTemp.value != obj.value){
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
      checkInpu(obj);
    }
    else{
      $id("save_btn").disabled = false;
      return true;
      checkInpu(obj);
    }
  } // 功能代码唯一性校验
  
  function doUpdate(){
   //funcUpdate_dataform.submit();
      var myAjax = new Ajax("org.gocom.abframe.rights.application.FunctionManager.updateFunction.biz");
	  var frm = $name("funcUpdate_dataform");        
      if(checkForm(frm))
          myAjax.submitForm(frm);     
          
      var returnValue = myAjax.getValue("/root/data/isSuccess");
      if(returnValue == -1){
        alert('<b:message key="applicationManager_m_updatefunc_failure"/>');
        $id("save_btn").disabled = true;
        return false;
      }
      else{
        alert('<b:message key="applicationManager_m_updatefunc_success"/>');
        window.close();
        return true;
      }
  } //提交form表单
</script>
</head>
<body onload = "getFunccode(document.funcUpdate_dataform.funccode)">
<%--dataform configurationID:20080814142618 --%>
<h:form  name="funcUpdate_dataform" action="org.gocom.abframe.rights.application.FunctionManager.flow" method="post">
<input type="hidden" name="_eosFlowAction" value="update">
<input type="hidden" name="funccodeTemp" value="funccodeTemp">
  <h:hidden property="acfunction/funccode"/>
  <h:hidden property="funcgroupid"/>
    <table align="center" border="0" width="100%" class="form_table">
      <tr>
        <td class="form_label" nowrap="nowrap">
          <b:message key="applicationManager_AcFunction.funcname"></b:message><b:message key="l_colon"></b:message>
        </td>
        <td colspan="1">
          <h:text property="acfunction/funcname" validateAttr="allowNull=false"/><font style="color:red">*</font>
        </td>
        <td class="form_label" nowrap="nowrap">
          <b:message key="applicationManager_AcFunction.funccode"></b:message><b:message key="l_colon"></b:message>
        </td>
        <td colspan="1">
          <h:text id="funccode" property="acfunction/funccode" validateAttr="allowNull=false" readonly="true" onblur="checkInputName(this)"/><font style="color:red">*</font>
        </td> 
      </tr>
      <tr>
        <td class="form_label" nowrap="nowrap">
          <b:message key="applicationManager_AcFunction.functype"></b:message><b:message key="l_colon"></b:message>
        </td>
        <td colspan="1">
          <d:select property="acfunction/functype" dictTypeId="ABF_APPTYPE" style="width: 90%"/>
        </td>
        <td class="form_label" nowrap="nowrap">
          <b:message key="applicationManager_AcFunction.ismenu"></b:message><b:message key="l_colon"></b:message>
        </td>
        <td colspan="1">
          <d:select property="acfunction/ismenu" dictTypeId="ABF_YESORNO" style="width:133"/>
        </td>
      </tr>
      <tr>
        <td class="form_label" nowrap="nowrap">
           <b:message key="applicationManager_AcFunction.funcaction"></b:message><b:message key="l_colon"></b:message>
        </td>
        <td colspan="3">
          <h:text property="acfunction/funcaction" style="width:96%"/>
        </td>
      </tr>
      <tr>
        <td class="form_label" nowrap="nowrap">
          <b:message key="applicationManager_AcFunction.parainfo"></b:message><b:message key="l_colon"></b:message>
        </td>
        <td colspan="3">
          <h:text property="acfunction/parainfo" style="width:96%"/>
        </td>
      </tr>
      <tr>
        <td class="form_label" nowrap="nowrap">
          <b:message key="applicationManager_AcFunction.funcdesc"></b:message><b:message key="l_colon"></b:message>
        </td>
        <td colspan="3">
          <h:text property="acfunction/funcdesc" style="width:96%"/>
        </td>
      </tr>
      <tr class="form_bottom">
        <td colspan="6">
          <input id="save_btn" type="button" value='<b:message key="l_save"></b:message>' onclick="javascript:doUpdate();">
          <input type="button" class="button" value='<b:message key="l_close"></b:message>' onclick="javascript:window.close();"><!-- 关闭 -->
        </td>
      </tr>
    </table>
</h:form>
</body>
</html>