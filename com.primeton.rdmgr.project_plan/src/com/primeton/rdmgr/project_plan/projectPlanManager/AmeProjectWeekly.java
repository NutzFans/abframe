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

/**
 * <!-- begin-user-doc -->
 * A representation of the model object '<em><b>Test</b></em>'.
 * <!-- end-user-doc -->
 *
 * <p>
 * The following features are supported:
 * <ul>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.AmeProjectWeekly#getWeeklyId <em>WeeklyId</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.AmeProjectWeekly#getProjectNo <em>ProjectNo</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.AmeProjectWeekly#getProjectName <em>ProjectName</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.AmeProjectWeekly#getPtime <em>Ptime</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.AmeProjectWeekly#getWeeklycont <em>Weeklycont</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.AmeProjectWeekly#getSubmitter <em>Submitter</em>}</li>
 * </ul>
 * </p>
 *
 * @extends DataObject;
 */
public interface AmeProjectWeekly extends DataObject {

	public static final String QNAME = "com.primeton.rdmgr.project_plan.projectPlanManager.AmeProjectWeekly";

	public static final Type TYPE = TypeHelper.INSTANCE.getType("com.primeton.rdmgr.project_plan.projectPlanManager", "AmeProjectWeekly");

	public static final IObjectFactory<AmeProjectWeekly> FACTORY = new IObjectFactory<AmeProjectWeekly>() {
		public AmeProjectWeekly create() {
			return (AmeProjectWeekly) DataFactory.INSTANCE.create(TYPE);
		}
	};

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
	public BigDecimal getWeeklyId();

	/**
	 * Sets the value of the '{@link com.primeton.rdmgr.project_plan.projectPlanManager.AmeProjectWeekly#getWeeklyId <em>WeeklyId</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>WeeklyId</em>' attribute.
	 * @see #getWeeklyId()
	 */
	public void setWeeklyId(BigDecimal weeklyId);

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
	 * Sets the value of the '{@link com.primeton.rdmgr.project_plan.projectPlanManager.AmeProjectWeekly#getProjectNo <em>ProjectNo</em>}' attribute.
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
	 * Sets the value of the '{@link com.primeton.rdmgr.project_plan.projectPlanManager.AmeProjectWeekly#getProjectName <em>ProjectName</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>ProjectName</em>' attribute.
	 * @see #getProjectName()
	 */
	public void setProjectName(String projectName);

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
	 * Sets the value of the '{@link com.primeton.rdmgr.project_plan.projectPlanManager.AmeProjectWeekly#getPtime <em>Ptime</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Ptime</em>' attribute.
	 * @see #getPtime()
	 */
	public void setPtime(Date ptime);

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
	public String getWeeklycont();

	/**
	 * Sets the value of the '{@link com.primeton.rdmgr.project_plan.projectPlanManager.AmeProjectWeekly#getWeeklycont <em>Weeklycont</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Weeklycont</em>' attribute.
	 * @see #getWeeklycont()
	 */
	public void setWeeklycont(String weeklycont);

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
	 * Sets the value of the '{@link com.primeton.rdmgr.project_plan.projectPlanManager.AmeProjectWeekly#getSubmitter <em>Submitter</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Submitter</em>' attribute.
	 * @see #getSubmitter()
	 */
	public void setSubmitter(String submitter);


}