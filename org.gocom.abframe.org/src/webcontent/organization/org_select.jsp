<%@page pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>机构树</title>
<script>
	var orgid = "";
	var orgname = "";
	var orgtype = "";
	var status = "";
	function getInitParam()
	{
		return "<oEmp><empid>"+ $name("userObject/attributes/empid").value +"</empid></oEmp>"; //
	}
	function clickNode( node ) {
		setReturnValue( node );
	}	
	function dbClickNode( node ) {
		setReturnValue( node );
		returnValue = [orgid, orgname,orgtype,status];
		window.close();
	}
	function setReturnValue( node ) {
		orgid = node.getProperty("orgid");
		orgname   = node.getProperty("orgname");
		orgtype = node.getProperty("orgtype");
		status   = node.getProperty("status");	            
		$name("orgname").value = orgname;
		$name("orgid").value = orgid;
		$name("orgtype").value = orgtype;
		$name("status").value = status;		
	}
       
	function closeWin( idValue1, nameValue2,idValue3, nameValue4 ) {
		returnValue = [ idValue1, nameValue2,idValue3, nameValue4 ];
		window.close();
	}
        
	function ok() {
		if( orgid == "" || orgid == null || orgname == "" || orgname == null ) {
			if( confirm("您没有选择值，确定退出么？") ) {
				closeWin( orgid, orgname,orgtype,status );    
			}
		} else {
			closeWin( orgid, orgname,orgtype,status );    
		}
	} 
	
</script>
</head>
<body>

<h:hidden property="userObject/attributes/empid" scope="s" />

<table border="0" width="100%" height="100%" cellpadding="0" cellspacing="0">
	<tr>
		<td class="eos-panel-table" width="345" height="360" valign="top">
		<r:rtree id="orgTreeSelect"> 
			<r:treeRoot childEntities="oaOrg" display="可管理机构" initParamFunc="getInitParam"
				icon='<%=SkinUtil.getStyleFileForTag("images/abf/arrow_merge.png",request)%>'
				action="org.gocom.abframe.org.organization.OrgManager.queryMngorgOfLogon.biz" >
			</r:treeRoot>	
			<r:treeNode  nodeType="oaOrg" showField="orgname" childEntities="oaOrg" 
				icon='<%=SkinUtil.getStyleFileForTag("images/abf/chart_organization.png",request)%>'
				submitXpath="oParentOrg"
				onDblclickFunc="dbClickNode" onClickFunc="clickNode" 
 				action="org.gocom.abframe.org.organization.OrgManager.queryOrgByParent.biz" >
			</r:treeNode>	
		</r:rtree>
		</td>    
	</tr>
	<tr>
	    <td>
		   您选择的值为：<input type="text" name="orgname" readonly="readonly" value=""/> 
		   <input type="hidden" name="orgid" value=""/>
		   <input type="hidden" name="orgtype" value=""/>
		   <input type="hidden" name="status" value=""/>		   		   
		   &nbsp;&nbsp;
		   <input type="button" class="button" value="确定" onclick="javascript:ok();"/>
		   &nbsp;&nbsp;
		   <input type="button" class="button" value="清空" onclick="javascript:closeWin('','','','');"/>
		</td>
	</tr>	
</table>

</body>
