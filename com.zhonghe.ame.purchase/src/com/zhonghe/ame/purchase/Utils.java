/**
 * 
 */
package com.zhonghe.ame.purchase;

import java.util.Calendar;
import java.util.Date;

import com.eos.system.annotation.Bizlet;

/**
 * @author qinwen
 * @date 2021-05-27 15:45:40
 *
 */
@Bizlet("")
public class Utils {
	
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
	 * 获取采购计划单号
	 * @param num
	 * @return
	 * @param num 
	 */
	@Bizlet("getCode")
	public String getPlanCode(int num,String year,String type){
		num = num % 999;
		String oddNumber = "" + num;
		
		//3位序列号
		if(oddNumber.length()==1){
			oddNumber="00"+oddNumber;
		}else if(oddNumber.length()==2){
			oddNumber="0"+oddNumber;
		}
		
		oddNumber = "CNCC-"+type+"-"+ year +"-"+ oddNumber;
		
		return oddNumber;
	}
}
