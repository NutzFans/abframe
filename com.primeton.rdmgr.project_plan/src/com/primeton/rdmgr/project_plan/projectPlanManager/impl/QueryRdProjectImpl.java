/*******************************************************************************
 *
 * Copyright (c) 2001-2006 Primeton Technologies, Ltd.
 * All rights reserved.
 *
 * Created on Apr 11, 2008
 *******************************************************************************/
package com.primeton.rdmgr.project_plan.projectPlanManager.impl;

import com.primeton.ext.data.sdo.DataUtil;
import com.primeton.ext.data.sdo.ExtendedDataObjectImpl;
import com.primeton.rdmgr.project_plan.projectPlanManager.QueryRdProject;

import commonj.sdo.Type;

import java.math.BigDecimal;
import java.util.Date;

/**
 * <!-- begin-user-doc -->
 * A representation of the model object '<em><b>Test</b></em>'.
 * <!-- end-user-doc -->
 *
 * <p>
 * The following features are supported:
 * <ul>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.impl.QueryRdProjectImpl#getProjectName <em>ProjectName</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.impl.QueryRdProjectImpl#getProjectType <em>ProjectType</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.impl.QueryRdProjectImpl#getFinUnitId <em>FinUnitId</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.impl.QueryRdProjectImpl#getOrgname <em>Orgname</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.impl.QueryRdProjectImpl#getManager <em>Manager</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.impl.QueryRdProjectImpl#getManagername <em>Managername</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.impl.QueryRdProjectImpl#getProjectStatus <em>ProjectStatus</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.impl.QueryRdProjectImpl#getOutstatus <em>Outstatus</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.impl.QueryRdProjectImpl#getCustid <em>Custid</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.impl.QueryRdProjectImpl#getCustname <em>Custname</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.impl.QueryRdProjectImpl#getIspassbud <em>Ispassbud</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.impl.QueryRdProjectImpl#getCreatedate <em>Createdate</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.impl.QueryRdProjectImpl#getClosedate <em>Closedate</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.impl.QueryRdProjectImpl#getLastcostdate <em>Lastcostdate</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.impl.QueryRdProjectImpl#getImplementcity <em>Implementcity</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.impl.QueryRdProjectImpl#getIsconproj <em>Isconproj</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.impl.QueryRdProjectImpl#getCheckstatus <em>Checkstatus</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.impl.QueryRdProjectImpl#getProjectId <em>ProjectId</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.impl.QueryRdProjectImpl#getOrgseq <em>Orgseq</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.impl.QueryRdProjectImpl#getIshavewb <em>Ishavewb</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.impl.QueryRdProjectImpl#getContnum <em>Contnum</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.impl.QueryRdProjectImpl#getRuleid <em>Ruleid</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.impl.QueryRdProjectImpl#getRulename <em>Rulename</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.impl.QueryRdProjectImpl#getCreateapplicant <em>Createapplicant</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.impl.QueryRdProjectImpl#getCreateapplicantname <em>Createapplicantname</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.impl.QueryRdProjectImpl#getManagerdept <em>Managerdept</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.impl.QueryRdProjectImpl#getManagerdeptname <em>Managerdeptname</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.impl.QueryRdProjectImpl#getProcessinstid <em>Processinstid</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.impl.QueryRdProjectImpl#getCustjc <em>Custjc</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.impl.QueryRdProjectImpl#getOcstartdate <em>Ocstartdate</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.impl.QueryRdProjectImpl#getOcenddate <em>Ocenddate</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.impl.QueryRdProjectImpl#getProdVerId <em>ProdVerId</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.impl.QueryRdProjectImpl#getIsTemplate <em>IsTemplate</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.impl.QueryRdProjectImpl#getIsPublic <em>IsPublic</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.impl.QueryRdProjectImpl#getSaleid <em>Saleid</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.impl.QueryRdProjectImpl#getPricetype <em>Pricetype</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.impl.QueryRdProjectImpl#getIspassfz <em>Ispassfz</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.impl.QueryRdProjectImpl#getIssendfzmail <em>Issendfzmail</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.impl.QueryRdProjectImpl#getIssendbudmail <em>Issendbudmail</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.impl.QueryRdProjectImpl#getRemindfz <em>Remindfz</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.impl.QueryRdProjectImpl#getStartdate <em>Startdate</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.impl.QueryRdProjectImpl#getEnddate <em>Enddate</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.impl.QueryRdProjectImpl#getProjectno <em>Projectno</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.impl.QueryRdProjectImpl#getRemark <em>Remark</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.impl.QueryRdProjectImpl#getExpenddate <em>Expenddate</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.impl.QueryRdProjectImpl#getOutcontractid <em>Outcontractid</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.impl.QueryRdProjectImpl#getCbversion <em>Cbversion</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.impl.QueryRdProjectImpl#getPcosttype <em>Pcosttype</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.impl.QueryRdProjectImpl#getLongitude <em>Longitude</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.impl.QueryRdProjectImpl#getLatitude <em>Latitude</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.impl.QueryRdProjectImpl#getCheckplace <em>Checkplace</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.impl.QueryRdProjectImpl#getContplandate <em>Contplandate</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.impl.QueryRdProjectImpl#getLastupdatetime <em>Lastupdatetime</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.impl.QueryRdProjectImpl#getLastupdateman <em>Lastupdateman</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.impl.QueryRdProjectImpl#getMaincontnum <em>Maincontnum</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.impl.QueryRdProjectImpl#getManagerdeptseq <em>Managerdeptseq</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.impl.QueryRdProjectImpl#getPtime <em>Ptime</em>}</li>
 * </ul>
 * </p>
 *
 * @extends ExtendedDataObjectImpl;
 *
 * @implements QueryRdProject;
 */

