<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="com.primeton.eos.ame_common.MD5Util"%>
<%@page import="com.alibaba.fastjson.JSONObject"%>
<%@page import="com.primeton.eos.ame_inte.CustomResponseWrapper"%>
<%@page import="org.apache.http.HttpResponse"%>
<%@page import="org.apache.commons.io.output.TeeOutputStream"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="com.eos.system.logging.Logger"%>
<%@page import="com.eos.runtime.core.TraceLoggerFactory"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="com.primeton.eos.ame_common.HttpClientUtil"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.eos.foundation.eoscommon.BusinessDictUtil"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.primeton.ext.engine.component.LogicComponentFactory"%>
<%@page import="com.eos.engine.component.ILogicComponent"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.primeton.eos.ame_inte.UserMappingHandler"%>
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="com.alibaba.fastjson.JSON"%>
<%@page import="java.util.Enumeration"%>
<%@page pageEncoding="UTF-8"%>
<html>
<!-- 
  - Author(s): weisz
  - Date: 2020-08-04 16:45:43
  - Description:
-->
<head>
<title>APP接口</title>
</head>
<body>
<%! 	Logger logger = TraceLoggerFactory.getLogger(this.getClass()); %>

<%  
		boolean success = true;
	 	String errorMsg = "";
	   	String errorCode = ""; //BusinessDictUtil.getDictName("AME_APP_INTE_ERROR", type);
	   	Cookie cookie = null;
	   	boolean alreadyLogon = request.isRequestedSessionIdValid();//标记用户是否登录
	   	String charset = request.getCharacterEncoding() == null ? "UTF-8" : request.getCharacterEncoding(); 
	   
	   	//只处理post请求  其他的都不作处理
	   	if(!"POST".equals(request.getMethod())) {
			out.println("</body>");
			out.println("</html>");
	   		return ;
	   	}
	   	

	   	CustomResponseWrapper customResponse = new CustomResponseWrapper(response, charset);
	   	
	   	if(!alreadyLogon) {
	   		String token = request.getHeader("token");
	   		String userId = request.getHeader("userid");//操作用户
	   		String url = request.getHeader("url");
	   		String verify =  request.getHeader("verify"); 
	   		String sign =  request.getHeader("sign"); 
	   			
	   		//TODO 解密 - 认证
	   		if(!valid(userId, url, verify, sign, charset)) {
	   			success = false;
		   		errorMsg = "非法请求";
		   		errorCode = "110";
	   		} else {
		   		// 匹配用户 查缓存 - 查数据库 
			   	UserObject user = UserMappingHandler.handle(token, userId);
			   	if (user == null) {
			   		success = false;
			   		errorMsg = "未找到用户";
			   		errorCode = "100";
				} else {
					
					try {
					
						UserObject u = UserMappingHandler.initSessionUserObject(user.getUserId());
						UserMappingHandler.loginMUO(u, request, response);
					
						
						cookie = new Cookie("JSESSIONID", u.getSessionId());
					    cookie.setSecure(true);
					    cookie.setDomain("ame.primeton.com");//ame.primeton.com
					    cookie.setPath("/default/"); 
					            
					} catch (Throwable e) {
						success = false;
						errorCode = "112";
						errorMsg = "登录失败";
						logger.error(e);
					}
				}
			}	
		}
		String data = "";
		if(success) {
				
			   	//
		   	//String type = request.getHeader("type"); 
		   	String url = request.getHeader("url"); 
		   	//if(type != null) {
		   	//	 url = BusinessDictUtil.getDictName("AME_APP_INTE_MODULE", type);
		   	//}
			   	//
		   	String url2 = "/" + url;
			logger.info("[app_inte] request url = " + url2);   	
	       	request.getRequestDispatcher(url2).forward(request, customResponse);
	       	data = new String(customResponse.toByteArray(), charset);
	       	customResponse.close();
	   		success = parseResponse(data);
	   		if(!success) {
	   			errorMsg = data;
	   			errorCode = "111";
	   		}
		}
	  	
	   	Map<String, Object> result = new HashMap<String, Object>();
	   	result.put("success", success);
	   	if(!success) {
	   		result.put("message", errorMsg);
	   		result.put("errorCode", errorCode);
	   	} else {
	   		result.put("data", data);
	   	}
	   	
        response.reset();
        
        if(success && cookie != null) {
        	response.addCookie(cookie);
        }
        
	   	response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
	   	String jsonResult = JSON.toJSONString(result);
        //response.setContentLength(jsonResult.length());
        response.getWriter().write(jsonResult);
        response.getWriter().close();
        logger.info("[app_inte] response = " + jsonResult);
 %>
 
 <%!
 	/**解析响应报文
 	*/
 	 public boolean parseResponse(String data) {
 	 	boolean success = true;
 	 	try {
   				if(data != null && data != "") {
   					JSONObject dataJson = JSONObject.parseObject(data);
   					if(dataJson != null) {
   						JSONObject exceptionJson = dataJson.getJSONObject("exception");
   						if(exceptionJson != null) {
   							success = false;
   							String code = exceptionJson.getString("code");
   							//if("12101001".equals(code)) { //session失效或者用户未登陆
   							//	try {
										//UserObject u = UserMappingHandler.initSessionUserObject(user.getUserId());
										//UserMappingHandler.loginMUO(u, request, customResponse);
							//	} catch (Throwable e) {
							//			logger.error("[app_inte]", e);
							//	}
   							//} else {
   							//	success = false;
   							//}
   						}
   					}
   				}
   			} catch(Exception e) {
   				logger.error("[app_inte] response parse to json object failed!");
   			}
   		return success;
 	 }
  %>
  
 <%!
 	private boolean valid(String userId, String url, String verify, String sign, String charset) {
 		if(StringUtils.isBlank(userId) || StringUtils.isBlank(url) || StringUtils.isBlank(verify) || StringUtils.isBlank(sign)) {
 			return false;
 		}
 		String key =  "ame2020APP_INTE"; //BusinessDictUtil.getDictName("AME_APP_INTE", "SECRET_KEY");
 		String signZ  = MD5Util.MD5Encode(MD5Util.MD5Encode(userId+verify+url, charset) + key , charset);
 		return signZ.equals(sign);
 	}
  %>
</body>
</html>