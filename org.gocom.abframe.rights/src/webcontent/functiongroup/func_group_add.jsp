<%@page pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>
<html>
<head>
<script>
	function saveFuncGroup()
	{
		var frm = $name("subFuncGroup_dataform");
        
        //表单验证
        if( !checkForm(frm) ) {
            return;
        }
        
	    var myAjax = null;
	    var message;
	    
		//调用增加逻辑流
		myAjax = new Ajax("org.gocom.abframe.rights.application.FuncGroupManager.addFuncGroup.biz");
		message = '<b:message key="applicationManager_l_funcGroupAdd"/>' + '<b:message key="applicationManager_m_addFuncGroup_failure"/>';//新增应用处理失败。
	    
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
<title></title>
</head>
<body leftmargin="0" topmargin="0" style="overflow: auto;">
<%--dataform configurationID:20080812203124 --%>
<h:form name="subFuncGroup_dataform" action="org.gocom.abframe.rights.application.FunctionGroupManager.flow" method="post"  onsubmit="return checkForm(this);">
<input type="hidden" name="_eosFlowAction" value="addExcute">
  <h:hidden property="subFuncGroup/funcgroupid" />
  <h:hidden name="funcGroup/acApplication/appid" property="appid"/>
    <table align="center" border="0" width="100%" class="form_table">
      <tr>
        <td class="form_label" width="20%">
          <b:message key="applicationManager_AcFuncGroup.funcgroupname"></b:message><b:message key="l_colon"></b:message>
        </td>
        <td colspan="1">
          <h:text property="funcGroup/funcgroupname" validateAttr="allowNull=false;"/><font style="color:red">*</font>
        </td>
      </tr>
      <tr class="form_bottom">
        <td colspan="6">
          <input type="button" class="button" value='<b:message key="l_save"></b:message>' onclick="saveFuncGroup();">
          <input type="button" class="button" value='<b:message key="l_close"></b:message>' onclick="javascript:window.close();"><!-- 关闭 -->
        </td>
      </tr>
    </table>
</h:form>
</body>
</html>