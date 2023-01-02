package com.zhonghe.ame.contractPact;
import com.eos.das.entity.criteria.CriteriaType;
import com.eos.foundation.PageCond;

import com.zhonghe.ame.payContract.payContract.AnnualPaymentPlan;

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
public interface IAnnualPaymentPlanService{

	/**
	 *
	 * @param annualPaymentPlan AnnualPaymentPlan
	 */
	public abstract void addAnnualPaymentPlan(AnnualPaymentPlan annualPaymentPlan);

	/**
	 *
	 * @param annualPaymentPlans AnnualPaymentPlan[]
	 */
	public abstract void deleteAnnualPaymentPlan(AnnualPaymentPlan[] annualPaymentPlans);

	/**
	 *
	 * @param annualPaymentPlan AnnualPaymentPlan[]
	 */
	public abstract void getAnnualPaymentPlan(AnnualPaymentPlan annualPaymentPlan);

	/**
	 *
	 * @param criteria CriteriaType
	 * @param page PageCond
	 * @return AnnualPaymentPlan[]
	 */
	public abstract AnnualPaymentPlan[] queryAnnualPaymentPlans(CriteriaType criteriaType,
			PageCond pageCond);

	/**
	 *
	 * @param annualPaymentPlan AnnualPaymentPlan[]
	 */
	public abstract void updateAnnualPaymentPlan(AnnualPaymentPlan annualPaymentPlan);

}
