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
<title>微信</title>
<link rel="stylesheet" href="./weui.css"/>
</head>
<body>
<%
	String qs = request.getQueryString();
	Logger log = TraceLoggerFactory.getLogger(this.getClass());
	log.info("qs="+qs);
	qs =qs.replaceAll("&", ",");
	String code = request.getParameter("code");
	if(code==null){
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
	}else{
		//微信参数
		String state = request.getParameter("state");
		String agentid = request.getParameter("agentid");
		//根据agentid获取secert
		DataObject[] dicts = BusinessDictUtil.getDictInfoByType("AME_WE_APP");
		String	corpsecret = null;
		for(int i=0;i<dicts.length;i++){
			if(dicts[i].get("dictID").equals(agentid)){
				corpsecret = (String) dicts[i].get("filter1");
			}
		}
		if(state.equals("actMoney") || state.equals("actMoneyed")){
	 		corpsecret="vVc8_cNhio8E0zEclKkVUgsPDYtWFjqT4sH_xc0obhs";
	 	}
		//工作项ID
		String workItemID = request.getParameter("workItemID");
		String processInstID = request.getParameter("processInstID");
		//之所以用这个来判断，因为UserLoginCheckedFilter就是用这个来判断是否登陆
		boolean flags = request.isRequestedSessionIdValid();
		log.info("session flag="+flags);
		IUserObject userObject = (IUserObject)request.getSession().getAttribute("userObject");
		//通过此种方式，在如下场景中有bug
		//1.通过手机，操作系统
		//2.ame服务器重启
		//3.这种方式，还能拿到userid，可能和微信浏览器有关
		//Object obj = session.getAttribute("edu.yale.its.tp.cas.client.filter.user");
		String userID =null;
		if(userObject!=null){
			userID = (String)userObject.getUserId();
		}
		if(userID!=null){
			if(state==null){
				if(workItemID!=null){
					response.sendRedirect(request.getContextPath()+"/bps/wfclient/task/wechatWorkItem.jsp?workItemID="+workItemID);
				}else{
					response.sendRedirect(request.getContextPath()+"/ame_mobile/processCenter/processCenter.jsp");
				}
			}else if(state.equals("1")){
				response.sendRedirect(request.getContextPath()+"/ame_mobile/processCenter/processCenter.jsp");
			}else if(state.equals("2")){
				response.sendRedirect(request.getContextPath()+"/ame/clipview/index.jsp");
			}else if(state.equals("3")){
				response.sendRedirect(request.getContextPath()+"/bps/wfclient/task/taskView.jsp?processInstID="+processInstID);
			}else{
				//是否是以W开头
				boolean wStart =  state.startsWith("W");
				//获取后面的内容
				String id =state.substring(1);
				//是否是数字
				boolean isNumb = Character.isDigit(id.charAt(0));
				if(wStart&&isNumb){
					response.sendRedirect(request.getContextPath()+"/bps/wfclient/task/wechatWorkItem.jsp?workItemID="+id);
				}else{
				 	log.info("func="+state+"&qs="+qs);
				 	String userImg = (String) session.getAttribute("userImg");
				 	if(state.equals("ActSign") || state.equals("ActWord") || state.equals("ActDetail") || state.equals("YQLSQ")){
				 		String activityid = request.getParameter("activityid");
				 		log.info("activityid:"+activityid);
				 		qs = qs + ",activityid=" + activityid;
				 	}
				 	if(state.equals("actMoney") || state.equals("actMoneyed")){
				 		String actmoneyid = request.getParameter("actmoneyid");
				 		log.info("actmoneyid:"+actmoneyid);
				 		qs = qs + ",actmoneyid=" + actmoneyid;
				 		corpsecret="vVc8_cNhio8E0zEclKkVUgsPDYtWFjqT4sH_xc0obhs";
				 	}
				 	if(state.equals("actRankList")){
				 		String recorddate = request.getParameter("recorddate");
				 		log.info("recorddate:"+recorddate);
				 		qs = qs + ",recorddate=" + recorddate;
				 	}
				 	if((userImg == null || userImg.equals("")) && state.equals("ActSign")){
				 		String access_token = WeChatUtil.getCache(corpsecret);
				 		String url = BusinessDictUtil.getDictName("AME_WE_CHAT", "USERINFO_URL");
						String msg =  HttpClientUtil.getMethodInvoke(url, "access_token="+access_token+"&code="+code);
						JSONObject json = (JSONObject)JSONValue.parse(msg);
						log.info("获取用户信息结果:"+msg);
						Long errcode = (Long)json.get("errcode");
						if(errcode!=null){
							if(errcode==40014 || errcode==42001){//token过期了
								String re_str = WeChatUtil.getAccessToken(corpsecret);
								if(re_str.equals("SUCC")){
									//重新获取token
									access_token = WeChatUtil.getCache(corpsecret);
									msg = HttpClientUtil.getMethodInvoke(url, "access_token="+access_token+"&code="+code);
									json = (JSONObject)JSONValue.parse(msg);
									log.info("token过期之后，获取用户信息结果:"+msg);
								}
							}
						}
						String userId = (String)json.get("UserId");
						String user_ticket = (String)json.get("user_ticket");
						if(userId!=null){
					 		String url1 = BusinessDictUtil.getDictName("AME_WE_CHAT", "USERDETAIL_URL");
							url1 += "?access_token="+access_token;
							JSONObject jsonParam = new JSONObject();
							jsonParam.put("user_ticket", user_ticket);
							String str = HttpClientUtil.post(url1, jsonParam.toString());
							JSONObject return_json = (JSONObject)JSONValue.parse(str);
							userImg = (String)return_json.get("avatar");
							log.info("获取用户头像信息:"+userImg);
							session.setAttribute("userImg", userImg);
						}
				 	}
					response.sendRedirect(request.getContextPath()+"/com.primeton.eos.ame_common.ame_wechat.flow?_eosFlowAction=check&func="+state+"&qs="+qs);
					//response.sendRedirect(request.getContextPath()+"/com.primeton.eos.ame_common.ame_wechat.flow?_eosFlowAction=check&"+qs);
				}
			}
		}else{//第一次登陆
			String access_token = WeChatUtil.getCache(corpsecret);
			
			log.info("access_token="+access_token);
			log.info("js_token="+WeChatUtil.getCache(Constants.JSAPI_TOKEN));
			String url = BusinessDictUtil.getDictName("AME_WE_CHAT", "USERINFO_URL");
			String msg =  HttpClientUtil.getMethodInvoke(url, "access_token="+access_token+"&code="+code);
			JSONObject json = (JSONObject)JSONValue.parse(msg);
			log.info("获取用户信息结果:"+msg);
			Long errcode = (Long)json.get("errcode");
			if(errcode!=null){
				if(errcode==40014 || errcode==42001){//token过期了
					String re_str = WeChatUtil.getAccessToken(corpsecret);
					if(re_str.equals("SUCC")){
						//重新获取token
						access_token = WeChatUtil.getCache(corpsecret);
						msg = HttpClientUtil.getMethodInvoke(url, "access_token="+access_token+"&code="+code);
						json = (JSONObject)JSONValue.parse(msg);
						log.info("token过期之后，获取用户信息结果:"+msg);
					}else{
						log.info("token 获取失败");
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
			String user_ticket = (String)json.get("user_ticket");
			String userImg = "";
			if(userId!=null){
				boolean flag = false;
				if(user_ticket != null){
					String url1 = BusinessDictUtil.getDictName("AME_WE_CHAT", "USERDETAIL_URL");
					url1 += "?access_token="+access_token;
					JSONObject jsonParam = new JSONObject();
					jsonParam.put("user_ticket", user_ticket);
					String str = HttpClientUtil.post(url1, jsonParam.toString());
					JSONObject return_json = (JSONObject)JSONValue.parse(str);
					userImg = (String)return_json.get("avatar");
					log.info("获取用户头像信息:"+userImg);
				}				
				url = BusinessDictUtil.getDictName("AME_WE_CHAT", "TGT_URL");
				String tgt =HttpClientUtil.getMethodInvoke(url,"userId="+userId);
				Cookie cookie = null;
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
					
					try{
					    //校验用户是否存在
						 flag = WeChatUtil.checkUser(userId);
					}catch(Throwable e){
						 log.info("checkUser err:"+e);
					}  
					log.info("checkUser result:"+flag);
					if(flag){
						//SSO绕过之后，没有登陆系统，需要手动初始化Session
						WeChatUtil.wechatLogin(userId, request, response);
						//设置SSO参数，已经登录过，不可删掉
						session.setAttribute("edu.yale.its.tp.cas.client.filter.user", userId);
						session.setAttribute("userImg", userImg);
						response.addCookie(cookie);
						//以state为参数，用来分配跳转，可以考虑用业务字典来实现
						if(state==null){
							if(workItemID!=null){
								response.sendRedirect(request.getContextPath()+"/bps/wfclient/task/wechatWorkItem.jsp?workItemID="+workItemID);
							}else{
								response.sendRedirect(request.getContextPath()+"/ame_mobile/processCenter/processCenter.jsp");
							}
						}else if(state.equals("1")){
							response.sendRedirect(request.getContextPath()+"/ame_mobile/processCenter/processCenter.jsp");
						}else if(state.equals("2")){
							response.sendRedirect(request.getContextPath()+"/ame/clipview/index.jsp");
						}else if(state.equals("3")){
							response.sendRedirect(request.getContextPath()+"/bps/wfclient/task/taskView.jsp?processInstID="+processInstID);
						}else{
							//是否是以W开头
							boolean wStart =  state.startsWith("W");
							//获取后面的内容
							String id =state.substring(1);
							//是否是数字
							boolean isNumb = Character.isDigit(id.charAt(0));
							if(wStart&&isNumb){
								response.sendRedirect(request.getContextPath()+"/bps/wfclient/task/wechatWorkItem.jsp?workItemID="+id);
							}else{
							    log.info("func="+state+"&qs="+qs);
							 	if(state.equals("ActSign") || state.equals("ActWord") || state.equals("ActDetail") || state.equals("YQLSQ")){
							 		String activityid = request.getParameter("activityid");
							 		qs = qs + ",activityid=" + activityid;
							 	}
							 	if(state.equals("actMoney")  || state.equals("actMoneyed")){
							 		String actmoneyid = request.getParameter("actmoneyid");
							 		log.info("actmoneyid:"+actmoneyid);
							 		qs = qs + ",actmoneyid=" + actmoneyid;
							 	}
							 	if(state.equals("actRankList")){
							 		String recorddate = request.getParameter("recorddate");
							 		log.info("recorddate:"+recorddate);
							 		qs = qs + ",recorddate=" + recorddate;
							 	}
								response.sendRedirect(request.getContextPath()+"/com.primeton.eos.ame_common.ame_wechat.flow?_eosFlowAction=check&func="+state+"&qs="+qs);
							}
						}
					}else{
					 log.info("wechatAme:not primetoner");
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
				log.info("wechatAme:not get UserInfo");
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
			} 
		}   
			
	}
%>
</body>
</html>