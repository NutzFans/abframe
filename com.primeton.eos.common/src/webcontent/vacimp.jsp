<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String exception = (String) request.getAttribute("exception");
out.println("<script>parent.test('"+exception+"')</script>");  

%>