/*******************************************************************************
 *
 * Copyright (c) 2001-2006 Primeton Technologies, Ltd.
 * All rights reserved.
 *
 * Created on Apr 11, 2008
 *******************************************************************************/
package com.primeton.ame.schindler.org;

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
 *   <li>{@link com.primeton.ame.schindler.org.OmEmporgHis#getOrghisid <em>Orghisid</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.OmEmporgHis#getEmpid <em>Empid</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.OmEmporgHis#getOrgid <em>Orgid</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.OmEmporgHis#getStartdate <em>Startdate</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.OmEmporgHis#getEnddate <em>Enddate</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.OmEmporgHis#getCurrstate <em>Currstate</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.OmEmporgHis#getNature <em>Nature</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.OmEmporgHis#getOperattime <em>Operattime</em>}</li>
 * </ul>
 * </p>
 *
 * @extends DataObject;
 */
public interface OmEmporgHis extends DataObject {

	public static final String QNAME = "com.primeton.ame.schindler.org.OmEmporgHis";

	public static final Type TYPE = TypeHelper.INSTANCE.getType("com.primeton.ame.schindler.org", "OmEmporgHis");

	public static final IObjectFactory<OmEmporgHis> FACTORY = new IObjectFactory<OmEmporgHis>() {
		public OmEmporgHis create() {
			return (OmEmporgHis) DataFactory.INSTANCE.create(TYPE);
		}
	};

	/**
	 * Returns the value of the '<em><b>Orghisid</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Orghisid</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Orghisid</em>' attribute.
	 * @see #setOrghisid(java.math.BigDecimal)
	 */
	public BigDecimal getOrghisid();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.OmEmporgHis#getOrghisid <em>Orghisid</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Orghisid</em>' attribute.
	 * @see #getOrghisid()
	 */
	public void setOrghisid(BigDecimal orghisid);

	/**
	 * Returns the value of the '<em><b>Empid</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Empid</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Empid</em>' attribute.
	 * @see #setEmpid(java.math.BigDecimal)
	 */
	public BigDecimal getEmpid();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.OmEmporgHis#getEmpid <em>Empid</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Empid</em>' attribute.
	 * @see #getEmpid()
	 */
	public void setEmpid(BigDecimal empid);

	/**
	 * Returns the value of the '<em><b>Orgid</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Orgid</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Orgid</em>' attribute.
	 * @see #setOrgid(java.math.BigDecimal)
	 */
	public BigDecimal getOrgid();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.OmEmporgHis#getOrgid <em>Orgid</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Orgid</em>' attribute.
	 * @see #getOrgid()
	 */
	public void setOrgid(BigDecimal orgid);

	/**
	 * Returns the value of the '<em><b>Startdate</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Startdate</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Startdate</em>' attribute.
	 * @see #setStartdate(java.util.Date)
	 */
	public Date getStartdate();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.OmEmporgHis#getStartdate <em>Startdate</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Startdate</em>' attribute.
	 * @see #getStartdate()
	 */
	public void setStartdate(Date startdate);

	/**
	 * Returns the value of the '<em><b>Enddate</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Enddate</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Enddate</em>' attribute.
	 * @see #setEnddate(java.util.Date)
	 */
	public Date getEnddate();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.OmEmporgHis#getEnddate <em>Enddate</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Enddate</em>' attribute.
	 * @see #getEnddate()
	 */
	public void setEnddate(Date enddate);

	/**
	 * Returns the value of the '<em><b>Currstate</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Currstate</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Currstate</em>' attribute.
	 * @see #setCurrstate(java.lang.String)
	 */
	public String getCurrstate();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.OmEmporgHis#getCurrstate <em>Currstate</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Currstate</em>' attribute.
	 * @see #getCurrstate()
	 */
	public void setCurrstate(String currstate);

	/**
	 * Returns the value of the '<em><b>Nature</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Nature</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Nature</em>' attribute.
	 * @see #setNature(java.lang.String)
	 */
	public String getNature();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.OmEmporgHis#getNature <em>Nature</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Nature</em>' attribute.
	 * @see #getNature()
	 */
	public void setNature(String nature);

	/**
	 * Returns the value of the '<em><b>Operattime</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Operattime</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Operattime</em>' attribute.
	 * @see #setOperattime(java.util.Date)
	 */
	public Date getOperattime();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.OmEmporgHis#getOperattime <em>Operattime</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Operattime</em>' attribute.
	 * @see #getOperattime()
	 */
	public void setOperattime(Date operattime);


}