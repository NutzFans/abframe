<%@page pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>
<html>
<%
	//获取标签中使用的国际化资源信息
	String title=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("bizOrgManager_l_title_busidomain_input");
%>
<head>
<title><b:message key = '<%=title%>'/></title> <!--业务套别录入 -->
</head>

<body >

	<form name="dataform1" action="org.gocom.abframe.org.busidomainAdd.flow" method="post" onsubmit="return checkForm(this);">
	  <h:hidden property="org/busiorgid" />
	  <l:equal property="_eosLastAccessAction" targetValue="update">
	      <input type="hidden" name="_eosFlowAction" value="updateSubmit" >
	  </l:equal>
	  <l:equal property="_eosLastAccessAction" targetValue="insert">
	    <input type="hidden" name="_eosFlowAction" value="insertSubmit" >
	  </l:equal>
	  
	    <table align="center" border="0" width="100%" class="form_table">
	      <tr>
	        <td class="form_label">
	          <b:message key = 'bizOrgManager_OmBusiorg.busidomain'/><b:message key="l_colon"/><!--业务套别名称 -->
	        </td>
	        <td colspan="1">
	          <h:text property="org/busidomain" validateAttr="allowNull=false;maxLength=255"/>
	        </td>
	      </tr>
	      <tr>
	        <td class="form_label">
	          <b:message key = 'bizOrgManager_OmBusiorg.orgname(busidomain)'/><b:message key="l_colon"/><!--业务套别显示名称 -->
	        </td>
	        <td colspan="1">
	          <h:text property="org/orgname" validateAttr="allowNull=false;maxLength=64"/>
	        </td>
	      </tr>
	      
	      <tr class="form_bottom">
	        <td colspan="6">
	          <input type="button" class="button" value='<b:message key="l_save"/>' onclick="save()"> <!--保存 -->
              <input type="button" class="button" value='<b:message key="l_close"/>' onclick="javascript:window.close();"> <!--关闭 -->
	        </td>
	      </tr>
	    </table>
	</form>
	
<script>
	//提交新增和更新操作
    function save() {
        var frm = $name("dataform1");
	    //表单验证
	    if( !checkForm(frm) ) {
	        return;
	    }
        var myAjax = null;
        if( $name("_eosFlowAction").value == "insertSubmit"  ) {
            myAjax = new Ajax("org.gocom.abframe.org.busiorg.BusiOrgManager.insertBusidomain.biz");
            myAjax.addParam("org/busidomain", $name("org/busidomain").value );
	        myAjax.addParam("org/orgname", $name("org/orgname").value );
        } else {
            myAjax = new Ajax("org.gocom.abframe.org.busiorg.BusiOrgManager.updateBusiorg.biz");
            myAjax.addParam("org/busidomain", $name("org/busidomain").value );
	        myAjax.addParam("org/orgname", $name("org/orgname").value );    
	        myAjax.addParam("org/busiorgid", $name("org/busiorgid").value );    
        }        
        myAjax.submit();
        var returnNode = myAjax.getResponseXMLDom();
        if( returnNode ) {
            if( myAjax.getValue("root/data/oprResult") == 1 )
                alert( "<b:message key='l_m_save_success' />" ); <!--  保存成功 -->
            else {
                alert( "<b:message key='l_m_save_fail' />" );    <!-- 保存失败 --> 
            }
        } else {
            alert( "<b:message key='l_m_save_fail' />" );    	 <!-- 保存失败 --> 
        }
        
        window.close();
    }  
</script>
</body>
</html>