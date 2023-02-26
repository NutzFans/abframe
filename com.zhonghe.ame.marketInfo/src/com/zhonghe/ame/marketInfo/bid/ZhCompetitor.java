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
 *   <li>{@link com.zhonghe.ame.marketInfo.bid.ZhCompetitor#getCompetId <em>CompetId</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.bid.ZhCompetitor#getCompetName <em>CompetName</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.bid.ZhCompetitor#getCompetRemark <em>CompetRemark</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.bid.ZhCompetitor#getCreateUserid <em>CreateUserid</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.bid.ZhCompetitor#getCreateDate <em>CreateDate</em>}</li>
 * </ul>
 * </p>
 *
 * @extends DataObject;
 */
public interface ZhCompetitor extends DataObject {

	public static final String QNAME = "com.zhonghe.ame.marketInfo.bid.ZhCompetitor";

	public static final Type TYPE = TypeHelper.INSTANCE.getType("com.zhonghe.ame.marketInfo.bid", "ZhCompetitor");

	public static final IObjectFactory<ZhCompetitor> FACTORY = new IObjectFactory<ZhCompetitor>() {
		public ZhCompetitor create() {
			return (ZhCompetitor) DataFactory.INSTANCE.create(TYPE);
		}
	};

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
	 * Sets the value of the '{@link com.zhonghe.ame.marketInfo.bid.ZhCompetitor#getCompetId <em>CompetId</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>CompetId</em>' attribute.
	 * @see #getCompetId()
	 */
	public void setCompetId(int competId);

	/**
	 * Returns the value of the '<em><b>CompetName</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>CompetName</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>CompetName</em>' attribute.
	 * @see #setCompetName(java.lang.String)
	 */
	public String getCompetName();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.marketInfo.bid.ZhCompetitor#getCompetName <em>CompetName</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>CompetName</em>' attribute.
	 * @see #getCompetName()
	 */
	public void setCompetName(String competName);

	/**
	 * Returns the value of the '<em><b>CompetRemark</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>CompetRemark</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>CompetRemark</em>' attribute.
	 * @see #setCompetRemark(java.lang.String)
	 */
	public String getCompetRemark();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.marketInfo.bid.ZhCompetitor#getCompetRemark <em>CompetRemark</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>CompetRemark</em>' attribute.
	 * @see #getCompetRemark()
	 */
	public void setCompetRemark(String competRemark);

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
	 * Sets the value of the '{@link com.zhonghe.ame.marketInfo.bid.ZhCompetitor#getCreateUserid <em>CreateUserid</em>}' attribute.
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
	 * Sets the value of the '{@link com.zhonghe.ame.marketInfo.bid.ZhCompetitor#getCreateDate <em>CreateDate</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>CreateDate</em>' attribute.
	 * @see #getCreateDate()
	 */
	public void setCreateDate(Date createDate);


}