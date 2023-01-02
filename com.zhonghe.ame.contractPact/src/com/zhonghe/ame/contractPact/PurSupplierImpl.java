/*******************************************************************************
 *
 * Copyright (c) 2001-2006 Primeton Technologies, Ltd.
 * All rights reserved.
 *
 * Created on Apr 11, 2008
 *******************************************************************************/
package com.zhonghe.ame.contractPact;

import com.primeton.ext.data.sdo.DataUtil;
import com.primeton.ext.data.sdo.ExtendedDataObjectImpl;
import com.zhonghe.ame.payContract.payContract.PurSupplier;

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
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.PurSupplierImpl#getCustid <em>Custid</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.PurSupplierImpl#getCustname <em>Custname</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.PurSupplierImpl#getCustnum <em>Custnum</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.PurSupplierImpl#getCusttype <em>Custtype</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.PurSupplierImpl#getAddress <em>Address</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.PurSupplierImpl#getPostcode <em>Postcode</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.PurSupplierImpl#getTelephone <em>Telephone</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.PurSupplierImpl#getFax <em>Fax</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.PurSupplierImpl#getWebsite <em>Website</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.PurSupplierImpl#getComments <em>Comments</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.PurSupplierImpl#getCreateDate <em>CreateDate</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.PurSupplierImpl#getCreateUserid <em>CreateUserid</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.PurSupplierImpl#getCustmanager <em>Custmanager</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.PurSupplierImpl#getAccoutbank <em>Accoutbank</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.PurSupplierImpl#getAccoutname <em>Accoutname</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.PurSupplierImpl#getTaxnumb <em>Taxnumb</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.PurSupplierImpl#getAccountid <em>Accountid</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.PurSupplierImpl#getStatus <em>Status</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.PurSupplierImpl#getCustnature <em>Custnature</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.PurSupplierImpl#getLicense <em>License</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.PurSupplierImpl#getLicenseenddate <em>Licenseenddate</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.PurSupplierImpl#getLegalperson <em>Legalperson</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.PurSupplierImpl#getOrgnum <em>Orgnum</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.PurSupplierImpl#getRegistercap <em>Registercap</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.PurSupplierImpl#getCompdesc <em>Compdesc</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.PurSupplierImpl#getThreeago <em>Threeago</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.PurSupplierImpl#getThreeagoincome <em>Threeagoincome</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.PurSupplierImpl#getThreeagoprofit <em>Threeagoprofit</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.PurSupplierImpl#getTwoago <em>Twoago</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.PurSupplierImpl#getTwoagoincome <em>Twoagoincome</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.PurSupplierImpl#getTwoagoprofit <em>Twoagoprofit</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.PurSupplierImpl#getLastyear <em>Lastyear</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.PurSupplierImpl#getLastyearincome <em>Lastyearincome</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.PurSupplierImpl#getLastyearprofit <em>Lastyearprofit</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.PurSupplierImpl#getLastproperty <em>Lastproperty</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.PurSupplierImpl#getLastpropertynet <em>Lastpropertynet</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.PurSupplierImpl#getLastfloat <em>Lastfloat</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.PurSupplierImpl#getLastlongdebt <em>Lastlongdebt</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.PurSupplierImpl#getLastshortdebt <em>Lastshortdebt</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.PurSupplierImpl#getLastnetprofit <em>Lastnetprofit</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.PurSupplierImpl#getMainprod <em>Mainprod</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.PurSupplierImpl#getAgentprod <em>Agentprod</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.PurSupplierImpl#getQualify1 <em>Qualify1</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.PurSupplierImpl#getQualify1exp <em>Qualify1exp</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.PurSupplierImpl#getQualify2 <em>Qualify2</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.PurSupplierImpl#getQualify2exp <em>Qualify2exp</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.PurSupplierImpl#getQualify3 <em>Qualify3</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.PurSupplierImpl#getQualify3exp <em>Qualify3exp</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.PurSupplierImpl#getQualifycomm <em>Qualifycomm</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.PurSupplierImpl#getSuppliersname <em>Suppliersname</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.PurSupplierImpl#getInfoprovider <em>Infoprovider</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.PurSupplierImpl#getLinkman <em>Linkman</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.PurSupplierImpl#getLinktel <em>Linktel</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.PurSupplierImpl#getLinkmail <em>Linkmail</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.PurSupplierImpl#getRegistcity <em>Registcity</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.PurSupplierImpl#getIstaxpayer <em>Istaxpayer</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.PurSupplierImpl#getEstabdate <em>Estabdate</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.PurSupplierImpl#getRegistaddress <em>Registaddress</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.PurSupplierImpl#getTaxno <em>Taxno</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.PurSupplierImpl#getCappay <em>Cappay</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.PurSupplierImpl#getEmpsize <em>Empsize</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.PurSupplierImpl#getProcessinstid <em>Processinstid</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.PurSupplierImpl#getCvencode <em>Cvencode</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.PurSupplierImpl#getServtype <em>Servtype</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.PurSupplierImpl#getLocservcity <em>Locservcity</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.PurSupplierImpl#getDycustid <em>Dycustid</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.PurSupplierImpl#getReindex <em>Reindex</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.PurSupplierImpl#getInflag <em>Inflag</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.PurSupplierImpl#getCvenname <em>Cvenname</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.PurSupplierImpl#getIsqualified <em>Isqualified</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.PurSupplierImpl#getAppraise <em>Appraise</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.PurSupplierImpl#getInspect <em>Inspect</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.PurSupplierImpl#getMisconduct <em>Misconduct</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.PurSupplierImpl#getBlacklist <em>Blacklist</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.impl.PurSupplierImpl#getIsgroupqualified <em>Isgroupqualified</em>}</li>
 * </ul>
 * </p>
 *
 * @extends ExtendedDataObjectImpl;
 *
 * @implements PurSupplier;
 */

