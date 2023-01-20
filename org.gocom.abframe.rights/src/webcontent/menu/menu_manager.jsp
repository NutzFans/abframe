<%@page pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>

<html>
<head>
<title><b:message key="menuManager_l_title_menu_manager"/></title> <!--菜单管理 -->
</head>
<body leftmargin="0" topmargin="0" style="overflow: auto;">
<table align="left" border="0" id="tableID" height="100%" width="100%" cellpadding="0" cellspacing="0">
  <tr>
    <td vAlign="top" width="25%">
   		<iframe name="menuTreeFrame" align="top" scrolling="no" 
   			src="org.gocom.abframe.rights.menu.MenuManager.flow?_eosFlowAction=menuTree" style="width:100%;height: 100%" frameBorder=0>
		</iframe>
		
    </td>
    <td vAlign="top" width="75%">
       <iframe  name="menuInfo" align="top" style="width:100%;height: 100%" frameBorder="0"
	   		scrolling="auto" src="org.gocom.abframe.rights.menu.MenuManager.flow?_eosFlowAction=menuQuery"></iframe> 
    </td>
  </tr>
  
  
</table>
 
	<SCRIPT language="javascript">
		//document.all.menuTreeFrame.height = document.body.clientHeight - IFRAME_MODIFY_HEIGHE;
		//document.all.menuInfo.height = document.body.clientHeight - IFRAME_MODIFY_HEIGHE;
		//$id("tableID").style.height = document.body.clientHeight - FINAL_PANEL_HEIGHT ;		
		
		//var height = document.body.clientHeight - FINAL_PANEL_HEIGHT;
		//$name("menuTreeFrame").style.height =height;
	</SCRIPT>
	
</body>
</html>