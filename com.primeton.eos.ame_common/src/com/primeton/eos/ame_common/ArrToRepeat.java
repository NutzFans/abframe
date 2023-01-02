package com.primeton.eos.ame_common;

import java.util.LinkedList;
import java.util.List;

import com.eos.system.annotation.Bizlet;

/**
 * @author zyl
 * @date 2016-07-16 14:43:49
 *
 */
@Bizlet("")
public class ArrToRepeat {
	
	@Bizlet("")
	public static String toRepeat(String str){
		String[] strArr = str.split(",");
        List<String> list = new LinkedList<String>();  
        for(int i = 0; i < strArr.length; i++) {  
            if(!list.contains(strArr[i])) {  
                list.add(strArr[i]);  
            }  
        }  
        String[] returnArr = list.toArray(new String[list.size()]);
        StringBuffer returnStr = new StringBuffer();
        for(int i = 0; i < returnArr.length; i++){
        	returnStr.append(returnArr[i]+",");
        }
        return returnStr.toString().substring(0, returnStr.length()-1);
	}
}
