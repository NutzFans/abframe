/**
 * 
 */
package com.zhonghe.ame.marketInfo.marketinfo.khxx;

import java.util.HashMap;

import com.eos.system.annotation.Bizlet;

/**
 * @author huangqj
 * @date 2020-12-30 10:35:04
 *
 */
@Bizlet("")
public class Stringutil {
	
	public static String[] split(String org,HashMap map){
		
		System.out.println(map.get("str"));
		
		return org.split(org);
	};
	public static void main(String[] args) {
		split("str",new HashMap());
	}

}
