<%@page pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>
<html>
<head>
<%
	//获取标签中使用的国际化资源信息
	String title=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("bizOrgManager_l_title_busiorg_update");
	String selectManapos=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("bizOrgManager_l_selectManapos");
	String selectOrg=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("bizOrgManager_l_selectOrg");
%>
<title><%=title%></title> <!--业务机构修改 -->
</head>
<body leftmargin="0" topmargin="0" rightmargin="0">
     
<%--dataform configurationID:20080814133554 --%>
<h:form name="dataform1" action="org.gocom.abframe.org.busiorg.BusiOrgUpdate.flow" checkType="blur"  method="post" onsubmit="return checkForm(this);">
  <h:hidden property="org/busiorgid" />
  <input type="hidden" name="_eosFlowAction" value="updateSubmit"/>
    <table align="center" border="0" width="100%" class="form_table">
      <tr>
       <td colspan="2" class="eos-panel-title">&nbsp;<%=title%></td><!--业务机构修改 -->
      </tr>
      <tr>
        <td class="form_label">
          <b:message key = 'bizOrgManager_OmBusiorg.nodetype'/><b:message key="l_colon"/> <!--业务机构类型 -->
        </td>
        <td colspan="1">
          <h:hidden  property="org/nodetype" />
          <d:write dictTypeId="ABF_BUSIORGTYPE" property="org/nodetype" />
        </td>
      </tr>
      <tr>
        <td class="form_label">
          <b:message key = 'bizOrgManager_OmBusiorg.orgname'/><b:message key="l_colon"/> <!--业务机构名称 -->
        </td>
        <td colspan="1">
          <h:text property="org/orgname" validateAttr="allowNull=false;maxLength=64"/>
        </td>
      </tr>
  	  <tr>
        <td class="form_label">
          <b:message key = 'bizOrgManager_OmBusiorg.orgcode'/><b:message key="l_colon"/> <!--业务机构代码 -->
        </td>
        <td colspan="1">
          <h:text property="org/orgcode" validateAttr="allowNull=true;maxLength=32" />
        </td>
      </tr>
      <tr>
        <td class="form_label">
          <b:message key = 'bizOrgManager_OmBusiorg.manapos'/><b:message key="l_colon"/> <!--主管岗位 -->
        </td>
        <td colspan="1">																						<!--选择主管岗位 -->
          <w:lookup property="org/manapos" name="org/manapos"  readonly="true" displayProperty="org/posiname"  dialogTitle="<%=selectManapos%>"  width="350" height="430" lookupUrl="/abframe/org/position/position_tree.jsp" onReturnFunc="lookupRetFun"></w:lookup>
        </td>
      </tr>
      <l:equal property="org/nodetype" targetValue="actual" compareType="string"  >
      <tr>
        <td class="form_label">
          <b:message key = 'bizOrgManager_OmBusiorg.omOrganization_orgid(orgname)'/><b:message key="l_colon"/> <!--机构名称 -->
        </td>
        <td colspan="1">																							<!--选择机构 -->
          <w:lookup property="org/omOrganization/orgid"   readonly="true" displayProperty="org/orgnizationname"  dialogTitle="<%=selectOrg%>"  width="350" height="430" lookupUrl="/abframe/org/organization/org_tree_select.jsp" onReturnFunc="lookupRetFun"></w:lookup>
        </td>
      </tr>
      </l:equal>
      <tr class="form_bottom">
        <td colspan="6">
          <input type="button" class="button" onclick="doSave();" value="<b:message key = 'l_save'/>"> <!--保存 -->
        </td>
      </tr>
    </table>
</h:form>
<script>
    //lookup 控件返回函数
    function lookupRetFun( arg ) {
        return true;
    }
    
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
</body>
</html>