/**
 * 
 */
package com.zhonghe.ame.imptask;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import com.eos.system.annotation.Bizlet;

/**
 * @author huangqj
 * @date 2021-01-13 15:07:11
 *
 */
@Bizlet("")
public class stringCommonUtil {
	
	
	@Bizlet("")
	public static String substr(String str){
		stringCommonUtil scu = new stringCommonUtil();
		String [] a1 = scu.strSplit(str,",",-1);
		String a2 = "";
		for(int i=0;i<a1.length;i++){			
				a2 = a2+a1[i].substring(0, a1[i].length() - 2)+",";				
		}
		return a2.substring(0, a2.length() - 1);	
	}
	
	
	@Bizlet("")
	public String strSplicing(String str,String str1){
		
		return str+str1;
		
	}
	
	@Bizlet("")
	public int checkIsContains(String str,String str2){
		
		int returnValue=0;
		
		if(str==null){
			
			return returnValue;

		}
		
		String[] arr = str.split(",");
		
		for(int i = 0;i<arr.length;i++){
			if(str2.equals(arr[i])){
				returnValue =1;
			}
		}
		
		return returnValue;
		
	}
	
	@Bizlet("")
	/**
	 * 字符串切割,并去除数组中的空值
	 * @param str   切割的字符串
	 * @param regex 正则表达式
	 * @param limit 切割次数
	 * @return
	 */
	public String[] strSplit(String str,String regex, int limit){		
		return removeNullValue(str.split(regex, limit));
	}

	@Bizlet("")
	/**
	 * int数组排序
	 * @return
	 */
	public Integer[] arraySort(String[] input){
		List<Integer> num = new ArrayList<Integer>();
		for(int i = 0; i < input.length; i++){
			num.add(Integer.parseInt(input[i]));
		}
		Integer[] n = num.toArray(new Integer[0]);
		Arrays.sort(n);
		return n;
	}

	@Bizlet("")
	/**
	 * 判断两个数组是否相等
	 */
	public Boolean isEquals(Integer[] a1,Integer[] a2){		
		return Arrays.equals(a1, a2);
	}

	
	public static String[] removeNullValue(String[] arr){ 
	    List<String> tmp = new ArrayList<String>();
	    for (String str:arr) {
	        if (str!=null && str.length()!=0) {
	            tmp.add(str);
	        }
	    }
	    arr = tmp.toArray(new String[0]);
	    return arr;
	}

	
}
