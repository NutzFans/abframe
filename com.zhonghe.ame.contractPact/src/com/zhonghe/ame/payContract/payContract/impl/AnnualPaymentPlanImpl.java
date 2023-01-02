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
import com.zhonghe.ame.payContract.payContract.AnnualPaymentPlan;

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
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.AnnualPaymentPlanImpl#getId <em>Id</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.AnnualPaymentPlanImpl#getContractNo <em>ContractNo</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.AnnualPaymentPlanImpl#getContractName <em>ContractName</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.AnnualPaymentPlanImpl#getPayId <em>PayId</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.AnnualPaymentPlanImpl#getCreateTime <em>CreateTime</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.AnnualPaymentPlanImpl#getYears <em>Years</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.AnnualPaymentPlanImpl#getJan <em>Jan</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.AnnualPaymentPlanImpl#getFeb <em>Feb</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.AnnualPaymentPlanImpl#getMar <em>Mar</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.AnnualPaymentPlanImpl#getApr <em>Apr</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.AnnualPaymentPlanImpl#getMay <em>May</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.AnnualPaymentPlanImpl#getJun <em>Jun</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.AnnualPaymentPlanImpl#getJul <em>Jul</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.AnnualPaymentPlanImpl#getAug <em>Aug</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.AnnualPaymentPlanImpl#getSep <em>Sep</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.AnnualPaymentPlanImpl#getOct <em>Oct</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.AnnualPaymentPlanImpl#getNov <em>Nov</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.AnnualPaymentPlanImpl#getDec <em>Dec</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.AnnualPaymentPlanImpl#getSum <em>Sum</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.AnnualPaymentPlanImpl#getChargeId <em>ChargeId</em>}</li>
 * </ul>
 * </p>
 *
 * @extends ExtendedDataObjectImpl;
 *
 * @implements AnnualPaymentPlan;
 */

public class AnnualPaymentPlanImpl extends ExtendedDataObjectImpl implements AnnualPaymentPlan {
	/**
	 * Comment for <code>serialVersionUID</code>
	 */
	private static final long serialVersionUID = 1L;
	public final static int INDEX_ID = 0;
	public final static int INDEX_CONTRACTNO = 1;
	public final static int INDEX_CONTRACTNAME = 2;
	public final static int INDEX_PAYID = 3;
	public final static int INDEX_CREATETIME = 4;
	public final static int INDEX_YEARS = 5;
	public final static int INDEX_JAN = 6;
	public final static int INDEX_FEB = 7;
	public final static int INDEX_MAR = 8;
	public final static int INDEX_APR = 9;
	public final static int INDEX_MAY = 10;
	public final static int INDEX_JUN = 11;
	public final static int INDEX_JUL = 12;
	public final static int INDEX_AUG = 13;
	public final static int INDEX_SEP = 14;
	public final static int INDEX_OCT = 15;
	public final static int INDEX_NOV = 16;
	public final static int INDEX_DEC = 17;
	public final static int INDEX_SUM = 18;
	public final static int INDEX_CHARGEID = 19;
	public static final int SDO_PROPERTY_COUNT = 20;

