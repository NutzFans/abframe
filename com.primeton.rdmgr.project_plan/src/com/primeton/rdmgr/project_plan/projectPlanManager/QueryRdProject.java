/*******************************************************************************
 *
 * Copyright (c) 2001-2006 Primeton Technologies, Ltd.
 * All rights reserved.
 *
 * Created on Apr 11, 2008
 *******************************************************************************/
package com.primeton.rdmgr.project_plan.projectPlanManager;

import com.eos.data.sdo.IObjectFactory;

import commonj.sdo.DataObject;
import commonj.sdo.Type;
import commonj.sdo.helper.DataFactory;
import commonj.sdo.helper.TypeHelper;

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
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.QueryRdProject#getProjectName <em>ProjectName</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.QueryRdProject#getProjectType <em>ProjectType</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.QueryRdProject#getFinUnitId <em>FinUnitId</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.QueryRdProject#getOrgname <em>Orgname</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.QueryRdProject#getManager <em>Manager</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.QueryRdProject#getManagername <em>Managername</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.QueryRdProject#getProjectStatus <em>ProjectStatus</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.QueryRdProject#getOutstatus <em>Outstatus</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.QueryRdProject#getCustid <em>Custid</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.QueryRdProject#getCustname <em>Custname</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.QueryRdProject#getIspassbud <em>Ispassbud</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.QueryRdProject#getCreatedate <em>Createdate</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.QueryRdProject#getClosedate <em>Closedate</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.QueryRdProject#getLastcostdate <em>Lastcostdate</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.QueryRdProject#getImplementcity <em>Implementcity</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.QueryRdProject#getIsconproj <em>Isconproj</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.QueryRdProject#getCheckstatus <em>Checkstatus</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.QueryRdProject#getProjectId <em>ProjectId</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.QueryRdProject#getOrgseq <em>Orgseq</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.QueryRdProject#getIshavewb <em>Ishavewb</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.QueryRdProject#getContnum <em>Contnum</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.QueryRdProject#getRuleid <em>Ruleid</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.QueryRdProject#getRulename <em>Rulename</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.QueryRdProject#getCreateapplicant <em>Createapplicant</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.QueryRdProject#getCreateapplicantname <em>Createapplicantname</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.QueryRdProject#getManagerdept <em>Managerdept</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.QueryRdProject#getManagerdeptname <em>Managerdeptname</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.QueryRdProject#getProcessinstid <em>Processinstid</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.QueryRdProject#getCustjc <em>Custjc</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.QueryRdProject#getOcstartdate <em>Ocstartdate</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.QueryRdProject#getOcenddate <em>Ocenddate</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.QueryRdProject#getProdVerId <em>ProdVerId</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.QueryRdProject#getIsTemplate <em>IsTemplate</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.QueryRdProject#getIsPublic <em>IsPublic</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.QueryRdProject#getSaleid <em>Saleid</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.QueryRdProject#getPricetype <em>Pricetype</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.QueryRdProject#getIspassfz <em>Ispassfz</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.QueryRdProject#getIssendfzmail <em>Issendfzmail</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.QueryRdProject#getIssendbudmail <em>Issendbudmail</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.QueryRdProject#getRemindfz <em>Remindfz</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.QueryRdProject#getStartdate <em>Startdate</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.QueryRdProject#getEnddate <em>Enddate</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.QueryRdProject#getProjectno <em>Projectno</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.QueryRdProject#getRemark <em>Remark</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.QueryRdProject#getExpenddate <em>Expenddate</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.QueryRdProject#getOutcontractid <em>Outcontractid</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.QueryRdProject#getCbversion <em>Cbversion</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.QueryRdProject#getPcosttype <em>Pcosttype</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.QueryRdProject#getLongitude <em>Longitude</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.QueryRdProject#getLatitude <em>Latitude</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.QueryRdProject#getCheckplace <em>Checkplace</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.QueryRdProject#getContplandate <em>Contplandate</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.QueryRdProject#getLastupdatetime <em>Lastupdatetime</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.QueryRdProject#getLastupdateman <em>Lastupdateman</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.QueryRdProject#getMaincontnum <em>Maincontnum</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.QueryRdProject#getManagerdeptseq <em>Managerdeptseq</em>}</li>
 *   <li>{@link com.primeton.rdmgr.project_plan.projectPlanManager.QueryRdProject#getPtime <em>Ptime</em>}</li>
 * </ul>
 * </p>
 *
 * @extends DataObject;
 */
public interface QueryRdProject extends DataObject {

	public static final String QNAME = "com.primeton.rdmgr.project_plan.projectPlanManager.QueryRdProject";

	public static final Type TYPE = TypeHelper.INSTANCE.getType("com.primeton.rdmgr.project_plan.projectPlanManager", "QueryRdProject");

	public static final IObjectFactory<QueryRdProject> FACTORY = new IObjectFactory<QueryRdProject>() {
		public QueryRdProject create() {
			return (QueryRdProject) DataFactory.INSTANCE.create(TYPE);
		}
	};

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
	 * Sets the value of the '{@link com.primeton.rdmgr.project_plan.projectPlanManager.QueryRdProject#getProjectName <em>ProjectName</em>}' attribute.
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
	 * Sets the value of the '{@link com.primeton.rdmgr.project_plan.projectPlanManager.QueryRdProject#getProjectType <em>ProjectType</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>ProjectType</em>' attribute.
	 * @see #getProjectType()
	 */
	public void setProjectType(String projectType);

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
	public BigDecimal getFinUnitId();

	/**
	 * Sets the value of the '{@link com.primeton.rdmgr.project_plan.projectPlanManager.QueryRdProject#getFinUnitId <em>FinUnitId</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>FinUnitId</em>' attribute.
	 * @see #getFinUnitId()
	 */
	public void setFinUnitId(BigDecimal finUnitId);

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
	public String getOrgname();

	/**
	 * Sets the value of the '{@link com.primeton.rdmgr.project_plan.projectPlanManager.QueryRdProject#getOrgname <em>Orgname</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Orgname</em>' attribute.
	 * @see #getOrgname()
	 */
	public void setOrgname(String orgname);

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
	public String getManager();

	/**
	 * Sets the value of the '{@link com.primeton.rdmgr.project_plan.projectPlanManager.QueryRdProject#getManager <em>Manager</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Manager</em>' attribute.
	 * @see #getManager()
	 */
	public void setManager(String manager);

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
	public String getManagername();

	/**
	 * Sets the value of the '{@link com.primeton.rdmgr.project_plan.projectPlanManager.QueryRdProject#getManagername <em>Managername</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Managername</em>' attribute.
	 * @see #getManagername()
	 */
	public void setManagername(String managername);

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
	 * Sets the value of the '{@link com.primeton.rdmgr.project_plan.projectPlanManager.QueryRdProject#getProjectStatus <em>ProjectStatus</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>ProjectStatus</em>' attribute.
	 * @see #getProjectStatus()
	 */
	public void setProjectStatus(String projectStatus);

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
	public String getOutstatus();

	/**
	 * Sets the value of the '{@link com.primeton.rdmgr.project_plan.projectPlanManager.QueryRdProject#getOutstatus <em>Outstatus</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Outstatus</em>' attribute.
	 * @see #getOutstatus()
	 */
	public void setOutstatus(String outstatus);

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
	public BigDecimal getCustid();

	/**
	 * Sets the value of the '{@link com.primeton.rdmgr.project_plan.projectPlanManager.QueryRdProject#getCustid <em>Custid</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Custid</em>' attribute.
	 * @see #getCustid()
	 */
	public void setCustid(BigDecimal custid);

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
	public String getCustname();

	/**
	 * Sets the value of the '{@link com.primeton.rdmgr.project_plan.projectPlanManager.QueryRdProject#getCustname <em>Custname</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Custname</em>' attribute.
	 * @see #getCustname()
	 */
	public void setCustname(String custname);

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
	public String getIspassbud();

	/**
	 * Sets the value of the '{@link com.primeton.rdmgr.project_plan.projectPlanManager.QueryRdProject#getIspassbud <em>Ispassbud</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Ispassbud</em>' attribute.
	 * @see #getIspassbud()
	 */
	public void setIspassbud(String ispassbud);

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
	public Date getCreatedate();

	/**
	 * Sets the value of the '{@link com.primeton.rdmgr.project_plan.projectPlanManager.QueryRdProject#getCreatedate <em>Createdate</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Createdate</em>' attribute.
	 * @see #getCreatedate()
	 */
	public void setCreatedate(Date createdate);

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
	public Date getClosedate();

	/**
	 * Sets the value of the '{@link com.primeton.rdmgr.project_plan.projectPlanManager.QueryRdProject#getClosedate <em>Closedate</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Closedate</em>' attribute.
	 * @see #getClosedate()
	 */
	public void setClosedate(Date closedate);

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
	public Date getLastcostdate();

	/**
	 * Sets the value of the '{@link com.primeton.rdmgr.project_plan.projectPlanManager.QueryRdProject#getLastcostdate <em>Lastcostdate</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Lastcostdate</em>' attribute.
	 * @see #getLastcostdate()
	 */
	public void setLastcostdate(Date lastcostdate);

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
	public String getImplementcity();

	/**
	 * Sets the value of the '{@link com.primeton.rdmgr.project_plan.projectPlanManager.QueryRdProject#getImplementcity <em>Implementcity</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Implementcity</em>' attribute.
	 * @see #getImplementcity()
	 */
	public void setImplementcity(String implementcity);

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
	public String getIsconproj();

	/**
	 * Sets the value of the '{@link com.primeton.rdmgr.project_plan.projectPlanManager.QueryRdProject#getIsconproj <em>Isconproj</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Isconproj</em>' attribute.
	 * @see #getIsconproj()
	 */
	public void setIsconproj(String isconproj);

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
	public String getCheckstatus();

	/**
	 * Sets the value of the '{@link com.primeton.rdmgr.project_plan.projectPlanManager.QueryRdProject#getCheckstatus <em>Checkstatus</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Checkstatus</em>' attribute.
	 * @see #getCheckstatus()
	 */
	public void setCheckstatus(String checkstatus);

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
	public BigDecimal getProjectId();

	/**
	 * Sets the value of the '{@link com.primeton.rdmgr.project_plan.projectPlanManager.QueryRdProject#getProjectId <em>ProjectId</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>ProjectId</em>' attribute.
	 * @see #getProjectId()
	 */
	public void setProjectId(BigDecimal projectId);

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
	public String getOrgseq();

	/**
	 * Sets the value of the '{@link com.primeton.rdmgr.project_plan.projectPlanManager.QueryRdProject#getOrgseq <em>Orgseq</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Orgseq</em>' attribute.
	 * @see #getOrgseq()
	 */
	public void setOrgseq(String orgseq);

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
	public int getIshavewb();

	/**
	 * Sets the value of the '{@link com.primeton.rdmgr.project_plan.projectPlanManager.QueryRdProject#getIshavewb <em>Ishavewb</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Ishavewb</em>' attribute.
	 * @see #getIshavewb()
	 */
	public void setIshavewb(int ishavewb);

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
	public String getContnum();

	/**
	 * Sets the value of the '{@link com.primeton.rdmgr.project_plan.projectPlanManager.QueryRdProject#getContnum <em>Contnum</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Contnum</em>' attribute.
	 * @see #getContnum()
	 */
	public void setContnum(String contnum);

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
	public BigDecimal getRuleid();

	/**
	 * Sets the value of the '{@link com.primeton.rdmgr.project_plan.projectPlanManager.QueryRdProject#getRuleid <em>Ruleid</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Ruleid</em>' attribute.
	 * @see #getRuleid()
	 */
	public void setRuleid(BigDecimal ruleid);

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
	public String getRulename();

	/**
	 * Sets the value of the '{@link com.primeton.rdmgr.project_plan.projectPlanManager.QueryRdProject#getRulename <em>Rulename</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Rulename</em>' attribute.
	 * @see #getRulename()
	 */
	public void setRulename(String rulename);

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
	public String getCreateapplicant();

	/**
	 * Sets the value of the '{@link com.primeton.rdmgr.project_plan.projectPlanManager.QueryRdProject#getCreateapplicant <em>Createapplicant</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Createapplicant</em>' attribute.
	 * @see #getCreateapplicant()
	 */
	public void setCreateapplicant(String createapplicant);

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
	public String getCreateapplicantname();

	/**
	 * Sets the value of the '{@link com.primeton.rdmgr.project_plan.projectPlanManager.QueryRdProject#getCreateapplicantname <em>Createapplicantname</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Createapplicantname</em>' attribute.
	 * @see #getCreateapplicantname()
	 */
	public void setCreateapplicantname(String createapplicantname);

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
	public BigDecimal getManagerdept();

	/**
	 * Sets the value of the '{@link com.primeton.rdmgr.project_plan.projectPlanManager.QueryRdProject#getManagerdept <em>Managerdept</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Managerdept</em>' attribute.
	 * @see #getManagerdept()
	 */
	public void setManagerdept(BigDecimal managerdept);

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
	public String getManagerdeptname();

	/**
	 * Sets the value of the '{@link com.primeton.rdmgr.project_plan.projectPlanManager.QueryRdProject#getManagerdeptname <em>Managerdeptname</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Managerdeptname</em>' attribute.
	 * @see #getManagerdeptname()
	 */
	public void setManagerdeptname(String managerdeptname);

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
	public BigDecimal getProcessinstid();

	/**
	 * Sets the value of the '{@link com.primeton.rdmgr.project_plan.projectPlanManager.QueryRdProject#getProcessinstid <em>Processinstid</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Processinstid</em>' attribute.
	 * @see #getProcessinstid()
	 */
	public void setProcessinstid(BigDecimal processinstid);

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
	public String getCustjc();

	/**
	 * Sets the value of the '{@link com.primeton.rdmgr.project_plan.projectPlanManager.QueryRdProject#getCustjc <em>Custjc</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Custjc</em>' attribute.
	 * @see #getCustjc()
	 */
	public void setCustjc(String custjc);

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
	public Date getOcstartdate();

	/**
	 * Sets the value of the '{@link com.primeton.rdmgr.project_plan.projectPlanManager.QueryRdProject#getOcstartdate <em>Ocstartdate</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Ocstartdate</em>' attribute.
	 * @see #getOcstartdate()
	 */
	public void setOcstartdate(Date ocstartdate);

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
	public Date getOcenddate();

	/**
	 * Sets the value of the '{@link com.primeton.rdmgr.project_plan.projectPlanManager.QueryRdProject#getOcenddate <em>Ocenddate</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Ocenddate</em>' attribute.
	 * @see #getOcenddate()
	 */
	public void setOcenddate(Date ocenddate);

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
	public BigDecimal getProdVerId();

	/**
	 * Sets the value of the '{@link com.primeton.rdmgr.project_plan.projectPlanManager.QueryRdProject#getProdVerId <em>ProdVerId</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>ProdVerId</em>' attribute.
	 * @see #getProdVerId()
	 */
	public void setProdVerId(BigDecimal prodVerId);

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
	 * Sets the value of the '{@link com.primeton.rdmgr.project_plan.projectPlanManager.QueryRdProject#getIsTemplate <em>IsTemplate</em>}' attribute.
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
	 * Sets the value of the '{@link com.primeton.rdmgr.project_plan.projectPlanManager.QueryRdProject#getIsPublic <em>IsPublic</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>IsPublic</em>' attribute.
	 * @see #getIsPublic()
	 */
	public void setIsPublic(String isPublic);

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
	public BigDecimal getSaleid();

	/**
	 * Sets the value of the '{@link com.primeton.rdmgr.project_plan.projectPlanManager.QueryRdProject#getSaleid <em>Saleid</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Saleid</em>' attribute.
	 * @see #getSaleid()
	 */
	public void setSaleid(BigDecimal saleid);

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
	public String getPricetype();

	/**
	 * Sets the value of the '{@link com.primeton.rdmgr.project_plan.projectPlanManager.QueryRdProject#getPricetype <em>Pricetype</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Pricetype</em>' attribute.
	 * @see #getPricetype()
	 */
	public void setPricetype(String pricetype);

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
	public String getIspassfz();

	/**
	 * Sets the value of the '{@link com.primeton.rdmgr.project_plan.projectPlanManager.QueryRdProject#getIspassfz <em>Ispassfz</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Ispassfz</em>' attribute.
	 * @see #getIspassfz()
	 */
	public void setIspassfz(String ispassfz);

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
	public String getIssendfzmail();

	/**
	 * Sets the value of the '{@link com.primeton.rdmgr.project_plan.projectPlanManager.QueryRdProject#getIssendfzmail <em>Issendfzmail</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Issendfzmail</em>' attribute.
	 * @see #getIssendfzmail()
	 */
	public void setIssendfzmail(String issendfzmail);

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
	public String getIssendbudmail();

	/**
	 * Sets the value of the '{@link com.primeton.rdmgr.project_plan.projectPlanManager.QueryRdProject#getIssendbudmail <em>Issendbudmail</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Issendbudmail</em>' attribute.
	 * @see #getIssendbudmail()
	 */
	public void setIssendbudmail(String issendbudmail);

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
	public BigDecimal getRemindfz();

	/**
	 * Sets the value of the '{@link com.primeton.rdmgr.project_plan.projectPlanManager.QueryRdProject#getRemindfz <em>Remindfz</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Remindfz</em>' attribute.
	 * @see #getRemindfz()
	 */
	public void setRemindfz(BigDecimal remindfz);

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
	public Date getStartdate();

	/**
	 * Sets the value of the '{@link com.primeton.rdmgr.project_plan.projectPlanManager.QueryRdProject#getStartdate <em>Startdate</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Startdate</em>' attribute.
	 * @see #getStartdate()
	 */
	public void setStartdate(Date startdate);

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
	public Date getEnddate();

	/**
	 * Sets the value of the '{@link com.primeton.rdmgr.project_plan.projectPlanManager.QueryRdProject#getEnddate <em>Enddate</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Enddate</em>' attribute.
	 * @see #getEnddate()
	 */
	public void setEnddate(Date enddate);

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
	public String getProjectno();

	/**
	 * Sets the value of the '{@link com.primeton.rdmgr.project_plan.projectPlanManager.QueryRdProject#getProjectno <em>Projectno</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Projectno</em>' attribute.
	 * @see #getProjectno()
	 */
	public void setProjectno(String projectno);

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
	public String getRemark();

	/**
	 * Sets the value of the '{@link com.primeton.rdmgr.project_plan.projectPlanManager.QueryRdProject#getRemark <em>Remark</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Remark</em>' attribute.
	 * @see #getRemark()
	 */
	public void setRemark(String remark);

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
	public Date getExpenddate();

	/**
	 * Sets the value of the '{@link com.primeton.rdmgr.project_plan.projectPlanManager.QueryRdProject#getExpenddate <em>Expenddate</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Expenddate</em>' attribute.
	 * @see #getExpenddate()
	 */
	public void setExpenddate(Date expenddate);

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
	public BigDecimal getOutcontractid();

	/**
	 * Sets the value of the '{@link com.primeton.rdmgr.project_plan.projectPlanManager.QueryRdProject#getOutcontractid <em>Outcontractid</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Outcontractid</em>' attribute.
	 * @see #getOutcontractid()
	 */
	public void setOutcontractid(BigDecimal outcontractid);

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
	public String getCbversion();

	/**
	 * Sets the value of the '{@link com.primeton.rdmgr.project_plan.projectPlanManager.QueryRdProject#getCbversion <em>Cbversion</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Cbversion</em>' attribute.
	 * @see #getCbversion()
	 */
	public void setCbversion(String cbversion);

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
	public String getPcosttype();

	/**
	 * Sets the value of the '{@link com.primeton.rdmgr.project_plan.projectPlanManager.QueryRdProject#getPcosttype <em>Pcosttype</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Pcosttype</em>' attribute.
	 * @see #getPcosttype()
	 */
	public void setPcosttype(String pcosttype);

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
	public String getLongitude();

	/**
	 * Sets the value of the '{@link com.primeton.rdmgr.project_plan.projectPlanManager.QueryRdProject#getLongitude <em>Longitude</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Longitude</em>' attribute.
	 * @see #getLongitude()
	 */
	public void setLongitude(String longitude);

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
	public String getLatitude();

	/**
	 * Sets the value of the '{@link com.primeton.rdmgr.project_plan.projectPlanManager.QueryRdProject#getLatitude <em>Latitude</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Latitude</em>' attribute.
	 * @see #getLatitude()
	 */
	public void setLatitude(String latitude);

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
	public String getCheckplace();

	/**
	 * Sets the value of the '{@link com.primeton.rdmgr.project_plan.projectPlanManager.QueryRdProject#getCheckplace <em>Checkplace</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Checkplace</em>' attribute.
	 * @see #getCheckplace()
	 */
	public void setCheckplace(String checkplace);

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
	public Date getContplandate();

	/**
	 * Sets the value of the '{@link com.primeton.rdmgr.project_plan.projectPlanManager.QueryRdProject#getContplandate <em>Contplandate</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Contplandate</em>' attribute.
	 * @see #getContplandate()
	 */
	public void setContplandate(Date contplandate);

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
	public Date getLastupdatetime();

	/**
	 * Sets the value of the '{@link com.primeton.rdmgr.project_plan.projectPlanManager.QueryRdProject#getLastupdatetime <em>Lastupdatetime</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Lastupdatetime</em>' attribute.
	 * @see #getLastupdatetime()
	 */
	public void setLastupdatetime(Date lastupdatetime);

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
	public String getLastupdateman();

	/**
	 * Sets the value of the '{@link com.primeton.rdmgr.project_plan.projectPlanManager.QueryRdProject#getLastupdateman <em>Lastupdateman</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Lastupdateman</em>' attribute.
	 * @see #getLastupdateman()
	 */
	public void setLastupdateman(String lastupdateman);

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
	public String getMaincontnum();

	/**
	 * Sets the value of the '{@link com.primeton.rdmgr.project_plan.projectPlanManager.QueryRdProject#getMaincontnum <em>Maincontnum</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Maincontnum</em>' attribute.
	 * @see #getMaincontnum()
	 */
	public void setMaincontnum(String maincontnum);

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
	public String getManagerdeptseq();

	/**
	 * Sets the value of the '{@link com.primeton.rdmgr.project_plan.projectPlanManager.QueryRdProject#getManagerdeptseq <em>Managerdeptseq</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Managerdeptseq</em>' attribute.
	 * @see #getManagerdeptseq()
	 */
	public void setManagerdeptseq(String managerdeptseq);

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
	public Date getPtime();

	/**
	 * Sets the value of the '{@link com.primeton.rdmgr.project_plan.projectPlanManager.QueryRdProject#getPtime <em>Ptime</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Ptime</em>' attribute.
	 * @see #getPtime()
	 */
	public void setPtime(Date ptime);


}