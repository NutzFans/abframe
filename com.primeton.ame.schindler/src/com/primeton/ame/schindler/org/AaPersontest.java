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
 *   <li>{@link com.primeton.ame.schindler.org.AaPersontest#getId <em>Id</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.AaPersontest#getName <em>Name</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.AaPersontest#getSex <em>Sex</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.AaPersontest#getNo <em>No</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.AaPersontest#getHierarchyid <em>Hierarchyid</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.AaPersontest#getOrgType <em>OrgType</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.AaPersontest#getPassword <em>Password</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.AaPersontest#getIsavailable <em>Isavailable</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.AaPersontest#getEmail <em>Email</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.AaPersontest#getLunid <em>Lunid</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.AaPersontest#getAltertime <em>Altertime</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.AaPersontest#getMobileno <em>Mobileno</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.AaPersontest#getLoginname <em>Loginname</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.AaPersontest#getOrderby <em>Orderby</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.AaPersontest#getWorkphone <em>Workphone</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.AaPersontest#getParent <em>Parent</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.AaPersontest#getShortno <em>Shortno</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.AaPersontest#getPosts <em>Posts</em>}</li>
 * </ul>
 * </p>
 *
 * @extends DataObject;
 */
public interface AaPersontest extends DataObject {

	public static final String QNAME = "com.primeton.ame.schindler.org.AaPersontest";

	public static final Type TYPE = TypeHelper.INSTANCE.getType("com.primeton.ame.schindler.org", "AaPersontest");

	public static final IObjectFactory<AaPersontest> FACTORY = new IObjectFactory<AaPersontest>() {
		public AaPersontest create() {
			return (AaPersontest) DataFactory.INSTANCE.create(TYPE);
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
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.AaPersontest#getId <em>Id</em>}' attribute.
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
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.AaPersontest#getName <em>Name</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Name</em>' attribute.
	 * @see #getName()
	 */
	public void setName(String name);

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
	public String getSex();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.AaPersontest#getSex <em>Sex</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Sex</em>' attribute.
	 * @see #getSex()
	 */
	public void setSex(String sex);

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
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.AaPersontest#getNo <em>No</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>No</em>' attribute.
	 * @see #getNo()
	 */
	public void setNo(String no);

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
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.AaPersontest#getHierarchyid <em>Hierarchyid</em>}' attribute.
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
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.AaPersontest#getOrgType <em>OrgType</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>OrgType</em>' attribute.
	 * @see #getOrgType()
	 */
	public void setOrgType(String orgType);

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
	public String getPassword();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.AaPersontest#getPassword <em>Password</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Password</em>' attribute.
	 * @see #getPassword()
	 */
	public void setPassword(String password);

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
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.AaPersontest#getIsavailable <em>Isavailable</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Isavailable</em>' attribute.
	 * @see #getIsavailable()
	 */
	public void setIsavailable(String isavailable);

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
	public String getEmail();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.AaPersontest#getEmail <em>Email</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Email</em>' attribute.
	 * @see #getEmail()
	 */
	public void setEmail(String email);

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
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.AaPersontest#getLunid <em>Lunid</em>}' attribute.
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
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.AaPersontest#getAltertime <em>Altertime</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Altertime</em>' attribute.
	 * @see #getAltertime()
	 */
	public void setAltertime(String altertime);

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
	public String getMobileno();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.AaPersontest#getMobileno <em>Mobileno</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Mobileno</em>' attribute.
	 * @see #getMobileno()
	 */
	public void setMobileno(String mobileno);

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
	public String getLoginname();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.AaPersontest#getLoginname <em>Loginname</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Loginname</em>' attribute.
	 * @see #getLoginname()
	 */
	public void setLoginname(String loginname);

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
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.AaPersontest#getOrderby <em>Orderby</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Orderby</em>' attribute.
	 * @see #getOrderby()
	 */
	public void setOrderby(String orderby);

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
	public String getWorkphone();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.AaPersontest#getWorkphone <em>Workphone</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Workphone</em>' attribute.
	 * @see #getWorkphone()
	 */
	public void setWorkphone(String workphone);

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
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.AaPersontest#getParent <em>Parent</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Parent</em>' attribute.
	 * @see #getParent()
	 */
	public void setParent(String parent);

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
	public String getShortno();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.AaPersontest#getShortno <em>Shortno</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Shortno</em>' attribute.
	 * @see #getShortno()
	 */
	public void setShortno(String shortno);

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
	public String getPosts();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.AaPersontest#getPosts <em>Posts</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Posts</em>' attribute.
	 * @see #getPosts()
	 */
	public void setPosts(String posts);


}