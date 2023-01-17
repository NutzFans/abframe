/*******************************************************************************
 *
 * Copyright (c) 2001-2006 Primeton Technologies, Ltd.
 * All rights reserved.
 *
 * Created on Apr 11, 2008
 *******************************************************************************/
package com.primeton.ame.schindler.org.impl;

import com.primeton.ame.schindler.org.OmEmployee;
import com.primeton.ext.data.sdo.DataUtil;
import com.primeton.ext.data.sdo.ExtendedDataObjectImpl;

import commonj.sdo.Type;

import java.math.BigDecimal;
import java.util.Date;

/**
 * <!-- begin-user-doc -->
 * A representation of the model object '<em><b>Test</b></em>'.
 * <!-- end-user-doc -->
 *
 * <p>
 * The following features are supported:
 * <ul>
 *   <li>{@link com.primeton.ame.schindler.org.impl.OmEmployeeImpl#getEmpid <em>Empid</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.OmEmployeeImpl#getEmpcode <em>Empcode</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.OmEmployeeImpl#getOperatorid <em>Operatorid</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.OmEmployeeImpl#getUserid <em>Userid</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.OmEmployeeImpl#getEmpname <em>Empname</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.OmEmployeeImpl#getRealname <em>Realname</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.OmEmployeeImpl#getGender <em>Gender</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.OmEmployeeImpl#getBirthdate <em>Birthdate</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.OmEmployeeImpl#getPosition <em>Position</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.OmEmployeeImpl#getEmpstatus <em>Empstatus</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.OmEmployeeImpl#getCardtype <em>Cardtype</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.OmEmployeeImpl#getCardno <em>Cardno</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.OmEmployeeImpl#getIndate <em>Indate</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.OmEmployeeImpl#getOutdate <em>Outdate</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.OmEmployeeImpl#getOtel <em>Otel</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.OmEmployeeImpl#getOaddress <em>Oaddress</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.OmEmployeeImpl#getOzipcode <em>Ozipcode</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.OmEmployeeImpl#getOemail <em>Oemail</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.OmEmployeeImpl#getFaxno <em>Faxno</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.OmEmployeeImpl#getMobileno <em>Mobileno</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.OmEmployeeImpl#getMsn <em>Msn</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.OmEmployeeImpl#getHtel <em>Htel</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.OmEmployeeImpl#getHaddress <em>Haddress</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.OmEmployeeImpl#getHzipcode <em>Hzipcode</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.OmEmployeeImpl#getPemail <em>Pemail</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.OmEmployeeImpl#getParty <em>Party</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.OmEmployeeImpl#getDegree <em>Degree</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.OmEmployeeImpl#getMajor <em>Major</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.OmEmployeeImpl#getSpecialty <em>Specialty</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.OmEmployeeImpl#getWorkexp <em>Workexp</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.OmEmployeeImpl#getRegdate <em>Regdate</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.OmEmployeeImpl#getCreatetime <em>Createtime</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.OmEmployeeImpl#getLastmodytime <em>Lastmodytime</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.OmEmployeeImpl#getOrgidlist <em>Orgidlist</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.OmEmployeeImpl#getOrgid <em>Orgid</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.OmEmployeeImpl#getRemark <em>Remark</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.OmEmployeeImpl#getBankname <em>Bankname</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.OmEmployeeImpl#getBankacct <em>Bankacct</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.OmEmployeeImpl#getNation <em>Nation</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.OmEmployeeImpl#getBirthplace <em>Birthplace</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.OmEmployeeImpl#getResidence <em>Residence</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.OmEmployeeImpl#getLiveplace <em>Liveplace</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.OmEmployeeImpl#getEmergency <em>Emergency</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.OmEmployeeImpl#getEmerelation <em>Emerelation</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.OmEmployeeImpl#getEmelink <em>Emelink</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.OmEmployeeImpl#getSocialstart <em>Socialstart</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.OmEmployeeImpl#getEmptype <em>Emptype</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.OmEmployeeImpl#getWorkplace <em>Workplace</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.OmEmployeeImpl#getWelfareplace <em>Welfareplace</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.OmEmployeeImpl#getRecruitsour <em>Recruitsour</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.OmEmployeeImpl#getInnerrec <em>Innerrec</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.OmEmployeeImpl#getRecruitoper <em>Recruitoper</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.OmEmployeeImpl#getOuttype <em>Outtype</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.OmEmployeeImpl#getOutreason <em>Outreason</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.OmEmployeeImpl#getOutto <em>Outto</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.OmEmployeeImpl#getOutmakeup <em>Outmakeup</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.OmEmployeeImpl#getOutmemo <em>Outmemo</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.OmEmployeeImpl#getHighestindate <em>Highestindate</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.OmEmployeeImpl#getHighestlen <em>Highestlen</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.OmEmployeeImpl#getHighestoutdate <em>Highestoutdate</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.OmEmployeeImpl#getResiproperty <em>Resiproperty</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.OmEmployeeImpl#getFilesaveorg <em>Filesaveorg</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.OmEmployeeImpl#getFilecity <em>Filecity</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.OmEmployeeImpl#getFileaddress <em>Fileaddress</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.OmEmployeeImpl#getIshaveresi <em>Ishaveresi</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.OmEmployeeImpl#getResilimit <em>Resilimit</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.OmEmployeeImpl#getResidealorg <em>Residealorg</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.OmEmployeeImpl#getResistartdate <em>Resistartdate</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.OmEmployeeImpl#getResienddate <em>Resienddate</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.OmEmployeeImpl#getMarristatus <em>Marristatus</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.OmEmployeeImpl#getFundno <em>Fundno</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.OmEmployeeImpl#getAddfundno <em>Addfundno</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.OmEmployeeImpl#getNonagename <em>Nonagename</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.OmEmployeeImpl#getNonagesex <em>Nonagesex</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.OmEmployeeImpl#getNonagebirth <em>Nonagebirth</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.OmEmployeeImpl#getIsjoinpcf <em>Isjoinpcf</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.OmEmployeeImpl#getResiaddress <em>Resiaddress</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.OmEmployeeImpl#getSpousestate <em>Spousestate</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.OmEmployeeImpl#getSpousename <em>Spousename</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.OmEmployeeImpl#getSpousecardno <em>Spousecardno</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.OmEmployeeImpl#getCompany <em>Company</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.OmEmployeeImpl#getSpousecardtype <em>Spousecardtype</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.OmEmployeeImpl#getJoblevel <em>Joblevel</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.OmEmployeeImpl#getNature <em>Nature</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.OmEmployeeImpl#getLedgerempid <em>Ledgerempid</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.OmEmployeeImpl#getLedgerempname <em>Ledgerempname</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.OmEmployeeImpl#getLedgerorgid <em>Ledgerorgid</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.OmEmployeeImpl#getLedgerorgname <em>Ledgerorgname</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.OmEmployeeImpl#getPositionname <em>Positionname</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.OmEmployeeImpl#getMentor <em>Mentor</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.OmEmployeeImpl#getPcfamount <em>Pcfamount</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.OmEmployeeImpl#getIstakepc <em>Istakepc</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.OmEmployeeImpl#getTakepcdate <em>Takepcdate</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.OmEmployeeImpl#getEduverify <em>Eduverify</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.OmEmployeeImpl#getTakepcenddate <em>Takepcenddate</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.OmEmployeeImpl#getPcfstartdate <em>Pcfstartdate</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.OmEmployeeImpl#getPcfenddate <em>Pcfenddate</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.OmEmployeeImpl#getPositioncall <em>Positioncall</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.OmEmployeeImpl#getCompmstartday <em>Compmstartday</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.OmEmployeeImpl#getTag <em>Tag</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.impl.OmEmployeeImpl#getFunofficial <em>Funofficial</em>}</li>
 * </ul>
 * </p>
 *
 * @extends ExtendedDataObjectImpl;
 *
 * @implements OmEmployee;
 */

