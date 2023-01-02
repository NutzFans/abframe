/*******************************************************************************
 *
 * Copyright (c) 2001-2006 Primeton Technologies, Ltd.
 * All rights reserved.
 *
 * Created on Apr 11, 2008
 *******************************************************************************/
package com.zhonghe.ame.payContract.payContract.impl;

import com.primeton.ext.data.sdo.DataUtil;
import com.primeton.ext.data.sdo.ExtendedDataObjectImpl;
import com.zhonghe.ame.payContract.payContract.ZhPayContract;

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
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.ZhPayContractImpl#getId <em>Id</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.ZhPayContractImpl#getCreateUserid <em>CreateUserid</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.ZhPayContractImpl#getCreateTime <em>CreateTime</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.ZhPayContractImpl#getImplementOrg <em>ImplementOrg</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.ZhPayContractImpl#getContractName <em>ContractName</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.ZhPayContractImpl#getSignatory <em>Signatory</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.ZhPayContractImpl#getContractSum <em>ContractSum</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.ZhPayContractImpl#getContractType <em>ContractType</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.ZhPayContractImpl#getProjectSize <em>ProjectSize</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.ZhPayContractImpl#getProjectLocal <em>ProjectLocal</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.ZhPayContractImpl#getPurchasePlan <em>PurchasePlan</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.ZhPayContractImpl#getStartTime <em>StartTime</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.ZhPayContractImpl#getEndTime <em>EndTime</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.ZhPayContractImpl#getContractUpload <em>ContractUpload</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.ZhPayContractImpl#getAppStatus <em>AppStatus</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.ZhPayContractImpl#getProcessid <em>Processid</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.ZhPayContractImpl#getEntryOrg <em>EntryOrg</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.ZhPayContractImpl#getCountersignOrg <em>CountersignOrg</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.ZhPayContractImpl#getManageOrg <em>ManageOrg</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.ZhPayContractImpl#getAuditOrg <em>AuditOrg</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.ZhPayContractImpl#getLeadershipOpinion <em>LeadershipOpinion</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.ZhPayContractImpl#getGeneralManager <em>GeneralManager</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.ZhPayContractImpl#getLegalPerson <em>LegalPerson</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.ZhPayContractImpl#getUpdateUesrid <em>UpdateUesrid</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.ZhPayContractImpl#getUpdateTime <em>UpdateTime</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.ZhPayContractImpl#getContractSubject <em>ContractSubject</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.ZhPayContractImpl#getContractNo <em>ContractNo</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.ZhPayContractImpl#getPayMethod <em>PayMethod</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.ZhPayContractImpl#getExecuteStatus <em>ExecuteStatus</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.ZhPayContractImpl#getOrganizer <em>Organizer</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.ZhPayContractImpl#getCachet <em>Cachet</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.ZhPayContractImpl#getPayer <em>Payer</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.ZhPayContractImpl#getSigningDate <em>SigningDate</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.ZhPayContractImpl#getContractPeriod <em>ContractPeriod</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.ZhPayContractImpl#getFinishTime <em>FinishTime</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.ZhPayContractImpl#getRelateCont <em>RelateCont</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.ZhPayContractImpl#getActContractSum <em>ActContractSum</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.ZhPayContractImpl#getIssupagreement <em>Issupagreement</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.ZhPayContractImpl#getRemark <em>Remark</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.ZhPayContractImpl#getProAppId <em>ProAppId</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.ZhPayContractImpl#getIncreaseDecreaseSum <em>IncreaseDecreaseSum</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.ZhPayContractImpl#getCreateUsername <em>CreateUsername</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.ZhPayContractImpl#getUpdatedBy <em>UpdatedBy</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.ZhPayContractImpl#getUpdatedTime <em>UpdatedTime</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.ZhPayContractImpl#getRevision <em>Revision</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.ZhPayContractImpl#getCreatedOrgid <em>CreatedOrgid</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.ZhPayContractImpl#getImplementOrgname <em>ImplementOrgname</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.ZhPayContractImpl#getFDeptCountersignId <em>FDeptCountersignId</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.ZhPayContractImpl#getFDeptCountersignName <em>FDeptCountersignName</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.ZhPayContractImpl#getZDeptCountersignName <em>ZDeptCountersignName</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.ZhPayContractImpl#getZDeptCountersignId <em>ZDeptCountersignId</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.ZhPayContractImpl#getContractSecretLevel <em>ContractSecretLevel</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.ZhPayContractImpl#getIssecret <em>Issecret</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.ZhPayContractImpl#getProjectSecretLevel <em>ProjectSecretLevel</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.ZhPayContractImpl#getIssm <em>Issm</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.ZhPayContractImpl#getBudgetSum <em>BudgetSum</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.ZhPayContractImpl#getScalingSum <em>ScalingSum</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.ZhPayContractImpl#getContractBalance <em>ContractBalance</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.ZhPayContractImpl#getMarkType <em>MarkType</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.ZhPayContractImpl#getIsengineering <em>Isengineering</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.ZhPayContractImpl#getIntype <em>Intype</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.ZhPayContractImpl#getProcurementType <em>ProcurementType</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.ZhPayContractImpl#getSupplierSource <em>SupplierSource</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.ZhPayContractImpl#getIselectronic <em>Iselectronic</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.ZhPayContractImpl#getNoTaxSum <em>NoTaxSum</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.ZhPayContractImpl#getPayTax <em>PayTax</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.ZhPayContractImpl#getContractPrice <em>ContractPrice</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.ZhPayContractImpl#getContractNature <em>ContractNature</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.ZhPayContractImpl#getFinalSum <em>FinalSum</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.ZhPayContractImpl#getPlanYear <em>PlanYear</em>}</li>
 * </ul>
 * </p>
 *
 * @extends ExtendedDataObjectImpl;
 *
 * @implements ZhPayContract;
 */

