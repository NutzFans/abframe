<%@page import="com.eos.data.datacontext.UserObject"%>
<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/WEB-INF/runqianReport4.tld" prefix="report" %>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.runqian.report4.usermodel.Context"%>
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>

<html>
<head>
<link type="text/css" href="css/style.css" rel="stylesheet"/>
<script type="text/javascript" src="jquery.js"></script>
<!-- 实现页面遮罩效果 -->
	<style type="text/css">
		#bg{ display: none; position: absolute; top: 0%; left: 0%; width: 100%; height: 100%; background-color: #ccc; z-index:1001; -moz-opacity: 0.7; opacity:.70; filter: alpha(opacity=70);}
		.blue { 
			color: #d9eef7; 
			border: solid 1px #0076a3; 
			background: #0095cd; 
			background: -webkit-gradient(linear, left top, left bottom, from(#00adee), to(#0078a5)); 
			background: -moz-linear-gradient(top, #00adee, #0078a5); 
			filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#00adee', endColorstr='#0078a5'); 
		} 
		.blue:hover { 
			background: #007ead; 
			background: -webkit-gradient(linear, left top, left bottom, from(#0095cc), to(#00678e)); 
			background: -moz-linear-gradient(top, #0095cc, #00678e); 
			filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#0095cc', endColorstr='#00678e'); 
		} 
		.blue:active { 
			color: #80bed6; 
			background: -webkit-gradient(linear, left top, left bottom, from(#0078a5), to(#00adee)); 
			background: -moz-linear-gradient(top, #0078a5, #00adee); 
			filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#0078a5', endColorstr='#00adee'); 
		} 
	</style>
</head>
<body  style="height:100%;width:100%;overflow:-Scroll;overflow-x:hidden;overflow-y:scroll">
<% if(!(request.getParameter( "raq" ).equals("/outfeestat0803.raq")||request.getParameter( "raq" ).equals("/csContractRecognisedIncome1.raq")||request.getParameter( "raq" ).equals("/sales_performance.raq")||request.getParameter( "raq" ).equals("/deptBudget.raq"))){
 %>
 <div id=mengban style="background-color:white;position:absolute;z-index:999;width:100%;height:100%">
	<table width=100% height=100%>
		<tr><td width=100% style="text-align:center;vertical-align:middle"><img src="../images/loading.gif"><br>正在加载报表......</td></tr>
	</table>
</div>
 
 <%} %>
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
	String paramFile = report.substring(0,iTmp)+"_arg.raq";
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
		if (paramFile.equals("/sales_performance_arg.raq") ||paramFile.equals("/ame_projectcostsum_arg.raq")||paramFile.equals("/csContractRecognisedIncome_arg.raq")){
			UserObject user = (UserObject) request.getSession().getAttribute("userObject");
			String userid = user.getUserId();
			param.append("userid").append("=").append(userid).append(";");
		}
		
		
			
		
	}

	//以下代码是检测这个报表是否有相应的参数模板
	File f=new File(application.getRealPath(reportFileHome+ File.separator +paramFile));

%>
<jsp:include page="toolbar.jsp" flush="false" />
<%@ include file="performance.jsp" %> 
<%@ include file="raqLinkFunction.jsp" %>
<!-- 页面遮罩需要的DIV -->
<div id="bg"><span style="width: 100%;height: 100%;font-size: 22px;text-align: center;line-height: 500px">处理中...</span></div>
<table id="rpt" align="center" width=100% height=100%>
<%
if(report.equals("/ps_overall1.raq")){ %>
<tr>
<td colspan="3"><a href="/default/psoverall.xls">点击下载
			Excel 模板文件</a></td>
</tr>
<% }%>
	
	<tr><td align=left>
<%	//如果参数模板存在，则显示参数模板
	if( f.exists() ) {
	%>
		<table id="param_tbl"><tr><td>
			<tr>
					<td>
						<report:param name="form1" paramFileName="<%=paramFile%>"
							needSubmit="no"
							params="<%=param.toString()%>"
							
						/>
					</td>
					<td width="15px"></td>
					<td>
						<!-- 外包费用统计报表 -->
						<% if(report.equals("/outfeestat0803.raq")){ 
							StringBuffer param1=new StringBuffer();
							String reportParamsId=request.getParameter("reportParamsId");
							Hashtable paramtest = null;
							Date date = new Date();
							Calendar c = Calendar.getInstance();
							c.setTime(new Date());
							String year = c.get(Calendar.YEAR) + "";
							if(!"".equals(reportParamsId) && reportParamsId != null){
								paramtest = com.runqian.report4.view.ParamsPool.get( reportParamsId ); // 从参数池中取得参数
								Set<String> set = paramtest.keySet();
		       					List<String> list = new ArrayList<String>();
		       					for(String key : set){
		       						list.add(key);
								}// 把参数池中的参数放到 list 中
								year = (String)paramtest.get("niandu"); }
						%>
							<input type="button" class="blue" onclick="doOutFee(<%=year %>)" id="outfeebtn" value="数据预处理">
							<br/>
						<%}%>
						<a href="javascript:_submit( form1 )" ><img src="../images/search.gif" border=no style="vertical-align:middle"></a>
					</td>
					<%
						if(report.equals("/ps_insertRLD.raq")){ %>
						<td><input type="button" onclick="doUpdateIDRLD()" value="生成对应ID"></td>

						<% }%>
					
				</tr></table>
	</td></tr>
	<% }%>
	<tr><td align=center valign=top height=100%>
		<report:html name="report1" reportFileName="<%=report%>"
			funcBarLocation="top"
			needPageMark="yes"
			generateParamForm="no"
			needImportExcel="yes"
			params="<%=param.toString()%>"
			exceptionPage="/reportJsp/myError2.jsp"
			appletJarName="runqianReport4Applet.jar,dmGraphApplet.jar"
			needScroll="yes"
			scrollHeight="100%"
			scrollWidth="100%"
			needPagedScroll="no"
		/>
	</td></tr>


<%
if(report.equals("/department_PL_all.raq")){ 
   StringBuffer param1=new StringBuffer();
   String reportParamsId=request.getParameter("reportParamsId");
   Hashtable paramtest = null;
   if(!"".equals(reportParamsId) && reportParamsId != null){
       paramtest = com.runqian.report4.view.ParamsPool.get( reportParamsId ); // 从参数池中取得参数
       Set<String> set = paramtest.keySet();
       List<String> list = new ArrayList<String>();
       for(String key : set){
       list.add(key);
    }// 把参数池中的参数放到 list 中
   String year = (String)paramtest.get("year"); 
   int action = Integer.parseInt((String)paramtest.get("action"));
   System.out.print("xuqingqian"+year);
   
   %>
<tr>
<td><input type="button" onclick="PL_export(<%=year %>,<%=action %>)" value="导出所有事业部"></td>
</tr>
<% }}%>
</table>

<script language="javascript">
	document.getElementById( "mengban" ).style.display = "none";
	//设置分页显示值
	try{
		document.getElementById( "report1_scrollArea" ).style.margin = "auto";
	}catch(e){}
	document.getElementById( "t_page_span" ).innerHTML=report1_getTotalPage();
	document.getElementById( "c_page_span" ).innerHTML=report1_getCurrPage();
	
</script>
</body>
</html>
