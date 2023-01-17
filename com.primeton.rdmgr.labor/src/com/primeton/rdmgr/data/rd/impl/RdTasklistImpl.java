/*******************************************************************************
 *
 * Copyright (c) 2001-2006 Primeton Technologies, Ltd.
 * All rights reserved.
 *
 * Created on Apr 11, 2008
 *******************************************************************************/
package com.primeton.rdmgr.data.rd.impl;

import com.primeton.ext.data.sdo.DataUtil;
import com.primeton.ext.data.sdo.ExtendedDataObjectImpl;
import com.primeton.rdmgr.data.rd.RdTasklist;

import commonj.sdo.Type;

/**
 * <!-- begin-user-doc -->
 * A representation of the model object '<em><b>Test</b></em>'.
 * <!-- end-user-doc -->
 *
 * <p>
 * The following features are supported:
 * <ul>
 *   <li>{@link com.primeton.rdmgr.data.rd.impl.RdTasklistImpl#getTasklist <em>Tasklist</em>}</li>
 *   <li>{@link com.primeton.rdmgr.data.rd.impl.RdTasklistImpl#getTaskname <em>Taskname</em>}</li>
 *   <li>{@link com.primeton.rdmgr.data.rd.impl.RdTasklistImpl#getWorkType <em>WorkType</em>}</li>
 *   <li>{@link com.primeton.rdmgr.data.rd.impl.RdTasklistImpl#getTaskType <em>TaskType</em>}</li>
 * </ul>
 * </p>
 *
 * @extends ExtendedDataObjectImpl;
 *
 * @implements RdTasklist;
 */

public class RdTasklistImpl extends ExtendedDataObjectImpl implements RdTasklist {
	/**
	 * Comment for <code>serialVersionUID</code>
	 */
	private static final long serialVersionUID = 1L;
	public final static int INDEX_TASKLIST = 0;
	public final static int INDEX_TASKNAME = 1;
	public final static int INDEX_WORKTYPE = 2;
	public final static int INDEX_TASKTYPE = 3;
	public final static int SDO_PROPERTY_COUNT = 4;

	public final static int EXTENDED_PROPERTY_COUNT = -1;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 */
	public RdTasklistImpl() {
		this(TYPE);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 */
	public RdTasklistImpl(Type type) {
		super(type);
	}

	protected void validate() {
		validateType(TYPE);
	}

	/**
	 * Returns the value of the '<em><b>Tasklist</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Tasklist</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Tasklist</em>' attribute.
	 * @see #setTasklist(java.lang.String)
	 */
	public String getTasklist() {
		return DataUtil.toString(super.getByIndex(INDEX_TASKLIST, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getTasklist <em>Tasklist</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Tasklist</em>' attribute.
	 * @see #getTasklist()
	 */
	public void setTasklist(String tasklist) {
		super.setByIndex(INDEX_TASKLIST, tasklist);
	}

	/**
	 * Returns the value of the '<em><b>Taskname</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Taskname</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Taskname</em>' attribute.
	 * @see #setTaskname(java.lang.String)
	 */
	public String getTaskname() {
		return DataUtil.toString(super.getByIndex(INDEX_TASKNAME, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getTaskname <em>Taskname</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Taskname</em>' attribute.
	 * @see #getTaskname()
	 */
	public void setTaskname(String taskname) {
		super.setByIndex(INDEX_TASKNAME, taskname);
	}

	/**
	 * Returns the value of the '<em><b>WorkType</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>WorkType</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>WorkType</em>' attribute.
	 * @see #setWorkType(java.lang.String)
	 */
	public String getWorkType() {
		return DataUtil.toString(super.getByIndex(INDEX_WORKTYPE, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getWorkType <em>WorkType</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>WorkType</em>' attribute.
	 * @see #getWorkType()
	 */
	public void setWorkType(String workType) {
		super.setByIndex(INDEX_WORKTYPE, workType);
	}

	/**
	 * Returns the value of the '<em><b>TaskType</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>TaskType</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>TaskType</em>' attribute.
	 * @see #setTaskType(java.lang.String)
	 */
	public String getTaskType() {
		return DataUtil.toString(super.getByIndex(INDEX_TASKTYPE, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getTaskType <em>TaskType</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>TaskType</em>' attribute.
	 * @see #getTaskType()
	 */
	public void setTaskType(String taskType) {
		super.setByIndex(INDEX_TASKTYPE, taskType);
	}


}