public class ZhPayContractImpl extends ExtendedDataObjectImpl implements ZhPayContract {
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
	public final static int INDEX_CONTRACTTYPE = 7;
	public final static int INDEX_PROJECTSIZE = 8;
	public final static int INDEX_PROJECTLOCAL = 9;
	public final static int INDEX_PURCHASEPLAN = 10;
	public final static int INDEX_STARTTIME = 11;
	public final static int INDEX_ENDTIME = 12;
	public final static int INDEX_CONTRACTUPLOAD = 13;
	public final static int INDEX_APPSTATUS = 14;
	public final static int INDEX_PROCESSID = 15;
	public final static int INDEX_ENTRYORG = 16;
	public final static int INDEX_COUNTERSIGNORG = 17;
	public final static int INDEX_MANAGEORG = 18;
	public final static int INDEX_AUDITORG = 19;
	public final static int INDEX_LEADERSHIPOPINION = 20;
	public final static int INDEX_GENERALMANAGER = 21;
	public final static int INDEX_LEGALPERSON = 22;
	public final static int INDEX_UPDATEUESRID = 23;
	public final static int INDEX_UPDATETIME = 24;
	public final static int INDEX_CONTRACTSUBJECT = 25;
	public final static int INDEX_CONTRACTNO = 26;
	public final static int INDEX_PAYMETHOD = 27;
	public final static int INDEX_EXECUTESTATUS = 28;
	public final static int INDEX_ORGANIZER = 29;
	public final static int INDEX_CACHET = 30;
	public final static int INDEX_PAYER = 31;
	public final static int INDEX_SIGNINGDATE = 32;
	public final static int INDEX_CONTRACTPERIOD = 33;
	public final static int INDEX_FINISHTIME = 34;
	public final static int INDEX_RELATECONT = 35;
	public final static int INDEX_ACTCONTRACTSUM = 36;
	public final static int INDEX_ISSUPAGREEMENT = 37;
	public final static int INDEX_REMARK = 38;
	public final static int INDEX_PROAPPID = 39;
	public final static int INDEX_INCREASEDECREASESUM = 40;
	public final static int INDEX_CREATEUSERNAME = 41;
	public final static int INDEX_UPDATEDBY = 42;
	public final static int INDEX_UPDATEDTIME = 43;
	public final static int INDEX_REVISION = 44;
	public final static int INDEX_CREATEDORGID = 45;
	public final static int INDEX_IMPLEMENTORGNAME = 46;
	public final static int INDEX_FDEPTCOUNTERSIGNID = 47;
	public final static int INDEX_FDEPTCOUNTERSIGNNAME = 48;
	public final static int INDEX_ZDEPTCOUNTERSIGNNAME = 49;
	public final static int INDEX_ZDEPTCOUNTERSIGNID = 50;
	public final static int INDEX_CONTRACTSECRETLEVEL = 51;
	public final static int INDEX_ISSECRET = 52;
	public final static int INDEX_PROJECTSECRETLEVEL = 53;
	public final static int INDEX_ISSM = 54;
	public final static int INDEX_BUDGETSUM = 55;
	public final static int INDEX_SCALINGSUM = 56;
	public final static int INDEX_CONTRACTBALANCE = 57;
	public final static int INDEX_MARKTYPE = 58;
	public final static int INDEX_ISENGINEERING = 59;
	public final static int INDEX_INTYPE = 60;
	public final static int INDEX_PROCUREMENTTYPE = 61;
	public final static int INDEX_SUPPLIERSOURCE = 62;
	public final static int INDEX_ISELECTRONIC = 63;
	public final static int INDEX_NOTAXSUM = 64;
	public final static int INDEX_PAYTAX = 65;
	public final static int INDEX_CONTRACTPRICE = 66;
	public final static int INDEX_CONTRACTNATURE = 67;
	public final static int INDEX_FINALSUM = 68;
	public final static int INDEX_PLANYEAR = 69;
	public static final int SDO_PROPERTY_COUNT = 70;

