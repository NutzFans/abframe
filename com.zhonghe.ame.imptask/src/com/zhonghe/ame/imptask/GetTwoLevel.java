/**
 * 
 */
package com.zhonghe.ame.imptask;

import com.eos.system.annotation.Bizlet;

/**
 * @author wx     
 * @date 2021-05-17 13:47:37
 *	这个方法用于责任单位投票中的投票人的所属单位,来获取部门的2级id
 */
@Bizlet("")
public class GetTwoLevel {
	
	@Bizlet("")
	public String getTwoLevel(String ids) {
        String[] strings = ids.split("\\.");
        if(strings.length == 4) {
            return strings[2];
        } else {
            return null;
        }
    }

}
