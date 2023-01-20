<%@page import="com.zhonghe.ame.imptask.stringCommonUtil"%>
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
<%@page import="org.gocom.bps.wfclient.common.ServiceFactory"%>
<%@page import="commonj.sdo.DataObject"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="com.eos.workflow.data.WFWorkItem"%>
<%@page import="com.eos.workflow.api.IWFWorkItemManager"%>
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
<title>微信</title>
</head>
<body>
	<%
		
		IUserObject userObject = (IUserObject)request.getSession().getAttribute("userObject");
		String userID =null;
		if(userObject!=null){
			userID = (String)userObject.getUserId();
		}%>
		<%
		String state = request.getParameter("state");
		String workitemid = request.getParameter("workitemid");
		if(userID !=null){
			//state(1:首页2：待办)
			if(state.equals("1")){
				response.sendRedirect(request.getContextPath()+"/ame/clipview/index.jsp");
			}else if(state.equals("2")){
					long workItemID = 0;
					if(!StringUtils.isBlank(workitemid)){
						workItemID = Long.parseLong(workitemid);
					}
					System.out.println("workItemID="+workItemID);
					boolean flag =ServiceFactory.getWFSecurityManager().hasAccessWorkItemPermission(Long.parseLong(workitemid));
					if(!flag){
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
						response.sendRedirect(request.getContextPath()+"/bps/wfclient/task/dispatchTaskExecute.jsp?workItemID="+workitemid);
					}
				}
		}else{
			String userId = request.getParameter("userId");
			
			if(userId!=null){
				String url = BusinessDictUtil.getDictName("AME_WE_CHAT", "TGT_URL");
				String tgt =HttpClientUtil.getMethodInvoke(url,"userId="+userId);
				Cookie cookie = null;
				if(tgt!=null){
					cookie = new Cookie("cas-login","CASTGC="+URLEncoder.encode(tgt, "UTF-8"));
					cookie.setSecure(false);
					cookie.setDomain("172.17.133.198:8080");
					cookie.setPath("/");         
					cookie.setVersion(0);
				}
				//SSO绕过之后，没有登陆系统，需要手动初始化Session
				WeChatUtil.wechatLogin(userId, request, response);
				//设置SSO参数，已经登录过，不可删掉
				session.setAttribute("edu.yale.its.tp.cas.client.filter.user", userId);
				response.addCookie(cookie);
				
				//state(1:首页2：待办)
				if(state.equals("1")){
					response.sendRedirect(request.getContextPath()+"/ame/clipview/index.jsp");
				}else if(state.equals("2")){
						long workItemID = 0;
						if(!StringUtils.isBlank(workitemid)){
							workItemID = Long.parseLong(workitemid);
						}
						System.out.println("workItemID="+workItemID);
						boolean flag =ServiceFactory.getWFSecurityManager().hasAccessWorkItemPermission(Long.parseLong(workitemid));
						if(!flag){
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
							response.sendRedirect(request.getContextPath()+"/bps/wfclient/task/dispatchTaskExecute.jsp?workItemID="+workitemid);
						}
					}
				}
			} 
	%>

</body>
<script type="text/javascript">
console.log(document.referrer)
</script>
</html>