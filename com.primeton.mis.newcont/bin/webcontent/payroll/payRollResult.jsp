<%@page import="commonj.sdo.DataObject"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<!-- 
  - Author(s): jisx
  - Date: 2017-08-07 14:20:39
  - Description:
-->
<%
String exception = (String) request.getAttribute("exception");
out.println("<script>parent.checkImportResult('"+exception+"')</script>");  
 %>