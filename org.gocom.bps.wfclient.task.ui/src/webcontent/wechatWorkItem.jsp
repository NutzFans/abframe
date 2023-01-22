<%@page import="com.eos.runtime.core.TraceLoggerFactory"%>
<%@page import="com.eos.system.logging.Logger"%>
<%@page import="java.util.StringTokenizer"%>
<%@page import="com.primeton.ext.engine.core.processor.DirectPageflowDispatcher"%>
<%@page import="com.primeton.engine.core.impl.context.PageflowRuntimeContext"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="com.eos.workflow.data.WFWorkItem"%>
<%@page import="com.eos.workflow.api.IWFWorkItemManager"%>
<%@page import="org.gocom.bps.wfclient.common.ServiceFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false" %>
<!DOCTYPE html>
<html lang="zh-cmn-Hans">
<head>
<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=yes,minimum-scale=1.0, maximum-scale=1.0">
<title>微信</title>
<link rel="stylesheet" href="/default/common/weui.css"/>
</head>
<%
    Logger log = TraceLoggerFactory.getLogger(this.getClass());
	String workItemIDStr = request.getParameter("workItemID");//redirect支持
	String isShow = request.getParameter("isShowDetail");
	long workItemID = 0;
	if(!StringUtils.isBlank(workItemIDStr)){
		workItemID = Long.parseLong(workItemIDStr);
	}
	if(StringUtils.isBlank(isShow)){
		isShow = (String)request.getAttribute("isShowDetail");
		if(StringUtils.isBlank(isShow)){
			isShow = "true";
		}
	}
	if(workItemID <= 0){
		log.info("workItemID == 0");
	 %>
	   <div class="page__bd page__bd_spacing" style="margin-top:38%;">
				    <div class="icon-box" align="center">
			            <i class="weui-icon-info weui-icon_msg"></i>
			            <div class="icon-box__ctn">
			                <h4 class="icon-box__title">该工作项已被执行或你没有该工作项的执行权限!</h4>
			            </div>
		        	</div>
		</div>
	 <% 
		return;
	}	
	boolean flag =ServiceFactory.getWFSecurityManager().hasAccessWorkItemPermission(workItemID);
	if(!flag){
	 log.info("flag:"+flag);
	 %>
	   <div class="page__bd page__bd_spacing" style="margin-top:38%;">
				    <div class="icon-box" align="center">
			            <i class="weui-icon-info weui-icon_msg"></i>
			            <div class="icon-box__ctn">
			                <h3 class="icon-box__title">该工作项已被执行或你没有该工作项的执行权限!</h3>
			            </div>
		        	</div>
		</div>
	 <% 
		return;
	}else{
		WFWorkItem workItem = ServiceFactory.getWFWorkItemManager().queryWorkItemDetail(workItemID);
		
		request.setAttribute("isShowDetail", isShow);
		request.setAttribute("workItemID", workItem.getWorkItemID());
		request.setAttribute("workitem", workItem);
		request.getRequestDispatcher("wechatTask.jsp").forward(request, response);
		out.clear();
		out = pageContext.pushBody();
	}
%>