	public static final int EXTENDED_PROPERTY_COUNT = -1;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 */
	public AnnualPaymentPlanImpl() {
		this(TYPE);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 */
	public AnnualPaymentPlanImpl(Type type) {
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
	 * @see #setId(java.lang.String)
	 */
	public String getId() {
		return DataUtil.toString(super.getByIndex(INDEX_ID, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getId <em>Id</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Id</em>' attribute.
	 * @see #getId()
	 */
	public void setId(String id) {
		super.setByIndex(INDEX_ID, id);
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
	public String getPayId() {
		return DataUtil.toString(super.getByIndex(INDEX_PAYID, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getPayId <em>PayId</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>PayId</em>' attribute.
	 * @see #getPayId()
	 */
	public void setPayId(String payId) {
		super.setByIndex(INDEX_PAYID, payId);
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
	public String getYears() {
		return DataUtil.toString(super.getByIndex(INDEX_YEARS, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getYears <em>Years</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Years</em>' attribute.
	 * @see #getYears()
	 */
	public void setYears(String years) {
		super.setByIndex(INDEX_YEARS, years);
	}

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
	public String getJan() {
		return DataUtil.toString(super.getByIndex(INDEX_JAN, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getJan <em>Jan</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Jan</em>' attribute.
	 * @see #getJan()
	 */
	public void setJan(String jan) {
		super.setByIndex(INDEX_JAN, jan);
	}

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
	public String getFeb() {
		return DataUtil.toString(super.getByIndex(INDEX_FEB, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getFeb <em>Feb</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Feb</em>' attribute.
	 * @see #getFeb()
	 */
	public void setFeb(String feb) {
		super.setByIndex(INDEX_FEB, feb);
	}

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
	public String getMar() {
		return DataUtil.toString(super.getByIndex(INDEX_MAR, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getMar <em>Mar</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Mar</em>' attribute.
	 * @see #getMar()
	 */
	public void setMar(String mar) {
		super.setByIndex(INDEX_MAR, mar);
	}

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
	public String getApr() {
		return DataUtil.toString(super.getByIndex(INDEX_APR, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getApr <em>Apr</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Apr</em>' attribute.
	 * @see #getApr()
	 */
	public void setApr(String apr) {
		super.setByIndex(INDEX_APR, apr);
	}

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
	public String getMay() {
		return DataUtil.toString(super.getByIndex(INDEX_MAY, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getMay <em>May</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>May</em>' attribute.
	 * @see #getMay()
	 */
	public void setMay(String may) {
		super.setByIndex(INDEX_MAY, may);
	}

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
	public String getJun() {
		return DataUtil.toString(super.getByIndex(INDEX_JUN, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getJun <em>Jun</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Jun</em>' attribute.
	 * @see #getJun()
	 */
	public void setJun(String jun) {
		super.setByIndex(INDEX_JUN, jun);
	}

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
	public String getJul() {
		return DataUtil.toString(super.getByIndex(INDEX_JUL, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getJul <em>Jul</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Jul</em>' attribute.
	 * @see #getJul()
	 */
	public void setJul(String jul) {
		super.setByIndex(INDEX_JUL, jul);
	}

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
	public String getAug() {
		return DataUtil.toString(super.getByIndex(INDEX_AUG, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getAug <em>Aug</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Aug</em>' attribute.
	 * @see #getAug()
	 */
	public void setAug(String aug) {
		super.setByIndex(INDEX_AUG, aug);
	}

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
	public String getSep() {
		return DataUtil.toString(super.getByIndex(INDEX_SEP, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getSep <em>Sep</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Sep</em>' attribute.
	 * @see #getSep()
	 */
	public void setSep(String sep) {
		super.setByIndex(INDEX_SEP, sep);
	}

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
	public String getOct() {
		return DataUtil.toString(super.getByIndex(INDEX_OCT, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getOct <em>Oct</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Oct</em>' attribute.
	 * @see #getOct()
	 */
	public void setOct(String oct) {
		super.setByIndex(INDEX_OCT, oct);
	}

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
	public String getNov() {
		return DataUtil.toString(super.getByIndex(INDEX_NOV, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getNov <em>Nov</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Nov</em>' attribute.
	 * @see #getNov()
	 */
	public void setNov(String nov) {
		super.setByIndex(INDEX_NOV, nov);
	}

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
	public String getDec() {
		return DataUtil.toString(super.getByIndex(INDEX_DEC, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getDec <em>Dec</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Dec</em>' attribute.
	 * @see #getDec()
	 */
	public void setDec(String dec) {
		super.setByIndex(INDEX_DEC, dec);
	}

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
	public String getSum() {
		return DataUtil.toString(super.getByIndex(INDEX_SUM, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getSum <em>Sum</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Sum</em>' attribute.
	 * @see #getSum()
	 */
	public void setSum(String sum) {
		super.setByIndex(INDEX_SUM, sum);
	}

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
	public String getChargeId() {
		return DataUtil.toString(super.getByIndex(INDEX_CHARGEID, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getChargeId <em>ChargeId</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>ChargeId</em>' attribute.
	 * @see #getChargeId()
	 */
	public void setChargeId(String chargeId) {
		super.setByIndex(INDEX_CHARGEID, chargeId);
	}


}