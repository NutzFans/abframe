/*******************************************************************************
 *
 * Copyright (c) 2001-2006 Primeton Technologies, Ltd.
 * All rights reserved.
 *
 * Created on Apr 11, 2008
 *******************************************************************************/
package com.zhonghe.ame.marketInfo.marketinfo.khxx;

import com.primeton.ext.data.sdo.DataUtil;
import com.primeton.ext.data.sdo.ExtendedDataObjectImpl;
import commonj.sdo.Type;

import java.util.Date;

/**
 * <!-- begin-user-doc -->
 * A representation of the model object '<em><b>Test</b></em>'.
 * <!-- end-user-doc -->
 *
 * <p>
 * The following features are supported:
 * <ul>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.impl.ZhBidinfoImpl#getId <em>Id</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.impl.ZhBidinfoImpl#getProjectId <em>ProjectId</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.impl.ZhBidinfoImpl#getCustinfoId <em>CustinfoId</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.impl.ZhBidinfoImpl#getProxyCompany <em>ProxyCompany</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.impl.ZhBidinfoImpl#getProjectSize <em>ProjectSize</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.impl.ZhBidinfoImpl#getProjectLocal <em>ProjectLocal</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.impl.ZhBidinfoImpl#getOrgId <em>OrgId</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.impl.ZhBidinfoImpl#getBidStatus <em>BidStatus</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.impl.ZhBidinfoImpl#getContractCode <em>ContractCode</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.impl.ZhBidinfoImpl#getBidPrice <em>BidPrice</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.impl.ZhBidinfoImpl#getBidOpenTime <em>BidOpenTime</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.impl.ZhBidinfoImpl#getSubmitStatus <em>SubmitStatus</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.impl.ZhBidinfoImpl#getContractCycle <em>ContractCycle</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.impl.ZhBidinfoImpl#getBidMode <em>BidMode</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.impl.ZhBidinfoImpl#getCreatUserid <em>CreatUserid</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.impl.ZhBidinfoImpl#getCreatTime <em>CreatTime</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.impl.ZhBidinfoImpl#getUpdateUesrid <em>UpdateUesrid</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.impl.ZhBidinfoImpl#getUpdateTime <em>UpdateTime</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.impl.ZhBidinfoImpl#getRemake <em>Remake</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.impl.ZhBidinfoImpl#getTbPrice <em>TbPrice</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.impl.ZhBidinfoImpl#getStartTime <em>StartTime</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.impl.ZhBidinfoImpl#getStopTime <em>StopTime</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.impl.ZhBidinfoImpl#getProjectName <em>ProjectName</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.impl.ZhBidinfoImpl#getExternalType <em>ExternalType</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.impl.ZhBidinfoImpl#getPartyName <em>PartyName</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.impl.ZhBidinfoImpl#getInvestmentAmount <em>InvestmentAmount</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.impl.ZhBidinfoImpl#getMatterAmount <em>MatterAmount</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.impl.ZhBidinfoImpl#getHeadquarterGroup <em>HeadquarterGroup</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.impl.ZhBidinfoImpl#getCharacteristics <em>Characteristics</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.impl.ZhBidinfoImpl#getScopeService <em>ScopeService</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.impl.ZhBidinfoImpl#getMajor <em>Major</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.impl.ZhBidinfoImpl#getFeatures <em>Features</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.impl.ZhBidinfoImpl#getServiceType <em>ServiceType</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.impl.ZhBidinfoImpl#getContractType <em>ContractType</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.impl.ZhBidinfoImpl#getProcurementType <em>ProcurementType</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.impl.ZhBidinfoImpl#getPriceModel <em>PriceModel</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.impl.ZhBidinfoImpl#getEquivalent <em>Equivalent</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.impl.ZhBidinfoImpl#getBidResult <em>BidResult</em>}</li>
 * </ul>
 * </p>
 *
 * @extends ExtendedDataObjectImpl;
 *
 * @implements ZhBidinfo;
 */

