/*******************************************************************************
 *
 * Copyright (c) 2001-2006 Primeton Technologies, Ltd.
 * All rights reserved.
 *
 * Created on Apr 11, 2008
 *******************************************************************************/
package com.zhonghe.ame.marketInfo.marketinfo.khxx;

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
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.ZhBidinfo#getId <em>Id</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.ZhBidinfo#getProjectId <em>ProjectId</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.ZhBidinfo#getCustinfoId <em>CustinfoId</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.ZhBidinfo#getProxyCompany <em>ProxyCompany</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.ZhBidinfo#getProjectSize <em>ProjectSize</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.ZhBidinfo#getProjectLocal <em>ProjectLocal</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.ZhBidinfo#getOrgId <em>OrgId</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.ZhBidinfo#getBidStatus <em>BidStatus</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.ZhBidinfo#getContractCode <em>ContractCode</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.ZhBidinfo#getBidPrice <em>BidPrice</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.ZhBidinfo#getBidOpenTime <em>BidOpenTime</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.ZhBidinfo#getSubmitStatus <em>SubmitStatus</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.ZhBidinfo#getContractCycle <em>ContractCycle</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.ZhBidinfo#getBidMode <em>BidMode</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.ZhBidinfo#getCreatUserid <em>CreatUserid</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.ZhBidinfo#getCreatTime <em>CreatTime</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.ZhBidinfo#getUpdateUesrid <em>UpdateUesrid</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.ZhBidinfo#getUpdateTime <em>UpdateTime</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.ZhBidinfo#getRemake <em>Remake</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.ZhBidinfo#getTbPrice <em>TbPrice</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.ZhBidinfo#getStartTime <em>StartTime</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.ZhBidinfo#getStopTime <em>StopTime</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.ZhBidinfo#getProjectName <em>ProjectName</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.ZhBidinfo#getExternalType <em>ExternalType</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.ZhBidinfo#getPartyName <em>PartyName</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.ZhBidinfo#getInvestmentAmount <em>InvestmentAmount</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.ZhBidinfo#getMatterAmount <em>MatterAmount</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.ZhBidinfo#getHeadquarterGroup <em>HeadquarterGroup</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.ZhBidinfo#getCharacteristics <em>Characteristics</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.ZhBidinfo#getScopeService <em>ScopeService</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.ZhBidinfo#getMajor <em>Major</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.ZhBidinfo#getFeatures <em>Features</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.ZhBidinfo#getServiceType <em>ServiceType</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.ZhBidinfo#getContractType <em>ContractType</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.ZhBidinfo#getProcurementType <em>ProcurementType</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.ZhBidinfo#getPriceModel <em>PriceModel</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.ZhBidinfo#getEquivalent <em>Equivalent</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.ZhBidinfo#getBidResult <em>BidResult</em>}</li>
 * </ul>
 * </p>
 *
 * @extends DataObject;
 */
public interface ZhBidinfo extends DataObject {

	public static final String QNAME = "com.zhonghe.ame.marketInfo.myCreatedBid.ZhBidinfo";

