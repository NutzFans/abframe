<%@page pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>
<html>
    <head>
        <title></title>
        <%
        	//权限功能树
        	String privilegeTree = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("roleManager_l_title_privilegeTree");
        %>
    <script>
    /*
     * 保存角色具有的功能
     */
    function addPrivilege() {
    	var roleid = $name("acRole/roleid").value;
    	if( roleid ==""){
    	    alert('<b:message key="roleManager_l_pleaseSelectRole"/>');  <!-- 请选择角色！ -->
    	    return;
    	}
    	
        var myAjax = new Ajax("org.gocom.abframe.rights.role.PrivilegeManager.addPrivilege.biz");     
 		var treeObj = $id("abframe");
 		treeObj.createHiddenData();
 		var funcsize = '<b:size property="funcList"/>';
 		for( var i = 1 ; i <=funcsize; i++ ) {
 		    if( $name("func[" + i + "]/funcgroupid" ) != null ) {		        
 		        myAjax.addParam("func[" + i + "]/funcgroupid", $name("func[" + i + "]/funcgroupid" ).value);
 		        myAjax.addParam("func[" + i + "]/appid", $name("func[" + i + "]/appid" ).value);
 		        myAjax.addParam("func[" + i + "]/acFunction/funccode", $name("func[" + i + "]/funccode" ).value);
 		        myAjax.addParam("func[" + i + "]/acRole/roleid", $name("acRole/roleid" ).value);
 		        myAjax.addParam("acRole/roleid", $name("acRole/roleid" ).value);
 		    }else{
 		    	myAjax.addParam("acRole/roleid", $name("acRole/roleid" ).value);
 		    }	    
 		}
 		myAjax.submit();    
 		
 		//调运业务逻辑后的返回值
 		var returnNode = myAjax.getResponseXMLDom();
        if( returnNode ) {
            if( myAjax.getValue("root/data/retCode") == 1 )
                alert( '<b:message key="l_m_save_success"/>' );  <!--  保存成功 -->
            else {
                alert( '<b:message key="l_m_save_fail"/>' );         <!-- 保存失败 -->
            }
        } else {
            alert( '<b:message key="l_m_save_fail"/>' );         <!-- 保存失败 -->
        }
     }	
	</script>
</head>
<body leftmargin="0" topmargin="0" style="overflow: auto;">
    <table width="100%" height="100%">
      <tr>
        <td>
        <table border="0" width="100%" height="100%" cellpadding="0" cellspacing="0">
			<tr height="4%">
				<td class="eos-panel-title">&nbsp;&nbsp;<%=privilegeTree%></td>
			</tr>
			<tr>
			<td width="25%" height="100%" valign="top" class="eos-panel-body">
	    	<h:hidden property="acRole/roleid"/><br>&nbsp;&nbsp;
	        <input type="button" class="button" value="<b:message key="l_save"/>" onclick="addPrivilege();">
	        <w:tree id="abframe" hasCheckBox="true" checkBoxType="associated" hasRoot="false" width="100%">
	            <w:treeRoot display="<%=privilegeTree %>"/>
	            <w:treeNode nodeType="app" showField="appname" xpath="appList" icon='<%=SkinUtil.getStyleFileForTag("images/abf/application.png",request)%>'>
	                <w:treeRelation parentNodeType="root" field="appid"/>
	            </w:treeNode>
	            <w:treeNode nodeType="funcGroup" showField="funcgroupname" xpath="funcGroupList" icon='<%=SkinUtil.getStyleFileForTag("images/abf/bricks.png",request)%>'>
	                <w:treeRelation parentNodeType="app"  field="appid" parentField="appid" />            
	            </w:treeNode>         
	            <w:treeNode nodeType="subFuncGroup" showField="funcgroupname" xpath="subFuncGroupList" icon='<%=SkinUtil.getStyleFileForTag("images/abf/bricks.png",request)%>'>
	                <w:treeRelation parentNodeType="funcGroup"  field="parentgroup" parentField="funcgroupid" />
	                <w:treeRelation parentNodeType="subFuncGroup"  field="parentgroup" parentField="funcgroupid" />
	            </w:treeNode>
	            <w:treeNode nodeType="func" showField="funcname" xpath="funcList" icon='<%=SkinUtil.getStyleFileForTag("images/abf/application_form.png",request)%>'>
	            	<w:treeRelation parentNodeType="funcGroup"  field="funcgroupid" parentField="funcgroupid" />
	                <w:treeRelation parentNodeType="subFuncGroup"  field="funcgroupid" parentField="funcgroupid" />
	                <w:treeCheckbox field="funccode" checkedXpath="rolefuncList" checkedField="acFunction/funccode"/>
	            </w:treeNode>    
	        </w:tree><br>&nbsp;&nbsp;
	        <input type="button" class="button" value="<b:message key="l_save"/>" onclick="addPrivilege();"><br>
       		</td>
			</tr>
	    </table>
        </td>
    </tr>
  </table>
</body>
</html>
 