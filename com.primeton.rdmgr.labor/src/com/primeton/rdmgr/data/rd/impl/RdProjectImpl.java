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
import com.primeton.rdmgr.data.rd.OmEmployee;
import com.primeton.rdmgr.data.rd.OmOrganization;
import com.primeton.rdmgr.data.rd.RdProject;

import commonj.sdo.Type;

/**
 * <!-- begin-user-doc -->
 * A representation of the model object '<em><b>Test</b></em>'.
 * <!-- end-user-doc -->
 *
 * <p>
 * The following features are supported:
 * <ul>
 *   <li>{@link com.primeton.rdmgr.data.rd.impl.RdProjectImpl#getProjectId <em>ProjectId</em>}</li>
 *   <li>{@link com.primeton.rdmgr.data.rd.impl.RdProjectImpl#getProjectName <em>ProjectName</em>}</li>
 *   <li>{@link com.primeton.rdmgr.data.rd.impl.RdProjectImpl#getProjectType <em>ProjectType</em>}</li>
 *   <li>{@link com.primeton.rdmgr.data.rd.impl.RdProjectImpl#getIsTemplate <em>IsTemplate</em>}</li>
 *   <li>{@link com.primeton.rdmgr.data.rd.impl.RdProjectImpl#getIsPublic <em>IsPublic</em>}</li>
 *   <li>{@link com.primeton.rdmgr.data.rd.impl.RdProjectImpl#getProjectStatus <em>ProjectStatus</em>}</li>
 *   <li>{@link com.primeton.rdmgr.data.rd.impl.RdProjectImpl#getRdProdVer <em>RdProdVer</em>}</li>
 *   <li>{@link com.primeton.rdmgr.data.rd.impl.RdProjectImpl#getRdCustomer <em>RdCustomer</em>}</li>
 *   <li>{@link com.primeton.rdmgr.data.rd.impl.RdProjectImpl#getOmEmployee <em>OmEmployee</em>}</li>
 *   <li>{@link com.primeton.rdmgr.data.rd.impl.RdProjectImpl#getOmOrganization <em>OmOrganization</em>}</li>
 * </ul>
 * </p>
 *
 * @extends ExtendedDataObjectImpl;
 *
 * @implements RdProject;
 */

public class RdProjectImpl extends ExtendedDataObjectImpl implements RdProject {
	/**
	 * Comment for <code>serialVersionUID</code>
	 */
	private static final long serialVersionUID = 1L;
	public final static int INDEX_PROJECTID = 0;
	public final static int INDEX_PROJECTNAME = 1;
	public final static int INDEX_PROJECTTYPE = 2;
	public final static int INDEX_ISTEMPLATE = 3;
	public final static int INDEX_ISPUBLIC = 4;
	public final static int INDEX_PROJECTSTATUS = 5;
	public final static int INDEX_RDPRODVER = 6;
	public final static int INDEX_RDCUSTOMER = 7;
	public final static int INDEX_OMEMPLOYEE = 8;
	public final static int INDEX_OMORGANIZATION = 9;
	public final static int SDO_PROPERTY_COUNT = 10;

	public final static int EXTENDED_PROPERTY_COUNT = -1;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 */
	public RdProjectImpl() {
		this(TYPE);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 */
	public RdProjectImpl(Type type) {
		super(type);
	}

	protected void validate() {
		validateType(TYPE);
	}

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
	public long getProjectId() {
		return DataUtil.toLong(super.getByIndex(INDEX_PROJECTID, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getProjectId <em>ProjectId</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>ProjectId</em>' attribute.
	 * @see #getProjectId()
	 */
	public void setProjectId(long projectId) {
		super.setByIndex(INDEX_PROJECTID, projectId);
	}

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
	public String getProjectName() {
		return DataUtil.toString(super.getByIndex(INDEX_PROJECTNAME, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getProjectName <em>ProjectName</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>ProjectName</em>' attribute.
	 * @see #getProjectName()
	 */
	public void setProjectName(String projectName) {
		super.setByIndex(INDEX_PROJECTNAME, projectName);
	}

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
	public String getProjectType() {
		return DataUtil.toString(super.getByIndex(INDEX_PROJECTTYPE, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getProjectType <em>ProjectType</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>ProjectType</em>' attribute.
	 * @see #getProjectType()
	 */
	public void setProjectType(String projectType) {
		super.setByIndex(INDEX_PROJECTTYPE, projectType);
	}

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
	public String getIsTemplate() {
		return DataUtil.toString(super.getByIndex(INDEX_ISTEMPLATE, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getIsTemplate <em>IsTemplate</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>IsTemplate</em>' attribute.
	 * @see #getIsTemplate()
	 */
	public void setIsTemplate(String isTemplate) {
		super.setByIndex(INDEX_ISTEMPLATE, isTemplate);
	}

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
	public String getIsPublic() {
		return DataUtil.toString(super.getByIndex(INDEX_ISPUBLIC, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getIsPublic <em>IsPublic</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>IsPublic</em>' attribute.
	 * @see #getIsPublic()
	 */
	public void setIsPublic(String isPublic) {
		super.setByIndex(INDEX_ISPUBLIC, isPublic);
	}

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
	public String getProjectStatus() {
		return DataUtil.toString(super.getByIndex(INDEX_PROJECTSTATUS, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getProjectStatus <em>ProjectStatus</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>ProjectStatus</em>' attribute.
	 * @see #getProjectStatus()
	 */
	public void setProjectStatus(String projectStatus) {
		super.setByIndex(INDEX_PROJECTSTATUS, projectStatus);
	}

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
	public OmEmployee getOmEmployee() {
		return (OmEmployee) DataUtil.toDataObject(super.getByIndex(INDEX_OMEMPLOYEE, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getOmEmployee <em>OmEmployee</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>OmEmployee</em>' attribute.
	 * @see #getOmEmployee()
	 */
	public void setOmEmployee(OmEmployee omEmployee) {
		super.setByIndex(INDEX_OMEMPLOYEE, omEmployee);
	}

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
	public OmOrganization getOmOrganization() {
		return (OmOrganization) DataUtil.toDataObject(super.getByIndex(INDEX_OMORGANIZATION, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getOmOrganization <em>OmOrganization</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>OmOrganization</em>' attribute.
	 * @see #getOmOrganization()
	 */
	public void setOmOrganization(OmOrganization omOrganization) {
		super.setByIndex(INDEX_OMORGANIZATION, omOrganization);
	}


}