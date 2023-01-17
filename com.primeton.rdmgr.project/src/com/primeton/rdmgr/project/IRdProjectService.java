package com.primeton.rdmgr.project;

import com.eos.das.entity.criteria.CriteriaType;
import com.eos.foundation.PageCond;

import com.primeton.rdmgr.data.rd.RdProject;

/**
 * <pre>
 * Title: ������������
 * Description: �����ܵ����� 
 * </pre>
 * @author wkq (mailto:service6@primeton.com)
 * @version 1.00.00
 * 
 */
/*
 * �޸���ʷ
 * $log$
 */
public interface IRdProjectService{

	/**
	 *
	 * @param rdProject RdProject
	 */
	public abstract void addRdProject(RdProject rdProject);

	/**
	 *
	 * @param rdProjects RdProject[]
	 */
	public abstract void deleteRdProject(RdProject[] rdProjects);

	/**
	 *
	 * @param rdProject RdProject[]
	 */
	public abstract void getRdProject(RdProject rdProject);

	/**
	 *
	 * @param criteria CriteriaType
	 * @param page PageCond
	 * @return RdProject[]
	 */
	public abstract RdProject[] queryRdProjects(CriteriaType criteriaType,
			PageCond pageCond);

	/**
	 *
	 * @param rdProject RdProject[]
	 */
	public abstract void updateRdProject(RdProject rdProject);
	
	/**
	 * �����Ŀ��ţ���ѯ��ǰ��Ŀ�µ����й����б�
	 * @param rdProject 
	 * @return
	 */
	/**
	 * @param userId
	 * @return
	 */
	public abstract RdProject[] queryOwnerProjects(String userId);

	/**
	 * @param userId
	 * @return
	 */
	public abstract RdProject[] queryManagedProjects(String userId);
}
