<%@page pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>

<html>
<head>
<title>应用功能维护入口</title>
</head>
<body topmargin="0" leftmargin="0">

<Table align="left" border="0" id="app_table" height="100%" width="100%" cellpadding="0" cellspacing="0">
<Tr>
   <td id="frmAppFuncTree" valign="top" width="25%">
      <IFRAME style="width:100%; height:100%" name="IFRAMEAppFuncTree" frameBorder=0 scrolling="no"
              src="org.gocom.abframe.rights.application.ApplicationMaintain.flow?_eosFlowAction=appFuncTree"> </IFRAME>
   </td>
   <td vAlign="top" width="75%">
      <IFRAME style="width:100%;height:100%" name="IFRAMEAppFuncInfo" frameborder=0 scrolling="auto"
              src="org.gocom.abframe.rights.application.ApplicationMaintain.flow?_eosFlowAction=appManage"> </IFRAME>
   </td>
</Tr>
</Table>

</body>
</html>