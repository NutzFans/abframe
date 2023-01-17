/*******************************************************************************
 *
 * Copyright (c) 2001-2006 Primeton Technologies, Ltd.
 * All rights reserved.
 *
 * Created on Apr 11, 2008
 *******************************************************************************/
package com.zhonghe.ame.imptask.vote;

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
 *   <li>{@link com.zhonghe.ame.imptask.vote.ZhKeytaskNames#getId <em>Id</em>}</li>
 *   <li>{@link com.zhonghe.ame.imptask.vote.ZhKeytaskNames#getKeytaskStatus <em>KeytaskStatus</em>}</li>
 *   <li>{@link com.zhonghe.ame.imptask.vote.ZhKeytaskNames#getCreateTime <em>CreateTime</em>}</li>
 *   <li>{@link com.zhonghe.ame.imptask.vote.ZhKeytaskNames#getCreateuserId <em>CreateuserId</em>}</li>
 *   <li>{@link com.zhonghe.ame.imptask.vote.ZhKeytaskNames#getFinishtime <em>Finishtime</em>}</li>
 *   <li>{@link com.zhonghe.ame.imptask.vote.ZhKeytaskNames#getRemake <em>Remake</em>}</li>
 *   <li>{@link com.zhonghe.ame.imptask.vote.ZhKeytaskNames#getKeytaskName <em>KeytaskName</em>}</li>
 *   <li>{@link com.zhonghe.ame.imptask.vote.ZhKeytaskNames#getCreateuserName <em>CreateuserName</em>}</li>
 * </ul>
 * </p>
 *
 * @extends DataObject;
 */
public interface ZhKeytaskNames extends DataObject {

	public static final String QNAME = "com.zhonghe.ame.imptask.vote.ZhKeytaskNames";

	public static final Type TYPE = TypeHelper.INSTANCE.getType("com.zhonghe.ame.imptask.vote", "ZhKeytaskNames");

	public static final IObjectFactory<ZhKeytaskNames> FACTORY = new IObjectFactory<ZhKeytaskNames>() {
		public ZhKeytaskNames create() {
			return (ZhKeytaskNames) DataFactory.INSTANCE.create(TYPE);
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
	 * Sets the value of the '{@link com.zhonghe.ame.imptask.vote.ZhKeytaskNames#getId <em>Id</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Id</em>' attribute.
	 * @see #getId()
	 */
	public void setId(int id);

	/**
	 * Returns the value of the '<em><b>KeytaskStatus</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>KeytaskStatus</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>KeytaskStatus</em>' attribute.
	 * @see #setKeytaskStatus(java.lang.String)
	 */
	public String getKeytaskStatus();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.imptask.vote.ZhKeytaskNames#getKeytaskStatus <em>KeytaskStatus</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>KeytaskStatus</em>' attribute.
	 * @see #getKeytaskStatus()
	 */
	public void setKeytaskStatus(String keytaskStatus);

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
	 * Sets the value of the '{@link com.zhonghe.ame.imptask.vote.ZhKeytaskNames#getCreateTime <em>CreateTime</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>CreateTime</em>' attribute.
	 * @see #getCreateTime()
	 */
	public void setCreateTime(Date createTime);

	/**
	 * Returns the value of the '<em><b>CreateuserId</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>CreateuserId</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>CreateuserId</em>' attribute.
	 * @see #setCreateuserId(java.lang.String)
	 */
	public String getCreateuserId();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.imptask.vote.ZhKeytaskNames#getCreateuserId <em>CreateuserId</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>CreateuserId</em>' attribute.
	 * @see #getCreateuserId()
	 */
	public void setCreateuserId(String createuserId);

	/**
	 * Returns the value of the '<em><b>Finishtime</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Finishtime</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Finishtime</em>' attribute.
	 * @see #setFinishtime(java.util.Date)
	 */
	public Date getFinishtime();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.imptask.vote.ZhKeytaskNames#getFinishtime <em>Finishtime</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Finishtime</em>' attribute.
	 * @see #getFinishtime()
	 */
	public void setFinishtime(Date finishtime);

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
	 * Sets the value of the '{@link com.zhonghe.ame.imptask.vote.ZhKeytaskNames#getRemake <em>Remake</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Remake</em>' attribute.
	 * @see #getRemake()
	 */
	public void setRemake(String remake);

	/**
	 * Returns the value of the '<em><b>KeytaskName</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>KeytaskName</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>KeytaskName</em>' attribute.
	 * @see #setKeytaskName(java.lang.String)
	 */
	public String getKeytaskName();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.imptask.vote.ZhKeytaskNames#getKeytaskName <em>KeytaskName</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>KeytaskName</em>' attribute.
	 * @see #getKeytaskName()
	 */
	public void setKeytaskName(String keytaskName);

	/**
	 * Returns the value of the '<em><b>CreateuserName</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>CreateuserName</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>CreateuserName</em>' attribute.
	 * @see #setCreateuserName(java.lang.String)
	 */
	public String getCreateuserName();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.imptask.vote.ZhKeytaskNames#getCreateuserName <em>CreateuserName</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>CreateuserName</em>' attribute.
	 * @see #getCreateuserName()
	 */
	public void setCreateuserName(String createuserName);


}