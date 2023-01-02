/**
 * 
 */
package com.zhonghe.ame.imptask;

import java.util.ArrayList;

import antlr.collections.List;

import com.eos.system.annotation.Bizlet;

/**
 * @author wangxin
 * @date 2021-05-12 16:49:31
 *
 */
@Bizlet("查询人物是否是公司领导或者副总工程师")
public class GetGroupToEmployee {

	@Bizlet("查询人物是否是公司领导或者副总工程师")
	public ArrayList<String> getGroupToEmployee(String keytaskIds) {

        ArrayList<String> ids = new ArrayList<String>();  //存放公司领导和副总工程师的id

        String[] split = keytaskIds.split("，");

        for (String s : split) {
            if(s.substring(s.length() - 1).equals("e")) {
                String s1 = s.substring(0,s.length()-2);
                ids.add(s1);
            }
        }
        return ids;
    }
	
	//将数据库查询的结果ORGNAME(公司领导,副总工程师)放入拼接放入到数据库对应的字段中
	

}
