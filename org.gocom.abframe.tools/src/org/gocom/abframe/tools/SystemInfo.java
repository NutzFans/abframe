/*******************************************************************************
 * $Header: /cvsroot/MIS10/src/NEWERP/org.gocom.abframe.tools/src/org/gocom/abframe/tools/SystemInfo.java,v 1.1 2013/06/02 19:53:23 huangqj Exp $
 * $Revision: 1.1 $
 * $Date: 2013/06/02 19:53:23 $
 *
 *==============================================================================
 *
 * Copyright (c) 2001-2006 Primeton Technologies, Ltd.
 * All rights reserved.
 * 
 * Created on 2008-11-28
 *******************************************************************************/


package org.gocom.abframe.tools;

/**
 * 系统常量信息
 * @author 翁增仁
 * wengzr (mailto:wengzr@primeton.com)
 */
public class SystemInfo {

	/**
	 * 换行符
	 */
	public static String LINE_SEPARATOR = System.getProperty("line.separator","\r\n");
	/**
	 * 文件分隔符
	 */
	public static String FILE_SEPARATOR = System.getProperty("file.separator");
	/**
	 * 路径分隔符
	 */
	public static String PATH_SEPARATOR = System.getProperty("path.separator");
	
}