public class PurSupplierImpl extends ExtendedDataObjectImpl implements com.zhonghe.ame.contractPact.PurSupplier {
	/**
	 * Comment for <code>serialVersionUID</code>
	 */
	private static final long serialVersionUID = 1L;
	public final static int INDEX_CUSTID = 0;
	public final static int INDEX_CUSTNAME = 1;
	public final static int INDEX_CUSTNUM = 2;
	public final static int INDEX_CUSTTYPE = 3;
	public final static int INDEX_ADDRESS = 4;
	public final static int INDEX_POSTCODE = 5;
	public final static int INDEX_TELEPHONE = 6;
	public final static int INDEX_FAX = 7;
	public final static int INDEX_WEBSITE = 8;
	public final static int INDEX_COMMENTS = 9;
	public final static int INDEX_CREATEDATE = 10;
	public final static int INDEX_CREATEUSERID = 11;
	public final static int INDEX_CUSTMANAGER = 12;
	public final static int INDEX_ACCOUTBANK = 13;
	public final static int INDEX_ACCOUTNAME = 14;
	public final static int INDEX_TAXNUMB = 15;
	public final static int INDEX_ACCOUNTID = 16;
	public final static int INDEX_STATUS = 17;
	public final static int INDEX_CUSTNATURE = 18;
	public final static int INDEX_LICENSE = 19;
	public final static int INDEX_LICENSEENDDATE = 20;
	public final static int INDEX_LEGALPERSON = 21;
	public final static int INDEX_ORGNUM = 22;
	public final static int INDEX_REGISTERCAP = 23;
	public final static int INDEX_COMPDESC = 24;
	public final static int INDEX_THREEAGO = 25;
	public final static int INDEX_THREEAGOINCOME = 26;
	public final static int INDEX_THREEAGOPROFIT = 27;
	public final static int INDEX_TWOAGO = 28;
	public final static int INDEX_TWOAGOINCOME = 29;
	public final static int INDEX_TWOAGOPROFIT = 30;
	public final static int INDEX_LASTYEAR = 31;
	public final static int INDEX_LASTYEARINCOME = 32;
	public final static int INDEX_LASTYEARPROFIT = 33;
	public final static int INDEX_LASTPROPERTY = 34;
	public final static int INDEX_LASTPROPERTYNET = 35;
	public final static int INDEX_LASTFLOAT = 36;
	public final static int INDEX_LASTLONGDEBT = 37;
	public final static int INDEX_LASTSHORTDEBT = 38;
	public final static int INDEX_LASTNETPROFIT = 39;
	public final static int INDEX_MAINPROD = 40;
	public final static int INDEX_AGENTPROD = 41;
	public final static int INDEX_QUALIFY1 = 42;
	public final static int INDEX_QUALIFY1EXP = 43;
	public final static int INDEX_QUALIFY2 = 44;
	public final static int INDEX_QUALIFY2EXP = 45;
	public final static int INDEX_QUALIFY3 = 46;
	public final static int INDEX_QUALIFY3EXP = 47;
	public final static int INDEX_QUALIFYCOMM = 48;
	public final static int INDEX_SUPPLIERSNAME = 49;
	public final static int INDEX_INFOPROVIDER = 50;
	public final static int INDEX_LINKMAN = 51;
	public final static int INDEX_LINKTEL = 52;
	public final static int INDEX_LINKMAIL = 53;
	public final static int INDEX_REGISTCITY = 54;
	public final static int INDEX_ISTAXPAYER = 55;
	public final static int INDEX_ESTABDATE = 56;
	public final static int INDEX_REGISTADDRESS = 57;
	public final static int INDEX_TAXNO = 58;
	public final static int INDEX_CAPPAY = 59;
	public final static int INDEX_EMPSIZE = 60;
	public final static int INDEX_PROCESSINSTID = 61;
	public final static int INDEX_CVENCODE = 62;
	public final static int INDEX_SERVTYPE = 63;
	public final static int INDEX_LOCSERVCITY = 64;
	public final static int INDEX_DYCUSTID = 65;
	public final static int INDEX_REINDEX = 66;
	public final static int INDEX_INFLAG = 67;
	public final static int INDEX_CVENNAME = 68;
	public final static int INDEX_ISQUALIFIED = 69;
	public final static int INDEX_APPRAISE = 70;
	public final static int INDEX_INSPECT = 71;
	public final static int INDEX_MISCONDUCT = 72;
	public final static int INDEX_BLACKLIST = 73;
	public final static int INDEX_ISGROUPQUALIFIED = 74;
	public static final int SDO_PROPERTY_COUNT = 75;

