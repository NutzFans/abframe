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
 *   <li>{@link com.primeton.rdmgr.data.rd.RdProject#getProjectId <em>ProjectId</em>}</li>
 *   <li>{@link com.primeton.rdmgr.data.rd.RdProject#getProjectName <em>ProjectName</em>}</li>
 *   <li>{@link com.primeton.rdmgr.data.rd.RdProject#getProjectType <em>ProjectType</em>}</li>
 *   <li>{@link com.primeton.rdmgr.data.rd.RdProject#getIsTemplate <em>IsTemplate</em>}</li>
 *   <li>{@link com.primeton.rdmgr.data.rd.RdProject#getIsPublic <em>IsPublic</em>}</li>
 *   <li>{@link com.primeton.rdmgr.data.rd.RdProject#getProjectStatus <em>ProjectStatus</em>}</li>
 *   <li>{@link com.primeton.rdmgr.data.rd.RdProject#getRdProdVer <em>RdProdVer</em>}</li>
 *   <li>{@link com.primeton.rdmgr.data.rd.RdProject#getRdCustomer <em>RdCustomer</em>}</li>
 *   <li>{@link com.primeton.rdmgr.data.rd.RdProject#getOmEmployee <em>OmEmployee</em>}</li>
 *   <li>{@link com.primeton.rdmgr.data.rd.RdProject#getOmOrganization <em>OmOrganization</em>}</li>
 * </ul>
 * </p>
 *
 * @extends DataObject;
 */
public interface RdProject extends DataObject {

	public final static String QNAME = "com.primeton.rdmgr.data.rd.RdProject";

	public final static Type TYPE = TypeHelper.INSTANCE.getType("com.primeton.rdmgr.data.rd", "RdProject");

	public final static IObjectFactory<RdProject> FACTORY = new IObjectFactory<RdProject>() {
		public RdProject create() {
			return (RdProject) DataFactory.INSTANCE.create(TYPE);
		}
	};

	/**
	 * Returns the value of the '<em><b>ProjectId</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>ProjectId</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>ProjectId</em>' attribute.
	 * @see #setProjectId(long)
	 */
	public long getProjectId();

	/**
	 * Sets the value of the '{@link com.primeton.rdmgr.data.rd.RdProject#getProjectId <em>ProjectId</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>ProjectId</em>' attribute.
	 * @see #getProjectId()
	 */
	public void setProjectId(long projectId);

	/**
	 * Returns the value of the '<em><b>ProjectName</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>ProjectName</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>ProjectName</em>' attribute.
	 * @see #setProjectName(java.lang.String)
	 */
	public String getProjectName();

	/**
	 * Sets the value of the '{@link com.primeton.rdmgr.data.rd.RdProject#getProjectName <em>ProjectName</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>ProjectName</em>' attribute.
	 * @see #getProjectName()
	 */
	public void setProjectName(String projectName);

	/**
	 * Returns the value of the '<em><b>ProjectType</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>ProjectType</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>ProjectType</em>' attribute.
	 * @see #setProjectType(java.lang.String)
	 */
	public String getProjectType();

	/**
	 * Sets the value of the '{@link com.primeton.rdmgr.data.rd.RdProject#getProjectType <em>ProjectType</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>ProjectType</em>' attribute.
	 * @see #getProjectType()
	 */
	public void setProjectType(String projectType);

	/**
	 * Returns the value of the '<em><b>IsTemplate</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>IsTemplate</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>IsTemplate</em>' attribute.
	 * @see #setIsTemplate(java.lang.String)
	 */
	public String getIsTemplate();

	/**
	 * Sets the value of the '{@link com.primeton.rdmgr.data.rd.RdProject#getIsTemplate <em>IsTemplate</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>IsTemplate</em>' attribute.
	 * @see #getIsTemplate()
	 */
	public void setIsTemplate(String isTemplate);

	/**
	 * Returns the value of the '<em><b>IsPublic</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>IsPublic</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>IsPublic</em>' attribute.
	 * @see #setIsPublic(java.lang.String)
	 */
	public String getIsPublic();

	/**
	 * Sets the value of the '{@link com.primeton.rdmgr.data.rd.RdProject#getIsPublic <em>IsPublic</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>IsPublic</em>' attribute.
	 * @see #getIsPublic()
	 */
	public void setIsPublic(String isPublic);

	/**
	 * Returns the value of the '<em><b>ProjectStatus</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>ProjectStatus</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>ProjectStatus</em>' attribute.
	 * @see #setProjectStatus(java.lang.String)
	 */
	public String getProjectStatus();

	/**
	 * Sets the value of the '{@link com.primeton.rdmgr.data.rd.RdProject#getProjectStatus <em>ProjectStatus</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>ProjectStatus</em>' attribute.
	 * @see #getProjectStatus()
	 */
	public void setProjectStatus(String projectStatus);

	/**
	 * Returns the value of the '<em><b>OmEmployee</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>OmEmployee</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>OmEmployee</em>' attribute.
	 * @see #setOmEmployee(com.primeton.rdmgr.data.rd.OmEmployee)
	 */
	public OmEmployee getOmEmployee();

	/**
	 * Sets the value of the '{@link com.primeton.rdmgr.data.rd.RdProject#getOmEmployee <em>OmEmployee</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>OmEmployee</em>' attribute.
	 * @see #getOmEmployee()
	 */
	public void setOmEmployee(OmEmployee omEmployee);

	/**
	 * Returns the value of the '<em><b>OmOrganization</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>OmOrganization</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>OmOrganization</em>' attribute.
	 * @see #setOmOrganization(com.primeton.rdmgr.data.rd.OmOrganization)
	 */
	public OmOrganization getOmOrganization();

	/**
	 * Sets the value of the '{@link com.primeton.rdmgr.data.rd.RdProject#getOmOrganization <em>OmOrganization</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>OmOrganization</em>' attribute.
	 * @see #getOmOrganization()
	 */
	public void setOmOrganization(OmOrganization omOrganization);


}