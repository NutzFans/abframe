/*******************************************************************************
 * $Header: /cvsroot/MIS10/src/NEWERP/org.gocom.abframe.tools/src/org/gocom/abframe/tools/testcase/StatementMonitor.java,v 1.1 2013/06/02 19:53:46 huangqj Exp $
 * $Revision: 1.1 $
 * $Date: 2013/06/02 19:53:46 $
 *
 *==============================================================================
 *
 * Copyright (c) 2001-2006 Primeton Technologies, Ltd.
 * All rights reserved.
 * 
 * Created on 2009-4-8
 *******************************************************************************/

package org.gocom.abframe.tools.testcase;

import java.sql.Statement;

import com.eos.infra.connection.IStatementSynchronization;

public class StatementMonitor implements IStatementSynchronization {

	public void afterSqlExecute(Statement arg0, String arg1) {
		/*
		 * String tmpsql = arg1.toUpperCase().trim();
		 * if(tmpsql.startsWith("UPDATE")){ loger.println(arg1); }
		 */
	}

	public void afterSqlExecuteWithException(Statement arg0, String arg1, Exception arg2) {

	}

	public void beforeSqlExecute(Statement arg0, String arg1) {

	}

	public void onClose(Statement arg0) {

	}

	public void onCreate(Statement arg0) {

	}

	public void onException(Statement arg0, Exception arg1) {

	}

}
