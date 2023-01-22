/**
 * 
 */
package com.primeton.eos.ame_common;

import com.eos.foundation.eoscommon.BusinessDictUtil;
import com.eos.runtime.core.TraceLoggerFactory;
import com.eos.system.annotation.Bizlet;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.json.simple.JSONValue;

import com.eos.system.logging.Logger;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;

/**
 * @author yaoyi
 * @date 2017-06-23 10:49:44
 *
 */
@Bizlet("")
public class BaiDuUtil {
	private static Logger log = TraceLoggerFactory.getLogger(WeChatUtil.class);
	public static DefaultHttpClient httpclient;
	static {
		httpclient = new DefaultHttpClient();
	}
	
	/**
	 * 长链接转换为短连接
	 * 
	 * @author: Jerri 
	 * @date: 2014年3月22日下午5:31:15
	 */
	@Bizlet("长链接转换为短连接")
	public static String  generateShortUrl1(String url1) {
		/*try {
			HttpPost httpost = new HttpPost("https://dwz.cn/admin/v2/create");
			List<NameValuePair> params = new ArrayList<NameValuePair>();
			params.add(new BasicNameValuePair("url", url)); // 用户名称
			httpost.setEntity(new UrlEncodedFormEntity(params,  "utf-8"));
			httpost.setHeader("Token", "547303ac47ef959f3ac7ac9a6e67dc4c");
			HttpResponse response = httpclient.execute(httpost);
			String jsonStr = EntityUtils
					.toString(response.getEntity(), "utf-8");
			System.out.println(jsonStr);
			JSONObject object = JSON.parseObject(jsonStr);
			System.out.println(object.getString("tinyurl"));
			return object.getString("tinyurl");
		} catch (Exception e) {
			e.printStackTrace();
			return "Error";
		}*/
		String shorturl;
		String termOfValidity = "1-year";
         try {
        	 String params = "{\"Url\":\""+ url1 + "\"" + ",\"TermOfValidity\":\""+ termOfValidity + "\"}";
        	 //String params = "{Url:"+url1+",TermOfValidity:"+termOfValidity+"}";
             BufferedReader reader = null;
             String smstoken = BusinessDictUtil.getDictName("AME_SYSCONF", "smsToken");
             // 创建连接
             URL url = new URL("https://dwz.cn/admin/v2/create");
             HttpURLConnection connection = (HttpURLConnection) url.openConnection();
             connection.setDoOutput(true);
             connection.setDoInput(true);
             connection.setUseCaches(false);
             connection.setInstanceFollowRedirects(true);
             connection.setRequestMethod("POST"); // 设置请求方式
             connection.setRequestProperty("Content-Type", "application/json"); // 设置发送数据的格式
             connection.setRequestProperty("Token",smstoken); // 设置发送数据的格式");
 
             // 发起请求
             connection.connect();
             OutputStreamWriter out = new OutputStreamWriter(connection.getOutputStream(), "UTF-8"); // utf-8编码
             out.append(params);
             out.flush();
             out.close();
 
             // 读取响应
             reader = new BufferedReader(new InputStreamReader(connection.getInputStream(), "UTF-8"));
             String line;
             String res = "";
             while ((line = reader.readLine()) != null) {
                 res += line;
             }
             reader.close();
 
 
             Map<String,Object> map = (Map)JSON.parseObject(res.toString());
             shorturl = (String) map.get("ShortUrl");
             log.info("短地址生成返回："+map.get("ErrMsg"));
         } catch (IOException e) {
             // TODO
             e.printStackTrace();
             shorturl="error";
         }
         return shorturl; // 
		
	}
	
	/**
	 * 长链接转换为短连接
	 * 
	 * @author: Jerri 
	 * @date: 2014年3月22日下午5:31:15
	 */
	@Bizlet("长链接转换为短连接")
	public static String  generateShortUrl(String url1) {
		String shorturl = null;
		String longUrlEncode = null;
		try {
			longUrlEncode = URLEncoder.encode(url1, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		 String msg =  HttpClientUtil.getMethodInvoke("http://suo.im/api.htm", "format=json&url="+longUrlEncode+"&key=5dc4d2d0b1a9c70591bb65f8@bbeb171b6e2e79d77b136793ad3674bd");
		
		 org.json.simple.JSONObject json = (org.json.simple.JSONObject)JSONValue.parse(msg);
		 shorturl = (String) json.get("url");
        log.info("短地址生成返回："+json.get("err"));
         return shorturl; // 
		
	}
		
	public static void main(){
		generateShortUrl1("https://ame.primeton.com/default/ame/clipview/index.jsp?ticket=ST-1583-p2kJVTKe4obnjU6iMEbj");
	}
}