	public static final int EXTENDED_PROPERTY_COUNT = -1;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 */
	public ZhPayContractImpl() {
		this(TYPE);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 */
	public ZhPayContractImpl(Type type) {
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
	 * Returns the value of the '<em><b>ContractType</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>ContractType</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>ContractType</em>' attribute.
	 * @see #setContractType(java.lang.String)
	 */
	public String getContractType() {
		return DataUtil.toString(super.getByIndex(INDEX_CONTRACTTYPE, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getContractType <em>ContractType</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>ContractType</em>' attribute.
	 * @see #getContractType()
	 */
	public void setContractType(String contractType) {
		super.setByIndex(INDEX_CONTRACTTYPE, contractType);
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
	 * Returns the value of the '<em><b>PurchasePlan</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>PurchasePlan</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>PurchasePlan</em>' attribute.
	 * @see #setPurchasePlan(java.lang.String)
	 */
	public String getPurchasePlan() {
		return DataUtil.toString(super.getByIndex(INDEX_PURCHASEPLAN, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getPurchasePlan <em>PurchasePlan</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>PurchasePlan</em>' attribute.
	 * @see #getPurchasePlan()
	 */
	public void setPurchasePlan(String purchasePlan) {
		super.setByIndex(INDEX_PURCHASEPLAN, purchasePlan);
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
	 * Returns the value of the '<em><b>ContractUpload</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>ContractUpload</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>ContractUpload</em>' attribute.
	 * @see #setContractUpload(java.lang.String)
	 */
	public String getContractUpload() {
		return DataUtil.toString(super.getByIndex(INDEX_CONTRACTUPLOAD, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getContractUpload <em>ContractUpload</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>ContractUpload</em>' attribute.
	 * @see #getContractUpload()
	 */
	public void setContractUpload(String contractUpload) {
		super.setByIndex(INDEX_CONTRACTUPLOAD, contractUpload);
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
	 * Returns the value of the '<em><b>EntryOrg</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>EntryOrg</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>EntryOrg</em>' attribute.
	 * @see #setEntryOrg(java.lang.String)
	 */
	public String getEntryOrg() {
		return DataUtil.toString(super.getByIndex(INDEX_ENTRYORG, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getEntryOrg <em>EntryOrg</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>EntryOrg</em>' attribute.
	 * @see #getEntryOrg()
	 */
	public void setEntryOrg(String entryOrg) {
		super.setByIndex(INDEX_ENTRYORG, entryOrg);
	}

	/**
	 * Returns the value of the '<em><b>CountersignOrg</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>CountersignOrg</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>CountersignOrg</em>' attribute.
	 * @see #setCountersignOrg(java.lang.String)
	 */
	public String getCountersignOrg() {
		return DataUtil.toString(super.getByIndex(INDEX_COUNTERSIGNORG, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getCountersignOrg <em>CountersignOrg</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>CountersignOrg</em>' attribute.
	 * @see #getCountersignOrg()
	 */
	public void setCountersignOrg(String countersignOrg) {
		super.setByIndex(INDEX_COUNTERSIGNORG, countersignOrg);
	}

	/**
	 * Returns the value of the '<em><b>ManageOrg</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>ManageOrg</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>ManageOrg</em>' attribute.
	 * @see #setManageOrg(java.lang.String)
	 */
	public String getManageOrg() {
		return DataUtil.toString(super.getByIndex(INDEX_MANAGEORG, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getManageOrg <em>ManageOrg</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>ManageOrg</em>' attribute.
	 * @see #getManageOrg()
	 */
	public void setManageOrg(String manageOrg) {
		super.setByIndex(INDEX_MANAGEORG, manageOrg);
	}

	/**
	 * Returns the value of the '<em><b>AuditOrg</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>AuditOrg</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>AuditOrg</em>' attribute.
	 * @see #setAuditOrg(java.lang.String)
	 */
	public String getAuditOrg() {
		return DataUtil.toString(super.getByIndex(INDEX_AUDITORG, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getAuditOrg <em>AuditOrg</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>AuditOrg</em>' attribute.
	 * @see #getAuditOrg()
	 */
	public void setAuditOrg(String auditOrg) {
		super.setByIndex(INDEX_AUDITORG, auditOrg);
	}

	/**
	 * Returns the value of the '<em><b>LeadershipOpinion</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>LeadershipOpinion</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>LeadershipOpinion</em>' attribute.
	 * @see #setLeadershipOpinion(java.lang.String)
	 */
	public String getLeadershipOpinion() {
		return DataUtil.toString(super.getByIndex(INDEX_LEADERSHIPOPINION, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getLeadershipOpinion <em>LeadershipOpinion</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>LeadershipOpinion</em>' attribute.
	 * @see #getLeadershipOpinion()
	 */
	public void setLeadershipOpinion(String leadershipOpinion) {
		super.setByIndex(INDEX_LEADERSHIPOPINION, leadershipOpinion);
	}

	/**
	 * Returns the value of the '<em><b>GeneralManager</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>GeneralManager</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>GeneralManager</em>' attribute.
	 * @see #setGeneralManager(java.lang.String)
	 */
	public String getGeneralManager() {
		return DataUtil.toString(super.getByIndex(INDEX_GENERALMANAGER, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getGeneralManager <em>GeneralManager</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>GeneralManager</em>' attribute.
	 * @see #getGeneralManager()
	 */
	public void setGeneralManager(String generalManager) {
		super.setByIndex(INDEX_GENERALMANAGER, generalManager);
	}

	/**
	 * Returns the value of the '<em><b>LegalPerson</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>LegalPerson</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>LegalPerson</em>' attribute.
	 * @see #setLegalPerson(java.lang.String)
	 */
	public String getLegalPerson() {
		return DataUtil.toString(super.getByIndex(INDEX_LEGALPERSON, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getLegalPerson <em>LegalPerson</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>LegalPerson</em>' attribute.
	 * @see #getLegalPerson()
	 */
	public void setLegalPerson(String legalPerson) {
		super.setByIndex(INDEX_LEGALPERSON, legalPerson);
	}

	/**
	 * Returns the value of the '<em><b>UpdateUesrid</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>UpdateUesrid</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>UpdateUesrid</em>' attribute.
	 * @see #setUpdateUesrid(int)
	 */
	public int getUpdateUesrid() {
		return DataUtil.toInt(super.getByIndex(INDEX_UPDATEUESRID, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getUpdateUesrid <em>UpdateUesrid</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>UpdateUesrid</em>' attribute.
	 * @see #getUpdateUesrid()
	 */
	public void setUpdateUesrid(int updateUesrid) {
		super.setByIndex(INDEX_UPDATEUESRID, updateUesrid);
	}

	/**
	 * Returns the value of the '<em><b>UpdateTime</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>UpdateTime</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>UpdateTime</em>' attribute.
	 * @see #setUpdateTime(java.util.Date)
	 */
	public Date getUpdateTime() {
		return DataUtil.toDate(super.getByIndex(INDEX_UPDATETIME, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getUpdateTime <em>UpdateTime</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>UpdateTime</em>' attribute.
	 * @see #getUpdateTime()
	 */
	public void setUpdateTime(Date updateTime) {
		super.setByIndex(INDEX_UPDATETIME, updateTime);
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
	 * Returns the value of the '<em><b>Payer</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Payer</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Payer</em>' attribute.
	 * @see #setPayer(java.lang.String)
	 */
	public String getPayer() {
		return DataUtil.toString(super.getByIndex(INDEX_PAYER, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getPayer <em>Payer</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Payer</em>' attribute.
	 * @see #getPayer()
	 */
	public void setPayer(String payer) {
		super.setByIndex(INDEX_PAYER, payer);
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
	 * Returns the value of the '<em><b>ProAppId</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>ProAppId</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>ProAppId</em>' attribute.
	 * @see #setProAppId(int)
	 */
	public int getProAppId() {
		return DataUtil.toInt(super.getByIndex(INDEX_PROAPPID, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getProAppId <em>ProAppId</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>ProAppId</em>' attribute.
	 * @see #getProAppId()
	 */
	public void setProAppId(int proAppId) {
		super.setByIndex(INDEX_PROAPPID, proAppId);
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
	 * Returns the value of the '<em><b>Issecret</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Issecret</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Issecret</em>' attribute.
	 * @see #setIssecret(java.lang.String)
	 */
	public String getIssecret() {
		return DataUtil.toString(super.getByIndex(INDEX_ISSECRET, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getIssecret <em>Issecret</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Issecret</em>' attribute.
	 * @see #getIssecret()
	 */
	public void setIssecret(String issecret) {
		super.setByIndex(INDEX_ISSECRET, issecret);
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
	 * Returns the value of the '<em><b>Issm</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Issm</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Issm</em>' attribute.
	 * @see #setIssm(java.lang.String)
	 */
	public String getIssm() {
		return DataUtil.toString(super.getByIndex(INDEX_ISSM, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getIssm <em>Issm</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Issm</em>' attribute.
	 * @see #getIssm()
	 */
	public void setIssm(String issm) {
		super.setByIndex(INDEX_ISSM, issm);
	}

	/**
	 * Returns the value of the '<em><b>BudgetSum</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>BudgetSum</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>BudgetSum</em>' attribute.
	 * @see #setBudgetSum(java.lang.String)
	 */
	public String getBudgetSum() {
		return DataUtil.toString(super.getByIndex(INDEX_BUDGETSUM, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getBudgetSum <em>BudgetSum</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>BudgetSum</em>' attribute.
	 * @see #getBudgetSum()
	 */
	public void setBudgetSum(String budgetSum) {
		super.setByIndex(INDEX_BUDGETSUM, budgetSum);
	}

	/**
	 * Returns the value of the '<em><b>ScalingSum</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>ScalingSum</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>ScalingSum</em>' attribute.
	 * @see #setScalingSum(java.lang.String)
	 */
	public String getScalingSum() {
		return DataUtil.toString(super.getByIndex(INDEX_SCALINGSUM, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getScalingSum <em>ScalingSum</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>ScalingSum</em>' attribute.
	 * @see #getScalingSum()
	 */
	public void setScalingSum(String scalingSum) {
		super.setByIndex(INDEX_SCALINGSUM, scalingSum);
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
	 * Returns the value of the '<em><b>MarkType</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>MarkType</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>MarkType</em>' attribute.
	 * @see #setMarkType(java.lang.String)
	 */
	public String getMarkType() {
		return DataUtil.toString(super.getByIndex(INDEX_MARKTYPE, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getMarkType <em>MarkType</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>MarkType</em>' attribute.
	 * @see #getMarkType()
	 */
	public void setMarkType(String markType) {
		super.setByIndex(INDEX_MARKTYPE, markType);
	}

	/**
	 * Returns the value of the '<em><b>Isengineering</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Isengineering</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Isengineering</em>' attribute.
	 * @see #setIsengineering(java.lang.String)
	 */
	public String getIsengineering() {
		return DataUtil.toString(super.getByIndex(INDEX_ISENGINEERING, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getIsengineering <em>Isengineering</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Isengineering</em>' attribute.
	 * @see #getIsengineering()
	 */
	public void setIsengineering(String isengineering) {
		super.setByIndex(INDEX_ISENGINEERING, isengineering);
	}

	/**
	 * Returns the value of the '<em><b>Intype</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Intype</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Intype</em>' attribute.
	 * @see #setIntype(java.lang.String)
	 */
	public String getIntype() {
		return DataUtil.toString(super.getByIndex(INDEX_INTYPE, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getIntype <em>Intype</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Intype</em>' attribute.
	 * @see #getIntype()
	 */
	public void setIntype(String intype) {
		super.setByIndex(INDEX_INTYPE, intype);
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
	 * Returns the value of the '<em><b>SupplierSource</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>SupplierSource</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>SupplierSource</em>' attribute.
	 * @see #setSupplierSource(java.lang.String)
	 */
	public String getSupplierSource() {
		return DataUtil.toString(super.getByIndex(INDEX_SUPPLIERSOURCE, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getSupplierSource <em>SupplierSource</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>SupplierSource</em>' attribute.
	 * @see #getSupplierSource()
	 */
	public void setSupplierSource(String supplierSource) {
		super.setByIndex(INDEX_SUPPLIERSOURCE, supplierSource);
	}

	/**
	 * Returns the value of the '<em><b>Iselectronic</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Iselectronic</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Iselectronic</em>' attribute.
	 * @see #setIselectronic(java.lang.String)
	 */
	public String getIselectronic() {
		return DataUtil.toString(super.getByIndex(INDEX_ISELECTRONIC, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getIselectronic <em>Iselectronic</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Iselectronic</em>' attribute.
	 * @see #getIselectronic()
	 */
	public void setIselectronic(String iselectronic) {
		super.setByIndex(INDEX_ISELECTRONIC, iselectronic);
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
	 * Returns the value of the '<em><b>ContractPrice</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>ContractPrice</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>ContractPrice</em>' attribute.
	 * @see #setContractPrice(java.lang.String)
	 */
	public String getContractPrice() {
		return DataUtil.toString(super.getByIndex(INDEX_CONTRACTPRICE, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getContractPrice <em>ContractPrice</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>ContractPrice</em>' attribute.
	 * @see #getContractPrice()
	 */
	public void setContractPrice(String contractPrice) {
		super.setByIndex(INDEX_CONTRACTPRICE, contractPrice);
	}

	/**
	 * Returns the value of the '<em><b>ContractNature</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>ContractNature</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>ContractNature</em>' attribute.
	 * @see #setContractNature(java.lang.String)
	 */
	public String getContractNature() {
		return DataUtil.toString(super.getByIndex(INDEX_CONTRACTNATURE, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getContractNature <em>ContractNature</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>ContractNature</em>' attribute.
	 * @see #getContractNature()
	 */
	public void setContractNature(String contractNature) {
		super.setByIndex(INDEX_CONTRACTNATURE, contractNature);
	}

	/**
	 * Returns the value of the '<em><b>FinalSum</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>FinalSum</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>FinalSum</em>' attribute.
	 * @see #setFinalSum(java.lang.String)
	 */
	public String getFinalSum() {
		return DataUtil.toString(super.getByIndex(INDEX_FINALSUM, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getFinalSum <em>FinalSum</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>FinalSum</em>' attribute.
	 * @see #getFinalSum()
	 */
	public void setFinalSum(String finalSum) {
		super.setByIndex(INDEX_FINALSUM, finalSum);
	}

	/**
	 * Returns the value of the '<em><b>PlanYear</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>PlanYear</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>PlanYear</em>' attribute.
	 * @see #setPlanYear(java.lang.String)
	 */
	public String getPlanYear() {
		return DataUtil.toString(super.getByIndex(INDEX_PLANYEAR, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getPlanYear <em>PlanYear</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>PlanYear</em>' attribute.
	 * @see #getPlanYear()
	 */
	public void setPlanYear(String planYear) {
		super.setByIndex(INDEX_PLANYEAR, planYear);
	}


}