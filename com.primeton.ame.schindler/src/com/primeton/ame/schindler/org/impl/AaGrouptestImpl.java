/*******************************************************************************
 *
 * Copyright (c) 2001-2006 Primeton Technologies, Ltd.
 * All rights reserved.
 *
 * Created on Apr 11, 2008
 *******************************************************************************/
package com.primeton.ame.schindler.org.impl;

import com.primeton.ame.schindler.org.AaGrouptest;
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
 *   <li>{@link com.primeton.ame.schindler.org.impl.AaGrouptestImpl#getId <em>Id</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.AaGrouptestImpl#getName <em>Name</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.AaGrouptestImpl#getHierarchyid <em>Hierarchyid</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.AaGrouptestImpl#getOrgType <em>OrgType</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.AaGrouptestImpl#getLunid <em>Lunid</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.AaGrouptestImpl#getAltertime <em>Altertime</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.AaGrouptestImpl#getIsavailable <em>Isavailable</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.AaGrouptestImpl#getMemo <em>Memo</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.AaGrouptestImpl#getOrderby <em>Orderby</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.AaGrouptestImpl#getMembers <em>Members</em>}</li>
 * </ul>
 * </p>
 *
 * @extends ExtendedDataObjectImpl;
 *
 * @implements AaGrouptest;
 */

public class AaGrouptestImpl extends ExtendedDataObjectImpl implements AaGrouptest {
	/**
	 * Comment for <code>serialVersionUID</code>
	 */
	private static final long serialVersionUID = 1L;
	public final static int INDEX_ID = 0;
	public final static int INDEX_NAME = 1;
	public final static int INDEX_HIERARCHYID = 2;
	public final static int INDEX_ORGTYPE = 3;
	public final static int INDEX_LUNID = 4;
	public final static int INDEX_ALTERTIME = 5;
	public final static int INDEX_ISAVAILABLE = 6;
	public final static int INDEX_MEMO = 7;
	public final static int INDEX_ORDERBY = 8;
	public final static int INDEX_MEMBERS = 9;
	public static final int SDO_PROPERTY_COUNT = 10;

	public static final int EXTENDED_PROPERTY_COUNT = -1;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 */
	public AaGrouptestImpl() {
		this(TYPE);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 */
	public AaGrouptestImpl(Type type) {
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
	 * Returns the value of the '<em><b>Memo</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Memo</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Memo</em>' attribute.
	 * @see #setMemo(java.lang.String)
	 */
	public String getMemo() {
		return DataUtil.toString(super.getByIndex(INDEX_MEMO, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getMemo <em>Memo</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Memo</em>' attribute.
	 * @see #getMemo()
	 */
	public void setMemo(String memo) {
		super.setByIndex(INDEX_MEMO, memo);
	}

	/**
	 * Returns the value of the '<em><b>Orderby</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Orderby</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Orderby</em>' attribute.
	 * @see #setOrderby(java.lang.String)
	 */
	public String getOrderby() {
		return DataUtil.toString(super.getByIndex(INDEX_ORDERBY, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getOrderby <em>Orderby</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Orderby</em>' attribute.
	 * @see #getOrderby()
	 */
	public void setOrderby(String orderby) {
		super.setByIndex(INDEX_ORDERBY, orderby);
	}

	/**
	 * Returns the value of the '<em><b>Members</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Members</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Members</em>' attribute.
	 * @see #setMembers(java.lang.String)
	 */
	public String getMembers() {
		return DataUtil.toString(super.getByIndex(INDEX_MEMBERS, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getMembers <em>Members</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Members</em>' attribute.
	 * @see #getMembers()
	 */
	public void setMembers(String members) {
		super.setByIndex(INDEX_MEMBERS, members);
	}


}