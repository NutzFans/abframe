<%@page pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>

<html>
<head>
<title></title>

<%
	//获取标签中使用的国际化资源信息
	String illegalIP = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("m_illegalIP");
	String attributeIP="type=IP;allowNull=true;message="+illegalIP;
	String illegalPort = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("m_illegalPort");
	String attributePort="maxLength=5;minLength=1;allowNull=true;minValue=0;maxValue=65535;type=port;message="+illegalPort;
%>

<script>
  	function checkInputName(obj){
    	var myAjax = new Ajax("org.gocom.abframe.rights.application.ApplicationManager.queryApplicationByAppcode.biz");
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
  	
	// 应用代码唯一性校验
  	function submit(){
    	appAdd.submit();
  	} 
	
	function saveApp()
	{
		var frm = $name("appAdd");
        
        //表单验证
        if( !checkForm(frm) ) {
            return;
        }
        
	    var myAjax = null;
	    var message;
	    
	    //判断修改还是新增
		if($name("_eosFlowAction").value == "insertSubmit")
		{
			//调用增加逻辑流
			myAjax = new Ajax("org.gocom.abframe.rights.application.ApplicationManager.addApplication.biz");
			message = '<b:message key="applicationManager_l_applicationAdd"/>' + '<b:message key="applicationManager_m_addFuncGroup_failure"/>';//新增应用处理失败。
	    }else{
	    	myAjax = new Ajax("org.gocom.abframe.rights.application.ApplicationManager.updateApplication.biz");
			message = '<b:message key="applicationManager_l_applicationUpdate"/>' + '<b:message key="applicationManager_m_addFuncGroup_failure"/>';//新增应用处理失败。
	    } 
	    //开始调用
	    myAjax.submitForm(frm);
	    
	    //取得调用后的结果(xml对象)
	    var returnNode =myAjax.getResponseXMLDom();
	     
	    var reCode;
	    if(returnNode)
	    {
	    	//获取指定的节点值
	    	reCode = myAjax.getValue("/root/data/retCode");
	    }
	    
	    //判断刷新业务字典信息成败
    	if(reCode == 1)
	    {
	    	alert('<b:message key="l_m_save_success"></b:message>'); //保存成功。
    		window.close();
	    }else{
    		alert(message);
    		return false;
    	}
    	
    	window.close();
	}
</script>
</head>
<body class="eos-panel-table" >
<%--dataform configurationID:20080806180425 --%>
<h:form name="appAdd" action="org.gocom.abframe.rights.application.ApplicationManager.flow" method="post" onsubmit="return checkForm(this);">
  <l:equal property="_eosLastAccessAction" targetValue="update">
    <input type="hidden" name="_eosFlowAction" value="updateSubmit" >
   	<h:hidden property="acapplication/appid"/>
  </l:equal>
  <l:equal property="_eosLastAccessAction" targetValue="add">
    <input type="hidden" name="_eosFlowAction" value="insertSubmit" >
  </l:equal>
  <table align="center" border="0" width="100%" class="form_table">
    <tr>
      <td class="form_label" nowrap="nowrap">
        <b:message key="applicationManager_AcApplication.appname"></b:message><b:message key="l_colon"></b:message>
      </td>
      <td colspan="1">
        <h:text property="acapplication/appname" validateAttr="maxLength=50;allowNull=false;"/><font style="color:red">*</font>
      </td>
      <td class="form_label" nowrap="nowrap">
        <b:message key="applicationManager_AcApplication.appcode"></b:message><b:message key="l_colon"></b:message>
      </td>
      <td colspan="1">
        <h:text id="appcode" property="acapplication/appcode" onblur="checkInputName(this)" validateAttr="maxLength=10;allowNull=false;"/><font style="color:red">*</font>
      </td>
    </tr>
    <tr>
      <td class="form_label" nowrap="nowrap">
        <b:message key="applicationManager_AcApplication.apptype"></b:message><b:message key="l_colon"></b:message>
      </td>
      <td colspan="1">
        <d:select dictTypeId="ABF_APPTYPE" property="acapplication/apptype" style="width:133"/>
      </td>
      <td class="form_label" nowrap="nowrap">
        <b:message key="applicationManager_AcApplication.isopen"></b:message><b:message key="l_colon"></b:message>
      </td>
      <td colspan="1">
        <d:select dictTypeId="ABF_YESORNO" property="acapplication/isopen" value="y" style="width:133"/>
      </td>
    </tr>
    <tr>
      <td class="form_label" nowrap="nowrap">
        <b:message key="applicationManager_AcApplication.opendate"></b:message><b:message key="l_colon"></b:message>
      </td>
      <td colspan="1">
        <w:date property="acapplication/opendate"/>
      </td>
      <td class="form_label" nowrap="nowrap">
        <b:message key="applicationManager_AcApplication.url"></b:message><b:message key="l_colon"></b:message>
      </td>
      <td colspan="1">
        <h:text property="acapplication/url" validateAttr="maxLength=256;"/>
      </td>
    </tr>
    <tr>
      <td class="form_label" nowrap="nowrap">
        <b:message key="applicationManager_AcApplication.ipaddr"></b:message><b:message key="l_colon"></b:message>
      </td>
      <td colspan="1">
        <h:text property="acapplication/ipaddr"  validateAttr="<%=attributeIP %>" onblur="checkInput(this)"/>
      </td>
      <td class="form_label" nowrap="nowrap">
        <b:message key="applicationManager_AcApplication.ipport"></b:message><b:message key="l_colon"></b:message>
      </td>
      <td colspan="1">
        <h:text property="acapplication/ipport" validateAttr="<%=attributePort %>" onblur="checkInput(this)"/>
      </td>
    </tr>
    <tr>
      <td class="form_label" nowrap="nowrap">
        <b:message key="applicationManager_AcApplication.appdesc"></b:message><b:message key="l_colon"></b:message>
      </td>
      <td colspan="3">
        <h:text property="acapplication/appdesc" style="width: 92%" validateAttr="maxLength=512;"/>
      </td>
    </tr>
    <tr class="form_bottom">
      <td colspan="6">
        <input id="save_btn" class="button" type="button" value='<b:message key="l_save"></b:message>' onclick="saveApp();">
        <input type="button" class="button" value='<b:message key="l_close"></b:message>' onclick="javascript:window.close();"><!-- 关闭 -->
      </td>
    </tr>
  </table>
</h:form>
</body>
</html>