<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/WEB-INF/runqianReport4.tld" prefix="report" %>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.runqian.report4.usermodel.Context"%>

<html>
<link type="text/css" href="css/style.css" rel="stylesheet"/>

<%
	request.setCharacterEncoding( "GBK" );

	String deptno = request.getParameter( "deptno" );
	int deptnoInt = Integer.parseInt(deptno);
	String title="";
	switch(deptnoInt){
	case 34:
		title="中间件";
		break;
	
	case 35:
		title="公共";
		break;
	
	default:
		title="金融";
		break;
	}
	
	String reportFileHome=Context.getInitCtx().getMainDir();
	StringBuffer param=new StringBuffer();

	Enumeration paramNames = request.getParameterNames();
	if(paramNames!=null){
		while(paramNames.hasMoreElements()){
			String paramName = (String) paramNames.nextElement();
			String paramValue=request.getParameter(paramName);
			if(paramValue!=null){
				//把参数拼成name=value;name2=value2;.....的形式
				param.append(paramName).append("=").append(paramValue).append(";");
			}
		}
	}

%>

<head>
<title>2013年<%=title %>事业部损益表</title>
</head>

<body topmargin=0 leftmargin=0 rightmargin=0 bottomMargin=0>

<jsp:include page="toolbar.jsp" flush="false" />
<%@ include file="performance.jsp" %> 

<table id="rpt" align="center"><tr><td>


		<report:html name="report1" reportFileName="dept_PL_20130926.raq"
			funcBarLocation="top"
			needPageMark="yes"
			generateParamForm="no"
			params="<%=param.toString()%>"
			exceptionPage="/reportJsp/myError2.jsp"
			appletJarName="runqianReport4Applet.jar,dmGraphApplet.jar"


		/>
</td></tr>
</table>

<script language="javascript">

</script>
</body>
</html>
