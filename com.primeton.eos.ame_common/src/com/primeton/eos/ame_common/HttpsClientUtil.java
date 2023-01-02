package com.primeton.eos.ame_common;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URISyntaxException;
import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;
import java.util.HashMap;
import java.util.Map;

import javax.net.ssl.SSLContext;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;

import org.apache.commons.lang.StringUtils;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.HttpStatus;
import org.apache.http.ParseException;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.utils.URIBuilder;
import org.apache.http.conn.ClientConnectionManager;
import org.apache.http.conn.scheme.Scheme;
import org.apache.http.conn.scheme.SchemeRegistry;
import org.apache.http.conn.ssl.SSLSocketFactory;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.params.CoreConnectionPNames;
import org.apache.http.util.EntityUtils;

import com.alibaba.fastjson.JSONObject;
import com.eos.foundation.eoscommon.BusinessDictUtil;
import com.eos.runtime.core.TraceLoggerFactory;
import com.eos.system.annotation.Bizlet;
import com.eos.system.exception.EOSRuntimeException;
import com.eos.system.logging.Logger;

/**
 * @author JYW
 * @date 2019-07-08 15:30:22
 *
 */
@Bizlet("Https工具类")
public class HttpsClientUtil {
	
	private static Logger loger = TraceLoggerFactory.getLogger(HttpsClientUtil.class);
	
	/**
	 * 获取能调用https的httpclient
	 * @return
	 */
	private static HttpClient getHttpsClient(){
		// 在调用SSL之前需要重写验证方法，取消检测SSL
        X509TrustManager trustManager = new X509TrustManager() {
			public X509Certificate[] getAcceptedIssuers() {
				return null;
			}
			public void checkServerTrusted(X509Certificate[] arg0, String arg1)throws CertificateException {}
			public void checkClientTrusted(X509Certificate[] arg0, String arg1)throws CertificateException {}
		};
		try {
			HttpClient httpClient = new DefaultHttpClient();
			SSLContext ctx = SSLContext.getInstance(SSLSocketFactory.TLS);
			ctx.init(null, new TrustManager[] {trustManager},null);
			SSLSocketFactory ssf = new SSLSocketFactory(ctx,SSLSocketFactory.ALLOW_ALL_HOSTNAME_VERIFIER);
			// 创建Registry
            ClientConnectionManager ccm = httpClient.getConnectionManager();
            SchemeRegistry registry = ccm.getSchemeRegistry();
            registry.register(new Scheme("https", 443, ssf));
            //设置连接和socket超时时间
            httpClient.getParams().setParameter(CoreConnectionPNames.CONNECTION_TIMEOUT, 5000);
            httpClient.getParams().setParameter(CoreConnectionPNames.SO_TIMEOUT, 5000);
			return httpClient;
		} catch (NoSuchAlgorithmException e) {
			loger.error(e.getMessage(), e);
			throw new EOSRuntimeException("初始化Https连接异常！");
		} catch (KeyManagementException e) {
			loger.error(e.getMessage(), e);
			throw new EOSRuntimeException("初始化Https连接异常！");
		}
	}
	/**
	 * GET请求
	 * @param host
	 * @param headers
	 * @param querys
	 * @return
	 * @throws Exception
	 */
	public static JSONObject doGet(String url,Map<String, String> querys){
		if(StringUtils.isEmpty(url)){
			return null;
		}
		String host = BusinessDictUtil.getDictName("TX_EMAIL", "GET_TOKEN_URL");
		HttpClient httpClient = getHttpsClient();
		HttpResponse response=null;
		try {
			URIBuilder builder = new URIBuilder(url);
			if(!url.equals(host)){//判断是否是获取token的接口
				builder.addParameter("access_token", getAcessToken());//调用接口凭证
			}
			if (querys != null) {
				for (Map.Entry<String, String> query:querys.entrySet()) {
					if (StringUtils.isNotBlank(query.getKey())
							&&StringUtils.isNotBlank(query.getValue())) {
						builder.addParameter(query.getKey(), query.getValue());
					}
				}
			}
			loger.debug("腾讯邮箱调用请求内容为：{"+builder.toString()+"}");
			HttpGet request = new HttpGet(builder.build());
			request.setHeader("Accept", "application/json");
			request.setHeader("Content-type", "application/json;charset=UTF-8");
			response = httpClient.execute(request);
			if(response!=null){
				int statusCode = response.getStatusLine().getStatusCode();//http通讯状态码
				if(statusCode==HttpStatus.SC_OK){
					HttpEntity entity = response.getEntity();
					if (entity != null) {
						String resStr = EntityUtils.toString(entity, "UTF-8");
						if(StringUtils.isNotEmpty(resStr)){
							JSONObject obj = JSONObject.parseObject(resStr);
							int errcode = obj.getIntValue("errcode");//接口返回业务状态码
							String errmsg = obj.getString("errmsg");
							loger.debug("腾讯邮箱调用返回值：errcode={"+errcode+"};errmsg={"+errmsg+"}");
							return obj;
						}
						EntityUtils.consume(entity);//关闭通讯流
					}
				}else{
					loger.error("调用企业邮箱接口通讯异常！通讯状态码为：{"+statusCode+"}");
					throw new EOSRuntimeException("调用企业邮箱接口通讯异常！");
				}
			}
			return null;
		} catch (ClientProtocolException e) {
			loger.error(e.getMessage(), e);
			throw new EOSRuntimeException(e.getMessage());
		} catch (IOException e) {
			loger.error(e.getMessage(), e);
			throw new EOSRuntimeException(e.getMessage());
		} catch (URISyntaxException e) {
			loger.error(e.getMessage(), e);
			throw new EOSRuntimeException(e.getMessage());
		}finally{
			httpClient.getConnectionManager().shutdown();
		}
	}
	
