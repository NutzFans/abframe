/*******************************************************************************
 *
 * Copyright (c) 2001-2006 Primeton Technologies, Ltd.
 * All rights reserved.
 *
 * Created on Apr 11, 2008
 *******************************************************************************/
package com.zhonghe.ame.payContract.payContract;

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
 *   <li>{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getId <em>Id</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getCreateUserid <em>CreateUserid</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getCreateTime <em>CreateTime</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getImplementOrg <em>ImplementOrg</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getContractName <em>ContractName</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getSignatory <em>Signatory</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getContractSum <em>ContractSum</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getContractType <em>ContractType</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getProjectSize <em>ProjectSize</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getProjectLocal <em>ProjectLocal</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getPurchasePlan <em>PurchasePlan</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getStartTime <em>StartTime</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getEndTime <em>EndTime</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getContractUpload <em>ContractUpload</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getAppStatus <em>AppStatus</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getProcessid <em>Processid</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getEntryOrg <em>EntryOrg</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getCountersignOrg <em>CountersignOrg</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getManageOrg <em>ManageOrg</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getAuditOrg <em>AuditOrg</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getLeadershipOpinion <em>LeadershipOpinion</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getGeneralManager <em>GeneralManager</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getLegalPerson <em>LegalPerson</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getUpdateUesrid <em>UpdateUesrid</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getUpdateTime <em>UpdateTime</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getContractSubject <em>ContractSubject</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getContractNo <em>ContractNo</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getPayMethod <em>PayMethod</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getExecuteStatus <em>ExecuteStatus</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getOrganizer <em>Organizer</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getCachet <em>Cachet</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getPayer <em>Payer</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getSigningDate <em>SigningDate</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getContractPeriod <em>ContractPeriod</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getFinishTime <em>FinishTime</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getRelateCont <em>RelateCont</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getActContractSum <em>ActContractSum</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getIssupagreement <em>Issupagreement</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getRemark <em>Remark</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getProAppId <em>ProAppId</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getIncreaseDecreaseSum <em>IncreaseDecreaseSum</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getCreateUsername <em>CreateUsername</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getUpdatedBy <em>UpdatedBy</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getUpdatedTime <em>UpdatedTime</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getRevision <em>Revision</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getCreatedOrgid <em>CreatedOrgid</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getImplementOrgname <em>ImplementOrgname</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getFDeptCountersignId <em>FDeptCountersignId</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getFDeptCountersignName <em>FDeptCountersignName</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getZDeptCountersignName <em>ZDeptCountersignName</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getZDeptCountersignId <em>ZDeptCountersignId</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getContractSecretLevel <em>ContractSecretLevel</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getIssecret <em>Issecret</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getProjectSecretLevel <em>ProjectSecretLevel</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getIssm <em>Issm</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getBudgetSum <em>BudgetSum</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getScalingSum <em>ScalingSum</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getContractBalance <em>ContractBalance</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getMarkType <em>MarkType</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getIsengineering <em>Isengineering</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getIntype <em>Intype</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getProcurementType <em>ProcurementType</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getSupplierSource <em>SupplierSource</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getIselectronic <em>Iselectronic</em>}</li>
 * </ul>
 * </p>
 *
 * @extends DataObject;
 */
public interface ZhPayContract extends DataObject {

	public static final String QNAME = "com.zhonghe.ame.payContract.payContract.ZhPayContract";

	public static final Type TYPE = TypeHelper.INSTANCE.getType("com.zhonghe.ame.payContract.payContract", "ZhPayContract");

