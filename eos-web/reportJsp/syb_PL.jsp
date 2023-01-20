<%@page pageEncoding="UTF-8"%>
<%@include file="/common/common.jsp"%>
<%@include file="/common/skins/skin0/component.jsp" %>
<%@ taglib uri="/WEB-INF/runqianReport4.tld" prefix="report" %>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.runqian.report4.usermodel.Context"%>
<%@ page contentType="text/html;charset=UTF-8" %>

<h:css href="/css/style1/style-performance.css"/>
<script type="text/javascript" src="jquery.js"></script>



<style type="text/css">
#reportDiv{
width:auto;
height:auto;
border:0px solid green;
}

</style>

<script type="text/javascript">
function loadPage(href){
  	//document.getElementById("reportDiv").src = "testLoadReport_report.jsp?info=haha";
	//alert("haha");
	$("#reportDiv").html("<img src='images/loading.gif' border=no style='vertical-align:middle'>");
	$("#reportDiv").load(href);
}

</script>


<html>
<link type="text/css" href="css/style.css" rel="stylesheet"/>
<!-- 
  - Author(s): jiangnan
  - Date: 2013-07-12 14:02:16
  - Description:
-->
<head>
<title>部门PL表</title>
</head>
<body>

<table align="center" border="0" width="100%" class="form_table">
	<tr>
		<td class="form_label" width="10%">部门名称</td>
		<td id="firstBM" class="form_BM"></td>
	</tr>

</table>

<div id="reportDiv">&nbsp;</div>


</body>
</html>
<script>
doSelectFirst();
function doSelectFirst(){

	//调用业务流
	var myAjax = new Ajax("com.bos.mp.common.performance.getFirstBM.biz");
	//添加参数, 第一个为参数名, 第二个为参数值
	myAjax.addParam("orgid", "34,35,36");
	//还支持其他形式的参数,如entity,form等,详见参考手册.
	//开始调用
	myAjax.submit();
	//取得调用后的结果
	var orgnames =myAjax.getValues("/root/data/oaOrg/deptname");
	var orgids =myAjax.getValues("/root/data/oaOrg/deptno");
	var orgseqs =myAjax.getValues("/root/data/oaOrg/bgtunitno");
	var tempStr = "";
	for(var i=0;i<orgids.length;i++){
		tempStr += "<a href='#' onclick=doPerformance('" + orgids[i] + "');>"+orgnames[i]+"</a>&nbsp;&nbsp;&nbsp;&nbsp;";
		
	}
	document.getElementById("firstBM").innerHTML = tempStr;
}

function doPerformance(orgid){
	//alert("ID is "+orgid);
	loadPage("syb_PL_report.jsp?deptno="+orgid+"&year=2013");
	
	
}
</script>