	/**
	 * Json数据格式的post请求
	 * @param params
	 * @param url
	 * @param body
	 * @return
	 * @throws Exception
	 */
	public static JSONObject doPostForJson(String url,Map<String, Object> body){
		if(StringUtils.isEmpty(url)){
			return null;
		}
		HttpClient httpClient = getHttpsClient();
        HttpResponse response =null;
		try {
			URIBuilder builder = new URIBuilder(url);
			builder.addParameter("access_token", getAcessToken());//调用接口凭证
			HttpPost httpPost = new HttpPost(builder.build());
			String requestContent = "";
			if(body!=null){
				requestContent= JSONObject.toJSONString(body);
			}
			loger.debug("腾讯邮箱调用请求内容为：{"+requestContent+"}");
			StringEntity requestEntity = new StringEntity(requestContent,ContentType.APPLICATION_JSON);
			httpPost.setEntity(requestEntity);
			httpPost.setHeader("Accept", "application/json");
			response = httpClient.execute(httpPost);
			if(response!=null){
				int statusCode = response.getStatusLine().getStatusCode();//http通讯状态码
				if(statusCode==HttpStatus.SC_OK){
					HttpEntity entity = response.getEntity();
					if (entity != null) {
						String resStr = EntityUtils.toString(entity, "UTF-8");
						if(StringUtils.isNotEmpty(resStr)){
							JSONObject obj = JSONObject.parseObject(resStr);
							int errcode = obj.getIntValue("errcode");//接口返回业务状态码
							String errmsg = obj.getString("errmsg");
							loger.debug("腾讯邮箱调用返回值：errcode={"+errcode+"};errmsg={"+errmsg+"}");
							if(errcode==0){
								return obj;
							}else{
								loger.error("调用企业邮箱接口业务逻辑错误！错误信息为：{"+obj.toString()+"}");
							}
						}
						EntityUtils.consume(entity);//关闭通讯流
					}
				}else{
					loger.error("调用企业邮箱接口通讯异常！通讯状态码为：{"+statusCode+"}");
					throw new EOSRuntimeException("调用企业邮箱接口通讯异常！");
				}
			}
			return null;
		} catch (UnsupportedEncodingException e) {
			loger.error(e.getMessage(), e);
			throw new EOSRuntimeException(e.getMessage());
		} catch (ParseException e) {
			loger.error(e.getMessage(), e);
			throw new EOSRuntimeException(e.getMessage());
		} catch (IOException e) {
			loger.error(e.getMessage(), e);
			throw new EOSRuntimeException(e.getMessage());
		} catch (URISyntaxException e) {
			loger.error(e.getMessage(), e);
			throw new EOSRuntimeException(e.getMessage());
		}finally{
			httpClient.getConnectionManager().shutdown();
		}
	}
	
	/**
	 * 获取调用企业邮箱接口时，企业邮箱要检验的AccessToken
	 * @return
	 * @throws UnsupportedEncodingException
	 * 凭证的有效时间（秒）:7200
	 */
	private static String getAcessToken(){
		String host = BusinessDictUtil.getDictName("TX_EMAIL", "GET_TOKEN_URL");
		String corpid = BusinessDictUtil.getDictName("TX_EMAIL", "CORPID");
		String corpsecret = BusinessDictUtil.getDictName("TX_EMAIL", "CORPSECRET");
		Map<String, String> querys = new HashMap<String, String>();
		querys.put("corpid", corpid);//企业id
		querys.put("corpsecret", corpsecret);//应用的凭证密钥
		String token = "";
		JSONObject obj =HttpsClientUtil.doGet(host,querys);
		int errcode = obj.getIntValue("errcode");//接口返回业务状态码
		String errmsg = obj.getString("errmsg");
		loger.debug("腾讯邮箱调用返回值：errcode={"+errcode+"};errmsg={"+errmsg+"}");
		if(errcode==0){//业务成功
			token = obj.getString("access_token");
			return token;
		}else{
			return token;//调用接口业务逻辑处理失败
		}
	}
}
