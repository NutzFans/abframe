/**
 * 
 */
package com.zhonghe.ame.contractPact;

import java.util.ArrayList;

import org.apache.xmlbeans.impl.xb.xsdschema.Public;

import com.eos.system.annotation.Bizlet;
import com.esproc.jdbc.Array;

import commonj.sdo.DataObject;

/**
 * @author huangqj
 * @date 2021-01-22 13:16:30
 *
 */
@Bizlet("")
public class feameAgreement{
	@Bizlet
	public static String  splitProcessName  (String sourceStr,String str){
		// TODO 自动生成的方法存根
			String[] AS =sourceStr.split(str);
			return AS[0];
	}
	@Bizlet
	public static String  judgeRole  (String sourceStr){
		// TODO 自动生成的方法存根
			String str = sourceStr.substring(1,sourceStr.length()-1);
	        String[] AS = str.split("\\.");
	        for(String a : AS){
	        	System.out.println(a);
	        }
		return AS[0];
	}
	@Bizlet
	public static String  judgeDepartment  (String sourceStr){
		// TODO 自动生成的方法存根
			String str = sourceStr.substring(1,sourceStr.length()-1);
	        String[] AS = str.split("\\.");
	        String a = AS[1];
	        String b = "19";
	        //1设备监理中心  2其他中心  0其他部门
	        if(a.equals(b)){
	        	return "1";
	        }else if("102061".equals(a)||"16".equals(a)||"17".equals(a)||"18".equals(a)||"20".equals(a)||"21".equals(a)||"22".equals(a)||"23".equals(a)||"171".equals(a)){
	        	return "2";
	        }else{
	        	return "0";
	        }
	}
	
	@Bizlet
	public static String  cutOutContractSum  (String sourceStr){
		// TODO 自动生成的方法存根
			if("".equals(sourceStr)||sourceStr==null){
				sourceStr="0.0";
			}
	        String[] AS = sourceStr.split("\\.");
	        return AS[0];
	}
	
	@Bizlet
	public static String sysout(String sysout){
		// TODO 自动生成的方法存根
		
		System.out.println(sysout);
		return "hello";
	}
	
	@Bizlet
	public static String  planIncomeSum  (String january,String february,String march,String april,String may,String june,String july,String august,String september,String october,String november,String december){
//		System.out.println(january);
//		System.out.println(february);
//		System.out.println(march);
//		System.out.println(april);
//		System.out.println(may);
//		System.out.println(june);
//		System.out.println(july);
//		System.out.println(august);
//		System.out.println(september);
//		System.out.println(october);
//		System.out.println(november);
//		System.out.println(december);
		Integer January = Integer.valueOf(january);
		Integer February = Integer.valueOf(february);
		Integer March = Integer.valueOf(march);
		Integer April = Integer.valueOf(april);
		Integer May = Integer.valueOf(may);
		Integer June = Integer.valueOf(june);
		Integer July = Integer.valueOf(july);
		Integer August = Integer.valueOf(august);
		Integer September = Integer.valueOf(september);
		Integer October = Integer.valueOf(october);
		Integer November = Integer.valueOf(november);
		Integer December = Integer.valueOf(december);
		
		Integer sum = January+February+March+April+May+June+July+August+September+October+November+December;
		String incomeSum = String.valueOf(sum);
		System.out.println("incomeSum:"+incomeSum);
		return incomeSum;
		
	}
	
	
	@Bizlet
	public static String  contractType  (String type){
		// TODO 自动生成的方法存根
		// 1不授权  2 授权  0非充分授权 
			if("2".equals(type)||"3".equals(type)||"10".equals(type)||"11".equals(type)||"17".equals(type)||"18".equals(type)||"19".equals(type)){
				return "1";
			}else if("7".equals(type)||"8".equals(type)||"13".equals(type)||"14".equals(type)||"15".equals(type)){
				return "2";
			}else{
				return "0";
			}
	}
}
