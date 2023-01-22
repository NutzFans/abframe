<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="org.gocom.abframe.auth.bizlet.SkinUtil"%>
<html>
<head>
<title>Title</title>
<style>
body{margin: 0;padding: 0;font-size: small;}
</style>
</head>
<body background='<%=SkinUtil.getStyleFile("images/abf/bottom.gif",request)%>'>
<div align="center" style="font-size: 9pt;font-family: Arial">copyright &copy; Primeton&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="#" onclick="doOperator()">意见反馈</a></div>
<script type="text/javascript">
	function doOperator(){
		window.open('<%=request.getContextPath() %>/ame_feedback/addFeedback.jsp','addFeedback','width=750,height=450');
	}
</script>
</body>
</html>