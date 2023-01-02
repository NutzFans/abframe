/*******************************************************************************
 *
 * Copyright (c) 2001-2006 Primeton Technologies, Ltd.
 * All rights reserved.
 *
 * Created on Apr 11, 2008
 *******************************************************************************/
package com.zhonghe.ame.contractPact;

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
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.ZhChargeContract#getId <em>Id</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.ZhChargeContract#getCreateUserid <em>CreateUserid</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.ZhChargeContract#getCreateTime <em>CreateTime</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.ZhChargeContract#getImplementOrg <em>ImplementOrg</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.ZhChargeContract#getContractName <em>ContractName</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.ZhChargeContract#getSignatory <em>Signatory</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.ZhChargeContract#getContractSum <em>ContractSum</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.ZhChargeContract#getProjectSize <em>ProjectSize</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.ZhChargeContract#getProjectLocal <em>ProjectLocal</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.ZhChargeContract#getStartTime <em>StartTime</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.ZhChargeContract#getEndTime <em>EndTime</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.ZhChargeContract#getAppStatus <em>AppStatus</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.ZhChargeContract#getProcessid <em>Processid</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.ZhChargeContract#getContractSubject <em>ContractSubject</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.ZhChargeContract#getContractNo <em>ContractNo</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.ZhChargeContract#getPayMethod <em>PayMethod</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.ZhChargeContract#getExecuteStatus <em>ExecuteStatus</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.ZhChargeContract#getOrganizer <em>Organizer</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.ZhChargeContract#getDevelopmentOrg <em>DevelopmentOrg</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.ZhChargeContract#getCachet <em>Cachet</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.ZhChargeContract#getPayee <em>Payee</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.ZhChargeContract#getSigningDate <em>SigningDate</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.ZhChargeContract#getContractPeriod <em>ContractPeriod</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.ZhChargeContract#getFinishTime <em>FinishTime</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.ZhChargeContract#getHeadquarterGroup <em>HeadquarterGroup</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.ZhChargeContract#getProjectType <em>ProjectType</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.ZhChargeContract#getMajor <em>Major</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.ZhChargeContract#getRelateCont <em>RelateCont</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.ZhChargeContract#getActContractSum <em>ActContractSum</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.ZhChargeContract#getIssupagreement <em>Issupagreement</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.ZhChargeContract#getRemark <em>Remark</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.ZhChargeContract#getIncreaseDecreaseSum <em>IncreaseDecreaseSum</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.ZhChargeContract#getCreateUsername <em>CreateUsername</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.ZhChargeContract#getUpdatedBy <em>UpdatedBy</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.ZhChargeContract#getUpdatedTime <em>UpdatedTime</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.ZhChargeContract#getRevision <em>Revision</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.ZhChargeContract#getCreatedOrgid <em>CreatedOrgid</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.ZhChargeContract#getImplementOrgname <em>ImplementOrgname</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.ZhChargeContract#getFDeptCountersignId <em>FDeptCountersignId</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.ZhChargeContract#getFDeptCountersignName <em>FDeptCountersignName</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.ZhChargeContract#getZDeptCountersignName <em>ZDeptCountersignName</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.ZhChargeContract#getZDeptCountersignId <em>ZDeptCountersignId</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.ZhChargeContract#getContractSecretLevel <em>ContractSecretLevel</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.ZhChargeContract#getProjectSecretLevel <em>ProjectSecretLevel</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.ZhChargeContract#getContractBalance <em>ContractBalance</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.ZhChargeContract#getProcurementType <em>ProcurementType</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.ZhChargeContract#getNoTaxSum <em>NoTaxSum</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.ZhChargeContract#getPayTax <em>PayTax</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.ZhChargeContract#getContractModel <em>ContractModel</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.ZhChargeContract#getTenderId <em>TenderId</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.ZhChargeContract#getIsfb <em>Isfb</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.ZhChargeContract#getFinContractSum <em>FinContractSum</em>}</li>
 * </ul>
 * </p>
 *
 * @extends DataObject;
 */
public interface ZhChargeContract extends DataObject {

