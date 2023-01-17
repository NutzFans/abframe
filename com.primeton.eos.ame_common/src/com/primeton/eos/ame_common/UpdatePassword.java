package com.primeton.eos.ame_common;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.protocol.Protocol;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;

import com.eos.system.annotation.Bizlet;

/**
 * @author zhuhx
 * @date 2017-02-13 14:43:49
 *
 */
@Bizlet("")
public class UpdatePassword {
	
	@Bizlet("")
	public String UpdatePassword(String mailname,String pass) throws UnsupportedEncodingException {
		//根据企业实际修改，priKey为私钥，domain为域名，product即cid由网易提供
		String priKey = "30820276020100300d06092a864886f70d0101010500048202603082025c02010002818100ab2f035dacd7ab5e63420981ff3a5c0d1d487788f06685220477a6be83a729a227d4d55ec27773e62bb8a35ebe5062fbcdd0d90f1693c89e935106bac00bdd8b804371d61ee3fb87148a285f85be2f795b1b28b30be0a09413d5452e12183297186996b4f0c3cafcc0c95730ba593d9f0f4cabc744cf40ca9842af85e5bd2c4d0203010001028180334ecd0877b4d0b562b4b95ad05ff2952fb0b7bb40aac9be8f6e397922c6a8b0e495633a9ab8e8f1152bab33cb811699f86f5f8fa929b458eb38bef69c7731f88f3c2d1a886810a534451b24691068ca54ba044bdb95e141382540e1fae3b744539807454d2e90dbd0685a3550bb5d7c028105abf7236a75d8dfc36b43d51675024100dfe38e9ef0962b670b5f9c00bec305f8b900f5f9929e7bbfa5feada928efaa55a667ac37e0c1d259d70cc606278b3cd3d382cc35285d802d435dc5929ae9481f024100c3bc4c2bcf4d227638c1e0bc9c0a7a3433ff8521a8774b039d70b72576764bc1f2ebf1d900797addd48117541bf6db8aaeddc598cca0a627a7d6c5074ea0ee1302402ac2c6899abfc3b86196b82ff83f3d53bcd9ef20e49cfa5ba733962d79d11482594ef1b89667ce6a34458f48bba2bf5261d258784aa65905cc190bd42d5c22d7024027f30698ea7693d20d4384daf9fe2972fe29e8c235e0232f59b2e7ae7dbf27372e9d797f10d9ba7a0c254cdd9dd7847789b939db35e89401040091b62c162c81024100d911889be0947bd70ef47282a5e1f1234be7e3a862706c3062151b0aa51379c7cf78ef347fd5b6752b98f6f1cdff624da2eec0dcaea852c66816255752adb098";
		String domain = "primeton.com";
		String product = "primeton_com";
		
		String account_name = mailname;
		String passchange_req = "0";
		String password = pass;
		String time = System.currentTimeMillis() + "";
		
		String url = "http://apibj.qiye.163.com/qiyeservice/api/account/updatePassword";
		String sign = "account_name=" + account_name + "&domain=" + domain
				+ "&passchange_req=" + passchange_req + "&password=" + password
				+ "&product=" + product + "&time=" + time;
		System.out.println(sign);
		sign = RSASignatureToQiye.generateSigature(priKey, sign);
		System.out.println(sign);
		url = url + "?" + "account_name=" + account_name + "&domain=" + domain
				+ "&passchange_req=" + passchange_req + "&password=" + password
				+ "&product=" + product + "&sign=" + sign + "&time=" + time;
		System.out.println(url);
		HttpPost hp = new HttpPost();
		String res = hp.post(url);
		JSONObject arr= (JSONObject) JSONValue.parse(res);
		   Object o = arr.get("suc");
		   String result = o.toString();
		System.out.print(res);
		return result;
		
	}
}
