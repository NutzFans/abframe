/*******************************************************************************
 *
 * Copyright (c) 2001-2006 Primeton Technologies, Ltd.
 * All rights reserved.
 *
 * Created on Apr 11, 2008
 *******************************************************************************/
package com.primeton.ame.schindler.org;

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
 *   <li>{@link com.primeton.ame.schindler.org.AaGrouptest#getId <em>Id</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.AaGrouptest#getName <em>Name</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.AaGrouptest#getHierarchyid <em>Hierarchyid</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.AaGrouptest#getOrgType <em>OrgType</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.AaGrouptest#getLunid <em>Lunid</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.AaGrouptest#getAltertime <em>Altertime</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.AaGrouptest#getIsavailable <em>Isavailable</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.AaGrouptest#getMemo <em>Memo</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.AaGrouptest#getOrderby <em>Orderby</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.AaGrouptest#getMembers <em>Members</em>}</li>
 * </ul>
 * </p>
 *
 * @extends DataObject;
 */
public interface AaGrouptest extends DataObject {

	public static final String QNAME = "com.primeton.ame.schindler.org.AaGrouptest";

	public static final Type TYPE = TypeHelper.INSTANCE.getType("com.primeton.ame.schindler.org", "AaGrouptest");

	public static final IObjectFactory<AaGrouptest> FACTORY = new IObjectFactory<AaGrouptest>() {
		public AaGrouptest create() {
			return (AaGrouptest) DataFactory.INSTANCE.create(TYPE);
		}
	};

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
	public String getId();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.AaGrouptest#getId <em>Id</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Id</em>' attribute.
	 * @see #getId()
	 */
	public void setId(String id);

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
	public String getName();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.AaGrouptest#getName <em>Name</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Name</em>' attribute.
	 * @see #getName()
	 */
	public void setName(String name);

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
	public String getHierarchyid();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.AaGrouptest#getHierarchyid <em>Hierarchyid</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Hierarchyid</em>' attribute.
	 * @see #getHierarchyid()
	 */
	public void setHierarchyid(String hierarchyid);

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
	public String getOrgType();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.AaGrouptest#getOrgType <em>OrgType</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>OrgType</em>' attribute.
	 * @see #getOrgType()
	 */
	public void setOrgType(String orgType);

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
	public String getLunid();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.AaGrouptest#getLunid <em>Lunid</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Lunid</em>' attribute.
	 * @see #getLunid()
	 */
	public void setLunid(String lunid);

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
	public String getAltertime();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.AaGrouptest#getAltertime <em>Altertime</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Altertime</em>' attribute.
	 * @see #getAltertime()
	 */
	public void setAltertime(String altertime);

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
	public String getIsavailable();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.AaGrouptest#getIsavailable <em>Isavailable</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Isavailable</em>' attribute.
	 * @see #getIsavailable()
	 */
	public void setIsavailable(String isavailable);

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
	public String getMemo();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.AaGrouptest#getMemo <em>Memo</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Memo</em>' attribute.
	 * @see #getMemo()
	 */
	public void setMemo(String memo);

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
	public String getOrderby();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.AaGrouptest#getOrderby <em>Orderby</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Orderby</em>' attribute.
	 * @see #getOrderby()
	 */
	public void setOrderby(String orderby);

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
	public String getMembers();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.AaGrouptest#getMembers <em>Members</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Members</em>' attribute.
	 * @see #getMembers()
	 */
	public void setMembers(String members);


}