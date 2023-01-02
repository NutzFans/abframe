/*******************************************************************************
 *
 * Copyright (c) 2001-2006 Primeton Technologies, Ltd.
 * All rights reserved.
 *
 * Created on Apr 11, 2008
 *******************************************************************************/
package com.primeton.rdmgr.data.rd.impl;

import com.primeton.ext.data.sdo.DataUtil;
import com.primeton.ext.data.sdo.ExtendedDataObjectImpl;
import com.primeton.rdmgr.data.rd.OmOrganization;
import com.primeton.rdmgr.data.rd.RdLaborDetail;

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
 *   <li>{@link com.primeton.rdmgr.data.rd.impl.RdLaborDetailImpl#getLaborDetailId <em>LaborDetailId</em>}</li>
 *   <li>{@link com.primeton.rdmgr.data.rd.impl.RdLaborDetailImpl#getLaborDate <em>LaborDate</em>}</li>
 *   <li>{@link com.primeton.rdmgr.data.rd.impl.RdLaborDetailImpl#getTasklist <em>Tasklist</em>}</li>
 *   <li>{@link com.primeton.rdmgr.data.rd.impl.RdLaborDetailImpl#getTaskname <em>Taskname</em>}</li>
 *   <li>{@link com.primeton.rdmgr.data.rd.impl.RdLaborDetailImpl#getUserId <em>UserId</em>}</li>
 *   <li>{@link com.primeton.rdmgr.data.rd.impl.RdLaborDetailImpl#getProjectId <em>ProjectId</em>}</li>
 *   <li>{@link com.primeton.rdmgr.data.rd.impl.RdLaborDetailImpl#getActHours <em>ActHours</em>}</li>
 *   <li>{@link com.primeton.rdmgr.data.rd.impl.RdLaborDetailImpl#getStdHours <em>StdHours</em>}</li>
 *   <li>{@link com.primeton.rdmgr.data.rd.impl.RdLaborDetailImpl#getRepContent <em>RepContent</em>}</li>
 *   <li>{@link com.primeton.rdmgr.data.rd.impl.RdLaborDetailImpl#getIsClose <em>IsClose</em>}</li>
 *   <li>{@link com.primeton.rdmgr.data.rd.impl.RdLaborDetailImpl#getUserOrgId <em>UserOrgId</em>}</li>
 *   <li>{@link com.primeton.rdmgr.data.rd.impl.RdLaborDetailImpl#getGrade <em>Grade</em>}</li>
 *   <li>{@link com.primeton.rdmgr.data.rd.impl.RdLaborDetailImpl#getCost <em>Cost</em>}</li>
 *   <li>{@link com.primeton.rdmgr.data.rd.impl.RdLaborDetailImpl#getPrice <em>Price</em>}</li>
 *   <li>{@link com.primeton.rdmgr.data.rd.impl.RdLaborDetailImpl#getInsertdate <em>Insertdate</em>}</li>
 *   <li>{@link com.primeton.rdmgr.data.rd.impl.RdLaborDetailImpl#getLastupdatedate <em>Lastupdatedate</em>}</li>
 *   <li>{@link com.primeton.rdmgr.data.rd.impl.RdLaborDetailImpl#getOrg <em>Org</em>}</li>
 *   <li>{@link com.primeton.rdmgr.data.rd.impl.RdLaborDetailImpl#getOmOrganization <em>OmOrganization</em>}</li>
 *   <li>{@link com.primeton.rdmgr.data.rd.impl.RdLaborDetailImpl#getRdWorklist <em>RdWorklist</em>}</li>
 * </ul>
 * </p>
 *
 * @extends ExtendedDataObjectImpl;
 *
 * @implements RdLaborDetail;
 */

public class RdLaborDetailImpl extends ExtendedDataObjectImpl implements RdLaborDetail {
	/**
	 * Comment for <code>serialVersionUID</code>
	 */
	private static final long serialVersionUID = 1L;
	public final static int INDEX_LABORDETAILID = 0;
	public final static int INDEX_LABORDATE = 1;
	public final static int INDEX_TASKLIST = 2;
	public final static int INDEX_TASKNAME = 3;
	public final static int INDEX_USERID = 4;
	public final static int INDEX_PROJECTID = 5;
	public final static int INDEX_ACTHOURS = 6;
	public final static int INDEX_STDHOURS = 7;
	public final static int INDEX_REPCONTENT = 8;
	public final static int INDEX_ISCLOSE = 9;
	public final static int INDEX_USERORGID = 10;
	public final static int INDEX_GRADE = 11;
	public final static int INDEX_COST = 12;
	public final static int INDEX_PRICE = 13;
	public final static int INDEX_INSERTDATE = 14;
	public final static int INDEX_LASTUPDATEDATE = 15;
	public final static int INDEX_ORG = 16;
	public final static int INDEX_OMORGANIZATION = 17;
	public final static int INDEX_RDWORKLIST = 18;
	public final static int SDO_PROPERTY_COUNT = 19;

	public final static int EXTENDED_PROPERTY_COUNT = -1;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 */
	public RdLaborDetailImpl() {
		this(TYPE);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 */
	public RdLaborDetailImpl(Type type) {
		super(type);
	}

	protected void validate() {
		validateType(TYPE);
	}

	/**
	 * Returns the value of the '<em><b>LaborDetailId</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>LaborDetailId</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>LaborDetailId</em>' attribute.
	 * @see #setLaborDetailId(long)
	 */
	public long getLaborDetailId() {
		return DataUtil.toLong(super.getByIndex(INDEX_LABORDETAILID, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getLaborDetailId <em>LaborDetailId</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>LaborDetailId</em>' attribute.
	 * @see #getLaborDetailId()
	 */
	public void setLaborDetailId(long laborDetailId) {
		super.setByIndex(INDEX_LABORDETAILID, laborDetailId);
	}

	/**
	 * Returns the value of the '<em><b>LaborDate</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>LaborDate</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>LaborDate</em>' attribute.
	 * @see #setLaborDate(java.util.Date)
	 */
	public Date getLaborDate() {
		return DataUtil.toDate(super.getByIndex(INDEX_LABORDATE, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getLaborDate <em>LaborDate</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>LaborDate</em>' attribute.
	 * @see #getLaborDate()
	 */
	public void setLaborDate(Date laborDate) {
		super.setByIndex(INDEX_LABORDATE, laborDate);
	}

	/**
	 * Returns the value of the '<em><b>Tasklist</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Tasklist</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Tasklist</em>' attribute.
	 * @see #setTasklist(java.lang.String)
	 */
	public String getTasklist() {
		return DataUtil.toString(super.getByIndex(INDEX_TASKLIST, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getTasklist <em>Tasklist</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Tasklist</em>' attribute.
	 * @see #getTasklist()
	 */
	public void setTasklist(String tasklist) {
		super.setByIndex(INDEX_TASKLIST, tasklist);
	}

	/**
	 * Returns the value of the '<em><b>Taskname</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Taskname</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Taskname</em>' attribute.
	 * @see #setTaskname(java.lang.String)
	 */
	public String getTaskname() {
		return DataUtil.toString(super.getByIndex(INDEX_TASKNAME, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getTaskname <em>Taskname</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Taskname</em>' attribute.
	 * @see #getTaskname()
	 */
	public void setTaskname(String taskname) {
		super.setByIndex(INDEX_TASKNAME, taskname);
	}

	/**
	 * Returns the value of the '<em><b>UserId</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>UserId</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>UserId</em>' attribute.
	 * @see #setUserId(java.lang.String)
	 */
	public String getUserId() {
		return DataUtil.toString(super.getByIndex(INDEX_USERID, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getUserId <em>UserId</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>UserId</em>' attribute.
	 * @see #getUserId()
	 */
	public void setUserId(String userId) {
		super.setByIndex(INDEX_USERID, userId);
	}

	/**
	 * Returns the value of the '<em><b>ProjectId</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>ProjectId</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>ProjectId</em>' attribute.
	 * @see #setProjectId(long)
	 */
	public long getProjectId() {
		return DataUtil.toLong(super.getByIndex(INDEX_PROJECTID, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getProjectId <em>ProjectId</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>ProjectId</em>' attribute.
	 * @see #getProjectId()
	 */
	public void setProjectId(long projectId) {
		super.setByIndex(INDEX_PROJECTID, projectId);
	}

	/**
	 * Returns the value of the '<em><b>ActHours</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>ActHours</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>ActHours</em>' attribute.
	 * @see #setActHours(float)
	 */
	public float getActHours() {
		return DataUtil.toFloat(super.getByIndex(INDEX_ACTHOURS, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getActHours <em>ActHours</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>ActHours</em>' attribute.
	 * @see #getActHours()
	 */
	public void setActHours(float actHours) {
		super.setByIndex(INDEX_ACTHOURS, actHours);
	}

	/**
	 * Returns the value of the '<em><b>StdHours</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>StdHours</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>StdHours</em>' attribute.
	 * @see #setStdHours(float)
	 */
	public float getStdHours() {
		return DataUtil.toFloat(super.getByIndex(INDEX_STDHOURS, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getStdHours <em>StdHours</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>StdHours</em>' attribute.
	 * @see #getStdHours()
	 */
	public void setStdHours(float stdHours) {
		super.setByIndex(INDEX_STDHOURS, stdHours);
	}

	/**
	 * Returns the value of the '<em><b>RepContent</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>RepContent</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>RepContent</em>' attribute.
	 * @see #setRepContent(java.lang.String)
	 */
	public String getRepContent() {
		return DataUtil.toString(super.getByIndex(INDEX_REPCONTENT, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getRepContent <em>RepContent</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>RepContent</em>' attribute.
	 * @see #getRepContent()
	 */
	public void setRepContent(String repContent) {
		super.setByIndex(INDEX_REPCONTENT, repContent);
	}

	/**
	 * Returns the value of the '<em><b>IsClose</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>IsClose</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>IsClose</em>' attribute.
	 * @see #setIsClose(java.lang.String)
	 */
	public String getIsClose() {
		return DataUtil.toString(super.getByIndex(INDEX_ISCLOSE, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getIsClose <em>IsClose</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>IsClose</em>' attribute.
	 * @see #getIsClose()
	 */
	public void setIsClose(String isClose) {
		super.setByIndex(INDEX_ISCLOSE, isClose);
	}

	/**
	 * Returns the value of the '<em><b>UserOrgId</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>UserOrgId</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>UserOrgId</em>' attribute.
	 * @see #setUserOrgId(long)
	 */
	public long getUserOrgId() {
		return DataUtil.toLong(super.getByIndex(INDEX_USERORGID, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getUserOrgId <em>UserOrgId</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>UserOrgId</em>' attribute.
	 * @see #getUserOrgId()
	 */
	public void setUserOrgId(long userOrgId) {
		super.setByIndex(INDEX_USERORGID, userOrgId);
	}

	/**
	 * Returns the value of the '<em><b>Grade</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Grade</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Grade</em>' attribute.
	 * @see #setGrade(java.lang.String)
	 */
	public String getGrade() {
		return DataUtil.toString(super.getByIndex(INDEX_GRADE, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getGrade <em>Grade</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Grade</em>' attribute.
	 * @see #getGrade()
	 */
	public void setGrade(String grade) {
		super.setByIndex(INDEX_GRADE, grade);
	}

	/**
	 * Returns the value of the '<em><b>Cost</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Cost</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Cost</em>' attribute.
	 * @see #setCost(java.math.BigDecimal)
	 */
	public BigDecimal getCost() {
		return DataUtil.toBigDecimal(super.getByIndex(INDEX_COST, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getCost <em>Cost</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Cost</em>' attribute.
	 * @see #getCost()
	 */
	public void setCost(BigDecimal cost) {
		super.setByIndex(INDEX_COST, cost);
	}

	/**
	 * Returns the value of the '<em><b>Price</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Price</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Price</em>' attribute.
	 * @see #setPrice(java.math.BigDecimal)
	 */
	public BigDecimal getPrice() {
		return DataUtil.toBigDecimal(super.getByIndex(INDEX_PRICE, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getPrice <em>Price</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Price</em>' attribute.
	 * @see #getPrice()
	 */
	public void setPrice(BigDecimal price) {
		super.setByIndex(INDEX_PRICE, price);
	}

	/**
	 * Returns the value of the '<em><b>Insertdate</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Insertdate</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Insertdate</em>' attribute.
	 * @see #setInsertdate(java.util.Date)
	 */
	public Date getInsertdate() {
		return DataUtil.toDate(super.getByIndex(INDEX_INSERTDATE, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getInsertdate <em>Insertdate</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Insertdate</em>' attribute.
	 * @see #getInsertdate()
	 */
	public void setInsertdate(Date insertdate) {
		super.setByIndex(INDEX_INSERTDATE, insertdate);
	}

	/**
	 * Returns the value of the '<em><b>Lastupdatedate</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Lastupdatedate</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Lastupdatedate</em>' attribute.
	 * @see #setLastupdatedate(java.util.Date)
	 */
	public Date getLastupdatedate() {
		return DataUtil.toDate(super.getByIndex(INDEX_LASTUPDATEDATE, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getLastupdatedate <em>Lastupdatedate</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Lastupdatedate</em>' attribute.
	 * @see #getLastupdatedate()
	 */
	public void setLastupdatedate(Date lastupdatedate) {
		super.setByIndex(INDEX_LASTUPDATEDATE, lastupdatedate);
	}

	/**
	 * Returns the value of the '<em><b>Org</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Org</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Org</em>' attribute.
	 * @see #setOrg(java.lang.String)
	 */
	public String getOrg() {
		return DataUtil.toString(super.getByIndex(INDEX_ORG, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getOrg <em>Org</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Org</em>' attribute.
	 * @see #getOrg()
	 */
	public void setOrg(String org) {
		super.setByIndex(INDEX_ORG, org);
	}

	/**
	 * Returns the value of the '<em><b>OmOrganization</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>OmOrganization</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>OmOrganization</em>' attribute.
	 * @see #setOmOrganization(com.primeton.rdmgr.data.rd.OmOrganization)
	 */
	public OmOrganization getOmOrganization() {
		return (OmOrganization) DataUtil.toDataObject(super.getByIndex(INDEX_OMORGANIZATION, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getOmOrganization <em>OmOrganization</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>OmOrganization</em>' attribute.
	 * @see #getOmOrganization()
	 */
	public void setOmOrganization(OmOrganization omOrganization) {
		super.setByIndex(INDEX_OMORGANIZATION, omOrganization);
	}
}