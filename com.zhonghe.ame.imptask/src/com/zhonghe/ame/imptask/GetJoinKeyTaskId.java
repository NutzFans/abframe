/**
 * 
 */
package com.zhonghe.ame.imptask;

import java.util.ArrayList;
import java.util.List;

import com.eos.foundation.database.DatabaseUtil;
import com.eos.system.annotation.Bizlet;
import com.primeton.ext.data.sdo.DataUtil;
import com.zhonghe.ame.imptask.vote.ZhKeytaskNames;
import com.zhonghe.ame.imptask.vote.ZhKeytaskVoted;

import commonj.sdo.DataObject;

/**
 * @author wx
 * @date 2021-06-06 08:41:40
 * 重点任务投票获取orgid
 */
@Bizlet("")
public class GetJoinKeyTaskId {
	
	@Bizlet("")
	public int[] getKeyTaskId(String orgIds) {
		String[] strings = orgIds.split(",");
		int[] list =  new int[strings.length];
        for(int i = 0;i<strings.length;i++){
        	 list[i] =  Integer.parseInt(strings[i].substring(0, strings[i].indexOf("_")));
        }
		return list;
	}
	
	@Bizlet("")
	public String[] getVoteDeps(String str) {
		String[] strings = str.split(",");
		return strings;
	}
	
	@Bizlet("")
	public int getOrgEmp(String ids) {
        String[] strings = ids.split("_");
        if(strings.length > 2) {
            return 1;
        }else {
            return 0;
        }
    }
	
	@Bizlet("")
	public void saveKtVoted(DataObject param,ZhKeytaskVoted Voted,int id) {
		String[] orgNames = getVoteDeps((String) param.get("voteDeps"));
		int[] orgIds = getKeyTaskId((String) param.get("orgIds"));
		String[] judgeEmp = getVoteDeps((String) param.get("orgIds"));
		for(int i = 0;i<orgNames.length;i++){
			Voted.set("number",orgIds[i]);
			Voted.setOrgids((String) param.get("voteDeps"));
			Voted.setNumber((Integer)orgIds[i]);
			Voted.setJoinKeytask(orgNames[i]);
			Voted.setKeytaskId(id);
			if(getOrgEmp(judgeEmp[i]) == 1){
				Voted.setJudgeType(1);
			} else {
				Voted.setJudgeType(0);
			}
			DatabaseUtil.insertEntity("default", Voted);
		}
	}

}
