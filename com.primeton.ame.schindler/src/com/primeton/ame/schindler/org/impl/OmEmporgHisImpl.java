/*******************************************************************************
 *
 * Copyright (c) 2001-2006 Primeton Technologies, Ltd.
 * All rights reserved.
 *
 * Created on Apr 11, 2008
 *******************************************************************************/
package com.primeton.ame.schindler.org.impl;

import com.primeton.ame.schindler.org.OmEmporgHis;
import com.primeton.ext.data.sdo.DataUtil;
import com.primeton.ext.data.sdo.ExtendedDataObjectImpl;

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
 *   <li>{@link com.primeton.ame.schindler.org.impl.OmEmporgHisImpl#getOrghisid <em>Orghisid</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.OmEmporgHisImpl#getEmpid <em>Empid</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.OmEmporgHisImpl#getOrgid <em>Orgid</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.OmEmporgHisImpl#getStartdate <em>Startdate</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.OmEmporgHisImpl#getEnddate <em>Enddate</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.OmEmporgHisImpl#getCurrstate <em>Currstate</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.OmEmporgHisImpl#getNature <em>Nature</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.OmEmporgHisImpl#getOperattime <em>Operattime</em>}</li>
 * </ul>
 * </p>
 *
 * @extends ExtendedDataObjectImpl;
 *
 * @implements OmEmporgHis;
 */

public class OmEmporgHisImpl extends ExtendedDataObjectImpl implements OmEmporgHis {
	/**
	 * Comment for <code>serialVersionUID</code>
	 */
	private static final long serialVersionUID = 1L;
	public final static int INDEX_ORGHISID = 0;
	public final static int INDEX_EMPID = 1;
	public final static int INDEX_ORGID = 2;
	public final static int INDEX_STARTDATE = 3;
	public final static int INDEX_ENDDATE = 4;
	public final static int INDEX_CURRSTATE = 5;
	public final static int INDEX_NATURE = 6;
	public final static int INDEX_OPERATTIME = 7;
	public static final int SDO_PROPERTY_COUNT = 8;

	public static final int EXTENDED_PROPERTY_COUNT = -1;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 */
	public OmEmporgHisImpl() {
		this(TYPE);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 */
	public OmEmporgHisImpl(Type type) {
		super(type);
	}

	protected void validate() {
		validateType(TYPE);
	}

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
	public BigDecimal getOrghisid() {
		return DataUtil.toBigDecimal(super.getByIndex(INDEX_ORGHISID, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getOrghisid <em>Orghisid</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Orghisid</em>' attribute.
	 * @see #getOrghisid()
	 */
	public void setOrghisid(BigDecimal orghisid) {
		super.setByIndex(INDEX_ORGHISID, orghisid);
	}

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
	public BigDecimal getEmpid() {
		return DataUtil.toBigDecimal(super.getByIndex(INDEX_EMPID, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getEmpid <em>Empid</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Empid</em>' attribute.
	 * @see #getEmpid()
	 */
	public void setEmpid(BigDecimal empid) {
		super.setByIndex(INDEX_EMPID, empid);
	}

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
	public BigDecimal getOrgid() {
		return DataUtil.toBigDecimal(super.getByIndex(INDEX_ORGID, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getOrgid <em>Orgid</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Orgid</em>' attribute.
	 * @see #getOrgid()
	 */
	public void setOrgid(BigDecimal orgid) {
		super.setByIndex(INDEX_ORGID, orgid);
	}

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
	public Date getStartdate() {
		return DataUtil.toDate(super.getByIndex(INDEX_STARTDATE, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getStartdate <em>Startdate</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Startdate</em>' attribute.
	 * @see #getStartdate()
	 */
	public void setStartdate(Date startdate) {
		super.setByIndex(INDEX_STARTDATE, startdate);
	}

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
	public Date getEnddate() {
		return DataUtil.toDate(super.getByIndex(INDEX_ENDDATE, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getEnddate <em>Enddate</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Enddate</em>' attribute.
	 * @see #getEnddate()
	 */
	public void setEnddate(Date enddate) {
		super.setByIndex(INDEX_ENDDATE, enddate);
	}

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
	public String getCurrstate() {
		return DataUtil.toString(super.getByIndex(INDEX_CURRSTATE, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getCurrstate <em>Currstate</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Currstate</em>' attribute.
	 * @see #getCurrstate()
	 */
	public void setCurrstate(String currstate) {
		super.setByIndex(INDEX_CURRSTATE, currstate);
	}

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
	public String getNature() {
		return DataUtil.toString(super.getByIndex(INDEX_NATURE, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getNature <em>Nature</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Nature</em>' attribute.
	 * @see #getNature()
	 */
	public void setNature(String nature) {
		super.setByIndex(INDEX_NATURE, nature);
	}

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
	public Date getOperattime() {
		return DataUtil.toDate(super.getByIndex(INDEX_OPERATTIME, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getOperattime <em>Operattime</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Operattime</em>' attribute.
	 * @see #getOperattime()
	 */
	public void setOperattime(Date operattime) {
		super.setByIndex(INDEX_OPERATTIME, operattime);
	}


}