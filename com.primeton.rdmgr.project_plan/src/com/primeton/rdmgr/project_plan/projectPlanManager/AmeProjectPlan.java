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
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.AmeProjectPlan#getPlanId <em>PlanId</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.AmeProjectPlan#getVersionNo <em>VersionNo</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.AmeProjectPlan#getProjectNo <em>ProjectNo</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.AmeProjectPlan#getProjectName <em>ProjectName</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.AmeProjectPlan#getSubmitter <em>Submitter</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.AmeProjectPlan#getPtime <em>Ptime</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.AmeProjectPlan#getState <em>State</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.AmeProjectPlan#getProcessinstid <em>Processinstid</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.AmeProjectPlan#getAmeProjectPlanDetails <em>AmeProjectPlanDetails</em>}</li>
 * </ul>
 * </p>
 *
 * @extends DataObject;
 */
public interface AmeProjectPlan extends DataObject {

	public static final String QNAME = "com.primeton.rdmgr.project_plan.projectPlanManager.AmeProjectPlan";

	public static final Type TYPE = TypeHelper.INSTANCE.getType("com.primeton.rdmgr.project_plan.projectPlanManager", "AmeProjectPlan");

	public static final IObjectFactory<AmeProjectPlan> FACTORY = new IObjectFactory<AmeProjectPlan>() {
		public AmeProjectPlan create() {
			return (AmeProjectPlan) DataFactory.INSTANCE.create(TYPE);
		}
	};

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
	public BigDecimal getPlanId();

	/**
	 * Sets the value of the '{@link com.primeton.rdmgr.project_plan.projectPlanManager.AmeProjectPlan#getPlanId <em>PlanId</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>PlanId</em>' attribute.
	 * @see #getPlanId()
	 */
	public void setPlanId(BigDecimal planId);

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
	public int getVersionNo();

	/**
	 * Sets the value of the '{@link com.primeton.rdmgr.project_plan.projectPlanManager.AmeProjectPlan#getVersionNo <em>VersionNo</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>VersionNo</em>' attribute.
	 * @see #getVersionNo()
	 */
	public void setVersionNo(int versionNo);

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
	public String getProjectNo();

	/**
	 * Sets the value of the '{@link com.primeton.rdmgr.project_plan.projectPlanManager.AmeProjectPlan#getProjectNo <em>ProjectNo</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>ProjectNo</em>' attribute.
	 * @see #getProjectNo()
	 */
	public void setProjectNo(String projectNo);

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
	public String getProjectName();

	/**
	 * Sets the value of the '{@link com.primeton.rdmgr.project_plan.projectPlanManager.AmeProjectPlan#getProjectName <em>ProjectName</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>ProjectName</em>' attribute.
	 * @see #getProjectName()
	 */
	public void setProjectName(String projectName);

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
	public String getSubmitter();

	/**
	 * Sets the value of the '{@link com.primeton.rdmgr.project_plan.projectPlanManager.AmeProjectPlan#getSubmitter <em>Submitter</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Submitter</em>' attribute.
	 * @see #getSubmitter()
	 */
	public void setSubmitter(String submitter);

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
	public Date getPtime();

	/**
	 * Sets the value of the '{@link com.primeton.rdmgr.project_plan.projectPlanManager.AmeProjectPlan#getPtime <em>Ptime</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Ptime</em>' attribute.
	 * @see #getPtime()
	 */
	public void setPtime(Date ptime);

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
	public String getState();

	/**
	 * Sets the value of the '{@link com.primeton.rdmgr.project_plan.projectPlanManager.AmeProjectPlan#getState <em>State</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>State</em>' attribute.
	 * @see #getState()
	 */
	public void setState(String state);

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
	public BigDecimal getProcessinstid();

	/**
	 * Sets the value of the '{@link com.primeton.rdmgr.project_plan.projectPlanManager.AmeProjectPlan#getProcessinstid <em>Processinstid</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Processinstid</em>' attribute.
	 * @see #getProcessinstid()
	 */
	public void setProcessinstid(BigDecimal processinstid);

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
	public List<AmeProjectPlanDetail> getAmeProjectPlanDetails();

	/**
	 * Sets the value of the '{@link com.primeton.rdmgr.project_plan.projectPlanManager.AmeProjectPlan#getAmeProjectPlanDetails <em>AmeProjectPlanDetails</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>AmeProjectPlanDetails</em>' attribute.
	 * @see #getAmeProjectPlanDetails()
	 */
	public void setAmeProjectPlanDetails(List<AmeProjectPlanDetail> ameProjectPlanDetails);


}