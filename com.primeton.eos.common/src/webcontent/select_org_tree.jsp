<%@page pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>
<html>
<%
	//获取标签中使用的国际化资源信息
	String title=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("orgSubMaintain_l_title_orgTree");
%>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title><%=title%></title>
<script>
	function getInitParam()
	{
		return "<orgid><b:write property='rootOrgID'/></orgid>";
	}
	var orgid = "";
	var orgname = "";
	var orgseq = "";
	function clickNode( node ) {
		setReturnValue( node );
	}	
	function dbClickNode( node ) {
		setReturnValue( node );
		returnValue = [orgid, orgname, orgseq];
		window.close();
	}
	function setReturnValue( node ) {
		orgid = node.getProperty("orgid");
		orgname = node.getProperty("orgname");
		orgseq = node.getProperty("orgseq");
            
		$name("orgname").value = orgname;
		$name("orgid").value = orgid;
		$name("orgseq").value = orgseq;
	}
       
	function closeWin( idValue, nameValue, seqValue) {
		returnValue = [ idValue, nameValue, seqValue];
		window.close();
	}
        
	function ok() {
		if( orgid == "" || orgid == null || orgname == "" || orgname == null ) {
			if( confirm("<b:message key = 'l_m_alert_notSelectValueExit'/>") ) {  
				closeWin( orgid, orgname, orgseq);     
			}
		} else {
			closeWin( orgid, orgname, orgseq);    
		}
	} 
	
</script>
</head>
<body>
<%-- treeRoot:action="com.bos.mp.common.SelectManage.getOwnerRootOrg.biz"    treeNode:action="com.bos.mp.common.SelectManage.getSubOrg.biz"--%>
<table border="0" width="100%" height="100%" cellpadding="0" cellspacing="0">
	<tr>
		<td class="eos-panel-table" width="345" height="360" valign="top">
		<r:rtree id="orgTreeSelect" expandLevel="2">      
			<r:treeRoot childEntities="oaOrg" display="机构树" initParamFunc="getInitParam"
				icon='<%=SkinUtil.getStyleFileForTag("images/abf/arrow_merge.png",request)%>'
				action="com.bos.mp.common.SelectPerson.queryRootOrg.biz" >
			</r:treeRoot>	
			<r:treeNode preload="true" nodeType="oaOrg" showField="orgname" childEntities="oaOrg" 
				icon='<%=SkinUtil.getStyleFileForTag("images/abf/chart_organization.png",request)%>'
				submitXpath="oParentOrg"
				onDblclickFunc="dbClickNode" onClickFunc="clickNode" 
 				action="com.bos.mp.common.SelectManage.queryOrgByParent.biz" >
			</r:treeNode>	
		</r:rtree>
		</td>    
	</tr>
	<tr>
	    <td>   
		   <b:message key = 'l_selectValueIs'/><input type="text" name="orgname" readonly="readonly" value=""/> 
		   <input type="hidden" name="orgid" value=""/>
		   <input type="hidden" name="orgseq" value=""/>
		   &nbsp;&nbsp;
		   <input type="button" class="button" value="确定" onclick="javascript:ok();"/>
		   <input type="button" class="button" value="清空" onclick="javascript:closeWin('','','');"/> 
		</td>
	</tr>	
</table>

</body>
