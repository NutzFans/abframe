<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ taglib uri="/WEB-INF/raqsoftReport.tld" prefix="report" %>
<%@ page import="com.raqsoft.report.util.*"%>
<% 
	if(request.getProtocol().compareTo("HTTP/1.1")==0 ) response.setHeader("Cache-Control","no-cache");
	else response.setHeader("Pragma","no-cache");
	request.setCharacterEncoding( "UTF-8" );
	String appmap = request.getContextPath();
	String report = request.getParameter( "rpx" );
	String scroll = request.getParameter( "scroll" );
	if (scroll==null || scroll.length()==0) scroll = "no";
%>

<%
	if(report.equals("/budget/deptBudget.rpx")){
	   	String orgid=(String)com.raqsoft.report.util.ReportUtils.getReportParamValue(request, "orgid");
	   	String year=(String)com.raqsoft.report.util.ReportUtils.getReportParamValue(request, "year");
	   	String action=(String)com.raqsoft.report.util.ReportUtils.getReportParamValue(request, "action");
	
%>
<input id="orgids" type="hidden" value="<%=orgid %>"/>
<input id="years" type="hidden" value="<%=year %>"/>
<input id="action" type="hidden" value="<%=action %>"/>
<% } %>
<report:html name="report1" reportFileName="<%=report%>"
	funcBarLocation="no"
	needScroll="yes"
	scrollWidth="100%" 
	scrollHeight="100%"
	needImportEasyui="no"
/>
<script language="javascript">
	document.getElementById( "t_page_span" ).innerHTML = getPageCount( "report1" );
	document.getElementById( "report1_currPage" ).innerHTML = getCurrPage( "report1" );
	<%
		if(report.equals("/budget/deptBudget.rpx")){
	 %>
	document.getElementById("deptBudget_export").style.display="";
	<% }%>
	try{ _resizeScroll('report1');}catch(ex){}
</script>
