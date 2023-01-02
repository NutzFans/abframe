<%@page pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>Title</title>
<script>
	function rtnSelectVal() {
 		var treeObj = $id("mngRoleTree");
 		
 		var roleChecked=treeObj.getCheckedList("role");

		var roleids=new Array();
		var rolenames=new Array();
		var len =-1;
		
 		len = roleChecked.getLength();
 		for( var i = 0 ; i < len; i++ ) {
 		    
	        roleids.push(roleChecked.list[i].getProperty("roleid"));
	        rolenames.push(roleChecked.list[i].getProperty("rolename"));
  		}			
		returnValue = [ roleids.join(","),rolenames.join(",") ];
		window.close();
	}		
</script>
</head>
<body class="eos-panel-table" leftmargin="0" topmargin="0" rightmargin="0">
	<table align="left" border="0" height="100%" width="100%">
		<tr>
		<td width="100%" valign="top">
		<w:tree id="mngRoleTree" hasRoot="false" hasCheckBox="true" checkBoxType="simple">
			<w:treeRoot display="<b:message key='orgSubMaintain_l_mngOrg' />">  
			</w:treeRoot>

			<w:treeNode nodeType="role" showField="rolename" xpath="roles"  
				icon='<%=SkinUtil.getStyleFileForTag("images/abf/chart_organization.png",request)%>'>
				<w:treeRelation parentNodeType="root" field="" />
				<w:treeCheckbox field="roleid" checkedXpath="listc" checkedField="roleid"/>
				</w:treeNode>	
		</w:tree>
		</td>
		</tr>
		<tr class="form_bottom">
		<td colspan="1">
			<input type="button" class="button" value="<b:message key='l_close' />" onclick="javascript:rtnSelectVal();">
		</td>
		</tr>  		
	</table>	
</body>
</html>



