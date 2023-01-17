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
import com.zhonghe.ame.imptask.vote.ZhKeytaskNames;

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
 *   <li>{@link com.zhonghe.ame.imptask.vote.impl.ZhKeytaskNamesImpl#getId <em>Id</em>}</li>
 *   <li>{@link com.zhonghe.ame.imptask.vote.impl.ZhKeytaskNamesImpl#getKeytaskStatus <em>KeytaskStatus</em>}</li>
 *   <li>{@link com.zhonghe.ame.imptask.vote.impl.ZhKeytaskNamesImpl#getCreateTime <em>CreateTime</em>}</li>
 *   <li>{@link com.zhonghe.ame.imptask.vote.impl.ZhKeytaskNamesImpl#getCreateuserId <em>CreateuserId</em>}</li>
 *   <li>{@link com.zhonghe.ame.imptask.vote.impl.ZhKeytaskNamesImpl#getFinishtime <em>Finishtime</em>}</li>
 *   <li>{@link com.zhonghe.ame.imptask.vote.impl.ZhKeytaskNamesImpl#getRemake <em>Remake</em>}</li>
 *   <li>{@link com.zhonghe.ame.imptask.vote.impl.ZhKeytaskNamesImpl#getKeytaskName <em>KeytaskName</em>}</li>
 *   <li>{@link com.zhonghe.ame.imptask.vote.impl.ZhKeytaskNamesImpl#getCreateuserName <em>CreateuserName</em>}</li>
 * </ul>
 * </p>
 *
 * @extends ExtendedDataObjectImpl;
 *
 * @implements ZhKeytaskNames;
 */

public class ZhKeytaskNamesImpl extends ExtendedDataObjectImpl implements ZhKeytaskNames {
	/**
	 * Comment for <code>serialVersionUID</code>
	 */
	private static final long serialVersionUID = 1L;
	public final static int INDEX_ID = 0;
	public final static int INDEX_KEYTASKSTATUS = 1;
	public final static int INDEX_CREATETIME = 2;
	public final static int INDEX_CREATEUSERID = 3;
	public final static int INDEX_FINISHTIME = 4;
	public final static int INDEX_REMAKE = 5;
	public final static int INDEX_KEYTASKNAME = 6;
	public final static int INDEX_CREATEUSERNAME = 7;
	public static final int SDO_PROPERTY_COUNT = 8;

	public static final int EXTENDED_PROPERTY_COUNT = -1;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 */
	public ZhKeytaskNamesImpl() {
		this(TYPE);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 */
	public ZhKeytaskNamesImpl(Type type) {
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
	 * @see #setId(int)
	 */
	public int getId() {
		return DataUtil.toInt(super.getByIndex(INDEX_ID, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getId <em>Id</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Id</em>' attribute.
	 * @see #getId()
	 */
	public void setId(int id) {
		super.setByIndex(INDEX_ID, id);
	}

	/**
	 * Returns the value of the '<em><b>KeytaskStatus</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>KeytaskStatus</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>KeytaskStatus</em>' attribute.
	 * @see #setKeytaskStatus(java.lang.String)
	 */
	public String getKeytaskStatus() {
		return DataUtil.toString(super.getByIndex(INDEX_KEYTASKSTATUS, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getKeytaskStatus <em>KeytaskStatus</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>KeytaskStatus</em>' attribute.
	 * @see #getKeytaskStatus()
	 */
	public void setKeytaskStatus(String keytaskStatus) {
		super.setByIndex(INDEX_KEYTASKSTATUS, keytaskStatus);
	}

	/**
	 * Returns the value of the '<em><b>CreateTime</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>CreateTime</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>CreateTime</em>' attribute.
	 * @see #setCreateTime(java.util.Date)
	 */
	public Date getCreateTime() {
		return DataUtil.toDate(super.getByIndex(INDEX_CREATETIME, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getCreateTime <em>CreateTime</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>CreateTime</em>' attribute.
	 * @see #getCreateTime()
	 */
	public void setCreateTime(Date createTime) {
		super.setByIndex(INDEX_CREATETIME, createTime);
	}

	/**
	 * Returns the value of the '<em><b>CreateuserId</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>CreateuserId</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>CreateuserId</em>' attribute.
	 * @see #setCreateuserId(java.lang.String)
	 */
	public String getCreateuserId() {
		return DataUtil.toString(super.getByIndex(INDEX_CREATEUSERID, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getCreateuserId <em>CreateuserId</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>CreateuserId</em>' attribute.
	 * @see #getCreateuserId()
	 */
	public void setCreateuserId(String createuserId) {
		super.setByIndex(INDEX_CREATEUSERID, createuserId);
	}

	/**
	 * Returns the value of the '<em><b>Finishtime</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Finishtime</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Finishtime</em>' attribute.
	 * @see #setFinishtime(java.util.Date)
	 */
	public Date getFinishtime() {
		return DataUtil.toDate(super.getByIndex(INDEX_FINISHTIME, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getFinishtime <em>Finishtime</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Finishtime</em>' attribute.
	 * @see #getFinishtime()
	 */
	public void setFinishtime(Date finishtime) {
		super.setByIndex(INDEX_FINISHTIME, finishtime);
	}

	/**
	 * Returns the value of the '<em><b>Remake</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Remake</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Remake</em>' attribute.
	 * @see #setRemake(java.lang.String)
	 */
	public String getRemake() {
		return DataUtil.toString(super.getByIndex(INDEX_REMAKE, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getRemake <em>Remake</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Remake</em>' attribute.
	 * @see #getRemake()
	 */
	public void setRemake(String remake) {
		super.setByIndex(INDEX_REMAKE, remake);
	}

	/**
	 * Returns the value of the '<em><b>KeytaskName</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>KeytaskName</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>KeytaskName</em>' attribute.
	 * @see #setKeytaskName(java.lang.String)
	 */
	public String getKeytaskName() {
		return DataUtil.toString(super.getByIndex(INDEX_KEYTASKNAME, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getKeytaskName <em>KeytaskName</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>KeytaskName</em>' attribute.
	 * @see #getKeytaskName()
	 */
	public void setKeytaskName(String keytaskName) {
		super.setByIndex(INDEX_KEYTASKNAME, keytaskName);
	}

	/**
	 * Returns the value of the '<em><b>CreateuserName</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>CreateuserName</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>CreateuserName</em>' attribute.
	 * @see #setCreateuserName(java.lang.String)
	 */
	public String getCreateuserName() {
		return DataUtil.toString(super.getByIndex(INDEX_CREATEUSERNAME, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getCreateuserName <em>CreateuserName</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>CreateuserName</em>' attribute.
	 * @see #getCreateuserName()
	 */
	public void setCreateuserName(String createuserName) {
		super.setByIndex(INDEX_CREATEUSERNAME, createuserName);
	}


}