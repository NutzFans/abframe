<%@page pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>
<html>
<%
	//获取标签中使用的国际化资源信息
	String title=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("menuRebuild_l_addCustMenu");
	String panelTitle=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("menuRebuild_l_custMenuInput");
%>
<head>
<title><%=title %></title><!--新增重组菜单 -->
</head>
<body style="margin-top:0px">
<h:form name="dataform1" action="org.gocom.abframe.rights.menu.MenuRebuild.flow" method="post" checkType="blur" onsubmit="return checkForm(this);">
   <l:equal property="_eosLastAccessAction" targetValue="updateCustmenu">
      <input type="hidden" name="_eosFlowAction" value="updateSubmit" >
  </l:equal>
  <l:equal property="_eosLastAccessAction" targetValue="addSubCustmenu">
    <input type="hidden" name="_eosFlowAction" value="insertSubmit" >
  </l:equal>
  <h:hidden property="upMenu/menuid"/>
  <h:hidden property="custmenu/menuid"/>
    <table align="center" border="0" width="100%" class="form_table">
      <tr>
        <td  class="form_label">
          <b:message key = 'menuManager_l_AcMenu.menuname'/><!--菜单名称 -->
        </td>
        <td colspan="1">
          <h:text property="custmenu/menuname" maxlength="40" validateAttr="allowNull=false;maxLength=40"/>
        </td>
      </tr>
      <tr>
        <td class="form_label">
          <b:message key = 'menuManager_l_AcMenu.menulabel'/><!--菜单显示名称 -->
        </td>
        <td colspan="1">
          <h:text property="custmenu/menulabel" maxlength="40" validateAttr="allowNull=false;maxLength=40"/>
        </td>
      </tr>      
      <tr>
        <td class="form_label">
          <b:message key = 'menuManager_l_AcMenu.funccode'/><!--菜单代码 -->
        </td>
        <td colspan="1">
          <h:text property="custmenu/funccode" maxlength="40"  validateAttr="maxLength=40" />
        </td>
      </tr>
      <tr> 
        <td class="form_label">
          <b:message key = 'menuManager_l_AcMenu.displayorder'/><!--显示顺序 -->
        </td>
        <td colspan="1">
          <h:text property="custmenu/displayorder" validateAttr="type=number;minValue=-32768;maxValue=32767" />
        </td>
      </tr>      
      <tr>
        <td class="form_label">
         <b:message key = 'menuManager_l_AcMenu.imagepath'/><!--菜单闭合图片路径 -->
        </td>
        <td colspan="1">
          <h:text property="custmenu/imagepath"  maxlength="100" validateAttr="maxLength=100"/>
        </td>
      </tr>
      <tr>
        <td class="form_label">
          <b:message key = 'menuManager_l_AcMenu.expandpath'/><!--菜单展开图片路径 -->
        </td>
        <td colspan="1">
          <h:text property="custmenu/expandpath"  maxlength="100" validateAttr="maxLength=100" />
        </td>
      </tr>
      <tr class="form_bottom">
        <td colspan="6">
              <input type="button" class="button" value="<b:message key="l_save" />" onclick="saveCustmenu()">
              <input type="button" class="button" value="<b:message key="l_close" />" onclick="javascript:window.close();">
        </td>
      </tr>
    </table>
</h:form>

<script>
	//使用Ajax调用逻辑流
    function saveCustmenu() {
        var frm = $name("dataform1");
	    //表单验证
	    if( !checkForm(frm) ) {
	        return;
	    }
        var myAjax = null;
        if( $name("_eosFlowAction").value == "insertSubmit"  ) {
	        myAjax = new Ajax("org.gocom.abframe.rights.menu.MenuRebuild.addSubCustMenu.biz");
	        				   
			myAjax.addParam("upMenu/menuid", $name("upMenu/menuid").value);
			myAjax.addParam("subMenu/menuid", $name("custmenu/menuid").value );
			myAjax.addParam("subMenu/menuname", $name("custmenu/menuname").value );
	        myAjax.addParam("subMenu/menulabel", $name("custmenu/menulabel").value);
	        myAjax.addParam("subMenu/funccode", $name("custmenu/funccode").value  );
	        myAjax.addParam("subMenu/displayorder", $name("custmenu/displayorder").value  );
	        myAjax.addParam("subMenu/imagepath", $name("custmenu/imagepath").value  );
	        myAjax.addParam("subMenu/expandpath", $name("custmenu/expandpath").value);			
		}
		if( $name("_eosFlowAction").value == "updateSubmit"  ) {
			myAjax = new Ajax("org.gocom.abframe.rights.menu.MenuRebuild.updateCustMenu.biz");
			myAjax.addParam("newMenu/menuid", $name("custmenu/menuid").value );
			myAjax.addParam("newMenu/menuname", $name("custmenu/menuname").value );
	        myAjax.addParam("newMenu/menulabel", $name("custmenu/menulabel").value);
	        myAjax.addParam("newMenu/funccode", $name("custmenu/funccode").value  );
	        myAjax.addParam("newMenu/displayorder", $name("custmenu/displayorder").value  );
	        myAjax.addParam("newMenu/imagepath", $name("custmenu/imagepath").value  );
	        myAjax.addParam("newMenu/expandpath", $name("custmenu/expandpath").value);			
		}

        myAjax.submit();
        var returnNode = myAjax.getResponseXMLDom();
        if( returnNode ) {
            if( myAjax.getValue("root/data/oprResult") == 1 )
                alert( "<b:message key='l_m_save_success' />" );
            else {
                alert( "<b:message key='l_m_save_fail' />" );    
            }
        } else {
            alert( "<b:message key='l_m_save_fail' />" );    
        }
        
        window.close();
    }
    
</script>

</body>
</html>