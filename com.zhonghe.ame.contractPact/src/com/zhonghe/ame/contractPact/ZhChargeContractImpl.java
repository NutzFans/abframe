/*******************************************************************************
 *
 * Copyright (c) 2001-2006 Primeton Technologies, Ltd.
 * All rights reserved.
 *
 * Created on Apr 11, 2008
 *******************************************************************************/
package com.zhonghe.ame.contractPact;

import com.primeton.ext.data.sdo.DataUtil;
import com.primeton.ext.data.sdo.ExtendedDataObjectImpl;
import com.zhonghe.ame.chargeContract.chargeContract.ZhChargeContract;

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
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.impl.ZhChargeContractImpl#getId <em>Id</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.impl.ZhChargeContractImpl#getCreateUserid <em>CreateUserid</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.impl.ZhChargeContractImpl#getCreateTime <em>CreateTime</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.impl.ZhChargeContractImpl#getImplementOrg <em>ImplementOrg</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.impl.ZhChargeContractImpl#getContractName <em>ContractName</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.impl.ZhChargeContractImpl#getSignatory <em>Signatory</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.impl.ZhChargeContractImpl#getContractSum <em>ContractSum</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.impl.ZhChargeContractImpl#getProjectSize <em>ProjectSize</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.impl.ZhChargeContractImpl#getProjectLocal <em>ProjectLocal</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.impl.ZhChargeContractImpl#getStartTime <em>StartTime</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.impl.ZhChargeContractImpl#getEndTime <em>EndTime</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.impl.ZhChargeContractImpl#getAppStatus <em>AppStatus</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.impl.ZhChargeContractImpl#getProcessid <em>Processid</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.impl.ZhChargeContractImpl#getContractSubject <em>ContractSubject</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.impl.ZhChargeContractImpl#getContractNo <em>ContractNo</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.impl.ZhChargeContractImpl#getPayMethod <em>PayMethod</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.impl.ZhChargeContractImpl#getExecuteStatus <em>ExecuteStatus</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.impl.ZhChargeContractImpl#getOrganizer <em>Organizer</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.impl.ZhChargeContractImpl#getDevelopmentOrg <em>DevelopmentOrg</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.impl.ZhChargeContractImpl#getCachet <em>Cachet</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.impl.ZhChargeContractImpl#getPayee <em>Payee</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.impl.ZhChargeContractImpl#getSigningDate <em>SigningDate</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.impl.ZhChargeContractImpl#getContractPeriod <em>ContractPeriod</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.impl.ZhChargeContractImpl#getFinishTime <em>FinishTime</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.impl.ZhChargeContractImpl#getHeadquarterGroup <em>HeadquarterGroup</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.impl.ZhChargeContractImpl#getProjectType <em>ProjectType</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.impl.ZhChargeContractImpl#getMajor <em>Major</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.impl.ZhChargeContractImpl#getRelateCont <em>RelateCont</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.impl.ZhChargeContractImpl#getActContractSum <em>ActContractSum</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.impl.ZhChargeContractImpl#getIssupagreement <em>Issupagreement</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.impl.ZhChargeContractImpl#getRemark <em>Remark</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.impl.ZhChargeContractImpl#getIncreaseDecreaseSum <em>IncreaseDecreaseSum</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.impl.ZhChargeContractImpl#getCreateUsername <em>CreateUsername</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.impl.ZhChargeContractImpl#getUpdatedBy <em>UpdatedBy</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.impl.ZhChargeContractImpl#getUpdatedTime <em>UpdatedTime</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.impl.ZhChargeContractImpl#getRevision <em>Revision</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.impl.ZhChargeContractImpl#getCreatedOrgid <em>CreatedOrgid</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.impl.ZhChargeContractImpl#getImplementOrgname <em>ImplementOrgname</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.impl.ZhChargeContractImpl#getFDeptCountersignId <em>FDeptCountersignId</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.impl.ZhChargeContractImpl#getFDeptCountersignName <em>FDeptCountersignName</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.impl.ZhChargeContractImpl#getZDeptCountersignName <em>ZDeptCountersignName</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.impl.ZhChargeContractImpl#getZDeptCountersignId <em>ZDeptCountersignId</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.impl.ZhChargeContractImpl#getSignatoryname <em>Signatoryname</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.impl.ZhChargeContractImpl#getContractSecretLevel <em>ContractSecretLevel</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.impl.ZhChargeContractImpl#getProjectSecretLevel <em>ProjectSecretLevel</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.impl.ZhChargeContractImpl#getContractBalance <em>ContractBalance</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.impl.ZhChargeContractImpl#getProcurementType <em>ProcurementType</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.impl.ZhChargeContractImpl#getNoTaxSum <em>NoTaxSum</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.impl.ZhChargeContractImpl#getPayTax <em>PayTax</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.impl.ZhChargeContractImpl#getFinContractSum <em>FinContractSum</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.impl.ZhChargeContractImpl#getIsfb <em>Isfb</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.impl.ZhChargeContractImpl#getContractModel <em>ContractModel</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.impl.ZhChargeContractImpl#getTenderId <em>TenderId</em>}</li>
 * </ul>
 * </p>
 *
 * @extends ExtendedDataObjectImpl;
 *
 * @implements ZhChargeContract;
 */

