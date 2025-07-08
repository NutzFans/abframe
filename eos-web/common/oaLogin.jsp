<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-cmn-Hans">
<head>
<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=yes">
</head>
<body>

	<script type="text/javascript">
		<%
			String state = request.getParameter("state");
			String workitemid = request.getParameter("workitemid");
			String userid = request.getParameter("userId");
			String chartid = request.getParameter("chartid");
		%>
		var stateStr = '<%=state%>';
		var userId = '<%=userid%>';
		var chartId = '<%=chartid%>';
		var workitemId = '<%=workitemid%>';
		
		if(stateStr == 'null' || userId == 'null') {
			alert("请求地址不合法！");
		}else if(workitemId != 'null'){
			window.location.href ="wechatTask1.jsp?userId=<%=userid%>&state=<%=state%>&workitemid=<%=workitemid%>";
		}else if(chartId != 'null'){
			window.location.href ="wechatTask1.jsp?userId=<%=userid%>&state=<%=state%>&chartid=<%=chartid%>";
		}else{
			window.location.href ="wechatTask1.jsp?userId=<%=userid%>&state=<%=state%>&workitemid=<%=workitemid%>";
		}
		
	</script>
</body>
</html>