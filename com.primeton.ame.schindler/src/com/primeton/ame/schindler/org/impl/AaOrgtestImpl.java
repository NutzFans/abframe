/*******************************************************************************
 *
 * Copyright (c) 2001-2006 Primeton Technologies, Ltd.
 * All rights reserved.
 *
 * Created on Apr 11, 2008
 *******************************************************************************/
package com.primeton.ame.schindler.org.impl;

import com.primeton.ame.schindler.org.AaOrgtest;
import com.primeton.ext.data.sdo.DataUtil;
import com.primeton.ext.data.sdo.ExtendedDataObjectImpl;

import commonj.sdo.Type;

/**
 * <!-- begin-user-doc -->
 * A representation of the model object '<em><b>Test</b></em>'.
 * <!-- end-user-doc -->
 *
 * <p>
 * The following features are supported:
 * <ul>
 *   <li>{@link com.primeton.ame.schindler.org.impl.AaOrgtestImpl#getId <em>Id</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.AaOrgtestImpl#getName <em>Name</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.AaOrgtestImpl#getLunid <em>Lunid</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.AaOrgtestImpl#getHierarchyid <em>Hierarchyid</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.AaOrgtestImpl#getIsavailable <em>Isavailable</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.AaOrgtestImpl#getAltertime <em>Altertime</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.AaOrgtestImpl#getOrgType <em>OrgType</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.AaOrgtestImpl#getOrderBy <em>OrderBy</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.AaOrgtestImpl#getParent <em>Parent</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.AaOrgtestImpl#getSuperleader <em>Superleader</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.AaOrgtestImpl#getThisleader <em>Thisleader</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.AaOrgtestImpl#getNo <em>No</em>}</li>
 * </ul>
 * </p>
 *
 * @extends ExtendedDataObjectImpl;
 *
 * @implements AaOrgtest;
 */

public class AaOrgtestImpl extends ExtendedDataObjectImpl implements AaOrgtest {
	/**
	 * Comment for <code>serialVersionUID</code>
	 */
	private static final long serialVersionUID = 1L;
	public final static int INDEX_ID = 0;
	public final static int INDEX_NAME = 1;
	public final static int INDEX_LUNID = 2;
	public final static int INDEX_HIERARCHYID = 3;
	public final static int INDEX_ISAVAILABLE = 4;
	public final static int INDEX_ALTERTIME = 5;
	public final static int INDEX_ORGTYPE = 6;
	public final static int INDEX_ORDERBY = 7;
	public final static int INDEX_PARENT = 8;
	public final static int INDEX_SUPERLEADER = 9;
	public final static int INDEX_THISLEADER = 10;
	public final static int INDEX_NO = 11;
	public static final int SDO_PROPERTY_COUNT = 12;

