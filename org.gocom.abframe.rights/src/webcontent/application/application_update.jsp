<%@page pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>

<%
String illegalIP = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("m_illegalIP");
String attributeIP="type=IP;allowNull=true;message="+illegalIP;

String illegalPort = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("m_illegalPort");
String attributePort="maxLength=5;minLength=1;allowNull=true;minValue=0;maxValue=65535;type=port;message="+illegalPort;



%>
<html>
<head>
<title></title>
<script>
  function getAppcode(obj){
    var code = obj.value;
    document.appUpdate_datafrm.appcodeTemp.value = code;
  } //取应用代码的初始值

  function checkInputName(obj){

    if(obj.value != document.appUpdate_datafrm.appcodeTemp.value){  //  如果做了修改，判断修改过的应用代码是否唯一
      var myAjax = new Ajax("org.gocom.abframe.rights.ApplicationManager.queryApplicationByAppcode.biz");
      myAjax.addParam("appTemp/appcode",obj.value);
      myAjax.submit();
      var returnValue = myAjax.getValue("/root/data/isValid");

	  if(returnValue == -1){
	    f_alert(obj,'<b:message key="applicationManager_m_addUpdateApp_isValid"></b:message>');
	    $id("save_btn").disabled = true;
	    return false;
	  }
	  else {

	    $id("save_btn").disabled = false;
	    return true;
	  }

      checkInput(obj);
    }
    else{
    $id("save_btn").disabled = false;
    return true; // 应用代码没有作修改，不进行唯一性校验
    checkInput(obj);
    }
  }

  function submit(){
    appUpdate_datafrm.submit(); // 提交form表单
  }
  </script>
</head>
<body onload = "getAppcode(document.appUpdate_datafrm.funccode)" topmargin="0" leftmargin="0">
<h:form name="appUpdate_datafrm" action="org.gocom.abframe.rights.application.ApplicationManager.flow" method="post">
<input type="hidden" name="_eosFlowAction" value="updateExcute">
<h:hidden property="appExpand/appid"/>
<input type="hidden" id="appcodeTemp" name="appcodeTemp" /> <!-- 应用代码唯一性校验 -->
  <table align="center" border="0" width="100%" class="form_table">
    <tr>
      <td class="form_label">
        <b:message key="applicationManager_AcApplication.appname"></b:message><b:message key="l_colon"></b:message>
      </td>
      <td colspan="1">
        <h:text property="appExpand/appname"/>
      </td>
      <td class="form_label">
        <b:message key="applicationManager_AcApplication.appcode"></b:message><b:message key="l_colon"></b:message>
      </td>
      <td colspan="1">
        <h:text id="funccode" property="appExpand/appcode" onblur="checkInputName(this)"/>
      </td>
    </tr>
    <tr>
      <td class="form_label">
        <b:message key="applicationManager_AcApplication.apptype"></b:message><b:message key="l_colon"></b:message>
      </td>
      <td colspan="1">
        <d:select dictTypeId="ABF_APPTYPE" property="appExpand/apptype"/>
      </td>
      <td class="form_label">
        <b:message key="applicationManager_AcApplication.isopen"></b:message><b:message key="l_colon"></b:message>
      </td>
      <td colspan="1">
        <d:select dictTypeId="ABF_YESORNO" style="width:133" property="acapplication/isopen"/>
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
        <h:text property="appExpand/ipaddr"  validateAttr="<%=attributeIP %>" onblur="checkInput(this)"/>
      </td>
      <td class="form_label">
        <b:message key="applicationManager_AcApplication.ipport"></b:message><b:message key="l_colon"></b:message>
      </td>
      <td colspan="1">
        <h:text property="appExpand/ipport" validateAttr="<%=attributePort %>" onblur="checkInput(this)"/>
      </td>
    </tr>
	<tr>
      <td class="form_label">
        <b:message key="applicationManager_AcApplication.appdesc"></b:message><b:message key="l_colon"></b:message>
      </td>
      <td colspan="3">
        <h:text property="appExpand/appdesc"/>
      </td>
    </tr>
    <tr class="form_bottom">
      <td colspan="6">
        <input id="save_btn" type="button" value='<b:message key="l_save"></b:message>' onclick="javascript:submit();">
        <input type="submit" class="button" value='<b:message key="l_reset"></b:message>' onclick="javascript:document.forms['appUpdate_datafrm'].reset(); return false;">
      </td>
    </tr>
  </table>
</h:form>
</body>
</html>