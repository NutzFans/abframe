<%@page import="com.eos.data.datacontext.UserObject"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="/WEB-INF/raqsoftReport.tld" prefix="report" %>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.net.*" %>
<%@ page import="com.raqsoft.report.usermodel.Context"%>
<%@ page import="com.raqsoft.report.view.*"%>
<%@ page import="com.raqsoft.report.util.*"%>
<%--JS方法_asset_cast仅供测试环境使用！请不要随意提交到生产的amereport环境--%>
<%--JS方法_asset_cast仅供测试环境使用！请不要随意提交到生产的amereport环境--%>
<%--JS方法_asset_cast仅供测试环境使用！请不要随意提交到生产的amereport环境--%>
<%--JS方法_asset_cast仅供测试环境使用！请不要随意提交到生产的amereport环境--%>
<%--JS方法_asset_cast仅供测试环境使用！请不要随意提交到生产的amereport环境--%>
<%--JS方法_asset_cast仅供测试环境使用！请不要随意提交到生产的amereport环境--%>

<html>
<head>
    <meta name="viewport" content="initial-scale=1" />
    <title>报表显示</title>
</head>
<link type="text/css" href="css/style.css" rel="stylesheet"/>
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
<script type="text/javascript" src="jquery.js"></script>
<% 
	if(request.getProtocol().compareTo("HTTP/1.1")==0 ) response.setHeader("Cache-Control","no-cache");
	else response.setHeader("Pragma","no-cache");
	request.setCharacterEncoding( "UTF-8" );
	String appmap = request.getContextPath();
%>
<link rel="stylesheet" type="text/css" href="<%=appmap%><%=ReportConfig.raqsoftDir%>/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=appmap%><%=ReportConfig.raqsoftDir%>/easyui/themes/icon.css">
<script type="text/javascript" src="<%=appmap%><%=ReportConfig.raqsoftDir%>/easyui/jquery.min.js"></script>
<script type="text/javascript" src="<%=appmap%><%=ReportConfig.raqsoftDir%>/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=appmap%><%=ReportConfig.raqsoftDir%>/easyui/locale/easyui-lang-zh_CN.js"></script>

<body topmargin=0 leftmargin=0 rightmargin=0 bottomMargin=0 style="background:#F1F4F7" onload="try{parent.hideLoading()}catch(e){}">
<jsp:include page="echartjs.jsp" flush="false" />
<script>
	$.ajax({
			type:"post",
			dataType : 'json',
			data:{"reportname":"<%=request.getParameter( "rpx" ) %>"},
			async:false,
  			url:"com.primeton.xbb.importExcel.runqianAuthority.getMenuCode.biz.ext",
  			success:function(result){
	  			var funccode = result.menue.funccode;
				var menuname = result.menue.menuname;
				$(document).attr('title',menuname);
  			}
  		});
</script>
<%
	String report = request.getParameter( "rpx" );
	String scroll = request.getParameter( "scroll" );
	if (scroll==null || scroll.length()==0) scroll = "no";
	StringBuffer param=new StringBuffer();
	
	//保证报表名称的完整性
	int iTmp = 0;
	if( (iTmp = report.lastIndexOf(".rpx")) <= 0 ){
		iTmp = report.length();
		report = report + ".rpx";
	}
	String paramFile = report.substring(0,iTmp)+"_arg.rpx";
	Enumeration paramNames = request.getParameterNames();
	//获取登录名
	UserObject user = (UserObject) request.getSession().getAttribute("userObject");
	String userid = user.getUserId();
	if(paramNames!=null){
		while(paramNames.hasMoreElements()){
			String paramName = (String) paramNames.nextElement();
			String paramValue=request.getParameter(paramName);
			//System.out.println("paramValue="+paramValue);
			if(paramValue!=null){
				//把参数拼成name=value;name2=value2;.....的形式
				param.append(paramName).append("=").append(paramValue).append(";");
			}
		}
		//登录名加入参数	
		param.append("userid").append("=").append(userid).append(";");
	}
	String resultPage = "queryReport.jsp?rpx=" + URLEncoder.encode( report, "UTF-8" ) + "&scroll=" + scroll;

	//以下代码是检测这个报表是否有相应的参数模板
	boolean hasParam = ReportUtils.isReportFileExist( paramFile );
