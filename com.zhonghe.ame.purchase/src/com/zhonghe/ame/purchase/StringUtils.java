/**
 * 
 */
package com.zhonghe.ame.purchase;


import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSON;
import com.eos.access.http.UserObjectSessionListener;
import com.eos.data.datacontext.UserObject;
import com.eos.system.annotation.Bizlet;

/**
 * @author huangqj
 * @date 2021-02-04 10:23:32
 *
 */
@Bizlet("")
public class StringUtils {
	
	@Bizlet("")
	public String[] split(String str,String regx){
		return str.split(regx);
	}
	
	@Bizlet("")
	public String substrings(String str,String under){
		if(null == under){
			return str;
		}else{
			return under+","+str;
		}
		
	}
	/**
	 * 根据sequences获取单号
	 * @param num
	 * @return
	 */
	
	/**
	 * 获取采购计划单号
	 * @param num
	 * @return
	 * @param num 
	 */
	@Bizlet("getOddNumber")
	public String getOddNumber(int num,String typeCode,int orgId){
		num = num % 999;
		String oddNumber = "" + num;
		String orgCode = null;
		//3位序列号
		if(oddNumber.length()==1){
			oddNumber="00"+oddNumber;
		}else if(oddNumber.length()==2){
			oddNumber="0"+oddNumber;
		}
		if(orgId==24){
			orgCode = "BHB" ;
		}else if (orgId==25){
			orgCode = "BTJ";
		}else if (orgId==26){
			orgCode = "BFJ";
		}else if (orgId==27){
			orgCode = "BSC";
		}else if (orgId==111){
			orgCode = "BXB";
		}else if (orgId==193){
			orgCode = "BHN";
		}else if (orgId==112){
			orgCode = "BHY";
		}else{
			orgCode = "BZB";	
		}
		
		oddNumber = "CNCC-"+typeCode+"-"+getLocalYear() + "-" +orgCode+"-" + oddNumber;
		
		return oddNumber;
	}
	
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
	@Bizlet("getPlanCode")
	public String getPlanCode(int num,String year,String name,String type){
		num = num % 999;
		String oddNumber = "" + num;
		
		//3位序列号
		if(oddNumber.length()==1){
			oddNumber="00"+oddNumber;
		}else if(oddNumber.length()==2){
			oddNumber="0"+oddNumber;
		}
		
		oddNumber = "CNCC-CGJH-"+ year +"-"+ oddNumber;
		
		return oddNumber;
	}

}
