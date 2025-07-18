<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<head>
<title>会计科目 - Excel导入结果</title>
</head>
<body>
	<%
		String result = (String) request.getAttribute("result");
	%>

	<script type="text/javascript">
		nui.parse();
		var result = "<%=result%>";

		parent.nui.alert(result, "系统提示", function() {
			cancel();
			return;
		});
		
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