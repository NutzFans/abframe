/*******************************************************************************
 * $Header: /cvsroot/MIS10/src/NEWERP/com.primeton.eos.ame_common/src/com/primeton/eos/ame_common/StringUtil.java,v 1.3 2017/05/17 09:04:53 mengyy-ze Exp $
 * $Revision: 1.3 $
 * $Date: 2017/05/17 09:04:53 $
 *
 *==============================================================================
 *
 * Copyright (c) 2001-2006 Primeton Technologies, Ltd.
 * All rights reserved.
 * 
 * Created on 2009-12-31
 *******************************************************************************/


package com.primeton.eos.ame_common;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.StringTokenizer;

import com.eos.system.annotation.Bizlet;

/**
 * TODO fill class info here
 *
 * @author primeton
 * @date 2009-12-31 10:28:55
 */
/*
 * Modify history
 * $Log: StringUtil.java,v $
 * Revision 1.3  2017/05/17 09:04:53  mengyy-ze
 * ¿¼ÇÚ¼ÇÂ¼ÏîÄ¿±ä¸üÐÞ¸Ä
 *
 * Revision 1.2  2017/01/19 10:08:29  shihao
 * udpate:ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½
 *
 * Revision 1.1  2016/09/05 05:16:31  huangqj
 * ï¿½ï¿½Ç©ï¿½ï¿½ï¿½Ê¼ï¿½
 *
 * Revision 1.1  2015/04/09 07:22:14  huangqj
 * CSOMS
 *
 * Revision 1.2  2010/10/29 08:52:32  xuecong
 * *** empty log message ***
 *
 * Revision 1.1  2010/08/30 13:37:54  yitp
 * *** empty log message ***
 * 
 */
@Bizlet("")
public class StringUtil {
	@Bizlet("ï¿½Ê¼ï¿½ï¿½Ö·ï¿½ï¿½ï¿½ï¿½ï¿½")
	public static String joinString (String sourceStr, String operatorName, String email) {
		if(sourceStr == null || sourceStr.equals("")){
			if (email != null && !email.equals(""))
				sourceStr = operatorName + "<" + email + ">";
		}else 
			if (email != null && !email.equals(""))
				sourceStr = sourceStr + ";" + operatorName + "<" + email + ">";
		
		return sourceStr;
	}
	
	@Bizlet("ï¿½ï¿½ï¿½ï¿½×ªï¿½ï¿½ï¿½É·Ö¸ï¿½ï¿½Ö·ï¿½")
	public static String unionString (String[] sourceStr, String splitchar) {
		String resultStr = "";
		if(sourceStr == null || sourceStr.length != 0) {
			for (int i=0;i<sourceStr.length;i++) {
				if (i == 0) 
					resultStr = sourceStr[i];
				else
					resultStr = resultStr + "," + sourceStr[i];
			}
		}
		
		return resultStr;
	}
	
	@Bizlet("split")
	public static String[] split (String sourceStr, String splitchar) {
		return sourceStr.split(splitchar);
	}
	
	@Bizlet("replace")
	public static String replace (String sourceStr, String regex,String replacement) {
		return sourceStr.replaceAll(regex, replacement);
	}
	
	@Bizlet("trimOne")
	public String trimOne(String str){    
        if(str.startsWith(","))
            return trimOne(new String(new StringBuffer(str).deleteCharAt(0)));
        else if(str.endsWith(","))
            return trimOne(new String(new StringBuffer(str).deleteCharAt(str.length()-1)));
        else
            return str;
}

}
