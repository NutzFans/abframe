/**
 * 
 */
package com.zhonghe.ame.imptask;

import java.util.Arrays;

import com.eos.system.annotation.Bizlet;

/**
 * @author wx  用于判断责任单位投票重复提交方法
 * @date 2021-05-18 17:42:14
 *
 */
@Bizlet("")
public class RepeatJudge {
	
	@Bizlet("")
	public String repeatJudge(String[] voterOrgId,String[] voteId,String userOrgId,String userId) {
        if(!userOrgId.equals("3") && !userOrgId.equals("4")) {   //先看看用户的部门id是否是领导或工程师
            if(Arrays.asList(voterOrgId).contains(userOrgId)) {  //如果不是则比较部门id,相同则不能重复提交
                return "2不能重复提交";  //不能重复提交
            } else {
                return "1"; //可以提交投票
            }
        } else {
            if(Arrays.asList(voteId).contains(userId)) {
                return "2不能重复提交";
            } else {
                return "1";
            }
        }

    }

}
