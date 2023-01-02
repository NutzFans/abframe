/**
 * 
 */
package com.primeton.eos.ame_dailyoffice;

import java.util.Map;

import com.eos.system.annotation.Bizlet;

/**
 * @description 业务参数对象
 * @author zhengquan
 * @date 2019-03-11 17:14:13
 *
 */
@Bizlet("")
public class BusinessParam {
	private String processDefName;
	private String processInstName;
	private String processInstDesc;
	private String ywlx;
	
	public BusinessParam(String processDefName,
			String processInstName, String processInstDesc, String ywlx) {
		super();
		this.processDefName = processDefName;
		this.processInstName = processInstName;
		this.processInstDesc = processInstDesc;
		this.ywlx = ywlx;
	}

	public String getProcessDefName() {
		return processDefName;
	}

	public void setProcessDefName(String processDefName) {
		this.processDefName = processDefName;
	}

	public String getProcessInstName() {
		return processInstName;
	}

	public void setProcessInstName(String processInstName) {
		this.processInstName = processInstName;
	}

	public String getProcessInstDesc() {
		return processInstDesc;
	}

	public void setProcessInstDesc(String processInstDesc) {
		this.processInstDesc = processInstDesc;
	}

	public String getYwlx() {
		return ywlx;
	}

	public void setYwlx(String ywlx) {
		this.ywlx = ywlx;
	}
	
	public Map<String, Object> getBusinessDataMap() {
		// TODO 自动生成的方法存根
		return null;
	}
}
