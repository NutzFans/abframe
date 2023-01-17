<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/WEB-INF/runqianReport4.tld" prefix="report"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.runqian.report4.usermodel.Context"%>

<html> 
<link type="text/css" href="css/style.css" rel="stylesheet"/>

<head>
<title>test1</title>
</head>

<script type="text/javascript">
function show_product(unitno,year,month,type){ 
var strurl='http://127.0.0.1:6001/demo/reportJsp/showReport.jsp?raq=rpt_test_chanpinshouru.raq&unitno='+unitno+'&year='+year+'&month='+month+'&type='+type;
window.open(strurl,"_blank","height=500,width=600"); 
}

</script>

<body>


<%
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
<report:param name="jxcParam" paramFileName="rpt_test_unit_arg.raq"/>
<report:group groupFileName="rpt_test_unit.rpg" needPrint='yes' needSaveAsExcel='yes' needSaveAsPdf='yes'  needSaveAsWord='yes'/>
</body>
</html>