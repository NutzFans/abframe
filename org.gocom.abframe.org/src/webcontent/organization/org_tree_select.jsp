<%@page pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>
<html>
<%
	//获取标签中使用的国际化资源信息
	String title=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("orgSubMaintain_l_title_orgTree");
	String orgEmpTree = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("orgSubMaintain_l_title_orgEmpTree");
%>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title><%=title%></title>
<script>
	function getInitParam()
	{
		return "<oParentOrg><orgid></orgid></oParentOrg>"; //根的父ID为null
	}
	var orgid = "";
	var orgname = "";
	function clickNode( node ) {
		setReturnValue( node );
	}	
	function dbClickNode( node ) {
		setReturnValue( node );
		returnValue = [orgid, orgname];
		window.close();
	}
	function setReturnValue( node ) {
		orgid = node.getProperty("orgid");
		orgname   = node.getProperty("orgname");
            
		$name("orgname").value = orgname;
		$name("orgid").value = orgid;
	}
       
	function closeWin( idValue, nameValue ) {
		returnValue = [ idValue, nameValue ];
		window.close();
	}
        
	function ok() {
		if( orgid == "" || orgid == null || orgname == "" || orgname == null ) {
			if( confirm("<b:message key = 'l_m_alert_notSelectValueExit'/>") ) {  
				closeWin( orgid, orgname );     
			}
		} else {
			closeWin( orgid, orgname );    
		}
	} 
	
</script>
</head>
<body>

<table border="0" width="100%" height="100%" cellpadding="0" cellspacing="0">
	<tr>
		<td class="eos-panel-table" width="345" height="360" valign="top">
		<r:rtree id="orgTreeSelect">      
			<r:treeRoot childEntities="oaOrg" display="<%=orgEmpTree%>" initParamFunc="getInitParam"
				icon='<%=SkinUtil.getStyleFileForTag("images/abf/arrow_merge.png",request)%>'
				action="org.gocom.abframe.org.organization.OrgManager.queryOrgByParent.biz" >
			</r:treeRoot>	
			<r:treeNode preload="true" nodeType="oaOrg" showField="orgname" childEntities="oaOrg" 
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
		   <b:message key = 'l_selectValueIs'/><input type="text" name="orgname" readonly="readonly" value=""/> 
		   <input type="hidden" name="orgid" value=""/>
		   &nbsp;&nbsp;
		   <input type="button" class="button" value="<b:message key = 'l_cofirm'/>" onclick="javascript:ok();"/> 
		   <input type="button" class="button" value="<b:message key = 'l_empty'/>" onclick="javascript:closeWin('','');"/>
		   <input type="button" class="button" value='<b:message key="l_close"/>' onclick="javascript:window.close();"/> 
		</td>
	</tr>	
</table>

</body>
