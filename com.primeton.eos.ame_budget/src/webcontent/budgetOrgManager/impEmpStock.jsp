<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%

commonj.sdo.DataObject[] empStock  = (commonj.sdo.DataObject[]) request.getAttribute("empStock");
if(empStock.length!=0){
JSONArray empstocks = new JSONArray();

for(int i = 0;i<empStock.length;i++){
	JSONObject temp = new JSONObject();
	JSONObject deptEmpBudgets = new JSONObject();
	temp.put("orgid", empStock[i].get("orgid"));
	temp.put("orgname", empStock[i].getString("orgname"));
	temp.put("year", empStock[i].get("year"));
	temp.put("citycode", empStock[i].get("citycode"));
	temp.put("costtype", empStock[i].get("costtype"));
	temp.put("empnum", empStock[i].get("empnum"));
	temp.put("sharmoney", empStock[i].get("sharmoney"));
	temp.put("tosalary", empStock[i].get("tosalary"));
	temp.put("toweal", empStock[i].get("toweal"));
	temp.put("tobonus", empStock[i].get("tobonus"));
	empstocks.add(temp);
}
empstocks.toJSONString();
out.println("<script>parent.init('"+empstocks+"')</script>"); 
}else{
	int budget1 = 0;
out.println("<script>parent.init('"+budget1+"')</script>");  
}

%>