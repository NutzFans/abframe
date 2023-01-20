<%@page pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>
<html>
<%
	//获取标签中使用的国际化资源信息
	String title=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("bizOrgManager_l_title_busiorg_input");
	String selectManapos=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("bizOrgManager_l_selectManapos");
%>
<head>
<title><%=title%></title> <!--子业务机构录入 -->
</head>

<body >
	<h:form name="dataform1" action="org.gocom.abframe.org.busiorg.SubBusiOrgMaintain.flow" method="post" onsubmit="return checkForm(this);">
	  <h:hidden property="org/busiorgid" />
	  <h:hidden property="parentBusiorgid" scope="flow"/>
	  <l:equal property="_eosLastAccessAction" targetValue="update">
	      <input type="hidden" name="_eosFlowAction" value="updateSubmit" >
	  </l:equal>
	  <l:equal property="_eosLastAccessAction" targetValue="insert">
	    <input type="hidden" name="_eosFlowAction" value="insertSubmit" >
	  </l:equal>
	    <table align="center" border="0" width="100%" class="form_table">
	      <tr>
	        <td class="form_label">
	          <b:message key = 'bizOrgManager_OmBusiorg.nodetype'/><b:message key="l_colon"/><!--业务机构类型 -->
	        </td>
	        <td colspan="1">
			  <h:hidden property="org/nodetype" />
	          <d:write dictTypeId="ABF_BUSIORGTYPE" property="org/nodetype" />			
	        </td>
	      </tr>
	      
	      <tr>
	        <td class="form_label">
	          <b:message key = 'bizOrgManager_OmBusiorg.orgname'/><b:message key="l_colon"/><!--业务机构名称 -->
	        </td>
	        <td colspan="1">
	          <h:text property="org/orgname" validateAttr="allowNull=false;maxLength=64" />
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
	        <td colspan="1">																						 <!--选择主管岗位 -->
	          <w:lookup property="org/manapos" name="org/manapos" displayProperty="org/posiname"  readonly="true"   dialogTitle="<%=selectManapos%>"  width="400" height="450" lookupUrl="/abframe/org/position/position_tree.jsp" onReturnFunc="lookupRetFun"></w:lookup>
	        </td>
	      </tr>
	      <l:equal property="org/nodetype" targetValue="actual" compareType="string"  >
	      <tr>
	        <td class="form_label">
	          <b:message key = 'bizOrgManager_OmBusiorg.omOrganization_orgid(orgname)'/><b:message key="l_colon"/> <!--机构名称 -->
	        </td>
	        <td colspan="1">																																 <!--选择机构 -->
	          <w:lookup property="org/omOrganization/orgid" name="org/omOrganization/orgid" displayProperty="org/orgnizationname"  readonly="true"   dialogTitle="<b:message key = 'bizOrgManager_l_selectOrg'/>"  width="400" height="450" lookupUrl="/abframe/org/organization/org_tree_select.jsp" onReturnFunc="lookupRetFun"></w:lookup>
	        </td>
	      </tr>	      
	      </l:equal>
	      
	      <tr class="form_bottom">
	        <td colspan="6">
	          <input type="button" class="button" value='<b:message key="l_save"/>' onclick="save()"><!--保存 -->
              <input type="button" class="button" value='<b:message key="l_close"/>' onclick="javascript:window.close();"><!--关闭 -->
	        </td>
	      </tr>
	    </table>
	</h:form>

<script>
    //lookup 控件返回函数
    function lookupRetFun( arg ) {
        return true;
    }
    
    //提交插入并更新
    function save() {
        var frm = $name("dataform1");
	    //表单验证
	    if( !checkForm(frm) ) {
	        return;
	    }
        var myAjax = null;
        if( $name("_eosFlowAction").value == "insertSubmit"  ) {
            myAjax = new Ajax("org.gocom.abframe.org.busiorg.BusiOrgManager.insertSubBusiorg.biz");
            myAjax.addParam("upOrg/busiorgid", '<b:write property="parentBusiorgid" scope="flow"/>'  );
	        myAjax.addParam("subOrg/nodetype", $name("org/nodetype").value );
	        myAjax.addParam("subOrg/orgname", $name("org/orgname").value );
	        myAjax.addParam("subOrg/orgcode", $name("org/orgcode").value );
	        myAjax.addParam("subOrg/manapos", $name("org/manapos").value );
	        //$name("org/omOrganization/orgid")可能不存在
	        try{
	        	myAjax.addParam("subOrg/omOrganization/orgid", $name("org/omOrganization/orgid").value );
	        } catch(e) {
	        
	        }
	        
        } else {
            myAjax = new Ajax("org.gocom.abframe.org.busiorg.BusiOrgManager.updateBusiorg.biz");
	        myAjax.addParam("org/orgname", $name("org/orgname").value );    
	        myAjax.addParam("org/orgcode", $name("org/orgcode").value );    
	        myAjax.addParam("org/busiorgid", $name("org/busiorgid").value );   
	        myAjax.addParam("subOrg/nodetype", $name("org/nodetype").value );
	        myAjax.addParam("subOrg/manapos", $name("org/manapos").value );
	        //$name("org/omOrganization/orgid")可能不存在
	        try{
	        	myAjax.addParam("subOrg/omOrganization/orgid", $name("org/omOrganization/orgid").value );
	        } catch(e) {
	        } 
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