<%@page import="com.eos.runtime.core.TraceLoggerFactory"%>
<%@page import="com.eos.system.logging.Logger"%>
<%@page import="com.eos.foundation.eoscommon.BusinessDictUtil"%>
<%@page import="com.primeton.eos.ame_common.WeChatUtil"%>
<%@page import="org.json.simple.JSONValue"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="com.primeton.eos.ame_common.HttpClientUtil"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-cmn-Hans">
<!-- 
  - Author(s): 许青倩
  - Date: 2017-08-31 15:01:47
  - Description:
-->
<head>
<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=yes">
<title>AME+</title>
<link rel="stylesheet" href="/default/common/weui.css"/>
</head>
<body>
<%
	String qs = request.getQueryString();
	Logger log = TraceLoggerFactory.getLogger(this.getClass());
	log.info("qs="+qs);
	String message = request.getParameter("message");
	if(message==null){
		log.info("code is null");
		request.setAttribute("tips", "你没有权限访问该页面");
		//response.sendRedirect(request.getContextPath()+"/common/noPermission.jsp");
		%>
		
				<div class="page__bd page__bd_spacing" style="margin-top:38%;">
				    <div class="icon-box" align="center">
			            <i class="weui-icon-info weui-icon_msg"></i>
			            <div class="icon-box__ctn">
			                <h5 class="icon-box__title" >你没有权限访问该页面</h5>
			            </div>
		        	</div>
		        </div>
		<%
	}else if (message.equals("delete")){
		log.info("message is delete");
		request.setAttribute("tips", "该工时已被填报人删除，无需确认");
		//response.sendRedirect(request.getContextPath()+"/common/noPermission.jsp");
		%>
				<div class="page__bd page__bd_spacing" style="margin-top:38%;">
				    <div class="icon-box" align="center">
			            <i class="weui-icon-info weui-icon_msg"></i>
			            <div class="icon-box__ctn">
			                <h5 class="icon-box__title" >该工时已被填报人删除，无需确认</h5>
			            </div>
		        	</div>
		        </div>
	<%}else if (message.equals("change")){
		log.info("message is change");
		request.setAttribute("tips", "该工时已被填报人修改受益部门，无需确认");
		//response.sendRedirect(request.getContextPath()+"/common/noPermission.jsp");
	%>
				<div class="page__bd page__bd_spacing" style="margin-top:38%;">
				    <div class="icon-box" align="center">
			            <i class="weui-icon-info weui-icon_msg"></i>
			            <div class="icon-box__ctn">
			                <h5 class="icon-box__title" >该工时已被填报人修改受益部门，无需确认</h5>
			            </div>
		        	</div>
		        </div>
	<%}else if (message.equals("pmo")){
		log.info("message is pmo");
		request.setAttribute("tips", "该工时已被PMO审核，无需确认");
		//response.sendRedirect(request.getContextPath()+"/common/noPermission.jsp");
	%>
				<div class="page__bd page__bd_spacing" style="margin-top:38%;">
				    <div class="icon-box" align="center">
			            <i class="weui-icon-info weui-icon_msg"></i>
			            <div class="icon-box__ctn">
			                <h5 class="icon-box__title" >该工时已被PMO审核，无需确认</h5>
			            </div>
		        	</div>
		        </div>
	<%}else if (message.equals("fin")){
		log.info("message is fin");
		request.setAttribute("tips", "该工时已被财务核算，无需确认");
		//response.sendRedirect(request.getContextPath()+"/common/noPermission.jsp");
	%>
				<div class="page__bd page__bd_spacing" style="margin-top:38%;">
				    <div class="icon-box" align="center">
			            <i class="weui-icon-info weui-icon_msg"></i>
			            <div class="icon-box__ctn">
			                <h5 class="icon-box__title" >该工时已被财务核算，无需确认</h5>
			            </div>
		        	</div>
		        </div>
	<%}else if (message.equals("confirmed")){
		log.info("message is confirmed");
		request.setAttribute("tips", "该工时已确认，无法再提出疑问");
		//response.sendRedirect(request.getContextPath()+"/common/noPermission.jsp");
	%>
				<div class="page__bd page__bd_spacing" style="margin-top:38%;">
				    <div class="icon-box" align="center">
			            <i class="weui-icon-info weui-icon_msg"></i>
			            <div class="icon-box__ctn">
			                <h5 class="icon-box__title" >该工时已确认，无法再提出疑问</h5>
			            </div>
		        	</div>
		        </div>
	<%}else if (message.equals("sales")){
		log.info("message is confirmed");
		request.setAttribute("tips", "该工时已确认，无法再确认");
		//response.sendRedirect(request.getContextPath()+"/common/noPermission.jsp");
	%>
				<div class="page__bd page__bd_spacing" style="margin-top:38%;">
				    <div class="icon-box" align="center">
			            <i class="weui-icon-info weui-icon_msg"></i>
			            <div class="icon-box__ctn">
			                <h5 class="icon-box__title" >该工时已确认，无法再确认</h5>
			            </div>
		        	</div>
		        </div>
	<%}
%>
</body>
</html>