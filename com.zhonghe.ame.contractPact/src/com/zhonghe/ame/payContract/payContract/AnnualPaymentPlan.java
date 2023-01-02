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

import java.util.Date;

/**
 * <!-- begin-user-doc -->
 * A representation of the model object '<em><b>Test</b></em>'.
 * <!-- end-user-doc -->
 *
 * <p>
 * The following features are supported:
 * <ul>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.AnnualPaymentPlan#getId <em>Id</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.AnnualPaymentPlan#getContractNo <em>ContractNo</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.AnnualPaymentPlan#getContractName <em>ContractName</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.AnnualPaymentPlan#getPayId <em>PayId</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.AnnualPaymentPlan#getCreateTime <em>CreateTime</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.AnnualPaymentPlan#getYears <em>Years</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.AnnualPaymentPlan#getJan <em>Jan</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.AnnualPaymentPlan#getFeb <em>Feb</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.AnnualPaymentPlan#getMar <em>Mar</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.AnnualPaymentPlan#getApr <em>Apr</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.AnnualPaymentPlan#getMay <em>May</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.AnnualPaymentPlan#getJun <em>Jun</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.AnnualPaymentPlan#getJul <em>Jul</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.AnnualPaymentPlan#getAug <em>Aug</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.AnnualPaymentPlan#getSep <em>Sep</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.AnnualPaymentPlan#getOct <em>Oct</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.AnnualPaymentPlan#getNov <em>Nov</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.AnnualPaymentPlan#getDec <em>Dec</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.AnnualPaymentPlan#getSum <em>Sum</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.AnnualPaymentPlan#getChargeId <em>ChargeId</em>}</li>
 * </ul>
 * </p>
 *
 * @extends DataObject;
 */
public interface AnnualPaymentPlan extends DataObject {

	public static final String QNAME = "com.zhonghe.ame.payContract.payContract.AnnualPaymentPlan";

	public static final Type TYPE = TypeHelper.INSTANCE.getType("com.zhonghe.ame.payContract.payContract", "AnnualPaymentPlan");

