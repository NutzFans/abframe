package com.primeton.mis.contract;

import com.eos.foundation.common.utils.CryptoUtil;
import com.eos.system.annotation.Bizlet;
import commonj.sdo.DataObject;

@Bizlet("")
public class UniqueFlowUtil {

	/**
	 * @return
	 */
	@Bizlet("md5签名")
	public static String disget(String... strings) {
		String ret = null;
		if (strings.length > 0) {
			StringBuffer bf = new StringBuffer(strings[0]);
			for (int i = 1; i < strings.length; i++) {
				bf.append(strings[i]);
			}
			ret = CryptoUtil.digestByMD5(bf.toString());
		}
		return ret;
	}

	@Bizlet("创建唯一的seq")
	public static void uniqueFunction(DataObject obj) {
		obj.setString("seqno", disget(obj.getString("funcurl"), obj.getString("checked"), obj.getString("processinstid"), obj.getString("workitemid")));
	}
}
