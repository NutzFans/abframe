<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/WEB-INF/runqianReport4.tld" prefix="report" %>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.runqian.report4.usermodel.Context"%>

<html>
<head>
<link type="text/css" href="css/style.css" rel="stylesheet"/>
<script src="../common/nui/nui.js" type="text/javascript"></script>
<script type="text/javascript" src="jquery.js"></script>
</head>
<body style="height:100%;width:100%;overflow:-Scroll;overflow-x:hidden;overflow-y:scroll">
<script>

jQuery(function(){
//	alert("window:"+jQuery(window).height());
//	alert("body:"+jQuery('body').height());
//	alert("report1:"+jQuery('#report1_scrollArea').offset().top);
	var r = function() {
		var scrollArea = jQuery('#report1_scrollArea');
		scrollArea.height(jQuery(window).height() - scrollArea.offset().top - 30);
		scrollArea.width(jQuery(window).width() - 30);
	};
	r();
	jQuery(window).resize(function() {
		r();
		_resizeScroll('report1');
	});
});
</script>
<%
	request.setCharacterEncoding( "GBK" );
	String report = request.getParameter( "raq" );
	String reportFileHome=Context.getInitCtx().getMainDir();
	StringBuffer param=new StringBuffer();
	
	//保证报表名称的完整性
	int iTmp = 0;
	if( (iTmp = report.lastIndexOf(".raq")) <= 0 ){
		report = report + ".raq";
		iTmp = 0;
	}
	
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

	//以下代码是检测这个报表是否有相应的参数模板
	String paramFile = report.substring(0,iTmp)+"_arg.raq";
	File f=new File(application.getRealPath(reportFileHome+ File.separator +paramFile));

%>
<jsp:include page="toolbar.jsp" flush="false" />
<%@ include file="performance.jsp" %> 
<%@ include file="raqLinkFunction.jsp" %>
<table id="rpt" align="center" width=100% height=100%>
<%	//如果参数模板存在，则显示参数模板
	if( f.exists() ) {
	%>
	<tr><td align=center>
		<table id="param_tbl"><tr><td>
			<report:param name="form1" paramFileName="<%=paramFile%>"
				needSubmit="no"
				params="<%=param.toString()%>"
				
			/>
		</td>
		<td><a href="javascript:_asset_cast()"><img src="../images/cast.gif" border=no style="vertical-align:middle"></a></td>
		<td><a href="javascript:_submit( form1 )"><img src="../images/search.gif" border=no style="vertical-align:middle"></a></td>
		</tr></table>
	</td></tr>
	<% }%>
	<tr><td align=center valign=top height=100%>
		<report:html name="report1" reportFileName="<%=report%>"
			funcBarLocation="top"
			needPageMark="yes"
			generateParamForm="no"
			params="<%=param.toString()%>"
			exceptionPage="/reportJsp/myError2.jsp"
			appletJarName="runqianReport4Applet.jar,dmGraphApplet.jar"
			needScroll="yes"
			scrollHeight="100%"
			scrollWidth="100%"

		/>
	</td></tr>
</table>

<script language="javascript">
	//设置分页显示值
	try{
		document.getElementById( "report1_scrollArea" ).style.margin = "auto";
	}catch(e){}
	document.getElementById( "t_page_span" ).innerHTML=report1_getTotalPage();
	document.getElementById( "c_page_span" ).innerHTML=report1_getCurrPage();
	function _asset_cast(){
		var year1 = document.getElementById("year1").value;
		var month1 = document.getElementById("month1").value;
		if(year1==null||year1==''){
			alert("年份必填!");
			return;
		}else if(month1==null||month1==''){
			alert("月份必填!");
			return;
		}else{
		if(!confirm("计算将覆盖原有的数据，您确定重新计算吗？"))
		{return；}
			var json={year1:year1,month1:month1};
			var messageId = nui.loading("正在计算中,请稍后...","提示");
			nui.ajax({
		    	url: "com.primeton.eos.machine.machine.assetCast.biz.ext",
		    	data: json,
		    	type: "post",
		    	cache: false,
		    	contentType: 'text/json',
		    	success: function (o) {
			    	nui.hideMessageBox(messageId);
		    		alert("计算成功！");
		    	}
		    });
		}
	}
</script>
</body>
</html>
