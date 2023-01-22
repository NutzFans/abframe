/**
 * 
 */
package com.zhonghe.ame.imptask;

import com.eos.system.annotation.Bizlet;

/**
 * @author huangqj
 * @date 2021-05-13 18:18:29
 *
 */
@Bizlet("")
public class GetOrgIds {
	
	@Bizlet("")
	public String getOrgIds(String ids) {
		String[] strings = ids.split(",");
        String temp = "";
        for (String s : strings) {
            if(s.contains("公司领导") || s.contains("副总工程师")) {
                String s1 = s.substring(0, s.lastIndexOf("_"));
                temp += s1 + "，";
            } else {
                String s2 = s.substring(0, s.indexOf("_"));
                temp += s2 + "，";
            }
        }
        String substring = temp.substring(0, temp.length() - 1);
        return substring;
	}

}
