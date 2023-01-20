/**
 * 
 */
package com.primeton.eos.machine;

import java.util.HashMap;

import com.eos.system.annotation.Bizlet;
import commonj.sdo.DataObject;

/**
 * @author mengyy
 * @date 2018-12-13 18:51:17
 *
 */
@Bizlet("")
public class DistinctSpr {
	@Bizlet("")
	public boolean distinctSpr(DataObject[] leaders,DataObject leader){
		boolean result=false;
		if(leaders.length==0){
			
			return result;
		}else{
			for(int i=0;i<leaders.length;i++){
				if(leader.getString("id").equals(leaders[i].getString("id"))){
					result =true;
				}
			}
		}
		return result;
	}
}
