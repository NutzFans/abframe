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

import java.util.Date;

/**
 * <!-- begin-user-doc -->
 * A representation of the model object '<em><b>Test</b></em>'.
 * <!-- end-user-doc -->
 *
 * <p>
 * The following features are supported:
 * <ul>
 *   <li>{@link com.primeton.rdmgr.data.rd.RdEmpProj#getUserid <em>Userid</em>}</li>
 *   <li>{@link com.primeton.rdmgr.data.rd.RdEmpProj#getBeginDate <em>BeginDate</em>}</li>
 *   <li>{@link com.primeton.rdmgr.data.rd.RdEmpProj#getEndDate <em>EndDate</em>}</li>
 *   <li>{@link com.primeton.rdmgr.data.rd.RdEmpProj#getProjRole <em>ProjRole</em>}</li>
 *   <li>{@link com.primeton.rdmgr.data.rd.RdEmpProj#getRdProject <em>RdProject</em>}</li>
 * </ul>
 * </p>
 *
 * @extends DataObject;
 */
public interface RdEmpProj extends DataObject {

	public final static String QNAME = "com.primeton.rdmgr.data.rd.RdEmpProj";

	public final static Type TYPE = TypeHelper.INSTANCE.getType("com.primeton.rdmgr.data.rd", "RdEmpProj");

	public final static IObjectFactory<RdEmpProj> FACTORY = new IObjectFactory<RdEmpProj>() {
		public RdEmpProj create() {
			return (RdEmpProj) DataFactory.INSTANCE.create(TYPE);
		}
	};

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
	public String getUserid();

	/**
	 * Sets the value of the '{@link com.primeton.rdmgr.data.rd.RdEmpProj#getUserid <em>Userid</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Userid</em>' attribute.
	 * @see #getUserid()
	 */
	public void setUserid(String userid);

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
	public Date getBeginDate();

	/**
	 * Sets the value of the '{@link com.primeton.rdmgr.data.rd.RdEmpProj#getBeginDate <em>BeginDate</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>BeginDate</em>' attribute.
	 * @see #getBeginDate()
	 */
	public void setBeginDate(Date beginDate);

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
	public Date getEndDate();

	/**
	 * Sets the value of the '{@link com.primeton.rdmgr.data.rd.RdEmpProj#getEndDate <em>EndDate</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>EndDate</em>' attribute.
	 * @see #getEndDate()
	 */
	public void setEndDate(Date endDate);

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
	public String getProjRole();

	/**
	 * Sets the value of the '{@link com.primeton.rdmgr.data.rd.RdEmpProj#getProjRole <em>ProjRole</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>ProjRole</em>' attribute.
	 * @see #getProjRole()
	 */
	public void setProjRole(String projRole);

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
	public RdProject getRdProject();

	/**
	 * Sets the value of the '{@link com.primeton.rdmgr.data.rd.RdEmpProj#getRdProject <em>RdProject</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>RdProject</em>' attribute.
	 * @see #getRdProject()
	 */
	public void setRdProject(RdProject rdProject);


}