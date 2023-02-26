/*******************************************************************************
 *
 * Copyright (c) 2001-2006 Primeton Technologies, Ltd.
 * All rights reserved.
 *
 * Created on Apr 11, 2008
 *******************************************************************************/
package com.zhonghe.ame.marketInfo.bid.impl;

import com.primeton.ext.data.sdo.DataUtil;
import com.primeton.ext.data.sdo.ExtendedDataObjectImpl;
import com.zhonghe.ame.marketInfo.bid.ZhBidinfo;

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
 *   <li>{@link com.zhonghe.ame.marketInfo.bid.impl.ZhBidinfoImpl#getId <em>Id</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.bid.impl.ZhBidinfoImpl#getBidOrg <em>BidOrg</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.bid.impl.ZhBidinfoImpl#getRecordDate <em>RecordDate</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.bid.impl.ZhBidinfoImpl#getBidNxwl <em>BidNxwl</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.bid.impl.ZhBidinfoImpl#getCustId <em>CustId</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.bid.impl.ZhBidinfoImpl#getProjectName <em>ProjectName</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.bid.impl.ZhBidinfoImpl#getInvestAmount <em>InvestAmount</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.bid.impl.ZhBidinfoImpl#getBidBde <em>BidBde</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.bid.impl.ZhBidinfoImpl#getHeadquarterGroup <em>HeadquarterGroup</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.bid.impl.ZhBidinfoImpl#getProjectPlace <em>ProjectPlace</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.bid.impl.ZhBidinfoImpl#getBidFeatures <em>BidFeatures</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.bid.impl.ZhBidinfoImpl#getProjectType <em>ProjectType</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.bid.impl.ZhBidinfoImpl#getMajorType <em>MajorType</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.bid.impl.ZhBidinfoImpl#getBidService <em>BidService</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.bid.impl.ZhBidinfoImpl#getProjectFeatures <em>ProjectFeatures</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.bid.impl.ZhBidinfoImpl#getContractType <em>ContractType</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.bid.impl.ZhBidinfoImpl#getProcurementType <em>ProcurementType</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.bid.impl.ZhBidinfoImpl#getBidUnitsCode <em>BidUnitsCode</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.bid.impl.ZhBidinfoImpl#getContractPrice <em>ContractPrice</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.bid.impl.ZhBidinfoImpl#getContractModel <em>ContractModel</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.bid.impl.ZhBidinfoImpl#getBidConvert <em>BidConvert</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.bid.impl.ZhBidinfoImpl#getRemark <em>Remark</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.bid.impl.ZhBidinfoImpl#getBidResult <em>BidResult</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.bid.impl.ZhBidinfoImpl#getCreateUserid <em>CreateUserid</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.bid.impl.ZhBidinfoImpl#getCreateDate <em>CreateDate</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.bid.impl.ZhBidinfoImpl#getBidUnitsName <em>BidUnitsName</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.bid.impl.ZhBidinfoImpl#getBidDataStatus <em>BidDataStatus</em>}</li>
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
	public final static int INDEX_BIDORG = 1;
	public final static int INDEX_RECORDDATE = 2;
	public final static int INDEX_BIDNXWL = 3;
	public final static int INDEX_CUSTID = 4;
	public final static int INDEX_PROJECTNAME = 5;
	public final static int INDEX_INVESTAMOUNT = 6;
	public final static int INDEX_BIDBDE = 7;
	public final static int INDEX_HEADQUARTERGROUP = 8;
	public final static int INDEX_PROJECTPLACE = 9;
	public final static int INDEX_BIDFEATURES = 10;
	public final static int INDEX_PROJECTTYPE = 11;
	public final static int INDEX_MAJORTYPE = 12;
	public final static int INDEX_BIDSERVICE = 13;
	public final static int INDEX_PROJECTFEATURES = 14;
	public final static int INDEX_CONTRACTTYPE = 15;
	public final static int INDEX_PROCUREMENTTYPE = 16;
	public final static int INDEX_BIDUNITSCODE = 17;
	public final static int INDEX_CONTRACTPRICE = 18;
	public final static int INDEX_CONTRACTMODEL = 19;
	public final static int INDEX_BIDCONVERT = 20;
	public final static int INDEX_REMARK = 21;
	public final static int INDEX_BIDRESULT = 22;
	public final static int INDEX_CREATEUSERID = 23;
	public final static int INDEX_CREATEDATE = 24;
	public final static int INDEX_BIDUNITSNAME = 25;
	public final static int INDEX_BIDDATASTATUS = 26;
	public static final int SDO_PROPERTY_COUNT = 27;

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
	 * Returns the value of the '<em><b>BidOrg</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>BidOrg</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>BidOrg</em>' attribute.
	 * @see #setBidOrg(java.lang.String)
	 */
	public String getBidOrg() {
		return DataUtil.toString(super.getByIndex(INDEX_BIDORG, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getBidOrg <em>BidOrg</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>BidOrg</em>' attribute.
	 * @see #getBidOrg()
	 */
	public void setBidOrg(String bidOrg) {
		super.setByIndex(INDEX_BIDORG, bidOrg);
	}

	/**
	 * Returns the value of the '<em><b>RecordDate</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>RecordDate</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>RecordDate</em>' attribute.
	 * @see #setRecordDate(java.util.Date)
	 */
	public Date getRecordDate() {
		return DataUtil.toDate(super.getByIndex(INDEX_RECORDDATE, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getRecordDate <em>RecordDate</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>RecordDate</em>' attribute.
	 * @see #getRecordDate()
	 */
	public void setRecordDate(Date recordDate) {
		super.setByIndex(INDEX_RECORDDATE, recordDate);
	}

	/**
	 * Returns the value of the '<em><b>BidNxwl</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>BidNxwl</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>BidNxwl</em>' attribute.
	 * @see #setBidNxwl(java.lang.String)
	 */
	public String getBidNxwl() {
		return DataUtil.toString(super.getByIndex(INDEX_BIDNXWL, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getBidNxwl <em>BidNxwl</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>BidNxwl</em>' attribute.
	 * @see #getBidNxwl()
	 */
	public void setBidNxwl(String bidNxwl) {
		super.setByIndex(INDEX_BIDNXWL, bidNxwl);
	}

	/**
	 * Returns the value of the '<em><b>CustId</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>CustId</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>CustId</em>' attribute.
	 * @see #setCustId(int)
	 */
	public int getCustId() {
		return DataUtil.toInt(super.getByIndex(INDEX_CUSTID, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getCustId <em>CustId</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>CustId</em>' attribute.
	 * @see #getCustId()
	 */
	public void setCustId(int custId) {
		super.setByIndex(INDEX_CUSTID, custId);
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
	 * Returns the value of the '<em><b>InvestAmount</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>InvestAmount</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>InvestAmount</em>' attribute.
	 * @see #setInvestAmount(java.lang.String)
	 */
	public String getInvestAmount() {
		return DataUtil.toString(super.getByIndex(INDEX_INVESTAMOUNT, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getInvestAmount <em>InvestAmount</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>InvestAmount</em>' attribute.
	 * @see #getInvestAmount()
	 */
	public void setInvestAmount(String investAmount) {
		super.setByIndex(INDEX_INVESTAMOUNT, investAmount);
	}

	/**
	 * Returns the value of the '<em><b>BidBde</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>BidBde</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>BidBde</em>' attribute.
	 * @see #setBidBde(java.lang.String)
	 */
	public String getBidBde() {
		return DataUtil.toString(super.getByIndex(INDEX_BIDBDE, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getBidBde <em>BidBde</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>BidBde</em>' attribute.
	 * @see #getBidBde()
	 */
	public void setBidBde(String bidBde) {
		super.setByIndex(INDEX_BIDBDE, bidBde);
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
	 * Returns the value of the '<em><b>ProjectPlace</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>ProjectPlace</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>ProjectPlace</em>' attribute.
	 * @see #setProjectPlace(java.lang.String)
	 */
	public String getProjectPlace() {
		return DataUtil.toString(super.getByIndex(INDEX_PROJECTPLACE, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getProjectPlace <em>ProjectPlace</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>ProjectPlace</em>' attribute.
	 * @see #getProjectPlace()
	 */
	public void setProjectPlace(String projectPlace) {
		super.setByIndex(INDEX_PROJECTPLACE, projectPlace);
	}

	/**
	 * Returns the value of the '<em><b>BidFeatures</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>BidFeatures</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>BidFeatures</em>' attribute.
	 * @see #setBidFeatures(java.lang.String)
	 */
	public String getBidFeatures() {
		return DataUtil.toString(super.getByIndex(INDEX_BIDFEATURES, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getBidFeatures <em>BidFeatures</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>BidFeatures</em>' attribute.
	 * @see #getBidFeatures()
	 */
	public void setBidFeatures(String bidFeatures) {
		super.setByIndex(INDEX_BIDFEATURES, bidFeatures);
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
	 * Returns the value of the '<em><b>MajorType</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>MajorType</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>MajorType</em>' attribute.
	 * @see #setMajorType(java.lang.String)
	 */
	public String getMajorType() {
		return DataUtil.toString(super.getByIndex(INDEX_MAJORTYPE, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getMajorType <em>MajorType</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>MajorType</em>' attribute.
	 * @see #getMajorType()
	 */
	public void setMajorType(String majorType) {
		super.setByIndex(INDEX_MAJORTYPE, majorType);
	}

	/**
	 * Returns the value of the '<em><b>BidService</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>BidService</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>BidService</em>' attribute.
	 * @see #setBidService(java.lang.String)
	 */
	public String getBidService() {
		return DataUtil.toString(super.getByIndex(INDEX_BIDSERVICE, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getBidService <em>BidService</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>BidService</em>' attribute.
	 * @see #getBidService()
	 */
	public void setBidService(String bidService) {
		super.setByIndex(INDEX_BIDSERVICE, bidService);
	}

	/**
	 * Returns the value of the '<em><b>ProjectFeatures</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>ProjectFeatures</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>ProjectFeatures</em>' attribute.
	 * @see #setProjectFeatures(java.lang.String)
	 */
	public String getProjectFeatures() {
		return DataUtil.toString(super.getByIndex(INDEX_PROJECTFEATURES, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getProjectFeatures <em>ProjectFeatures</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>ProjectFeatures</em>' attribute.
	 * @see #getProjectFeatures()
	 */
	public void setProjectFeatures(String projectFeatures) {
		super.setByIndex(INDEX_PROJECTFEATURES, projectFeatures);
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
	 * Returns the value of the '<em><b>BidUnitsCode</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>BidUnitsCode</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>BidUnitsCode</em>' attribute.
	 * @see #setBidUnitsCode(java.lang.String)
	 */
	public String getBidUnitsCode() {
		return DataUtil.toString(super.getByIndex(INDEX_BIDUNITSCODE, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getBidUnitsCode <em>BidUnitsCode</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>BidUnitsCode</em>' attribute.
	 * @see #getBidUnitsCode()
	 */
	public void setBidUnitsCode(String bidUnitsCode) {
		super.setByIndex(INDEX_BIDUNITSCODE, bidUnitsCode);
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
	 * Returns the value of the '<em><b>BidConvert</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>BidConvert</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>BidConvert</em>' attribute.
	 * @see #setBidConvert(java.lang.String)
	 */
	public String getBidConvert() {
		return DataUtil.toString(super.getByIndex(INDEX_BIDCONVERT, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getBidConvert <em>BidConvert</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>BidConvert</em>' attribute.
	 * @see #getBidConvert()
	 */
	public void setBidConvert(String bidConvert) {
		super.setByIndex(INDEX_BIDCONVERT, bidConvert);
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
	 * Returns the value of the '<em><b>CreateDate</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>CreateDate</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>CreateDate</em>' attribute.
	 * @see #setCreateDate(java.util.Date)
	 */
	public Date getCreateDate() {
		return DataUtil.toDate(super.getByIndex(INDEX_CREATEDATE, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getCreateDate <em>CreateDate</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>CreateDate</em>' attribute.
	 * @see #getCreateDate()
	 */
	public void setCreateDate(Date createDate) {
		super.setByIndex(INDEX_CREATEDATE, createDate);
	}

	/**
	 * Returns the value of the '<em><b>BidUnitsName</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>BidUnitsName</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>BidUnitsName</em>' attribute.
	 * @see #setBidUnitsName(java.lang.String)
	 */
	public String getBidUnitsName() {
		return DataUtil.toString(super.getByIndex(INDEX_BIDUNITSNAME, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getBidUnitsName <em>BidUnitsName</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>BidUnitsName</em>' attribute.
	 * @see #getBidUnitsName()
	 */
	public void setBidUnitsName(String bidUnitsName) {
		super.setByIndex(INDEX_BIDUNITSNAME, bidUnitsName);
	}

	/**
	 * Returns the value of the '<em><b>BidDataStatus</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>BidDataStatus</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>BidDataStatus</em>' attribute.
	 * @see #setBidDataStatus(java.lang.String)
	 */
	public String getBidDataStatus() {
		return DataUtil.toString(super.getByIndex(INDEX_BIDDATASTATUS, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getBidDataStatus <em>BidDataStatus</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>BidDataStatus</em>' attribute.
	 * @see #getBidDataStatus()
	 */
	public void setBidDataStatus(String bidDataStatus) {
		super.setByIndex(INDEX_BIDDATASTATUS, bidDataStatus);
	}


}