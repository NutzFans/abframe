<%@page import="com.eos.runtime.core.TraceLoggerFactory"%>
<%@page import="com.eos.system.logging.Logger"%>
<%@page pageEncoding="UTF-8"%>
<%
   Logger log = TraceLoggerFactory.getLogger(this.getClass());
   String url = (String) request.getAttribute("redirectUrl");
   String qs = (String) request.getAttribute("qs");
   String type = (String) request.getAttribute("type");
   log.info("qs:"+qs);
   qs =qs.replaceAll(",", "&");
   String full_url = request.getContextPath();
   
   if(!url.startsWith("/")){
   		full_url = full_url+"/"+url;
   }else{
   		full_url = full_url+url;
   }
   
   if(qs!=null){
	   	if(full_url.contains("?")){
	   		full_url = full_url+"&"+qs;
	   	}else{
	   		full_url = full_url+"?"+qs;
	   	}
   }
   if(type!=null && !"".equals(type)){
       if(!qs.contains("&type=")){
	   		if(full_url.contains("?")){
		   		full_url = full_url+"&type="+type;
		   	}else{
		   		full_url = full_url+"?type="+type;
		   	}
	   }
   }
   //String full_url = request.getContextPath()+"/"+url+"?"+qs;
   log.info("url:"+full_url);
   response.sendRedirect(full_url);
 %>