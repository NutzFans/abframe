
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-cmn-Hans">
<!-- 
  - Author(s): shihao
  - Date: 2016-11-29 17:13:47
  - Description:
-->

<head>
<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=yes">
<title></title>
</head>
<body>
<script type="text/javascript">

	 <%
	 	String state = request.getParameter("state");
		String workitemid = request.getParameter("workitemid");
		String userid = request.getParameter("userId");
	  %>
	  if(<%=state %>==null||'<%=userid %>'==null){
	  	alert("来源不合法！")
	  }else{
		  //alert(document.referrer)
			window.location.href ="wechatTask1.jsp?userId=<%=userid %>&state=<%=state %>&workitemid=<%=workitemid %>";
	  }

</script>
</body>
</html>