public class ZhChargeContractImpl extends ExtendedDataObjectImpl implements com.zhonghe.ame.contractPact.ZhChargeContract {
	/**
	 * Comment for <code>serialVersionUID</code>
	 */
	private static final long serialVersionUID = 1L;
	public final static int INDEX_ID = 0;
	public final static int INDEX_CREATEUSERID = 1;
	public final static int INDEX_CREATETIME = 2;
	public final static int INDEX_IMPLEMENTORG = 3;
	public final static int INDEX_CONTRACTNAME = 4;
	public final static int INDEX_SIGNATORY = 5;
	public final static int INDEX_CONTRACTSUM = 6;
	public final static int INDEX_PROJECTSIZE = 7;
	public final static int INDEX_PROJECTLOCAL = 8;
	public final static int INDEX_STARTTIME = 9;
	public final static int INDEX_ENDTIME = 10;
	public final static int INDEX_APPSTATUS = 11;
	public final static int INDEX_PROCESSID = 12;
	public final static int INDEX_CONTRACTSUBJECT = 13;
	public final static int INDEX_CONTRACTNO = 14;
	public final static int INDEX_PAYMETHOD = 15;
	public final static int INDEX_EXECUTESTATUS = 16;
	public final static int INDEX_ORGANIZER = 17;
	public final static int INDEX_DEVELOPMENTORG = 18;
	public final static int INDEX_CACHET = 19;
	public final static int INDEX_PAYEE = 20;
	public final static int INDEX_SIGNINGDATE = 21;
	public final static int INDEX_CONTRACTPERIOD = 22;
	public final static int INDEX_FINISHTIME = 23;
	public final static int INDEX_HEADQUARTERGROUP = 24;
	public final static int INDEX_PROJECTTYPE = 25;
	public final static int INDEX_MAJOR = 26;
	public final static int INDEX_RELATECONT = 27;
	public final static int INDEX_ACTCONTRACTSUM = 28;
	public final static int INDEX_ISSUPAGREEMENT = 29;
	public final static int INDEX_REMARK = 30;
	public final static int INDEX_INCREASEDECREASESUM = 31;
	public final static int INDEX_CREATEUSERNAME = 32;
	public final static int INDEX_UPDATEDBY = 33;
	public final static int INDEX_UPDATEDTIME = 34;
	public final static int INDEX_REVISION = 35;
	public final static int INDEX_CREATEDORGID = 36;
	public final static int INDEX_IMPLEMENTORGNAME = 37;
	public final static int INDEX_FDEPTCOUNTERSIGNID = 38;
	public final static int INDEX_FDEPTCOUNTERSIGNNAME = 39;
	public final static int INDEX_ZDEPTCOUNTERSIGNNAME = 40;
	public final static int INDEX_ZDEPTCOUNTERSIGNID = 41;
	public final static int INDEX_SIGNATORYNAME = 42;
	public final static int INDEX_CONTRACTSECRETLEVEL = 43;
	public final static int INDEX_PROJECTSECRETLEVEL = 44;
	public final static int INDEX_CONTRACTBALANCE = 45;
	public final static int INDEX_PROCUREMENTTYPE = 46;
	public final static int INDEX_NOTAXSUM = 47;
	public final static int INDEX_PAYTAX = 48;
	public final static int INDEX_FINCONTRACTSUM = 49;
	public final static int INDEX_ISFB = 50;
	public final static int INDEX_CONTRACTMODEL = 51;
	public final static int INDEX_TENDERID = 52;
	public static final int SDO_PROPERTY_COUNT = 53;

