/*******************************************************************************
 *
 * Copyright (c) 2001-2006 Primeton Technologies, Ltd.
 * All rights reserved.
 *
 * Created on Apr 11, 2008
 *******************************************************************************/
package com.zhonghe.ame.imptask.vote.impl;

import com.primeton.ext.data.sdo.DataUtil;
import com.primeton.ext.data.sdo.ExtendedDataObjectImpl;
import com.zhonghe.ame.imptask.vote.ZhZrdwVote;

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
 *   <li>{@link com.zhonghe.ame.imptask.vote.impl.ZhZrdwVoteImpl#getId <em>Id</em>}</li>
 *   <li>{@link com.zhonghe.ame.imptask.vote.impl.ZhZrdwVoteImpl#getKeytaskIds <em>KeytaskIds</em>}</li>
 *   <li>{@link com.zhonghe.ame.imptask.vote.impl.ZhZrdwVoteImpl#getVoteStatus <em>VoteStatus</em>}</li>
 *   <li>{@link com.zhonghe.ame.imptask.vote.impl.ZhZrdwVoteImpl#getCreateTime <em>CreateTime</em>}</li>
 *   <li>{@link com.zhonghe.ame.imptask.vote.impl.ZhZrdwVoteImpl#getCreateUserid <em>CreateUserid</em>}</li>
 *   <li>{@link com.zhonghe.ame.imptask.vote.impl.ZhZrdwVoteImpl#getVoteFinshtime <em>VoteFinshtime</em>}</li>
 *   <li>{@link com.zhonghe.ame.imptask.vote.impl.ZhZrdwVoteImpl#getRemark <em>Remark</em>}</li>
 *   <li>{@link com.zhonghe.ame.imptask.vote.impl.ZhZrdwVoteImpl#getVoteCode <em>VoteCode</em>}</li>
 *   <li>{@link com.zhonghe.ame.imptask.vote.impl.ZhZrdwVoteImpl#getAlreadyVoteOrgId <em>AlreadyVoteOrgId</em>}</li>
 *   <li>{@link com.zhonghe.ame.imptask.vote.impl.ZhZrdwVoteImpl#getOrgIds <em>OrgIds</em>}</li>
 *   <li>{@link com.zhonghe.ame.imptask.vote.impl.ZhZrdwVoteImpl#getOrgNames <em>OrgNames</em>}</li>
 *   <li>{@link com.zhonghe.ame.imptask.vote.impl.ZhZrdwVoteImpl#getVoteDeps <em>VoteDeps</em>}</li>
 * </ul>
 * </p>
 *
 * @extends ExtendedDataObjectImpl;
 *
 * @implements ZhZrdwVote;
 */

public class ZhZrdwVoteImpl extends ExtendedDataObjectImpl implements ZhZrdwVote {
	/**
	 * Comment for <code>serialVersionUID</code>
	 */
	private static final long serialVersionUID = 1L;
	public final static int INDEX_ID = 0;
	public final static int INDEX_KEYTASKIDS = 1;
	public final static int INDEX_VOTESTATUS = 2;
	public final static int INDEX_CREATETIME = 3;
	public final static int INDEX_CREATEUSERID = 4;
	public final static int INDEX_VOTEFINSHTIME = 5;
	public final static int INDEX_REMARK = 6;
	public final static int INDEX_VOTECODE = 7;
	public final static int INDEX_ALREADYVOTEORGID = 8;
	public final static int INDEX_ORGIDS = 9;
	public final static int INDEX_ORGNAMES = 10;
	public final static int INDEX_VOTEDEPS = 11;
	public static final int SDO_PROPERTY_COUNT = 12;

	public static final int EXTENDED_PROPERTY_COUNT = -1;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 */
	public ZhZrdwVoteImpl() {
		this(TYPE);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 */
	public ZhZrdwVoteImpl(Type type) {
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
	public String getKeytaskIds() {
		return DataUtil.toString(super.getByIndex(INDEX_KEYTASKIDS, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getKeytaskIds <em>KeytaskIds</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>KeytaskIds</em>' attribute.
	 * @see #getKeytaskIds()
	 */
	public void setKeytaskIds(String keytaskIds) {
		super.setByIndex(INDEX_KEYTASKIDS, keytaskIds);
	}

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
	public String getVoteStatus() {
		return DataUtil.toString(super.getByIndex(INDEX_VOTESTATUS, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getVoteStatus <em>VoteStatus</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>VoteStatus</em>' attribute.
	 * @see #getVoteStatus()
	 */
	public void setVoteStatus(String voteStatus) {
		super.setByIndex(INDEX_VOTESTATUS, voteStatus);
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
	public Date getVoteFinshtime() {
		return DataUtil.toDate(super.getByIndex(INDEX_VOTEFINSHTIME, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getVoteFinshtime <em>VoteFinshtime</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>VoteFinshtime</em>' attribute.
	 * @see #getVoteFinshtime()
	 */
	public void setVoteFinshtime(Date voteFinshtime) {
		super.setByIndex(INDEX_VOTEFINSHTIME, voteFinshtime);
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
	public String getVoteCode() {
		return DataUtil.toString(super.getByIndex(INDEX_VOTECODE, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getVoteCode <em>VoteCode</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>VoteCode</em>' attribute.
	 * @see #getVoteCode()
	 */
	public void setVoteCode(String voteCode) {
		super.setByIndex(INDEX_VOTECODE, voteCode);
	}

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
	public String getAlreadyVoteOrgId() {
		return DataUtil.toString(super.getByIndex(INDEX_ALREADYVOTEORGID, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getAlreadyVoteOrgId <em>AlreadyVoteOrgId</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>AlreadyVoteOrgId</em>' attribute.
	 * @see #getAlreadyVoteOrgId()
	 */
	public void setAlreadyVoteOrgId(String alreadyVoteOrgId) {
		super.setByIndex(INDEX_ALREADYVOTEORGID, alreadyVoteOrgId);
	}

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
	public String getOrgIds() {
		return DataUtil.toString(super.getByIndex(INDEX_ORGIDS, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getOrgIds <em>OrgIds</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>OrgIds</em>' attribute.
	 * @see #getOrgIds()
	 */
	public void setOrgIds(String orgIds) {
		super.setByIndex(INDEX_ORGIDS, orgIds);
	}

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
	public String getOrgNames() {
		return DataUtil.toString(super.getByIndex(INDEX_ORGNAMES, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getOrgNames <em>OrgNames</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>OrgNames</em>' attribute.
	 * @see #getOrgNames()
	 */
	public void setOrgNames(String orgNames) {
		super.setByIndex(INDEX_ORGNAMES, orgNames);
	}

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
	public String getVoteDeps() {
		return DataUtil.toString(super.getByIndex(INDEX_VOTEDEPS, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getVoteDeps <em>VoteDeps</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>VoteDeps</em>' attribute.
	 * @see #getVoteDeps()
	 */
	public void setVoteDeps(String voteDeps) {
		super.setByIndex(INDEX_VOTEDEPS, voteDeps);
	}


}