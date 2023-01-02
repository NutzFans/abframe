<%@page import="commonj.sdo.DataObject"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<!-- 
  - Author(s): zhang-yb
  - Date: 2018-09-05 14:30:04
  - Description:
-->
<%
String retCode = (String) request.getAttribute("retCode");
out.println("<script>parent.checkImportResult('"+retCode+"')</script>");  
 %>
<head>
<title>Title</title>
</head>
<body>
</body>
</html>