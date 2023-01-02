/**
 * 
 */
package com.primeton.mis.contract;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import com.eos.system.annotation.Bizlet;

/**
 * @author mengyy
 * @date 2018-04-17 10:52:11
 *
 */
@Bizlet("")
public class ExportContract {
	
	@Bizlet("distinct")
	public static String[] distinct(String[] array){
		List<String> list = new ArrayList<String>();  
		list.add(array[0]);  
		for(int i=1;i<array.length;i++){  
		    if(list.toString().indexOf(array[i]) == -1){  
		            list.add(array[i]);  
		    }  
		}  
		String[] arrayResult = (String[]) list.toArray(new String[list.size()]);  
		return arrayResult; 
		
	} 
}
