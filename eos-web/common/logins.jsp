<%@page import="java.net.URLEncoder"%>
<%@page import="com.runqian.report4.model.expression.function.string.URLEncode"%>
<%@page import="java.net.URL"%>
<%@page import="com.eos.data.datacontext.IUserObject"%>
<%@page import="com.eos.runtime.core.TraceLoggerFactory"%>
<%@page import="com.eos.system.logging.Logger"%>
<%@page import="com.eos.foundation.eoscommon.BusinessDictUtil"%>
<%@page import="com.primeton.eos.ame_common.WeChatUtil"%>
<%@page import="com.primeton.eos.ame_common.Constants"%>
<%@page import="org.json.simple.JSONValue"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="com.primeton.eos.ame_common.HttpClientUtil"%>
<%@page import="commonj.sdo.DataObject"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-cmn-Hans">
<!-- 
  - Author(s): shihao
  - Date: 2016-11-29 17:13:47
  - Description:
-->
<head>
<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=yes">
<title>登陆</title>
<link rel="stylesheet" href="./weui.css"/>
</head>
<body>
<%
	Logger log = TraceLoggerFactory.getLogger(this.getClass());
				String url = BusinessDictUtil.getDictName("AME_WE_CHAT", "TGT_URL");
				String tgt =HttpClientUtil.getMethodInvoke(url,"userId=youke");
				Cookie cookie = null;
				System.out.println("asdasdas-----------------------");
				if(tgt!=null){
						
						cookie = new Cookie("cas-login","CASTGC="+URLEncoder.encode(tgt, "UTF-8"));
					    cookie.setSecure(false);
					    cookie.setDomain("ame.primeton.com");
					    cookie.setPath("/");         
					    cookie.setVersion(0);
				}
				if(cookie==null){
					log.info("cookie 获取失败");
		%>
		        	<div class="page__bd page__bd_spacing" style="margin-top:38%;">
					    <div class="icon-box" align="center">
				            <i class="weui-icon-info weui-icon_msg"></i>
				            <div class="icon-box__ctn">
				                <h3 class="icon-box__title">登录失败，请联系管理员</h3>
				            </div>
			        	</div>
			        </div>
		<%		
				}else{
					
					//SSO绕过之后，没有登陆系统，需要手动初始化Session
					WeChatUtil.wechatLogin("youke", request, response);
					//设置SSO参数，已经登录过，不可删掉
					session.setAttribute("edu.yale.its.tp.cas.client.filter.user", "youke");
					response.addCookie(cookie);
 					String phoneNumber = (String) request.getParameter("phoneNumber");
  					String workItemID = (String) request.getParameter("workItemID");

					//以state为参数，用来分配跳转，可以考虑用业务字典来实现
						response.sendRedirect(request.getContextPath()+"/abframe/org/intendstaff/intendStaffInfoEntry.jsp?phoneNumber="+phoneNumber+"&workItemID="+workItemID);
					
					}
					
%>
</body>
</html>