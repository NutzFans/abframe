/*******************************************************************************
 *
 * Copyright (c) 2001-2006 Primeton Technologies, Ltd.
 * All rights reserved.
 *
 * Created on Apr 11, 2008
 *******************************************************************************/
package com.zhonghe.ame.imptask.vote.impl;

import com.primeton.ext.data.sdo.DataUtil;
import com.primeton.ext.data.sdo.ExtendedDataObjectImpl;
import com.zhonghe.ame.imptask.vote.ZhKeytaskVoted;

import commonj.sdo.Type;

/**
 * <!-- begin-user-doc -->
 * A representation of the model object '<em><b>Test</b></em>'.
 * <!-- end-user-doc -->
 *
 * <p>
 * The following features are supported:
 * <ul>
 *   <li>{@link com.zhonghe.ame.imptask.vote.impl.ZhKeytaskVotedImpl#getJoinKeytask <em>JoinKeytask</em>}</li>
 *   <li>{@link com.zhonghe.ame.imptask.vote.impl.ZhKeytaskVotedImpl#getJudgeType <em>JudgeType</em>}</li>
 *   <li>{@link com.zhonghe.ame.imptask.vote.impl.ZhKeytaskVotedImpl#getNumber <em>Number</em>}</li>
 *   <li>{@link com.zhonghe.ame.imptask.vote.impl.ZhKeytaskVotedImpl#getKeytaskId <em>KeytaskId</em>}</li>
 *   <li>{@link com.zhonghe.ame.imptask.vote.impl.ZhKeytaskVotedImpl#getOrgids <em>Orgids</em>}</li>
 * </ul>
 * </p>
 *
 * @extends ExtendedDataObjectImpl;
 *
 * @implements ZhKeytaskVoted;
 */

public class ZhKeytaskVotedImpl extends ExtendedDataObjectImpl implements ZhKeytaskVoted {
	/**
	 * Comment for <code>serialVersionUID</code>
	 */
	private static final long serialVersionUID = 1L;
	public final static int INDEX_JOINKEYTASK = 0;
	public final static int INDEX_JUDGETYPE = 1;
	public final static int INDEX_NUMBER = 2;
	public final static int INDEX_KEYTASKID = 3;
	public final static int INDEX_ORGIDS = 4;
	public static final int SDO_PROPERTY_COUNT = 5;

	public static final int EXTENDED_PROPERTY_COUNT = -1;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 */
	public ZhKeytaskVotedImpl() {
		this(TYPE);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 */
	public ZhKeytaskVotedImpl(Type type) {
		super(type);
	}

	protected void validate() {
		validateType(TYPE);
	}

	/**
	 * Returns the value of the '<em><b>JoinKeytask</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>JoinKeytask</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>JoinKeytask</em>' attribute.
	 * @see #setJoinKeytask(java.lang.String)
	 */
	public String getJoinKeytask() {
		return DataUtil.toString(super.getByIndex(INDEX_JOINKEYTASK, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getJoinKeytask <em>JoinKeytask</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>JoinKeytask</em>' attribute.
	 * @see #getJoinKeytask()
	 */
	public void setJoinKeytask(String joinKeytask) {
		super.setByIndex(INDEX_JOINKEYTASK, joinKeytask);
	}

	/**
	 * Returns the value of the '<em><b>JudgeType</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>JudgeType</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>JudgeType</em>' attribute.
	 * @see #setJudgeType(int)
	 */
	public int getJudgeType() {
		return DataUtil.toInt(super.getByIndex(INDEX_JUDGETYPE, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getJudgeType <em>JudgeType</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>JudgeType</em>' attribute.
	 * @see #getJudgeType()
	 */
	public void setJudgeType(int judgeType) {
		super.setByIndex(INDEX_JUDGETYPE, judgeType);
	}

	/**
	 * Returns the value of the '<em><b>Number</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Number</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Number</em>' attribute.
	 * @see #setNumber(int)
	 */
	public int getNumber() {
		return DataUtil.toInt(super.getByIndex(INDEX_NUMBER, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getNumber <em>Number</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Number</em>' attribute.
	 * @see #getNumber()
	 */
	public void setNumber(int number) {
		super.setByIndex(INDEX_NUMBER, number);
	}

	/**
	 * Returns the value of the '<em><b>KeytaskId</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>KeytaskId</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>KeytaskId</em>' attribute.
	 * @see #setKeytaskId(int)
	 */
	public int getKeytaskId() {
		return DataUtil.toInt(super.getByIndex(INDEX_KEYTASKID, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getKeytaskId <em>KeytaskId</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>KeytaskId</em>' attribute.
	 * @see #getKeytaskId()
	 */
	public void setKeytaskId(int keytaskId) {
		super.setByIndex(INDEX_KEYTASKID, keytaskId);
	}

	/**
	 * Returns the value of the '<em><b>Orgids</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Orgids</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Orgids</em>' attribute.
	 * @see #setOrgids(java.lang.String)
	 */
	public String getOrgids() {
		return DataUtil.toString(super.getByIndex(INDEX_ORGIDS, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getOrgids <em>Orgids</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Orgids</em>' attribute.
	 * @see #getOrgids()
	 */
	public void setOrgids(String orgids) {
		super.setByIndex(INDEX_ORGIDS, orgids);
	}


}