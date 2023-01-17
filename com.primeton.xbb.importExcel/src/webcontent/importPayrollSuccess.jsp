<%@page import="com.primeton.bps.statistics.etl.api.IEtlLogicManager"%>
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
String errormessage = (String) request.getAttribute("errormessage");
String msg = (String) request.getAttribute("exception");
Integer succcount = (Integer) request.getAttribute("succcount");
Integer errcount = (Integer) request.getAttribute("errcount");

JSONObject data = new JSONObject();
data.put("errormessage", errormessage);
data.put("msg", msg);
data.put("succcount", succcount);
data.put("errcount", errcount);


out.println("<script>parent.test('"+data+"')</script>");  
 %>