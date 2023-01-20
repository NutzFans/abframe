/**
 * 
 */
package com.zhonghe.ame.imptask;

import com.eos.system.annotation.Bizlet;

/**
 * @author wx   "0033_公司领导_李文伟"    拆分这个字符串,同时得到id用于进行投票方法
 * @date 2021-05-17 18:29:26
 *
 */
@Bizlet("")
public class GetByVotingId {
	
	@Bizlet("")
	public String getByVotingId(String ids) {
        String[] strings = ids.split("_");
        return strings[0];
    }


}
