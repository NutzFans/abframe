<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): devil_sh
  - Date: 2016-11-17 15:21:48
  - Description:
-->
<head>
<title>人工短信发送</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body>
   	<jsp:include page="/ame_common/sms/sendSms.jsp" />
</body>
<script type="text/javascript">
    nui.parse();
</script>
</html>