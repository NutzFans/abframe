<%@page pageEncoding="UTF-8"%>
<%@include file="/common/common.jsp"%>
<%@include file="/common/skins/skin0/component.jsp" %>
<html>
<!-- 
  - Author(s): zhx
  - Date: 2015-11-03 18:06:06
  - Description:
-->
<head>
<title>Title</title>
</head>
<body>
<script>
	alert("邮件发送成功！");
	window.close();
	if(window.opener){
		window.opener.location.href = window.opener.location.href;
	}else{
	    
	}
</script>
</body>
</html>