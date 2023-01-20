<%@page pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>Title</title>
<script>
	function rtnSelectVal() {
 		var treeObj = $id("mngorgTree");
 		
 		var orgChecked=treeObj.getCheckedList("org");
 		
		var sorgid=new Array();
		var sorgname=new Array();
		var len =-1;
		
 		len = orgChecked.getLength();
 		for( var i = 0 ; i < len; i++ ) {
	        sorgid.push(orgChecked.list[i].getProperty("orgid"));
	        sorgname.push(orgChecked.list[i].getProperty("orgname"));
  		}
		returnValue = [ sorgid.join(','),sorgname.join(',') ];
		window.close();
	}		
</script>
</head>
<body class="eos-panel-table" leftmargin="0" topmargin="0" rightmargin="0">
	<table align="left" border="0" height="100%" width="100%">
		<tr>
		<td width="100%" valign="top">
		<w:tree id="mngorgTree" hasRoot="false" hasCheckBox="true" checkBoxType="simple">
			<w:treeRoot display="<b:message key='orgSubMaintain_l_mngOrg' />">  
			</w:treeRoot>

			<w:treeNode nodeType="org" showField="orgname" xpath="orgs"  
				icon='<%=SkinUtil.getStyleFileForTag("images/abf/chart_organization.png",request)%>'>
				<w:treeRelation parentNodeType="root" field="orglevel" value="1"/>
				<w:treeRelation parentNodeType="org" parentField="orgid" field="porgid" />
				<w:treeCheckbox field="orgid" checkedField="orgid" checkedXpath="listc"/>
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