	public static final int EXTENDED_PROPERTY_COUNT = -1;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 */
	public ZhChargeContractImpl() {
		this(TYPE);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 */
	public ZhChargeContractImpl(Type type) {
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
	 * Returns the value of the '<em><b>CreateUserid</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>CreateUserid</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>CreateUserid</em>' attribute.
	 * @see #setCreateUserid(java.lang.String)
	 */
	public String getCreateUserid() {
		return DataUtil.toString(super.getByIndex(INDEX_CREATEUSERID, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getCreateUserid <em>CreateUserid</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>CreateUserid</em>' attribute.
	 * @see #getCreateUserid()
	 */
	public void setCreateUserid(String createUserid) {
		super.setByIndex(INDEX_CREATEUSERID, createUserid);
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
	 * Returns the value of the '<em><b>ImplementOrg</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>ImplementOrg</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>ImplementOrg</em>' attribute.
	 * @see #setImplementOrg(java.lang.String)
	 */
	public String getImplementOrg() {
		return DataUtil.toString(super.getByIndex(INDEX_IMPLEMENTORG, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getImplementOrg <em>ImplementOrg</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>ImplementOrg</em>' attribute.
	 * @see #getImplementOrg()
	 */
	public void setImplementOrg(String implementOrg) {
		super.setByIndex(INDEX_IMPLEMENTORG, implementOrg);
	}

	/**
	 * Returns the value of the '<em><b>ContractName</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>ContractName</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>ContractName</em>' attribute.
	 * @see #setContractName(java.lang.String)
	 */
	public String getContractName() {
		return DataUtil.toString(super.getByIndex(INDEX_CONTRACTNAME, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getContractName <em>ContractName</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>ContractName</em>' attribute.
	 * @see #getContractName()
	 */
	public void setContractName(String contractName) {
		super.setByIndex(INDEX_CONTRACTNAME, contractName);
	}

	/**
	 * Returns the value of the '<em><b>Signatory</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Signatory</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Signatory</em>' attribute.
	 * @see #setSignatory(java.lang.String)
	 */
	public String getSignatory() {
		return DataUtil.toString(super.getByIndex(INDEX_SIGNATORY, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getSignatory <em>Signatory</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Signatory</em>' attribute.
	 * @see #getSignatory()
	 */
	public void setSignatory(String signatory) {
		super.setByIndex(INDEX_SIGNATORY, signatory);
	}

	/**
	 * Returns the value of the '<em><b>ContractSum</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>ContractSum</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>ContractSum</em>' attribute.
	 * @see #setContractSum(java.lang.String)
	 */
	public String getContractSum() {
		return DataUtil.toString(super.getByIndex(INDEX_CONTRACTSUM, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getContractSum <em>ContractSum</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>ContractSum</em>' attribute.
	 * @see #getContractSum()
	 */
	public void setContractSum(String contractSum) {
		super.setByIndex(INDEX_CONTRACTSUM, contractSum);
	}

	/**
	 * Returns the value of the '<em><b>ProjectSize</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>ProjectSize</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>ProjectSize</em>' attribute.
	 * @see #setProjectSize(java.lang.String)
	 */
	public String getProjectSize() {
		return DataUtil.toString(super.getByIndex(INDEX_PROJECTSIZE, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getProjectSize <em>ProjectSize</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>ProjectSize</em>' attribute.
	 * @see #getProjectSize()
	 */
	public void setProjectSize(String projectSize) {
		super.setByIndex(INDEX_PROJECTSIZE, projectSize);
	}

	/**
	 * Returns the value of the '<em><b>ProjectLocal</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>ProjectLocal</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>ProjectLocal</em>' attribute.
	 * @see #setProjectLocal(java.lang.String)
	 */
	public String getProjectLocal() {
		return DataUtil.toString(super.getByIndex(INDEX_PROJECTLOCAL, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getProjectLocal <em>ProjectLocal</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>ProjectLocal</em>' attribute.
	 * @see #getProjectLocal()
	 */
	public void setProjectLocal(String projectLocal) {
		super.setByIndex(INDEX_PROJECTLOCAL, projectLocal);
	}

	/**
	 * Returns the value of the '<em><b>StartTime</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>StartTime</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>StartTime</em>' attribute.
	 * @see #setStartTime(java.util.Date)
	 */
	public Date getStartTime() {
		return DataUtil.toDate(super.getByIndex(INDEX_STARTTIME, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getStartTime <em>StartTime</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>StartTime</em>' attribute.
	 * @see #getStartTime()
	 */
	public void setStartTime(Date startTime) {
		super.setByIndex(INDEX_STARTTIME, startTime);
	}

	/**
	 * Returns the value of the '<em><b>EndTime</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>EndTime</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>EndTime</em>' attribute.
	 * @see #setEndTime(java.util.Date)
	 */
	public Date getEndTime() {
		return DataUtil.toDate(super.getByIndex(INDEX_ENDTIME, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getEndTime <em>EndTime</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>EndTime</em>' attribute.
	 * @see #getEndTime()
	 */
	public void setEndTime(Date endTime) {
		super.setByIndex(INDEX_ENDTIME, endTime);
	}

	/**
	 * Returns the value of the '<em><b>AppStatus</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>AppStatus</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>AppStatus</em>' attribute.
	 * @see #setAppStatus(int)
	 */
	public int getAppStatus() {
		return DataUtil.toInt(super.getByIndex(INDEX_APPSTATUS, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getAppStatus <em>AppStatus</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>AppStatus</em>' attribute.
	 * @see #getAppStatus()
	 */
	public void setAppStatus(int appStatus) {
		super.setByIndex(INDEX_APPSTATUS, appStatus);
	}

	/**
	 * Returns the value of the '<em><b>Processid</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Processid</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Processid</em>' attribute.
	 * @see #setProcessid(int)
	 */
	public int getProcessid() {
		return DataUtil.toInt(super.getByIndex(INDEX_PROCESSID, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getProcessid <em>Processid</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Processid</em>' attribute.
	 * @see #getProcessid()
	 */
	public void setProcessid(int processid) {
		super.setByIndex(INDEX_PROCESSID, processid);
	}

	/**
	 * Returns the value of the '<em><b>ContractSubject</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>ContractSubject</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>ContractSubject</em>' attribute.
	 * @see #setContractSubject(java.lang.String)
	 */
	public String getContractSubject() {
		return DataUtil.toString(super.getByIndex(INDEX_CONTRACTSUBJECT, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getContractSubject <em>ContractSubject</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>ContractSubject</em>' attribute.
	 * @see #getContractSubject()
	 */
	public void setContractSubject(String contractSubject) {
		super.setByIndex(INDEX_CONTRACTSUBJECT, contractSubject);
	}

	/**
	 * Returns the value of the '<em><b>ContractNo</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>ContractNo</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>ContractNo</em>' attribute.
	 * @see #setContractNo(java.lang.String)
	 */
	public String getContractNo() {
		return DataUtil.toString(super.getByIndex(INDEX_CONTRACTNO, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getContractNo <em>ContractNo</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>ContractNo</em>' attribute.
	 * @see #getContractNo()
	 */
	public void setContractNo(String contractNo) {
		super.setByIndex(INDEX_CONTRACTNO, contractNo);
	}

	/**
	 * Returns the value of the '<em><b>PayMethod</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>PayMethod</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>PayMethod</em>' attribute.
	 * @see #setPayMethod(java.lang.String)
	 */
	public String getPayMethod() {
		return DataUtil.toString(super.getByIndex(INDEX_PAYMETHOD, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getPayMethod <em>PayMethod</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>PayMethod</em>' attribute.
	 * @see #getPayMethod()
	 */
	public void setPayMethod(String payMethod) {
		super.setByIndex(INDEX_PAYMETHOD, payMethod);
	}

	/**
	 * Returns the value of the '<em><b>ExecuteStatus</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>ExecuteStatus</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>ExecuteStatus</em>' attribute.
	 * @see #setExecuteStatus(java.lang.String)
	 */
	public String getExecuteStatus() {
		return DataUtil.toString(super.getByIndex(INDEX_EXECUTESTATUS, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getExecuteStatus <em>ExecuteStatus</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>ExecuteStatus</em>' attribute.
	 * @see #getExecuteStatus()
	 */
	public void setExecuteStatus(String executeStatus) {
		super.setByIndex(INDEX_EXECUTESTATUS, executeStatus);
	}

	/**
	 * Returns the value of the '<em><b>Organizer</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Organizer</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Organizer</em>' attribute.
	 * @see #setOrganizer(java.lang.String)
	 */
	public String getOrganizer() {
		return DataUtil.toString(super.getByIndex(INDEX_ORGANIZER, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getOrganizer <em>Organizer</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Organizer</em>' attribute.
	 * @see #getOrganizer()
	 */
	public void setOrganizer(String organizer) {
		super.setByIndex(INDEX_ORGANIZER, organizer);
	}

	/**
	 * Returns the value of the '<em><b>DevelopmentOrg</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>DevelopmentOrg</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>DevelopmentOrg</em>' attribute.
	 * @see #setDevelopmentOrg(java.lang.String)
	 */
	public String getDevelopmentOrg() {
		return DataUtil.toString(super.getByIndex(INDEX_DEVELOPMENTORG, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getDevelopmentOrg <em>DevelopmentOrg</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>DevelopmentOrg</em>' attribute.
	 * @see #getDevelopmentOrg()
	 */
	public void setDevelopmentOrg(String developmentOrg) {
		super.setByIndex(INDEX_DEVELOPMENTORG, developmentOrg);
	}

	/**
	 * Returns the value of the '<em><b>Cachet</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Cachet</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Cachet</em>' attribute.
	 * @see #setCachet(java.lang.String)
	 */
	public String getCachet() {
		return DataUtil.toString(super.getByIndex(INDEX_CACHET, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getCachet <em>Cachet</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Cachet</em>' attribute.
	 * @see #getCachet()
	 */
	public void setCachet(String cachet) {
		super.setByIndex(INDEX_CACHET, cachet);
	}

	/**
	 * Returns the value of the '<em><b>Payee</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Payee</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Payee</em>' attribute.
	 * @see #setPayee(java.lang.String)
	 */
	public String getPayee() {
		return DataUtil.toString(super.getByIndex(INDEX_PAYEE, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getPayee <em>Payee</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Payee</em>' attribute.
	 * @see #getPayee()
	 */
	public void setPayee(String payee) {
		super.setByIndex(INDEX_PAYEE, payee);
	}

	/**
	 * Returns the value of the '<em><b>SigningDate</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>SigningDate</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>SigningDate</em>' attribute.
	 * @see #setSigningDate(java.util.Date)
	 */
	public Date getSigningDate() {
		return DataUtil.toDate(super.getByIndex(INDEX_SIGNINGDATE, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getSigningDate <em>SigningDate</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>SigningDate</em>' attribute.
	 * @see #getSigningDate()
	 */
	public void setSigningDate(Date signingDate) {
		super.setByIndex(INDEX_SIGNINGDATE, signingDate);
	}

	/**
	 * Returns the value of the '<em><b>ContractPeriod</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>ContractPeriod</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>ContractPeriod</em>' attribute.
	 * @see #setContractPeriod(java.lang.String)
	 */
	public String getContractPeriod() {
		return DataUtil.toString(super.getByIndex(INDEX_CONTRACTPERIOD, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getContractPeriod <em>ContractPeriod</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>ContractPeriod</em>' attribute.
	 * @see #getContractPeriod()
	 */
	public void setContractPeriod(String contractPeriod) {
		super.setByIndex(INDEX_CONTRACTPERIOD, contractPeriod);
	}

	/**
	 * Returns the value of the '<em><b>FinishTime</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>FinishTime</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>FinishTime</em>' attribute.
	 * @see #setFinishTime(java.util.Date)
	 */
	public Date getFinishTime() {
		return DataUtil.toDate(super.getByIndex(INDEX_FINISHTIME, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getFinishTime <em>FinishTime</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>FinishTime</em>' attribute.
	 * @see #getFinishTime()
	 */
	public void setFinishTime(Date finishTime) {
		super.setByIndex(INDEX_FINISHTIME, finishTime);
	}

	/**
	 * Returns the value of the '<em><b>HeadquarterGroup</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>HeadquarterGroup</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>HeadquarterGroup</em>' attribute.
	 * @see #setHeadquarterGroup(java.lang.String)
	 */
	public String getHeadquarterGroup() {
		return DataUtil.toString(super.getByIndex(INDEX_HEADQUARTERGROUP, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getHeadquarterGroup <em>HeadquarterGroup</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>HeadquarterGroup</em>' attribute.
	 * @see #getHeadquarterGroup()
	 */
	public void setHeadquarterGroup(String headquarterGroup) {
		super.setByIndex(INDEX_HEADQUARTERGROUP, headquarterGroup);
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
	 * Returns the value of the '<em><b>Major</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Major</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Major</em>' attribute.
	 * @see #setMajor(java.lang.String)
	 */
	public String getMajor() {
		return DataUtil.toString(super.getByIndex(INDEX_MAJOR, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getMajor <em>Major</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Major</em>' attribute.
	 * @see #getMajor()
	 */
	public void setMajor(String major) {
		super.setByIndex(INDEX_MAJOR, major);
	}

	/**
	 * Returns the value of the '<em><b>RelateCont</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>RelateCont</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>RelateCont</em>' attribute.
	 * @see #setRelateCont(java.lang.String)
	 */
	public String getRelateCont() {
		return DataUtil.toString(super.getByIndex(INDEX_RELATECONT, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getRelateCont <em>RelateCont</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>RelateCont</em>' attribute.
	 * @see #getRelateCont()
	 */
	public void setRelateCont(String relateCont) {
		super.setByIndex(INDEX_RELATECONT, relateCont);
	}

	/**
	 * Returns the value of the '<em><b>ActContractSum</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>ActContractSum</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>ActContractSum</em>' attribute.
	 * @see #setActContractSum(java.math.BigDecimal)
	 */
	public BigDecimal getActContractSum() {
		return DataUtil.toBigDecimal(super.getByIndex(INDEX_ACTCONTRACTSUM, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getActContractSum <em>ActContractSum</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>ActContractSum</em>' attribute.
	 * @see #getActContractSum()
	 */
	public void setActContractSum(BigDecimal actContractSum) {
		super.setByIndex(INDEX_ACTCONTRACTSUM, actContractSum);
	}

	/**
	 * Returns the value of the '<em><b>Issupagreement</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Issupagreement</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Issupagreement</em>' attribute.
	 * @see #setIssupagreement(java.lang.String)
	 */
	public String getIssupagreement() {
		return DataUtil.toString(super.getByIndex(INDEX_ISSUPAGREEMENT, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getIssupagreement <em>Issupagreement</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Issupagreement</em>' attribute.
	 * @see #getIssupagreement()
	 */
	public void setIssupagreement(String issupagreement) {
		super.setByIndex(INDEX_ISSUPAGREEMENT, issupagreement);
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
	 * Returns the value of the '<em><b>IncreaseDecreaseSum</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>IncreaseDecreaseSum</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>IncreaseDecreaseSum</em>' attribute.
	 * @see #setIncreaseDecreaseSum(java.math.BigDecimal)
	 */
	public BigDecimal getIncreaseDecreaseSum() {
		return DataUtil.toBigDecimal(super.getByIndex(INDEX_INCREASEDECREASESUM, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getIncreaseDecreaseSum <em>IncreaseDecreaseSum</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>IncreaseDecreaseSum</em>' attribute.
	 * @see #getIncreaseDecreaseSum()
	 */
	public void setIncreaseDecreaseSum(BigDecimal increaseDecreaseSum) {
		super.setByIndex(INDEX_INCREASEDECREASESUM, increaseDecreaseSum);
	}

	/**
	 * Returns the value of the '<em><b>CreateUsername</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>CreateUsername</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>CreateUsername</em>' attribute.
	 * @see #setCreateUsername(java.lang.String)
	 */
	public String getCreateUsername() {
		return DataUtil.toString(super.getByIndex(INDEX_CREATEUSERNAME, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getCreateUsername <em>CreateUsername</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>CreateUsername</em>' attribute.
	 * @see #getCreateUsername()
	 */
	public void setCreateUsername(String createUsername) {
		super.setByIndex(INDEX_CREATEUSERNAME, createUsername);
	}

	/**
	 * Returns the value of the '<em><b>UpdatedBy</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>UpdatedBy</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>UpdatedBy</em>' attribute.
	 * @see #setUpdatedBy(java.lang.String)
	 */
	public String getUpdatedBy() {
		return DataUtil.toString(super.getByIndex(INDEX_UPDATEDBY, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getUpdatedBy <em>UpdatedBy</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>UpdatedBy</em>' attribute.
	 * @see #getUpdatedBy()
	 */
	public void setUpdatedBy(String updatedBy) {
		super.setByIndex(INDEX_UPDATEDBY, updatedBy);
	}

	/**
	 * Returns the value of the '<em><b>UpdatedTime</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>UpdatedTime</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>UpdatedTime</em>' attribute.
	 * @see #setUpdatedTime(java.util.Date)
	 */
	public Date getUpdatedTime() {
		return DataUtil.toDate(super.getByIndex(INDEX_UPDATEDTIME, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getUpdatedTime <em>UpdatedTime</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>UpdatedTime</em>' attribute.
	 * @see #getUpdatedTime()
	 */
	public void setUpdatedTime(Date updatedTime) {
		super.setByIndex(INDEX_UPDATEDTIME, updatedTime);
	}

	/**
	 * Returns the value of the '<em><b>Revision</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Revision</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Revision</em>' attribute.
	 * @see #setRevision(int)
	 */
	public int getRevision() {
		return DataUtil.toInt(super.getByIndex(INDEX_REVISION, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getRevision <em>Revision</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Revision</em>' attribute.
	 * @see #getRevision()
	 */
	public void setRevision(int revision) {
		super.setByIndex(INDEX_REVISION, revision);
	}

	/**
	 * Returns the value of the '<em><b>CreatedOrgid</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>CreatedOrgid</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>CreatedOrgid</em>' attribute.
	 * @see #setCreatedOrgid(java.lang.String)
	 */
	public String getCreatedOrgid() {
		return DataUtil.toString(super.getByIndex(INDEX_CREATEDORGID, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getCreatedOrgid <em>CreatedOrgid</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>CreatedOrgid</em>' attribute.
	 * @see #getCreatedOrgid()
	 */
	public void setCreatedOrgid(String createdOrgid) {
		super.setByIndex(INDEX_CREATEDORGID, createdOrgid);
	}

	/**
	 * Returns the value of the '<em><b>ImplementOrgname</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>ImplementOrgname</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>ImplementOrgname</em>' attribute.
	 * @see #setImplementOrgname(java.lang.String)
	 */
	public String getImplementOrgname() {
		return DataUtil.toString(super.getByIndex(INDEX_IMPLEMENTORGNAME, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getImplementOrgname <em>ImplementOrgname</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>ImplementOrgname</em>' attribute.
	 * @see #getImplementOrgname()
	 */
	public void setImplementOrgname(String implementOrgname) {
		super.setByIndex(INDEX_IMPLEMENTORGNAME, implementOrgname);
	}

	/**
	 * Returns the value of the '<em><b>FDeptCountersignId</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>FDeptCountersignId</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>FDeptCountersignId</em>' attribute.
	 * @see #setFDeptCountersignId(java.lang.String)
	 */
	public String getFDeptCountersignId() {
		return DataUtil.toString(super.getByIndex(INDEX_FDEPTCOUNTERSIGNID, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getFDeptCountersignId <em>FDeptCountersignId</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>FDeptCountersignId</em>' attribute.
	 * @see #getFDeptCountersignId()
	 */
	public void setFDeptCountersignId(String fDeptCountersignId) {
		super.setByIndex(INDEX_FDEPTCOUNTERSIGNID, fDeptCountersignId);
	}

	/**
	 * Returns the value of the '<em><b>FDeptCountersignName</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>FDeptCountersignName</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>FDeptCountersignName</em>' attribute.
	 * @see #setFDeptCountersignName(java.lang.String)
	 */
	public String getFDeptCountersignName() {
		return DataUtil.toString(super.getByIndex(INDEX_FDEPTCOUNTERSIGNNAME, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getFDeptCountersignName <em>FDeptCountersignName</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>FDeptCountersignName</em>' attribute.
	 * @see #getFDeptCountersignName()
	 */
	public void setFDeptCountersignName(String fDeptCountersignName) {
		super.setByIndex(INDEX_FDEPTCOUNTERSIGNNAME, fDeptCountersignName);
	}

	/**
	 * Returns the value of the '<em><b>ZDeptCountersignName</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>ZDeptCountersignName</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>ZDeptCountersignName</em>' attribute.
	 * @see #setZDeptCountersignName(java.lang.String)
	 */
	public String getZDeptCountersignName() {
		return DataUtil.toString(super.getByIndex(INDEX_ZDEPTCOUNTERSIGNNAME, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getZDeptCountersignName <em>ZDeptCountersignName</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>ZDeptCountersignName</em>' attribute.
	 * @see #getZDeptCountersignName()
	 */
	public void setZDeptCountersignName(String zDeptCountersignName) {
		super.setByIndex(INDEX_ZDEPTCOUNTERSIGNNAME, zDeptCountersignName);
	}

	/**
	 * Returns the value of the '<em><b>ZDeptCountersignId</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>ZDeptCountersignId</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>ZDeptCountersignId</em>' attribute.
	 * @see #setZDeptCountersignId(java.lang.String)
	 */
	public String getZDeptCountersignId() {
		return DataUtil.toString(super.getByIndex(INDEX_ZDEPTCOUNTERSIGNID, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getZDeptCountersignId <em>ZDeptCountersignId</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>ZDeptCountersignId</em>' attribute.
	 * @see #getZDeptCountersignId()
	 */
	public void setZDeptCountersignId(String zDeptCountersignId) {
		super.setByIndex(INDEX_ZDEPTCOUNTERSIGNID, zDeptCountersignId);
	}

	/**
	 * Returns the value of the '<em><b>Signatoryname</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Signatoryname</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Signatoryname</em>' attribute.
	 * @see #setSignatoryname(java.lang.String)
	 */
	public String getSignatoryname() {
		return DataUtil.toString(super.getByIndex(INDEX_SIGNATORYNAME, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getSignatoryname <em>Signatoryname</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Signatoryname</em>' attribute.
	 * @see #getSignatoryname()
	 */
	public void setSignatoryname(String signatoryname) {
		super.setByIndex(INDEX_SIGNATORYNAME, signatoryname);
	}

	/**
	 * Returns the value of the '<em><b>ContractSecretLevel</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>ContractSecretLevel</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>ContractSecretLevel</em>' attribute.
	 * @see #setContractSecretLevel(java.lang.String)
	 */
	public String getContractSecretLevel() {
		return DataUtil.toString(super.getByIndex(INDEX_CONTRACTSECRETLEVEL, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getContractSecretLevel <em>ContractSecretLevel</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>ContractSecretLevel</em>' attribute.
	 * @see #getContractSecretLevel()
	 */
	public void setContractSecretLevel(String contractSecretLevel) {
		super.setByIndex(INDEX_CONTRACTSECRETLEVEL, contractSecretLevel);
	}

	/**
	 * Returns the value of the '<em><b>ProjectSecretLevel</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>ProjectSecretLevel</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>ProjectSecretLevel</em>' attribute.
	 * @see #setProjectSecretLevel(java.lang.String)
	 */
	public String getProjectSecretLevel() {
		return DataUtil.toString(super.getByIndex(INDEX_PROJECTSECRETLEVEL, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getProjectSecretLevel <em>ProjectSecretLevel</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>ProjectSecretLevel</em>' attribute.
	 * @see #getProjectSecretLevel()
	 */
	public void setProjectSecretLevel(String projectSecretLevel) {
		super.setByIndex(INDEX_PROJECTSECRETLEVEL, projectSecretLevel);
	}

	/**
	 * Returns the value of the '<em><b>ContractBalance</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>ContractBalance</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>ContractBalance</em>' attribute.
	 * @see #setContractBalance(java.lang.String)
	 */
	public String getContractBalance() {
		return DataUtil.toString(super.getByIndex(INDEX_CONTRACTBALANCE, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getContractBalance <em>ContractBalance</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>ContractBalance</em>' attribute.
	 * @see #getContractBalance()
	 */
	public void setContractBalance(String contractBalance) {
		super.setByIndex(INDEX_CONTRACTBALANCE, contractBalance);
	}

	/**
	 * Returns the value of the '<em><b>ProcurementType</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>ProcurementType</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>ProcurementType</em>' attribute.
	 * @see #setProcurementType(java.lang.String)
	 */
	public String getProcurementType() {
		return DataUtil.toString(super.getByIndex(INDEX_PROCUREMENTTYPE, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getProcurementType <em>ProcurementType</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>ProcurementType</em>' attribute.
	 * @see #getProcurementType()
	 */
	public void setProcurementType(String procurementType) {
		super.setByIndex(INDEX_PROCUREMENTTYPE, procurementType);
	}

	/**
	 * Returns the value of the '<em><b>NoTaxSum</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>NoTaxSum</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>NoTaxSum</em>' attribute.
	 * @see #setNoTaxSum(java.lang.String)
	 */
	public String getNoTaxSum() {
		return DataUtil.toString(super.getByIndex(INDEX_NOTAXSUM, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getNoTaxSum <em>NoTaxSum</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>NoTaxSum</em>' attribute.
	 * @see #getNoTaxSum()
	 */
	public void setNoTaxSum(String noTaxSum) {
		super.setByIndex(INDEX_NOTAXSUM, noTaxSum);
	}

	/**
	 * Returns the value of the '<em><b>PayTax</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>PayTax</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>PayTax</em>' attribute.
	 * @see #setPayTax(java.lang.String)
	 */
	public String getPayTax() {
		return DataUtil.toString(super.getByIndex(INDEX_PAYTAX, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getPayTax <em>PayTax</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>PayTax</em>' attribute.
	 * @see #getPayTax()
	 */
	public void setPayTax(String payTax) {
		super.setByIndex(INDEX_PAYTAX, payTax);
	}

	/**
	 * Returns the value of the '<em><b>FinContractSum</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>FinContractSum</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>FinContractSum</em>' attribute.
	 * @see #setFinContractSum(java.lang.String)
	 */
	public String getFinContractSum() {
		return DataUtil.toString(super.getByIndex(INDEX_FINCONTRACTSUM, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getFinContractSum <em>FinContractSum</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>FinContractSum</em>' attribute.
	 * @see #getFinContractSum()
	 */
	public void setFinContractSum(String finContractSum) {
		super.setByIndex(INDEX_FINCONTRACTSUM, finContractSum);
	}

	/**
	 * Returns the value of the '<em><b>Isfb</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Isfb</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Isfb</em>' attribute.
	 * @see #setIsfb(java.lang.String)
	 */
	public String getIsfb() {
		return DataUtil.toString(super.getByIndex(INDEX_ISFB, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getIsfb <em>Isfb</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Isfb</em>' attribute.
	 * @see #getIsfb()
	 */
	public void setIsfb(String isfb) {
		super.setByIndex(INDEX_ISFB, isfb);
	}

	/**
	 * Returns the value of the '<em><b>ContractModel</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>ContractModel</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>ContractModel</em>' attribute.
	 * @see #setContractModel(java.lang.String)
	 */
	public String getContractModel() {
		return DataUtil.toString(super.getByIndex(INDEX_CONTRACTMODEL, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getContractModel <em>ContractModel</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>ContractModel</em>' attribute.
	 * @see #getContractModel()
	 */
	public void setContractModel(String contractModel) {
		super.setByIndex(INDEX_CONTRACTMODEL, contractModel);
	}

	/**
	 * Returns the value of the '<em><b>TenderId</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>TenderId</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>TenderId</em>' attribute.
	 * @see #setTenderId(java.lang.String)
	 */
	public String getTenderId() {
		return DataUtil.toString(super.getByIndex(INDEX_TENDERID, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getTenderId <em>TenderId</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>TenderId</em>' attribute.
	 * @see #getTenderId()
	 */
	public void setTenderId(String tenderId) {
		super.setByIndex(INDEX_TENDERID, tenderId);
	}


}