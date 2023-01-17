/*******************************************************************************
 *
 * Copyright (c) 2001-2006 Primeton Technologies, Ltd.
 * All rights reserved.
 *
 * Created on Apr 11, 2008
 *******************************************************************************/
package com.zhonghe.ame.imptask.vote;

import com.eos.data.sdo.IObjectFactory;

import commonj.sdo.DataObject;
import commonj.sdo.Type;
import commonj.sdo.helper.DataFactory;
import commonj.sdo.helper.TypeHelper;

/**
 * <!-- begin-user-doc -->
 * A representation of the model object '<em><b>Test</b></em>'.
 * <!-- end-user-doc -->
 *
 * <p>
 * The following features are supported:
 * <ul>
 *   <li>{@link com.zhonghe.ame.imptask.vote.ZhKeytaskVoted#getJoinKeytask <em>JoinKeytask</em>}</li>
 *   <li>{@link com.zhonghe.ame.imptask.vote.ZhKeytaskVoted#getJudgeType <em>JudgeType</em>}</li>
 *   <li>{@link com.zhonghe.ame.imptask.vote.ZhKeytaskVoted#getNumber <em>Number</em>}</li>
 *   <li>{@link com.zhonghe.ame.imptask.vote.ZhKeytaskVoted#getKeytaskId <em>KeytaskId</em>}</li>
 *   <li>{@link com.zhonghe.ame.imptask.vote.ZhKeytaskVoted#getOrgids <em>Orgids</em>}</li>
 * </ul>
 * </p>
 *
 * @extends DataObject;
 */
public interface ZhKeytaskVoted extends DataObject {

	public static final String QNAME = "com.zhonghe.ame.imptask.vote.ZhKeytaskVoted";

	public static final Type TYPE = TypeHelper.INSTANCE.getType("com.zhonghe.ame.imptask.vote", "ZhKeytaskVoted");

	public static final IObjectFactory<ZhKeytaskVoted> FACTORY = new IObjectFactory<ZhKeytaskVoted>() {
		public ZhKeytaskVoted create() {
			return (ZhKeytaskVoted) DataFactory.INSTANCE.create(TYPE);
		}
	};

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
	public String getJoinKeytask();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.imptask.vote.ZhKeytaskVoted#getJoinKeytask <em>JoinKeytask</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>JoinKeytask</em>' attribute.
	 * @see #getJoinKeytask()
	 */
	public void setJoinKeytask(String joinKeytask);

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
	public int getJudgeType();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.imptask.vote.ZhKeytaskVoted#getJudgeType <em>JudgeType</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>JudgeType</em>' attribute.
	 * @see #getJudgeType()
	 */
	public void setJudgeType(int judgeType);

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
	public int getNumber();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.imptask.vote.ZhKeytaskVoted#getNumber <em>Number</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Number</em>' attribute.
	 * @see #getNumber()
	 */
	public void setNumber(int number);

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
	public int getKeytaskId();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.imptask.vote.ZhKeytaskVoted#getKeytaskId <em>KeytaskId</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>KeytaskId</em>' attribute.
	 * @see #getKeytaskId()
	 */
	public void setKeytaskId(int keytaskId);

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
	public String getOrgids();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.imptask.vote.ZhKeytaskVoted#getOrgids <em>Orgids</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Orgids</em>' attribute.
	 * @see #getOrgids()
	 */
	public void setOrgids(String orgids);


}