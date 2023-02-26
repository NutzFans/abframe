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
import com.zhonghe.ame.marketInfo.bid.ZhBidinfoCompetitor;

import commonj.sdo.Type;

/**
 * <!-- begin-user-doc -->
 * A representation of the model object '<em><b>Test</b></em>'.
 * <!-- end-user-doc -->
 *
 * <p>
 * The following features are supported:
 * <ul>
 *   <li>{@link com.zhonghe.ame.marketInfo.bid.impl.ZhBidinfoCompetitorImpl#getId <em>Id</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.bid.impl.ZhBidinfoCompetitorImpl#getBidId <em>BidId</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.bid.impl.ZhBidinfoCompetitorImpl#getCompetId <em>CompetId</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.bid.impl.ZhBidinfoCompetitorImpl#getCompetContractPrice <em>CompetContractPrice</em>}</li>
 * </ul>
 * </p>
 *
 * @extends ExtendedDataObjectImpl;
 *
 * @implements ZhBidinfoCompetitor;
 */

public class ZhBidinfoCompetitorImpl extends ExtendedDataObjectImpl implements ZhBidinfoCompetitor {
	/**
	 * Comment for <code>serialVersionUID</code>
	 */
	private static final long serialVersionUID = 1L;
	public final static int INDEX_ID = 0;
	public final static int INDEX_BIDID = 1;
	public final static int INDEX_COMPETID = 2;
	public final static int INDEX_COMPETCONTRACTPRICE = 3;
	public static final int SDO_PROPERTY_COUNT = 4;

	public static final int EXTENDED_PROPERTY_COUNT = -1;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 */
	public ZhBidinfoCompetitorImpl() {
		this(TYPE);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 */
	public ZhBidinfoCompetitorImpl(Type type) {
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
	 * Returns the value of the '<em><b>BidId</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>BidId</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>BidId</em>' attribute.
	 * @see #setBidId(int)
	 */
	public int getBidId() {
		return DataUtil.toInt(super.getByIndex(INDEX_BIDID, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getBidId <em>BidId</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>BidId</em>' attribute.
	 * @see #getBidId()
	 */
	public void setBidId(int bidId) {
		super.setByIndex(INDEX_BIDID, bidId);
	}

	/**
	 * Returns the value of the '<em><b>CompetId</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>CompetId</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>CompetId</em>' attribute.
	 * @see #setCompetId(int)
	 */
	public int getCompetId() {
		return DataUtil.toInt(super.getByIndex(INDEX_COMPETID, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getCompetId <em>CompetId</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>CompetId</em>' attribute.
	 * @see #getCompetId()
	 */
	public void setCompetId(int competId) {
		super.setByIndex(INDEX_COMPETID, competId);
	}

	/**
	 * Returns the value of the '<em><b>CompetContractPrice</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>CompetContractPrice</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>CompetContractPrice</em>' attribute.
	 * @see #setCompetContractPrice(java.lang.String)
	 */
	public String getCompetContractPrice() {
		return DataUtil.toString(super.getByIndex(INDEX_COMPETCONTRACTPRICE, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getCompetContractPrice <em>CompetContractPrice</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>CompetContractPrice</em>' attribute.
	 * @see #getCompetContractPrice()
	 */
	public void setCompetContractPrice(String competContractPrice) {
		super.setByIndex(INDEX_COMPETCONTRACTPRICE, competContractPrice);
	}


}