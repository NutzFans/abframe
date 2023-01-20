<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String fileid = (String) request.getAttribute("result");
out.println("<script>parent.test('"+fileid+"')</script>");  

%>