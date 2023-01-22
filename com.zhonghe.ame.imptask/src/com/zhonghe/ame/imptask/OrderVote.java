/**
 * 
 */
package com.zhonghe.ame.imptask;

import java.util.HashMap;
import java.util.Map;

import com.eos.system.annotation.Bizlet;

/**
 * @author huangqj
 * @date 2021-05-28 14:06:09
 *
 */
@Bizlet("")
public class OrderVote {

	/**
	 * @param args
	 * @author huangqj
	 */
	public static void main(String[] args) {
		
		Map<String, Float> map = new HashMap<>();		
		map.put("部门1", 1.6f);
		map.put("部门2", 3f);
		map.put("部门3", 3.2f);
		map.put("部门4", 3.2f);
		map.put("部门5", 3.6f);
		map.put("部门6", 5.6f);
		
		for(int i =0; i<map.size(); i++){
			
		}
		
		// TODO 自动生成的方法存根

	}

}