public class ZhBidinfoImpl extends ExtendedDataObjectImpl implements ZhBidinfo {
	/**
	 * Comment for <code>serialVersionUID</code>
	 */
	private static final long serialVersionUID = 1L;
	public final static int INDEX_ID = 0;
	public final static int INDEX_PROJECTID = 1;
	public final static int INDEX_CUSTINFOID = 2;
	public final static int INDEX_PROXYCOMPANY = 3;
	public final static int INDEX_PROJECTSIZE = 4;
	public final static int INDEX_PROJECTLOCAL = 5;
	public final static int INDEX_ORGID = 6;
	public final static int INDEX_BIDSTATUS = 7;
	public final static int INDEX_CONTRACTCODE = 8;
	public final static int INDEX_BIDPRICE = 9;
	public final static int INDEX_BIDOPENTIME = 10;
	public final static int INDEX_SUBMITSTATUS = 11;
	public final static int INDEX_CONTRACTCYCLE = 12;
	public final static int INDEX_BIDMODE = 13;
	public final static int INDEX_CREATUSERID = 14;
	public final static int INDEX_CREATTIME = 15;
	public final static int INDEX_UPDATEUESRID = 16;
	public final static int INDEX_UPDATETIME = 17;
	public final static int INDEX_REMAKE = 18;
	public final static int INDEX_TBPRICE = 19;
	public final static int INDEX_STARTTIME = 20;
	public final static int INDEX_STOPTIME = 21;
	public final static int INDEX_PROJECTNAME = 22;
	public final static int INDEX_EXTERNALTYPE = 23;
	public final static int INDEX_PARTYNAME = 24;
	public final static int INDEX_INVESTMENTAMOUNT = 25;
	public final static int INDEX_MATTERAMOUNT = 26;
	public final static int INDEX_HEADQUARTERGROUP = 27;
	public final static int INDEX_CHARACTERISTICS = 28;
	public final static int INDEX_SCOPESERVICE = 29;
	public final static int INDEX_MAJOR = 30;
	public final static int INDEX_FEATURES = 31;
	public final static int INDEX_SERVICETYPE = 32;
	public final static int INDEX_CONTRACTTYPE = 33;
	public final static int INDEX_PROCUREMENTTYPE = 34;
	public final static int INDEX_PRICEMODEL = 35;
	public final static int INDEX_EQUIVALENT = 36;
	public final static int INDEX_BIDRESULT = 37;
	public static final int SDO_PROPERTY_COUNT = 38;

