<%@page pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>人员选择</title>
</head>
<body leftmargin="0" topmargin="0" rightmargin="0">
<table border="0" width="100%" height="100%" cellpadding="0" cellspacing="0">
  <tr>
	<td width="100%" height="100%" valign="top" >
	<w:panel id="orgPanel" title="人员选择" height="100%" width="100%">
		<r:rtree id="orgTree" height="100%" width="100%">
			<r:treeRoot childEntities="oaOrg" display="机构人员树" initParamFunc="getInitParam" icon="<%=SkinUtil.getStyleFileForTag("images/abf/org-tree.png",request)%>" onClickFunc="" action="com.bos.mp.common.SelectPerson.queryRootOrg.biz"></r:treeRoot>
			<r:treeNode nodeType="oaOrg" showField="orgname" initParamFunc="getInitParam" childEntities="oaOrg;oaPosi;oaEmp" icon="<%=SkinUtil.getStyleFileForTag("images/abf/org-org.png",request)%>" submitXpath="oParentOrg" onRefreshFunc="" onClickFunc="" action="com.bos.mp.common.SelectPerson.queryOrgPosiEmpByParent.biz"></r:treeNode>
			<r:treeNode nodeType="oaPosi" showField="posiname" childEntities="oaEmp" icon="/common/images/icons/group.png" submitXpath="oParentPosi" onClickFunc="" action="com.bos.mp.common.SelectPerson.queryEmpOfPosi.biz"></r:treeNode>
			<r:treeNode  nodeType="oaEmp" showField="empname" icon="<%=SkinUtil.getStyleFileForTag("images/abf/user.png",request)%>" submitXpath="oEmp" onClickFunc="selectedCheckBox">
    		</r:treeNode>
		</r:rtree>
	</td>
	</w:panel>
  </tr>
</table>
</body>
</html>
<script>
	function getInitParam(){
		return '<orgid><b:write property="orgid"/></orgid><positionid><b:write property="positionid"/></positionid>';
	}
	//--初始化树的高度-------------------------------------
	function custInit(){
        var height = document.body.clientHeight - 22;
		$id("orgTree").style.height =height;
		getInitParam();
	}
    eventManager.add(window,"load",custInit);
//双击选人
function selectedCheckBox(node){
	var retArray = new Array();
    retArray[0] = nullToBlank(node.getProperty("userid"));
    retArray[1] = nullToBlank(node.getProperty("empname"));
    retArray[2] = nullToBlank(node.getProperty("orgid"));
    retArray[3] = nullToBlank(node.getProperty("orgname"));
    retArray[4] = nullToBlank(node.getProperty("empid"));
    window.returnValue = retArray; 
    window.close();
}
</script>