	public static final int EXTENDED_PROPERTY_COUNT = -1;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 */
	public AaOrgtestImpl() {
		this(TYPE);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 */
	public AaOrgtestImpl(Type type) {
		super(type);
	}

	protected void validate() {
		validateType(TYPE);
	}

	/**
	 * Returns the value of the '<em><b>Id</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Id</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Id</em>' attribute.
	 * @see #setId(java.lang.String)
	 */
	public String getId() {
		return DataUtil.toString(super.getByIndex(INDEX_ID, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getId <em>Id</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Id</em>' attribute.
	 * @see #getId()
	 */
	public void setId(String id) {
		super.setByIndex(INDEX_ID, id);
	}

	/**
	 * Returns the value of the '<em><b>Name</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Name</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Name</em>' attribute.
	 * @see #setName(java.lang.String)
	 */
	public String getName() {
		return DataUtil.toString(super.getByIndex(INDEX_NAME, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getName <em>Name</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Name</em>' attribute.
	 * @see #getName()
	 */
	public void setName(String name) {
		super.setByIndex(INDEX_NAME, name);
	}

	/**
	 * Returns the value of the '<em><b>Lunid</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Lunid</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Lunid</em>' attribute.
	 * @see #setLunid(java.lang.String)
	 */
	public String getLunid() {
		return DataUtil.toString(super.getByIndex(INDEX_LUNID, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getLunid <em>Lunid</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Lunid</em>' attribute.
	 * @see #getLunid()
	 */
	public void setLunid(String lunid) {
		super.setByIndex(INDEX_LUNID, lunid);
	}

	/**
	 * Returns the value of the '<em><b>Hierarchyid</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Hierarchyid</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Hierarchyid</em>' attribute.
	 * @see #setHierarchyid(java.lang.String)
	 */
	public String getHierarchyid() {
		return DataUtil.toString(super.getByIndex(INDEX_HIERARCHYID, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getHierarchyid <em>Hierarchyid</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Hierarchyid</em>' attribute.
	 * @see #getHierarchyid()
	 */
	public void setHierarchyid(String hierarchyid) {
		super.setByIndex(INDEX_HIERARCHYID, hierarchyid);
	}

	/**
	 * Returns the value of the '<em><b>Isavailable</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Isavailable</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Isavailable</em>' attribute.
	 * @see #setIsavailable(java.lang.String)
	 */
	public String getIsavailable() {
		return DataUtil.toString(super.getByIndex(INDEX_ISAVAILABLE, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getIsavailable <em>Isavailable</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Isavailable</em>' attribute.
	 * @see #getIsavailable()
	 */
	public void setIsavailable(String isavailable) {
		super.setByIndex(INDEX_ISAVAILABLE, isavailable);
	}

	/**
	 * Returns the value of the '<em><b>Altertime</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Altertime</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Altertime</em>' attribute.
	 * @see #setAltertime(java.lang.String)
	 */
	public String getAltertime() {
		return DataUtil.toString(super.getByIndex(INDEX_ALTERTIME, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getAltertime <em>Altertime</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Altertime</em>' attribute.
	 * @see #getAltertime()
	 */
	public void setAltertime(String altertime) {
		super.setByIndex(INDEX_ALTERTIME, altertime);
	}

	/**
	 * Returns the value of the '<em><b>OrgType</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>OrgType</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>OrgType</em>' attribute.
	 * @see #setOrgType(java.lang.String)
	 */
	public String getOrgType() {
		return DataUtil.toString(super.getByIndex(INDEX_ORGTYPE, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getOrgType <em>OrgType</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>OrgType</em>' attribute.
	 * @see #getOrgType()
	 */
	public void setOrgType(String orgType) {
		super.setByIndex(INDEX_ORGTYPE, orgType);
	}

	/**
	 * Returns the value of the '<em><b>OrderBy</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>OrderBy</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>OrderBy</em>' attribute.
	 * @see #setOrderBy(java.lang.String)
	 */
	public String getOrderBy() {
		return DataUtil.toString(super.getByIndex(INDEX_ORDERBY, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getOrderBy <em>OrderBy</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>OrderBy</em>' attribute.
	 * @see #getOrderBy()
	 */
	public void setOrderBy(String orderBy) {
		super.setByIndex(INDEX_ORDERBY, orderBy);
	}

	/**
	 * Returns the value of the '<em><b>Parent</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Parent</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Parent</em>' attribute.
	 * @see #setParent(java.lang.String)
	 */
	public String getParent() {
		return DataUtil.toString(super.getByIndex(INDEX_PARENT, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getParent <em>Parent</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Parent</em>' attribute.
	 * @see #getParent()
	 */
	public void setParent(String parent) {
		super.setByIndex(INDEX_PARENT, parent);
	}

	/**
	 * Returns the value of the '<em><b>Superleader</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Superleader</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Superleader</em>' attribute.
	 * @see #setSuperleader(java.lang.String)
	 */
	public String getSuperleader() {
		return DataUtil.toString(super.getByIndex(INDEX_SUPERLEADER, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getSuperleader <em>Superleader</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Superleader</em>' attribute.
	 * @see #getSuperleader()
	 */
	public void setSuperleader(String superleader) {
		super.setByIndex(INDEX_SUPERLEADER, superleader);
	}

	/**
	 * Returns the value of the '<em><b>Thisleader</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Thisleader</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Thisleader</em>' attribute.
	 * @see #setThisleader(java.lang.String)
	 */
	public String getThisleader() {
		return DataUtil.toString(super.getByIndex(INDEX_THISLEADER, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getThisleader <em>Thisleader</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Thisleader</em>' attribute.
	 * @see #getThisleader()
	 */
	public void setThisleader(String thisleader) {
		super.setByIndex(INDEX_THISLEADER, thisleader);
	}

	/**
	 * Returns the value of the '<em><b>No</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>No</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>No</em>' attribute.
	 * @see #setNo(java.lang.String)
	 */
	public String getNo() {
		return DataUtil.toString(super.getByIndex(INDEX_NO, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getNo <em>No</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>No</em>' attribute.
	 * @see #getNo()
	 */
	public void setNo(String no) {
		super.setByIndex(INDEX_NO, no);
	}


}