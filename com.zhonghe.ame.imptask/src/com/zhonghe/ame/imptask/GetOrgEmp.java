/**
 * 
 */
package com.zhonghe.ame.imptask;

import com.eos.system.annotation.Bizlet;

/**
 * @author wx  0033_公司领导_李文伟:拆分这个字符串,判断他是部门还是领导    领导返回1,部门返回0
 * @date 2021-05-17 18:27:47
 *
 */
@Bizlet("")
public class GetOrgEmp {
	
	@Bizlet("")
	public int getOrgEmp(String ids) {
        String[] strings = ids.split("_");
        if(strings.length > 2) {
            return 1;
        }else {
            return 0;
        }
    }

}
