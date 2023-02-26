/*******************************************************************************
 *
 * Copyright (c) 2001-2006 Primeton Technologies, Ltd.
 * All rights reserved.
 *
 * Created on Apr 11, 2008
 *******************************************************************************/
package com.zhonghe.ame.marketInfo.bid;

import com.eos.data.sdo.IObjectFactory;

import commonj.sdo.DataObject;
import commonj.sdo.Type;
import commonj.sdo.helper.DataFactory;
import commonj.sdo.helper.TypeHelper;

import java.util.Date;

/**
 * <!-- begin-user-doc -->
 * A representation of the model object '<em><b>Test</b></em>'.
 * <!-- end-user-doc -->
 *
 * <p>
 * The following features are supported:
 * <ul>
 *   <li>{@link com.zhonghe.ame.marketInfo.bid.ZhBidinfo#getId <em>Id</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.bid.ZhBidinfo#getBidOrg <em>BidOrg</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.bid.ZhBidinfo#getRecordDate <em>RecordDate</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.bid.ZhBidinfo#getBidNxwl <em>BidNxwl</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.bid.ZhBidinfo#getCustId <em>CustId</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.bid.ZhBidinfo#getProjectName <em>ProjectName</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.bid.ZhBidinfo#getInvestAmount <em>InvestAmount</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.bid.ZhBidinfo#getBidBde <em>BidBde</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.bid.ZhBidinfo#getHeadquarterGroup <em>HeadquarterGroup</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.bid.ZhBidinfo#getProjectPlace <em>ProjectPlace</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.bid.ZhBidinfo#getBidFeatures <em>BidFeatures</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.bid.ZhBidinfo#getProjectType <em>ProjectType</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.bid.ZhBidinfo#getMajorType <em>MajorType</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.bid.ZhBidinfo#getBidService <em>BidService</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.bid.ZhBidinfo#getProjectFeatures <em>ProjectFeatures</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.bid.ZhBidinfo#getContractType <em>ContractType</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.bid.ZhBidinfo#getProcurementType <em>ProcurementType</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.bid.ZhBidinfo#getBidUnitsCode <em>BidUnitsCode</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.bid.ZhBidinfo#getContractPrice <em>ContractPrice</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.bid.ZhBidinfo#getContractModel <em>ContractModel</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.bid.ZhBidinfo#getBidConvert <em>BidConvert</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.bid.ZhBidinfo#getRemark <em>Remark</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.bid.ZhBidinfo#getBidResult <em>BidResult</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.bid.ZhBidinfo#getCreateUserid <em>CreateUserid</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.bid.ZhBidinfo#getCreateDate <em>CreateDate</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.bid.ZhBidinfo#getBidUnitsName <em>BidUnitsName</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.bid.ZhBidinfo#getBidDataStatus <em>BidDataStatus</em>}</li>
 * </ul>
 * </p>
 *
 * @extends DataObject;
 */
public interface ZhBidinfo extends DataObject {

	public static final String QNAME = "com.zhonghe.ame.marketInfo.bid.ZhBidinfo";

	public static final Type TYPE = TypeHelper.INSTANCE.getType("com.zhonghe.ame.marketInfo.bid", "ZhBidinfo");

