/**
 * 
 */
package com.zhonghe.ame.imptask;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections4.map.HashedMap;

import com.eos.foundation.database.DatabaseExt;
import com.eos.foundation.database.DatabaseUtil;
import com.eos.system.annotation.Bizlet;

import commonj.sdo.DataObject;

/**
 * @author huangqj
 * @date 2021-06-03 14:56:57
 *
 */
@Bizlet("")
public class KeyTaskVoteService {
	@Bizlet("")
	public List<String> queryVoteByzhzrdwvote (DataObject[] param){
		List<String> list = new ArrayList<String>();
		if(param.length>0){
			for(int a = 0 ;a < param.length;a++){
				String orgnames = (String) param[a].get("orgname");
				String orgname = orgnames.substring(orgnames.indexOf('_') + 1, orgnames.length());
				//System.out.println(orgname);
				list.add(orgname);
			}
			System.out.println(list);
		}
		return list;	
	}
}
