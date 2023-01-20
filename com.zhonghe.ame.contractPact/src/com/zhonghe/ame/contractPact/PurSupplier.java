/*******************************************************************************
 *
 * Copyright (c) 2001-2006 Primeton Technologies, Ltd.
 * All rights reserved.
 *
 * Created on Apr 11, 2008
 *******************************************************************************/
package com.zhonghe.ame.contractPact;

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
 *   <li>{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getCustid <em>Custid</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getCustname <em>Custname</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getCustnum <em>Custnum</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getCusttype <em>Custtype</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getAddress <em>Address</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getPostcode <em>Postcode</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getTelephone <em>Telephone</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getFax <em>Fax</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getWebsite <em>Website</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getComments <em>Comments</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getCreateDate <em>CreateDate</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getCreateUserid <em>CreateUserid</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getCustmanager <em>Custmanager</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getAccoutbank <em>Accoutbank</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getAccoutname <em>Accoutname</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getTaxnumb <em>Taxnumb</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getAccountid <em>Accountid</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getStatus <em>Status</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getCustnature <em>Custnature</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getLicense <em>License</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getLicenseenddate <em>Licenseenddate</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getLegalperson <em>Legalperson</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getOrgnum <em>Orgnum</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getRegistercap <em>Registercap</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getCompdesc <em>Compdesc</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getThreeago <em>Threeago</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getThreeagoincome <em>Threeagoincome</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getThreeagoprofit <em>Threeagoprofit</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getTwoago <em>Twoago</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getTwoagoincome <em>Twoagoincome</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getTwoagoprofit <em>Twoagoprofit</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getLastyear <em>Lastyear</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getLastyearincome <em>Lastyearincome</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getLastyearprofit <em>Lastyearprofit</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getLastproperty <em>Lastproperty</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getLastpropertynet <em>Lastpropertynet</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getLastfloat <em>Lastfloat</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getLastlongdebt <em>Lastlongdebt</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getLastshortdebt <em>Lastshortdebt</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getLastnetprofit <em>Lastnetprofit</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getMainprod <em>Mainprod</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getAgentprod <em>Agentprod</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getQualify1 <em>Qualify1</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getQualify1exp <em>Qualify1exp</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getQualify2 <em>Qualify2</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getQualify2exp <em>Qualify2exp</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getQualify3 <em>Qualify3</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getQualify3exp <em>Qualify3exp</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getQualifycomm <em>Qualifycomm</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getSuppliersname <em>Suppliersname</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getInfoprovider <em>Infoprovider</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getLinkman <em>Linkman</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getLinktel <em>Linktel</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getLinkmail <em>Linkmail</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getRegistcity <em>Registcity</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getIstaxpayer <em>Istaxpayer</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getEstabdate <em>Estabdate</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getRegistaddress <em>Registaddress</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getTaxno <em>Taxno</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getCappay <em>Cappay</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getEmpsize <em>Empsize</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getProcessinstid <em>Processinstid</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getCvencode <em>Cvencode</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getServtype <em>Servtype</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getLocservcity <em>Locservcity</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getDycustid <em>Dycustid</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getReindex <em>Reindex</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getInflag <em>Inflag</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getCvenname <em>Cvenname</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getIsqualified <em>Isqualified</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getAppraise <em>Appraise</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getInspect <em>Inspect</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getMisconduct <em>Misconduct</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getBlacklist <em>Blacklist</em>}</li>
 *   <li>{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getIsgroupqualified <em>Isgroupqualified</em>}</li>
 * </ul>
 * </p>
 *
 * @extends DataObject;
 */
public interface PurSupplier extends DataObject {

	public static final String QNAME = "com.zhonghe.ame.payContract.payContract.PurSupplier";

	public static final Type TYPE = TypeHelper.INSTANCE.getType("com.zhonghe.ame.payContract.payContract", "PurSupplier");