public class OmEmployeeImpl extends ExtendedDataObjectImpl implements OmEmployee {
	/**
	 * Comment for <code>serialVersionUID</code>
	 */
	private static final long serialVersionUID = 1L;
	public final static int INDEX_EMPID = 0;
	public final static int INDEX_EMPCODE = 1;
	public final static int INDEX_OPERATORID = 2;
	public final static int INDEX_USERID = 3;
	public final static int INDEX_EMPNAME = 4;
	public final static int INDEX_REALNAME = 5;
	public final static int INDEX_GENDER = 6;
	public final static int INDEX_BIRTHDATE = 7;
	public final static int INDEX_POSITION = 8;
	public final static int INDEX_EMPSTATUS = 9;
	public final static int INDEX_CARDTYPE = 10;
	public final static int INDEX_CARDNO = 11;
	public final static int INDEX_INDATE = 12;
	public final static int INDEX_OUTDATE = 13;
	public final static int INDEX_OTEL = 14;
	public final static int INDEX_OADDRESS = 15;
	public final static int INDEX_OZIPCODE = 16;
	public final static int INDEX_OEMAIL = 17;
	public final static int INDEX_FAXNO = 18;
	public final static int INDEX_MOBILENO = 19;
	public final static int INDEX_MSN = 20;
	public final static int INDEX_HTEL = 21;
	public final static int INDEX_HADDRESS = 22;
	public final static int INDEX_HZIPCODE = 23;
	public final static int INDEX_PEMAIL = 24;
	public final static int INDEX_PARTY = 25;
	public final static int INDEX_DEGREE = 26;
	public final static int INDEX_MAJOR = 27;
	public final static int INDEX_SPECIALTY = 28;
	public final static int INDEX_WORKEXP = 29;
	public final static int INDEX_REGDATE = 30;
	public final static int INDEX_CREATETIME = 31;
	public final static int INDEX_LASTMODYTIME = 32;
	public final static int INDEX_ORGIDLIST = 33;
	public final static int INDEX_ORGID = 34;
	public final static int INDEX_REMARK = 35;
	public final static int INDEX_BANKNAME = 36;
	public final static int INDEX_BANKACCT = 37;
	public final static int INDEX_NATION = 38;
	public final static int INDEX_BIRTHPLACE = 39;
	public final static int INDEX_RESIDENCE = 40;
	public final static int INDEX_LIVEPLACE = 41;
	public final static int INDEX_EMERGENCY = 42;
	public final static int INDEX_EMERELATION = 43;
	public final static int INDEX_EMELINK = 44;
	public final static int INDEX_SOCIALSTART = 45;
	public final static int INDEX_EMPTYPE = 46;
	public final static int INDEX_WORKPLACE = 47;
	public final static int INDEX_WELFAREPLACE = 48;
	public final static int INDEX_RECRUITSOUR = 49;
	public final static int INDEX_INNERREC = 50;
	public final static int INDEX_RECRUITOPER = 51;
	public final static int INDEX_OUTTYPE = 52;
	public final static int INDEX_OUTREASON = 53;
	public final static int INDEX_OUTTO = 54;
	public final static int INDEX_OUTMAKEUP = 55;
	public final static int INDEX_OUTMEMO = 56;
	public final static int INDEX_HIGHESTINDATE = 57;
	public final static int INDEX_HIGHESTLEN = 58;
	public final static int INDEX_HIGHESTOUTDATE = 59;
	public final static int INDEX_RESIPROPERTY = 60;
	public final static int INDEX_FILESAVEORG = 61;
	public final static int INDEX_FILECITY = 62;
	public final static int INDEX_FILEADDRESS = 63;
	public final static int INDEX_ISHAVERESI = 64;
	public final static int INDEX_RESILIMIT = 65;
	public final static int INDEX_RESIDEALORG = 66;
	public final static int INDEX_RESISTARTDATE = 67;
	public final static int INDEX_RESIENDDATE = 68;
	public final static int INDEX_MARRISTATUS = 69;
	public final static int INDEX_FUNDNO = 70;
	public final static int INDEX_ADDFUNDNO = 71;
	public final static int INDEX_NONAGENAME = 72;
	public final static int INDEX_NONAGESEX = 73;
	public final static int INDEX_NONAGEBIRTH = 74;
	public final static int INDEX_ISJOINPCF = 75;
	public final static int INDEX_RESIADDRESS = 76;
	public final static int INDEX_SPOUSESTATE = 77;
	public final static int INDEX_SPOUSENAME = 78;
	public final static int INDEX_SPOUSECARDNO = 79;
	public final static int INDEX_COMPANY = 80;
	public final static int INDEX_SPOUSECARDTYPE = 81;
	public final static int INDEX_JOBLEVEL = 82;
	public final static int INDEX_NATURE = 83;
	public final static int INDEX_LEDGEREMPID = 84;
	public final static int INDEX_LEDGEREMPNAME = 85;
	public final static int INDEX_LEDGERORGID = 86;
	public final static int INDEX_LEDGERORGNAME = 87;
	public final static int INDEX_POSITIONNAME = 88;
	public final static int INDEX_MENTOR = 89;
	public final static int INDEX_PCFAMOUNT = 90;
	public final static int INDEX_ISTAKEPC = 91;
	public final static int INDEX_TAKEPCDATE = 92;
	public final static int INDEX_EDUVERIFY = 93;
	public final static int INDEX_TAKEPCENDDATE = 94;
	public final static int INDEX_PCFSTARTDATE = 95;
	public final static int INDEX_PCFENDDATE = 96;
	public final static int INDEX_POSITIONCALL = 97;
	public final static int INDEX_COMPMSTARTDAY = 98;
	public final static int INDEX_TAG = 99;
	public final static int INDEX_FUNOFFICIAL = 100;
	public static final int SDO_PROPERTY_COUNT = 101;