public class QueryRdProjectImpl extends ExtendedDataObjectImpl implements QueryRdProject {
	/**
	 * Comment for <code>serialVersionUID</code>
	 */
	private static final long serialVersionUID = 1L;
	public final static int INDEX_PROJECTNAME = 0;
	public final static int INDEX_PROJECTTYPE = 1;
	public final static int INDEX_FINUNITID = 2;
	public final static int INDEX_ORGNAME = 3;
	public final static int INDEX_MANAGER = 4;
	public final static int INDEX_MANAGERNAME = 5;
	public final static int INDEX_PROJECTSTATUS = 6;
	public final static int INDEX_OUTSTATUS = 7;
	public final static int INDEX_CUSTID = 8;
	public final static int INDEX_CUSTNAME = 9;
	public final static int INDEX_ISPASSBUD = 10;
	public final static int INDEX_CREATEDATE = 11;
	public final static int INDEX_CLOSEDATE = 12;
	public final static int INDEX_LASTCOSTDATE = 13;
	public final static int INDEX_IMPLEMENTCITY = 14;
	public final static int INDEX_ISCONPROJ = 15;
	public final static int INDEX_CHECKSTATUS = 16;
	public final static int INDEX_PROJECTID = 17;
	public final static int INDEX_ORGSEQ = 18;
	public final static int INDEX_ISHAVEWB = 19;
	public final static int INDEX_CONTNUM = 20;
	public final static int INDEX_RULEID = 21;
	public final static int INDEX_RULENAME = 22;
	public final static int INDEX_CREATEAPPLICANT = 23;
	public final static int INDEX_CREATEAPPLICANTNAME = 24;
	public final static int INDEX_MANAGERDEPT = 25;
	public final static int INDEX_MANAGERDEPTNAME = 26;
	public final static int INDEX_PROCESSINSTID = 27;
	public final static int INDEX_CUSTJC = 28;
	public final static int INDEX_OCSTARTDATE = 29;
	public final static int INDEX_OCENDDATE = 30;
	public final static int INDEX_PRODVERID = 31;
	public final static int INDEX_ISTEMPLATE = 32;
	public final static int INDEX_ISPUBLIC = 33;
	public final static int INDEX_SALEID = 34;
	public final static int INDEX_PRICETYPE = 35;
	public final static int INDEX_ISPASSFZ = 36;
	public final static int INDEX_ISSENDFZMAIL = 37;
	public final static int INDEX_ISSENDBUDMAIL = 38;
	public final static int INDEX_REMINDFZ = 39;
	public final static int INDEX_STARTDATE = 40;
	public final static int INDEX_ENDDATE = 41;
	public final static int INDEX_PROJECTNO = 42;
	public final static int INDEX_REMARK = 43;
	public final static int INDEX_EXPENDDATE = 44;
	public final static int INDEX_OUTCONTRACTID = 45;
	public final static int INDEX_CBVERSION = 46;
	public final static int INDEX_PCOSTTYPE = 47;
	public final static int INDEX_LONGITUDE = 48;
	public final static int INDEX_LATITUDE = 49;
	public final static int INDEX_CHECKPLACE = 50;
	public final static int INDEX_CONTPLANDATE = 51;
	public final static int INDEX_LASTUPDATETIME = 52;
	public final static int INDEX_LASTUPDATEMAN = 53;
	public final static int INDEX_MAINCONTNUM = 54;
	public final static int INDEX_MANAGERDEPTSEQ = 55;
	public final static int INDEX_PTIME = 56;
	public static final int SDO_PROPERTY_COUNT = 57;