	public static final Type TYPE = TypeHelper.INSTANCE.getType("com.zhonghe.ame.marketInfo.myCreatedBid", "ZhBidinfo");

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
	 * Sets the value of the '{@link com.zhonghe.ame.marketInfo.myCreatedBid.ZhBidinfo#getId <em>Id</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Id</em>' attribute.
	 * @see #getId()
	 */
	public void setId(int id);

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
	public int getProjectId();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.marketInfo.myCreatedBid.ZhBidinfo#getProjectId <em>ProjectId</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>ProjectId</em>' attribute.
	 * @see #getProjectId()
	 */
	public void setProjectId(int projectId);

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
	public int getCustinfoId();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.marketInfo.myCreatedBid.ZhBidinfo#getCustinfoId <em>CustinfoId</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>CustinfoId</em>' attribute.
	 * @see #getCustinfoId()
	 */
	public void setCustinfoId(int custinfoId);

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
	public String getProxyCompany();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.marketInfo.myCreatedBid.ZhBidinfo#getProxyCompany <em>ProxyCompany</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>ProxyCompany</em>' attribute.
	 * @see #getProxyCompany()
	 */
	public void setProxyCompany(String proxyCompany);

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
	 * Sets the value of the '{@link com.zhonghe.ame.marketInfo.myCreatedBid.ZhBidinfo#getProjectSize <em>ProjectSize</em>}' attribute.
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
	 * Sets the value of the '{@link com.zhonghe.ame.marketInfo.myCreatedBid.ZhBidinfo#getProjectLocal <em>ProjectLocal</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>ProjectLocal</em>' attribute.
	 * @see #getProjectLocal()
	 */
	public void setProjectLocal(String projectLocal);

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
	public int getOrgId();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.marketInfo.myCreatedBid.ZhBidinfo#getOrgId <em>OrgId</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>OrgId</em>' attribute.
	 * @see #getOrgId()
	 */
	public void setOrgId(int orgId);

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
	public int getBidStatus();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.marketInfo.myCreatedBid.ZhBidinfo#getBidStatus <em>BidStatus</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>BidStatus</em>' attribute.
	 * @see #getBidStatus()
	 */
	public void setBidStatus(int bidStatus);

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
	public String getContractCode();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.marketInfo.myCreatedBid.ZhBidinfo#getContractCode <em>ContractCode</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>ContractCode</em>' attribute.
	 * @see #getContractCode()
	 */
	public void setContractCode(String contractCode);

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
	public String getBidPrice();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.marketInfo.myCreatedBid.ZhBidinfo#getBidPrice <em>BidPrice</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>BidPrice</em>' attribute.
	 * @see #getBidPrice()
	 */
	public void setBidPrice(String bidPrice);

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
	public Date getBidOpenTime();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.marketInfo.myCreatedBid.ZhBidinfo#getBidOpenTime <em>BidOpenTime</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>BidOpenTime</em>' attribute.
	 * @see #getBidOpenTime()
	 */
	public void setBidOpenTime(Date bidOpenTime);

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
	public String getSubmitStatus();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.marketInfo.myCreatedBid.ZhBidinfo#getSubmitStatus <em>SubmitStatus</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>SubmitStatus</em>' attribute.
	 * @see #getSubmitStatus()
	 */
	public void setSubmitStatus(String submitStatus);

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
	public String getContractCycle();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.marketInfo.myCreatedBid.ZhBidinfo#getContractCycle <em>ContractCycle</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>ContractCycle</em>' attribute.
	 * @see #getContractCycle()
	 */
	public void setContractCycle(String contractCycle);

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
	public String getBidMode();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.marketInfo.myCreatedBid.ZhBidinfo#getBidMode <em>BidMode</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>BidMode</em>' attribute.
	 * @see #getBidMode()
	 */
	public void setBidMode(String bidMode);

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
	public String getCreatUserid();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.marketInfo.myCreatedBid.ZhBidinfo#getCreatUserid <em>CreatUserid</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>CreatUserid</em>' attribute.
	 * @see #getCreatUserid()
	 */
	public void setCreatUserid(String creatUserid);

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
	public Date getCreatTime();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.marketInfo.myCreatedBid.ZhBidinfo#getCreatTime <em>CreatTime</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>CreatTime</em>' attribute.
	 * @see #getCreatTime()
	 */
	public void setCreatTime(Date creatTime);

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
	 * Sets the value of the '{@link com.zhonghe.ame.marketInfo.myCreatedBid.ZhBidinfo#getUpdateUesrid <em>UpdateUesrid</em>}' attribute.
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
	 * Sets the value of the '{@link com.zhonghe.ame.marketInfo.myCreatedBid.ZhBidinfo#getUpdateTime <em>UpdateTime</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>UpdateTime</em>' attribute.
	 * @see #getUpdateTime()
	 */
	public void setUpdateTime(Date updateTime);

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
	public String getRemake();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.marketInfo.myCreatedBid.ZhBidinfo#getRemake <em>Remake</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Remake</em>' attribute.
	 * @see #getRemake()
	 */
	public void setRemake(String remake);

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
	public String getTbPrice();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.marketInfo.myCreatedBid.ZhBidinfo#getTbPrice <em>TbPrice</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>TbPrice</em>' attribute.
	 * @see #getTbPrice()
	 */
	public void setTbPrice(String tbPrice);

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
	 * Sets the value of the '{@link com.zhonghe.ame.marketInfo.myCreatedBid.ZhBidinfo#getStartTime <em>StartTime</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>StartTime</em>' attribute.
	 * @see #getStartTime()
	 */
	public void setStartTime(Date startTime);

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
	public Date getStopTime();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.marketInfo.myCreatedBid.ZhBidinfo#getStopTime <em>StopTime</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>StopTime</em>' attribute.
	 * @see #getStopTime()
	 */
	public void setStopTime(Date stopTime);

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
	 * Sets the value of the '{@link com.zhonghe.ame.marketInfo.myCreatedBid.ZhBidinfo#getProjectName <em>ProjectName</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>ProjectName</em>' attribute.
	 * @see #getProjectName()
	 */
	public void setProjectName(String projectName);

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
	public String getExternalType();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.marketInfo.myCreatedBid.ZhBidinfo#getExternalType <em>ExternalType</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>ExternalType</em>' attribute.
	 * @see #getExternalType()
	 */
	public void setExternalType(String externalType);

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
	public String getPartyName();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.marketInfo.myCreatedBid.ZhBidinfo#getPartyName <em>PartyName</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>PartyName</em>' attribute.
	 * @see #getPartyName()
	 */
	public void setPartyName(String partyName);

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
	public String getInvestmentAmount();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.marketInfo.myCreatedBid.ZhBidinfo#getInvestmentAmount <em>InvestmentAmount</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>InvestmentAmount</em>' attribute.
	 * @see #getInvestmentAmount()
	 */
	public void setInvestmentAmount(String investmentAmount);

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
	public String getMatterAmount();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.marketInfo.myCreatedBid.ZhBidinfo#getMatterAmount <em>MatterAmount</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>MatterAmount</em>' attribute.
	 * @see #getMatterAmount()
	 */
	public void setMatterAmount(String matterAmount);

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
	 * Sets the value of the '{@link com.zhonghe.ame.marketInfo.myCreatedBid.ZhBidinfo#getHeadquarterGroup <em>HeadquarterGroup</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>HeadquarterGroup</em>' attribute.
	 * @see #getHeadquarterGroup()
	 */
	public void setHeadquarterGroup(String headquarterGroup);

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
	public String getCharacteristics();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.marketInfo.myCreatedBid.ZhBidinfo#getCharacteristics <em>Characteristics</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Characteristics</em>' attribute.
	 * @see #getCharacteristics()
	 */
	public void setCharacteristics(String characteristics);

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
	public String getScopeService();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.marketInfo.myCreatedBid.ZhBidinfo#getScopeService <em>ScopeService</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>ScopeService</em>' attribute.
	 * @see #getScopeService()
	 */
	public void setScopeService(String scopeService);

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
	 * Sets the value of the '{@link com.zhonghe.ame.marketInfo.myCreatedBid.ZhBidinfo#getMajor <em>Major</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Major</em>' attribute.
	 * @see #getMajor()
	 */
	public void setMajor(String major);

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
	public String getFeatures();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.marketInfo.myCreatedBid.ZhBidinfo#getFeatures <em>Features</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Features</em>' attribute.
	 * @see #getFeatures()
	 */
	public void setFeatures(String features);

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
	public String getServiceType();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.marketInfo.myCreatedBid.ZhBidinfo#getServiceType <em>ServiceType</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>ServiceType</em>' attribute.
	 * @see #getServiceType()
	 */
	public void setServiceType(String serviceType);

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
	 * Sets the value of the '{@link com.zhonghe.ame.marketInfo.myCreatedBid.ZhBidinfo#getContractType <em>ContractType</em>}' attribute.
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
	 * Sets the value of the '{@link com.zhonghe.ame.marketInfo.myCreatedBid.ZhBidinfo#getProcurementType <em>ProcurementType</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>ProcurementType</em>' attribute.
	 * @see #getProcurementType()
	 */
	public void setProcurementType(String procurementType);

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
	public String getPriceModel();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.marketInfo.myCreatedBid.ZhBidinfo#getPriceModel <em>PriceModel</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>PriceModel</em>' attribute.
	 * @see #getPriceModel()
	 */
	public void setPriceModel(String priceModel);

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
	public String getEquivalent();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.marketInfo.myCreatedBid.ZhBidinfo#getEquivalent <em>Equivalent</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Equivalent</em>' attribute.
	 * @see #getEquivalent()
	 */
	public void setEquivalent(String equivalent);

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
	 * Sets the value of the '{@link com.zhonghe.ame.marketInfo.myCreatedBid.ZhBidinfo#getBidResult <em>BidResult</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>BidResult</em>' attribute.
	 * @see #getBidResult()
	 */
	public void setBidResult(String bidResult);


}