	public static final int EXTENDED_PROPERTY_COUNT = -1;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 */
	public PurSupplierImpl() {
		this(TYPE);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 */
	public PurSupplierImpl(Type type) {
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
	 * Returns the value of the '<em><b>Suppliersname</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Suppliersname</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Suppliersname</em>' attribute.
	 * @see #setSuppliersname(java.lang.String)
	 */
	public String getSuppliersname() {
		return DataUtil.toString(super.getByIndex(INDEX_SUPPLIERSNAME, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getSuppliersname <em>Suppliersname</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Suppliersname</em>' attribute.
	 * @see #getSuppliersname()
	 */
	public void setSuppliersname(String suppliersname) {
		super.setByIndex(INDEX_SUPPLIERSNAME, suppliersname);
	}

	/**
	 * Returns the value of the '<em><b>Infoprovider</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Infoprovider</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Infoprovider</em>' attribute.
	 * @see #setInfoprovider(java.lang.String)
	 */
	public String getInfoprovider() {
		return DataUtil.toString(super.getByIndex(INDEX_INFOPROVIDER, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getInfoprovider <em>Infoprovider</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Infoprovider</em>' attribute.
	 * @see #getInfoprovider()
	 */
	public void setInfoprovider(String infoprovider) {
		super.setByIndex(INDEX_INFOPROVIDER, infoprovider);
	}

	/**
	 * Returns the value of the '<em><b>Linkman</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Linkman</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Linkman</em>' attribute.
	 * @see #setLinkman(java.lang.String)
	 */
	public String getLinkman() {
		return DataUtil.toString(super.getByIndex(INDEX_LINKMAN, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getLinkman <em>Linkman</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Linkman</em>' attribute.
	 * @see #getLinkman()
	 */
	public void setLinkman(String linkman) {
		super.setByIndex(INDEX_LINKMAN, linkman);
	}

	/**
	 * Returns the value of the '<em><b>Linktel</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Linktel</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Linktel</em>' attribute.
	 * @see #setLinktel(java.lang.String)
	 */
	public String getLinktel() {
		return DataUtil.toString(super.getByIndex(INDEX_LINKTEL, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getLinktel <em>Linktel</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Linktel</em>' attribute.
	 * @see #getLinktel()
	 */
	public void setLinktel(String linktel) {
		super.setByIndex(INDEX_LINKTEL, linktel);
	}

	/**
	 * Returns the value of the '<em><b>Linkmail</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Linkmail</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Linkmail</em>' attribute.
	 * @see #setLinkmail(java.lang.String)
	 */
	public String getLinkmail() {
		return DataUtil.toString(super.getByIndex(INDEX_LINKMAIL, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getLinkmail <em>Linkmail</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Linkmail</em>' attribute.
	 * @see #getLinkmail()
	 */
	public void setLinkmail(String linkmail) {
		super.setByIndex(INDEX_LINKMAIL, linkmail);
	}

	/**
	 * Returns the value of the '<em><b>Registcity</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Registcity</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Registcity</em>' attribute.
	 * @see #setRegistcity(java.lang.String)
	 */
	public String getRegistcity() {
		return DataUtil.toString(super.getByIndex(INDEX_REGISTCITY, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getRegistcity <em>Registcity</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Registcity</em>' attribute.
	 * @see #getRegistcity()
	 */
	public void setRegistcity(String registcity) {
		super.setByIndex(INDEX_REGISTCITY, registcity);
	}

	/**
	 * Returns the value of the '<em><b>Istaxpayer</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Istaxpayer</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Istaxpayer</em>' attribute.
	 * @see #setIstaxpayer(java.lang.String)
	 */
	public String getIstaxpayer() {
		return DataUtil.toString(super.getByIndex(INDEX_ISTAXPAYER, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getIstaxpayer <em>Istaxpayer</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Istaxpayer</em>' attribute.
	 * @see #getIstaxpayer()
	 */
	public void setIstaxpayer(String istaxpayer) {
		super.setByIndex(INDEX_ISTAXPAYER, istaxpayer);
	}

	/**
	 * Returns the value of the '<em><b>Estabdate</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Estabdate</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Estabdate</em>' attribute.
	 * @see #setEstabdate(java.util.Date)
	 */
	public Date getEstabdate() {
		return DataUtil.toDate(super.getByIndex(INDEX_ESTABDATE, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getEstabdate <em>Estabdate</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Estabdate</em>' attribute.
	 * @see #getEstabdate()
	 */
	public void setEstabdate(Date estabdate) {
		super.setByIndex(INDEX_ESTABDATE, estabdate);
	}

	/**
	 * Returns the value of the '<em><b>Registaddress</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Registaddress</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Registaddress</em>' attribute.
	 * @see #setRegistaddress(java.lang.String)
	 */
	public String getRegistaddress() {
		return DataUtil.toString(super.getByIndex(INDEX_REGISTADDRESS, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getRegistaddress <em>Registaddress</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Registaddress</em>' attribute.
	 * @see #getRegistaddress()
	 */
	public void setRegistaddress(String registaddress) {
		super.setByIndex(INDEX_REGISTADDRESS, registaddress);
	}

	/**
	 * Returns the value of the '<em><b>Taxno</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Taxno</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Taxno</em>' attribute.
	 * @see #setTaxno(java.lang.String)
	 */
	public String getTaxno() {
		return DataUtil.toString(super.getByIndex(INDEX_TAXNO, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getTaxno <em>Taxno</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Taxno</em>' attribute.
	 * @see #getTaxno()
	 */
	public void setTaxno(String taxno) {
		super.setByIndex(INDEX_TAXNO, taxno);
	}

	/**
	 * Returns the value of the '<em><b>Cappay</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Cappay</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Cappay</em>' attribute.
	 * @see #setCappay(java.math.BigDecimal)
	 */
	public BigDecimal getCappay() {
		return DataUtil.toBigDecimal(super.getByIndex(INDEX_CAPPAY, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getCappay <em>Cappay</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Cappay</em>' attribute.
	 * @see #getCappay()
	 */
	public void setCappay(BigDecimal cappay) {
		super.setByIndex(INDEX_CAPPAY, cappay);
	}

	/**
	 * Returns the value of the '<em><b>Empsize</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Empsize</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Empsize</em>' attribute.
	 * @see #setEmpsize(java.lang.String)
	 */
	public String getEmpsize() {
		return DataUtil.toString(super.getByIndex(INDEX_EMPSIZE, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getEmpsize <em>Empsize</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Empsize</em>' attribute.
	 * @see #getEmpsize()
	 */
	public void setEmpsize(String empsize) {
		super.setByIndex(INDEX_EMPSIZE, empsize);
	}

	/**
	 * Returns the value of the '<em><b>Processinstid</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Processinstid</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Processinstid</em>' attribute.
	 * @see #setProcessinstid(java.math.BigDecimal)
	 */
	public BigDecimal getProcessinstid() {
		return DataUtil.toBigDecimal(super.getByIndex(INDEX_PROCESSINSTID, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getProcessinstid <em>Processinstid</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Processinstid</em>' attribute.
	 * @see #getProcessinstid()
	 */
	public void setProcessinstid(BigDecimal processinstid) {
		super.setByIndex(INDEX_PROCESSINSTID, processinstid);
	}

	/**
	 * Returns the value of the '<em><b>Cvencode</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Cvencode</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Cvencode</em>' attribute.
	 * @see #setCvencode(java.lang.String)
	 */
	public String getCvencode() {
		return DataUtil.toString(super.getByIndex(INDEX_CVENCODE, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getCvencode <em>Cvencode</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Cvencode</em>' attribute.
	 * @see #getCvencode()
	 */
	public void setCvencode(String cvencode) {
		super.setByIndex(INDEX_CVENCODE, cvencode);
	}

	/**
	 * Returns the value of the '<em><b>Servtype</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Servtype</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Servtype</em>' attribute.
	 * @see #setServtype(java.lang.String)
	 */
	public String getServtype() {
		return DataUtil.toString(super.getByIndex(INDEX_SERVTYPE, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getServtype <em>Servtype</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Servtype</em>' attribute.
	 * @see #getServtype()
	 */
	public void setServtype(String servtype) {
		super.setByIndex(INDEX_SERVTYPE, servtype);
	}

	/**
	 * Returns the value of the '<em><b>Locservcity</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Locservcity</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Locservcity</em>' attribute.
	 * @see #setLocservcity(java.lang.String)
	 */
	public String getLocservcity() {
		return DataUtil.toString(super.getByIndex(INDEX_LOCSERVCITY, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getLocservcity <em>Locservcity</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Locservcity</em>' attribute.
	 * @see #getLocservcity()
	 */
	public void setLocservcity(String locservcity) {
		super.setByIndex(INDEX_LOCSERVCITY, locservcity);
	}

	/**
	 * Returns the value of the '<em><b>Dycustid</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Dycustid</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Dycustid</em>' attribute.
	 * @see #setDycustid(java.math.BigDecimal)
	 */
	public BigDecimal getDycustid() {
		return DataUtil.toBigDecimal(super.getByIndex(INDEX_DYCUSTID, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getDycustid <em>Dycustid</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Dycustid</em>' attribute.
	 * @see #getDycustid()
	 */
	public void setDycustid(BigDecimal dycustid) {
		super.setByIndex(INDEX_DYCUSTID, dycustid);
	}

	/**
	 * Returns the value of the '<em><b>Reindex</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Reindex</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Reindex</em>' attribute.
	 * @see #setReindex(java.lang.String)
	 */
	public String getReindex() {
		return DataUtil.toString(super.getByIndex(INDEX_REINDEX, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getReindex <em>Reindex</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Reindex</em>' attribute.
	 * @see #getReindex()
	 */
	public void setReindex(String reindex) {
		super.setByIndex(INDEX_REINDEX, reindex);
	}

	/**
	 * Returns the value of the '<em><b>Inflag</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Inflag</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Inflag</em>' attribute.
	 * @see #setInflag(java.lang.String)
	 */
	public String getInflag() {
		return DataUtil.toString(super.getByIndex(INDEX_INFLAG, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getInflag <em>Inflag</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Inflag</em>' attribute.
	 * @see #getInflag()
	 */
	public void setInflag(String inflag) {
		super.setByIndex(INDEX_INFLAG, inflag);
	}

	/**
	 * Returns the value of the '<em><b>Cvenname</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Cvenname</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Cvenname</em>' attribute.
	 * @see #setCvenname(java.lang.String)
	 */
	public String getCvenname() {
		return DataUtil.toString(super.getByIndex(INDEX_CVENNAME, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getCvenname <em>Cvenname</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Cvenname</em>' attribute.
	 * @see #getCvenname()
	 */
	public void setCvenname(String cvenname) {
		super.setByIndex(INDEX_CVENNAME, cvenname);
	}

	/**
	 * Returns the value of the '<em><b>Isqualified</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Isqualified</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Isqualified</em>' attribute.
	 * @see #setIsqualified(java.lang.String)
	 */
	public String getIsqualified() {
		return DataUtil.toString(super.getByIndex(INDEX_ISQUALIFIED, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getIsqualified <em>Isqualified</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Isqualified</em>' attribute.
	 * @see #getIsqualified()
	 */
	public void setIsqualified(String isqualified) {
		super.setByIndex(INDEX_ISQUALIFIED, isqualified);
	}

	/**
	 * Returns the value of the '<em><b>Appraise</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Appraise</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Appraise</em>' attribute.
	 * @see #setAppraise(java.lang.String)
	 */
	public String getAppraise() {
		return DataUtil.toString(super.getByIndex(INDEX_APPRAISE, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getAppraise <em>Appraise</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Appraise</em>' attribute.
	 * @see #getAppraise()
	 */
	public void setAppraise(String appraise) {
		super.setByIndex(INDEX_APPRAISE, appraise);
	}

	/**
	 * Returns the value of the '<em><b>Inspect</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Inspect</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Inspect</em>' attribute.
	 * @see #setInspect(java.lang.String)
	 */
	public String getInspect() {
		return DataUtil.toString(super.getByIndex(INDEX_INSPECT, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getInspect <em>Inspect</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Inspect</em>' attribute.
	 * @see #getInspect()
	 */
	public void setInspect(String inspect) {
		super.setByIndex(INDEX_INSPECT, inspect);
	}

	/**
	 * Returns the value of the '<em><b>Misconduct</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Misconduct</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Misconduct</em>' attribute.
	 * @see #setMisconduct(java.lang.String)
	 */
	public String getMisconduct() {
		return DataUtil.toString(super.getByIndex(INDEX_MISCONDUCT, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getMisconduct <em>Misconduct</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Misconduct</em>' attribute.
	 * @see #getMisconduct()
	 */
	public void setMisconduct(String misconduct) {
		super.setByIndex(INDEX_MISCONDUCT, misconduct);
	}

	/**
	 * Returns the value of the '<em><b>Blacklist</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Blacklist</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Blacklist</em>' attribute.
	 * @see #setBlacklist(java.lang.String)
	 */
	public String getBlacklist() {
		return DataUtil.toString(super.getByIndex(INDEX_BLACKLIST, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getBlacklist <em>Blacklist</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Blacklist</em>' attribute.
	 * @see #getBlacklist()
	 */
	public void setBlacklist(String blacklist) {
		super.setByIndex(INDEX_BLACKLIST, blacklist);
	}

	/**
	 * Returns the value of the '<em><b>Isgroupqualified</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Isgroupqualified</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Isgroupqualified</em>' attribute.
	 * @see #setIsgroupqualified(java.lang.String)
	 */
	public String getIsgroupqualified() {
		return DataUtil.toString(super.getByIndex(INDEX_ISGROUPQUALIFIED, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getIsgroupqualified <em>Isgroupqualified</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Isgroupqualified</em>' attribute.
	 * @see #getIsgroupqualified()
	 */
	public void setIsgroupqualified(String isgroupqualified) {
		super.setByIndex(INDEX_ISGROUPQUALIFIED, isgroupqualified);
	}


}