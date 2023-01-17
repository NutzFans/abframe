<%@page import="commonj.sdo.DataObject"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<!-- 
  - Author(s): huangyq
  - Date: 2018-09-06 15:35:24
  - Description:
-->
<head>
<title>Title</title>
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