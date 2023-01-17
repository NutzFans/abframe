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
commonj.sdo.DataObject resume = (commonj.sdo.DataObject) request.getAttribute("resume");
Map returnMap = (Map) request.getAttribute("resultMap");

JSONObject content = new JSONObject();
JSONObject resume1 = new JSONObject();
JSONObject resume2 = new JSONObject();
JSONObject resume3 = new JSONObject();

content.put("content", returnMap.get("content"));
content.put("returnVal", returnMap.get("returnVal"));

resume1.put("empname", resume.getString("empname"));
resume1.put("userid", resume.getString("userid"));
resume1.put("gender", resume.getString("gender"));
resume1.put("birthdate", resume.getString("birthdate"));
resume1.put("cardno", resume.getString("cardno"));
resume1.put("workdate", resume.getString("workdate"));
resume1.put("indate", resume.getString("indate"));
resume1.put("education", resume.getString("education"));
resume1.put("school", resume.getString("school"));
resume1.put("specialty", resume.getString("specialty"));
resume1.put("orgname", resume.getString("orgname"));
resume1.put("duty", resume.getString("duty"));
resume1.put("technology", resume.getString("technology"));
resume1.put("emptype", resume.getString("emptype"));
resume1.put("email", resume.getString("email"));
resume1.put("tel", resume.getString("tel"));
resume1.put("abilitydescription", resume.getString("abilitydescription"));
resume1.put("otherdescription", resume.getString("otherdescription"));
resume2.put("resume",resume1);

DataObject [] workExps = (DataObject [])resume.get("workExp");
JSONObject a1 = new JSONObject();
for(int k =0 ;k<workExps.length;k++){
	JSONObject a2= new JSONObject();
	a2.put("startdate", workExps[k].getString("startdate"));
	a2.put("enddate", workExps[k].getString("enddate"));
	a2.put("companyname", workExps[k].getString("companyname"));
	a2.put("duty", workExps[k].getString("duty"));
	a2.put("workdescription", workExps[k].getString("workdescription"));
	String  key= "temp"+k;
	a1.put(key, a2);
}
DataObject[] projExps = (DataObject[])resume.get("projExp");
JSONObject a3 = new JSONObject();
for(int k=0;k<projExps.length;k++){
	JSONObject a4= new JSONObject();
	a4.put("beginenddate", projExps[k].getString("beginenddate"));
	a4.put("projectname", projExps[k].getString("projectname"));
	a4.put("custname", projExps[k].getString("custname"));
	a4.put("projectintroduce", projExps[k].getString("projectintroduce"));
	a4.put("projectduty", projExps[k].getString("projectduty"));
	String  key= "temp"+k;
	a3.put(key, a4);
}
DataObject[] certs = (DataObject[])resume.get("cert");
JSONObject a5 = new JSONObject();
for(int k=0;k<certs.length;k++){
	JSONObject a6= new JSONObject();
	a6.put("cardtype", certs[k].getString("cardtype"));
	a6.put("cardno", certs[k].getString("cardno"));
	a6.put("startdate", certs[k].getString("startdate"));
	a6.put("enddate", certs[k].getString("enddate"));
	a6.put("remark", certs[k].getString("remark"));
	String  key= "temp"+k;
	a5.put(key,a6);
}
resume3.put("resume",resume2);
resume3.put("workExp",a1);
resume3.put("projExp",a3);
resume3.put("cert",a5);
resume3.put("resultMap",content);

out.println("<script>parent.test('"+resume3+"')</script>");  
 %>