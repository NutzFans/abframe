
package com.zhonghe.ame.contractPact;

import com.eos.das.entity.IDASCriteria;
import com.eos.das.entity.criteria.CriteriaType;
import com.eos.foundation.PageCond;
import com.eos.spring.DASDaoSupport;
import com.zhonghe.ame.payContract.payContract.AnnualPaymentPlan;

import commonj.sdo.DataObject;

/**
 * <pre>
 * Title: 程序的中文名称
 * Description: 程序功能的描述 
 * </pre>
 * @author huangqj (mailto:service6@primeton.com)
 * @version 1.00.00
 * 
 */
/*
 * 修改历史
 * $log$
 */
public class AnnualPaymentPlanService extends DASDaoSupport implements IAnnualPaymentPlanService{
	public void addAnnualPaymentPlan(AnnualPaymentPlan annualPaymentPlan){
		getDASTemplate().getPrimaryKey(annualPaymentPlan);
		getDASTemplate().insertEntity(annualPaymentPlan);
	}

	public void deleteAnnualPaymentPlan(AnnualPaymentPlan[] annualPaymentPlans ){
		for(DataObject annualPaymentPlan:annualPaymentPlans){
			getDASTemplate().deleteEntityCascade(annualPaymentPlan);
		}
	}


	public void getAnnualPaymentPlan(AnnualPaymentPlan annualPaymentPlan){
		getDASTemplate().expandEntity(annualPaymentPlan);
	}


	public AnnualPaymentPlan[] queryAnnualPaymentPlans(CriteriaType criteriaType,PageCond pageCond){
		IDASCriteria dasCriteria = getDASTemplate().criteriaTypeToDASCriteria(criteriaType);
		return getDASTemplate().queryEntitiesByCriteriaEntityWithPage(AnnualPaymentPlan.class, dasCriteria, pageCond);
	}


    public void updateAnnualPaymentPlan(AnnualPaymentPlan annualPaymentPlan){
	    getDASTemplate().updateEntity(annualPaymentPlan);
    }
    
}