	public static final int EXTENDED_PROPERTY_COUNT = -1;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 */
	public QueryRdProjectImpl() {
		this(TYPE);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 */
	public QueryRdProjectImpl(Type type) {
		super(type);
	}

	protected void validate() {
		validateType(TYPE);
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
	 * Returns the value of the '<em><b>FinUnitId</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>FinUnitId</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>FinUnitId</em>' attribute.
	 * @see #setFinUnitId(java.math.BigDecimal)
	 */
	public BigDecimal getFinUnitId() {
		return DataUtil.toBigDecimal(super.getByIndex(INDEX_FINUNITID, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getFinUnitId <em>FinUnitId</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>FinUnitId</em>' attribute.
	 * @see #getFinUnitId()
	 */
	public void setFinUnitId(BigDecimal finUnitId) {
		super.setByIndex(INDEX_FINUNITID, finUnitId);
	}

	/**
	 * Returns the value of the '<em><b>Orgname</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Orgname</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Orgname</em>' attribute.
	 * @see #setOrgname(java.lang.String)
	 */
	public String getOrgname() {
		return DataUtil.toString(super.getByIndex(INDEX_ORGNAME, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getOrgname <em>Orgname</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Orgname</em>' attribute.
	 * @see #getOrgname()
	 */
	public void setOrgname(String orgname) {
		super.setByIndex(INDEX_ORGNAME, orgname);
	}

	/**
	 * Returns the value of the '<em><b>Manager</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Manager</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Manager</em>' attribute.
	 * @see #setManager(java.lang.String)
	 */
	public String getManager() {
		return DataUtil.toString(super.getByIndex(INDEX_MANAGER, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getManager <em>Manager</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Manager</em>' attribute.
	 * @see #getManager()
	 */
	public void setManager(String manager) {
		super.setByIndex(INDEX_MANAGER, manager);
	}

	/**
	 * Returns the value of the '<em><b>Managername</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Managername</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Managername</em>' attribute.
	 * @see #setManagername(java.lang.String)
	 */
	public String getManagername() {
		return DataUtil.toString(super.getByIndex(INDEX_MANAGERNAME, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getManagername <em>Managername</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Managername</em>' attribute.
	 * @see #getManagername()
	 */
	public void setManagername(String managername) {
		super.setByIndex(INDEX_MANAGERNAME, managername);
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
	 * Returns the value of the '<em><b>Outstatus</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Outstatus</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Outstatus</em>' attribute.
	 * @see #setOutstatus(java.lang.String)
	 */
	public String getOutstatus() {
		return DataUtil.toString(super.getByIndex(INDEX_OUTSTATUS, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getOutstatus <em>Outstatus</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Outstatus</em>' attribute.
	 * @see #getOutstatus()
	 */
	public void setOutstatus(String outstatus) {
		super.setByIndex(INDEX_OUTSTATUS, outstatus);
	}

	/**
	 * Returns the value of the '<em><b>Custid</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Custid</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Custid</em>' attribute.
	 * @see #setCustid(java.math.BigDecimal)
	 */
	public BigDecimal getCustid() {
		return DataUtil.toBigDecimal(super.getByIndex(INDEX_CUSTID, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getCustid <em>Custid</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Custid</em>' attribute.
	 * @see #getCustid()
	 */
	public void setCustid(BigDecimal custid) {
		super.setByIndex(INDEX_CUSTID, custid);
	}

	/**
	 * Returns the value of the '<em><b>Custname</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Custname</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Custname</em>' attribute.
	 * @see #setCustname(java.lang.String)
	 */
	public String getCustname() {
		return DataUtil.toString(super.getByIndex(INDEX_CUSTNAME, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getCustname <em>Custname</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Custname</em>' attribute.
	 * @see #getCustname()
	 */
	public void setCustname(String custname) {
		super.setByIndex(INDEX_CUSTNAME, custname);
	}

	/**
	 * Returns the value of the '<em><b>Ispassbud</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Ispassbud</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Ispassbud</em>' attribute.
	 * @see #setIspassbud(java.lang.String)
	 */
	public String getIspassbud() {
		return DataUtil.toString(super.getByIndex(INDEX_ISPASSBUD, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getIspassbud <em>Ispassbud</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Ispassbud</em>' attribute.
	 * @see #getIspassbud()
	 */
	public void setIspassbud(String ispassbud) {
		super.setByIndex(INDEX_ISPASSBUD, ispassbud);
	}

	/**
	 * Returns the value of the '<em><b>Createdate</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Createdate</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Createdate</em>' attribute.
	 * @see #setCreatedate(java.util.Date)
	 */
	public Date getCreatedate() {
		return DataUtil.toDate(super.getByIndex(INDEX_CREATEDATE, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getCreatedate <em>Createdate</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Createdate</em>' attribute.
	 * @see #getCreatedate()
	 */
	public void setCreatedate(Date createdate) {
		super.setByIndex(INDEX_CREATEDATE, createdate);
	}

	/**
	 * Returns the value of the '<em><b>Closedate</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Closedate</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Closedate</em>' attribute.
	 * @see #setClosedate(java.util.Date)
	 */
	public Date getClosedate() {
		return DataUtil.toDate(super.getByIndex(INDEX_CLOSEDATE, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getClosedate <em>Closedate</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Closedate</em>' attribute.
	 * @see #getClosedate()
	 */
	public void setClosedate(Date closedate) {
		super.setByIndex(INDEX_CLOSEDATE, closedate);
	}

	/**
	 * Returns the value of the '<em><b>Lastcostdate</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Lastcostdate</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Lastcostdate</em>' attribute.
	 * @see #setLastcostdate(java.util.Date)
	 */
	public Date getLastcostdate() {
		return DataUtil.toDate(super.getByIndex(INDEX_LASTCOSTDATE, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getLastcostdate <em>Lastcostdate</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Lastcostdate</em>' attribute.
	 * @see #getLastcostdate()
	 */
	public void setLastcostdate(Date lastcostdate) {
		super.setByIndex(INDEX_LASTCOSTDATE, lastcostdate);
	}

	/**
	 * Returns the value of the '<em><b>Implementcity</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Implementcity</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Implementcity</em>' attribute.
	 * @see #setImplementcity(java.lang.String)
	 */
	public String getImplementcity() {
		return DataUtil.toString(super.getByIndex(INDEX_IMPLEMENTCITY, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getImplementcity <em>Implementcity</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Implementcity</em>' attribute.
	 * @see #getImplementcity()
	 */
	public void setImplementcity(String implementcity) {
		super.setByIndex(INDEX_IMPLEMENTCITY, implementcity);
	}

	/**
	 * Returns the value of the '<em><b>Isconproj</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Isconproj</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Isconproj</em>' attribute.
	 * @see #setIsconproj(java.lang.String)
	 */
	public String getIsconproj() {
		return DataUtil.toString(super.getByIndex(INDEX_ISCONPROJ, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getIsconproj <em>Isconproj</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Isconproj</em>' attribute.
	 * @see #getIsconproj()
	 */
	public void setIsconproj(String isconproj) {
		super.setByIndex(INDEX_ISCONPROJ, isconproj);
	}

	/**
	 * Returns the value of the '<em><b>Checkstatus</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Checkstatus</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Checkstatus</em>' attribute.
	 * @see #setCheckstatus(java.lang.String)
	 */
	public String getCheckstatus() {
		return DataUtil.toString(super.getByIndex(INDEX_CHECKSTATUS, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getCheckstatus <em>Checkstatus</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Checkstatus</em>' attribute.
	 * @see #getCheckstatus()
	 */
	public void setCheckstatus(String checkstatus) {
		super.setByIndex(INDEX_CHECKSTATUS, checkstatus);
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
	 * @see #setProjectId(java.math.BigDecimal)
	 */
	public BigDecimal getProjectId() {
		return DataUtil.toBigDecimal(super.getByIndex(INDEX_PROJECTID, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getProjectId <em>ProjectId</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>ProjectId</em>' attribute.
	 * @see #getProjectId()
	 */
	public void setProjectId(BigDecimal projectId) {
		super.setByIndex(INDEX_PROJECTID, projectId);
	}

	/**
	 * Returns the value of the '<em><b>Orgseq</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Orgseq</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Orgseq</em>' attribute.
	 * @see #setOrgseq(java.lang.String)
	 */
	public String getOrgseq() {
		return DataUtil.toString(super.getByIndex(INDEX_ORGSEQ, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getOrgseq <em>Orgseq</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Orgseq</em>' attribute.
	 * @see #getOrgseq()
	 */
	public void setOrgseq(String orgseq) {
		super.setByIndex(INDEX_ORGSEQ, orgseq);
	}

	/**
	 * Returns the value of the '<em><b>Ishavewb</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Ishavewb</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Ishavewb</em>' attribute.
	 * @see #setIshavewb(int)
	 */
	public int getIshavewb() {
		return DataUtil.toInt(super.getByIndex(INDEX_ISHAVEWB, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getIshavewb <em>Ishavewb</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Ishavewb</em>' attribute.
	 * @see #getIshavewb()
	 */
	public void setIshavewb(int ishavewb) {
		super.setByIndex(INDEX_ISHAVEWB, ishavewb);
	}

	/**
	 * Returns the value of the '<em><b>Contnum</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Contnum</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Contnum</em>' attribute.
	 * @see #setContnum(java.lang.String)
	 */
	public String getContnum() {
		return DataUtil.toString(super.getByIndex(INDEX_CONTNUM, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getContnum <em>Contnum</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Contnum</em>' attribute.
	 * @see #getContnum()
	 */
	public void setContnum(String contnum) {
		super.setByIndex(INDEX_CONTNUM, contnum);
	}

	/**
	 * Returns the value of the '<em><b>Ruleid</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Ruleid</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Ruleid</em>' attribute.
	 * @see #setRuleid(java.math.BigDecimal)
	 */
	public BigDecimal getRuleid() {
		return DataUtil.toBigDecimal(super.getByIndex(INDEX_RULEID, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getRuleid <em>Ruleid</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Ruleid</em>' attribute.
	 * @see #getRuleid()
	 */
	public void setRuleid(BigDecimal ruleid) {
		super.setByIndex(INDEX_RULEID, ruleid);
	}

	/**
	 * Returns the value of the '<em><b>Rulename</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Rulename</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Rulename</em>' attribute.
	 * @see #setRulename(java.lang.String)
	 */
	public String getRulename() {
		return DataUtil.toString(super.getByIndex(INDEX_RULENAME, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getRulename <em>Rulename</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Rulename</em>' attribute.
	 * @see #getRulename()
	 */
	public void setRulename(String rulename) {
		super.setByIndex(INDEX_RULENAME, rulename);
	}

	/**
	 * Returns the value of the '<em><b>Createapplicant</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Createapplicant</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Createapplicant</em>' attribute.
	 * @see #setCreateapplicant(java.lang.String)
	 */
	public String getCreateapplicant() {
		return DataUtil.toString(super.getByIndex(INDEX_CREATEAPPLICANT, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getCreateapplicant <em>Createapplicant</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Createapplicant</em>' attribute.
	 * @see #getCreateapplicant()
	 */
	public void setCreateapplicant(String createapplicant) {
		super.setByIndex(INDEX_CREATEAPPLICANT, createapplicant);
	}

	/**
	 * Returns the value of the '<em><b>Createapplicantname</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Createapplicantname</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Createapplicantname</em>' attribute.
	 * @see #setCreateapplicantname(java.lang.String)
	 */
	public String getCreateapplicantname() {
		return DataUtil.toString(super.getByIndex(INDEX_CREATEAPPLICANTNAME, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getCreateapplicantname <em>Createapplicantname</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Createapplicantname</em>' attribute.
	 * @see #getCreateapplicantname()
	 */
	public void setCreateapplicantname(String createapplicantname) {
		super.setByIndex(INDEX_CREATEAPPLICANTNAME, createapplicantname);
	}

	/**
	 * Returns the value of the '<em><b>Managerdept</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Managerdept</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Managerdept</em>' attribute.
	 * @see #setManagerdept(java.math.BigDecimal)
	 */
	public BigDecimal getManagerdept() {
		return DataUtil.toBigDecimal(super.getByIndex(INDEX_MANAGERDEPT, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getManagerdept <em>Managerdept</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Managerdept</em>' attribute.
	 * @see #getManagerdept()
	 */
	public void setManagerdept(BigDecimal managerdept) {
		super.setByIndex(INDEX_MANAGERDEPT, managerdept);
	}

	/**
	 * Returns the value of the '<em><b>Managerdeptname</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Managerdeptname</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Managerdeptname</em>' attribute.
	 * @see #setManagerdeptname(java.lang.String)
	 */
	public String getManagerdeptname() {
		return DataUtil.toString(super.getByIndex(INDEX_MANAGERDEPTNAME, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getManagerdeptname <em>Managerdeptname</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Managerdeptname</em>' attribute.
	 * @see #getManagerdeptname()
	 */
	public void setManagerdeptname(String managerdeptname) {
		super.setByIndex(INDEX_MANAGERDEPTNAME, managerdeptname);
	}

	/**
	 * Returns the value of the '<em><b>Processinstid</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Processinstid</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Processinstid</em>' attribute.
	 * @see #setProcessinstid(java.math.BigDecimal)
	 */
	public BigDecimal getProcessinstid() {
		return DataUtil.toBigDecimal(super.getByIndex(INDEX_PROCESSINSTID, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getProcessinstid <em>Processinstid</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Processinstid</em>' attribute.
	 * @see #getProcessinstid()
	 */
	public void setProcessinstid(BigDecimal processinstid) {
		super.setByIndex(INDEX_PROCESSINSTID, processinstid);
	}

	/**
	 * Returns the value of the '<em><b>Custjc</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Custjc</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Custjc</em>' attribute.
	 * @see #setCustjc(java.lang.String)
	 */
	public String getCustjc() {
		return DataUtil.toString(super.getByIndex(INDEX_CUSTJC, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getCustjc <em>Custjc</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Custjc</em>' attribute.
	 * @see #getCustjc()
	 */
	public void setCustjc(String custjc) {
		super.setByIndex(INDEX_CUSTJC, custjc);
	}

	/**
	 * Returns the value of the '<em><b>Ocstartdate</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Ocstartdate</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Ocstartdate</em>' attribute.
	 * @see #setOcstartdate(java.util.Date)
	 */
	public Date getOcstartdate() {
		return DataUtil.toDate(super.getByIndex(INDEX_OCSTARTDATE, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getOcstartdate <em>Ocstartdate</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Ocstartdate</em>' attribute.
	 * @see #getOcstartdate()
	 */
	public void setOcstartdate(Date ocstartdate) {
		super.setByIndex(INDEX_OCSTARTDATE, ocstartdate);
	}

	/**
	 * Returns the value of the '<em><b>Ocenddate</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Ocenddate</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Ocenddate</em>' attribute.
	 * @see #setOcenddate(java.util.Date)
	 */
	public Date getOcenddate() {
		return DataUtil.toDate(super.getByIndex(INDEX_OCENDDATE, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getOcenddate <em>Ocenddate</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Ocenddate</em>' attribute.
	 * @see #getOcenddate()
	 */
	public void setOcenddate(Date ocenddate) {
		super.setByIndex(INDEX_OCENDDATE, ocenddate);
	}

	/**
	 * Returns the value of the '<em><b>ProdVerId</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>ProdVerId</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>ProdVerId</em>' attribute.
	 * @see #setProdVerId(java.math.BigDecimal)
	 */
	public BigDecimal getProdVerId() {
		return DataUtil.toBigDecimal(super.getByIndex(INDEX_PRODVERID, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getProdVerId <em>ProdVerId</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>ProdVerId</em>' attribute.
	 * @see #getProdVerId()
	 */
	public void setProdVerId(BigDecimal prodVerId) {
		super.setByIndex(INDEX_PRODVERID, prodVerId);
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
	 * Returns the value of the '<em><b>Saleid</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Saleid</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Saleid</em>' attribute.
	 * @see #setSaleid(java.math.BigDecimal)
	 */
	public BigDecimal getSaleid() {
		return DataUtil.toBigDecimal(super.getByIndex(INDEX_SALEID, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getSaleid <em>Saleid</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Saleid</em>' attribute.
	 * @see #getSaleid()
	 */
	public void setSaleid(BigDecimal saleid) {
		super.setByIndex(INDEX_SALEID, saleid);
	}

	/**
	 * Returns the value of the '<em><b>Pricetype</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Pricetype</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Pricetype</em>' attribute.
	 * @see #setPricetype(java.lang.String)
	 */
	public String getPricetype() {
		return DataUtil.toString(super.getByIndex(INDEX_PRICETYPE, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getPricetype <em>Pricetype</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Pricetype</em>' attribute.
	 * @see #getPricetype()
	 */
	public void setPricetype(String pricetype) {
		super.setByIndex(INDEX_PRICETYPE, pricetype);
	}

	/**
	 * Returns the value of the '<em><b>Ispassfz</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Ispassfz</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Ispassfz</em>' attribute.
	 * @see #setIspassfz(java.lang.String)
	 */
	public String getIspassfz() {
		return DataUtil.toString(super.getByIndex(INDEX_ISPASSFZ, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getIspassfz <em>Ispassfz</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Ispassfz</em>' attribute.
	 * @see #getIspassfz()
	 */
	public void setIspassfz(String ispassfz) {
		super.setByIndex(INDEX_ISPASSFZ, ispassfz);
	}

	/**
	 * Returns the value of the '<em><b>Issendfzmail</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Issendfzmail</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Issendfzmail</em>' attribute.
	 * @see #setIssendfzmail(java.lang.String)
	 */
	public String getIssendfzmail() {
		return DataUtil.toString(super.getByIndex(INDEX_ISSENDFZMAIL, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getIssendfzmail <em>Issendfzmail</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Issendfzmail</em>' attribute.
	 * @see #getIssendfzmail()
	 */
	public void setIssendfzmail(String issendfzmail) {
		super.setByIndex(INDEX_ISSENDFZMAIL, issendfzmail);
	}

	/**
	 * Returns the value of the '<em><b>Issendbudmail</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Issendbudmail</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Issendbudmail</em>' attribute.
	 * @see #setIssendbudmail(java.lang.String)
	 */
	public String getIssendbudmail() {
		return DataUtil.toString(super.getByIndex(INDEX_ISSENDBUDMAIL, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getIssendbudmail <em>Issendbudmail</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Issendbudmail</em>' attribute.
	 * @see #getIssendbudmail()
	 */
	public void setIssendbudmail(String issendbudmail) {
		super.setByIndex(INDEX_ISSENDBUDMAIL, issendbudmail);
	}

	/**
	 * Returns the value of the '<em><b>Remindfz</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Remindfz</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Remindfz</em>' attribute.
	 * @see #setRemindfz(java.math.BigDecimal)
	 */
	public BigDecimal getRemindfz() {
		return DataUtil.toBigDecimal(super.getByIndex(INDEX_REMINDFZ, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getRemindfz <em>Remindfz</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Remindfz</em>' attribute.
	 * @see #getRemindfz()
	 */
	public void setRemindfz(BigDecimal remindfz) {
		super.setByIndex(INDEX_REMINDFZ, remindfz);
	}

	/**
	 * Returns the value of the '<em><b>Startdate</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Startdate</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Startdate</em>' attribute.
	 * @see #setStartdate(java.util.Date)
	 */
	public Date getStartdate() {
		return DataUtil.toDate(super.getByIndex(INDEX_STARTDATE, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getStartdate <em>Startdate</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Startdate</em>' attribute.
	 * @see #getStartdate()
	 */
	public void setStartdate(Date startdate) {
		super.setByIndex(INDEX_STARTDATE, startdate);
	}

	/**
	 * Returns the value of the '<em><b>Enddate</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Enddate</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Enddate</em>' attribute.
	 * @see #setEnddate(java.util.Date)
	 */
	public Date getEnddate() {
		return DataUtil.toDate(super.getByIndex(INDEX_ENDDATE, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getEnddate <em>Enddate</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Enddate</em>' attribute.
	 * @see #getEnddate()
	 */
	public void setEnddate(Date enddate) {
		super.setByIndex(INDEX_ENDDATE, enddate);
	}

	/**
	 * Returns the value of the '<em><b>Projectno</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Projectno</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Projectno</em>' attribute.
	 * @see #setProjectno(java.lang.String)
	 */
	public String getProjectno() {
		return DataUtil.toString(super.getByIndex(INDEX_PROJECTNO, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getProjectno <em>Projectno</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Projectno</em>' attribute.
	 * @see #getProjectno()
	 */
	public void setProjectno(String projectno) {
		super.setByIndex(INDEX_PROJECTNO, projectno);
	}

	/**
	 * Returns the value of the '<em><b>Remark</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Remark</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Remark</em>' attribute.
	 * @see #setRemark(java.lang.String)
	 */
	public String getRemark() {
		return DataUtil.toString(super.getByIndex(INDEX_REMARK, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getRemark <em>Remark</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Remark</em>' attribute.
	 * @see #getRemark()
	 */
	public void setRemark(String remark) {
		super.setByIndex(INDEX_REMARK, remark);
	}

	/**
	 * Returns the value of the '<em><b>Expenddate</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Expenddate</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Expenddate</em>' attribute.
	 * @see #setExpenddate(java.util.Date)
	 */
	public Date getExpenddate() {
		return DataUtil.toDate(super.getByIndex(INDEX_EXPENDDATE, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getExpenddate <em>Expenddate</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Expenddate</em>' attribute.
	 * @see #getExpenddate()
	 */
	public void setExpenddate(Date expenddate) {
		super.setByIndex(INDEX_EXPENDDATE, expenddate);
	}

	/**
	 * Returns the value of the '<em><b>Outcontractid</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Outcontractid</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Outcontractid</em>' attribute.
	 * @see #setOutcontractid(java.math.BigDecimal)
	 */
	public BigDecimal getOutcontractid() {
		return DataUtil.toBigDecimal(super.getByIndex(INDEX_OUTCONTRACTID, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getOutcontractid <em>Outcontractid</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Outcontractid</em>' attribute.
	 * @see #getOutcontractid()
	 */
	public void setOutcontractid(BigDecimal outcontractid) {
		super.setByIndex(INDEX_OUTCONTRACTID, outcontractid);
	}

	/**
	 * Returns the value of the '<em><b>Cbversion</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Cbversion</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Cbversion</em>' attribute.
	 * @see #setCbversion(java.lang.String)
	 */
	public String getCbversion() {
		return DataUtil.toString(super.getByIndex(INDEX_CBVERSION, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getCbversion <em>Cbversion</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Cbversion</em>' attribute.
	 * @see #getCbversion()
	 */
	public void setCbversion(String cbversion) {
		super.setByIndex(INDEX_CBVERSION, cbversion);
	}

	/**
	 * Returns the value of the '<em><b>Pcosttype</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Pcosttype</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Pcosttype</em>' attribute.
	 * @see #setPcosttype(java.lang.String)
	 */
	public String getPcosttype() {
		return DataUtil.toString(super.getByIndex(INDEX_PCOSTTYPE, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getPcosttype <em>Pcosttype</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Pcosttype</em>' attribute.
	 * @see #getPcosttype()
	 */
	public void setPcosttype(String pcosttype) {
		super.setByIndex(INDEX_PCOSTTYPE, pcosttype);
	}

	/**
	 * Returns the value of the '<em><b>Longitude</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Longitude</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Longitude</em>' attribute.
	 * @see #setLongitude(java.lang.String)
	 */
	public String getLongitude() {
		return DataUtil.toString(super.getByIndex(INDEX_LONGITUDE, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getLongitude <em>Longitude</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Longitude</em>' attribute.
	 * @see #getLongitude()
	 */
	public void setLongitude(String longitude) {
		super.setByIndex(INDEX_LONGITUDE, longitude);
	}

	/**
	 * Returns the value of the '<em><b>Latitude</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Latitude</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Latitude</em>' attribute.
	 * @see #setLatitude(java.lang.String)
	 */
	public String getLatitude() {
		return DataUtil.toString(super.getByIndex(INDEX_LATITUDE, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getLatitude <em>Latitude</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Latitude</em>' attribute.
	 * @see #getLatitude()
	 */
	public void setLatitude(String latitude) {
		super.setByIndex(INDEX_LATITUDE, latitude);
	}

	/**
	 * Returns the value of the '<em><b>Checkplace</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Checkplace</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Checkplace</em>' attribute.
	 * @see #setCheckplace(java.lang.String)
	 */
	public String getCheckplace() {
		return DataUtil.toString(super.getByIndex(INDEX_CHECKPLACE, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getCheckplace <em>Checkplace</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Checkplace</em>' attribute.
	 * @see #getCheckplace()
	 */
	public void setCheckplace(String checkplace) {
		super.setByIndex(INDEX_CHECKPLACE, checkplace);
	}

	/**
	 * Returns the value of the '<em><b>Contplandate</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Contplandate</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Contplandate</em>' attribute.
	 * @see #setContplandate(java.util.Date)
	 */
	public Date getContplandate() {
		return DataUtil.toDate(super.getByIndex(INDEX_CONTPLANDATE, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getContplandate <em>Contplandate</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Contplandate</em>' attribute.
	 * @see #getContplandate()
	 */
	public void setContplandate(Date contplandate) {
		super.setByIndex(INDEX_CONTPLANDATE, contplandate);
	}

	/**
	 * Returns the value of the '<em><b>Lastupdatetime</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Lastupdatetime</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Lastupdatetime</em>' attribute.
	 * @see #setLastupdatetime(java.util.Date)
	 */
	public Date getLastupdatetime() {
		return DataUtil.toDate(super.getByIndex(INDEX_LASTUPDATETIME, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getLastupdatetime <em>Lastupdatetime</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Lastupdatetime</em>' attribute.
	 * @see #getLastupdatetime()
	 */
	public void setLastupdatetime(Date lastupdatetime) {
		super.setByIndex(INDEX_LASTUPDATETIME, lastupdatetime);
	}

	/**
	 * Returns the value of the '<em><b>Lastupdateman</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Lastupdateman</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Lastupdateman</em>' attribute.
	 * @see #setLastupdateman(java.lang.String)
	 */
	public String getLastupdateman() {
		return DataUtil.toString(super.getByIndex(INDEX_LASTUPDATEMAN, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getLastupdateman <em>Lastupdateman</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Lastupdateman</em>' attribute.
	 * @see #getLastupdateman()
	 */
	public void setLastupdateman(String lastupdateman) {
		super.setByIndex(INDEX_LASTUPDATEMAN, lastupdateman);
	}

	/**
	 * Returns the value of the '<em><b>Maincontnum</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Maincontnum</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Maincontnum</em>' attribute.
	 * @see #setMaincontnum(java.lang.String)
	 */
	public String getMaincontnum() {
		return DataUtil.toString(super.getByIndex(INDEX_MAINCONTNUM, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getMaincontnum <em>Maincontnum</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Maincontnum</em>' attribute.
	 * @see #getMaincontnum()
	 */
	public void setMaincontnum(String maincontnum) {
		super.setByIndex(INDEX_MAINCONTNUM, maincontnum);
	}

	/**
	 * Returns the value of the '<em><b>Managerdeptseq</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Managerdeptseq</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Managerdeptseq</em>' attribute.
	 * @see #setManagerdeptseq(java.lang.String)
	 */
	public String getManagerdeptseq() {
		return DataUtil.toString(super.getByIndex(INDEX_MANAGERDEPTSEQ, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getManagerdeptseq <em>Managerdeptseq</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Managerdeptseq</em>' attribute.
	 * @see #getManagerdeptseq()
	 */
	public void setManagerdeptseq(String managerdeptseq) {
		super.setByIndex(INDEX_MANAGERDEPTSEQ, managerdeptseq);
	}

	/**
	 * Returns the value of the '<em><b>Ptime</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Ptime</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Ptime</em>' attribute.
	 * @see #setPtime(java.util.Date)
	 */
	public Date getPtime() {
		return DataUtil.toDate(super.getByIndex(INDEX_PTIME, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getPtime <em>Ptime</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Ptime</em>' attribute.
	 * @see #getPtime()
	 */
	public void setPtime(Date ptime) {
		super.setByIndex(INDEX_PTIME, ptime);
	}


}