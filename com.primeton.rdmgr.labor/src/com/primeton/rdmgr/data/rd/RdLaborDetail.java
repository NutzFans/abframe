/*******************************************************************************
 *
 * Copyright (c) 2001-2006 Primeton Technologies, Ltd.
 * All rights reserved.
 *
 * Created on Apr 11, 2008
 *******************************************************************************/
package com.primeton.rdmgr.data.rd;

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
 *   <li>{@link com.primeton.rdmgr.data.rd.RdLaborDetail#getLaborDetailId <em>LaborDetailId</em>}</li>
 *   <li>{@link com.primeton.rdmgr.data.rd.RdLaborDetail#getLaborDate <em>LaborDate</em>}</li>
 *   <li>{@link com.primeton.rdmgr.data.rd.RdLaborDetail#getTasklist <em>Tasklist</em>}</li>
 *   <li>{@link com.primeton.rdmgr.data.rd.RdLaborDetail#getTaskname <em>Taskname</em>}</li>
 *   <li>{@link com.primeton.rdmgr.data.rd.RdLaborDetail#getUserId <em>UserId</em>}</li>
 *   <li>{@link com.primeton.rdmgr.data.rd.RdLaborDetail#getProjectId <em>ProjectId</em>}</li>
 *   <li>{@link com.primeton.rdmgr.data.rd.RdLaborDetail#getActHours <em>ActHours</em>}</li>
 *   <li>{@link com.primeton.rdmgr.data.rd.RdLaborDetail#getStdHours <em>StdHours</em>}</li>
 *   <li>{@link com.primeton.rdmgr.data.rd.RdLaborDetail#getRepContent <em>RepContent</em>}</li>
 *   <li>{@link com.primeton.rdmgr.data.rd.RdLaborDetail#getIsClose <em>IsClose</em>}</li>
 *   <li>{@link com.primeton.rdmgr.data.rd.RdLaborDetail#getUserOrgId <em>UserOrgId</em>}</li>
 *   <li>{@link com.primeton.rdmgr.data.rd.RdLaborDetail#getGrade <em>Grade</em>}</li>
 *   <li>{@link com.primeton.rdmgr.data.rd.RdLaborDetail#getCost <em>Cost</em>}</li>
 *   <li>{@link com.primeton.rdmgr.data.rd.RdLaborDetail#getPrice <em>Price</em>}</li>
 *   <li>{@link com.primeton.rdmgr.data.rd.RdLaborDetail#getInsertdate <em>Insertdate</em>}</li>
 *   <li>{@link com.primeton.rdmgr.data.rd.RdLaborDetail#getLastupdatedate <em>Lastupdatedate</em>}</li>
 *   <li>{@link com.primeton.rdmgr.data.rd.RdLaborDetail#getOrg <em>Org</em>}</li>
 *   <li>{@link com.primeton.rdmgr.data.rd.RdLaborDetail#getOmOrganization <em>OmOrganization</em>}</li>
 *   <li>{@link com.primeton.rdmgr.data.rd.RdLaborDetail#getRdWorklist <em>RdWorklist</em>}</li>
 * </ul>
 * </p>
 *
 * @extends DataObject;
 */
public interface RdLaborDetail extends DataObject {

	public final static String QNAME = "com.primeton.rdmgr.data.rd.RdLaborDetail";

	public final static Type TYPE = TypeHelper.INSTANCE.getType("com.primeton.rdmgr.data.rd", "RdLaborDetail");

	public final static IObjectFactory<RdLaborDetail> FACTORY = new IObjectFactory<RdLaborDetail>() {
		public RdLaborDetail create() {
			return (RdLaborDetail) DataFactory.INSTANCE.create(TYPE);
		}
	};

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
	public long getLaborDetailId();

	/**
	 * Sets the value of the '{@link com.primeton.rdmgr.data.rd.RdLaborDetail#getLaborDetailId <em>LaborDetailId</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>LaborDetailId</em>' attribute.
	 * @see #getLaborDetailId()
	 */
	public void setLaborDetailId(long laborDetailId);

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
	public Date getLaborDate();

	/**
	 * Sets the value of the '{@link com.primeton.rdmgr.data.rd.RdLaborDetail#getLaborDate <em>LaborDate</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>LaborDate</em>' attribute.
	 * @see #getLaborDate()
	 */
	public void setLaborDate(Date laborDate);

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
	public String getTasklist();

	/**
	 * Sets the value of the '{@link com.primeton.rdmgr.data.rd.RdLaborDetail#getTasklist <em>Tasklist</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Tasklist</em>' attribute.
	 * @see #getTasklist()
	 */
	public void setTasklist(String tasklist);

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
	public String getTaskname();

	/**
	 * Sets the value of the '{@link com.primeton.rdmgr.data.rd.RdLaborDetail#getTaskname <em>Taskname</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Taskname</em>' attribute.
	 * @see #getTaskname()
	 */
	public void setTaskname(String taskname);

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
	public String getUserId();

	/**
	 * Sets the value of the '{@link com.primeton.rdmgr.data.rd.RdLaborDetail#getUserId <em>UserId</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>UserId</em>' attribute.
	 * @see #getUserId()
	 */
	public void setUserId(String userId);

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
	public long getProjectId();

	/**
	 * Sets the value of the '{@link com.primeton.rdmgr.data.rd.RdLaborDetail#getProjectId <em>ProjectId</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>ProjectId</em>' attribute.
	 * @see #getProjectId()
	 */
	public void setProjectId(long projectId);

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
	public float getActHours();

	/**
	 * Sets the value of the '{@link com.primeton.rdmgr.data.rd.RdLaborDetail#getActHours <em>ActHours</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>ActHours</em>' attribute.
	 * @see #getActHours()
	 */
	public void setActHours(float actHours);

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
	public float getStdHours();

	/**
	 * Sets the value of the '{@link com.primeton.rdmgr.data.rd.RdLaborDetail#getStdHours <em>StdHours</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>StdHours</em>' attribute.
	 * @see #getStdHours()
	 */
	public void setStdHours(float stdHours);

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
	public String getRepContent();

	/**
	 * Sets the value of the '{@link com.primeton.rdmgr.data.rd.RdLaborDetail#getRepContent <em>RepContent</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>RepContent</em>' attribute.
	 * @see #getRepContent()
	 */
	public void setRepContent(String repContent);

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
	public String getIsClose();

	/**
	 * Sets the value of the '{@link com.primeton.rdmgr.data.rd.RdLaborDetail#getIsClose <em>IsClose</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>IsClose</em>' attribute.
	 * @see #getIsClose()
	 */
	public void setIsClose(String isClose);

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
	public long getUserOrgId();

	/**
	 * Sets the value of the '{@link com.primeton.rdmgr.data.rd.RdLaborDetail#getUserOrgId <em>UserOrgId</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>UserOrgId</em>' attribute.
	 * @see #getUserOrgId()
	 */
	public void setUserOrgId(long userOrgId);

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
	public String getGrade();

	/**
	 * Sets the value of the '{@link com.primeton.rdmgr.data.rd.RdLaborDetail#getGrade <em>Grade</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Grade</em>' attribute.
	 * @see #getGrade()
	 */
	public void setGrade(String grade);

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
	public BigDecimal getCost();

	/**
	 * Sets the value of the '{@link com.primeton.rdmgr.data.rd.RdLaborDetail#getCost <em>Cost</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Cost</em>' attribute.
	 * @see #getCost()
	 */
	public void setCost(BigDecimal cost);

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
	public BigDecimal getPrice();

	/**
	 * Sets the value of the '{@link com.primeton.rdmgr.data.rd.RdLaborDetail#getPrice <em>Price</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Price</em>' attribute.
	 * @see #getPrice()
	 */
	public void setPrice(BigDecimal price);

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
	public Date getInsertdate();

	/**
	 * Sets the value of the '{@link com.primeton.rdmgr.data.rd.RdLaborDetail#getInsertdate <em>Insertdate</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Insertdate</em>' attribute.
	 * @see #getInsertdate()
	 */
	public void setInsertdate(Date insertdate);

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
	public Date getLastupdatedate();

	/**
	 * Sets the value of the '{@link com.primeton.rdmgr.data.rd.RdLaborDetail#getLastupdatedate <em>Lastupdatedate</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Lastupdatedate</em>' attribute.
	 * @see #getLastupdatedate()
	 */
	public void setLastupdatedate(Date lastupdatedate);

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
	public String getOrg();

	/**
	 * Sets the value of the '{@link com.primeton.rdmgr.data.rd.RdLaborDetail#getOrg <em>Org</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Org</em>' attribute.
	 * @see #getOrg()
	 */
	public void setOrg(String org);

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
	public OmOrganization getOmOrganization();

	/**
	 * Sets the value of the '{@link com.primeton.rdmgr.data.rd.RdLaborDetail#getOmOrganization <em>OmOrganization</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>OmOrganization</em>' attribute.
	 * @see #getOmOrganization()
	 */
	public void setOmOrganization(OmOrganization omOrganization);


}