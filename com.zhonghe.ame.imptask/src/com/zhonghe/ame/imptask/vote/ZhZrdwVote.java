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
 *   <li>{@link com.zhonghe.ame.imptask.vote.ZhZrdwVote#getId <em>Id</em>}</li>
 *   <li>{@link com.zhonghe.ame.imptask.vote.ZhZrdwVote#getKeytaskIds <em>KeytaskIds</em>}</li>
 *   <li>{@link com.zhonghe.ame.imptask.vote.ZhZrdwVote#getVoteStatus <em>VoteStatus</em>}</li>
 *   <li>{@link com.zhonghe.ame.imptask.vote.ZhZrdwVote#getCreateTime <em>CreateTime</em>}</li>
 *   <li>{@link com.zhonghe.ame.imptask.vote.ZhZrdwVote#getCreateUserid <em>CreateUserid</em>}</li>
 *   <li>{@link com.zhonghe.ame.imptask.vote.ZhZrdwVote#getVoteFinshtime <em>VoteFinshtime</em>}</li>
 *   <li>{@link com.zhonghe.ame.imptask.vote.ZhZrdwVote#getRemark <em>Remark</em>}</li>
 *   <li>{@link com.zhonghe.ame.imptask.vote.ZhZrdwVote#getVoteCode <em>VoteCode</em>}</li>
 *   <li>{@link com.zhonghe.ame.imptask.vote.ZhZrdwVote#getAlreadyVoteOrgId <em>AlreadyVoteOrgId</em>}</li>
 *   <li>{@link com.zhonghe.ame.imptask.vote.ZhZrdwVote#getOrgIds <em>OrgIds</em>}</li>
 *   <li>{@link com.zhonghe.ame.imptask.vote.ZhZrdwVote#getOrgNames <em>OrgNames</em>}</li>
 *   <li>{@link com.zhonghe.ame.imptask.vote.ZhZrdwVote#getVoteDeps <em>VoteDeps</em>}</li>
 * </ul>
 * </p>
 *
 * @extends DataObject;
 */
public interface ZhZrdwVote extends DataObject {

	public static final String QNAME = "com.zhonghe.ame.imptask.vote.ZhZrdwVote";

	public static final Type TYPE = TypeHelper.INSTANCE.getType("com.zhonghe.ame.imptask.vote", "ZhZrdwVote");

	public static final IObjectFactory<ZhZrdwVote> FACTORY = new IObjectFactory<ZhZrdwVote>() {
		public ZhZrdwVote create() {
			return (ZhZrdwVote) DataFactory.INSTANCE.create(TYPE);
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
	 * Sets the value of the '{@link com.zhonghe.ame.imptask.vote.ZhZrdwVote#getId <em>Id</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Id</em>' attribute.
	 * @see #getId()
	 */
	public void setId(int id);

	/**
	 * Returns the value of the '<em><b>KeytaskIds</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>KeytaskIds</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>KeytaskIds</em>' attribute.
	 * @see #setKeytaskIds(java.lang.String)
	 */
	public String getKeytaskIds();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.imptask.vote.ZhZrdwVote#getKeytaskIds <em>KeytaskIds</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>KeytaskIds</em>' attribute.
	 * @see #getKeytaskIds()
	 */
	public void setKeytaskIds(String keytaskIds);

	/**
	 * Returns the value of the '<em><b>VoteStatus</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>VoteStatus</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>VoteStatus</em>' attribute.
	 * @see #setVoteStatus(java.lang.String)
	 */
	public String getVoteStatus();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.imptask.vote.ZhZrdwVote#getVoteStatus <em>VoteStatus</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>VoteStatus</em>' attribute.
	 * @see #getVoteStatus()
	 */
	public void setVoteStatus(String voteStatus);

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
	 * Sets the value of the '{@link com.zhonghe.ame.imptask.vote.ZhZrdwVote#getCreateTime <em>CreateTime</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>CreateTime</em>' attribute.
	 * @see #getCreateTime()
	 */
	public void setCreateTime(Date createTime);

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
	 * Sets the value of the '{@link com.zhonghe.ame.imptask.vote.ZhZrdwVote#getCreateUserid <em>CreateUserid</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>CreateUserid</em>' attribute.
	 * @see #getCreateUserid()
	 */
	public void setCreateUserid(String createUserid);

	/**
	 * Returns the value of the '<em><b>VoteFinshtime</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>VoteFinshtime</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>VoteFinshtime</em>' attribute.
	 * @see #setVoteFinshtime(java.util.Date)
	 */
	public Date getVoteFinshtime();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.imptask.vote.ZhZrdwVote#getVoteFinshtime <em>VoteFinshtime</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>VoteFinshtime</em>' attribute.
	 * @see #getVoteFinshtime()
	 */
	public void setVoteFinshtime(Date voteFinshtime);

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
	 * Sets the value of the '{@link com.zhonghe.ame.imptask.vote.ZhZrdwVote#getRemark <em>Remark</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Remark</em>' attribute.
	 * @see #getRemark()
	 */
	public void setRemark(String remark);

	/**
	 * Returns the value of the '<em><b>VoteCode</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>VoteCode</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>VoteCode</em>' attribute.
	 * @see #setVoteCode(java.lang.String)
	 */
	public String getVoteCode();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.imptask.vote.ZhZrdwVote#getVoteCode <em>VoteCode</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>VoteCode</em>' attribute.
	 * @see #getVoteCode()
	 */
	public void setVoteCode(String voteCode);

	/**
	 * Returns the value of the '<em><b>AlreadyVoteOrgId</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>AlreadyVoteOrgId</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>AlreadyVoteOrgId</em>' attribute.
	 * @see #setAlreadyVoteOrgId(java.lang.String)
	 */
	public String getAlreadyVoteOrgId();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.imptask.vote.ZhZrdwVote#getAlreadyVoteOrgId <em>AlreadyVoteOrgId</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>AlreadyVoteOrgId</em>' attribute.
	 * @see #getAlreadyVoteOrgId()
	 */
	public void setAlreadyVoteOrgId(String alreadyVoteOrgId);

	/**
	 * Returns the value of the '<em><b>OrgIds</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>OrgIds</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>OrgIds</em>' attribute.
	 * @see #setOrgIds(java.lang.String)
	 */
	public String getOrgIds();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.imptask.vote.ZhZrdwVote#getOrgIds <em>OrgIds</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>OrgIds</em>' attribute.
	 * @see #getOrgIds()
	 */
	public void setOrgIds(String orgIds);

	/**
	 * Returns the value of the '<em><b>OrgNames</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>OrgNames</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>OrgNames</em>' attribute.
	 * @see #setOrgNames(java.lang.String)
	 */
	public String getOrgNames();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.imptask.vote.ZhZrdwVote#getOrgNames <em>OrgNames</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>OrgNames</em>' attribute.
	 * @see #getOrgNames()
	 */
	public void setOrgNames(String orgNames);

	/**
	 * Returns the value of the '<em><b>VoteDeps</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>VoteDeps</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>VoteDeps</em>' attribute.
	 * @see #setVoteDeps(java.lang.String)
	 */
	public String getVoteDeps();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.imptask.vote.ZhZrdwVote#getVoteDeps <em>VoteDeps</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>VoteDeps</em>' attribute.
	 * @see #getVoteDeps()
	 */
	public void setVoteDeps(String voteDeps);


}