/**
 * 
 */
package com.zhonghe.ame.imptask;

import java.util.Calendar;
import java.util.Date;

import com.eos.foundation.common.lang.DateUtil;
import com.eos.system.annotation.Bizlet;

/**
 * @author huangqj
 * @date 2021-04-07 22:40:32
 *
 */
@Bizlet("")
public class getYear {

	@Bizlet("")
	public String getLocalYear(){

		Calendar calendar = Calendar.getInstance();
		calendar.setTime(new Date());					//放入Date类型数据
		return String.valueOf(calendar.get(Calendar.YEAR));
		
	}
	
	@Bizlet("")
	public String append(String str,String str1){
		
		if(str1.length()==1){
			str1="00"+str1;
		}else if(str.length()==2){
			str1="0"+str1;
		}
		
		return str+"-"+str1;
		
	}
	
	
	/**
	 * 根据sequences获取单号
	 * @param num
	 * @return
	 */
	@Bizlet("getCode")
	public String getCode(int num){
		num = num % 999;
		String oddNumber = "" + num;
		
		//3位序列号
		if(oddNumber.length()==1){
			oddNumber="00"+oddNumber;
		}else if(oddNumber.length()==2){
			oddNumber="0"+oddNumber;
		}
		
		oddNumber = getLocalYear() +"-"+ oddNumber;
		
		return oddNumber;
	}
	
	
}
