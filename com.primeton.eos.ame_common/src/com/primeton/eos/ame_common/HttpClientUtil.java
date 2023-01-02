package com.primeton.eos.ame_common;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpStatus;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.methods.RequestEntity;
import org.apache.commons.httpclient.methods.StringRequestEntity;
import org.apache.commons.httpclient.params.HttpMethodParams;
import org.apache.commons.lang.StringUtils;

import com.eos.foundation.eoscommon.LogUtil;
import com.eos.system.annotation.Bizlet;
import com.eos.system.exception.EOSRuntimeException;

@Bizlet("HttpClient工具类")
public class HttpClientUtil {
	
	@Bizlet("post方法调用远程功能接口")
	public static String post(String url, Map<String, String> params) {  
		if(StringUtils.isBlank(url)) throw new EOSRuntimeException("http调用的URL为空!");
		String info = "";
        HttpClient client = new HttpClient(); 
        PostMethod post = new PostMethod(url);
        List<NameValuePair> paramList = new ArrayList<NameValuePair>();
        if(params!=null){
        	for(String key : params.keySet()){
            	paramList.add(new NameValuePair(key,params.get(key)));
            }
        }
        HttpMethodParams param = new HttpMethodParams();
        param.setContentCharset("UTF-8");
        post.setParams(param);
        post.setRequestBody(paramList.toArray(new NameValuePair[paramList.size()]));
        try {	
			client.executeMethod(post);
			int code = post.getStatusCode();  
			if (code == HttpStatus.SC_OK){
		    	info = new String(post.getResponseBodyAsString());
	        }else{
	        	throw new EOSRuntimeException("HttpClient调用异常，codeValue:"+code+",targetURL:"+url);
	        }
		} catch (Exception e) {
			LogUtil.logError(e.getMessage(), e, new Object[0]);
		} finally {
			if(post != null){
				post.releaseConnection();
			}
		}
        return info;  
    }
	
	/**
	 * post方法调用远程功能接口(传完整JSON字符串)
	 * @param url
	 * @param json
	 * @return
	 */	
	@Bizlet("post方法调用远程功能接口(传完整JSON字符串)")
	public static String post(String url, String json) {  
		if(StringUtils.isBlank(url)) throw new EOSRuntimeException("http调用的URL为空!");
		String info = "";
        HttpClient client = new HttpClient(); 
        PostMethod post = new PostMethod(url);
        try {
        	RequestEntity re = new StringRequestEntity(json,"application/json","UTF-8");
            post.setRequestEntity(re);
			client.executeMethod(post);
			int code = post.getStatusCode();  
			if (code == HttpStatus.SC_OK){
		    	info = new String(post.getResponseBodyAsString());
	        }else{
	        	throw new EOSRuntimeException("HttpClient调用异常，codeValue:"+code+",targetURL:"+url);
	        }
		} catch (Exception e) {
			LogUtil.logError(e.getMessage(), e, new Object[0]);
		} finally {
			if(post != null){
				post.releaseConnection();
			}
		}
        return info;  
    }
	/**
	 * get方式调用http请求（调用url，参数名=参数值）
	 * @param url 调用的url
	 * @param param 参数名=参数值
	 * @return 调用结果String
	 */
	@Bizlet("get方式调用http请求(调用url，参数名=参数值)")
	public static String getMethodInvoke(String url, String param){
		if(StringUtils.isBlank(url)) throw new EOSRuntimeException("http调用的URL为空!");
		String info = "";
        HttpClient client = new HttpClient(); 
        GetMethod get = new GetMethod(url+"?"+param);
        try {
			client.executeMethod(get);
			int code = get.getStatusCode();  
			if (code == HttpStatus.SC_OK){
		    	info = new String(get.getResponseBodyAsString());
	        }else{
	        	throw new EOSRuntimeException("HttpClient调用异常，codeValue:"+code+",targetURL:"+url);
	        }
		} catch (Exception e) {
			LogUtil.logError(e.getMessage(), e, new Object[0]);
		} finally {
			if(get != null){
				get.releaseConnection();
			}
		}
        return info; 
	}
}
