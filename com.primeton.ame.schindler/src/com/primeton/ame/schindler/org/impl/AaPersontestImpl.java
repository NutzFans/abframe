/*******************************************************************************
 *
 * Copyright (c) 2001-2006 Primeton Technologies, Ltd.
 * All rights reserved.
 *
 * Created on Apr 11, 2008
 *******************************************************************************/
package com.primeton.ame.schindler.org.impl;

import com.primeton.ame.schindler.org.AaPersontest;
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
 *   <li>{@link com.primeton.ame.schindler.org.impl.AaPersontestImpl#getId <em>Id</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.AaPersontestImpl#getName <em>Name</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.AaPersontestImpl#getSex <em>Sex</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.AaPersontestImpl#getNo <em>No</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.AaPersontestImpl#getHierarchyid <em>Hierarchyid</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.AaPersontestImpl#getOrgType <em>OrgType</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.AaPersontestImpl#getPassword <em>Password</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.AaPersontestImpl#getIsavailable <em>Isavailable</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.AaPersontestImpl#getEmail <em>Email</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.AaPersontestImpl#getLunid <em>Lunid</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.AaPersontestImpl#getAltertime <em>Altertime</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.AaPersontestImpl#getMobileno <em>Mobileno</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.AaPersontestImpl#getLoginname <em>Loginname</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.AaPersontestImpl#getOrderby <em>Orderby</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.AaPersontestImpl#getWorkphone <em>Workphone</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.AaPersontestImpl#getParent <em>Parent</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.AaPersontestImpl#getShortno <em>Shortno</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.AaPersontestImpl#getPosts <em>Posts</em>}</li>
 * </ul>
 * </p>
 *
 * @extends ExtendedDataObjectImpl;
 *
 * @implements AaPersontest;
 */

public class AaPersontestImpl extends ExtendedDataObjectImpl implements AaPersontest {
	/**
	 * Comment for <code>serialVersionUID</code>
	 */
	private static final long serialVersionUID = 1L;
	public final static int INDEX_ID = 0;
	public final static int INDEX_NAME = 1;
	public final static int INDEX_SEX = 2;
	public final static int INDEX_NO = 3;
	public final static int INDEX_HIERARCHYID = 4;
	public final static int INDEX_ORGTYPE = 5;
	public final static int INDEX_PASSWORD = 6;
	public final static int INDEX_ISAVAILABLE = 7;
	public final static int INDEX_EMAIL = 8;
	public final static int INDEX_LUNID = 9;
	public final static int INDEX_ALTERTIME = 10;
	public final static int INDEX_MOBILENO = 11;
	public final static int INDEX_LOGINNAME = 12;
	public final static int INDEX_ORDERBY = 13;
	public final static int INDEX_WORKPHONE = 14;
	public final static int INDEX_PARENT = 15;
	public final static int INDEX_SHORTNO = 16;
	public final static int INDEX_POSTS = 17;
	public static final int SDO_PROPERTY_COUNT = 18;

	public static final int EXTENDED_PROPERTY_COUNT = -1;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 */
	public AaPersontestImpl() {
		this(TYPE);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 */
	public AaPersontestImpl(Type type) {
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
	 * Returns the value of the '<em><b>Sex</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Sex</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Sex</em>' attribute.
	 * @see #setSex(java.lang.String)
	 */
	public String getSex() {
		return DataUtil.toString(super.getByIndex(INDEX_SEX, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getSex <em>Sex</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Sex</em>' attribute.
	 * @see #getSex()
	 */
	public void setSex(String sex) {
		super.setByIndex(INDEX_SEX, sex);
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
	 * Returns the value of the '<em><b>Password</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Password</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Password</em>' attribute.
	 * @see #setPassword(java.lang.String)
	 */
	public String getPassword() {
		return DataUtil.toString(super.getByIndex(INDEX_PASSWORD, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getPassword <em>Password</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Password</em>' attribute.
	 * @see #getPassword()
	 */
	public void setPassword(String password) {
		super.setByIndex(INDEX_PASSWORD, password);
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
	 * Returns the value of the '<em><b>Email</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Email</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Email</em>' attribute.
	 * @see #setEmail(java.lang.String)
	 */
	public String getEmail() {
		return DataUtil.toString(super.getByIndex(INDEX_EMAIL, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getEmail <em>Email</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Email</em>' attribute.
	 * @see #getEmail()
	 */
	public void setEmail(String email) {
		super.setByIndex(INDEX_EMAIL, email);
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
	 * Returns the value of the '<em><b>Mobileno</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Mobileno</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Mobileno</em>' attribute.
	 * @see #setMobileno(java.lang.String)
	 */
	public String getMobileno() {
		return DataUtil.toString(super.getByIndex(INDEX_MOBILENO, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getMobileno <em>Mobileno</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Mobileno</em>' attribute.
	 * @see #getMobileno()
	 */
	public void setMobileno(String mobileno) {
		super.setByIndex(INDEX_MOBILENO, mobileno);
	}

	/**
	 * Returns the value of the '<em><b>Loginname</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Loginname</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Loginname</em>' attribute.
	 * @see #setLoginname(java.lang.String)
	 */
	public String getLoginname() {
		return DataUtil.toString(super.getByIndex(INDEX_LOGINNAME, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getLoginname <em>Loginname</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Loginname</em>' attribute.
	 * @see #getLoginname()
	 */
	public void setLoginname(String loginname) {
		super.setByIndex(INDEX_LOGINNAME, loginname);
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
	 * Returns the value of the '<em><b>Workphone</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Workphone</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Workphone</em>' attribute.
	 * @see #setWorkphone(java.lang.String)
	 */
	public String getWorkphone() {
		return DataUtil.toString(super.getByIndex(INDEX_WORKPHONE, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getWorkphone <em>Workphone</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Workphone</em>' attribute.
	 * @see #getWorkphone()
	 */
	public void setWorkphone(String workphone) {
		super.setByIndex(INDEX_WORKPHONE, workphone);
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
	 * Returns the value of the '<em><b>Shortno</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Shortno</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Shortno</em>' attribute.
	 * @see #setShortno(java.lang.String)
	 */
	public String getShortno() {
		return DataUtil.toString(super.getByIndex(INDEX_SHORTNO, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getShortno <em>Shortno</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Shortno</em>' attribute.
	 * @see #getShortno()
	 */
	public void setShortno(String shortno) {
		super.setByIndex(INDEX_SHORTNO, shortno);
	}

	/**
	 * Returns the value of the '<em><b>Posts</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Posts</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Posts</em>' attribute.
	 * @see #setPosts(java.lang.String)
	 */
	public String getPosts() {
		return DataUtil.toString(super.getByIndex(INDEX_POSTS, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getPosts <em>Posts</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Posts</em>' attribute.
	 * @see #getPosts()
	 */
	public void setPosts(String posts) {
		super.setByIndex(INDEX_POSTS, posts);
	}


}