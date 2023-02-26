/*******************************************************************************
 *
 * Copyright (c) 2001-2006 Primeton Technologies, Ltd.
 * All rights reserved.
 *
 * Created on Apr 11, 2008
 *******************************************************************************/
package com.zhonghe.ame.marketInfo.bid.impl;

import com.primeton.ext.data.sdo.DataUtil;
import com.primeton.ext.data.sdo.ExtendedDataObjectImpl;
import com.zhonghe.ame.marketInfo.bid.ZhCompetitor;

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
 *   <li>{@link com.zhonghe.ame.marketInfo.bid.impl.ZhCompetitorImpl#getCompetId <em>CompetId</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.bid.impl.ZhCompetitorImpl#getCompetName <em>CompetName</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.bid.impl.ZhCompetitorImpl#getCompetRemark <em>CompetRemark</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.bid.impl.ZhCompetitorImpl#getCreateUserid <em>CreateUserid</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.bid.impl.ZhCompetitorImpl#getCreateDate <em>CreateDate</em>}</li>
 * </ul>
 * </p>
 *
 * @extends ExtendedDataObjectImpl;
 *
 * @implements ZhCompetitor;
 */

public class ZhCompetitorImpl extends ExtendedDataObjectImpl implements ZhCompetitor {
	/**
	 * Comment for <code>serialVersionUID</code>
	 */
	private static final long serialVersionUID = 1L;
	public final static int INDEX_COMPETID = 0;
	public final static int INDEX_COMPETNAME = 1;
	public final static int INDEX_COMPETREMARK = 2;
	public final static int INDEX_CREATEUSERID = 3;
	public final static int INDEX_CREATEDATE = 4;
	public static final int SDO_PROPERTY_COUNT = 5;

	public static final int EXTENDED_PROPERTY_COUNT = -1;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 */
	public ZhCompetitorImpl() {
		this(TYPE);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 */
	public ZhCompetitorImpl(Type type) {
		super(type);
	}

	protected void validate() {
		validateType(TYPE);
	}

	/**
	 * Returns the value of the '<em><b>CompetId</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>CompetId</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>CompetId</em>' attribute.
	 * @see #setCompetId(int)
	 */
	public int getCompetId() {
		return DataUtil.toInt(super.getByIndex(INDEX_COMPETID, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getCompetId <em>CompetId</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>CompetId</em>' attribute.
	 * @see #getCompetId()
	 */
	public void setCompetId(int competId) {
		super.setByIndex(INDEX_COMPETID, competId);
	}

	/**
	 * Returns the value of the '<em><b>CompetName</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>CompetName</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>CompetName</em>' attribute.
	 * @see #setCompetName(java.lang.String)
	 */
	public String getCompetName() {
		return DataUtil.toString(super.getByIndex(INDEX_COMPETNAME, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getCompetName <em>CompetName</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>CompetName</em>' attribute.
	 * @see #getCompetName()
	 */
	public void setCompetName(String competName) {
		super.setByIndex(INDEX_COMPETNAME, competName);
	}

	/**
	 * Returns the value of the '<em><b>CompetRemark</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>CompetRemark</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>CompetRemark</em>' attribute.
	 * @see #setCompetRemark(java.lang.String)
	 */
	public String getCompetRemark() {
		return DataUtil.toString(super.getByIndex(INDEX_COMPETREMARK, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getCompetRemark <em>CompetRemark</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>CompetRemark</em>' attribute.
	 * @see #getCompetRemark()
	 */
	public void setCompetRemark(String competRemark) {
		super.setByIndex(INDEX_COMPETREMARK, competRemark);
	}

	/**
	 * Returns the value of the '<em><b>CreateUserid</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>CreateUserid</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>CreateUserid</em>' attribute.
	 * @see #setCreateUserid(java.lang.String)
	 */
	public String getCreateUserid() {
		return DataUtil.toString(super.getByIndex(INDEX_CREATEUSERID, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getCreateUserid <em>CreateUserid</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>CreateUserid</em>' attribute.
	 * @see #getCreateUserid()
	 */
	public void setCreateUserid(String createUserid) {
		super.setByIndex(INDEX_CREATEUSERID, createUserid);
	}

	/**
	 * Returns the value of the '<em><b>CreateDate</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>CreateDate</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>CreateDate</em>' attribute.
	 * @see #setCreateDate(java.util.Date)
	 */
	public Date getCreateDate() {
		return DataUtil.toDate(super.getByIndex(INDEX_CREATEDATE, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getCreateDate <em>CreateDate</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>CreateDate</em>' attribute.
	 * @see #getCreateDate()
	 */
	public void setCreateDate(Date createDate) {
		super.setByIndex(INDEX_CREATEDATE, createDate);
	}


}