	public static final String QNAME = "com.zhonghe.ame.chargeContract.chargeContract.ZhChargeContract";

	public static final Type TYPE = TypeHelper.INSTANCE.getType("com.zhonghe.ame.chargeContract.chargeContract", "ZhChargeContract");

	public static final IObjectFactory<ZhChargeContract> FACTORY = new IObjectFactory<ZhChargeContract>() {
		public ZhChargeContract create() {
			return (ZhChargeContract) DataFactory.INSTANCE.create(TYPE);
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
	 * Sets the value of the '{@link com.zhonghe.ame.chargeContract.chargeContract.ZhChargeContract#getId <em>Id</em>}' attribute.
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
	 * Sets the value of the '{@link com.zhonghe.ame.chargeContract.chargeContract.ZhChargeContract#getCreateUserid <em>CreateUserid</em>}' attribute.
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
	 * Sets the value of the '{@link com.zhonghe.ame.chargeContract.chargeContract.ZhChargeContract#getCreateTime <em>CreateTime</em>}' attribute.
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
	 * Sets the value of the '{@link com.zhonghe.ame.chargeContract.chargeContract.ZhChargeContract#getImplementOrg <em>ImplementOrg</em>}' attribute.
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
	 * Sets the value of the '{@link com.zhonghe.ame.chargeContract.chargeContract.ZhChargeContract#getContractName <em>ContractName</em>}' attribute.
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
	 * Sets the value of the '{@link com.zhonghe.ame.chargeContract.chargeContract.ZhChargeContract#getSignatory <em>Signatory</em>}' attribute.
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
	 * Sets the value of the '{@link com.zhonghe.ame.chargeContract.chargeContract.ZhChargeContract#getContractSum <em>ContractSum</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>ContractSum</em>' attribute.
	 * @see #getContractSum()
	 */
	public void setContractSum(String contractSum);

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
	 * Sets the value of the '{@link com.zhonghe.ame.chargeContract.chargeContract.ZhChargeContract#getProjectSize <em>ProjectSize</em>}' attribute.
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
	 * Sets the value of the '{@link com.zhonghe.ame.chargeContract.chargeContract.ZhChargeContract#getProjectLocal <em>ProjectLocal</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>ProjectLocal</em>' attribute.
	 * @see #getProjectLocal()
	 */
	public void setProjectLocal(String projectLocal);

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
	 * Sets the value of the '{@link com.zhonghe.ame.chargeContract.chargeContract.ZhChargeContract#getStartTime <em>StartTime</em>}' attribute.
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
	 * Sets the value of the '{@link com.zhonghe.ame.chargeContract.chargeContract.ZhChargeContract#getEndTime <em>EndTime</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>EndTime</em>' attribute.
	 * @see #getEndTime()
	 */
	public void setEndTime(Date endTime);

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
	 * Sets the value of the '{@link com.zhonghe.ame.chargeContract.chargeContract.ZhChargeContract#getAppStatus <em>AppStatus</em>}' attribute.
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
	 * Sets the value of the '{@link com.zhonghe.ame.chargeContract.chargeContract.ZhChargeContract#getProcessid <em>Processid</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Processid</em>' attribute.
	 * @see #getProcessid()
	 */
	public void setProcessid(int processid);

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
	 * Sets the value of the '{@link com.zhonghe.ame.chargeContract.chargeContract.ZhChargeContract#getContractSubject <em>ContractSubject</em>}' attribute.
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
	 * Sets the value of the '{@link com.zhonghe.ame.chargeContract.chargeContract.ZhChargeContract#getContractNo <em>ContractNo</em>}' attribute.
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
	 * Sets the value of the '{@link com.zhonghe.ame.chargeContract.chargeContract.ZhChargeContract#getPayMethod <em>PayMethod</em>}' attribute.
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
	 * Sets the value of the '{@link com.zhonghe.ame.chargeContract.chargeContract.ZhChargeContract#getExecuteStatus <em>ExecuteStatus</em>}' attribute.
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
	 * Sets the value of the '{@link com.zhonghe.ame.chargeContract.chargeContract.ZhChargeContract#getOrganizer <em>Organizer</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Organizer</em>' attribute.
	 * @see #getOrganizer()
	 */
	public void setOrganizer(String organizer);

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
	public String getDevelopmentOrg();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.chargeContract.chargeContract.ZhChargeContract#getDevelopmentOrg <em>DevelopmentOrg</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>DevelopmentOrg</em>' attribute.
	 * @see #getDevelopmentOrg()
	 */
	public void setDevelopmentOrg(String developmentOrg);

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
	 * Sets the value of the '{@link com.zhonghe.ame.chargeContract.chargeContract.ZhChargeContract#getCachet <em>Cachet</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Cachet</em>' attribute.
	 * @see #getCachet()
	 */
	public void setCachet(String cachet);

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
	public String getPayee();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.chargeContract.chargeContract.ZhChargeContract#getPayee <em>Payee</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Payee</em>' attribute.
	 * @see #getPayee()
	 */
	public void setPayee(String payee);

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
	 * Sets the value of the '{@link com.zhonghe.ame.chargeContract.chargeContract.ZhChargeContract#getSigningDate <em>SigningDate</em>}' attribute.
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
	 * Sets the value of the '{@link com.zhonghe.ame.chargeContract.chargeContract.ZhChargeContract#getContractPeriod <em>ContractPeriod</em>}' attribute.
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
	 * Sets the value of the '{@link com.zhonghe.ame.chargeContract.chargeContract.ZhChargeContract#getFinishTime <em>FinishTime</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>FinishTime</em>' attribute.
	 * @see #getFinishTime()
	 */
	public void setFinishTime(Date finishTime);

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
	public String getHeadquarterGroup();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.chargeContract.chargeContract.ZhChargeContract#getHeadquarterGroup <em>HeadquarterGroup</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>HeadquarterGroup</em>' attribute.
	 * @see #getHeadquarterGroup()
	 */
	public void setHeadquarterGroup(String headquarterGroup);

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
	 * Sets the value of the '{@link com.zhonghe.ame.chargeContract.chargeContract.ZhChargeContract#getProjectType <em>ProjectType</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>ProjectType</em>' attribute.
	 * @see #getProjectType()
	 */
	public void setProjectType(String projectType);

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
	public String getMajor();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.chargeContract.chargeContract.ZhChargeContract#getMajor <em>Major</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Major</em>' attribute.
	 * @see #getMajor()
	 */
	public void setMajor(String major);

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
	 * Sets the value of the '{@link com.zhonghe.ame.chargeContract.chargeContract.ZhChargeContract#getRelateCont <em>RelateCont</em>}' attribute.
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
	 * Sets the value of the '{@link com.zhonghe.ame.chargeContract.chargeContract.ZhChargeContract#getActContractSum <em>ActContractSum</em>}' attribute.
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
	 * Sets the value of the '{@link com.zhonghe.ame.chargeContract.chargeContract.ZhChargeContract#getIssupagreement <em>Issupagreement</em>}' attribute.
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
	 * Sets the value of the '{@link com.zhonghe.ame.chargeContract.chargeContract.ZhChargeContract#getRemark <em>Remark</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Remark</em>' attribute.
	 * @see #getRemark()
	 */
	public void setRemark(String remark);

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
	 * Sets the value of the '{@link com.zhonghe.ame.chargeContract.chargeContract.ZhChargeContract#getIncreaseDecreaseSum <em>IncreaseDecreaseSum</em>}' attribute.
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
	 * Sets the value of the '{@link com.zhonghe.ame.chargeContract.chargeContract.ZhChargeContract#getCreateUsername <em>CreateUsername</em>}' attribute.
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
	 * Sets the value of the '{@link com.zhonghe.ame.chargeContract.chargeContract.ZhChargeContract#getUpdatedBy <em>UpdatedBy</em>}' attribute.
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
	 * Sets the value of the '{@link com.zhonghe.ame.chargeContract.chargeContract.ZhChargeContract#getUpdatedTime <em>UpdatedTime</em>}' attribute.
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
	 * Sets the value of the '{@link com.zhonghe.ame.chargeContract.chargeContract.ZhChargeContract#getRevision <em>Revision</em>}' attribute.
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
	 * Sets the value of the '{@link com.zhonghe.ame.chargeContract.chargeContract.ZhChargeContract#getCreatedOrgid <em>CreatedOrgid</em>}' attribute.
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
	 * Sets the value of the '{@link com.zhonghe.ame.chargeContract.chargeContract.ZhChargeContract#getImplementOrgname <em>ImplementOrgname</em>}' attribute.
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
	 * Sets the value of the '{@link com.zhonghe.ame.chargeContract.chargeContract.ZhChargeContract#getFDeptCountersignId <em>FDeptCountersignId</em>}' attribute.
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
	 * Sets the value of the '{@link com.zhonghe.ame.chargeContract.chargeContract.ZhChargeContract#getFDeptCountersignName <em>FDeptCountersignName</em>}' attribute.
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
	 * Sets the value of the '{@link com.zhonghe.ame.chargeContract.chargeContract.ZhChargeContract#getZDeptCountersignName <em>ZDeptCountersignName</em>}' attribute.
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
	 * Sets the value of the '{@link com.zhonghe.ame.chargeContract.chargeContract.ZhChargeContract#getZDeptCountersignId <em>ZDeptCountersignId</em>}' attribute.
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
	 * Sets the value of the '{@link com.zhonghe.ame.chargeContract.chargeContract.ZhChargeContract#getContractSecretLevel <em>ContractSecretLevel</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>ContractSecretLevel</em>' attribute.
	 * @see #getContractSecretLevel()
	 */
	public void setContractSecretLevel(String contractSecretLevel);

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
	 * Sets the value of the '{@link com.zhonghe.ame.chargeContract.chargeContract.ZhChargeContract#getProjectSecretLevel <em>ProjectSecretLevel</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>ProjectSecretLevel</em>' attribute.
	 * @see #getProjectSecretLevel()
	 */
	public void setProjectSecretLevel(String projectSecretLevel);

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
	 * Sets the value of the '{@link com.zhonghe.ame.chargeContract.chargeContract.ZhChargeContract#getContractBalance <em>ContractBalance</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>ContractBalance</em>' attribute.
	 * @see #getContractBalance()
	 */
	public void setContractBalance(String contractBalance);

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
	 * Sets the value of the '{@link com.zhonghe.ame.chargeContract.chargeContract.ZhChargeContract#getProcurementType <em>ProcurementType</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>ProcurementType</em>' attribute.
	 * @see #getProcurementType()
	 */
	public void setProcurementType(String procurementType);

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
	public String getNoTaxSum();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.chargeContract.chargeContract.ZhChargeContract#getNoTaxSum <em>NoTaxSum</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>NoTaxSum</em>' attribute.
	 * @see #getNoTaxSum()
	 */
	public void setNoTaxSum(String noTaxSum);

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
	public String getPayTax();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.chargeContract.chargeContract.ZhChargeContract#getPayTax <em>PayTax</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>PayTax</em>' attribute.
	 * @see #getPayTax()
	 */
	public void setPayTax(String payTax);

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
	public String getContractModel();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.chargeContract.chargeContract.ZhChargeContract#getContractModel <em>ContractModel</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>ContractModel</em>' attribute.
	 * @see #getContractModel()
	 */
	public void setContractModel(String contractModel);

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
	public String getTenderId();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.chargeContract.chargeContract.ZhChargeContract#getTenderId <em>TenderId</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>TenderId</em>' attribute.
	 * @see #getTenderId()
	 */
	public void setTenderId(String tenderId);

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
	public String getIsfb();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.chargeContract.chargeContract.ZhChargeContract#getIsfb <em>Isfb</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Isfb</em>' attribute.
	 * @see #getIsfb()
	 */
	public void setIsfb(String isfb);

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
	public String getFinContractSum();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.chargeContract.chargeContract.ZhChargeContract#getFinContractSum <em>FinContractSum</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>FinContractSum</em>' attribute.
	 * @see #getFinContractSum()
	 */
	public void setFinContractSum(String finContractSum);


}