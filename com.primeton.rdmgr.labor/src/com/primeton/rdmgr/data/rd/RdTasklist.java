/*******************************************************************************
 *
 * Copyright (c) 2001-2006 Primeton Technologies, Ltd.
 * All rights reserved.
 *
 * Created on Apr 11, 2008
 *******************************************************************************/
package com.primeton.rdmgr.data.rd;

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
 *   <li>{@link com.primeton.rdmgr.data.rd.RdTasklist#getTasklist <em>Tasklist</em>}</li>
 *   <li>{@link com.primeton.rdmgr.data.rd.RdTasklist#getTaskname <em>Taskname</em>}</li>
 *   <li>{@link com.primeton.rdmgr.data.rd.RdTasklist#getWorkType <em>WorkType</em>}</li>
 *   <li>{@link com.primeton.rdmgr.data.rd.RdTasklist#getTaskType <em>TaskType</em>}</li>
 * </ul>
 * </p>
 *
 * @extends DataObject;
 */
public interface RdTasklist extends DataObject {

	public final static String QNAME = "com.primeton.rdmgr.data.rd.RdTasklist";

	public final static Type TYPE = TypeHelper.INSTANCE.getType("com.primeton.rdmgr.data.rd", "RdTasklist");

	public final static IObjectFactory<RdTasklist> FACTORY = new IObjectFactory<RdTasklist>() {
		public RdTasklist create() {
			return (RdTasklist) DataFactory.INSTANCE.create(TYPE);
		}
	};

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
	public String getTasklist();

	/**
	 * Sets the value of the '{@link com.primeton.rdmgr.data.rd.RdTasklist#getTasklist <em>Tasklist</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Tasklist</em>' attribute.
	 * @see #getTasklist()
	 */
	public void setTasklist(String tasklist);

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
	public String getTaskname();

	/**
	 * Sets the value of the '{@link com.primeton.rdmgr.data.rd.RdTasklist#getTaskname <em>Taskname</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Taskname</em>' attribute.
	 * @see #getTaskname()
	 */
	public void setTaskname(String taskname);

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
	public String getWorkType();

	/**
	 * Sets the value of the '{@link com.primeton.rdmgr.data.rd.RdTasklist#getWorkType <em>WorkType</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>WorkType</em>' attribute.
	 * @see #getWorkType()
	 */
	public void setWorkType(String workType);

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
	public String getTaskType();

	/**
	 * Sets the value of the '{@link com.primeton.rdmgr.data.rd.RdTasklist#getTaskType <em>TaskType</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>TaskType</em>' attribute.
	 * @see #getTaskType()
	 */
	public void setTaskType(String taskType);


}