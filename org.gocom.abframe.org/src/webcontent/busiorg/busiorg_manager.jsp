<%@page pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>

<html>
<head>
<title><b:message key="bizOrgManager_l_title_busiorg_manager"/></title>
</head>
<body topmargin="0px;" leftmargin="0px;">
<table align="left" border="0" id="tableID" height="100%" width="100%" cellpadding="0" cellspacing="0">
  <tr>
    <td vAlign="top" width="25%">
   		<iframe name="orgTree" align="top" scrolling="no" 
   			src="org.gocom.abframe.org.busiorg.BusiOrgManager.flow?_eosFlowAction=orgTree" style="width:100%" frameBorder=0>
		</iframe>	
    </td>
    <td vAlign="top" width="75%">
       <iframe  name="orgTabs" style="width:100%" frameBorder="0"
	   		scrolling="auto" src="org.gocom.abframe.org.busiorg.BusiOrgManager.flow?_eosFlowAction=listBusidomain">
	   	</iframe>	   		
    </td>
  </tr>
</table>
 
	<SCRIPT language="javascript">
		document.all.orgTree.height = document.body.clientHeight;
		document.all.orgTabs.height = document.body.clientHeight;
		$id("tableID").style.height = document.body.clientHeight;
	</SCRIPT>
	
</body>
</html>