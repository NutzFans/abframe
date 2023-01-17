/*******************************************************************************
 *
 * Copyright (c) 2001-2006 Primeton Technologies, Ltd.
 * All rights reserved.
 *
 * Created on Apr 11, 2008
 *******************************************************************************/
package com.primeton.rdmgr.project_plan.projectPlanManager;

import com.eos.data.sdo.IObjectFactory;

import commonj.sdo.DataObject;
import commonj.sdo.Type;
import commonj.sdo.helper.DataFactory;
import commonj.sdo.helper.TypeHelper;

import java.util.Date;

/**
 * <!-- begin-user-doc -->
 * A representation of the model object '<em><b>Test</b></em>'.
 * <!-- end-user-doc -->
 *
 * <p>
 * The following features are supported:
 * <ul>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.AmeProjectPlanDetail#getStage <em>Stage</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.AmeProjectPlanDetail#getStartTime <em>StartTime</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.AmeProjectPlanDetail#getEndTime <em>EndTime</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.AmeProjectPlanDetail#getAmeProjectPlan <em>AmeProjectPlan</em>}</li>
 * </ul>
 * </p>
 *
 * @extends DataObject;
 */
public interface AmeProjectPlanDetail extends DataObject {

	public static final String QNAME = "com.primeton.rdmgr.project_plan.projectPlanManager.AmeProjectPlanDetail";

	public static final Type TYPE = TypeHelper.INSTANCE.getType("com.primeton.rdmgr.project_plan.projectPlanManager", "AmeProjectPlanDetail");

	public static final IObjectFactory<AmeProjectPlanDetail> FACTORY = new IObjectFactory<AmeProjectPlanDetail>() {
		public AmeProjectPlanDetail create() {
			return (AmeProjectPlanDetail) DataFactory.INSTANCE.create(TYPE);
		}
	};

	/**
	 * Returns the value of the '<em><b>Stage</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Stage</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Stage</em>' attribute.
	 * @see #setStage(java.lang.String)
	 */
	public String getStage();

	/**
	 * Sets the value of the '{@link com.primeton.rdmgr.project_plan.projectPlanManager.AmeProjectPlanDetail#getStage <em>Stage</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Stage</em>' attribute.
	 * @see #getStage()
	 */
	public void setStage(String stage);

	/**
	 * Returns the value of the '<em><b>StartTime</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>StartTime</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>StartTime</em>' attribute.
	 * @see #setStartTime(java.util.Date)
	 */
	public Date getStartTime();

	/**
	 * Sets the value of the '{@link com.primeton.rdmgr.project_plan.projectPlanManager.AmeProjectPlanDetail#getStartTime <em>StartTime</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>StartTime</em>' attribute.
	 * @see #getStartTime()
	 */
	public void setStartTime(Date startTime);

	/**
	 * Returns the value of the '<em><b>EndTime</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>EndTime</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>EndTime</em>' attribute.
	 * @see #setEndTime(java.util.Date)
	 */
	public Date getEndTime();

	/**
	 * Sets the value of the '{@link com.primeton.rdmgr.project_plan.projectPlanManager.AmeProjectPlanDetail#getEndTime <em>EndTime</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>EndTime</em>' attribute.
	 * @see #getEndTime()
	 */
	public void setEndTime(Date endTime);

	/**
	 * Returns the value of the '<em><b>AmeProjectPlan</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>AmeProjectPlan</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>AmeProjectPlan</em>' attribute.
	 * @see #setAmeProjectPlan(com.primeton.rdmgr.project_plan.projectPlanManager.AmeProjectPlan)
	 */
	public AmeProjectPlan getAmeProjectPlan();

	/**
	 * Sets the value of the '{@link com.primeton.rdmgr.project_plan.projectPlanManager.AmeProjectPlanDetail#getAmeProjectPlan <em>AmeProjectPlan</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>AmeProjectPlan</em>' attribute.
	 * @see #getAmeProjectPlan()
	 */
	public void setAmeProjectPlan(AmeProjectPlan ameProjectPlan);


}