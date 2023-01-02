/*******************************************************************************
 *
 * Copyright (c) 2001-2006 Primeton Technologies, Ltd.
 * All rights reserved.
 *
 * Created on Apr 11, 2008
 *******************************************************************************/
package com.primeton.ame.schindler.org;

import com.eos.data.sdo.IObjectFactory;

import commonj.sdo.DataObject;
import commonj.sdo.Type;
import commonj.sdo.helper.DataFactory;
import commonj.sdo.helper.TypeHelper;

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
 *   <li>{@link com.primeton.ame.schindler.org.OmEmployee#getEmpid <em>Empid</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.OmEmployee#getEmpcode <em>Empcode</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.OmEmployee#getOperatorid <em>Operatorid</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.OmEmployee#getUserid <em>Userid</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.OmEmployee#getEmpname <em>Empname</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.OmEmployee#getRealname <em>Realname</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.OmEmployee#getGender <em>Gender</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.OmEmployee#getBirthdate <em>Birthdate</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.OmEmployee#getPosition <em>Position</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.OmEmployee#getEmpstatus <em>Empstatus</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.OmEmployee#getCardtype <em>Cardtype</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.OmEmployee#getCardno <em>Cardno</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.OmEmployee#getIndate <em>Indate</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.OmEmployee#getOutdate <em>Outdate</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.OmEmployee#getOtel <em>Otel</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.OmEmployee#getOaddress <em>Oaddress</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.OmEmployee#getOzipcode <em>Ozipcode</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.OmEmployee#getOemail <em>Oemail</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.OmEmployee#getFaxno <em>Faxno</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.OmEmployee#getMobileno <em>Mobileno</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.OmEmployee#getMsn <em>Msn</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.OmEmployee#getHtel <em>Htel</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.OmEmployee#getHaddress <em>Haddress</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.OmEmployee#getHzipcode <em>Hzipcode</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.OmEmployee#getPemail <em>Pemail</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.OmEmployee#getParty <em>Party</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.OmEmployee#getDegree <em>Degree</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.OmEmployee#getMajor <em>Major</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.OmEmployee#getSpecialty <em>Specialty</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.OmEmployee#getWorkexp <em>Workexp</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.OmEmployee#getRegdate <em>Regdate</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.OmEmployee#getCreatetime <em>Createtime</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.OmEmployee#getLastmodytime <em>Lastmodytime</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.OmEmployee#getOrgidlist <em>Orgidlist</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.OmEmployee#getOrgid <em>Orgid</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.OmEmployee#getRemark <em>Remark</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.OmEmployee#getBankname <em>Bankname</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.OmEmployee#getBankacct <em>Bankacct</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.OmEmployee#getNation <em>Nation</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.OmEmployee#getBirthplace <em>Birthplace</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.OmEmployee#getResidence <em>Residence</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.OmEmployee#getLiveplace <em>Liveplace</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.OmEmployee#getEmergency <em>Emergency</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.OmEmployee#getEmerelation <em>Emerelation</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.OmEmployee#getEmelink <em>Emelink</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.OmEmployee#getSocialstart <em>Socialstart</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.OmEmployee#getEmptype <em>Emptype</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.OmEmployee#getWorkplace <em>Workplace</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.OmEmployee#getWelfareplace <em>Welfareplace</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.OmEmployee#getRecruitsour <em>Recruitsour</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.OmEmployee#getInnerrec <em>Innerrec</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.OmEmployee#getRecruitoper <em>Recruitoper</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.OmEmployee#getOuttype <em>Outtype</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.OmEmployee#getOutreason <em>Outreason</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.OmEmployee#getOutto <em>Outto</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.OmEmployee#getOutmakeup <em>Outmakeup</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.OmEmployee#getOutmemo <em>Outmemo</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.OmEmployee#getHighestindate <em>Highestindate</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.OmEmployee#getHighestlen <em>Highestlen</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.OmEmployee#getHighestoutdate <em>Highestoutdate</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.OmEmployee#getResiproperty <em>Resiproperty</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.OmEmployee#getFilesaveorg <em>Filesaveorg</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.OmEmployee#getFilecity <em>Filecity</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.OmEmployee#getFileaddress <em>Fileaddress</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.OmEmployee#getIshaveresi <em>Ishaveresi</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.OmEmployee#getResilimit <em>Resilimit</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.OmEmployee#getResidealorg <em>Residealorg</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.OmEmployee#getResistartdate <em>Resistartdate</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.OmEmployee#getResienddate <em>Resienddate</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.OmEmployee#getMarristatus <em>Marristatus</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.OmEmployee#getFundno <em>Fundno</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.OmEmployee#getAddfundno <em>Addfundno</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.OmEmployee#getNonagename <em>Nonagename</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.OmEmployee#getNonagesex <em>Nonagesex</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.OmEmployee#getNonagebirth <em>Nonagebirth</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.OmEmployee#getIsjoinpcf <em>Isjoinpcf</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.OmEmployee#getResiaddress <em>Resiaddress</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.OmEmployee#getSpousestate <em>Spousestate</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.OmEmployee#getSpousename <em>Spousename</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.OmEmployee#getSpousecardno <em>Spousecardno</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.OmEmployee#getCompany <em>Company</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.OmEmployee#getSpousecardtype <em>Spousecardtype</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.OmEmployee#getJoblevel <em>Joblevel</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.OmEmployee#getNature <em>Nature</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.OmEmployee#getLedgerempid <em>Ledgerempid</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.OmEmployee#getLedgerempname <em>Ledgerempname</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.OmEmployee#getLedgerorgid <em>Ledgerorgid</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.OmEmployee#getLedgerorgname <em>Ledgerorgname</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.OmEmployee#getPositionname <em>Positionname</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.OmEmployee#getMentor <em>Mentor</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.OmEmployee#getPcfamount <em>Pcfamount</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.OmEmployee#getIstakepc <em>Istakepc</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.OmEmployee#getTakepcdate <em>Takepcdate</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.OmEmployee#getEduverify <em>Eduverify</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.OmEmployee#getTakepcenddate <em>Takepcenddate</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.OmEmployee#getPcfstartdate <em>Pcfstartdate</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.OmEmployee#getPcfenddate <em>Pcfenddate</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.OmEmployee#getPositioncall <em>Positioncall</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.OmEmployee#getCompmstartday <em>Compmstartday</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.OmEmployee#getTag <em>Tag</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.OmEmployee#getFunofficial <em>Funofficial</em>}</li>
 * </ul>
 * </p>
 *
 * @extends DataObject;
 */
public interface OmEmployee extends DataObject {

	public static final String QNAME = "com.primeton.ame.schindler.org.OmEmployee";

	public static final Type TYPE = TypeHelper.INSTANCE.getType("com.primeton.ame.schindler.org", "OmEmployee");

	public static final IObjectFactory<OmEmployee> FACTORY = new IObjectFactory<OmEmployee>() {
		public OmEmployee create() {
			return (OmEmployee) DataFactory.INSTANCE.create(TYPE);
		}
	};

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
	public BigDecimal getEmpid();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.OmEmployee#getEmpid <em>Empid</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Empid</em>' attribute.
	 * @see #getEmpid()
	 */
	public void setEmpid(BigDecimal empid);

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
	public String getEmpcode();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.OmEmployee#getEmpcode <em>Empcode</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Empcode</em>' attribute.
	 * @see #getEmpcode()
	 */
	public void setEmpcode(String empcode);

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
	public BigDecimal getOperatorid();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.OmEmployee#getOperatorid <em>Operatorid</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Operatorid</em>' attribute.
	 * @see #getOperatorid()
	 */
	public void setOperatorid(BigDecimal operatorid);

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
	public String getUserid();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.OmEmployee#getUserid <em>Userid</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Userid</em>' attribute.
	 * @see #getUserid()
	 */
	public void setUserid(String userid);

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
	public String getEmpname();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.OmEmployee#getEmpname <em>Empname</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Empname</em>' attribute.
	 * @see #getEmpname()
	 */
	public void setEmpname(String empname);

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
	public String getRealname();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.OmEmployee#getRealname <em>Realname</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Realname</em>' attribute.
	 * @see #getRealname()
	 */
	public void setRealname(String realname);

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
	public String getGender();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.OmEmployee#getGender <em>Gender</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Gender</em>' attribute.
	 * @see #getGender()
	 */
	public void setGender(String gender);

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
	public Date getBirthdate();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.OmEmployee#getBirthdate <em>Birthdate</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Birthdate</em>' attribute.
	 * @see #getBirthdate()
	 */
	public void setBirthdate(Date birthdate);

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
	public BigDecimal getPosition();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.OmEmployee#getPosition <em>Position</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Position</em>' attribute.
	 * @see #getPosition()
	 */
	public void setPosition(BigDecimal position);

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
	public String getEmpstatus();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.OmEmployee#getEmpstatus <em>Empstatus</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Empstatus</em>' attribute.
	 * @see #getEmpstatus()
	 */
	public void setEmpstatus(String empstatus);

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
	public String getCardtype();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.OmEmployee#getCardtype <em>Cardtype</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Cardtype</em>' attribute.
	 * @see #getCardtype()
	 */
	public void setCardtype(String cardtype);

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
	public String getCardno();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.OmEmployee#getCardno <em>Cardno</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Cardno</em>' attribute.
	 * @see #getCardno()
	 */
	public void setCardno(String cardno);

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
	public Date getIndate();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.OmEmployee#getIndate <em>Indate</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Indate</em>' attribute.
	 * @see #getIndate()
	 */
	public void setIndate(Date indate);

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
	public Date getOutdate();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.OmEmployee#getOutdate <em>Outdate</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Outdate</em>' attribute.
	 * @see #getOutdate()
	 */
	public void setOutdate(Date outdate);

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
	public String getOtel();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.OmEmployee#getOtel <em>Otel</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Otel</em>' attribute.
	 * @see #getOtel()
	 */
	public void setOtel(String otel);

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
	public String getOaddress();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.OmEmployee#getOaddress <em>Oaddress</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Oaddress</em>' attribute.
	 * @see #getOaddress()
	 */
	public void setOaddress(String oaddress);

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
	public String getOzipcode();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.OmEmployee#getOzipcode <em>Ozipcode</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Ozipcode</em>' attribute.
	 * @see #getOzipcode()
	 */
	public void setOzipcode(String ozipcode);

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
	public String getOemail();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.OmEmployee#getOemail <em>Oemail</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Oemail</em>' attribute.
	 * @see #getOemail()
	 */
	public void setOemail(String oemail);

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
	public String getFaxno();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.OmEmployee#getFaxno <em>Faxno</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Faxno</em>' attribute.
	 * @see #getFaxno()
	 */
	public void setFaxno(String faxno);

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
	public String getMobileno();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.OmEmployee#getMobileno <em>Mobileno</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Mobileno</em>' attribute.
	 * @see #getMobileno()
	 */
	public void setMobileno(String mobileno);

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
	public String getMsn();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.OmEmployee#getMsn <em>Msn</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Msn</em>' attribute.
	 * @see #getMsn()
	 */
	public void setMsn(String msn);

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
	public String getHtel();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.OmEmployee#getHtel <em>Htel</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Htel</em>' attribute.
	 * @see #getHtel()
	 */
	public void setHtel(String htel);

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
	public String getHaddress();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.OmEmployee#getHaddress <em>Haddress</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Haddress</em>' attribute.
	 * @see #getHaddress()
	 */
	public void setHaddress(String haddress);

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
	public String getHzipcode();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.OmEmployee#getHzipcode <em>Hzipcode</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Hzipcode</em>' attribute.
	 * @see #getHzipcode()
	 */
	public void setHzipcode(String hzipcode);

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
	public String getPemail();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.OmEmployee#getPemail <em>Pemail</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Pemail</em>' attribute.
	 * @see #getPemail()
	 */
	public void setPemail(String pemail);

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
	public String getParty();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.OmEmployee#getParty <em>Party</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Party</em>' attribute.
	 * @see #getParty()
	 */
	public void setParty(String party);

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
	public String getDegree();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.OmEmployee#getDegree <em>Degree</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Degree</em>' attribute.
	 * @see #getDegree()
	 */
	public void setDegree(String degree);

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
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.OmEmployee#getMajor <em>Major</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Major</em>' attribute.
	 * @see #getMajor()
	 */
	public void setMajor(String major);

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
	public String getSpecialty();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.OmEmployee#getSpecialty <em>Specialty</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Specialty</em>' attribute.
	 * @see #getSpecialty()
	 */
	public void setSpecialty(String specialty);

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
	public String getWorkexp();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.OmEmployee#getWorkexp <em>Workexp</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Workexp</em>' attribute.
	 * @see #getWorkexp()
	 */
	public void setWorkexp(String workexp);

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
	public Date getRegdate();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.OmEmployee#getRegdate <em>Regdate</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Regdate</em>' attribute.
	 * @see #getRegdate()
	 */
	public void setRegdate(Date regdate);

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
	public Date getCreatetime();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.OmEmployee#getCreatetime <em>Createtime</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Createtime</em>' attribute.
	 * @see #getCreatetime()
	 */
	public void setCreatetime(Date createtime);

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
	public Date getLastmodytime();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.OmEmployee#getLastmodytime <em>Lastmodytime</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Lastmodytime</em>' attribute.
	 * @see #getLastmodytime()
	 */
	public void setLastmodytime(Date lastmodytime);

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
	public String getOrgidlist();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.OmEmployee#getOrgidlist <em>Orgidlist</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Orgidlist</em>' attribute.
	 * @see #getOrgidlist()
	 */
	public void setOrgidlist(String orgidlist);

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
	public BigDecimal getOrgid();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.OmEmployee#getOrgid <em>Orgid</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Orgid</em>' attribute.
	 * @see #getOrgid()
	 */
	public void setOrgid(BigDecimal orgid);

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
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.OmEmployee#getRemark <em>Remark</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Remark</em>' attribute.
	 * @see #getRemark()
	 */
	public void setRemark(String remark);

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
	public String getBankname();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.OmEmployee#getBankname <em>Bankname</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Bankname</em>' attribute.
	 * @see #getBankname()
	 */
	public void setBankname(String bankname);

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
	public String getBankacct();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.OmEmployee#getBankacct <em>Bankacct</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Bankacct</em>' attribute.
	 * @see #getBankacct()
	 */
	public void setBankacct(String bankacct);

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
	public String getNation();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.OmEmployee#getNation <em>Nation</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Nation</em>' attribute.
	 * @see #getNation()
	 */
	public void setNation(String nation);

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
	public String getBirthplace();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.OmEmployee#getBirthplace <em>Birthplace</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Birthplace</em>' attribute.
	 * @see #getBirthplace()
	 */
	public void setBirthplace(String birthplace);

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
	public String getResidence();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.OmEmployee#getResidence <em>Residence</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Residence</em>' attribute.
	 * @see #getResidence()
	 */
	public void setResidence(String residence);

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
	public String getLiveplace();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.OmEmployee#getLiveplace <em>Liveplace</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Liveplace</em>' attribute.
	 * @see #getLiveplace()
	 */
	public void setLiveplace(String liveplace);

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
	public String getEmergency();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.OmEmployee#getEmergency <em>Emergency</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Emergency</em>' attribute.
	 * @see #getEmergency()
	 */
	public void setEmergency(String emergency);

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
	public String getEmerelation();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.OmEmployee#getEmerelation <em>Emerelation</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Emerelation</em>' attribute.
	 * @see #getEmerelation()
	 */
	public void setEmerelation(String emerelation);

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
	public String getEmelink();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.OmEmployee#getEmelink <em>Emelink</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Emelink</em>' attribute.
	 * @see #getEmelink()
	 */
	public void setEmelink(String emelink);

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
	public Date getSocialstart();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.OmEmployee#getSocialstart <em>Socialstart</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Socialstart</em>' attribute.
	 * @see #getSocialstart()
	 */
	public void setSocialstart(Date socialstart);

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
	public String getEmptype();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.OmEmployee#getEmptype <em>Emptype</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Emptype</em>' attribute.
	 * @see #getEmptype()
	 */
	public void setEmptype(String emptype);

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
	public String getWorkplace();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.OmEmployee#getWorkplace <em>Workplace</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Workplace</em>' attribute.
	 * @see #getWorkplace()
	 */
	public void setWorkplace(String workplace);

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
	public String getWelfareplace();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.OmEmployee#getWelfareplace <em>Welfareplace</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Welfareplace</em>' attribute.
	 * @see #getWelfareplace()
	 */
	public void setWelfareplace(String welfareplace);

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
	public String getRecruitsour();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.OmEmployee#getRecruitsour <em>Recruitsour</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Recruitsour</em>' attribute.
	 * @see #getRecruitsour()
	 */
	public void setRecruitsour(String recruitsour);

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
	public String getInnerrec();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.OmEmployee#getInnerrec <em>Innerrec</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Innerrec</em>' attribute.
	 * @see #getInnerrec()
	 */
	public void setInnerrec(String innerrec);

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
	public String getRecruitoper();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.OmEmployee#getRecruitoper <em>Recruitoper</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Recruitoper</em>' attribute.
	 * @see #getRecruitoper()
	 */
	public void setRecruitoper(String recruitoper);

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
	public String getOuttype();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.OmEmployee#getOuttype <em>Outtype</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Outtype</em>' attribute.
	 * @see #getOuttype()
	 */
	public void setOuttype(String outtype);

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
	public String getOutreason();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.OmEmployee#getOutreason <em>Outreason</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Outreason</em>' attribute.
	 * @see #getOutreason()
	 */
	public void setOutreason(String outreason);

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
	public String getOutto();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.OmEmployee#getOutto <em>Outto</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Outto</em>' attribute.
	 * @see #getOutto()
	 */
	public void setOutto(String outto);

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
	public String getOutmakeup();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.OmEmployee#getOutmakeup <em>Outmakeup</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Outmakeup</em>' attribute.
	 * @see #getOutmakeup()
	 */
	public void setOutmakeup(String outmakeup);

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
	public String getOutmemo();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.OmEmployee#getOutmemo <em>Outmemo</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Outmemo</em>' attribute.
	 * @see #getOutmemo()
	 */
	public void setOutmemo(String outmemo);

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
	public Date getHighestindate();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.OmEmployee#getHighestindate <em>Highestindate</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Highestindate</em>' attribute.
	 * @see #getHighestindate()
	 */
	public void setHighestindate(Date highestindate);

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
	public String getHighestlen();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.OmEmployee#getHighestlen <em>Highestlen</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Highestlen</em>' attribute.
	 * @see #getHighestlen()
	 */
	public void setHighestlen(String highestlen);

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
	public Date getHighestoutdate();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.OmEmployee#getHighestoutdate <em>Highestoutdate</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Highestoutdate</em>' attribute.
	 * @see #getHighestoutdate()
	 */
	public void setHighestoutdate(Date highestoutdate);

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
	public String getResiproperty();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.OmEmployee#getResiproperty <em>Resiproperty</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Resiproperty</em>' attribute.
	 * @see #getResiproperty()
	 */
	public void setResiproperty(String resiproperty);

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
	public String getFilesaveorg();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.OmEmployee#getFilesaveorg <em>Filesaveorg</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Filesaveorg</em>' attribute.
	 * @see #getFilesaveorg()
	 */
	public void setFilesaveorg(String filesaveorg);

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
	public String getFilecity();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.OmEmployee#getFilecity <em>Filecity</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Filecity</em>' attribute.
	 * @see #getFilecity()
	 */
	public void setFilecity(String filecity);

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
	public String getFileaddress();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.OmEmployee#getFileaddress <em>Fileaddress</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Fileaddress</em>' attribute.
	 * @see #getFileaddress()
	 */
	public void setFileaddress(String fileaddress);

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
	public String getIshaveresi();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.OmEmployee#getIshaveresi <em>Ishaveresi</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Ishaveresi</em>' attribute.
	 * @see #getIshaveresi()
	 */
	public void setIshaveresi(String ishaveresi);

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
	public int getResilimit();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.OmEmployee#getResilimit <em>Resilimit</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Resilimit</em>' attribute.
	 * @see #getResilimit()
	 */
	public void setResilimit(int resilimit);

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
	public String getResidealorg();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.OmEmployee#getResidealorg <em>Residealorg</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Residealorg</em>' attribute.
	 * @see #getResidealorg()
	 */
	public void setResidealorg(String residealorg);

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
	public Date getResistartdate();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.OmEmployee#getResistartdate <em>Resistartdate</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Resistartdate</em>' attribute.
	 * @see #getResistartdate()
	 */
	public void setResistartdate(Date resistartdate);

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
	public Date getResienddate();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.OmEmployee#getResienddate <em>Resienddate</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Resienddate</em>' attribute.
	 * @see #getResienddate()
	 */
	public void setResienddate(Date resienddate);

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
	public String getMarristatus();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.OmEmployee#getMarristatus <em>Marristatus</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Marristatus</em>' attribute.
	 * @see #getMarristatus()
	 */
	public void setMarristatus(String marristatus);

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
	public String getFundno();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.OmEmployee#getFundno <em>Fundno</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Fundno</em>' attribute.
	 * @see #getFundno()
	 */
	public void setFundno(String fundno);

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
	public String getAddfundno();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.OmEmployee#getAddfundno <em>Addfundno</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Addfundno</em>' attribute.
	 * @see #getAddfundno()
	 */
	public void setAddfundno(String addfundno);

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
	public String getNonagename();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.OmEmployee#getNonagename <em>Nonagename</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Nonagename</em>' attribute.
	 * @see #getNonagename()
	 */
	public void setNonagename(String nonagename);

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
	public String getNonagesex();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.OmEmployee#getNonagesex <em>Nonagesex</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Nonagesex</em>' attribute.
	 * @see #getNonagesex()
	 */
	public void setNonagesex(String nonagesex);

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
	public Date getNonagebirth();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.OmEmployee#getNonagebirth <em>Nonagebirth</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Nonagebirth</em>' attribute.
	 * @see #getNonagebirth()
	 */
	public void setNonagebirth(Date nonagebirth);

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
	public String getIsjoinpcf();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.OmEmployee#getIsjoinpcf <em>Isjoinpcf</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Isjoinpcf</em>' attribute.
	 * @see #getIsjoinpcf()
	 */
	public void setIsjoinpcf(String isjoinpcf);

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
	public String getResiaddress();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.OmEmployee#getResiaddress <em>Resiaddress</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Resiaddress</em>' attribute.
	 * @see #getResiaddress()
	 */
	public void setResiaddress(String resiaddress);

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
	public String getSpousestate();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.OmEmployee#getSpousestate <em>Spousestate</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Spousestate</em>' attribute.
	 * @see #getSpousestate()
	 */
	public void setSpousestate(String spousestate);

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
	public String getSpousename();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.OmEmployee#getSpousename <em>Spousename</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Spousename</em>' attribute.
	 * @see #getSpousename()
	 */
	public void setSpousename(String spousename);

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
	public String getSpousecardno();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.OmEmployee#getSpousecardno <em>Spousecardno</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Spousecardno</em>' attribute.
	 * @see #getSpousecardno()
	 */
	public void setSpousecardno(String spousecardno);

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
	public String getCompany();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.OmEmployee#getCompany <em>Company</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Company</em>' attribute.
	 * @see #getCompany()
	 */
	public void setCompany(String company);

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
	public String getSpousecardtype();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.OmEmployee#getSpousecardtype <em>Spousecardtype</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Spousecardtype</em>' attribute.
	 * @see #getSpousecardtype()
	 */
	public void setSpousecardtype(String spousecardtype);

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
	public String getJoblevel();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.OmEmployee#getJoblevel <em>Joblevel</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Joblevel</em>' attribute.
	 * @see #getJoblevel()
	 */
	public void setJoblevel(String joblevel);

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
	public String getNature();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.OmEmployee#getNature <em>Nature</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Nature</em>' attribute.
	 * @see #getNature()
	 */
	public void setNature(String nature);

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
	public String getLedgerempid();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.OmEmployee#getLedgerempid <em>Ledgerempid</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Ledgerempid</em>' attribute.
	 * @see #getLedgerempid()
	 */
	public void setLedgerempid(String ledgerempid);

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
	public String getLedgerempname();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.OmEmployee#getLedgerempname <em>Ledgerempname</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Ledgerempname</em>' attribute.
	 * @see #getLedgerempname()
	 */
	public void setLedgerempname(String ledgerempname);

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
	public String getLedgerorgid();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.OmEmployee#getLedgerorgid <em>Ledgerorgid</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Ledgerorgid</em>' attribute.
	 * @see #getLedgerorgid()
	 */
	public void setLedgerorgid(String ledgerorgid);

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
	public String getLedgerorgname();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.OmEmployee#getLedgerorgname <em>Ledgerorgname</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Ledgerorgname</em>' attribute.
	 * @see #getLedgerorgname()
	 */
	public void setLedgerorgname(String ledgerorgname);

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
	public String getPositionname();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.OmEmployee#getPositionname <em>Positionname</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Positionname</em>' attribute.
	 * @see #getPositionname()
	 */
	public void setPositionname(String positionname);

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
	public String getMentor();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.OmEmployee#getMentor <em>Mentor</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Mentor</em>' attribute.
	 * @see #getMentor()
	 */
	public void setMentor(String mentor);

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
	public BigDecimal getPcfamount();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.OmEmployee#getPcfamount <em>Pcfamount</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Pcfamount</em>' attribute.
	 * @see #getPcfamount()
	 */
	public void setPcfamount(BigDecimal pcfamount);

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
	public String getIstakepc();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.OmEmployee#getIstakepc <em>Istakepc</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Istakepc</em>' attribute.
	 * @see #getIstakepc()
	 */
	public void setIstakepc(String istakepc);

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
	public Date getTakepcdate();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.OmEmployee#getTakepcdate <em>Takepcdate</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Takepcdate</em>' attribute.
	 * @see #getTakepcdate()
	 */
	public void setTakepcdate(Date takepcdate);

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
	public String getEduverify();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.OmEmployee#getEduverify <em>Eduverify</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Eduverify</em>' attribute.
	 * @see #getEduverify()
	 */
	public void setEduverify(String eduverify);

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
	public Date getTakepcenddate();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.OmEmployee#getTakepcenddate <em>Takepcenddate</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Takepcenddate</em>' attribute.
	 * @see #getTakepcenddate()
	 */
	public void setTakepcenddate(Date takepcenddate);

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
	public Date getPcfstartdate();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.OmEmployee#getPcfstartdate <em>Pcfstartdate</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Pcfstartdate</em>' attribute.
	 * @see #getPcfstartdate()
	 */
	public void setPcfstartdate(Date pcfstartdate);

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
	public Date getPcfenddate();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.OmEmployee#getPcfenddate <em>Pcfenddate</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Pcfenddate</em>' attribute.
	 * @see #getPcfenddate()
	 */
	public void setPcfenddate(Date pcfenddate);

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
	public String getPositioncall();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.OmEmployee#getPositioncall <em>Positioncall</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Positioncall</em>' attribute.
	 * @see #getPositioncall()
	 */
	public void setPositioncall(String positioncall);

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
	public Date getCompmstartday();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.OmEmployee#getCompmstartday <em>Compmstartday</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Compmstartday</em>' attribute.
	 * @see #getCompmstartday()
	 */
	public void setCompmstartday(Date compmstartday);

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
	public String getTag();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.OmEmployee#getTag <em>Tag</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Tag</em>' attribute.
	 * @see #getTag()
	 */
	public void setTag(String tag);

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
	public String getFunofficial();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.OmEmployee#getFunofficial <em>Funofficial</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Funofficial</em>' attribute.
	 * @see #getFunofficial()
	 */
	public void setFunofficial(String funofficial);


}