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
<body topmargin=0 leftmargin=0 rightmargin=0 bottomMargin=0>
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

<table id="rpt" align="center">
	<tr>
		<td>
<%	//如果参数模板存在，则显示参数模板
	if( f.exists() ) {
	%>
			<table id="param_tbl">
				<tr>
					<td>
						<report:param name="form1" paramFileName="<%=paramFile%>"
							needSubmit="no"
							params="<%=param.toString()%>"
						/>
					</td>
					<td><a href="javascript:_asset_cast()" id="castbutton"><img src="../images/cast.gif" border=no style="vertical-align:middle"></a></td>
					<td><a href="javascript:_submit( form1 )"><img src="../images/search.gif" border=no style="vertical-align:middle"></a></td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td>
<% }%>

			<report:html name="report1" reportFileName="<%=report%>"
				funcBarLocation="top"
				needPageMark="yes"
				generateParamForm="no"
				params="<%=param.toString()%>"
				exceptionPage="/reportJsp/myError2.jsp"
				appletJarName="runqianReport4Applet.jar,dmGraphApplet.jar"
				
				needScroll="yes"

 				scrollBorder='yes'
				needPagedScroll="no"

			/>
		</td>
	</tr>
</table>


<script >
	//设置分页显示值
	
	document.getElementById( "t_page_span" ).innerHTML=report1_getTotalPage();
	document.getElementById( "c_page_span" ).innerHTML=report1_getCurrPage();

	function show_moduleDetail(projectid,module,date){
		var strurl='showCodeReport.jsp?raq=report2_code.raq&projectid='+encodeURI(projectid)+'&module='+module+'&date='+date;
		window.open(strurl,"_blank");
	}

	function _asset_cast(){
		var button = document.getElementById("castbutton");
		button.href = "#";
		var date1 = document.getElementById("date").value;
		var projectid = document.getElementById("projectid").value;
		if(date1==null||date1==''){
			alert("计算代码行时日期必填!");
			button.href = "javascript:_asset_cast()";
			return;
		}else if(projectid==null||projectid==''){
			alert("计算代码行时项目名必选!");
			button.href = "javascript:_asset_cast()";
			return;
		}else{
			var json={projectid: projectid, date: date1};
			var messageId = nui.loading("正在计算中,请稍后...","提示");
			nui.ajax({
		    	url: "com.primeton.eos.bugsys.bugsysApply.castCode.biz.ext",
		    	data: json,
		    	type: "post",
		    	cache: false,
		    	contentType: 'text/json',
		    	success: function (o) {
		    		nui.hideMessageBox(messageId);
		    		button.href = "javascript:_asset_cast()";
		    	},
		    	error: function(){}
		    });
	    }
	}
</script>
</body>
</html>