	public static final int EXTENDED_PROPERTY_COUNT = -1;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 */
	public OmEmployeeImpl() {
		this(TYPE);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 */
	public OmEmployeeImpl(Type type) {
		super(type);
	}

	protected void validate() {
		validateType(TYPE);
	}

	/**
	 * Returns the value of the '<em><b>Empid</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Empid</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Empid</em>' attribute.
	 * @see #setEmpid(java.math.BigDecimal)
	 */
	public BigDecimal getEmpid() {
		return DataUtil.toBigDecimal(super.getByIndex(INDEX_EMPID, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getEmpid <em>Empid</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Empid</em>' attribute.
	 * @see #getEmpid()
	 */
	public void setEmpid(BigDecimal empid) {
		super.setByIndex(INDEX_EMPID, empid);
	}

	/**
	 * Returns the value of the '<em><b>Empcode</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Empcode</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Empcode</em>' attribute.
	 * @see #setEmpcode(java.lang.String)
	 */
	public String getEmpcode() {
		return DataUtil.toString(super.getByIndex(INDEX_EMPCODE, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getEmpcode <em>Empcode</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Empcode</em>' attribute.
	 * @see #getEmpcode()
	 */
	public void setEmpcode(String empcode) {
		super.setByIndex(INDEX_EMPCODE, empcode);
	}

	/**
	 * Returns the value of the '<em><b>Operatorid</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Operatorid</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Operatorid</em>' attribute.
	 * @see #setOperatorid(java.math.BigDecimal)
	 */
	public BigDecimal getOperatorid() {
		return DataUtil.toBigDecimal(super.getByIndex(INDEX_OPERATORID, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getOperatorid <em>Operatorid</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Operatorid</em>' attribute.
	 * @see #getOperatorid()
	 */
	public void setOperatorid(BigDecimal operatorid) {
		super.setByIndex(INDEX_OPERATORID, operatorid);
	}

	/**
	 * Returns the value of the '<em><b>Userid</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Userid</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Userid</em>' attribute.
	 * @see #setUserid(java.lang.String)
	 */
	public String getUserid() {
		return DataUtil.toString(super.getByIndex(INDEX_USERID, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getUserid <em>Userid</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Userid</em>' attribute.
	 * @see #getUserid()
	 */
	public void setUserid(String userid) {
		super.setByIndex(INDEX_USERID, userid);
	}

	/**
	 * Returns the value of the '<em><b>Empname</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Empname</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Empname</em>' attribute.
	 * @see #setEmpname(java.lang.String)
	 */
	public String getEmpname() {
		return DataUtil.toString(super.getByIndex(INDEX_EMPNAME, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getEmpname <em>Empname</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Empname</em>' attribute.
	 * @see #getEmpname()
	 */
	public void setEmpname(String empname) {
		super.setByIndex(INDEX_EMPNAME, empname);
	}

	/**
	 * Returns the value of the '<em><b>Realname</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Realname</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Realname</em>' attribute.
	 * @see #setRealname(java.lang.String)
	 */
	public String getRealname() {
		return DataUtil.toString(super.getByIndex(INDEX_REALNAME, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getRealname <em>Realname</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Realname</em>' attribute.
	 * @see #getRealname()
	 */
	public void setRealname(String realname) {
		super.setByIndex(INDEX_REALNAME, realname);
	}

	/**
	 * Returns the value of the '<em><b>Gender</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Gender</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Gender</em>' attribute.
	 * @see #setGender(java.lang.String)
	 */
	public String getGender() {
		return DataUtil.toString(super.getByIndex(INDEX_GENDER, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getGender <em>Gender</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Gender</em>' attribute.
	 * @see #getGender()
	 */
	public void setGender(String gender) {
		super.setByIndex(INDEX_GENDER, gender);
	}

	/**
	 * Returns the value of the '<em><b>Birthdate</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Birthdate</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Birthdate</em>' attribute.
	 * @see #setBirthdate(java.util.Date)
	 */
	public Date getBirthdate() {
		return DataUtil.toDate(super.getByIndex(INDEX_BIRTHDATE, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getBirthdate <em>Birthdate</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Birthdate</em>' attribute.
	 * @see #getBirthdate()
	 */
	public void setBirthdate(Date birthdate) {
		super.setByIndex(INDEX_BIRTHDATE, birthdate);
	}

	/**
	 * Returns the value of the '<em><b>Position</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Position</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Position</em>' attribute.
	 * @see #setPosition(java.math.BigDecimal)
	 */
	public BigDecimal getPosition() {
		return DataUtil.toBigDecimal(super.getByIndex(INDEX_POSITION, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getPosition <em>Position</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Position</em>' attribute.
	 * @see #getPosition()
	 */
	public void setPosition(BigDecimal position) {
		super.setByIndex(INDEX_POSITION, position);
	}

	/**
	 * Returns the value of the '<em><b>Empstatus</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Empstatus</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Empstatus</em>' attribute.
	 * @see #setEmpstatus(java.lang.String)
	 */
	public String getEmpstatus() {
		return DataUtil.toString(super.getByIndex(INDEX_EMPSTATUS, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getEmpstatus <em>Empstatus</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Empstatus</em>' attribute.
	 * @see #getEmpstatus()
	 */
	public void setEmpstatus(String empstatus) {
		super.setByIndex(INDEX_EMPSTATUS, empstatus);
	}

	/**
	 * Returns the value of the '<em><b>Cardtype</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Cardtype</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Cardtype</em>' attribute.
	 * @see #setCardtype(java.lang.String)
	 */
	public String getCardtype() {
		return DataUtil.toString(super.getByIndex(INDEX_CARDTYPE, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getCardtype <em>Cardtype</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Cardtype</em>' attribute.
	 * @see #getCardtype()
	 */
	public void setCardtype(String cardtype) {
		super.setByIndex(INDEX_CARDTYPE, cardtype);
	}

	/**
	 * Returns the value of the '<em><b>Cardno</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Cardno</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Cardno</em>' attribute.
	 * @see #setCardno(java.lang.String)
	 */
	public String getCardno() {
		return DataUtil.toString(super.getByIndex(INDEX_CARDNO, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getCardno <em>Cardno</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Cardno</em>' attribute.
	 * @see #getCardno()
	 */
	public void setCardno(String cardno) {
		super.setByIndex(INDEX_CARDNO, cardno);
	}

	/**
	 * Returns the value of the '<em><b>Indate</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Indate</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Indate</em>' attribute.
	 * @see #setIndate(java.util.Date)
	 */
	public Date getIndate() {
		return DataUtil.toDate(super.getByIndex(INDEX_INDATE, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getIndate <em>Indate</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Indate</em>' attribute.
	 * @see #getIndate()
	 */
	public void setIndate(Date indate) {
		super.setByIndex(INDEX_INDATE, indate);
	}

	/**
	 * Returns the value of the '<em><b>Outdate</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Outdate</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Outdate</em>' attribute.
	 * @see #setOutdate(java.util.Date)
	 */
	public Date getOutdate() {
		return DataUtil.toDate(super.getByIndex(INDEX_OUTDATE, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getOutdate <em>Outdate</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Outdate</em>' attribute.
	 * @see #getOutdate()
	 */
	public void setOutdate(Date outdate) {
		super.setByIndex(INDEX_OUTDATE, outdate);
	}

	/**
	 * Returns the value of the '<em><b>Otel</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Otel</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Otel</em>' attribute.
	 * @see #setOtel(java.lang.String)
	 */
	public String getOtel() {
		return DataUtil.toString(super.getByIndex(INDEX_OTEL, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getOtel <em>Otel</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Otel</em>' attribute.
	 * @see #getOtel()
	 */
	public void setOtel(String otel) {
		super.setByIndex(INDEX_OTEL, otel);
	}

	/**
	 * Returns the value of the '<em><b>Oaddress</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Oaddress</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Oaddress</em>' attribute.
	 * @see #setOaddress(java.lang.String)
	 */
	public String getOaddress() {
		return DataUtil.toString(super.getByIndex(INDEX_OADDRESS, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getOaddress <em>Oaddress</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Oaddress</em>' attribute.
	 * @see #getOaddress()
	 */
	public void setOaddress(String oaddress) {
		super.setByIndex(INDEX_OADDRESS, oaddress);
	}

	/**
	 * Returns the value of the '<em><b>Ozipcode</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Ozipcode</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Ozipcode</em>' attribute.
	 * @see #setOzipcode(java.lang.String)
	 */
	public String getOzipcode() {
		return DataUtil.toString(super.getByIndex(INDEX_OZIPCODE, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getOzipcode <em>Ozipcode</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Ozipcode</em>' attribute.
	 * @see #getOzipcode()
	 */
	public void setOzipcode(String ozipcode) {
		super.setByIndex(INDEX_OZIPCODE, ozipcode);
	}

	/**
	 * Returns the value of the '<em><b>Oemail</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Oemail</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Oemail</em>' attribute.
	 * @see #setOemail(java.lang.String)
	 */
	public String getOemail() {
		return DataUtil.toString(super.getByIndex(INDEX_OEMAIL, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getOemail <em>Oemail</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Oemail</em>' attribute.
	 * @see #getOemail()
	 */
	public void setOemail(String oemail) {
		super.setByIndex(INDEX_OEMAIL, oemail);
	}

	/**
	 * Returns the value of the '<em><b>Faxno</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Faxno</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Faxno</em>' attribute.
	 * @see #setFaxno(java.lang.String)
	 */
	public String getFaxno() {
		return DataUtil.toString(super.getByIndex(INDEX_FAXNO, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getFaxno <em>Faxno</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Faxno</em>' attribute.
	 * @see #getFaxno()
	 */
	public void setFaxno(String faxno) {
		super.setByIndex(INDEX_FAXNO, faxno);
	}

	/**
	 * Returns the value of the '<em><b>Mobileno</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Mobileno</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Mobileno</em>' attribute.
	 * @see #setMobileno(java.lang.String)
	 */
	public String getMobileno() {
		return DataUtil.toString(super.getByIndex(INDEX_MOBILENO, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getMobileno <em>Mobileno</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Mobileno</em>' attribute.
	 * @see #getMobileno()
	 */
	public void setMobileno(String mobileno) {
		super.setByIndex(INDEX_MOBILENO, mobileno);
	}

	/**
	 * Returns the value of the '<em><b>Msn</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Msn</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Msn</em>' attribute.
	 * @see #setMsn(java.lang.String)
	 */
	public String getMsn() {
		return DataUtil.toString(super.getByIndex(INDEX_MSN, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getMsn <em>Msn</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Msn</em>' attribute.
	 * @see #getMsn()
	 */
	public void setMsn(String msn) {
		super.setByIndex(INDEX_MSN, msn);
	}

	/**
	 * Returns the value of the '<em><b>Htel</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Htel</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Htel</em>' attribute.
	 * @see #setHtel(java.lang.String)
	 */
	public String getHtel() {
		return DataUtil.toString(super.getByIndex(INDEX_HTEL, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getHtel <em>Htel</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Htel</em>' attribute.
	 * @see #getHtel()
	 */
	public void setHtel(String htel) {
		super.setByIndex(INDEX_HTEL, htel);
	}

	/**
	 * Returns the value of the '<em><b>Haddress</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Haddress</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Haddress</em>' attribute.
	 * @see #setHaddress(java.lang.String)
	 */
	public String getHaddress() {
		return DataUtil.toString(super.getByIndex(INDEX_HADDRESS, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getHaddress <em>Haddress</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Haddress</em>' attribute.
	 * @see #getHaddress()
	 */
	public void setHaddress(String haddress) {
		super.setByIndex(INDEX_HADDRESS, haddress);
	}

	/**
	 * Returns the value of the '<em><b>Hzipcode</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Hzipcode</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Hzipcode</em>' attribute.
	 * @see #setHzipcode(java.lang.String)
	 */
	public String getHzipcode() {
		return DataUtil.toString(super.getByIndex(INDEX_HZIPCODE, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getHzipcode <em>Hzipcode</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Hzipcode</em>' attribute.
	 * @see #getHzipcode()
	 */
	public void setHzipcode(String hzipcode) {
		super.setByIndex(INDEX_HZIPCODE, hzipcode);
	}

	/**
	 * Returns the value of the '<em><b>Pemail</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Pemail</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Pemail</em>' attribute.
	 * @see #setPemail(java.lang.String)
	 */
	public String getPemail() {
		return DataUtil.toString(super.getByIndex(INDEX_PEMAIL, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getPemail <em>Pemail</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Pemail</em>' attribute.
	 * @see #getPemail()
	 */
	public void setPemail(String pemail) {
		super.setByIndex(INDEX_PEMAIL, pemail);
	}

	/**
	 * Returns the value of the '<em><b>Party</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Party</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Party</em>' attribute.
	 * @see #setParty(java.lang.String)
	 */
	public String getParty() {
		return DataUtil.toString(super.getByIndex(INDEX_PARTY, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getParty <em>Party</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Party</em>' attribute.
	 * @see #getParty()
	 */
	public void setParty(String party) {
		super.setByIndex(INDEX_PARTY, party);
	}

	/**
	 * Returns the value of the '<em><b>Degree</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Degree</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Degree</em>' attribute.
	 * @see #setDegree(java.lang.String)
	 */
	public String getDegree() {
		return DataUtil.toString(super.getByIndex(INDEX_DEGREE, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getDegree <em>Degree</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Degree</em>' attribute.
	 * @see #getDegree()
	 */
	public void setDegree(String degree) {
		super.setByIndex(INDEX_DEGREE, degree);
	}

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
	public String getMajor() {
		return DataUtil.toString(super.getByIndex(INDEX_MAJOR, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getMajor <em>Major</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Major</em>' attribute.
	 * @see #getMajor()
	 */
	public void setMajor(String major) {
		super.setByIndex(INDEX_MAJOR, major);
	}

	/**
	 * Returns the value of the '<em><b>Specialty</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Specialty</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Specialty</em>' attribute.
	 * @see #setSpecialty(java.lang.String)
	 */
	public String getSpecialty() {
		return DataUtil.toString(super.getByIndex(INDEX_SPECIALTY, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getSpecialty <em>Specialty</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Specialty</em>' attribute.
	 * @see #getSpecialty()
	 */
	public void setSpecialty(String specialty) {
		super.setByIndex(INDEX_SPECIALTY, specialty);
	}

	/**
	 * Returns the value of the '<em><b>Workexp</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Workexp</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Workexp</em>' attribute.
	 * @see #setWorkexp(java.lang.String)
	 */
	public String getWorkexp() {
		return DataUtil.toString(super.getByIndex(INDEX_WORKEXP, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getWorkexp <em>Workexp</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Workexp</em>' attribute.
	 * @see #getWorkexp()
	 */
	public void setWorkexp(String workexp) {
		super.setByIndex(INDEX_WORKEXP, workexp);
	}

	/**
	 * Returns the value of the '<em><b>Regdate</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Regdate</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Regdate</em>' attribute.
	 * @see #setRegdate(java.util.Date)
	 */
	public Date getRegdate() {
		return DataUtil.toDate(super.getByIndex(INDEX_REGDATE, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getRegdate <em>Regdate</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Regdate</em>' attribute.
	 * @see #getRegdate()
	 */
	public void setRegdate(Date regdate) {
		super.setByIndex(INDEX_REGDATE, regdate);
	}

	/**
	 * Returns the value of the '<em><b>Createtime</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Createtime</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Createtime</em>' attribute.
	 * @see #setCreatetime(java.util.Date)
	 */
	public Date getCreatetime() {
		return DataUtil.toDate(super.getByIndex(INDEX_CREATETIME, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getCreatetime <em>Createtime</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Createtime</em>' attribute.
	 * @see #getCreatetime()
	 */
	public void setCreatetime(Date createtime) {
		super.setByIndex(INDEX_CREATETIME, createtime);
	}

	/**
	 * Returns the value of the '<em><b>Lastmodytime</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Lastmodytime</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Lastmodytime</em>' attribute.
	 * @see #setLastmodytime(java.util.Date)
	 */
	public Date getLastmodytime() {
		return DataUtil.toDate(super.getByIndex(INDEX_LASTMODYTIME, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getLastmodytime <em>Lastmodytime</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Lastmodytime</em>' attribute.
	 * @see #getLastmodytime()
	 */
	public void setLastmodytime(Date lastmodytime) {
		super.setByIndex(INDEX_LASTMODYTIME, lastmodytime);
	}

	/**
	 * Returns the value of the '<em><b>Orgidlist</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Orgidlist</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Orgidlist</em>' attribute.
	 * @see #setOrgidlist(java.lang.String)
	 */
	public String getOrgidlist() {
		return DataUtil.toString(super.getByIndex(INDEX_ORGIDLIST, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getOrgidlist <em>Orgidlist</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Orgidlist</em>' attribute.
	 * @see #getOrgidlist()
	 */
	public void setOrgidlist(String orgidlist) {
		super.setByIndex(INDEX_ORGIDLIST, orgidlist);
	}

	/**
	 * Returns the value of the '<em><b>Orgid</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Orgid</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Orgid</em>' attribute.
	 * @see #setOrgid(java.math.BigDecimal)
	 */
	public BigDecimal getOrgid() {
		return DataUtil.toBigDecimal(super.getByIndex(INDEX_ORGID, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getOrgid <em>Orgid</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Orgid</em>' attribute.
	 * @see #getOrgid()
	 */
	public void setOrgid(BigDecimal orgid) {
		super.setByIndex(INDEX_ORGID, orgid);
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
	 * Returns the value of the '<em><b>Bankname</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Bankname</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Bankname</em>' attribute.
	 * @see #setBankname(java.lang.String)
	 */
	public String getBankname() {
		return DataUtil.toString(super.getByIndex(INDEX_BANKNAME, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getBankname <em>Bankname</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Bankname</em>' attribute.
	 * @see #getBankname()
	 */
	public void setBankname(String bankname) {
		super.setByIndex(INDEX_BANKNAME, bankname);
	}

	/**
	 * Returns the value of the '<em><b>Bankacct</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Bankacct</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Bankacct</em>' attribute.
	 * @see #setBankacct(java.lang.String)
	 */
	public String getBankacct() {
		return DataUtil.toString(super.getByIndex(INDEX_BANKACCT, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getBankacct <em>Bankacct</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Bankacct</em>' attribute.
	 * @see #getBankacct()
	 */
	public void setBankacct(String bankacct) {
		super.setByIndex(INDEX_BANKACCT, bankacct);
	}

	/**
	 * Returns the value of the '<em><b>Nation</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Nation</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Nation</em>' attribute.
	 * @see #setNation(java.lang.String)
	 */
	public String getNation() {
		return DataUtil.toString(super.getByIndex(INDEX_NATION, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getNation <em>Nation</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Nation</em>' attribute.
	 * @see #getNation()
	 */
	public void setNation(String nation) {
		super.setByIndex(INDEX_NATION, nation);
	}

	/**
	 * Returns the value of the '<em><b>Birthplace</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Birthplace</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Birthplace</em>' attribute.
	 * @see #setBirthplace(java.lang.String)
	 */
	public String getBirthplace() {
		return DataUtil.toString(super.getByIndex(INDEX_BIRTHPLACE, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getBirthplace <em>Birthplace</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Birthplace</em>' attribute.
	 * @see #getBirthplace()
	 */
	public void setBirthplace(String birthplace) {
		super.setByIndex(INDEX_BIRTHPLACE, birthplace);
	}

	/**
	 * Returns the value of the '<em><b>Residence</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Residence</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Residence</em>' attribute.
	 * @see #setResidence(java.lang.String)
	 */
	public String getResidence() {
		return DataUtil.toString(super.getByIndex(INDEX_RESIDENCE, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getResidence <em>Residence</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Residence</em>' attribute.
	 * @see #getResidence()
	 */
	public void setResidence(String residence) {
		super.setByIndex(INDEX_RESIDENCE, residence);
	}

	/**
	 * Returns the value of the '<em><b>Liveplace</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Liveplace</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Liveplace</em>' attribute.
	 * @see #setLiveplace(java.lang.String)
	 */
	public String getLiveplace() {
		return DataUtil.toString(super.getByIndex(INDEX_LIVEPLACE, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getLiveplace <em>Liveplace</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Liveplace</em>' attribute.
	 * @see #getLiveplace()
	 */
	public void setLiveplace(String liveplace) {
		super.setByIndex(INDEX_LIVEPLACE, liveplace);
	}

	/**
	 * Returns the value of the '<em><b>Emergency</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Emergency</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Emergency</em>' attribute.
	 * @see #setEmergency(java.lang.String)
	 */
	public String getEmergency() {
		return DataUtil.toString(super.getByIndex(INDEX_EMERGENCY, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getEmergency <em>Emergency</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Emergency</em>' attribute.
	 * @see #getEmergency()
	 */
	public void setEmergency(String emergency) {
		super.setByIndex(INDEX_EMERGENCY, emergency);
	}

	/**
	 * Returns the value of the '<em><b>Emerelation</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Emerelation</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Emerelation</em>' attribute.
	 * @see #setEmerelation(java.lang.String)
	 */
	public String getEmerelation() {
		return DataUtil.toString(super.getByIndex(INDEX_EMERELATION, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getEmerelation <em>Emerelation</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Emerelation</em>' attribute.
	 * @see #getEmerelation()
	 */
	public void setEmerelation(String emerelation) {
		super.setByIndex(INDEX_EMERELATION, emerelation);
	}

	/**
	 * Returns the value of the '<em><b>Emelink</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Emelink</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Emelink</em>' attribute.
	 * @see #setEmelink(java.lang.String)
	 */
	public String getEmelink() {
		return DataUtil.toString(super.getByIndex(INDEX_EMELINK, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getEmelink <em>Emelink</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Emelink</em>' attribute.
	 * @see #getEmelink()
	 */
	public void setEmelink(String emelink) {
		super.setByIndex(INDEX_EMELINK, emelink);
	}

	/**
	 * Returns the value of the '<em><b>Socialstart</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Socialstart</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Socialstart</em>' attribute.
	 * @see #setSocialstart(java.util.Date)
	 */
	public Date getSocialstart() {
		return DataUtil.toDate(super.getByIndex(INDEX_SOCIALSTART, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getSocialstart <em>Socialstart</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Socialstart</em>' attribute.
	 * @see #getSocialstart()
	 */
	public void setSocialstart(Date socialstart) {
		super.setByIndex(INDEX_SOCIALSTART, socialstart);
	}

	/**
	 * Returns the value of the '<em><b>Emptype</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Emptype</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Emptype</em>' attribute.
	 * @see #setEmptype(java.lang.String)
	 */
	public String getEmptype() {
		return DataUtil.toString(super.getByIndex(INDEX_EMPTYPE, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getEmptype <em>Emptype</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Emptype</em>' attribute.
	 * @see #getEmptype()
	 */
	public void setEmptype(String emptype) {
		super.setByIndex(INDEX_EMPTYPE, emptype);
	}

	/**
	 * Returns the value of the '<em><b>Workplace</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Workplace</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Workplace</em>' attribute.
	 * @see #setWorkplace(java.lang.String)
	 */
	public String getWorkplace() {
		return DataUtil.toString(super.getByIndex(INDEX_WORKPLACE, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getWorkplace <em>Workplace</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Workplace</em>' attribute.
	 * @see #getWorkplace()
	 */
	public void setWorkplace(String workplace) {
		super.setByIndex(INDEX_WORKPLACE, workplace);
	}

	/**
	 * Returns the value of the '<em><b>Welfareplace</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Welfareplace</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Welfareplace</em>' attribute.
	 * @see #setWelfareplace(java.lang.String)
	 */
	public String getWelfareplace() {
		return DataUtil.toString(super.getByIndex(INDEX_WELFAREPLACE, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getWelfareplace <em>Welfareplace</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Welfareplace</em>' attribute.
	 * @see #getWelfareplace()
	 */
	public void setWelfareplace(String welfareplace) {
		super.setByIndex(INDEX_WELFAREPLACE, welfareplace);
	}

	/**
	 * Returns the value of the '<em><b>Recruitsour</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Recruitsour</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Recruitsour</em>' attribute.
	 * @see #setRecruitsour(java.lang.String)
	 */
	public String getRecruitsour() {
		return DataUtil.toString(super.getByIndex(INDEX_RECRUITSOUR, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getRecruitsour <em>Recruitsour</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Recruitsour</em>' attribute.
	 * @see #getRecruitsour()
	 */
	public void setRecruitsour(String recruitsour) {
		super.setByIndex(INDEX_RECRUITSOUR, recruitsour);
	}

	/**
	 * Returns the value of the '<em><b>Innerrec</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Innerrec</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Innerrec</em>' attribute.
	 * @see #setInnerrec(java.lang.String)
	 */
	public String getInnerrec() {
		return DataUtil.toString(super.getByIndex(INDEX_INNERREC, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getInnerrec <em>Innerrec</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Innerrec</em>' attribute.
	 * @see #getInnerrec()
	 */
	public void setInnerrec(String innerrec) {
		super.setByIndex(INDEX_INNERREC, innerrec);
	}

	/**
	 * Returns the value of the '<em><b>Recruitoper</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Recruitoper</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Recruitoper</em>' attribute.
	 * @see #setRecruitoper(java.lang.String)
	 */
	public String getRecruitoper() {
		return DataUtil.toString(super.getByIndex(INDEX_RECRUITOPER, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getRecruitoper <em>Recruitoper</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Recruitoper</em>' attribute.
	 * @see #getRecruitoper()
	 */
	public void setRecruitoper(String recruitoper) {
		super.setByIndex(INDEX_RECRUITOPER, recruitoper);
	}

	/**
	 * Returns the value of the '<em><b>Outtype</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Outtype</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Outtype</em>' attribute.
	 * @see #setOuttype(java.lang.String)
	 */
	public String getOuttype() {
		return DataUtil.toString(super.getByIndex(INDEX_OUTTYPE, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getOuttype <em>Outtype</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Outtype</em>' attribute.
	 * @see #getOuttype()
	 */
	public void setOuttype(String outtype) {
		super.setByIndex(INDEX_OUTTYPE, outtype);
	}

	/**
	 * Returns the value of the '<em><b>Outreason</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Outreason</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Outreason</em>' attribute.
	 * @see #setOutreason(java.lang.String)
	 */
	public String getOutreason() {
		return DataUtil.toString(super.getByIndex(INDEX_OUTREASON, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getOutreason <em>Outreason</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Outreason</em>' attribute.
	 * @see #getOutreason()
	 */
	public void setOutreason(String outreason) {
		super.setByIndex(INDEX_OUTREASON, outreason);
	}

	/**
	 * Returns the value of the '<em><b>Outto</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Outto</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Outto</em>' attribute.
	 * @see #setOutto(java.lang.String)
	 */
	public String getOutto() {
		return DataUtil.toString(super.getByIndex(INDEX_OUTTO, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getOutto <em>Outto</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Outto</em>' attribute.
	 * @see #getOutto()
	 */
	public void setOutto(String outto) {
		super.setByIndex(INDEX_OUTTO, outto);
	}

	/**
	 * Returns the value of the '<em><b>Outmakeup</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Outmakeup</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Outmakeup</em>' attribute.
	 * @see #setOutmakeup(java.lang.String)
	 */
	public String getOutmakeup() {
		return DataUtil.toString(super.getByIndex(INDEX_OUTMAKEUP, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getOutmakeup <em>Outmakeup</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Outmakeup</em>' attribute.
	 * @see #getOutmakeup()
	 */
	public void setOutmakeup(String outmakeup) {
		super.setByIndex(INDEX_OUTMAKEUP, outmakeup);
	}

	/**
	 * Returns the value of the '<em><b>Outmemo</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Outmemo</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Outmemo</em>' attribute.
	 * @see #setOutmemo(java.lang.String)
	 */
	public String getOutmemo() {
		return DataUtil.toString(super.getByIndex(INDEX_OUTMEMO, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getOutmemo <em>Outmemo</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Outmemo</em>' attribute.
	 * @see #getOutmemo()
	 */
	public void setOutmemo(String outmemo) {
		super.setByIndex(INDEX_OUTMEMO, outmemo);
	}

	/**
	 * Returns the value of the '<em><b>Highestindate</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Highestindate</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Highestindate</em>' attribute.
	 * @see #setHighestindate(java.util.Date)
	 */
	public Date getHighestindate() {
		return DataUtil.toDate(super.getByIndex(INDEX_HIGHESTINDATE, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getHighestindate <em>Highestindate</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Highestindate</em>' attribute.
	 * @see #getHighestindate()
	 */
	public void setHighestindate(Date highestindate) {
		super.setByIndex(INDEX_HIGHESTINDATE, highestindate);
	}

	/**
	 * Returns the value of the '<em><b>Highestlen</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Highestlen</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Highestlen</em>' attribute.
	 * @see #setHighestlen(java.lang.String)
	 */
	public String getHighestlen() {
		return DataUtil.toString(super.getByIndex(INDEX_HIGHESTLEN, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getHighestlen <em>Highestlen</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Highestlen</em>' attribute.
	 * @see #getHighestlen()
	 */
	public void setHighestlen(String highestlen) {
		super.setByIndex(INDEX_HIGHESTLEN, highestlen);
	}

	/**
	 * Returns the value of the '<em><b>Highestoutdate</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Highestoutdate</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Highestoutdate</em>' attribute.
	 * @see #setHighestoutdate(java.util.Date)
	 */
	public Date getHighestoutdate() {
		return DataUtil.toDate(super.getByIndex(INDEX_HIGHESTOUTDATE, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getHighestoutdate <em>Highestoutdate</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Highestoutdate</em>' attribute.
	 * @see #getHighestoutdate()
	 */
	public void setHighestoutdate(Date highestoutdate) {
		super.setByIndex(INDEX_HIGHESTOUTDATE, highestoutdate);
	}

	/**
	 * Returns the value of the '<em><b>Resiproperty</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Resiproperty</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Resiproperty</em>' attribute.
	 * @see #setResiproperty(java.lang.String)
	 */
	public String getResiproperty() {
		return DataUtil.toString(super.getByIndex(INDEX_RESIPROPERTY, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getResiproperty <em>Resiproperty</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Resiproperty</em>' attribute.
	 * @see #getResiproperty()
	 */
	public void setResiproperty(String resiproperty) {
		super.setByIndex(INDEX_RESIPROPERTY, resiproperty);
	}

	/**
	 * Returns the value of the '<em><b>Filesaveorg</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Filesaveorg</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Filesaveorg</em>' attribute.
	 * @see #setFilesaveorg(java.lang.String)
	 */
	public String getFilesaveorg() {
		return DataUtil.toString(super.getByIndex(INDEX_FILESAVEORG, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getFilesaveorg <em>Filesaveorg</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Filesaveorg</em>' attribute.
	 * @see #getFilesaveorg()
	 */
	public void setFilesaveorg(String filesaveorg) {
		super.setByIndex(INDEX_FILESAVEORG, filesaveorg);
	}

	/**
	 * Returns the value of the '<em><b>Filecity</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Filecity</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Filecity</em>' attribute.
	 * @see #setFilecity(java.lang.String)
	 */
	public String getFilecity() {
		return DataUtil.toString(super.getByIndex(INDEX_FILECITY, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getFilecity <em>Filecity</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Filecity</em>' attribute.
	 * @see #getFilecity()
	 */
	public void setFilecity(String filecity) {
		super.setByIndex(INDEX_FILECITY, filecity);
	}

	/**
	 * Returns the value of the '<em><b>Fileaddress</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Fileaddress</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Fileaddress</em>' attribute.
	 * @see #setFileaddress(java.lang.String)
	 */
	public String getFileaddress() {
		return DataUtil.toString(super.getByIndex(INDEX_FILEADDRESS, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getFileaddress <em>Fileaddress</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Fileaddress</em>' attribute.
	 * @see #getFileaddress()
	 */
	public void setFileaddress(String fileaddress) {
		super.setByIndex(INDEX_FILEADDRESS, fileaddress);
	}

	/**
	 * Returns the value of the '<em><b>Ishaveresi</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Ishaveresi</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Ishaveresi</em>' attribute.
	 * @see #setIshaveresi(java.lang.String)
	 */
	public String getIshaveresi() {
		return DataUtil.toString(super.getByIndex(INDEX_ISHAVERESI, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getIshaveresi <em>Ishaveresi</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Ishaveresi</em>' attribute.
	 * @see #getIshaveresi()
	 */
	public void setIshaveresi(String ishaveresi) {
		super.setByIndex(INDEX_ISHAVERESI, ishaveresi);
	}

	/**
	 * Returns the value of the '<em><b>Resilimit</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Resilimit</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Resilimit</em>' attribute.
	 * @see #setResilimit(int)
	 */
	public int getResilimit() {
		return DataUtil.toInt(super.getByIndex(INDEX_RESILIMIT, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getResilimit <em>Resilimit</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Resilimit</em>' attribute.
	 * @see #getResilimit()
	 */
	public void setResilimit(int resilimit) {
		super.setByIndex(INDEX_RESILIMIT, resilimit);
	}

	/**
	 * Returns the value of the '<em><b>Residealorg</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Residealorg</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Residealorg</em>' attribute.
	 * @see #setResidealorg(java.lang.String)
	 */
	public String getResidealorg() {
		return DataUtil.toString(super.getByIndex(INDEX_RESIDEALORG, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getResidealorg <em>Residealorg</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Residealorg</em>' attribute.
	 * @see #getResidealorg()
	 */
	public void setResidealorg(String residealorg) {
		super.setByIndex(INDEX_RESIDEALORG, residealorg);
	}

	/**
	 * Returns the value of the '<em><b>Resistartdate</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Resistartdate</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Resistartdate</em>' attribute.
	 * @see #setResistartdate(java.util.Date)
	 */
	public Date getResistartdate() {
		return DataUtil.toDate(super.getByIndex(INDEX_RESISTARTDATE, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getResistartdate <em>Resistartdate</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Resistartdate</em>' attribute.
	 * @see #getResistartdate()
	 */
	public void setResistartdate(Date resistartdate) {
		super.setByIndex(INDEX_RESISTARTDATE, resistartdate);
	}

	/**
	 * Returns the value of the '<em><b>Resienddate</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Resienddate</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Resienddate</em>' attribute.
	 * @see #setResienddate(java.util.Date)
	 */
	public Date getResienddate() {
		return DataUtil.toDate(super.getByIndex(INDEX_RESIENDDATE, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getResienddate <em>Resienddate</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Resienddate</em>' attribute.
	 * @see #getResienddate()
	 */
	public void setResienddate(Date resienddate) {
		super.setByIndex(INDEX_RESIENDDATE, resienddate);
	}

	/**
	 * Returns the value of the '<em><b>Marristatus</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Marristatus</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Marristatus</em>' attribute.
	 * @see #setMarristatus(java.lang.String)
	 */
	public String getMarristatus() {
		return DataUtil.toString(super.getByIndex(INDEX_MARRISTATUS, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getMarristatus <em>Marristatus</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Marristatus</em>' attribute.
	 * @see #getMarristatus()
	 */
	public void setMarristatus(String marristatus) {
		super.setByIndex(INDEX_MARRISTATUS, marristatus);
	}

	/**
	 * Returns the value of the '<em><b>Fundno</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Fundno</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Fundno</em>' attribute.
	 * @see #setFundno(java.lang.String)
	 */
	public String getFundno() {
		return DataUtil.toString(super.getByIndex(INDEX_FUNDNO, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getFundno <em>Fundno</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Fundno</em>' attribute.
	 * @see #getFundno()
	 */
	public void setFundno(String fundno) {
		super.setByIndex(INDEX_FUNDNO, fundno);
	}

	/**
	 * Returns the value of the '<em><b>Addfundno</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Addfundno</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Addfundno</em>' attribute.
	 * @see #setAddfundno(java.lang.String)
	 */
	public String getAddfundno() {
		return DataUtil.toString(super.getByIndex(INDEX_ADDFUNDNO, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getAddfundno <em>Addfundno</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Addfundno</em>' attribute.
	 * @see #getAddfundno()
	 */
	public void setAddfundno(String addfundno) {
		super.setByIndex(INDEX_ADDFUNDNO, addfundno);
	}

	/**
	 * Returns the value of the '<em><b>Nonagename</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Nonagename</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Nonagename</em>' attribute.
	 * @see #setNonagename(java.lang.String)
	 */
	public String getNonagename() {
		return DataUtil.toString(super.getByIndex(INDEX_NONAGENAME, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getNonagename <em>Nonagename</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Nonagename</em>' attribute.
	 * @see #getNonagename()
	 */
	public void setNonagename(String nonagename) {
		super.setByIndex(INDEX_NONAGENAME, nonagename);
	}

	/**
	 * Returns the value of the '<em><b>Nonagesex</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Nonagesex</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Nonagesex</em>' attribute.
	 * @see #setNonagesex(java.lang.String)
	 */
	public String getNonagesex() {
		return DataUtil.toString(super.getByIndex(INDEX_NONAGESEX, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getNonagesex <em>Nonagesex</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Nonagesex</em>' attribute.
	 * @see #getNonagesex()
	 */
	public void setNonagesex(String nonagesex) {
		super.setByIndex(INDEX_NONAGESEX, nonagesex);
	}

	/**
	 * Returns the value of the '<em><b>Nonagebirth</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Nonagebirth</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Nonagebirth</em>' attribute.
	 * @see #setNonagebirth(java.util.Date)
	 */
	public Date getNonagebirth() {
		return DataUtil.toDate(super.getByIndex(INDEX_NONAGEBIRTH, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getNonagebirth <em>Nonagebirth</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Nonagebirth</em>' attribute.
	 * @see #getNonagebirth()
	 */
	public void setNonagebirth(Date nonagebirth) {
		super.setByIndex(INDEX_NONAGEBIRTH, nonagebirth);
	}

	/**
	 * Returns the value of the '<em><b>Isjoinpcf</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Isjoinpcf</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Isjoinpcf</em>' attribute.
	 * @see #setIsjoinpcf(java.lang.String)
	 */
	public String getIsjoinpcf() {
		return DataUtil.toString(super.getByIndex(INDEX_ISJOINPCF, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getIsjoinpcf <em>Isjoinpcf</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Isjoinpcf</em>' attribute.
	 * @see #getIsjoinpcf()
	 */
	public void setIsjoinpcf(String isjoinpcf) {
		super.setByIndex(INDEX_ISJOINPCF, isjoinpcf);
	}

	/**
	 * Returns the value of the '<em><b>Resiaddress</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Resiaddress</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Resiaddress</em>' attribute.
	 * @see #setResiaddress(java.lang.String)
	 */
	public String getResiaddress() {
		return DataUtil.toString(super.getByIndex(INDEX_RESIADDRESS, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getResiaddress <em>Resiaddress</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Resiaddress</em>' attribute.
	 * @see #getResiaddress()
	 */
	public void setResiaddress(String resiaddress) {
		super.setByIndex(INDEX_RESIADDRESS, resiaddress);
	}

	/**
	 * Returns the value of the '<em><b>Spousestate</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Spousestate</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Spousestate</em>' attribute.
	 * @see #setSpousestate(java.lang.String)
	 */
	public String getSpousestate() {
		return DataUtil.toString(super.getByIndex(INDEX_SPOUSESTATE, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getSpousestate <em>Spousestate</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Spousestate</em>' attribute.
	 * @see #getSpousestate()
	 */
	public void setSpousestate(String spousestate) {
		super.setByIndex(INDEX_SPOUSESTATE, spousestate);
	}

	/**
	 * Returns the value of the '<em><b>Spousename</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Spousename</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Spousename</em>' attribute.
	 * @see #setSpousename(java.lang.String)
	 */
	public String getSpousename() {
		return DataUtil.toString(super.getByIndex(INDEX_SPOUSENAME, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getSpousename <em>Spousename</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Spousename</em>' attribute.
	 * @see #getSpousename()
	 */
	public void setSpousename(String spousename) {
		super.setByIndex(INDEX_SPOUSENAME, spousename);
	}

	/**
	 * Returns the value of the '<em><b>Spousecardno</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Spousecardno</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Spousecardno</em>' attribute.
	 * @see #setSpousecardno(java.lang.String)
	 */
	public String getSpousecardno() {
		return DataUtil.toString(super.getByIndex(INDEX_SPOUSECARDNO, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getSpousecardno <em>Spousecardno</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Spousecardno</em>' attribute.
	 * @see #getSpousecardno()
	 */
	public void setSpousecardno(String spousecardno) {
		super.setByIndex(INDEX_SPOUSECARDNO, spousecardno);
	}

	/**
	 * Returns the value of the '<em><b>Company</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Company</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Company</em>' attribute.
	 * @see #setCompany(java.lang.String)
	 */
	public String getCompany() {
		return DataUtil.toString(super.getByIndex(INDEX_COMPANY, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getCompany <em>Company</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Company</em>' attribute.
	 * @see #getCompany()
	 */
	public void setCompany(String company) {
		super.setByIndex(INDEX_COMPANY, company);
	}

	/**
	 * Returns the value of the '<em><b>Spousecardtype</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Spousecardtype</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Spousecardtype</em>' attribute.
	 * @see #setSpousecardtype(java.lang.String)
	 */
	public String getSpousecardtype() {
		return DataUtil.toString(super.getByIndex(INDEX_SPOUSECARDTYPE, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getSpousecardtype <em>Spousecardtype</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Spousecardtype</em>' attribute.
	 * @see #getSpousecardtype()
	 */
	public void setSpousecardtype(String spousecardtype) {
		super.setByIndex(INDEX_SPOUSECARDTYPE, spousecardtype);
	}

	/**
	 * Returns the value of the '<em><b>Joblevel</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Joblevel</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Joblevel</em>' attribute.
	 * @see #setJoblevel(java.lang.String)
	 */
	public String getJoblevel() {
		return DataUtil.toString(super.getByIndex(INDEX_JOBLEVEL, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getJoblevel <em>Joblevel</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Joblevel</em>' attribute.
	 * @see #getJoblevel()
	 */
	public void setJoblevel(String joblevel) {
		super.setByIndex(INDEX_JOBLEVEL, joblevel);
	}

	/**
	 * Returns the value of the '<em><b>Nature</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Nature</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Nature</em>' attribute.
	 * @see #setNature(java.lang.String)
	 */
	public String getNature() {
		return DataUtil.toString(super.getByIndex(INDEX_NATURE, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getNature <em>Nature</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Nature</em>' attribute.
	 * @see #getNature()
	 */
	public void setNature(String nature) {
		super.setByIndex(INDEX_NATURE, nature);
	}

	/**
	 * Returns the value of the '<em><b>Ledgerempid</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Ledgerempid</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Ledgerempid</em>' attribute.
	 * @see #setLedgerempid(java.lang.String)
	 */
	public String getLedgerempid() {
		return DataUtil.toString(super.getByIndex(INDEX_LEDGEREMPID, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getLedgerempid <em>Ledgerempid</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Ledgerempid</em>' attribute.
	 * @see #getLedgerempid()
	 */
	public void setLedgerempid(String ledgerempid) {
		super.setByIndex(INDEX_LEDGEREMPID, ledgerempid);
	}

	/**
	 * Returns the value of the '<em><b>Ledgerempname</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Ledgerempname</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Ledgerempname</em>' attribute.
	 * @see #setLedgerempname(java.lang.String)
	 */
	public String getLedgerempname() {
		return DataUtil.toString(super.getByIndex(INDEX_LEDGEREMPNAME, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getLedgerempname <em>Ledgerempname</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Ledgerempname</em>' attribute.
	 * @see #getLedgerempname()
	 */
	public void setLedgerempname(String ledgerempname) {
		super.setByIndex(INDEX_LEDGEREMPNAME, ledgerempname);
	}

	/**
	 * Returns the value of the '<em><b>Ledgerorgid</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Ledgerorgid</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Ledgerorgid</em>' attribute.
	 * @see #setLedgerorgid(java.lang.String)
	 */
	public String getLedgerorgid() {
		return DataUtil.toString(super.getByIndex(INDEX_LEDGERORGID, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getLedgerorgid <em>Ledgerorgid</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Ledgerorgid</em>' attribute.
	 * @see #getLedgerorgid()
	 */
	public void setLedgerorgid(String ledgerorgid) {
		super.setByIndex(INDEX_LEDGERORGID, ledgerorgid);
	}

	/**
	 * Returns the value of the '<em><b>Ledgerorgname</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Ledgerorgname</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Ledgerorgname</em>' attribute.
	 * @see #setLedgerorgname(java.lang.String)
	 */
	public String getLedgerorgname() {
		return DataUtil.toString(super.getByIndex(INDEX_LEDGERORGNAME, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getLedgerorgname <em>Ledgerorgname</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Ledgerorgname</em>' attribute.
	 * @see #getLedgerorgname()
	 */
	public void setLedgerorgname(String ledgerorgname) {
		super.setByIndex(INDEX_LEDGERORGNAME, ledgerorgname);
	}

	/**
	 * Returns the value of the '<em><b>Positionname</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Positionname</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Positionname</em>' attribute.
	 * @see #setPositionname(java.lang.String)
	 */
	public String getPositionname() {
		return DataUtil.toString(super.getByIndex(INDEX_POSITIONNAME, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getPositionname <em>Positionname</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Positionname</em>' attribute.
	 * @see #getPositionname()
	 */
	public void setPositionname(String positionname) {
		super.setByIndex(INDEX_POSITIONNAME, positionname);
	}

	/**
	 * Returns the value of the '<em><b>Mentor</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Mentor</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Mentor</em>' attribute.
	 * @see #setMentor(java.lang.String)
	 */
	public String getMentor() {
		return DataUtil.toString(super.getByIndex(INDEX_MENTOR, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getMentor <em>Mentor</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Mentor</em>' attribute.
	 * @see #getMentor()
	 */
	public void setMentor(String mentor) {
		super.setByIndex(INDEX_MENTOR, mentor);
	}

	/**
	 * Returns the value of the '<em><b>Pcfamount</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Pcfamount</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Pcfamount</em>' attribute.
	 * @see #setPcfamount(java.math.BigDecimal)
	 */
	public BigDecimal getPcfamount() {
		return DataUtil.toBigDecimal(super.getByIndex(INDEX_PCFAMOUNT, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getPcfamount <em>Pcfamount</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Pcfamount</em>' attribute.
	 * @see #getPcfamount()
	 */
	public void setPcfamount(BigDecimal pcfamount) {
		super.setByIndex(INDEX_PCFAMOUNT, pcfamount);
	}

	/**
	 * Returns the value of the '<em><b>Istakepc</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Istakepc</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Istakepc</em>' attribute.
	 * @see #setIstakepc(java.lang.String)
	 */
	public String getIstakepc() {
		return DataUtil.toString(super.getByIndex(INDEX_ISTAKEPC, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getIstakepc <em>Istakepc</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Istakepc</em>' attribute.
	 * @see #getIstakepc()
	 */
	public void setIstakepc(String istakepc) {
		super.setByIndex(INDEX_ISTAKEPC, istakepc);
	}

	/**
	 * Returns the value of the '<em><b>Takepcdate</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Takepcdate</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Takepcdate</em>' attribute.
	 * @see #setTakepcdate(java.util.Date)
	 */
	public Date getTakepcdate() {
		return DataUtil.toDate(super.getByIndex(INDEX_TAKEPCDATE, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getTakepcdate <em>Takepcdate</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Takepcdate</em>' attribute.
	 * @see #getTakepcdate()
	 */
	public void setTakepcdate(Date takepcdate) {
		super.setByIndex(INDEX_TAKEPCDATE, takepcdate);
	}

	/**
	 * Returns the value of the '<em><b>Eduverify</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Eduverify</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Eduverify</em>' attribute.
	 * @see #setEduverify(java.lang.String)
	 */
	public String getEduverify() {
		return DataUtil.toString(super.getByIndex(INDEX_EDUVERIFY, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getEduverify <em>Eduverify</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Eduverify</em>' attribute.
	 * @see #getEduverify()
	 */
	public void setEduverify(String eduverify) {
		super.setByIndex(INDEX_EDUVERIFY, eduverify);
	}

	/**
	 * Returns the value of the '<em><b>Takepcenddate</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Takepcenddate</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Takepcenddate</em>' attribute.
	 * @see #setTakepcenddate(java.util.Date)
	 */
	public Date getTakepcenddate() {
		return DataUtil.toDate(super.getByIndex(INDEX_TAKEPCENDDATE, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getTakepcenddate <em>Takepcenddate</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Takepcenddate</em>' attribute.
	 * @see #getTakepcenddate()
	 */
	public void setTakepcenddate(Date takepcenddate) {
		super.setByIndex(INDEX_TAKEPCENDDATE, takepcenddate);
	}

	/**
	 * Returns the value of the '<em><b>Pcfstartdate</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Pcfstartdate</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Pcfstartdate</em>' attribute.
	 * @see #setPcfstartdate(java.util.Date)
	 */
	public Date getPcfstartdate() {
		return DataUtil.toDate(super.getByIndex(INDEX_PCFSTARTDATE, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getPcfstartdate <em>Pcfstartdate</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Pcfstartdate</em>' attribute.
	 * @see #getPcfstartdate()
	 */
	public void setPcfstartdate(Date pcfstartdate) {
		super.setByIndex(INDEX_PCFSTARTDATE, pcfstartdate);
	}

	/**
	 * Returns the value of the '<em><b>Pcfenddate</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Pcfenddate</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Pcfenddate</em>' attribute.
	 * @see #setPcfenddate(java.util.Date)
	 */
	public Date getPcfenddate() {
		return DataUtil.toDate(super.getByIndex(INDEX_PCFENDDATE, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getPcfenddate <em>Pcfenddate</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Pcfenddate</em>' attribute.
	 * @see #getPcfenddate()
	 */
	public void setPcfenddate(Date pcfenddate) {
		super.setByIndex(INDEX_PCFENDDATE, pcfenddate);
	}

	/**
	 * Returns the value of the '<em><b>Positioncall</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Positioncall</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Positioncall</em>' attribute.
	 * @see #setPositioncall(java.lang.String)
	 */
	public String getPositioncall() {
		return DataUtil.toString(super.getByIndex(INDEX_POSITIONCALL, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getPositioncall <em>Positioncall</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Positioncall</em>' attribute.
	 * @see #getPositioncall()
	 */
	public void setPositioncall(String positioncall) {
		super.setByIndex(INDEX_POSITIONCALL, positioncall);
	}

	/**
	 * Returns the value of the '<em><b>Compmstartday</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Compmstartday</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Compmstartday</em>' attribute.
	 * @see #setCompmstartday(java.util.Date)
	 */
	public Date getCompmstartday() {
		return DataUtil.toDate(super.getByIndex(INDEX_COMPMSTARTDAY, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getCompmstartday <em>Compmstartday</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Compmstartday</em>' attribute.
	 * @see #getCompmstartday()
	 */
	public void setCompmstartday(Date compmstartday) {
		super.setByIndex(INDEX_COMPMSTARTDAY, compmstartday);
	}

	/**
	 * Returns the value of the '<em><b>Tag</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Tag</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Tag</em>' attribute.
	 * @see #setTag(java.lang.String)
	 */
	public String getTag() {
		return DataUtil.toString(super.getByIndex(INDEX_TAG, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getTag <em>Tag</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Tag</em>' attribute.
	 * @see #getTag()
	 */
	public void setTag(String tag) {
		super.setByIndex(INDEX_TAG, tag);
	}

	/**
	 * Returns the value of the '<em><b>Funofficial</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Funofficial</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Funofficial</em>' attribute.
	 * @see #setFunofficial(java.lang.String)
	 */
	public String getFunofficial() {
		return DataUtil.toString(super.getByIndex(INDEX_FUNOFFICIAL, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getFunofficial <em>Funofficial</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Funofficial</em>' attribute.
	 * @see #getFunofficial()
	 */
	public void setFunofficial(String funofficial) {
		super.setByIndex(INDEX_FUNOFFICIAL, funofficial);
	}


}