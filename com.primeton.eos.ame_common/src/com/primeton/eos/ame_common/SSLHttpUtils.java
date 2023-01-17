package com.primeton.eos.ame_common; 

import org.apache.http.HttpEntity;  
import org.apache.http.HttpResponse;  
import org.apache.http.client.HttpClient;  
import org.apache.http.client.methods.HttpPost;  
import org.apache.http.entity.StringEntity;
import org.apache.http.params.CoreConnectionPNames;
import org.apache.http.util.EntityUtils;  
/* 
 * 利用SSLHttpUtils进行post请求的工具类 
 */  

public class SSLHttpUtils{  
    private SSLHttpUtils() {
    }

    public static String doPost(String url, String data, String charset, int timeout) {
        HttpClient httpClient = null;
        HttpPost httpPost;
        String result = null;
        try {
            System.out.println("url:"+url);
            System.out.println("data:"+data);
            httpClient = new SSLClient();
            if (timeout == 0) {
                //不设置超时时间默认60秒超时           httpClient.getParams().setParameter(CoreConnectionPNames.CONNECTION_TIMEOUT, 60000);
httpClient.getParams().setParameter(CoreConnectionPNames.SO_TIMEOUT, 60000);
            } else {
                //不设置超时时间默认60秒超时           httpClient.getParams().setParameter(CoreConnectionPNames.CONNECTION_TIMEOUT, timeout);
                httpClient.getParams().setParameter(CoreConnectionPNames.SO_TIMEOUT, timeout);
            }
            httpPost = new HttpPost(url);
            httpPost.setEntity(new StringEntity(data, charset));
            HttpResponse response = httpClient.execute(httpPost);
            HttpEntity resEntity = response.getEntity();
            result = EntityUtils.toString(resEntity, "UTF-8");
            EntityUtils.consume(resEntity);
        } catch (Exception e) {
        	System.out.println("http请求异常" + e);
        } finally {
            httpClient.getConnectionManager().shutdown();
        }
        return result;
    }
}
