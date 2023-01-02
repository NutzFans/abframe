package com.primeton.eos.ame_common;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.security.KeyStore;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;

import javax.net.ssl.SSLSocketFactory;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpVersion;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.params.HttpParams;
import org.apache.commons.httpclient.protocol.Protocol;

import com.primeton.bfs.engine.json.HTTP;
import com.sun.net.ssl.SSLContext;
import com.sun.net.ssl.TrustManager;
import com.sun.net.ssl.X509TrustManager;

public class Utils {
	private static final int ENCRYPT_LENGTH = 117;

	private static final int DECRYPT_LENGTH = 256;

	public static void createKeyPair() {
		RSATool tool = new RSATool();
		tool.genRSAKeyPair();
	}

	public static String encrypt(String priKey, String source)
			throws UnsupportedEncodingException {
		String param = URLEncoder.encode(source, "utf-8");
		RSATool tool = new RSATool();
		StringBuffer enc = new StringBuffer();
		int index = 0;
		int paramLength = param.length();
		while (index < paramLength) {
			String tmp = null;
			if ((index + ENCRYPT_LENGTH) < paramLength) {
				tmp = param.substring(index, index + ENCRYPT_LENGTH);
			} else {
				tmp = param.substring(index);
			}

			enc.append(tool.encryptWithPriKey(tmp, priKey));
			index += ENCRYPT_LENGTH;
		}

		return enc.toString();
	}

	public static String decrypt(String pubKey, String enc)
			throws UnsupportedEncodingException {
		RSATool tool = new RSATool();
		int times = enc.length() / DECRYPT_LENGTH;
		StringBuffer dec = new StringBuffer();
		for (int i = 0; i < times; i++) {
			String tmp = enc.substring(i * DECRYPT_LENGTH, (i + 1)
					* DECRYPT_LENGTH);
			dec.append(tool.decryptWithPubKey(tmp, pubKey));
		}

		return URLDecoder.decode(dec.toString(), "utf-8");
	}

	public static String getKey(String filePath) throws IOException {
		BufferedReader reader = new BufferedReader(new InputStreamReader(
				new FileInputStream(filePath)));
		StringBuffer keyBuffer = new StringBuffer();
		String line = null;
		while ((line = reader.readLine()) != null) {
			keyBuffer.append(line);
		}

		return keyBuffer.toString();
	}
	
	/* private HttpClient getNewHttpClient() {  
	        try {  
	            KeyStore trustStore = KeyStore.getInstance(KeyStore  
	                    .getDefaultType());  
	            trustStore.load(null, null);  
	            SSLSocketFactory sf = new SSLSocketFactory(trustStore);  
	            sf.setHostnameVerifier(SSLSocketFactory.ALLOW_ALL_HOSTNAME_VERIFIER);  
	            HttpParams params = new BasicHttpParams();  
	            HttpProtocolParams.setVersion(params, HttpVersion.HTTP_1_1);  
	            HttpProtocolParams.setContentCharset(params, HTTP.UTF_8);  
	            SchemeRegistry registry = new SchemeRegistry();  
	            registry.register(new Scheme("http", PlainSocketFactory  
	                    .getSocketFactory(), 80));  
	            registry.register(new Scheme("https", sf, 443));  
	            ClientConnectionManager ccm = new ThreadSafeClientConnManager(  
	                    params, registry);  
	            return new DefaultHttpClient(ccm, params);  
	        } catch (Exception e) {  
	            return new DefaultHttpClient();  
	        }  
	    }  */
	
	public static void main(String[] args) {

        try {  
            //Secure Protocol implementation.    
            SSLContext ctx = SSLContext.getInstance("SSL");  
            //Implementation of a trust manager for X509 certificates    
            X509TrustManager tm = new X509TrustManager() {  
  
                public void checkClientTrusted(X509Certificate[] xcs,  
                        String string) throws CertificateException {  
  
                }  
  
                public void checkServerTrusted(X509Certificate[] xcs,  
                        String string) throws CertificateException {  
                }  
  
                public X509Certificate[] getAcceptedIssuers() {  
                    return null;  
                }

				public boolean isClientTrusted(X509Certificate[] arg0) {
					return false;
				}

				public boolean isServerTrusted(X509Certificate[] arg0) {
					return false;
				}  
            };  
            ctx.init(null, new TrustManager[] { tm }, null);  
            
        } catch (Exception e) {  
            e.printStackTrace();  
        }  
  
        HttpClient http = new HttpClient();
        String url = "https://payment.cib.com.cn/payment/api/rest";
        Protocol myhttps = new Protocol("https", new AmeSSLProtocolSocketFactory(), 443); 
        Protocol.registerProtocol("https", myhttps); 
        PostMethod post = new PostMethod(url);
	}
}
