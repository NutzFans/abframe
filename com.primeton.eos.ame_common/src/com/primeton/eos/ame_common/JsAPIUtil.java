package com.primeton.eos.ame_common;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Formatter;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import org.json.simple.JSONObject;
import org.json.simple.JSONValue;

import com.eos.foundation.database.DatabaseUtil;
import com.eos.foundation.eoscommon.BusinessDictUtil;
import com.eos.runtime.core.TraceLoggerFactory;
import com.eos.system.annotation.Bizlet;
import com.eos.system.logging.Logger;

public class JsAPIUtil {
	private static Logger log = TraceLoggerFactory.getLogger(JsAPIUtil.class);
	
	@Bizlet("签名")
	public static Map<String, String> sign(String url) {
		String jsapi_ticket =Constants.CACHE_MAP.get(Constants.JSAPI_TOKEN);
				//BusinessDictUtil.getDictName("AME_WE_CHAT", "JSAPI_TICKET");
		return sign(jsapi_ticket,url);
	}
	
	public static String getJsApiTicket(String access_token) {
		String ticket  = "";
		//通过数据字典拿到获取jsapi_ticket的url
        String url = BusinessDictUtil.getDictName("AME_WE_CHAT", "JSAPI_TICKET_URL");
        String param = "access_token=ACCESS_TOKEN&type=jsapi";
        param = param.replace("ACCESS_TOKEN", access_token);
        // 发起GET请求获取凭证
        String return_msg = HttpClientUtil.getMethodInvoke(url, param);
        
        JSONObject return_json = (JSONObject)JSONValue.parse(return_msg);
        //错误编码
        Long errcode = (Long)return_json.get("errcode");
        if(errcode==0){
        	ticket = (String)return_json.get("ticket");
		}else if(errcode==40014){//token过期了
			String re_str = WeChatUtil.getAccessToken(Constants.JSAPI_TOKEN);
			if(re_str.equals("SUCC")){
				ticket =Constants.CACHE_MAP.get(Constants.JSAPI_TOKEN); 
						//BusinessDictUtil.getDictName("AME_WE_CHAT", "JSAPI_TICKET");
				//更新数据字典的缓存
				//WeChatUtil.updateDict("AME_WE_CHAT", "JSAPI_TICKET", ticket);
			}
		}
        log.info("getJsApiTicket---->ticket:"+ticket);
        return ticket;
       
    }
	
	/**
	 * 微信签名：         大写的"不能改这个方法"
	 * @param jsapi_ticket
	 * @param url
	 * @return
	 */
	public static Map<String, String> sign(String jsapi_ticket, String url) {
        Map<String, String> ret = new HashMap<String, String>();
        String nonce_str = create_nonce_str();
        String timestamp = create_timestamp();
        String string1;
        String signature = "";

        //注意这里参数名必须全部小写，且必须有序
        string1 = "jsapi_ticket=" + jsapi_ticket +
                  "&noncestr=" + nonce_str +
                  "&timestamp=" + timestamp +
                  "&url=" + url;
        try
        {
        	//官方指定的加密API -----start
            MessageDigest crypt = MessageDigest.getInstance("SHA-1");
            crypt.reset();
            crypt.update(string1.getBytes("UTF-8"));
            signature = byteToHex(crypt.digest());
          //官方指定的加密API -----end
        }
        catch (NoSuchAlgorithmException e)
        {
            e.printStackTrace();
        }
        catch (UnsupportedEncodingException e)
        {
            e.printStackTrace();
        }

        ret.put("url", url);
        ret.put("jsapi_ticket", jsapi_ticket);
        ret.put("nonceStr", nonce_str);
        ret.put("timestamp", timestamp);
        ret.put("signature", signature);
        return ret;
    }

    private static String byteToHex(final byte[] hash) {
        Formatter formatter = new Formatter();
        for (byte b : hash)
        {
            formatter.format("%02x", b);
        }
        String result = formatter.toString();
        formatter.close();
        return result;
    }

    private static String create_nonce_str() {
        return UUID.randomUUID().toString();
    }

    private static String create_timestamp() {
        return Long.toString(System.currentTimeMillis() / 1000);
    }
    
}
