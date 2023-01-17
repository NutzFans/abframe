package com.primeton.rdmgr.project;

import com.eos.das.entity.ExpressionHelper;
import com.eos.das.entity.IDASCriteria;
import com.eos.das.entity.criteria.CriteriaType;
import com.eos.foundation.PageCond;
import com.eos.spring.DASDaoSupport;
import com.primeton.rdmgr.data.rd.RdProject;

import commonj.sdo.DataObject;

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
public class RdProjectService extends DASDaoSupport implements IRdProjectService{
	public void addRdProject(RdProject rdProject){
		getDASTemplate().getPrimaryKey(rdProject);
		getDASTemplate().insertEntity(rdProject);
	}

	public void deleteRdProject(RdProject[] rdProjects ){
		for(DataObject rdProject:rdProjects){
			getDASTemplate().deleteEntityCascade(rdProject);
		}
	}


	public void getRdProject(RdProject rdProject){
		getDASTemplate().expandEntity(rdProject);
	}


	public RdProject[]  queryRdProjects(CriteriaType criteriaType,PageCond pageCond){
		IDASCriteria dasCriteria = getDASTemplate().criteriaTypeToDASCriteria(criteriaType);
		return getDASTemplate().queryEntitiesByCriteriaEntityWithPage(RdProject.class, dasCriteria, pageCond);
	}


    public void updateRdProject(RdProject rdProject){
	    getDASTemplate().updateEntity(rdProject);
    }
	public RdProject[] queryOwnerProjects(String userId) {
		// TODO �Զ���ɷ������
		if (userId == null || "".equals(userId))
			return null;
		return getDASTemplate().queryByNamedSql(RdProject.class, "com.primeton.rdmgr.project.ProjectQuery.getOwnerProjects", userId);
	}

	public RdProject[] queryManagedProjects(String userId) {
		// TODO �Զ���ɷ������
		if (userId == null || "".equals(userId))
			return null;
		return getDASTemplate().queryByNamedSql(RdProject.class, "com.primeton.rdmgr.project.ProjectQuery.getManagedProjects", userId);
	}
}

