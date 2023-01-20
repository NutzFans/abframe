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
  - Author(s): shihao
  - Date: 2016-11-29 17:13:47
  - Description:
-->
<head>
<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=yes">
<title>微信</title>
<link rel="stylesheet" href="./weui.css"/>
</head>
<body>
<%
	
	Logger log = TraceLoggerFactory.getLogger(this.getClass());
	String code = request.getParameter("code");
	if(code==null){
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
	}else{
		String processInstID = request.getParameter("processInstID");
		String state = request.getParameter("state");
		String access_token = BusinessDictUtil.getDictName("AME_WE_CHAT", "TOKEN");
		String url = BusinessDictUtil.getDictName("AME_WE_CHAT", "USERINFO_URL");
		String msg =  HttpClientUtil.getMethodInvoke(url, "access_token="+access_token+"&code="+code);
		JSONObject json = (JSONObject)JSONValue.parse(msg);
		log.info("获取用户信息结果:"+msg);
		Long errcode = (Long)json.get("errcode");
		if(errcode!=null){
			if(errcode==40014){//token过期了
				String re_str = WeChatUtil.getAccessToken();
				if(re_str.equals("SUCC")){
					//重新获取token
					access_token = BusinessDictUtil.getDictName("AME_WE_CHAT", "TOKEN");
					msg = HttpClientUtil.getMethodInvoke(url, "access_token="+access_token+"&code="+code);
					json = (JSONObject)JSONValue.parse(msg);
					log.info("token过期之后，获取用户信息结果:"+msg);
				}else{
			%>
			    <div class="page__bd page__bd_spacing" style="margin-top:38%;">
				    <div class="icon-box" align="center">
			            <i class="weui-icon-info weui-icon_msg"></i>
			            <div class="icon-box__ctn">
			                <h3 class="icon-box__title">你没有权限访问该页面</h3>
			            </div>
		        	</div>
		        </div>
			<%
			}
		  }
		}
		
		String userId = (String)json.get("UserId");	
		if(userId!=null){
			boolean flag = false;
			url = BusinessDictUtil.getDictName("AME_WE_CHAT", "TGT_URL");
			String tgt =HttpClientUtil.getMethodInvoke(url,"userId="+userId);
			Cookie cookie = null;
			if(tgt!=null){
					cookie = new Cookie("CASTGC",tgt);
				    cookie.setSecure(true);//必须的,用户保密
				    cookie.setDomain("ame.primeton.com");
				    cookie.setPath("/sso-server");         
				    cookie.setVersion(0);
			}
			if(cookie==null){
	%>
	        	<div class="page__bd page__bd_spacing" style="margin-top:38%;">
				    <div class="icon-box" align="center">
			            <i class="weui-icon-info weui-icon_msg"></i>
			            <div class="icon-box__ctn">
			                <h3 class="icon-box__title">你没有权限访问该页面</h3>
			            </div>
		        	</div>
		        </div>
	<%		
			}else{
				//SSO绕过之后，没有登陆系统，需要手动初始化Session
				WeChatUtil.wechatLogin(userId, request, response);
				try{
				    //校验用户是否存在
					 flag = WeChatUtil.checkUser(userId);
				}catch(Throwable e){
					log.info("checkUser err:"+e);
				} 
				log.info("checkUser 33:"+flag);
				if(flag){
					//设置SSO参数，已经登录过，不可删掉
					session.setAttribute("edu.yale.its.tp.cas.client.filter.user", userId);
					response.addCookie(cookie);
					//以state为参数，用来分配跳转，可以考虑用业务字典来实现
					if(state==null){
						response.sendRedirect(request.getContextPath()+"/bps/wfclient/task/taskList.jsp?taskType=self");
					}else if(state.equals("1")){
						response.sendRedirect(request.getContextPath()+"/bps/wfclient/task/taskList.jsp?taskType=self");
					}else if(state.equals("2")){
						response.sendRedirect(request.getContextPath()+"/common/skins/layouts/default/main.jsp");
					}else if(state.equals("3")){
						response.sendRedirect(request.getContextPath()+"/bps/wfclient/task/taskView.jsp?processInstID="+processInstID);
					}else{
						String qs = request.getQueryString();
						boolean wStart =  state.startsWith("W");
						//获取后面的内容
						String id =state.substring(1);
						//是否是数字
						boolean isNumb = Character.isDigit(id.charAt(0));
						if(wStart&&isNumb){
							response.sendRedirect(request.getContextPath()+"/bps/wfclient/task/wechatWorkItem.jsp?workItemID="+id);
						}else{
							response.sendRedirect(request.getContextPath()+"/com.primeton.eos.ame_common.ame_wechat.flow?_eosFlowAction=check&func="+state+"&qs="+qs);
							//response.sendRedirect(request.getContextPath()+"/com.primeton.eos.ame_common.ame_wechat.flow?_eosFlowAction=check&"+qs);
						}
					  
						log.info("wechatTest:参数错误");
					%>
				    	<div class="page__bd page__bd_spacing" style="margin-top:38%;">
						    <div class="icon-box" align="center">
					            <i class="weui-icon-info weui-icon_msg"></i>
					            <div class="icon-box__ctn">
					                <h3 class="icon-box__title">你没有权限访问该页面</h3>
					            </div>
				        	</div>
				        </div>
					<%
					}
				}else{
				 log.info("wechatTest:not primetoner");
					%>
				    	<div class="page__bd page__bd_spacing" style="margin-top:38%;">
						    <div class="icon-box" align="center">
					            <i class="weui-icon-info weui-icon_msg"></i>
					            <div class="icon-box__ctn">
					                <h3 class="icon-box__title">你没有权限访问该页面</h3>
					            </div>
				        	</div>
				        </div>
					<%
				}
				
			}
		}else{//
			log.info("wechatTest:not get UserInfo");
		%>
				    <div class="page__bd page__bd_spacing" style="margin-top:38%;">
						    <div class="icon-box" align="center">
					            <i class="weui-icon-info weui-icon_msg"></i>
					            <div class="icon-box__ctn">
					                <h3 class="icon-box__title">你没有权限访问该页面</h3>
					            </div>
				        	</div>
				   </div>
		<%	
			}    
			
	}
%>
</body>
</html>