%>
<div id=mengban style="background-color:white;position:absolute;z-index:999;width:100%;height:100%">
	<table width=100% height=100%>
		<tr><td width=100% style="text-align:center;vertical-align:middle"><img src="../raqsoft/images/loading.gif"><br>正在加载报表......</td></tr>
	</table>
</div>
<div id=reportArea class="easyui-layout" data-options="fit:true" style="display:none;width:100%;height:100%">
<div data-options="region:'north',border:false" style="height:30px;overflow:hidden">
<jsp:include page="toolbar.jsp" flush="false" />
<jsp:include page="raqLinkFunction.jsp" flush="false" />
</div>
<div data-options="region:'center',border:false">
<div class="easyui-layout" data-options="fit:true">
	<%	//如果参数模板存在，则显示参数模板
	if( hasParam ) {
	%>
		<div data-options="region:'north',border:false"><center>
			<table id="param_tbl" align=left><tr><td>
				<report:param name="form1" paramFileName="<%=paramFile%>"
					needSubmit="no"
					mobileMode="no"
					params="<%=param.toString()%>"
					hiddenParams="<%=param.toString()%>"
					needImportEasyui="no"
					resultContainer="reportContainer"
					resultPage="<%=resultPage%>"
				/>
			</td>
			<%if (paramFile.equals("asset/assetArea_arg.rpx")){%>
			<td style="padding-left:15px"><a href="javascript:_asset_cast()" class="easyui-linkbutton" style="vertical-align:middle;padding:0px 8px;">计算</a></td>
			<% }%>
			<td style="padding-left:15px"><a href="javascript:_submit( form1 )" class="easyui-linkbutton" style="vertical-align:middle;padding:0px 8px;">查询</a></td>
			<%if (paramFile.equals("/budget/deptBudget_arg.rpx")){%>
			<td style="padding-left:15px"><a href="javascript:impDeptBudgetData()" class="easyui-linkbutton" style="vertical-align:middle;padding:0px 8px;">导入预算数据</a></td>
			<td style="padding-left:15px"><a id="deptBudget_export" href="javascript:deptBudget_export()" class="easyui-linkbutton" style="display:none;vertical-align:middle;padding:0px 8px;">导出本部门及下级部门</a></td>
			
			<% }%>
	            
			</tr></table>
		</center></div>
	<% }%>
	<div id=reportContainer data-options="region:'center',border:false" style="text-align:left">
		<report:html name="report1" reportFileName="<%=report%>"
			funcBarLocation="no"
			needScroll="yes"
			generateParamForm="no"
			params="<%=param.toString()%>"
			exceptionPage="/reportJsp/myError2.jsp"
			appletJarName="/raqsoftReportApplet.jar"
			scrollWidth="100%" 
			scrollHeight="100%"
			needImportEasyui="no"
		/>
	</div>
</div>
</div>
<script language="javascript">
	//var autoSelectWhileFilter = false;
	//设置分页显示值
	try {
		document.getElementById( "t_page_span" ).innerHTML = getPageCount( "report1" );
		document.getElementById( "report1_currPage" ).innerHTML = getCurrPage( "report1" );
	}catch(e){}
	document.getElementById( "mengban" ).style.display = "none";
	document.getElementById( "reportArea" ).style.display = "";
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
		{return;}
			var json={year1:year1,month1:month1};
			var messageId = nui.loading("正在计算中,请稍后...","提示");
			nui.ajax({
		    	url: "com.primeton.eos.machine.machine.assetCast.biz.ext",//url: "http://ame.primeton.com/com.primeton.eos.machine.machine.assetCast.biz.ext",
		    	type: "post",
		    	dataType:"json",    //测试环境用，不要随意提交amereport环境，需按照注释内容修改dataType:"jsonp",jsonp: "callbackparam",  跨域json请求一定是jsonp，  
		    	data: json,
		    	cache: false,
		    	contentType: 'text/json',
		    	success: function (o) {
			    	nui.hideMessageBox(messageId);
		    		alert("计算成功！");
		    	},
		    	error: function (o) {
			    	nui.hideMessageBox(messageId);
		    		alert("计算成功！");
		    	}
		    });
		}
	}
</script>
<form name="viewlist1" id="viewlist1" action="com.primeton.eos.ame_common.ameExportCommon.flow" method="post">
	<input type="hidden" name="_eosFlowAction" value="action0" filter="false"/>
	<input type="hidden" name="downloadFile" filter="false"/>
	<input type="hidden" name="fileName" filter="false"/>
</form>
</body>
</html>