	public static final int EXTENDED_PROPERTY_COUNT = -1;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 */
	public ZhBidinfoImpl() {
		this(TYPE);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 */
	public ZhBidinfoImpl(Type type) {
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
	 * Returns the value of the '<em><b>ProjectId</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>ProjectId</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>ProjectId</em>' attribute.
	 * @see #setProjectId(int)
	 */
	public int getProjectId() {
		return DataUtil.toInt(super.getByIndex(INDEX_PROJECTID, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getProjectId <em>ProjectId</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>ProjectId</em>' attribute.
	 * @see #getProjectId()
	 */
	public void setProjectId(int projectId) {
		super.setByIndex(INDEX_PROJECTID, projectId);
	}

	/**
	 * Returns the value of the '<em><b>CustinfoId</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>CustinfoId</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>CustinfoId</em>' attribute.
	 * @see #setCustinfoId(int)
	 */
	public int getCustinfoId() {
		return DataUtil.toInt(super.getByIndex(INDEX_CUSTINFOID, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getCustinfoId <em>CustinfoId</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>CustinfoId</em>' attribute.
	 * @see #getCustinfoId()
	 */
	public void setCustinfoId(int custinfoId) {
		super.setByIndex(INDEX_CUSTINFOID, custinfoId);
	}

	/**
	 * Returns the value of the '<em><b>ProxyCompany</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>ProxyCompany</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>ProxyCompany</em>' attribute.
	 * @see #setProxyCompany(java.lang.String)
	 */
	public String getProxyCompany() {
		return DataUtil.toString(super.getByIndex(INDEX_PROXYCOMPANY, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getProxyCompany <em>ProxyCompany</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>ProxyCompany</em>' attribute.
	 * @see #getProxyCompany()
	 */
	public void setProxyCompany(String proxyCompany) {
		super.setByIndex(INDEX_PROXYCOMPANY, proxyCompany);
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
	 * Returns the value of the '<em><b>OrgId</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>OrgId</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>OrgId</em>' attribute.
	 * @see #setOrgId(int)
	 */
	public int getOrgId() {
		return DataUtil.toInt(super.getByIndex(INDEX_ORGID, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getOrgId <em>OrgId</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>OrgId</em>' attribute.
	 * @see #getOrgId()
	 */
	public void setOrgId(int orgId) {
		super.setByIndex(INDEX_ORGID, orgId);
	}

	/**
	 * Returns the value of the '<em><b>BidStatus</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>BidStatus</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>BidStatus</em>' attribute.
	 * @see #setBidStatus(int)
	 */
	public int getBidStatus() {
		return DataUtil.toInt(super.getByIndex(INDEX_BIDSTATUS, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getBidStatus <em>BidStatus</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>BidStatus</em>' attribute.
	 * @see #getBidStatus()
	 */
	public void setBidStatus(int bidStatus) {
		super.setByIndex(INDEX_BIDSTATUS, bidStatus);
	}

	/**
	 * Returns the value of the '<em><b>ContractCode</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>ContractCode</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>ContractCode</em>' attribute.
	 * @see #setContractCode(java.lang.String)
	 */
	public String getContractCode() {
		return DataUtil.toString(super.getByIndex(INDEX_CONTRACTCODE, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getContractCode <em>ContractCode</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>ContractCode</em>' attribute.
	 * @see #getContractCode()
	 */
	public void setContractCode(String contractCode) {
		super.setByIndex(INDEX_CONTRACTCODE, contractCode);
	}

	/**
	 * Returns the value of the '<em><b>BidPrice</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>BidPrice</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>BidPrice</em>' attribute.
	 * @see #setBidPrice(java.lang.String)
	 */
	public String getBidPrice() {
		return DataUtil.toString(super.getByIndex(INDEX_BIDPRICE, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getBidPrice <em>BidPrice</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>BidPrice</em>' attribute.
	 * @see #getBidPrice()
	 */
	public void setBidPrice(String bidPrice) {
		super.setByIndex(INDEX_BIDPRICE, bidPrice);
	}

	/**
	 * Returns the value of the '<em><b>BidOpenTime</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>BidOpenTime</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>BidOpenTime</em>' attribute.
	 * @see #setBidOpenTime(java.util.Date)
	 */
	public Date getBidOpenTime() {
		return DataUtil.toDate(super.getByIndex(INDEX_BIDOPENTIME, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getBidOpenTime <em>BidOpenTime</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>BidOpenTime</em>' attribute.
	 * @see #getBidOpenTime()
	 */
	public void setBidOpenTime(Date bidOpenTime) {
		super.setByIndex(INDEX_BIDOPENTIME, bidOpenTime);
	}

	/**
	 * Returns the value of the '<em><b>SubmitStatus</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>SubmitStatus</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>SubmitStatus</em>' attribute.
	 * @see #setSubmitStatus(java.lang.String)
	 */
	public String getSubmitStatus() {
		return DataUtil.toString(super.getByIndex(INDEX_SUBMITSTATUS, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getSubmitStatus <em>SubmitStatus</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>SubmitStatus</em>' attribute.
	 * @see #getSubmitStatus()
	 */
	public void setSubmitStatus(String submitStatus) {
		super.setByIndex(INDEX_SUBMITSTATUS, submitStatus);
	}

	/**
	 * Returns the value of the '<em><b>ContractCycle</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>ContractCycle</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>ContractCycle</em>' attribute.
	 * @see #setContractCycle(java.lang.String)
	 */
	public String getContractCycle() {
		return DataUtil.toString(super.getByIndex(INDEX_CONTRACTCYCLE, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getContractCycle <em>ContractCycle</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>ContractCycle</em>' attribute.
	 * @see #getContractCycle()
	 */
	public void setContractCycle(String contractCycle) {
		super.setByIndex(INDEX_CONTRACTCYCLE, contractCycle);
	}

	/**
	 * Returns the value of the '<em><b>BidMode</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>BidMode</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>BidMode</em>' attribute.
	 * @see #setBidMode(java.lang.String)
	 */
	public String getBidMode() {
		return DataUtil.toString(super.getByIndex(INDEX_BIDMODE, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getBidMode <em>BidMode</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>BidMode</em>' attribute.
	 * @see #getBidMode()
	 */
	public void setBidMode(String bidMode) {
		super.setByIndex(INDEX_BIDMODE, bidMode);
	}

	/**
	 * Returns the value of the '<em><b>CreatUserid</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>CreatUserid</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>CreatUserid</em>' attribute.
	 * @see #setCreatUserid(java.lang.String)
	 */
	public String getCreatUserid() {
		return DataUtil.toString(super.getByIndex(INDEX_CREATUSERID, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getCreatUserid <em>CreatUserid</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>CreatUserid</em>' attribute.
	 * @see #getCreatUserid()
	 */
	public void setCreatUserid(String creatUserid) {
		super.setByIndex(INDEX_CREATUSERID, creatUserid);
	}

	/**
	 * Returns the value of the '<em><b>CreatTime</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>CreatTime</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>CreatTime</em>' attribute.
	 * @see #setCreatTime(java.util.Date)
	 */
	public Date getCreatTime() {
		return DataUtil.toDate(super.getByIndex(INDEX_CREATTIME, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getCreatTime <em>CreatTime</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>CreatTime</em>' attribute.
	 * @see #getCreatTime()
	 */
	public void setCreatTime(Date creatTime) {
		super.setByIndex(INDEX_CREATTIME, creatTime);
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
	 * Returns the value of the '<em><b>Remake</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Remake</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Remake</em>' attribute.
	 * @see #setRemake(java.lang.String)
	 */
	public String getRemake() {
		return DataUtil.toString(super.getByIndex(INDEX_REMAKE, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getRemake <em>Remake</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Remake</em>' attribute.
	 * @see #getRemake()
	 */
	public void setRemake(String remake) {
		super.setByIndex(INDEX_REMAKE, remake);
	}

	/**
	 * Returns the value of the '<em><b>TbPrice</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>TbPrice</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>TbPrice</em>' attribute.
	 * @see #setTbPrice(java.lang.String)
	 */
	public String getTbPrice() {
		return DataUtil.toString(super.getByIndex(INDEX_TBPRICE, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getTbPrice <em>TbPrice</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>TbPrice</em>' attribute.
	 * @see #getTbPrice()
	 */
	public void setTbPrice(String tbPrice) {
		super.setByIndex(INDEX_TBPRICE, tbPrice);
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
	 * Returns the value of the '<em><b>StopTime</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>StopTime</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>StopTime</em>' attribute.
	 * @see #setStopTime(java.util.Date)
	 */
	public Date getStopTime() {
		return DataUtil.toDate(super.getByIndex(INDEX_STOPTIME, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getStopTime <em>StopTime</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>StopTime</em>' attribute.
	 * @see #getStopTime()
	 */
	public void setStopTime(Date stopTime) {
		super.setByIndex(INDEX_STOPTIME, stopTime);
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
	 * Returns the value of the '<em><b>ExternalType</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>ExternalType</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>ExternalType</em>' attribute.
	 * @see #setExternalType(java.lang.String)
	 */
	public String getExternalType() {
		return DataUtil.toString(super.getByIndex(INDEX_EXTERNALTYPE, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getExternalType <em>ExternalType</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>ExternalType</em>' attribute.
	 * @see #getExternalType()
	 */
	public void setExternalType(String externalType) {
		super.setByIndex(INDEX_EXTERNALTYPE, externalType);
	}

	/**
	 * Returns the value of the '<em><b>PartyName</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>PartyName</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>PartyName</em>' attribute.
	 * @see #setPartyName(java.lang.String)
	 */
	public String getPartyName() {
		return DataUtil.toString(super.getByIndex(INDEX_PARTYNAME, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getPartyName <em>PartyName</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>PartyName</em>' attribute.
	 * @see #getPartyName()
	 */
	public void setPartyName(String partyName) {
		super.setByIndex(INDEX_PARTYNAME, partyName);
	}

	/**
	 * Returns the value of the '<em><b>InvestmentAmount</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>InvestmentAmount</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>InvestmentAmount</em>' attribute.
	 * @see #setInvestmentAmount(java.lang.String)
	 */
	public String getInvestmentAmount() {
		return DataUtil.toString(super.getByIndex(INDEX_INVESTMENTAMOUNT, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getInvestmentAmount <em>InvestmentAmount</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>InvestmentAmount</em>' attribute.
	 * @see #getInvestmentAmount()
	 */
	public void setInvestmentAmount(String investmentAmount) {
		super.setByIndex(INDEX_INVESTMENTAMOUNT, investmentAmount);
	}

	/**
	 * Returns the value of the '<em><b>MatterAmount</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>MatterAmount</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>MatterAmount</em>' attribute.
	 * @see #setMatterAmount(java.lang.String)
	 */
	public String getMatterAmount() {
		return DataUtil.toString(super.getByIndex(INDEX_MATTERAMOUNT, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getMatterAmount <em>MatterAmount</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>MatterAmount</em>' attribute.
	 * @see #getMatterAmount()
	 */
	public void setMatterAmount(String matterAmount) {
		super.setByIndex(INDEX_MATTERAMOUNT, matterAmount);
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
	 * Returns the value of the '<em><b>Characteristics</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Characteristics</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Characteristics</em>' attribute.
	 * @see #setCharacteristics(java.lang.String)
	 */
	public String getCharacteristics() {
		return DataUtil.toString(super.getByIndex(INDEX_CHARACTERISTICS, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getCharacteristics <em>Characteristics</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Characteristics</em>' attribute.
	 * @see #getCharacteristics()
	 */
	public void setCharacteristics(String characteristics) {
		super.setByIndex(INDEX_CHARACTERISTICS, characteristics);
	}

	/**
	 * Returns the value of the '<em><b>ScopeService</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>ScopeService</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>ScopeService</em>' attribute.
	 * @see #setScopeService(java.lang.String)
	 */
	public String getScopeService() {
		return DataUtil.toString(super.getByIndex(INDEX_SCOPESERVICE, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getScopeService <em>ScopeService</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>ScopeService</em>' attribute.
	 * @see #getScopeService()
	 */
	public void setScopeService(String scopeService) {
		super.setByIndex(INDEX_SCOPESERVICE, scopeService);
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
	 * Returns the value of the '<em><b>Features</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Features</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Features</em>' attribute.
	 * @see #setFeatures(java.lang.String)
	 */
	public String getFeatures() {
		return DataUtil.toString(super.getByIndex(INDEX_FEATURES, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getFeatures <em>Features</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Features</em>' attribute.
	 * @see #getFeatures()
	 */
	public void setFeatures(String features) {
		super.setByIndex(INDEX_FEATURES, features);
	}

	/**
	 * Returns the value of the '<em><b>ServiceType</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>ServiceType</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>ServiceType</em>' attribute.
	 * @see #setServiceType(java.lang.String)
	 */
	public String getServiceType() {
		return DataUtil.toString(super.getByIndex(INDEX_SERVICETYPE, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getServiceType <em>ServiceType</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>ServiceType</em>' attribute.
	 * @see #getServiceType()
	 */
	public void setServiceType(String serviceType) {
		super.setByIndex(INDEX_SERVICETYPE, serviceType);
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
	 * Returns the value of the '<em><b>PriceModel</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>PriceModel</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>PriceModel</em>' attribute.
	 * @see #setPriceModel(java.lang.String)
	 */
	public String getPriceModel() {
		return DataUtil.toString(super.getByIndex(INDEX_PRICEMODEL, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getPriceModel <em>PriceModel</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>PriceModel</em>' attribute.
	 * @see #getPriceModel()
	 */
	public void setPriceModel(String priceModel) {
		super.setByIndex(INDEX_PRICEMODEL, priceModel);
	}

	/**
	 * Returns the value of the '<em><b>Equivalent</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Equivalent</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Equivalent</em>' attribute.
	 * @see #setEquivalent(java.lang.String)
	 */
	public String getEquivalent() {
		return DataUtil.toString(super.getByIndex(INDEX_EQUIVALENT, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getEquivalent <em>Equivalent</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Equivalent</em>' attribute.
	 * @see #getEquivalent()
	 */
	public void setEquivalent(String equivalent) {
		super.setByIndex(INDEX_EQUIVALENT, equivalent);
	}

	/**
	 * Returns the value of the '<em><b>BidResult</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>BidResult</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>BidResult</em>' attribute.
	 * @see #setBidResult(java.lang.String)
	 */
	public String getBidResult() {
		return DataUtil.toString(super.getByIndex(INDEX_BIDRESULT, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getBidResult <em>BidResult</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>BidResult</em>' attribute.
	 * @see #getBidResult()
	 */
	public void setBidResult(String bidResult) {
		super.setByIndex(INDEX_BIDRESULT, bidResult);
	}


}