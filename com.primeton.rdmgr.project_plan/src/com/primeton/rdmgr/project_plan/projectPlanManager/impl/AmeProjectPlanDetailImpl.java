/*******************************************************************************
 *
 * Copyright (c) 2001-2006 Primeton Technologies, Ltd.
 * All rights reserved.
 *
 * Created on Apr 11, 2008
 *******************************************************************************/
package com.primeton.rdmgr.project_plan.projectPlanManager.impl;

import com.primeton.ext.data.sdo.DataUtil;
import com.primeton.ext.data.sdo.ExtendedDataObjectImpl;
import com.primeton.rdmgr.project_plan.projectPlanManager.AmeProjectPlan;
import com.primeton.rdmgr.project_plan.projectPlanManager.AmeProjectPlanDetail;

import commonj.sdo.Type;

import java.util.Date;

/**
 * <!-- begin-user-doc -->
 * A representation of the model object '<em><b>Test</b></em>'.
 * <!-- end-user-doc -->
 *
 * <p>
 * The following features are supported:
 * <ul>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.impl.AmeProjectPlanDetailImpl#getStage <em>Stage</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.impl.AmeProjectPlanDetailImpl#getStartTime <em>StartTime</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.impl.AmeProjectPlanDetailImpl#getEndTime <em>EndTime</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.impl.AmeProjectPlanDetailImpl#getAmeProjectPlan <em>AmeProjectPlan</em>}</li>
 * </ul>
 * </p>
 *
 * @extends ExtendedDataObjectImpl;
 *
 * @implements AmeProjectPlanDetail;
 */

public class AmeProjectPlanDetailImpl extends ExtendedDataObjectImpl implements AmeProjectPlanDetail {
	/**
	 * Comment for <code>serialVersionUID</code>
	 */
	private static final long serialVersionUID = 1L;
	public final static int INDEX_STAGE = 0;
	public final static int INDEX_STARTTIME = 1;
	public final static int INDEX_ENDTIME = 2;
	public final static int INDEX_AMEPROJECTPLAN = 3;
	public static final int SDO_PROPERTY_COUNT = 4;

	public static final int EXTENDED_PROPERTY_COUNT = -1;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 */
	public AmeProjectPlanDetailImpl() {
		this(TYPE);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 */
	public AmeProjectPlanDetailImpl(Type type) {
		super(type);
	}

	protected void validate() {
		validateType(TYPE);
	}

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
	public String getStage() {
		return DataUtil.toString(super.getByIndex(INDEX_STAGE, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getStage <em>Stage</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Stage</em>' attribute.
	 * @see #getStage()
	 */
	public void setStage(String stage) {
		super.setByIndex(INDEX_STAGE, stage);
	}

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
	public Date getStartTime() {
		return DataUtil.toDate(super.getByIndex(INDEX_STARTTIME, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getStartTime <em>StartTime</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>StartTime</em>' attribute.
	 * @see #getStartTime()
	 */
	public void setStartTime(Date startTime) {
		super.setByIndex(INDEX_STARTTIME, startTime);
	}

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
	public Date getEndTime() {
		return DataUtil.toDate(super.getByIndex(INDEX_ENDTIME, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getEndTime <em>EndTime</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>EndTime</em>' attribute.
	 * @see #getEndTime()
	 */
	public void setEndTime(Date endTime) {
		super.setByIndex(INDEX_ENDTIME, endTime);
	}

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
	public AmeProjectPlan getAmeProjectPlan() {
		return (AmeProjectPlan) DataUtil.toDataObject(super.getByIndex(INDEX_AMEPROJECTPLAN, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getAmeProjectPlan <em>AmeProjectPlan</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>AmeProjectPlan</em>' attribute.
	 * @see #getAmeProjectPlan()
	 */
	public void setAmeProjectPlan(AmeProjectPlan ameProjectPlan) {
		super.setByIndex(INDEX_AMEPROJECTPLAN, ameProjectPlan);
	}


}