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
import com.primeton.rdmgr.data.rd.RdEmpProj;
import com.primeton.rdmgr.data.rd.RdProject;

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
 *   <li>{@link com.primeton.rdmgr.data.rd.impl.RdEmpProjImpl#getUserid <em>Userid</em>}</li>
 *   <li>{@link com.primeton.rdmgr.data.rd.impl.RdEmpProjImpl#getBeginDate <em>BeginDate</em>}</li>
 *   <li>{@link com.primeton.rdmgr.data.rd.impl.RdEmpProjImpl#getEndDate <em>EndDate</em>}</li>
 *   <li>{@link com.primeton.rdmgr.data.rd.impl.RdEmpProjImpl#getProjRole <em>ProjRole</em>}</li>
 *   <li>{@link com.primeton.rdmgr.data.rd.impl.RdEmpProjImpl#getRdProject <em>RdProject</em>}</li>
 * </ul>
 * </p>
 *
 * @extends ExtendedDataObjectImpl;
 *
 * @implements RdEmpProj;
 */

public class RdEmpProjImpl extends ExtendedDataObjectImpl implements RdEmpProj {
	/**
	 * Comment for <code>serialVersionUID</code>
	 */
	private static final long serialVersionUID = 1L;
	public final static int INDEX_USERID = 0;
	public final static int INDEX_BEGINDATE = 1;
	public final static int INDEX_ENDDATE = 2;
	public final static int INDEX_PROJROLE = 3;
	public final static int INDEX_RDPROJECT = 4;
	public final static int SDO_PROPERTY_COUNT = 5;

	public final static int EXTENDED_PROPERTY_COUNT = -1;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 */
	public RdEmpProjImpl() {
		this(TYPE);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 */
	public RdEmpProjImpl(Type type) {
		super(type);
	}

	protected void validate() {
		validateType(TYPE);
	}

	/**
	 * Returns the value of the '<em><b>Userid</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Userid</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Userid</em>' attribute.
	 * @see #setUserid(java.lang.String)
	 */
	public String getUserid() {
		return DataUtil.toString(super.getByIndex(INDEX_USERID, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getUserid <em>Userid</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Userid</em>' attribute.
	 * @see #getUserid()
	 */
	public void setUserid(String userid) {
		super.setByIndex(INDEX_USERID, userid);
	}

	/**
	 * Returns the value of the '<em><b>BeginDate</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>BeginDate</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>BeginDate</em>' attribute.
	 * @see #setBeginDate(java.util.Date)
	 */
	public Date getBeginDate() {
		return DataUtil.toDate(super.getByIndex(INDEX_BEGINDATE, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getBeginDate <em>BeginDate</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>BeginDate</em>' attribute.
	 * @see #getBeginDate()
	 */
	public void setBeginDate(Date beginDate) {
		super.setByIndex(INDEX_BEGINDATE, beginDate);
	}

	/**
	 * Returns the value of the '<em><b>EndDate</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>EndDate</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>EndDate</em>' attribute.
	 * @see #setEndDate(java.util.Date)
	 */
	public Date getEndDate() {
		return DataUtil.toDate(super.getByIndex(INDEX_ENDDATE, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getEndDate <em>EndDate</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>EndDate</em>' attribute.
	 * @see #getEndDate()
	 */
	public void setEndDate(Date endDate) {
		super.setByIndex(INDEX_ENDDATE, endDate);
	}

	/**
	 * Returns the value of the '<em><b>ProjRole</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>ProjRole</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>ProjRole</em>' attribute.
	 * @see #setProjRole(java.lang.String)
	 */
	public String getProjRole() {
		return DataUtil.toString(super.getByIndex(INDEX_PROJROLE, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getProjRole <em>ProjRole</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>ProjRole</em>' attribute.
	 * @see #getProjRole()
	 */
	public void setProjRole(String projRole) {
		super.setByIndex(INDEX_PROJROLE, projRole);
	}

	/**
	 * Returns the value of the '<em><b>RdProject</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>RdProject</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>RdProject</em>' attribute.
	 * @see #setRdProject(com.primeton.rdmgr.data.rd.RdProject)
	 */
	public RdProject getRdProject() {
		return (RdProject) DataUtil.toDataObject(super.getByIndex(INDEX_RDPROJECT, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getRdProject <em>RdProject</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>RdProject</em>' attribute.
	 * @see #getRdProject()
	 */
	public void setRdProject(RdProject rdProject) {
		super.setByIndex(INDEX_RDPROJECT, rdProject);
	}


}