package com.primeton.eos.ame_common;

import java.util.HashMap;

public class Constants {
	
	//微信接口访问token的key
	public static final String ACCESS_TOKEN="TOKEN";
	//邮箱接口访问token的key
	public static final String MAILACCESS_TOKEN="MAILTOKEN";
	//微信JSAPI的key
	public static final String JSAPI_TOKEN="TICKET";
	//微信JSAPI的key
	public static final String MONGAME_TOKEN="MONGAME";
	//当作系统缓存来处理，由于JVM不会回收这个map，不存放非基本类型的对象。
	public static final HashMap<String,String> CACHE_MAP = new HashMap<String,String>(){
		private static final long serialVersionUID = 1L;
		{
			put("TOKEN",null);
			put("MAILTOKEN",null);
			put("TICKET",null);
		}
	};
	public static final HashMap<String,HashMap> CACHE_MAP1 = new HashMap<String,HashMap>(){
	};
}
