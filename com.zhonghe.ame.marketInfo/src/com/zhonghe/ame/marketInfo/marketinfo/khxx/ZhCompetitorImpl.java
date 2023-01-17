/*******************************************************************************
 *
 * Copyright (c) 2001-2006 Primeton Technologies, Ltd.
 * All rights reserved.
 *
 * Created on Apr 11, 2008
 *******************************************************************************/
package com.zhonghe.ame.marketInfo.marketinfo.khxx;

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
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.impl.ZhCompetitorImpl#getCustid <em>Custid</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.impl.ZhCompetitorImpl#getCustname <em>Custname</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.impl.ZhCompetitorImpl#getCustnum <em>Custnum</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.impl.ZhCompetitorImpl#getCusttype <em>Custtype</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.impl.ZhCompetitorImpl#getIsoem <em>Isoem</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.impl.ZhCompetitorImpl#getAddress <em>Address</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.impl.ZhCompetitorImpl#getPostcode <em>Postcode</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.impl.ZhCompetitorImpl#getTelephone <em>Telephone</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.impl.ZhCompetitorImpl#getFax <em>Fax</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.impl.ZhCompetitorImpl#getWebsite <em>Website</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.impl.ZhCompetitorImpl#getGrade <em>Grade</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.impl.ZhCompetitorImpl#getComments <em>Comments</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.impl.ZhCompetitorImpl#getCreateDate <em>CreateDate</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.impl.ZhCompetitorImpl#getCreateUserid <em>CreateUserid</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.impl.ZhCompetitorImpl#getCustmanager <em>Custmanager</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.impl.ZhCompetitorImpl#getAccoutbank <em>Accoutbank</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.impl.ZhCompetitorImpl#getAccoutname <em>Accoutname</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.impl.ZhCompetitorImpl#getTaxnumb <em>Taxnumb</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.impl.ZhCompetitorImpl#getAccountid <em>Accountid</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.impl.ZhCompetitorImpl#getStatus <em>Status</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.impl.ZhCompetitorImpl#getCustnature <em>Custnature</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.impl.ZhCompetitorImpl#getLicense <em>License</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.impl.ZhCompetitorImpl#getLicenseenddate <em>Licenseenddate</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.impl.ZhCompetitorImpl#getLegalperson <em>Legalperson</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.impl.ZhCompetitorImpl#getOrgnum <em>Orgnum</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.impl.ZhCompetitorImpl#getRegistercap <em>Registercap</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.impl.ZhCompetitorImpl#getServphone <em>Servphone</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.impl.ZhCompetitorImpl#getCompnum <em>Compnum</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.impl.ZhCompetitorImpl#getServnum <em>Servnum</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.impl.ZhCompetitorImpl#getBusiscope <em>Busiscope</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.impl.ZhCompetitorImpl#getSuborg <em>Suborg</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.impl.ZhCompetitorImpl#getCompdesc <em>Compdesc</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.impl.ZhCompetitorImpl#getThreeago <em>Threeago</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.impl.ZhCompetitorImpl#getThreeagoincome <em>Threeagoincome</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.impl.ZhCompetitorImpl#getThreeagoprofit <em>Threeagoprofit</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.impl.ZhCompetitorImpl#getTwoago <em>Twoago</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.impl.ZhCompetitorImpl#getTwoagoincome <em>Twoagoincome</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.impl.ZhCompetitorImpl#getTwoagoprofit <em>Twoagoprofit</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.impl.ZhCompetitorImpl#getLastyear <em>Lastyear</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.impl.ZhCompetitorImpl#getLastyearincome <em>Lastyearincome</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.impl.ZhCompetitorImpl#getLastyearprofit <em>Lastyearprofit</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.impl.ZhCompetitorImpl#getLastproperty <em>Lastproperty</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.impl.ZhCompetitorImpl#getLastpropertynet <em>Lastpropertynet</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.impl.ZhCompetitorImpl#getLastfloat <em>Lastfloat</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.impl.ZhCompetitorImpl#getLastlongdebt <em>Lastlongdebt</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.impl.ZhCompetitorImpl#getLastshortdebt <em>Lastshortdebt</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.impl.ZhCompetitorImpl#getLastnetprofit <em>Lastnetprofit</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.impl.ZhCompetitorImpl#getMainprod <em>Mainprod</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.impl.ZhCompetitorImpl#getAgentprod <em>Agentprod</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.impl.ZhCompetitorImpl#getQualify1 <em>Qualify1</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.impl.ZhCompetitorImpl#getQualify1exp <em>Qualify1exp</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.impl.ZhCompetitorImpl#getQualify2 <em>Qualify2</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.impl.ZhCompetitorImpl#getQualify2exp <em>Qualify2exp</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.impl.ZhCompetitorImpl#getQualify3 <em>Qualify3</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.impl.ZhCompetitorImpl#getQualify3exp <em>Qualify3exp</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.impl.ZhCompetitorImpl#getQualifycomm <em>Qualifycomm</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.impl.ZhCompetitorImpl#getIssupplier <em>Issupplier</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.impl.ZhCompetitorImpl#getCustjc <em>Custjc</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.impl.ZhCompetitorImpl#getGroupno <em>Groupno</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.impl.ZhCompetitorImpl#getLedgercustid <em>Ledgercustid</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.impl.ZhCompetitorImpl#getLedgercustname <em>Ledgercustname</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.impl.ZhCompetitorImpl#getEnglishName <em>EnglishName</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.impl.ZhCompetitorImpl#getContacts <em>Contacts</em>}</li>
 *   <li>{@link com.zhonghe.ame.marketInfo.myCreatedBid.impl.ZhCompetitorImpl#getCustomertype <em>Customertype</em>}</li>
 * </ul>
 * </p>
 *
 * @extends ExtendedDataObjectImpl;
 *
 * @implements ZhCompetitor;
 */

public class ZhCompetitorImpl extends ExtendedDataObjectImpl implements ZhCompetitor {
	/**
	 * Comment for <code>serialVersionUID</code>
	 */
	private static final long serialVersionUID = 1L;
	public final static int INDEX_CUSTID = 0;
	public final static int INDEX_CUSTNAME = 1;
	public final static int INDEX_CUSTNUM = 2;
	public final static int INDEX_CUSTTYPE = 3;
	public final static int INDEX_ISOEM = 4;
	public final static int INDEX_ADDRESS = 5;
	public final static int INDEX_POSTCODE = 6;
	public final static int INDEX_TELEPHONE = 7;
	public final static int INDEX_FAX = 8;
	public final static int INDEX_WEBSITE = 9;
	public final static int INDEX_GRADE = 10;
	public final static int INDEX_COMMENTS = 11;
	public final static int INDEX_CREATEDATE = 12;
	public final static int INDEX_CREATEUSERID = 13;
	public final static int INDEX_CUSTMANAGER = 14;
	public final static int INDEX_ACCOUTBANK = 15;
	public final static int INDEX_ACCOUTNAME = 16;
	public final static int INDEX_TAXNUMB = 17;
	public final static int INDEX_ACCOUNTID = 18;
	public final static int INDEX_STATUS = 19;
	public final static int INDEX_CUSTNATURE = 20;
	public final static int INDEX_LICENSE = 21;
	public final static int INDEX_LICENSEENDDATE = 22;
	public final static int INDEX_LEGALPERSON = 23;
	public final static int INDEX_ORGNUM = 24;
	public final static int INDEX_REGISTERCAP = 25;
	public final static int INDEX_SERVPHONE = 26;
	public final static int INDEX_COMPNUM = 27;
	public final static int INDEX_SERVNUM = 28;
	public final static int INDEX_BUSISCOPE = 29;
	public final static int INDEX_SUBORG = 30;
	public final static int INDEX_COMPDESC = 31;
	public final static int INDEX_THREEAGO = 32;
	public final static int INDEX_THREEAGOINCOME = 33;
	public final static int INDEX_THREEAGOPROFIT = 34;
	public final static int INDEX_TWOAGO = 35;
	public final static int INDEX_TWOAGOINCOME = 36;
	public final static int INDEX_TWOAGOPROFIT = 37;
	public final static int INDEX_LASTYEAR = 38;
	public final static int INDEX_LASTYEARINCOME = 39;
	public final static int INDEX_LASTYEARPROFIT = 40;
	public final static int INDEX_LASTPROPERTY = 41;
	public final static int INDEX_LASTPROPERTYNET = 42;
	public final static int INDEX_LASTFLOAT = 43;
	public final static int INDEX_LASTLONGDEBT = 44;
	public final static int INDEX_LASTSHORTDEBT = 45;
	public final static int INDEX_LASTNETPROFIT = 46;
	public final static int INDEX_MAINPROD = 47;
	public final static int INDEX_AGENTPROD = 48;
	public final static int INDEX_QUALIFY1 = 49;
	public final static int INDEX_QUALIFY1EXP = 50;
	public final static int INDEX_QUALIFY2 = 51;
	public final static int INDEX_QUALIFY2EXP = 52;
	public final static int INDEX_QUALIFY3 = 53;
	public final static int INDEX_QUALIFY3EXP = 54;
	public final static int INDEX_QUALIFYCOMM = 55;
	public final static int INDEX_ISSUPPLIER = 56;
	public final static int INDEX_CUSTJC = 57;
	public final static int INDEX_GROUPNO = 58;
	public final static int INDEX_LEDGERCUSTID = 59;
	public final static int INDEX_LEDGERCUSTNAME = 60;
	public final static int INDEX_ENGLISHNAME = 61;
	public final static int INDEX_CONTACTS = 62;
	public final static int INDEX_CUSTOMERTYPE = 63;
	public static final int SDO_PROPERTY_COUNT = 64;

	public static final int EXTENDED_PROPERTY_COUNT = -1;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 */
	public ZhCompetitorImpl() {
		this(TYPE);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 */
	public ZhCompetitorImpl(Type type) {
		super(type);
	}

	protected void validate() {
		validateType(TYPE);
	}

	/**
	 * Returns the value of the '<em><b>Custid</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Custid</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Custid</em>' attribute.
	 * @see #setCustid(java.math.BigDecimal)
	 */
	public BigDecimal getCustid() {
		return DataUtil.toBigDecimal(super.getByIndex(INDEX_CUSTID, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getCustid <em>Custid</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Custid</em>' attribute.
	 * @see #getCustid()
	 */
	public void setCustid(BigDecimal custid) {
		super.setByIndex(INDEX_CUSTID, custid);
	}

	/**
	 * Returns the value of the '<em><b>Custname</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Custname</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Custname</em>' attribute.
	 * @see #setCustname(java.lang.String)
	 */
	public String getCustname() {
		return DataUtil.toString(super.getByIndex(INDEX_CUSTNAME, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getCustname <em>Custname</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Custname</em>' attribute.
	 * @see #getCustname()
	 */
	public void setCustname(String custname) {
		super.setByIndex(INDEX_CUSTNAME, custname);
	}

	/**
	 * Returns the value of the '<em><b>Custnum</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Custnum</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Custnum</em>' attribute.
	 * @see #setCustnum(java.lang.String)
	 */
	public String getCustnum() {
		return DataUtil.toString(super.getByIndex(INDEX_CUSTNUM, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getCustnum <em>Custnum</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Custnum</em>' attribute.
	 * @see #getCustnum()
	 */
	public void setCustnum(String custnum) {
		super.setByIndex(INDEX_CUSTNUM, custnum);
	}

	/**
	 * Returns the value of the '<em><b>Custtype</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Custtype</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Custtype</em>' attribute.
	 * @see #setCusttype(java.lang.String)
	 */
	public String getCusttype() {
		return DataUtil.toString(super.getByIndex(INDEX_CUSTTYPE, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getCusttype <em>Custtype</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Custtype</em>' attribute.
	 * @see #getCusttype()
	 */
	public void setCusttype(String custtype) {
		super.setByIndex(INDEX_CUSTTYPE, custtype);
	}

	/**
	 * Returns the value of the '<em><b>Isoem</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Isoem</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Isoem</em>' attribute.
	 * @see #setIsoem(java.lang.String)
	 */
	public String getIsoem() {
		return DataUtil.toString(super.getByIndex(INDEX_ISOEM, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getIsoem <em>Isoem</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Isoem</em>' attribute.
	 * @see #getIsoem()
	 */
	public void setIsoem(String isoem) {
		super.setByIndex(INDEX_ISOEM, isoem);
	}

	/**
	 * Returns the value of the '<em><b>Address</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Address</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Address</em>' attribute.
	 * @see #setAddress(java.lang.String)
	 */
	public String getAddress() {
		return DataUtil.toString(super.getByIndex(INDEX_ADDRESS, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getAddress <em>Address</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Address</em>' attribute.
	 * @see #getAddress()
	 */
	public void setAddress(String address) {
		super.setByIndex(INDEX_ADDRESS, address);
	}

	/**
	 * Returns the value of the '<em><b>Postcode</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Postcode</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Postcode</em>' attribute.
	 * @see #setPostcode(java.lang.String)
	 */
	public String getPostcode() {
		return DataUtil.toString(super.getByIndex(INDEX_POSTCODE, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getPostcode <em>Postcode</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Postcode</em>' attribute.
	 * @see #getPostcode()
	 */
	public void setPostcode(String postcode) {
		super.setByIndex(INDEX_POSTCODE, postcode);
	}

	/**
	 * Returns the value of the '<em><b>Telephone</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Telephone</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Telephone</em>' attribute.
	 * @see #setTelephone(java.lang.String)
	 */
	public String getTelephone() {
		return DataUtil.toString(super.getByIndex(INDEX_TELEPHONE, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getTelephone <em>Telephone</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Telephone</em>' attribute.
	 * @see #getTelephone()
	 */
	public void setTelephone(String telephone) {
		super.setByIndex(INDEX_TELEPHONE, telephone);
	}

	/**
	 * Returns the value of the '<em><b>Fax</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Fax</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Fax</em>' attribute.
	 * @see #setFax(java.lang.String)
	 */
	public String getFax() {
		return DataUtil.toString(super.getByIndex(INDEX_FAX, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getFax <em>Fax</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Fax</em>' attribute.
	 * @see #getFax()
	 */
	public void setFax(String fax) {
		super.setByIndex(INDEX_FAX, fax);
	}

	/**
	 * Returns the value of the '<em><b>Website</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Website</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Website</em>' attribute.
	 * @see #setWebsite(java.lang.String)
	 */
	public String getWebsite() {
		return DataUtil.toString(super.getByIndex(INDEX_WEBSITE, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getWebsite <em>Website</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Website</em>' attribute.
	 * @see #getWebsite()
	 */
	public void setWebsite(String website) {
		super.setByIndex(INDEX_WEBSITE, website);
	}

	/**
	 * Returns the value of the '<em><b>Grade</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Grade</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Grade</em>' attribute.
	 * @see #setGrade(java.lang.String)
	 */
	public String getGrade() {
		return DataUtil.toString(super.getByIndex(INDEX_GRADE, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getGrade <em>Grade</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Grade</em>' attribute.
	 * @see #getGrade()
	 */
	public void setGrade(String grade) {
		super.setByIndex(INDEX_GRADE, grade);
	}

	/**
	 * Returns the value of the '<em><b>Comments</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Comments</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Comments</em>' attribute.
	 * @see #setComments(java.lang.String)
	 */
	public String getComments() {
		return DataUtil.toString(super.getByIndex(INDEX_COMMENTS, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getComments <em>Comments</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Comments</em>' attribute.
	 * @see #getComments()
	 */
	public void setComments(String comments) {
		super.setByIndex(INDEX_COMMENTS, comments);
	}

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
	public Date getCreateDate() {
		return DataUtil.toDate(super.getByIndex(INDEX_CREATEDATE, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getCreateDate <em>CreateDate</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>CreateDate</em>' attribute.
	 * @see #getCreateDate()
	 */
	public void setCreateDate(Date createDate) {
		super.setByIndex(INDEX_CREATEDATE, createDate);
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
	 * Returns the value of the '<em><b>Custmanager</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Custmanager</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Custmanager</em>' attribute.
	 * @see #setCustmanager(java.lang.String)
	 */
	public String getCustmanager() {
		return DataUtil.toString(super.getByIndex(INDEX_CUSTMANAGER, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getCustmanager <em>Custmanager</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Custmanager</em>' attribute.
	 * @see #getCustmanager()
	 */
	public void setCustmanager(String custmanager) {
		super.setByIndex(INDEX_CUSTMANAGER, custmanager);
	}

	/**
	 * Returns the value of the '<em><b>Accoutbank</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Accoutbank</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Accoutbank</em>' attribute.
	 * @see #setAccoutbank(java.lang.String)
	 */
	public String getAccoutbank() {
		return DataUtil.toString(super.getByIndex(INDEX_ACCOUTBANK, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getAccoutbank <em>Accoutbank</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Accoutbank</em>' attribute.
	 * @see #getAccoutbank()
	 */
	public void setAccoutbank(String accoutbank) {
		super.setByIndex(INDEX_ACCOUTBANK, accoutbank);
	}

	/**
	 * Returns the value of the '<em><b>Accoutname</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Accoutname</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Accoutname</em>' attribute.
	 * @see #setAccoutname(java.lang.String)
	 */
	public String getAccoutname() {
		return DataUtil.toString(super.getByIndex(INDEX_ACCOUTNAME, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getAccoutname <em>Accoutname</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Accoutname</em>' attribute.
	 * @see #getAccoutname()
	 */
	public void setAccoutname(String accoutname) {
		super.setByIndex(INDEX_ACCOUTNAME, accoutname);
	}

	/**
	 * Returns the value of the '<em><b>Taxnumb</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Taxnumb</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Taxnumb</em>' attribute.
	 * @see #setTaxnumb(java.lang.String)
	 */
	public String getTaxnumb() {
		return DataUtil.toString(super.getByIndex(INDEX_TAXNUMB, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getTaxnumb <em>Taxnumb</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Taxnumb</em>' attribute.
	 * @see #getTaxnumb()
	 */
	public void setTaxnumb(String taxnumb) {
		super.setByIndex(INDEX_TAXNUMB, taxnumb);
	}

	/**
	 * Returns the value of the '<em><b>Accountid</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Accountid</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Accountid</em>' attribute.
	 * @see #setAccountid(java.lang.String)
	 */
	public String getAccountid() {
		return DataUtil.toString(super.getByIndex(INDEX_ACCOUNTID, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getAccountid <em>Accountid</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Accountid</em>' attribute.
	 * @see #getAccountid()
	 */
	public void setAccountid(String accountid) {
		super.setByIndex(INDEX_ACCOUNTID, accountid);
	}

	/**
	 * Returns the value of the '<em><b>Status</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Status</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Status</em>' attribute.
	 * @see #setStatus(java.lang.String)
	 */
	public String getStatus() {
		return DataUtil.toString(super.getByIndex(INDEX_STATUS, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getStatus <em>Status</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Status</em>' attribute.
	 * @see #getStatus()
	 */
	public void setStatus(String status) {
		super.setByIndex(INDEX_STATUS, status);
	}

	/**
	 * Returns the value of the '<em><b>Custnature</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Custnature</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Custnature</em>' attribute.
	 * @see #setCustnature(java.lang.String)
	 */
	public String getCustnature() {
		return DataUtil.toString(super.getByIndex(INDEX_CUSTNATURE, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getCustnature <em>Custnature</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Custnature</em>' attribute.
	 * @see #getCustnature()
	 */
	public void setCustnature(String custnature) {
		super.setByIndex(INDEX_CUSTNATURE, custnature);
	}

	/**
	 * Returns the value of the '<em><b>License</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>License</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>License</em>' attribute.
	 * @see #setLicense(java.lang.String)
	 */
	public String getLicense() {
		return DataUtil.toString(super.getByIndex(INDEX_LICENSE, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getLicense <em>License</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>License</em>' attribute.
	 * @see #getLicense()
	 */
	public void setLicense(String license) {
		super.setByIndex(INDEX_LICENSE, license);
	}

	/**
	 * Returns the value of the '<em><b>Licenseenddate</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Licenseenddate</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Licenseenddate</em>' attribute.
	 * @see #setLicenseenddate(java.util.Date)
	 */
	public Date getLicenseenddate() {
		return DataUtil.toDate(super.getByIndex(INDEX_LICENSEENDDATE, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getLicenseenddate <em>Licenseenddate</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Licenseenddate</em>' attribute.
	 * @see #getLicenseenddate()
	 */
	public void setLicenseenddate(Date licenseenddate) {
		super.setByIndex(INDEX_LICENSEENDDATE, licenseenddate);
	}

	/**
	 * Returns the value of the '<em><b>Legalperson</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Legalperson</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Legalperson</em>' attribute.
	 * @see #setLegalperson(java.lang.String)
	 */
	public String getLegalperson() {
		return DataUtil.toString(super.getByIndex(INDEX_LEGALPERSON, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getLegalperson <em>Legalperson</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Legalperson</em>' attribute.
	 * @see #getLegalperson()
	 */
	public void setLegalperson(String legalperson) {
		super.setByIndex(INDEX_LEGALPERSON, legalperson);
	}

	/**
	 * Returns the value of the '<em><b>Orgnum</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Orgnum</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Orgnum</em>' attribute.
	 * @see #setOrgnum(java.lang.String)
	 */
	public String getOrgnum() {
		return DataUtil.toString(super.getByIndex(INDEX_ORGNUM, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getOrgnum <em>Orgnum</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Orgnum</em>' attribute.
	 * @see #getOrgnum()
	 */
	public void setOrgnum(String orgnum) {
		super.setByIndex(INDEX_ORGNUM, orgnum);
	}

	/**
	 * Returns the value of the '<em><b>Registercap</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Registercap</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Registercap</em>' attribute.
	 * @see #setRegistercap(java.math.BigDecimal)
	 */
	public BigDecimal getRegistercap() {
		return DataUtil.toBigDecimal(super.getByIndex(INDEX_REGISTERCAP, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getRegistercap <em>Registercap</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Registercap</em>' attribute.
	 * @see #getRegistercap()
	 */
	public void setRegistercap(BigDecimal registercap) {
		super.setByIndex(INDEX_REGISTERCAP, registercap);
	}

	/**
	 * Returns the value of the '<em><b>Servphone</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Servphone</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Servphone</em>' attribute.
	 * @see #setServphone(java.lang.String)
	 */
	public String getServphone() {
		return DataUtil.toString(super.getByIndex(INDEX_SERVPHONE, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getServphone <em>Servphone</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Servphone</em>' attribute.
	 * @see #getServphone()
	 */
	public void setServphone(String servphone) {
		super.setByIndex(INDEX_SERVPHONE, servphone);
	}

	/**
	 * Returns the value of the '<em><b>Compnum</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Compnum</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Compnum</em>' attribute.
	 * @see #setCompnum(java.lang.String)
	 */
	public String getCompnum() {
		return DataUtil.toString(super.getByIndex(INDEX_COMPNUM, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getCompnum <em>Compnum</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Compnum</em>' attribute.
	 * @see #getCompnum()
	 */
	public void setCompnum(String compnum) {
		super.setByIndex(INDEX_COMPNUM, compnum);
	}

	/**
	 * Returns the value of the '<em><b>Servnum</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Servnum</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Servnum</em>' attribute.
	 * @see #setServnum(java.lang.String)
	 */
	public String getServnum() {
		return DataUtil.toString(super.getByIndex(INDEX_SERVNUM, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getServnum <em>Servnum</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Servnum</em>' attribute.
	 * @see #getServnum()
	 */
	public void setServnum(String servnum) {
		super.setByIndex(INDEX_SERVNUM, servnum);
	}

	/**
	 * Returns the value of the '<em><b>Busiscope</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Busiscope</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Busiscope</em>' attribute.
	 * @see #setBusiscope(java.lang.String)
	 */
	public String getBusiscope() {
		return DataUtil.toString(super.getByIndex(INDEX_BUSISCOPE, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getBusiscope <em>Busiscope</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Busiscope</em>' attribute.
	 * @see #getBusiscope()
	 */
	public void setBusiscope(String busiscope) {
		super.setByIndex(INDEX_BUSISCOPE, busiscope);
	}

	/**
	 * Returns the value of the '<em><b>Suborg</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Suborg</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Suborg</em>' attribute.
	 * @see #setSuborg(java.lang.String)
	 */
	public String getSuborg() {
		return DataUtil.toString(super.getByIndex(INDEX_SUBORG, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getSuborg <em>Suborg</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Suborg</em>' attribute.
	 * @see #getSuborg()
	 */
	public void setSuborg(String suborg) {
		super.setByIndex(INDEX_SUBORG, suborg);
	}

	/**
	 * Returns the value of the '<em><b>Compdesc</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Compdesc</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Compdesc</em>' attribute.
	 * @see #setCompdesc(java.lang.String)
	 */
	public String getCompdesc() {
		return DataUtil.toString(super.getByIndex(INDEX_COMPDESC, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getCompdesc <em>Compdesc</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Compdesc</em>' attribute.
	 * @see #getCompdesc()
	 */
	public void setCompdesc(String compdesc) {
		super.setByIndex(INDEX_COMPDESC, compdesc);
	}

	/**
	 * Returns the value of the '<em><b>Threeago</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Threeago</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Threeago</em>' attribute.
	 * @see #setThreeago(java.lang.String)
	 */
	public String getThreeago() {
		return DataUtil.toString(super.getByIndex(INDEX_THREEAGO, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getThreeago <em>Threeago</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Threeago</em>' attribute.
	 * @see #getThreeago()
	 */
	public void setThreeago(String threeago) {
		super.setByIndex(INDEX_THREEAGO, threeago);
	}

	/**
	 * Returns the value of the '<em><b>Threeagoincome</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Threeagoincome</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Threeagoincome</em>' attribute.
	 * @see #setThreeagoincome(java.math.BigDecimal)
	 */
	public BigDecimal getThreeagoincome() {
		return DataUtil.toBigDecimal(super.getByIndex(INDEX_THREEAGOINCOME, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getThreeagoincome <em>Threeagoincome</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Threeagoincome</em>' attribute.
	 * @see #getThreeagoincome()
	 */
	public void setThreeagoincome(BigDecimal threeagoincome) {
		super.setByIndex(INDEX_THREEAGOINCOME, threeagoincome);
	}

	/**
	 * Returns the value of the '<em><b>Threeagoprofit</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Threeagoprofit</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Threeagoprofit</em>' attribute.
	 * @see #setThreeagoprofit(java.math.BigDecimal)
	 */
	public BigDecimal getThreeagoprofit() {
		return DataUtil.toBigDecimal(super.getByIndex(INDEX_THREEAGOPROFIT, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getThreeagoprofit <em>Threeagoprofit</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Threeagoprofit</em>' attribute.
	 * @see #getThreeagoprofit()
	 */
	public void setThreeagoprofit(BigDecimal threeagoprofit) {
		super.setByIndex(INDEX_THREEAGOPROFIT, threeagoprofit);
	}

	/**
	 * Returns the value of the '<em><b>Twoago</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Twoago</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Twoago</em>' attribute.
	 * @see #setTwoago(java.lang.String)
	 */
	public String getTwoago() {
		return DataUtil.toString(super.getByIndex(INDEX_TWOAGO, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getTwoago <em>Twoago</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Twoago</em>' attribute.
	 * @see #getTwoago()
	 */
	public void setTwoago(String twoago) {
		super.setByIndex(INDEX_TWOAGO, twoago);
	}

	/**
	 * Returns the value of the '<em><b>Twoagoincome</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Twoagoincome</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Twoagoincome</em>' attribute.
	 * @see #setTwoagoincome(java.math.BigDecimal)
	 */
	public BigDecimal getTwoagoincome() {
		return DataUtil.toBigDecimal(super.getByIndex(INDEX_TWOAGOINCOME, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getTwoagoincome <em>Twoagoincome</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Twoagoincome</em>' attribute.
	 * @see #getTwoagoincome()
	 */
	public void setTwoagoincome(BigDecimal twoagoincome) {
		super.setByIndex(INDEX_TWOAGOINCOME, twoagoincome);
	}

	/**
	 * Returns the value of the '<em><b>Twoagoprofit</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Twoagoprofit</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Twoagoprofit</em>' attribute.
	 * @see #setTwoagoprofit(java.math.BigDecimal)
	 */
	public BigDecimal getTwoagoprofit() {
		return DataUtil.toBigDecimal(super.getByIndex(INDEX_TWOAGOPROFIT, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getTwoagoprofit <em>Twoagoprofit</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Twoagoprofit</em>' attribute.
	 * @see #getTwoagoprofit()
	 */
	public void setTwoagoprofit(BigDecimal twoagoprofit) {
		super.setByIndex(INDEX_TWOAGOPROFIT, twoagoprofit);
	}

	/**
	 * Returns the value of the '<em><b>Lastyear</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Lastyear</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Lastyear</em>' attribute.
	 * @see #setLastyear(java.lang.String)
	 */
	public String getLastyear() {
		return DataUtil.toString(super.getByIndex(INDEX_LASTYEAR, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getLastyear <em>Lastyear</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Lastyear</em>' attribute.
	 * @see #getLastyear()
	 */
	public void setLastyear(String lastyear) {
		super.setByIndex(INDEX_LASTYEAR, lastyear);
	}

	/**
	 * Returns the value of the '<em><b>Lastyearincome</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Lastyearincome</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Lastyearincome</em>' attribute.
	 * @see #setLastyearincome(java.math.BigDecimal)
	 */
	public BigDecimal getLastyearincome() {
		return DataUtil.toBigDecimal(super.getByIndex(INDEX_LASTYEARINCOME, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getLastyearincome <em>Lastyearincome</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Lastyearincome</em>' attribute.
	 * @see #getLastyearincome()
	 */
	public void setLastyearincome(BigDecimal lastyearincome) {
		super.setByIndex(INDEX_LASTYEARINCOME, lastyearincome);
	}

	/**
	 * Returns the value of the '<em><b>Lastyearprofit</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Lastyearprofit</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Lastyearprofit</em>' attribute.
	 * @see #setLastyearprofit(java.math.BigDecimal)
	 */
	public BigDecimal getLastyearprofit() {
		return DataUtil.toBigDecimal(super.getByIndex(INDEX_LASTYEARPROFIT, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getLastyearprofit <em>Lastyearprofit</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Lastyearprofit</em>' attribute.
	 * @see #getLastyearprofit()
	 */
	public void setLastyearprofit(BigDecimal lastyearprofit) {
		super.setByIndex(INDEX_LASTYEARPROFIT, lastyearprofit);
	}

	/**
	 * Returns the value of the '<em><b>Lastproperty</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Lastproperty</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Lastproperty</em>' attribute.
	 * @see #setLastproperty(java.math.BigDecimal)
	 */
	public BigDecimal getLastproperty() {
		return DataUtil.toBigDecimal(super.getByIndex(INDEX_LASTPROPERTY, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getLastproperty <em>Lastproperty</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Lastproperty</em>' attribute.
	 * @see #getLastproperty()
	 */
	public void setLastproperty(BigDecimal lastproperty) {
		super.setByIndex(INDEX_LASTPROPERTY, lastproperty);
	}

	/**
	 * Returns the value of the '<em><b>Lastpropertynet</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Lastpropertynet</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Lastpropertynet</em>' attribute.
	 * @see #setLastpropertynet(java.math.BigDecimal)
	 */
	public BigDecimal getLastpropertynet() {
		return DataUtil.toBigDecimal(super.getByIndex(INDEX_LASTPROPERTYNET, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getLastpropertynet <em>Lastpropertynet</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Lastpropertynet</em>' attribute.
	 * @see #getLastpropertynet()
	 */
	public void setLastpropertynet(BigDecimal lastpropertynet) {
		super.setByIndex(INDEX_LASTPROPERTYNET, lastpropertynet);
	}

	/**
	 * Returns the value of the '<em><b>Lastfloat</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Lastfloat</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Lastfloat</em>' attribute.
	 * @see #setLastfloat(java.math.BigDecimal)
	 */
	public BigDecimal getLastfloat() {
		return DataUtil.toBigDecimal(super.getByIndex(INDEX_LASTFLOAT, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getLastfloat <em>Lastfloat</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Lastfloat</em>' attribute.
	 * @see #getLastfloat()
	 */
	public void setLastfloat(BigDecimal lastfloat) {
		super.setByIndex(INDEX_LASTFLOAT, lastfloat);
	}

	/**
	 * Returns the value of the '<em><b>Lastlongdebt</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Lastlongdebt</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Lastlongdebt</em>' attribute.
	 * @see #setLastlongdebt(java.math.BigDecimal)
	 */
	public BigDecimal getLastlongdebt() {
		return DataUtil.toBigDecimal(super.getByIndex(INDEX_LASTLONGDEBT, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getLastlongdebt <em>Lastlongdebt</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Lastlongdebt</em>' attribute.
	 * @see #getLastlongdebt()
	 */
	public void setLastlongdebt(BigDecimal lastlongdebt) {
		super.setByIndex(INDEX_LASTLONGDEBT, lastlongdebt);
	}

	/**
	 * Returns the value of the '<em><b>Lastshortdebt</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Lastshortdebt</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Lastshortdebt</em>' attribute.
	 * @see #setLastshortdebt(java.math.BigDecimal)
	 */
	public BigDecimal getLastshortdebt() {
		return DataUtil.toBigDecimal(super.getByIndex(INDEX_LASTSHORTDEBT, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getLastshortdebt <em>Lastshortdebt</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Lastshortdebt</em>' attribute.
	 * @see #getLastshortdebt()
	 */
	public void setLastshortdebt(BigDecimal lastshortdebt) {
		super.setByIndex(INDEX_LASTSHORTDEBT, lastshortdebt);
	}

	/**
	 * Returns the value of the '<em><b>Lastnetprofit</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Lastnetprofit</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Lastnetprofit</em>' attribute.
	 * @see #setLastnetprofit(java.math.BigDecimal)
	 */
	public BigDecimal getLastnetprofit() {
		return DataUtil.toBigDecimal(super.getByIndex(INDEX_LASTNETPROFIT, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getLastnetprofit <em>Lastnetprofit</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Lastnetprofit</em>' attribute.
	 * @see #getLastnetprofit()
	 */
	public void setLastnetprofit(BigDecimal lastnetprofit) {
		super.setByIndex(INDEX_LASTNETPROFIT, lastnetprofit);
	}

	/**
	 * Returns the value of the '<em><b>Mainprod</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Mainprod</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Mainprod</em>' attribute.
	 * @see #setMainprod(java.lang.String)
	 */
	public String getMainprod() {
		return DataUtil.toString(super.getByIndex(INDEX_MAINPROD, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getMainprod <em>Mainprod</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Mainprod</em>' attribute.
	 * @see #getMainprod()
	 */
	public void setMainprod(String mainprod) {
		super.setByIndex(INDEX_MAINPROD, mainprod);
	}

	/**
	 * Returns the value of the '<em><b>Agentprod</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Agentprod</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Agentprod</em>' attribute.
	 * @see #setAgentprod(java.lang.String)
	 */
	public String getAgentprod() {
		return DataUtil.toString(super.getByIndex(INDEX_AGENTPROD, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getAgentprod <em>Agentprod</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Agentprod</em>' attribute.
	 * @see #getAgentprod()
	 */
	public void setAgentprod(String agentprod) {
		super.setByIndex(INDEX_AGENTPROD, agentprod);
	}

	/**
	 * Returns the value of the '<em><b>Qualify1</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Qualify1</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Qualify1</em>' attribute.
	 * @see #setQualify1(java.lang.String)
	 */
	public String getQualify1() {
		return DataUtil.toString(super.getByIndex(INDEX_QUALIFY1, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getQualify1 <em>Qualify1</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Qualify1</em>' attribute.
	 * @see #getQualify1()
	 */
	public void setQualify1(String qualify1) {
		super.setByIndex(INDEX_QUALIFY1, qualify1);
	}

	/**
	 * Returns the value of the '<em><b>Qualify1exp</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Qualify1exp</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Qualify1exp</em>' attribute.
	 * @see #setQualify1exp(java.util.Date)
	 */
	public Date getQualify1exp() {
		return DataUtil.toDate(super.getByIndex(INDEX_QUALIFY1EXP, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getQualify1exp <em>Qualify1exp</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Qualify1exp</em>' attribute.
	 * @see #getQualify1exp()
	 */
	public void setQualify1exp(Date qualify1exp) {
		super.setByIndex(INDEX_QUALIFY1EXP, qualify1exp);
	}

	/**
	 * Returns the value of the '<em><b>Qualify2</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Qualify2</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Qualify2</em>' attribute.
	 * @see #setQualify2(java.lang.String)
	 */
	public String getQualify2() {
		return DataUtil.toString(super.getByIndex(INDEX_QUALIFY2, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getQualify2 <em>Qualify2</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Qualify2</em>' attribute.
	 * @see #getQualify2()
	 */
	public void setQualify2(String qualify2) {
		super.setByIndex(INDEX_QUALIFY2, qualify2);
	}

	/**
	 * Returns the value of the '<em><b>Qualify2exp</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Qualify2exp</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Qualify2exp</em>' attribute.
	 * @see #setQualify2exp(java.util.Date)
	 */
	public Date getQualify2exp() {
		return DataUtil.toDate(super.getByIndex(INDEX_QUALIFY2EXP, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getQualify2exp <em>Qualify2exp</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Qualify2exp</em>' attribute.
	 * @see #getQualify2exp()
	 */
	public void setQualify2exp(Date qualify2exp) {
		super.setByIndex(INDEX_QUALIFY2EXP, qualify2exp);
	}

	/**
	 * Returns the value of the '<em><b>Qualify3</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Qualify3</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Qualify3</em>' attribute.
	 * @see #setQualify3(java.lang.String)
	 */
	public String getQualify3() {
		return DataUtil.toString(super.getByIndex(INDEX_QUALIFY3, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getQualify3 <em>Qualify3</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Qualify3</em>' attribute.
	 * @see #getQualify3()
	 */
	public void setQualify3(String qualify3) {
		super.setByIndex(INDEX_QUALIFY3, qualify3);
	}

	/**
	 * Returns the value of the '<em><b>Qualify3exp</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Qualify3exp</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Qualify3exp</em>' attribute.
	 * @see #setQualify3exp(java.util.Date)
	 */
	public Date getQualify3exp() {
		return DataUtil.toDate(super.getByIndex(INDEX_QUALIFY3EXP, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getQualify3exp <em>Qualify3exp</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Qualify3exp</em>' attribute.
	 * @see #getQualify3exp()
	 */
	public void setQualify3exp(Date qualify3exp) {
		super.setByIndex(INDEX_QUALIFY3EXP, qualify3exp);
	}

	/**
	 * Returns the value of the '<em><b>Qualifycomm</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Qualifycomm</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Qualifycomm</em>' attribute.
	 * @see #setQualifycomm(java.lang.String)
	 */
	public String getQualifycomm() {
		return DataUtil.toString(super.getByIndex(INDEX_QUALIFYCOMM, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getQualifycomm <em>Qualifycomm</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Qualifycomm</em>' attribute.
	 * @see #getQualifycomm()
	 */
	public void setQualifycomm(String qualifycomm) {
		super.setByIndex(INDEX_QUALIFYCOMM, qualifycomm);
	}

	/**
	 * Returns the value of the '<em><b>Issupplier</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Issupplier</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Issupplier</em>' attribute.
	 * @see #setIssupplier(java.lang.String)
	 */
	public String getIssupplier() {
		return DataUtil.toString(super.getByIndex(INDEX_ISSUPPLIER, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getIssupplier <em>Issupplier</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Issupplier</em>' attribute.
	 * @see #getIssupplier()
	 */
	public void setIssupplier(String issupplier) {
		super.setByIndex(INDEX_ISSUPPLIER, issupplier);
	}

	/**
	 * Returns the value of the '<em><b>Custjc</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Custjc</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Custjc</em>' attribute.
	 * @see #setCustjc(java.lang.String)
	 */
	public String getCustjc() {
		return DataUtil.toString(super.getByIndex(INDEX_CUSTJC, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getCustjc <em>Custjc</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Custjc</em>' attribute.
	 * @see #getCustjc()
	 */
	public void setCustjc(String custjc) {
		super.setByIndex(INDEX_CUSTJC, custjc);
	}

	/**
	 * Returns the value of the '<em><b>Groupno</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Groupno</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Groupno</em>' attribute.
	 * @see #setGroupno(java.math.BigDecimal)
	 */
	public BigDecimal getGroupno() {
		return DataUtil.toBigDecimal(super.getByIndex(INDEX_GROUPNO, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getGroupno <em>Groupno</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Groupno</em>' attribute.
	 * @see #getGroupno()
	 */
	public void setGroupno(BigDecimal groupno) {
		super.setByIndex(INDEX_GROUPNO, groupno);
	}

	/**
	 * Returns the value of the '<em><b>Ledgercustid</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Ledgercustid</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Ledgercustid</em>' attribute.
	 * @see #setLedgercustid(java.lang.String)
	 */
	public String getLedgercustid() {
		return DataUtil.toString(super.getByIndex(INDEX_LEDGERCUSTID, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getLedgercustid <em>Ledgercustid</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Ledgercustid</em>' attribute.
	 * @see #getLedgercustid()
	 */
	public void setLedgercustid(String ledgercustid) {
		super.setByIndex(INDEX_LEDGERCUSTID, ledgercustid);
	}

	/**
	 * Returns the value of the '<em><b>Ledgercustname</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Ledgercustname</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Ledgercustname</em>' attribute.
	 * @see #setLedgercustname(java.lang.String)
	 */
	public String getLedgercustname() {
		return DataUtil.toString(super.getByIndex(INDEX_LEDGERCUSTNAME, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getLedgercustname <em>Ledgercustname</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Ledgercustname</em>' attribute.
	 * @see #getLedgercustname()
	 */
	public void setLedgercustname(String ledgercustname) {
		super.setByIndex(INDEX_LEDGERCUSTNAME, ledgercustname);
	}

	/**
	 * Returns the value of the '<em><b>EnglishName</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>EnglishName</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>EnglishName</em>' attribute.
	 * @see #setEnglishName(java.lang.String)
	 */
	public String getEnglishName() {
		return DataUtil.toString(super.getByIndex(INDEX_ENGLISHNAME, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getEnglishName <em>EnglishName</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>EnglishName</em>' attribute.
	 * @see #getEnglishName()
	 */
	public void setEnglishName(String englishName) {
		super.setByIndex(INDEX_ENGLISHNAME, englishName);
	}

	/**
	 * Returns the value of the '<em><b>Contacts</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Contacts</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Contacts</em>' attribute.
	 * @see #setContacts(java.lang.String)
	 */
	public String getContacts() {
		return DataUtil.toString(super.getByIndex(INDEX_CONTACTS, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getContacts <em>Contacts</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Contacts</em>' attribute.
	 * @see #getContacts()
	 */
	public void setContacts(String contacts) {
		super.setByIndex(INDEX_CONTACTS, contacts);
	}

	/**
	 * Returns the value of the '<em><b>Customertype</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Customertype</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Customertype</em>' attribute.
	 * @see #setCustomertype(java.lang.String)
	 */
	public String getCustomertype() {
		return DataUtil.toString(super.getByIndex(INDEX_CUSTOMERTYPE, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getCustomertype <em>Customertype</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Customertype</em>' attribute.
	 * @see #getCustomertype()
	 */
	public void setCustomertype(String customertype) {
		super.setByIndex(INDEX_CUSTOMERTYPE, customertype);
	}


}