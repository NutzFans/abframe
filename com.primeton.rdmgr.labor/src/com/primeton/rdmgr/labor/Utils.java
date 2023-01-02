/**
 * 
 */
package com.primeton.rdmgr.labor;

import static com.eos.system.annotation.ParamType.CONSTANT;

import com.eos.system.annotation.Bizlet;
import com.eos.system.annotation.BizletParam;

/**
 * @author wkq
 * @date 2012-09-26 17:58:20
 *
 */
@Bizlet("工具类")
public class Utils {

	/**
	 * @param delimiter
	 * @param strings
	 * @return
	 * @author wkq
	 */
	@Bizlet(params = {
			@BizletParam(index = 0, type = CONSTANT, paramAlias = "分隔符"),
			@BizletParam(index = 1, paramAlias = "字符串") })
	public static String joinString(String delimiter, String... strings) {
		// TODO 自动生成方法存根
		if (strings == null)
			return null;
		if (delimiter == null)
			delimiter = "";
		int length = strings.length;
		StringBuffer result = new StringBuffer();
		boolean flag = false;
		for (int i = 0; i < length; i++)
		{
			String s = strings[i] == null ? "" : strings[i];
			if (flag)
				result.append(delimiter);
			result.append(s);
			flag = true;
		}

		return result.toString();
	}

}
