package com.zhonghe.ame.purchase.service;

import java.io.IOException;

import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;

import sun.misc.BASE64Decoder;


//解密样例
public class Rest3DES {
	//定义算法===================================================
    private static final String Algorithm = "DESede";
	//定义算法结束===============================================
	
	//生成密钥===================================================
	public static SecretKey createKey(String key){
	SecretKey deskey = null;
	try {
		deskey = new SecretKeySpec(key.getBytes("utf-8"), Algorithm);
	
	} catch (Exception e) {
	
		e.printStackTrace();
	}
	return deskey;
	}
	//生成密钥结束===============================================
	
	//解密以string 密文输入,String 明文输出======================
	
	public static String  getDecString(String strMi,String key){
	    BASE64Decoder  base64Decoder=new BASE64Decoder();
	    byte[] byteMing=null;
	    byte[] byteMi=null;
	    String strMing="";
	    try {
	        byteMi=base64Decoder.decodeBuffer(strMi);
	        byteMing=decryptMode(key,byteMi);
	        strMing=new String(byteMing,"utf-8");
	    } catch (IOException e) {
	        // TODO Auto-generated catch block
	        e.printStackTrace();
	    }finally
	    {
	        base64Decoder=null;
	        byteMing=null;
	        byteMi=null;
	    }
	    return strMing;
	}
	
	//解密以string 密文输入,String 明文输出结束======================
	
	//解密具体实现方法===============================================
	public static byte[] decryptMode(String key, byte[] src) {      
		try {
		        //生成密钥
				SecretKey deskey = createKey(key);
		       //解密
		       Cipher c1 = Cipher.getInstance(Algorithm);
		        c1.init(Cipher.DECRYPT_MODE, deskey);
		        return c1.doFinal(src);
		    } catch (java.security.NoSuchAlgorithmException e1) {
		        e1.printStackTrace();
		    } catch (javax.crypto.NoSuchPaddingException e2) {
		        e2.printStackTrace();
		   } catch (java.lang.Exception e3) {
		       e3.printStackTrace();
		  }
	    return null;
	}

}
