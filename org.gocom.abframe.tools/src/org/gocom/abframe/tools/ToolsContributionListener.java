/*******************************************************************************
 * $Header: /cvsroot/MIS10/src/NEWERP/org.gocom.abframe.tools/src/org/gocom/abframe/tools/ToolsContributionListener.java,v 1.1 2013/06/02 19:53:23 huangqj Exp $
 * $Revision: 1.1 $
 * $Date: 2013/06/02 19:53:23 $
 *
 *==============================================================================
 *
 * Copyright (c) 2001-2006 Primeton Technologies, Ltd.
 * All rights reserved.
 * 
 * Created on 2009-5-26
 *******************************************************************************/


package org.gocom.abframe.tools;

import com.eos.runtime.resource.IContributionEvent;
import com.eos.runtime.resource.IContributionListener;

public class ToolsContributionListener implements IContributionListener {
	public void load(IContributionEvent event) {

	}

	public void loadFinished(IContributionEvent event) {
		//初始化日志工厂
		ABFLogFactory.getInstance().register();
	}

	public void unLoad(IContributionEvent event) {
		//关闭日志工厂
		ABFLogFactory.getInstance().unRegister();
	}

}
