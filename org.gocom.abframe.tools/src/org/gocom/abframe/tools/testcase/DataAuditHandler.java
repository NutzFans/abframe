/*******************************************************************************
 * $Header: /cvsroot/MIS10/src/NEWERP/org.gocom.abframe.tools/src/org/gocom/abframe/tools/testcase/DataAuditHandler.java,v 1.1 2013/06/02 19:53:46 huangqj Exp $
 * $Revision: 1.1 $
 * $Date: 2013/06/02 19:53:46 $
 *
 *==============================================================================
 *
 * Copyright (c) 2001-2006 Primeton Technologies, Ltd.
 * All rights reserved.
 * 
 * Created on 2009-7-28
 *******************************************************************************/


/**
 * @author yangxun
 * 组织机构操作的审计
 * 
 */
package org.gocom.abframe.tools.testcase;

import java.io.Serializable;
import com.eos.das.entity.IDASCriteria;
import com.eos.data.datacontext.DataContextManager;
import com.eos.data.datacontext.IUserObject;
import com.eos.data.serialize.XMLSerializer;
import com.eos.foundation.common.utils.DateUtil;
import com.eos.foundation.data.DataObjectUtil;
import com.eos.foundation.database.DatabaseUtil;
import com.primeton.das.entity.impl.handler.IEntityHandler;
import commonj.sdo.DataObject;

/**
 * 
 * 实体触发器的例子
 * TODO 数据实体触发器类需要做完整验证 和验证结果描述
 * @author charles (mailto:caisy@primeton.com)
 */

/*
 * Modify history
 * $Log: DataAuditHandler.java,v $
 * Revision 1.1  2013/06/02 19:53:46  huangqj
 * *** empty log message ***
 *
 * Revision 1.1  2010/12/03 09:45:21  caisy
 * 删除无用代码
 *
 */
public class DataAuditHandler implements IEntityHandler {

	//记录删除机构的审计信息
	public void afterDelete(DataObject entity, Serializable arg1, String[] arg2,
			Object[] arg3) {
		IUserObject user = null;
		if(DataContextManager.current().getMUODataContext()==null){
		    user = (IUserObject)DataContextManager.current().getSessionCtx().get(IUserObject.KEY_IN_CONTEXT);
		}else{
		    user = DataContextManager.current().getMUODataContext().getUserObject();
		}
		if(DataObjectUtil.checkEntityName(entity,"org.gocom.abframe.dataset.organization.OmOrganization")){
			XMLSerializer  util = new XMLSerializer();		
			DataObject logObject=DataObjectUtil.createDataObject("org.gocom.abframe.dataset.tools.AtDataaudit");
			//operatetype operatorid operatedesc operatechange operatetime			
			logObject.set("operatorid",user.getAttributes().get("operatorid").toString());		
			logObject.set("operatetime", DateUtil.parse(DateUtil.format(new java.util.Date(), "yyyy-MM-dd HH:mm:ss"),"yyyy-MM-dd HH:mm:ss"));
			logObject.set("operatedesc", "删除机构信息");
			logObject.set("operatetype", "删除");		
			logObject.set("operatechange",util.marshallToString(entity) );					
			//DatabaseExt.getPrimaryKey(logObject);
			DatabaseUtil.insertEntity("default", logObject);
		}

	}

	public void afterLoad(DataObject arg0, Serializable arg1, String[] arg2,
			Object[] arg3) {

	}

	public void beforeLoad(String arg0, IDASCriteria arg1) {

	}

	
	//记录添加机构的审计信息
	public void beforeSave(DataObject entity, Serializable arg1, String[] arg2,
			Object[] arg3) {
		IUserObject user = null;
		if(DataContextManager.current().getMUODataContext()==null){
		    user = (IUserObject)DataContextManager.current().getSessionCtx().get(IUserObject.KEY_IN_CONTEXT);
		}else{
		    user = DataContextManager.current().getMUODataContext().getUserObject();
		}
		if(DataObjectUtil.checkEntityName(entity,"org.gocom.abframe.dataset.organization.OmOrganization")){
			XMLSerializer  util = new XMLSerializer();		
			DataObject logObject=DataObjectUtil.createDataObject("org.gocom.abframe.dataset.tools.AtDataaudit");
			//operatetype operatorid operatedesc operatechange operatetime			
			logObject.set("operatorid",user.getAttributes().get("operatorid").toString());		
			logObject.set("operatetime", DateUtil.parse(DateUtil.format(new java.util.Date(), "yyyy-MM-dd HH:mm:ss"),"yyyy-MM-dd HH:mm:ss"));
			logObject.set("operatedesc", "添加机构信息");
			logObject.set("operatetype", "添加");		
			logObject.set("operatechange",util.marshallToString(entity) );					
			//DatabaseExt.getPrimaryKey(logObject);
			DatabaseUtil.insertEntity("default", logObject);
		}
	}

	//记录更新机构的审计信息
	public void beforeUpdate(DataObject entity, Serializable arg1, String[] arg2,
			Object[] arg3, Object[] arg4) {
		IUserObject user = null;
		if(DataContextManager.current().getMUODataContext()==null){
		    user = (IUserObject)DataContextManager.current().getSessionCtx().get(IUserObject.KEY_IN_CONTEXT);
		}else{
		    user = DataContextManager.current().getMUODataContext().getUserObject();
		}
		if(DataObjectUtil.checkEntityName(entity,"org.gocom.abframe.dataset.organization.OmOrganization")){
			XMLSerializer  util = new XMLSerializer();		
			DataObject logObject=DataObjectUtil.createDataObject("org.gocom.abframe.dataset.tools.AtDataaudit");
			//operatetype operatorid operatedesc operatechange operatetime			
			logObject.set("operatorid",user.getAttributes().get("operatorid").toString());		
			logObject.set("operatetime", DateUtil.parse(DateUtil.format(new java.util.Date(), "yyyy-MM-dd HH:mm:ss"),"yyyy-MM-dd HH:mm:ss"));
			logObject.set("operatedesc", "修改机构信息");
			logObject.set("operatetype", "修改");		
			logObject.set("operatechange",util.marshallToString(entity) );					
			//DatabaseExt.getPrimaryKey(logObject);
			DatabaseUtil.insertEntity("default", logObject);
		}
	}

}
