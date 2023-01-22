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

/**
 * <!-- begin-user-doc -->
 * A representation of the model object '<em><b>Test</b></em>'.
 * <!-- end-user-doc -->
 *
 * <p>
 * The following features are supported:
 * <ul>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.ZhBidinfoCompetitor#getId <em>Id</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.ZhBidinfoCompetitor#getBidId <em>BidId</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.ZhBidinfoCompetitor#getCompetId <em>CompetId</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.ZhBidinfoCompetitor#getCompetBidPrice <em>CompetBidPrice</em>}</li>
 * </ul>
 * </p>
 *
 * @extends DataObject;
 */
public interface ZhBidinfoCompetitor extends DataObject {

	public static final String QNAME = "com.zhonghe.ame.marketInfo.myCreatedBid.ZhBidinfoCompetitor";

	public static final Type TYPE = TypeHelper.INSTANCE.getType("com.zhonghe.ame.marketInfo.myCreatedBid", "ZhBidinfoCompetitor");

	public static final IObjectFactory<ZhBidinfoCompetitor> FACTORY = new IObjectFactory<ZhBidinfoCompetitor>() {
		public ZhBidinfoCompetitor create() {
			return (ZhBidinfoCompetitor) DataFactory.INSTANCE.create(TYPE);
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
	 * Sets the value of the '{@link com.zhonghe.ame.marketInfo.myCreatedBid.ZhBidinfoCompetitor#getId <em>Id</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Id</em>' attribute.
	 * @see #getId()
	 */
	public void setId(int id);

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
	public int getBidId();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.marketInfo.myCreatedBid.ZhBidinfoCompetitor#getBidId <em>BidId</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>BidId</em>' attribute.
	 * @see #getBidId()
	 */
	public void setBidId(int bidId);

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
	public int getCompetId();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.marketInfo.myCreatedBid.ZhBidinfoCompetitor#getCompetId <em>CompetId</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>CompetId</em>' attribute.
	 * @see #getCompetId()
	 */
	public void setCompetId(int competId);

	/**
	 * Returns the value of the '<em><b>CompetBidPrice</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>CompetBidPrice</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>CompetBidPrice</em>' attribute.
	 * @see #setCompetBidPrice(java.lang.String)
	 */
	public String getCompetBidPrice();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.marketInfo.myCreatedBid.ZhBidinfoCompetitor#getCompetBidPrice <em>CompetBidPrice</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>CompetBidPrice</em>' attribute.
	 * @see #getCompetBidPrice()
	 */
	public void setCompetBidPrice(String competBidPrice);


}