	public static final IObjectFactory<AnnualPaymentPlan> FACTORY = new IObjectFactory<AnnualPaymentPlan>() {
		public AnnualPaymentPlan create() {
			return (AnnualPaymentPlan) DataFactory.INSTANCE.create(TYPE);
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
	 * @see #setId(java.lang.String)
	 */
	public String getId();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.AnnualPaymentPlan#getId <em>Id</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Id</em>' attribute.
	 * @see #getId()
	 */
	public void setId(String id);

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
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.AnnualPaymentPlan#getContractNo <em>ContractNo</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>ContractNo</em>' attribute.
	 * @see #getContractNo()
	 */
	public void setContractNo(String contractNo);

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
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.AnnualPaymentPlan#getContractName <em>ContractName</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>ContractName</em>' attribute.
	 * @see #getContractName()
	 */
	public void setContractName(String contractName);

	/**
	 * Returns the value of the '<em><b>PayId</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>PayId</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>PayId</em>' attribute.
	 * @see #setPayId(java.lang.String)
	 */
	public String getPayId();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.AnnualPaymentPlan#getPayId <em>PayId</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>PayId</em>' attribute.
	 * @see #getPayId()
	 */
	public void setPayId(String payId);

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
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.AnnualPaymentPlan#getCreateTime <em>CreateTime</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>CreateTime</em>' attribute.
	 * @see #getCreateTime()
	 */
	public void setCreateTime(Date createTime);

	/**
	 * Returns the value of the '<em><b>Years</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Years</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Years</em>' attribute.
	 * @see #setYears(java.lang.String)
	 */
	public String getYears();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.AnnualPaymentPlan#getYears <em>Years</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Years</em>' attribute.
	 * @see #getYears()
	 */
	public void setYears(String years);

	/**
	 * Returns the value of the '<em><b>Jan</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Jan</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Jan</em>' attribute.
	 * @see #setJan(java.lang.String)
	 */
	public String getJan();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.AnnualPaymentPlan#getJan <em>Jan</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Jan</em>' attribute.
	 * @see #getJan()
	 */
	public void setJan(String jan);

	/**
	 * Returns the value of the '<em><b>Feb</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Feb</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Feb</em>' attribute.
	 * @see #setFeb(java.lang.String)
	 */
	public String getFeb();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.AnnualPaymentPlan#getFeb <em>Feb</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Feb</em>' attribute.
	 * @see #getFeb()
	 */
	public void setFeb(String feb);

	/**
	 * Returns the value of the '<em><b>Mar</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Mar</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Mar</em>' attribute.
	 * @see #setMar(java.lang.String)
	 */
	public String getMar();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.AnnualPaymentPlan#getMar <em>Mar</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Mar</em>' attribute.
	 * @see #getMar()
	 */
	public void setMar(String mar);

	/**
	 * Returns the value of the '<em><b>Apr</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Apr</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Apr</em>' attribute.
	 * @see #setApr(java.lang.String)
	 */
	public String getApr();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.AnnualPaymentPlan#getApr <em>Apr</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Apr</em>' attribute.
	 * @see #getApr()
	 */
	public void setApr(String apr);

	/**
	 * Returns the value of the '<em><b>May</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>May</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>May</em>' attribute.
	 * @see #setMay(java.lang.String)
	 */
	public String getMay();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.AnnualPaymentPlan#getMay <em>May</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>May</em>' attribute.
	 * @see #getMay()
	 */
	public void setMay(String may);

	/**
	 * Returns the value of the '<em><b>Jun</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Jun</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Jun</em>' attribute.
	 * @see #setJun(java.lang.String)
	 */
	public String getJun();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.AnnualPaymentPlan#getJun <em>Jun</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Jun</em>' attribute.
	 * @see #getJun()
	 */
	public void setJun(String jun);

	/**
	 * Returns the value of the '<em><b>Jul</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Jul</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Jul</em>' attribute.
	 * @see #setJul(java.lang.String)
	 */
	public String getJul();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.AnnualPaymentPlan#getJul <em>Jul</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Jul</em>' attribute.
	 * @see #getJul()
	 */
	public void setJul(String jul);

	/**
	 * Returns the value of the '<em><b>Aug</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Aug</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Aug</em>' attribute.
	 * @see #setAug(java.lang.String)
	 */
	public String getAug();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.AnnualPaymentPlan#getAug <em>Aug</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Aug</em>' attribute.
	 * @see #getAug()
	 */
	public void setAug(String aug);

	/**
	 * Returns the value of the '<em><b>Sep</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Sep</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Sep</em>' attribute.
	 * @see #setSep(java.lang.String)
	 */
	public String getSep();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.AnnualPaymentPlan#getSep <em>Sep</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Sep</em>' attribute.
	 * @see #getSep()
	 */
	public void setSep(String sep);

	/**
	 * Returns the value of the '<em><b>Oct</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Oct</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Oct</em>' attribute.
	 * @see #setOct(java.lang.String)
	 */
	public String getOct();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.AnnualPaymentPlan#getOct <em>Oct</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Oct</em>' attribute.
	 * @see #getOct()
	 */
	public void setOct(String oct);

	/**
	 * Returns the value of the '<em><b>Nov</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Nov</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Nov</em>' attribute.
	 * @see #setNov(java.lang.String)
	 */
	public String getNov();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.AnnualPaymentPlan#getNov <em>Nov</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Nov</em>' attribute.
	 * @see #getNov()
	 */
	public void setNov(String nov);

	/**
	 * Returns the value of the '<em><b>Dec</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Dec</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Dec</em>' attribute.
	 * @see #setDec(java.lang.String)
	 */
	public String getDec();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.AnnualPaymentPlan#getDec <em>Dec</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Dec</em>' attribute.
	 * @see #getDec()
	 */
	public void setDec(String dec);

	/**
	 * Returns the value of the '<em><b>Sum</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Sum</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Sum</em>' attribute.
	 * @see #setSum(java.lang.String)
	 */
	public String getSum();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.AnnualPaymentPlan#getSum <em>Sum</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Sum</em>' attribute.
	 * @see #getSum()
	 */
	public void setSum(String sum);

	/**
	 * Returns the value of the '<em><b>ChargeId</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>ChargeId</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>ChargeId</em>' attribute.
	 * @see #setChargeId(java.lang.String)
	 */
	public String getChargeId();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.AnnualPaymentPlan#getChargeId <em>ChargeId</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>ChargeId</em>' attribute.
	 * @see #getChargeId()
	 */
	public void setChargeId(String chargeId);


}