/**
 * 
 */
package com.zhonghe.ame.imptask;

import java.util.Date;

import com.eos.system.annotation.Bizlet;
import com.zhonghe.ame.imptask.vote.ZhZrdwVote;

/**
 * @author wx
 * @date 2021-06-15 14:50:54
 *
 */
@Bizlet("")
public class VotingTime {
	@Bizlet("")
	public int judgeTime(Date time) {
		Date now = new Date();
		int compareTo = time.compareTo(now);
		return compareTo;
	}
	
	@Bizlet("")
	public int countVotes(String votes,String byVotes) {
        String[] split = votes.split(",");
        String[] strings = byVotes.split(",");
        int i = split.length * strings.length;
        return i;
    }
	
}
