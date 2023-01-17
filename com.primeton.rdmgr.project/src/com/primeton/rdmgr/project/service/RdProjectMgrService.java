package com.primeton.rdmgr.project.service;

import com.eos.das.entity.ExpressionHelper;
import com.eos.das.entity.IDASCriteria;
import com.eos.das.entity.criteria.CriteriaType;
import com.eos.spring.DASDaoSupport;
import com.primeton.rdmgr.data.rd.RdLaborDetail;
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
public class RdProjectMgrService extends DASDaoSupport implements IRdProjectMgrService{

	public RdTasklist[]  queryRdTasklists(CriteriaType criteriaType){
		IDASCriteria dasCriteria = null;
		if (criteriaType == null)
			dasCriteria = getDASTemplate().createCriteria("com.primeton.rdmgr.data.rd.RdTasklist");
		else {
			criteriaType.set("_entity", "com.primeton.rdmgr.data.rd.RdTasklist");
			dasCriteria = getDASTemplate().criteriaTypeToDASCriteria(criteriaType);
		}
		return getDASTemplate().queryEntitiesByCriteriaEntity(RdTasklist.class, dasCriteria);

	}
	
	public void CalculateStandardLabor(String userId, java.util.Date day, int hours) {
		if (userId == null || "".equals(userId) || day == null)
			return;
		if (hours <= 0) hours = 8;
		IDASCriteria dasCriteria = null;
		dasCriteria = getDASTemplate().createCriteria("com.primeton.rdmgr.data.rd.RdLaborDetail");
		dasCriteria.add(ExpressionHelper.eq("userId", userId));
		dasCriteria.add(ExpressionHelper.eq("laborDate", day));
		RdLaborDetail[] details = getDASTemplate().queryEntitiesByCriteriaEntity(RdLaborDetail.class, dasCriteria);
		
		if (details != null && details.length > 0) {
			float actHours = 0;
			for (RdLaborDetail detail : details) {
				actHours += detail.getActHours();
				detail.setStdHours(detail.getActHours());
			}
			if (actHours > hours) {
				for (RdLaborDetail detail : details) {
					detail.setStdHours(detail.getActHours() * hours / actHours);
				}
			}
			getDASTemplate().updateEntityBatch(details);
		}
	}

}

