<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%

String wrong  = (String) request.getAttribute("wrong");
out.println("<script>parent.test('"+wrong+"')</script>");  
%>