	public static final IObjectFactory<PurSupplier> FACTORY = new IObjectFactory<PurSupplier>() {
		public PurSupplier create() {
			return (PurSupplier) DataFactory.INSTANCE.create(TYPE);
		}
	};

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
	public BigDecimal getCustid();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getCustid <em>Custid</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Custid</em>' attribute.
	 * @see #getCustid()
	 */
	public void setCustid(BigDecimal custid);

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
	public String getCustname();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getCustname <em>Custname</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Custname</em>' attribute.
	 * @see #getCustname()
	 */
	public void setCustname(String custname);

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
	public String getCustnum();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getCustnum <em>Custnum</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Custnum</em>' attribute.
	 * @see #getCustnum()
	 */
	public void setCustnum(String custnum);

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
	public String getCusttype();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getCusttype <em>Custtype</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Custtype</em>' attribute.
	 * @see #getCusttype()
	 */
	public void setCusttype(String custtype);

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
	public String getAddress();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getAddress <em>Address</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Address</em>' attribute.
	 * @see #getAddress()
	 */
	public void setAddress(String address);

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
	public String getPostcode();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getPostcode <em>Postcode</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Postcode</em>' attribute.
	 * @see #getPostcode()
	 */
	public void setPostcode(String postcode);

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
	public String getTelephone();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getTelephone <em>Telephone</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Telephone</em>' attribute.
	 * @see #getTelephone()
	 */
	public void setTelephone(String telephone);

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
	public String getFax();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getFax <em>Fax</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Fax</em>' attribute.
	 * @see #getFax()
	 */
	public void setFax(String fax);

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
	public String getWebsite();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getWebsite <em>Website</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Website</em>' attribute.
	 * @see #getWebsite()
	 */
	public void setWebsite(String website);

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
	public String getComments();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getComments <em>Comments</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Comments</em>' attribute.
	 * @see #getComments()
	 */
	public void setComments(String comments);

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
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getCreateDate <em>CreateDate</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>CreateDate</em>' attribute.
	 * @see #getCreateDate()
	 */
	public void setCreateDate(Date createDate);

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
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getCreateUserid <em>CreateUserid</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>CreateUserid</em>' attribute.
	 * @see #getCreateUserid()
	 */
	public void setCreateUserid(String createUserid);

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
	public String getCustmanager();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getCustmanager <em>Custmanager</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Custmanager</em>' attribute.
	 * @see #getCustmanager()
	 */
	public void setCustmanager(String custmanager);

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
	public String getAccoutbank();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getAccoutbank <em>Accoutbank</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Accoutbank</em>' attribute.
	 * @see #getAccoutbank()
	 */
	public void setAccoutbank(String accoutbank);

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
	public String getAccoutname();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getAccoutname <em>Accoutname</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Accoutname</em>' attribute.
	 * @see #getAccoutname()
	 */
	public void setAccoutname(String accoutname);

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
	public String getTaxnumb();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getTaxnumb <em>Taxnumb</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Taxnumb</em>' attribute.
	 * @see #getTaxnumb()
	 */
	public void setTaxnumb(String taxnumb);

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
	public String getAccountid();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getAccountid <em>Accountid</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Accountid</em>' attribute.
	 * @see #getAccountid()
	 */
	public void setAccountid(String accountid);

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
	public String getStatus();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getStatus <em>Status</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Status</em>' attribute.
	 * @see #getStatus()
	 */
	public void setStatus(String status);

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
	public String getCustnature();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getCustnature <em>Custnature</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Custnature</em>' attribute.
	 * @see #getCustnature()
	 */
	public void setCustnature(String custnature);

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
	public String getLicense();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getLicense <em>License</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>License</em>' attribute.
	 * @see #getLicense()
	 */
	public void setLicense(String license);

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
	public Date getLicenseenddate();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getLicenseenddate <em>Licenseenddate</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Licenseenddate</em>' attribute.
	 * @see #getLicenseenddate()
	 */
	public void setLicenseenddate(Date licenseenddate);

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
	public String getLegalperson();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getLegalperson <em>Legalperson</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Legalperson</em>' attribute.
	 * @see #getLegalperson()
	 */
	public void setLegalperson(String legalperson);

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
	public String getOrgnum();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getOrgnum <em>Orgnum</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Orgnum</em>' attribute.
	 * @see #getOrgnum()
	 */
	public void setOrgnum(String orgnum);

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
	public BigDecimal getRegistercap();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getRegistercap <em>Registercap</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Registercap</em>' attribute.
	 * @see #getRegistercap()
	 */
	public void setRegistercap(BigDecimal registercap);

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
	public String getCompdesc();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getCompdesc <em>Compdesc</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Compdesc</em>' attribute.
	 * @see #getCompdesc()
	 */
	public void setCompdesc(String compdesc);

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
	public String getThreeago();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getThreeago <em>Threeago</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Threeago</em>' attribute.
	 * @see #getThreeago()
	 */
	public void setThreeago(String threeago);

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
	public BigDecimal getThreeagoincome();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getThreeagoincome <em>Threeagoincome</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Threeagoincome</em>' attribute.
	 * @see #getThreeagoincome()
	 */
	public void setThreeagoincome(BigDecimal threeagoincome);

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
	public BigDecimal getThreeagoprofit();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getThreeagoprofit <em>Threeagoprofit</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Threeagoprofit</em>' attribute.
	 * @see #getThreeagoprofit()
	 */
	public void setThreeagoprofit(BigDecimal threeagoprofit);

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
	public String getTwoago();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getTwoago <em>Twoago</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Twoago</em>' attribute.
	 * @see #getTwoago()
	 */
	public void setTwoago(String twoago);

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
	public BigDecimal getTwoagoincome();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getTwoagoincome <em>Twoagoincome</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Twoagoincome</em>' attribute.
	 * @see #getTwoagoincome()
	 */
	public void setTwoagoincome(BigDecimal twoagoincome);

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
	public BigDecimal getTwoagoprofit();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getTwoagoprofit <em>Twoagoprofit</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Twoagoprofit</em>' attribute.
	 * @see #getTwoagoprofit()
	 */
	public void setTwoagoprofit(BigDecimal twoagoprofit);

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
	public String getLastyear();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getLastyear <em>Lastyear</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Lastyear</em>' attribute.
	 * @see #getLastyear()
	 */
	public void setLastyear(String lastyear);

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
	public BigDecimal getLastyearincome();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getLastyearincome <em>Lastyearincome</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Lastyearincome</em>' attribute.
	 * @see #getLastyearincome()
	 */
	public void setLastyearincome(BigDecimal lastyearincome);

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
	public BigDecimal getLastyearprofit();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getLastyearprofit <em>Lastyearprofit</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Lastyearprofit</em>' attribute.
	 * @see #getLastyearprofit()
	 */
	public void setLastyearprofit(BigDecimal lastyearprofit);

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
	public BigDecimal getLastproperty();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getLastproperty <em>Lastproperty</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Lastproperty</em>' attribute.
	 * @see #getLastproperty()
	 */
	public void setLastproperty(BigDecimal lastproperty);

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
	public BigDecimal getLastpropertynet();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getLastpropertynet <em>Lastpropertynet</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Lastpropertynet</em>' attribute.
	 * @see #getLastpropertynet()
	 */
	public void setLastpropertynet(BigDecimal lastpropertynet);

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
	public BigDecimal getLastfloat();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getLastfloat <em>Lastfloat</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Lastfloat</em>' attribute.
	 * @see #getLastfloat()
	 */
	public void setLastfloat(BigDecimal lastfloat);

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
	public BigDecimal getLastlongdebt();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getLastlongdebt <em>Lastlongdebt</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Lastlongdebt</em>' attribute.
	 * @see #getLastlongdebt()
	 */
	public void setLastlongdebt(BigDecimal lastlongdebt);

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
	public BigDecimal getLastshortdebt();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getLastshortdebt <em>Lastshortdebt</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Lastshortdebt</em>' attribute.
	 * @see #getLastshortdebt()
	 */
	public void setLastshortdebt(BigDecimal lastshortdebt);

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
	public BigDecimal getLastnetprofit();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getLastnetprofit <em>Lastnetprofit</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Lastnetprofit</em>' attribute.
	 * @see #getLastnetprofit()
	 */
	public void setLastnetprofit(BigDecimal lastnetprofit);

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
	public String getMainprod();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getMainprod <em>Mainprod</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Mainprod</em>' attribute.
	 * @see #getMainprod()
	 */
	public void setMainprod(String mainprod);

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
	public String getAgentprod();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getAgentprod <em>Agentprod</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Agentprod</em>' attribute.
	 * @see #getAgentprod()
	 */
	public void setAgentprod(String agentprod);

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
	public String getQualify1();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getQualify1 <em>Qualify1</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Qualify1</em>' attribute.
	 * @see #getQualify1()
	 */
	public void setQualify1(String qualify1);

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
	public Date getQualify1exp();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getQualify1exp <em>Qualify1exp</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Qualify1exp</em>' attribute.
	 * @see #getQualify1exp()
	 */
	public void setQualify1exp(Date qualify1exp);

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
	public String getQualify2();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getQualify2 <em>Qualify2</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Qualify2</em>' attribute.
	 * @see #getQualify2()
	 */
	public void setQualify2(String qualify2);

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
	public Date getQualify2exp();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getQualify2exp <em>Qualify2exp</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Qualify2exp</em>' attribute.
	 * @see #getQualify2exp()
	 */
	public void setQualify2exp(Date qualify2exp);

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
	public String getQualify3();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getQualify3 <em>Qualify3</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Qualify3</em>' attribute.
	 * @see #getQualify3()
	 */
	public void setQualify3(String qualify3);

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
	public Date getQualify3exp();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getQualify3exp <em>Qualify3exp</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Qualify3exp</em>' attribute.
	 * @see #getQualify3exp()
	 */
	public void setQualify3exp(Date qualify3exp);

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
	public String getQualifycomm();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getQualifycomm <em>Qualifycomm</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Qualifycomm</em>' attribute.
	 * @see #getQualifycomm()
	 */
	public void setQualifycomm(String qualifycomm);

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
	public String getSuppliersname();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getSuppliersname <em>Suppliersname</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Suppliersname</em>' attribute.
	 * @see #getSuppliersname()
	 */
	public void setSuppliersname(String suppliersname);

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
	public String getInfoprovider();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getInfoprovider <em>Infoprovider</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Infoprovider</em>' attribute.
	 * @see #getInfoprovider()
	 */
	public void setInfoprovider(String infoprovider);

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
	public String getLinkman();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getLinkman <em>Linkman</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Linkman</em>' attribute.
	 * @see #getLinkman()
	 */
	public void setLinkman(String linkman);

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
	public String getLinktel();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getLinktel <em>Linktel</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Linktel</em>' attribute.
	 * @see #getLinktel()
	 */
	public void setLinktel(String linktel);

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
	public String getLinkmail();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getLinkmail <em>Linkmail</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Linkmail</em>' attribute.
	 * @see #getLinkmail()
	 */
	public void setLinkmail(String linkmail);

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
	public String getRegistcity();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getRegistcity <em>Registcity</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Registcity</em>' attribute.
	 * @see #getRegistcity()
	 */
	public void setRegistcity(String registcity);

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
	public String getIstaxpayer();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getIstaxpayer <em>Istaxpayer</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Istaxpayer</em>' attribute.
	 * @see #getIstaxpayer()
	 */
	public void setIstaxpayer(String istaxpayer);

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
	public Date getEstabdate();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getEstabdate <em>Estabdate</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Estabdate</em>' attribute.
	 * @see #getEstabdate()
	 */
	public void setEstabdate(Date estabdate);

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
	public String getRegistaddress();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getRegistaddress <em>Registaddress</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Registaddress</em>' attribute.
	 * @see #getRegistaddress()
	 */
	public void setRegistaddress(String registaddress);

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
	public String getTaxno();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getTaxno <em>Taxno</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Taxno</em>' attribute.
	 * @see #getTaxno()
	 */
	public void setTaxno(String taxno);

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
	public BigDecimal getCappay();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getCappay <em>Cappay</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Cappay</em>' attribute.
	 * @see #getCappay()
	 */
	public void setCappay(BigDecimal cappay);

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
	public String getEmpsize();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getEmpsize <em>Empsize</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Empsize</em>' attribute.
	 * @see #getEmpsize()
	 */
	public void setEmpsize(String empsize);

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
	public BigDecimal getProcessinstid();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getProcessinstid <em>Processinstid</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Processinstid</em>' attribute.
	 * @see #getProcessinstid()
	 */
	public void setProcessinstid(BigDecimal processinstid);

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
	public String getCvencode();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getCvencode <em>Cvencode</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Cvencode</em>' attribute.
	 * @see #getCvencode()
	 */
	public void setCvencode(String cvencode);

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
	public String getServtype();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getServtype <em>Servtype</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Servtype</em>' attribute.
	 * @see #getServtype()
	 */
	public void setServtype(String servtype);

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
	public String getLocservcity();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getLocservcity <em>Locservcity</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Locservcity</em>' attribute.
	 * @see #getLocservcity()
	 */
	public void setLocservcity(String locservcity);

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
	public BigDecimal getDycustid();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getDycustid <em>Dycustid</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Dycustid</em>' attribute.
	 * @see #getDycustid()
	 */
	public void setDycustid(BigDecimal dycustid);

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
	public String getReindex();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getReindex <em>Reindex</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Reindex</em>' attribute.
	 * @see #getReindex()
	 */
	public void setReindex(String reindex);

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
	public String getInflag();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getInflag <em>Inflag</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Inflag</em>' attribute.
	 * @see #getInflag()
	 */
	public void setInflag(String inflag);

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
	public String getCvenname();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getCvenname <em>Cvenname</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Cvenname</em>' attribute.
	 * @see #getCvenname()
	 */
	public void setCvenname(String cvenname);

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
	public String getIsqualified();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getIsqualified <em>Isqualified</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Isqualified</em>' attribute.
	 * @see #getIsqualified()
	 */
	public void setIsqualified(String isqualified);

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
	public String getAppraise();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getAppraise <em>Appraise</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Appraise</em>' attribute.
	 * @see #getAppraise()
	 */
	public void setAppraise(String appraise);

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
	public String getInspect();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getInspect <em>Inspect</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Inspect</em>' attribute.
	 * @see #getInspect()
	 */
	public void setInspect(String inspect);

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
	public String getMisconduct();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getMisconduct <em>Misconduct</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Misconduct</em>' attribute.
	 * @see #getMisconduct()
	 */
	public void setMisconduct(String misconduct);

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
	public String getBlacklist();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getBlacklist <em>Blacklist</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Blacklist</em>' attribute.
	 * @see #getBlacklist()
	 */
	public void setBlacklist(String blacklist);

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
	public String getIsgroupqualified();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.payContract.payContract.PurSupplier#getIsgroupqualified <em>Isgroupqualified</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Isgroupqualified</em>' attribute.
	 * @see #getIsgroupqualified()
	 */
	public void setIsgroupqualified(String isgroupqualified);


}