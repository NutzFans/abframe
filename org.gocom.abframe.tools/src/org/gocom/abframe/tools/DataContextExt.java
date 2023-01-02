/*******************************************************************************
 * $Header: /cvsroot/MIS10/src/NEWERP/org.gocom.abframe.tools/src/org/gocom/abframe/tools/DataContextExt.java,v 1.1 2013/06/02 19:53:23 huangqj Exp $
 * $Revision: 1.1 $
 * $Date: 2013/06/02 19:53:23 $
 *
 *==============================================================================
 *
 * Copyright (c) 2001-2006 Primeton Technologies, Ltd.
 * All rights reserved.
 * 
 * Created on 2009-2-21
 *******************************************************************************/

package org.gocom.abframe.tools;

import static com.eos.system.annotation.ParamType.CONSTANT;

import com.eos.data.datacontext.DataContextManager;
import com.eos.data.datacontext.IDataContext;
import com.eos.system.annotation.Bizlet;
import com.eos.system.annotation.BizletParam;
import commonj.sdo.DataObject;

/**
 * 数据上下文的相关函数
 * 1、根据属性名获取数据对象数组中的属性值列表
 * 
 * @author 蔡述尧
 * @date 2009-02-21 19:27:16
 */
/*
 * 修改历史
 * $Log: DataContextExt.java,v $
 * Revision 1.1  2013/06/02 19:53:23  huangqj
 * *** empty log message ***
 *
 * Revision 1.3  2010/12/01 03:22:41  caisy
 * 更改编码为UTF-8
 *
 * Revision 1.2  2010/11/30 16:12:51  caisy
 * 编码改为UTF-8
 *
 * Revision 1.1  2009/02/22 19:39:53  caisy
 * 分级授权
 * 
 */
@Bizlet("数据上下文扩展类")
public class DataContextExt {

	/**
	 * @param list 数组xapth
	 * @param propertyName 属性名
	 * @return
	 * @author 蔡述尧
	 */
	@Bizlet(value = "抽取对象数组的属性数组", params = { @BizletParam(index = 0, defaultValue = "list"), @BizletParam(index = 1, defaultValue = "property", type = CONSTANT) })
	public static String[] getPropertyValues(String list, String propertyName) {
		if (null == list)  return null ;

		IDataContext ctx=DataContextManager.current().getDefaultContext();

		DataObject[] dataObjects=(DataObject[])ctx.get(list);
		return getPropertyValues(dataObjects, propertyName) ;
	}

	/**
	 * @param list 数据对象数组
	 * @param propertyName 属性名
	 * @return
	 */
	@Bizlet(value = "抽取对象数组的属性数组", params = { @BizletParam(index = 0, defaultValue = "list"), @BizletParam(index = 1, defaultValue = "property", type = CONSTANT) })
	public static String[] getPropertyValues(DataObject[] list, String propertyName) {
		if(null==list ||list.length==0){
			return null;
		}
		String [] ret = new String [list.length];
		for(int i=0;i<list.length;i++){
			ret[i] = list[i].getString(propertyName);
		}
		return ret;
	}

}
