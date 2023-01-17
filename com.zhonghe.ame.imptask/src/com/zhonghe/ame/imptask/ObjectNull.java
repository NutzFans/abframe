/**
 * 
 */
package com.zhonghe.ame.imptask;

import com.eos.system.annotation.Bizlet;
import commonj.sdo.DataObject;

/**
 * @author huangqj
 * @date 2021-05-31 16:06:06
 *
 */
@Bizlet("Object[]空值处理")
public class ObjectNull {

	/**
	 * @return
	 * @author huangqj
	 */
	@Bizlet("")
	public static double parseObject(Object[] objs) {
		if(objs.length == 0) {
			return 0;
		}
		DataObject dob = (DataObject) objs[0];
		Double randking = dob.getDouble("ranking");
		if(randking > 0) {
			return randking;
		}else{
			return 0;
		}
		
	}

}