	public static final IObjectFactory<ZhPayContract> FACTORY = new IObjectFactory<ZhPayContract>() {
		public ZhPayContract create() {
			return (ZhPayContract) DataFactory.INSTANCE.create(TYPE);
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
	 * @see #setId(int)
	 */
	public int getId();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getId <em>Id</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Id</em>' attribute.
	 * @see #getId()
	 */
	public void setId(int id);

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
	public String getCreateUserid();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getCreateUserid <em>CreateUserid</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>CreateUserid</em>' attribute.
	 * @see #getCreateUserid()
	 */
	public void setCreateUserid(String createUserid);

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
	public Date getCreateTime();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getCreateTime <em>CreateTime</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>CreateTime</em>' attribute.
	 * @see #getCreateTime()
	 */
	public void setCreateTime(Date createTime);

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
	public String getImplementOrg();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getImplementOrg <em>ImplementOrg</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>ImplementOrg</em>' attribute.
	 * @see #getImplementOrg()
	 */
	public void setImplementOrg(String implementOrg);

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
	public String getContractName();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getContractName <em>ContractName</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>ContractName</em>' attribute.
	 * @see #getContractName()
	 */
	public void setContractName(String contractName);

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
	public String getSignatory();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getSignatory <em>Signatory</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Signatory</em>' attribute.
	 * @see #getSignatory()
	 */
	public void setSignatory(String signatory);

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
	public String getContractSum();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getContractSum <em>ContractSum</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>ContractSum</em>' attribute.
	 * @see #getContractSum()
	 */
	public void setContractSum(String contractSum);

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
	public String getContractType();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getContractType <em>ContractType</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>ContractType</em>' attribute.
	 * @see #getContractType()
	 */
	public void setContractType(String contractType);

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
	public String getProjectSize();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getProjectSize <em>ProjectSize</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>ProjectSize</em>' attribute.
	 * @see #getProjectSize()
	 */
	public void setProjectSize(String projectSize);

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
	public String getProjectLocal();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getProjectLocal <em>ProjectLocal</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>ProjectLocal</em>' attribute.
	 * @see #getProjectLocal()
	 */
	public void setProjectLocal(String projectLocal);

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
	public String getPurchasePlan();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getPurchasePlan <em>PurchasePlan</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>PurchasePlan</em>' attribute.
	 * @see #getPurchasePlan()
	 */
	public void setPurchasePlan(String purchasePlan);

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
	public Date getStartTime();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getStartTime <em>StartTime</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>StartTime</em>' attribute.
	 * @see #getStartTime()
	 */
	public void setStartTime(Date startTime);

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
	public Date getEndTime();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getEndTime <em>EndTime</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>EndTime</em>' attribute.
	 * @see #getEndTime()
	 */
	public void setEndTime(Date endTime);

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
	public String getContractUpload();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getContractUpload <em>ContractUpload</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>ContractUpload</em>' attribute.
	 * @see #getContractUpload()
	 */
	public void setContractUpload(String contractUpload);

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
	public int getAppStatus();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getAppStatus <em>AppStatus</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>AppStatus</em>' attribute.
	 * @see #getAppStatus()
	 */
	public void setAppStatus(int appStatus);

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
	public int getProcessid();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getProcessid <em>Processid</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Processid</em>' attribute.
	 * @see #getProcessid()
	 */
	public void setProcessid(int processid);

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
	public String getEntryOrg();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getEntryOrg <em>EntryOrg</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>EntryOrg</em>' attribute.
	 * @see #getEntryOrg()
	 */
	public void setEntryOrg(String entryOrg);

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
	public String getCountersignOrg();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getCountersignOrg <em>CountersignOrg</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>CountersignOrg</em>' attribute.
	 * @see #getCountersignOrg()
	 */
	public void setCountersignOrg(String countersignOrg);

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
	public String getManageOrg();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getManageOrg <em>ManageOrg</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>ManageOrg</em>' attribute.
	 * @see #getManageOrg()
	 */
	public void setManageOrg(String manageOrg);

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
	public String getAuditOrg();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getAuditOrg <em>AuditOrg</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>AuditOrg</em>' attribute.
	 * @see #getAuditOrg()
	 */
	public void setAuditOrg(String auditOrg);

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
	public String getLeadershipOpinion();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getLeadershipOpinion <em>LeadershipOpinion</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>LeadershipOpinion</em>' attribute.
	 * @see #getLeadershipOpinion()
	 */
	public void setLeadershipOpinion(String leadershipOpinion);

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
	public String getGeneralManager();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getGeneralManager <em>GeneralManager</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>GeneralManager</em>' attribute.
	 * @see #getGeneralManager()
	 */
	public void setGeneralManager(String generalManager);

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
	public String getLegalPerson();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getLegalPerson <em>LegalPerson</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>LegalPerson</em>' attribute.
	 * @see #getLegalPerson()
	 */
	public void setLegalPerson(String legalPerson);

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
	public int getUpdateUesrid();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getUpdateUesrid <em>UpdateUesrid</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>UpdateUesrid</em>' attribute.
	 * @see #getUpdateUesrid()
	 */
	public void setUpdateUesrid(int updateUesrid);

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
	public Date getUpdateTime();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getUpdateTime <em>UpdateTime</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>UpdateTime</em>' attribute.
	 * @see #getUpdateTime()
	 */
	public void setUpdateTime(Date updateTime);

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
	public String getContractSubject();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getContractSubject <em>ContractSubject</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>ContractSubject</em>' attribute.
	 * @see #getContractSubject()
	 */
	public void setContractSubject(String contractSubject);

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
	public String getContractNo();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getContractNo <em>ContractNo</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>ContractNo</em>' attribute.
	 * @see #getContractNo()
	 */
	public void setContractNo(String contractNo);

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
	public String getPayMethod();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getPayMethod <em>PayMethod</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>PayMethod</em>' attribute.
	 * @see #getPayMethod()
	 */
	public void setPayMethod(String payMethod);

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
	public String getExecuteStatus();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getExecuteStatus <em>ExecuteStatus</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>ExecuteStatus</em>' attribute.
	 * @see #getExecuteStatus()
	 */
	public void setExecuteStatus(String executeStatus);

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
	public String getOrganizer();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getOrganizer <em>Organizer</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Organizer</em>' attribute.
	 * @see #getOrganizer()
	 */
	public void setOrganizer(String organizer);

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
	public String getCachet();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getCachet <em>Cachet</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Cachet</em>' attribute.
	 * @see #getCachet()
	 */
	public void setCachet(String cachet);

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
	public String getPayer();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getPayer <em>Payer</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Payer</em>' attribute.
	 * @see #getPayer()
	 */
	public void setPayer(String payer);

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
	public Date getSigningDate();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getSigningDate <em>SigningDate</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>SigningDate</em>' attribute.
	 * @see #getSigningDate()
	 */
	public void setSigningDate(Date signingDate);

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
	public String getContractPeriod();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getContractPeriod <em>ContractPeriod</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>ContractPeriod</em>' attribute.
	 * @see #getContractPeriod()
	 */
	public void setContractPeriod(String contractPeriod);

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
	public Date getFinishTime();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getFinishTime <em>FinishTime</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>FinishTime</em>' attribute.
	 * @see #getFinishTime()
	 */
	public void setFinishTime(Date finishTime);

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
	public String getRelateCont();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getRelateCont <em>RelateCont</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>RelateCont</em>' attribute.
	 * @see #getRelateCont()
	 */
	public void setRelateCont(String relateCont);

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
	public BigDecimal getActContractSum();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getActContractSum <em>ActContractSum</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>ActContractSum</em>' attribute.
	 * @see #getActContractSum()
	 */
	public void setActContractSum(BigDecimal actContractSum);

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
	public String getIssupagreement();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getIssupagreement <em>Issupagreement</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Issupagreement</em>' attribute.
	 * @see #getIssupagreement()
	 */
	public void setIssupagreement(String issupagreement);

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
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getRemark <em>Remark</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Remark</em>' attribute.
	 * @see #getRemark()
	 */
	public void setRemark(String remark);

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
	public int getProAppId();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getProAppId <em>ProAppId</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>ProAppId</em>' attribute.
	 * @see #getProAppId()
	 */
	public void setProAppId(int proAppId);

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
	public BigDecimal getIncreaseDecreaseSum();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getIncreaseDecreaseSum <em>IncreaseDecreaseSum</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>IncreaseDecreaseSum</em>' attribute.
	 * @see #getIncreaseDecreaseSum()
	 */
	public void setIncreaseDecreaseSum(BigDecimal increaseDecreaseSum);

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
	public String getCreateUsername();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getCreateUsername <em>CreateUsername</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>CreateUsername</em>' attribute.
	 * @see #getCreateUsername()
	 */
	public void setCreateUsername(String createUsername);

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
	public String getUpdatedBy();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getUpdatedBy <em>UpdatedBy</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>UpdatedBy</em>' attribute.
	 * @see #getUpdatedBy()
	 */
	public void setUpdatedBy(String updatedBy);

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
	public Date getUpdatedTime();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getUpdatedTime <em>UpdatedTime</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>UpdatedTime</em>' attribute.
	 * @see #getUpdatedTime()
	 */
	public void setUpdatedTime(Date updatedTime);

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
	public int getRevision();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getRevision <em>Revision</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Revision</em>' attribute.
	 * @see #getRevision()
	 */
	public void setRevision(int revision);

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
	public String getCreatedOrgid();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getCreatedOrgid <em>CreatedOrgid</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>CreatedOrgid</em>' attribute.
	 * @see #getCreatedOrgid()
	 */
	public void setCreatedOrgid(String createdOrgid);

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
	public String getImplementOrgname();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getImplementOrgname <em>ImplementOrgname</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>ImplementOrgname</em>' attribute.
	 * @see #getImplementOrgname()
	 */
	public void setImplementOrgname(String implementOrgname);

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
	public String getFDeptCountersignId();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getFDeptCountersignId <em>FDeptCountersignId</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>FDeptCountersignId</em>' attribute.
	 * @see #getFDeptCountersignId()
	 */
	public void setFDeptCountersignId(String fDeptCountersignId);

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
	public String getFDeptCountersignName();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getFDeptCountersignName <em>FDeptCountersignName</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>FDeptCountersignName</em>' attribute.
	 * @see #getFDeptCountersignName()
	 */
	public void setFDeptCountersignName(String fDeptCountersignName);

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
	public String getZDeptCountersignName();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getZDeptCountersignName <em>ZDeptCountersignName</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>ZDeptCountersignName</em>' attribute.
	 * @see #getZDeptCountersignName()
	 */
	public void setZDeptCountersignName(String zDeptCountersignName);

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
	public String getZDeptCountersignId();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getZDeptCountersignId <em>ZDeptCountersignId</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>ZDeptCountersignId</em>' attribute.
	 * @see #getZDeptCountersignId()
	 */
	public void setZDeptCountersignId(String zDeptCountersignId);

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
	public String getContractSecretLevel();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getContractSecretLevel <em>ContractSecretLevel</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>ContractSecretLevel</em>' attribute.
	 * @see #getContractSecretLevel()
	 */
	public void setContractSecretLevel(String contractSecretLevel);

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
	public String getIssecret();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getIssecret <em>Issecret</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Issecret</em>' attribute.
	 * @see #getIssecret()
	 */
	public void setIssecret(String issecret);

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
	public String getProjectSecretLevel();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getProjectSecretLevel <em>ProjectSecretLevel</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>ProjectSecretLevel</em>' attribute.
	 * @see #getProjectSecretLevel()
	 */
	public void setProjectSecretLevel(String projectSecretLevel);

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
	public String getIssm();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getIssm <em>Issm</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Issm</em>' attribute.
	 * @see #getIssm()
	 */
	public void setIssm(String issm);

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
	public String getBudgetSum();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getBudgetSum <em>BudgetSum</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>BudgetSum</em>' attribute.
	 * @see #getBudgetSum()
	 */
	public void setBudgetSum(String budgetSum);

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
	public String getScalingSum();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getScalingSum <em>ScalingSum</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>ScalingSum</em>' attribute.
	 * @see #getScalingSum()
	 */
	public void setScalingSum(String scalingSum);

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
	public String getContractBalance();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getContractBalance <em>ContractBalance</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>ContractBalance</em>' attribute.
	 * @see #getContractBalance()
	 */
	public void setContractBalance(String contractBalance);

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
	public String getMarkType();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getMarkType <em>MarkType</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>MarkType</em>' attribute.
	 * @see #getMarkType()
	 */
	public void setMarkType(String markType);

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
	public String getIsengineering();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getIsengineering <em>Isengineering</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Isengineering</em>' attribute.
	 * @see #getIsengineering()
	 */
	public void setIsengineering(String isengineering);

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
	public String getIntype();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getIntype <em>Intype</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Intype</em>' attribute.
	 * @see #getIntype()
	 */
	public void setIntype(String intype);

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
	public String getProcurementType();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getProcurementType <em>ProcurementType</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>ProcurementType</em>' attribute.
	 * @see #getProcurementType()
	 */
	public void setProcurementType(String procurementType);

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
	public String getSupplierSource();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getSupplierSource <em>SupplierSource</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>SupplierSource</em>' attribute.
	 * @see #getSupplierSource()
	 */
	public void setSupplierSource(String supplierSource);

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
	public String getIselectronic();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.ZhPayContract#getIselectronic <em>Iselectronic</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Iselectronic</em>' attribute.
	 * @see #getIselectronic()
	 */
	public void setIselectronic(String iselectronic);


}