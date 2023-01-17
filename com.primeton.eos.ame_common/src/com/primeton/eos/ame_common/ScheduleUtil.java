/**
 * 
 */
package com.primeton.eos.ame_common;

import java.util.List;
import java.util.Map;

import com.eos.system.annotation.Bizlet;
import com.primeton.ext.common.schedule.ScheduleManager;

/**
 * @author 75241
 * @date 2019-01-14 19:26:53
 *
 */
@Bizlet("")
public class ScheduleUtil {
	
	public static void queryScheduleList(){
		ScheduleManager s = new ScheduleManager();
		List<Map<String,Object>> lists = s.getAllTaskDetail();
	}

}
