package com.zhonghe.ame.keyTask;

import cn.hutool.core.util.StrUtil;

import com.eos.system.annotation.Bizlet;

@Bizlet("发起的流程名称工具")
public class FlowInsNameUtil {

	@Bizlet("公司重点任务申报流程名称")
	public String getCompanyTaskFlowName(String userName, String secOrgname, String taskYear) throws Exception {
		return StrUtil.format("{}发起了公司重点任务申报流程，任务年份：{}年，责任单位：{}", userName, taskYear, secOrgname);
	}

	@Bizlet("公司重点任务进度审核流程名称")
	public String getTaskItemFlowName(String userName, String secOrgname, String taskYear) throws Exception {
		return StrUtil.format("{}发起了公司重点任务执行进度审核流程，任务年份：{}年，责任单位：{}", userName, taskYear, secOrgname);
	}
	
	@Bizlet("集团重点任务申报流程名称")
	public String getGroupTaskFlowName(String userName, String secOrgname, String taskYear) throws Exception {
		return StrUtil.format("{}发起了集团重点任务分解申报流程，任务年份：{}年，责任单位：{}", userName, taskYear, secOrgname);
	}
	
	@Bizlet("集团重点任务进度审核流程名称")
	public String getGroupTaskItemFlowName(String userName, String secOrgname, String taskYear) throws Exception {
		return StrUtil.format("{}发起了集团重点任务执行进度审核流程，任务年份：{}年，责任单位：{}", userName, taskYear, secOrgname);
	}
	
}
