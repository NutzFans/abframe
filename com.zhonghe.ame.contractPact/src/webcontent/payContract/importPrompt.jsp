<%@page pageEncoding="UTF-8"%>
<%@include file="/common/common.jsp"%>
<%@include file="/common/skins/skin0/component.jsp" %>
<html>
<!-- 
  - Author(s): huangqj
  - Date: 2022-10-25 16:52:20
  - Description:
-->
<head>
<title>Title</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<%
		Object error = request.getAttribute("error");
	 %>
<style type="text/css">
	.h{
		overflow-y :scroll;
		padding-right:10px;
		height:600px;
	}
</style>
</head>
<body style="width:400px;height:160px; margin:0 auto;">
	<script type="text/javascript">
		nui.parse();
		var error = "<%=error%>";
		parent.nui.alert(error, "系统提示", function() {
			cancel();
			return;
		});
		//关闭窗口
		function cancel() {
			if (window.CloseOwnerWindow) {
				return window.CloseOwnerWindow();
			} else {
				window.close();
			}
		}
	</script>
</body>
</html>