<%@page pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>
<html>
<head>
<%
	//业务套别修改
	String title=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("bizOrgManager_l_title_busidomain_update");
%> 
<title><%=title%></title> <!--业务套别修改 -->
</head>
<body leftmargin="0" topmargin="0" rightmargin="0">
    
<%--dataform configurationID:20080814133554 --%>
<h:form name="dataform1" action="org.gocom.abframe.org.busiorg.BusiDomainUpdate.flow" checkType="blur"  method="post" onsubmit="return checkForm(this);">
  <h:hidden property="org/busiorgid" />
  <h:hidden name="isBusidomain" value="true" />
  <input type="hidden" name="_eosFlowAction" value="updateBusidomainSubmit"/>
    <table align="center" border="0" width="100%" class="form_table">
      <tr>
       <td colspan="2" class="eos-panel-title">&nbsp;<%=title%></td><!--业务套别修改 -->
      </tr>
      <tr>
        <td class="form_label">
          <b:message key = 'bizOrgManager_OmBusiorg.busidomain'/><b:message key="l_colon"/> <!--业务套别名称  -->
        </td>
        <td colspan="1">
          <h:text property="org/busidomain" validateAttr="allowNull=false;maxLength=255"/>
        </td>
      </tr>
      <tr>
        <td class="form_label">
          <b:message key = 'bizOrgManager_OmBusiorg.orgname(busidomain)'/><b:message key="l_colon"/> <!--业务套别显示名称 -->
        </td>
        <td colspan="1">
          <h:text property="org/orgname" validateAttr="allowNull=false;maxLength=64"/>
        </td>
      </tr>
     
      <tr class="form_bottom">
        <td colspan="6">
          <input type="button" class="button" onclick="doSave();" value="<b:message key = 'l_save'/>"> <!--保存 -->
        </td>
      </tr>
    </table>
</h:form>
</body>
</html>
<script type="text/javascript">
	var frm = $name("dataform1");
	function doSave(){
		
		if( !checkForm(frm) ) {
             return;
        }
		
		var myAjax = new Ajax("org.gocom.abframe.org.busiorg.BusiOrgManager.updateBusiorg.biz");
		myAjax.submitForm(frm)
		
		var returnNode = myAjax.getResponseXMLDom();
        if( returnNode ) {
            if( myAjax.getValue("root/data/oprResult") == 1 ) {
                alert( '<b:message key="l_m_save_success"/>' );  //保存成功
                try{
                    parent.parent.window.frames['orgTree'].orgTree.getSelectNode().getParent().reloadChild();  //刷新左侧树，注意：要刷新的是选中节点的上级节点
		        } catch(e) {
		        }
                window.close();
            } else {
                alert( '<b:message key="l_m_save_fail"/>' );         //保存失败
            }
        } else {
            alert( '<b:message key="l_m_save_fail"/>' );         //保存失败
        }		
	}
</script>