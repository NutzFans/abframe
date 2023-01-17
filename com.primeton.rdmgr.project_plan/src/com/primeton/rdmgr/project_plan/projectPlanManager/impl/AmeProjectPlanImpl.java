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

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

/**
 * <!-- begin-user-doc -->
 * A representation of the model object '<em><b>Test</b></em>'.
 * <!-- end-user-doc -->
 *
 * <p>
 * The following features are supported:
 * <ul>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.impl.AmeProjectPlanImpl#getPlanId <em>PlanId</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.impl.AmeProjectPlanImpl#getVersionNo <em>VersionNo</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.impl.AmeProjectPlanImpl#getProjectNo <em>ProjectNo</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.impl.AmeProjectPlanImpl#getProjectName <em>ProjectName</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.impl.AmeProjectPlanImpl#getSubmitter <em>Submitter</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.impl.AmeProjectPlanImpl#getPtime <em>Ptime</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.impl.AmeProjectPlanImpl#getState <em>State</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.impl.AmeProjectPlanImpl#getProcessinstid <em>Processinstid</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.impl.AmeProjectPlanImpl#getAmeProjectPlanDetails <em>AmeProjectPlanDetails</em>}</li>
 * </ul>
 * </p>
 *
 * @extends ExtendedDataObjectImpl;
 *
 * @implements AmeProjectPlan;
 */

public class AmeProjectPlanImpl extends ExtendedDataObjectImpl implements AmeProjectPlan {
	/**
	 * Comment for <code>serialVersionUID</code>
	 */
	private static final long serialVersionUID = 1L;
	public final static int INDEX_PLANID = 0;
	public final static int INDEX_VERSIONNO = 1;
	public final static int INDEX_PROJECTNO = 2;
	public final static int INDEX_PROJECTNAME = 3;
	public final static int INDEX_SUBMITTER = 4;
	public final static int INDEX_PTIME = 5;
	public final static int INDEX_STATE = 6;
	public final static int INDEX_PROCESSINSTID = 7;
	public final static int INDEX_AMEPROJECTPLANDETAILS = 8;
	public static final int SDO_PROPERTY_COUNT = 9;

	public static final int EXTENDED_PROPERTY_COUNT = -1;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 */
	public AmeProjectPlanImpl() {
		this(TYPE);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 */
	public AmeProjectPlanImpl(Type type) {
		super(type);
	}

	protected void validate() {
		validateType(TYPE);
	}

	/**
	 * Returns the value of the '<em><b>PlanId</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>PlanId</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>PlanId</em>' attribute.
	 * @see #setPlanId(java.math.BigDecimal)
	 */
	public BigDecimal getPlanId() {
		return DataUtil.toBigDecimal(super.getByIndex(INDEX_PLANID, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getPlanId <em>PlanId</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>PlanId</em>' attribute.
	 * @see #getPlanId()
	 */
	public void setPlanId(BigDecimal planId) {
		super.setByIndex(INDEX_PLANID, planId);
	}

	/**
	 * Returns the value of the '<em><b>VersionNo</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>VersionNo</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>VersionNo</em>' attribute.
	 * @see #setVersionNo(int)
	 */
	public int getVersionNo() {
		return DataUtil.toInt(super.getByIndex(INDEX_VERSIONNO, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getVersionNo <em>VersionNo</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>VersionNo</em>' attribute.
	 * @see #getVersionNo()
	 */
	public void setVersionNo(int versionNo) {
		super.setByIndex(INDEX_VERSIONNO, versionNo);
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
	 * Returns the value of the '<em><b>State</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>State</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>State</em>' attribute.
	 * @see #setState(java.lang.String)
	 */
	public String getState() {
		return DataUtil.toString(super.getByIndex(INDEX_STATE, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getState <em>State</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>State</em>' attribute.
	 * @see #getState()
	 */
	public void setState(String state) {
		super.setByIndex(INDEX_STATE, state);
	}

	/**
	 * Returns the value of the '<em><b>Processinstid</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Processinstid</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Processinstid</em>' attribute.
	 * @see #setProcessinstid(java.math.BigDecimal)
	 */
	public BigDecimal getProcessinstid() {
		return DataUtil.toBigDecimal(super.getByIndex(INDEX_PROCESSINSTID, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getProcessinstid <em>Processinstid</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Processinstid</em>' attribute.
	 * @see #getProcessinstid()
	 */
	public void setProcessinstid(BigDecimal processinstid) {
		super.setByIndex(INDEX_PROCESSINSTID, processinstid);
	}

	/**
	 * Returns the value of the '<em><b>AmeProjectPlanDetails</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>AmeProjectPlanDetails</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>AmeProjectPlanDetails</em>' attribute.
	 * @see #setAmeProjectPlanDetails(com.primeton.rdmgr.project_plan.projectPlanManager.AmeProjectPlanDetail)
	 */
	public List<AmeProjectPlanDetail> getAmeProjectPlanDetails() {
		return (List<AmeProjectPlanDetail>) getList(INDEX_AMEPROJECTPLANDETAILS, true);
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getAmeProjectPlanDetails <em>AmeProjectPlanDetails</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>AmeProjectPlanDetails</em>' attribute.
	 * @see #getAmeProjectPlanDetails()
	 */
	public void setAmeProjectPlanDetails(List<AmeProjectPlanDetail> ameProjectPlanDetails) {
		super.setByIndex(INDEX_AMEPROJECTPLANDETAILS, ameProjectPlanDetails);
	}


}