	public static final IObjectFactory<ZhBidinfo> FACTORY = new IObjectFactory<ZhBidinfo>() {
		public ZhBidinfo create() {
			return (ZhBidinfo) DataFactory.INSTANCE.create(TYPE);
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
	 * Sets the value of the '{@link com.zhonghe.ame.marketInfo.bid.ZhBidinfo#getId <em>Id</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Id</em>' attribute.
	 * @see #getId()
	 */
	public void setId(int id);

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
	public String getBidOrg();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.marketInfo.bid.ZhBidinfo#getBidOrg <em>BidOrg</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>BidOrg</em>' attribute.
	 * @see #getBidOrg()
	 */
	public void setBidOrg(String bidOrg);

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
	public Date getRecordDate();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.marketInfo.bid.ZhBidinfo#getRecordDate <em>RecordDate</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>RecordDate</em>' attribute.
	 * @see #getRecordDate()
	 */
	public void setRecordDate(Date recordDate);

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
	public String getBidNxwl();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.marketInfo.bid.ZhBidinfo#getBidNxwl <em>BidNxwl</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>BidNxwl</em>' attribute.
	 * @see #getBidNxwl()
	 */
	public void setBidNxwl(String bidNxwl);

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
	public int getCustId();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.marketInfo.bid.ZhBidinfo#getCustId <em>CustId</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>CustId</em>' attribute.
	 * @see #getCustId()
	 */
	public void setCustId(int custId);

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
	 * Sets the value of the '{@link com.zhonghe.ame.marketInfo.bid.ZhBidinfo#getProjectName <em>ProjectName</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>ProjectName</em>' attribute.
	 * @see #getProjectName()
	 */
	public void setProjectName(String projectName);

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
	public String getInvestAmount();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.marketInfo.bid.ZhBidinfo#getInvestAmount <em>InvestAmount</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>InvestAmount</em>' attribute.
	 * @see #getInvestAmount()
	 */
	public void setInvestAmount(String investAmount);

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
	public String getBidBde();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.marketInfo.bid.ZhBidinfo#getBidBde <em>BidBde</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>BidBde</em>' attribute.
	 * @see #getBidBde()
	 */
	public void setBidBde(String bidBde);

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
	 * Sets the value of the '{@link com.zhonghe.ame.marketInfo.bid.ZhBidinfo#getHeadquarterGroup <em>HeadquarterGroup</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>HeadquarterGroup</em>' attribute.
	 * @see #getHeadquarterGroup()
	 */
	public void setHeadquarterGroup(String headquarterGroup);

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
	public String getProjectPlace();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.marketInfo.bid.ZhBidinfo#getProjectPlace <em>ProjectPlace</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>ProjectPlace</em>' attribute.
	 * @see #getProjectPlace()
	 */
	public void setProjectPlace(String projectPlace);

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
	public String getBidFeatures();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.marketInfo.bid.ZhBidinfo#getBidFeatures <em>BidFeatures</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>BidFeatures</em>' attribute.
	 * @see #getBidFeatures()
	 */
	public void setBidFeatures(String bidFeatures);

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
	 * Sets the value of the '{@link com.zhonghe.ame.marketInfo.bid.ZhBidinfo#getProjectType <em>ProjectType</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>ProjectType</em>' attribute.
	 * @see #getProjectType()
	 */
	public void setProjectType(String projectType);

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
	public String getMajorType();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.marketInfo.bid.ZhBidinfo#getMajorType <em>MajorType</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>MajorType</em>' attribute.
	 * @see #getMajorType()
	 */
	public void setMajorType(String majorType);

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
	public String getBidService();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.marketInfo.bid.ZhBidinfo#getBidService <em>BidService</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>BidService</em>' attribute.
	 * @see #getBidService()
	 */
	public void setBidService(String bidService);

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
	public String getProjectFeatures();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.marketInfo.bid.ZhBidinfo#getProjectFeatures <em>ProjectFeatures</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>ProjectFeatures</em>' attribute.
	 * @see #getProjectFeatures()
	 */
	public void setProjectFeatures(String projectFeatures);

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
	 * Sets the value of the '{@link com.zhonghe.ame.marketInfo.bid.ZhBidinfo#getContractType <em>ContractType</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>ContractType</em>' attribute.
	 * @see #getContractType()
	 */
	public void setContractType(String contractType);

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
	 * Sets the value of the '{@link com.zhonghe.ame.marketInfo.bid.ZhBidinfo#getProcurementType <em>ProcurementType</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>ProcurementType</em>' attribute.
	 * @see #getProcurementType()
	 */
	public void setProcurementType(String procurementType);

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
	public String getBidUnitsCode();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.marketInfo.bid.ZhBidinfo#getBidUnitsCode <em>BidUnitsCode</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>BidUnitsCode</em>' attribute.
	 * @see #getBidUnitsCode()
	 */
	public void setBidUnitsCode(String bidUnitsCode);

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
	public String getContractPrice();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.marketInfo.bid.ZhBidinfo#getContractPrice <em>ContractPrice</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>ContractPrice</em>' attribute.
	 * @see #getContractPrice()
	 */
	public void setContractPrice(String contractPrice);

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
	 * Sets the value of the '{@link com.zhonghe.ame.marketInfo.bid.ZhBidinfo#getContractModel <em>ContractModel</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>ContractModel</em>' attribute.
	 * @see #getContractModel()
	 */
	public void setContractModel(String contractModel);

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
	public String getBidConvert();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.marketInfo.bid.ZhBidinfo#getBidConvert <em>BidConvert</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>BidConvert</em>' attribute.
	 * @see #getBidConvert()
	 */
	public void setBidConvert(String bidConvert);

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
	 * Sets the value of the '{@link com.zhonghe.ame.marketInfo.bid.ZhBidinfo#getRemark <em>Remark</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Remark</em>' attribute.
	 * @see #getRemark()
	 */
	public void setRemark(String remark);

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
	public String getBidResult();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.marketInfo.bid.ZhBidinfo#getBidResult <em>BidResult</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>BidResult</em>' attribute.
	 * @see #getBidResult()
	 */
	public void setBidResult(String bidResult);

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
	 * Sets the value of the '{@link com.zhonghe.ame.marketInfo.bid.ZhBidinfo#getCreateUserid <em>CreateUserid</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>CreateUserid</em>' attribute.
	 * @see #getCreateUserid()
	 */
	public void setCreateUserid(String createUserid);

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
	public Date getCreateDate();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.marketInfo.bid.ZhBidinfo#getCreateDate <em>CreateDate</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>CreateDate</em>' attribute.
	 * @see #getCreateDate()
	 */
	public void setCreateDate(Date createDate);

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
	public String getBidUnitsName();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.marketInfo.bid.ZhBidinfo#getBidUnitsName <em>BidUnitsName</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>BidUnitsName</em>' attribute.
	 * @see #getBidUnitsName()
	 */
	public void setBidUnitsName(String bidUnitsName);

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
	public String getBidDataStatus();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.marketInfo.bid.ZhBidinfo#getBidDataStatus <em>BidDataStatus</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>BidDataStatus</em>' attribute.
	 * @see #getBidDataStatus()
	 */
	public void setBidDataStatus(String bidDataStatus);


}