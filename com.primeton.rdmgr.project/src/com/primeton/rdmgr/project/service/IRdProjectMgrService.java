package com.primeton.rdmgr.project.service;

import com.eos.das.entity.criteria.CriteriaType;

import com.primeton.rdmgr.data.rd.RdTasklist;

/**
 * <pre>
 * Title: 程序的中文名称
 * Description: 程序功能的描述 
 * </pre>
 * @author wkq (mailto:service6@primeton.com)
 * @version 1.00.00
 * 
 */
/*
 * 修改历史
 * $log$
 */
public interface IRdProjectMgrService{

	/**
	 *
	 * @param criteria CriteriaType
	 * @param page PageCond
	 * @return RdTasklist[]
	 */
	public abstract RdTasklist[] queryRdTasklists(CriteriaType criteriaType);

	public void CalculateStandardLabor(String userId, java.util.Date day, int hours);
}
