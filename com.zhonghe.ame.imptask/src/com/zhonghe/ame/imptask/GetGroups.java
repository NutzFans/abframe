/**
 * 
 */
package com.zhonghe.ame.imptask;

import java.util.ArrayList;

import com.eos.system.annotation.Bizlet;

/**
 * @author wangxin  截取传入的人物的姓名和职位
 * @date 2021-05-13 10:53:55
 *
 */
@Bizlet("")
public class GetGroups {
	
	@Bizlet("")
	public String getGroup(String ids) {
		String[] split = ids.split(",");
        String strings = "";
        String s2 = "";
        for (String s : split) {
            String s1 = s.substring(s.indexOf("_") + 1, s.length());
            strings += s1 + "   ";//三个中文空格
            s2 = strings.substring(0,strings.length() - 1);
           
        }
        return s2;
    }

}
