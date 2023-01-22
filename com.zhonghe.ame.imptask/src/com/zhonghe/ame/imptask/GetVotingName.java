/**
 * 
 */
package com.zhonghe.ame.imptask;

import com.eos.system.annotation.Bizlet;

/**
 * @author huangqj
 * @date 2021-05-29 13:27:40
 *  0565_副总工程师_韩春林 --> 副总工程师_韩春林
 */
@Bizlet("")
public class GetVotingName {
	
	@Bizlet("")
	public String getVotingName(String str) {
        return str.substring(str.indexOf("_") + 1, str.length());
    }

}
