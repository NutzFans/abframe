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
 *   <li>{@link com.primeton.ame.schindler.org.AaOrgtest#getId <em>Id</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.AaOrgtest#getName <em>Name</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.AaOrgtest#getLunid <em>Lunid</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.AaOrgtest#getHierarchyid <em>Hierarchyid</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.AaOrgtest#getIsavailable <em>Isavailable</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.AaOrgtest#getAltertime <em>Altertime</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.AaOrgtest#getOrgType <em>OrgType</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.AaOrgtest#getOrderBy <em>OrderBy</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.AaOrgtest#getParent <em>Parent</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.AaOrgtest#getSuperleader <em>Superleader</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.AaOrgtest#getThisleader <em>Thisleader</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.AaOrgtest#getNo <em>No</em>}</li>
 * </ul>
 * </p>
 *
 * @extends DataObject;
 */
public interface AaOrgtest extends DataObject {

	public static final String QNAME = "com.primeton.ame.schindler.org.AaOrgtest";

	public static final Type TYPE = TypeHelper.INSTANCE.getType("com.primeton.ame.schindler.org", "AaOrgtest");

	public static final IObjectFactory<AaOrgtest> FACTORY = new IObjectFactory<AaOrgtest>() {
		public AaOrgtest create() {
			return (AaOrgtest) DataFactory.INSTANCE.create(TYPE);
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
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.AaOrgtest#getId <em>Id</em>}' attribute.
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
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.AaOrgtest#getName <em>Name</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Name</em>' attribute.
	 * @see #getName()
	 */
	public void setName(String name);

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
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.AaOrgtest#getLunid <em>Lunid</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Lunid</em>' attribute.
	 * @see #getLunid()
	 */
	public void setLunid(String lunid);

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
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.AaOrgtest#getHierarchyid <em>Hierarchyid</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Hierarchyid</em>' attribute.
	 * @see #getHierarchyid()
	 */
	public void setHierarchyid(String hierarchyid);

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
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.AaOrgtest#getIsavailable <em>Isavailable</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Isavailable</em>' attribute.
	 * @see #getIsavailable()
	 */
	public void setIsavailable(String isavailable);

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
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.AaOrgtest#getAltertime <em>Altertime</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Altertime</em>' attribute.
	 * @see #getAltertime()
	 */
	public void setAltertime(String altertime);

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
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.AaOrgtest#getOrgType <em>OrgType</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>OrgType</em>' attribute.
	 * @see #getOrgType()
	 */
	public void setOrgType(String orgType);

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
	public String getOrderBy();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.AaOrgtest#getOrderBy <em>OrderBy</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>OrderBy</em>' attribute.
	 * @see #getOrderBy()
	 */
	public void setOrderBy(String orderBy);

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
	public String getParent();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.AaOrgtest#getParent <em>Parent</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Parent</em>' attribute.
	 * @see #getParent()
	 */
	public void setParent(String parent);

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
	public String getSuperleader();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.AaOrgtest#getSuperleader <em>Superleader</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Superleader</em>' attribute.
	 * @see #getSuperleader()
	 */
	public void setSuperleader(String superleader);

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
	public String getThisleader();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.AaOrgtest#getThisleader <em>Thisleader</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Thisleader</em>' attribute.
	 * @see #getThisleader()
	 */
	public void setThisleader(String thisleader);

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
	public String getNo();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.AaOrgtest#getNo <em>No</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>No</em>' attribute.
	 * @see #getNo()
	 */
	public void setNo(String no);


}