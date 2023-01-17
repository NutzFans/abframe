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
import com.primeton.rdmgr.project_plan.projectPlanManager.AmeProjectWeekly;

import commonj.sdo.Type;

import java.math.BigDecimal;
import java.util.Date;

/**
 * <!-- begin-user-doc -->
 * A representation of the model object '<em><b>Test</b></em>'.
 * <!-- end-user-doc -->
 *
 * <p>
 * The following features are supported:
 * <ul>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.impl.AmeProjectWeeklyImpl#getWeeklyId <em>WeeklyId</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.impl.AmeProjectWeeklyImpl#getProjectNo <em>ProjectNo</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.impl.AmeProjectWeeklyImpl#getProjectName <em>ProjectName</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.impl.AmeProjectWeeklyImpl#getPtime <em>Ptime</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.impl.AmeProjectWeeklyImpl#getWeeklycont <em>Weeklycont</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.impl.AmeProjectWeeklyImpl#getSubmitter <em>Submitter</em>}</li>
 * </ul>
 * </p>
 *
 * @extends ExtendedDataObjectImpl;
 *
 * @implements AmeProjectWeekly;
 */

public class AmeProjectWeeklyImpl extends ExtendedDataObjectImpl implements AmeProjectWeekly {
	/**
	 * Comment for <code>serialVersionUID</code>
	 */
	private static final long serialVersionUID = 1L;
	public final static int INDEX_WEEKLYID = 0;
	public final static int INDEX_PROJECTNO = 1;
	public final static int INDEX_PROJECTNAME = 2;
	public final static int INDEX_PTIME = 3;
	public final static int INDEX_WEEKLYCONT = 4;
	public final static int INDEX_SUBMITTER = 5;
	public static final int SDO_PROPERTY_COUNT = 6;

	public static final int EXTENDED_PROPERTY_COUNT = -1;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 */
	public AmeProjectWeeklyImpl() {
		this(TYPE);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 */
	public AmeProjectWeeklyImpl(Type type) {
		super(type);
	}

	protected void validate() {
		validateType(TYPE);
	}

	/**
	 * Returns the value of the '<em><b>WeeklyId</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>WeeklyId</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>WeeklyId</em>' attribute.
	 * @see #setWeeklyId(java.math.BigDecimal)
	 */
	public BigDecimal getWeeklyId() {
		return DataUtil.toBigDecimal(super.getByIndex(INDEX_WEEKLYID, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getWeeklyId <em>WeeklyId</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>WeeklyId</em>' attribute.
	 * @see #getWeeklyId()
	 */
	public void setWeeklyId(BigDecimal weeklyId) {
		super.setByIndex(INDEX_WEEKLYID, weeklyId);
	}

	/**
	 * Returns the value of the '<em><b>ProjectNo</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>ProjectNo</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>ProjectNo</em>' attribute.
	 * @see #setProjectNo(java.lang.String)
	 */
	public String getProjectNo() {
		return DataUtil.toString(super.getByIndex(INDEX_PROJECTNO, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getProjectNo <em>ProjectNo</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>ProjectNo</em>' attribute.
	 * @see #getProjectNo()
	 */
	public void setProjectNo(String projectNo) {
		super.setByIndex(INDEX_PROJECTNO, projectNo);
	}

	/**
	 * Returns the value of the '<em><b>ProjectName</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>ProjectName</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>ProjectName</em>' attribute.
	 * @see #setProjectName(java.lang.String)
	 */
	public String getProjectName() {
		return DataUtil.toString(super.getByIndex(INDEX_PROJECTNAME, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getProjectName <em>ProjectName</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>ProjectName</em>' attribute.
	 * @see #getProjectName()
	 */
	public void setProjectName(String projectName) {
		super.setByIndex(INDEX_PROJECTNAME, projectName);
	}

	/**
	 * Returns the value of the '<em><b>Ptime</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Ptime</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Ptime</em>' attribute.
	 * @see #setPtime(java.util.Date)
	 */
	public Date getPtime() {
		return DataUtil.toDate(super.getByIndex(INDEX_PTIME, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getPtime <em>Ptime</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Ptime</em>' attribute.
	 * @see #getPtime()
	 */
	public void setPtime(Date ptime) {
		super.setByIndex(INDEX_PTIME, ptime);
	}

	/**
	 * Returns the value of the '<em><b>Weeklycont</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Weeklycont</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Weeklycont</em>' attribute.
	 * @see #setWeeklycont(java.lang.String)
	 */
	public String getWeeklycont() {
		return DataUtil.toString(super.getByIndex(INDEX_WEEKLYCONT, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getWeeklycont <em>Weeklycont</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Weeklycont</em>' attribute.
	 * @see #getWeeklycont()
	 */
	public void setWeeklycont(String weeklycont) {
		super.setByIndex(INDEX_WEEKLYCONT, weeklycont);
	}

	/**
	 * Returns the value of the '<em><b>Submitter</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Submitter</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Submitter</em>' attribute.
	 * @see #setSubmitter(java.lang.String)
	 */
	public String getSubmitter() {
		return DataUtil.toString(super.getByIndex(INDEX_SUBMITTER, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getSubmitter <em>Submitter</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Submitter</em>' attribute.
	 * @see #getSubmitter()
	 */
	public void setSubmitter(String submitter) {
		super.setByIndex(INDEX_SUBMITTER, submitter);
	}


}