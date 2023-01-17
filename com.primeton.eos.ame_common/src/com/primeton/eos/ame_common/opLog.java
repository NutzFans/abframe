/**
 * 
 */
package com.primeton.eos.ame_common;
import java.sql.Timestamp;
import java.text.ParseException;
import java.util.Date;

import com.eos.data.datacontext.DataContextManager;
import com.eos.data.datacontext.IMUODataContext;
import com.eos.data.datacontext.IUserObject;
import com.eos.foundation.database.DatabaseExt;
import com.eos.foundation.database.DatabaseUtil;
import com.eos.system.annotation.Bizlet;

/**
 * @author zhouwenjie
 * @date 2016-06-16 17:40:50
 *
 */
@Bizlet("")
public class opLog {

	/**
	 * 
	 * @param operatefunc  功能
	 * @param operatefuncmo  功能模块
	 * @param optype   操作类型
	 * @param operateinfo   操作内容
	 * @throws ParseException
	 */
	@Bizlet("")
	public static void saveop(String operatefunc, String operatefuncmo, String optype,String operateinfo) throws ParseException {
		commonj.sdo.DataObject misWork = commonj.sdo.helper.DataFactory.INSTANCE.create("com.primeton.eos.ame_common.ame_common","AmeOperatlog");
		IMUODataContext muo = DataContextManager.current().getMUODataContext();
		String userName = null;
		String userid = null;
		if (muo != null) {
			IUserObject userObject = muo.getUserObject();
			userName = userObject.getUserName();	
			userid = userObject.getUserId();
		}
		DatabaseExt.getPrimaryKey(misWork);
		misWork.setString("operatefunc", operatefunc);
		misWork.setString("operatefuncmo", operatefuncmo);
		misWork.setString("operator", userName);
		misWork.setString("userid", userid);
		misWork.setDate("operatetime", new Date());
		misWork.setString("operatetype", optype);
		misWork.setString("operateinfo", operateinfo);
		DatabaseUtil.insertEntity("default", misWork);
	}
	@Bizlet("")
	public static void saveop4Login(String userName, String operatefunc, String operatefuncmo, String optype,String operateinfo, String userid) throws ParseException {
		commonj.sdo.DataObject misWork = commonj.sdo.helper.DataFactory.INSTANCE.create("com.primeton.eos.ame_common.ame_common","AmeOperatlog");
		DatabaseExt.getPrimaryKey(misWork);
		misWork.setString("operatefunc", operatefunc);
		misWork.setString("operatefuncmo", operatefuncmo);
		misWork.setString("operator", userName);
		misWork.setString("userid", userid);
		misWork.setDate("operatetime", new Date());
		misWork.setString("operatetype", optype);
		misWork.setString("operateinfo", operateinfo);
		DatabaseUtil.insertEntity("default", misWork);
	}
}
