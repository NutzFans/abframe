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
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getCustid <em>Custid</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getCustname <em>Custname</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getCustnum <em>Custnum</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getCusttype <em>Custtype</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getIsoem <em>Isoem</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getAddress <em>Address</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getPostcode <em>Postcode</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getTelephone <em>Telephone</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getFax <em>Fax</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getWebsite <em>Website</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getGrade <em>Grade</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getComments <em>Comments</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getCreateDate <em>CreateDate</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getCreateUserid <em>CreateUserid</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getCustmanager <em>Custmanager</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getAccoutbank <em>Accoutbank</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getAccoutname <em>Accoutname</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getTaxnumb <em>Taxnumb</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getAccountid <em>Accountid</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getStatus <em>Status</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getCustnature <em>Custnature</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getLicense <em>License</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getLicenseenddate <em>Licenseenddate</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getLegalperson <em>Legalperson</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getOrgnum <em>Orgnum</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getRegistercap <em>Registercap</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getServphone <em>Servphone</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getCompnum <em>Compnum</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getServnum <em>Servnum</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getBusiscope <em>Busiscope</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getSuborg <em>Suborg</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getCompdesc <em>Compdesc</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getThreeago <em>Threeago</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getThreeagoincome <em>Threeagoincome</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getThreeagoprofit <em>Threeagoprofit</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getTwoago <em>Twoago</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getTwoagoincome <em>Twoagoincome</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getTwoagoprofit <em>Twoagoprofit</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getLastyear <em>Lastyear</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getLastyearincome <em>Lastyearincome</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getLastyearprofit <em>Lastyearprofit</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getLastproperty <em>Lastproperty</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getLastpropertynet <em>Lastpropertynet</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getLastfloat <em>Lastfloat</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getLastlongdebt <em>Lastlongdebt</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getLastshortdebt <em>Lastshortdebt</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getLastnetprofit <em>Lastnetprofit</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getMainprod <em>Mainprod</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getAgentprod <em>Agentprod</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getQualify1 <em>Qualify1</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getQualify1exp <em>Qualify1exp</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getQualify2 <em>Qualify2</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getQualify2exp <em>Qualify2exp</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getQualify3 <em>Qualify3</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getQualify3exp <em>Qualify3exp</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getQualifycomm <em>Qualifycomm</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getIssupplier <em>Issupplier</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getCustjc <em>Custjc</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getGroupno <em>Groupno</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getLedgercustid <em>Ledgercustid</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getLedgercustname <em>Ledgercustname</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getEnglishName <em>EnglishName</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getContacts <em>Contacts</em>}</li>
 *   <li>{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getCustomertype <em>Customertype</em>}</li>
 * </ul>
 * </p>
 *
 * @extends DataObject;
 */
public interface MisCustinfo extends DataObject {

	public static final String QNAME = "com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo";

	public static final Type TYPE = TypeHelper.INSTANCE.getType("com.zhonghe.ame.chargeContract.chargeContract", "MisCustinfo");

	public static final IObjectFactory<MisCustinfo> FACTORY = new IObjectFactory<MisCustinfo>() {
		public MisCustinfo create() {
			return (MisCustinfo) DataFactory.INSTANCE.create(TYPE);
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
	 * Sets the value of the '{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getCustid <em>Custid</em>}' attribute.
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
	 * Sets the value of the '{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getCustname <em>Custname</em>}' attribute.
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
	 * Sets the value of the '{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getCustnum <em>Custnum</em>}' attribute.
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
	 * Sets the value of the '{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getCusttype <em>Custtype</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Custtype</em>' attribute.
	 * @see #getCusttype()
	 */
	public void setCusttype(String custtype);

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
	public String getIsoem();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getIsoem <em>Isoem</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Isoem</em>' attribute.
	 * @see #getIsoem()
	 */
	public void setIsoem(String isoem);

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
	 * Sets the value of the '{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getAddress <em>Address</em>}' attribute.
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
	 * Sets the value of the '{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getPostcode <em>Postcode</em>}' attribute.
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
	 * Sets the value of the '{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getTelephone <em>Telephone</em>}' attribute.
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
	 * Sets the value of the '{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getFax <em>Fax</em>}' attribute.
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
	 * Sets the value of the '{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getWebsite <em>Website</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Website</em>' attribute.
	 * @see #getWebsite()
	 */
	public void setWebsite(String website);

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
	public String getGrade();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getGrade <em>Grade</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Grade</em>' attribute.
	 * @see #getGrade()
	 */
	public void setGrade(String grade);

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
	 * Sets the value of the '{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getComments <em>Comments</em>}' attribute.
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
	 * Sets the value of the '{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getCreateDate <em>CreateDate</em>}' attribute.
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
	 * Sets the value of the '{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getCreateUserid <em>CreateUserid</em>}' attribute.
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
	 * Sets the value of the '{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getCustmanager <em>Custmanager</em>}' attribute.
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
	 * Sets the value of the '{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getAccoutbank <em>Accoutbank</em>}' attribute.
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
	 * Sets the value of the '{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getAccoutname <em>Accoutname</em>}' attribute.
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
	 * Sets the value of the '{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getTaxnumb <em>Taxnumb</em>}' attribute.
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
	 * Sets the value of the '{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getAccountid <em>Accountid</em>}' attribute.
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
	 * Sets the value of the '{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getStatus <em>Status</em>}' attribute.
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
	 * Sets the value of the '{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getCustnature <em>Custnature</em>}' attribute.
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
	 * Sets the value of the '{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getLicense <em>License</em>}' attribute.
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
	 * Sets the value of the '{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getLicenseenddate <em>Licenseenddate</em>}' attribute.
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
	 * Sets the value of the '{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getLegalperson <em>Legalperson</em>}' attribute.
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
	 * Sets the value of the '{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getOrgnum <em>Orgnum</em>}' attribute.
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
	 * Sets the value of the '{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getRegistercap <em>Registercap</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Registercap</em>' attribute.
	 * @see #getRegistercap()
	 */
	public void setRegistercap(BigDecimal registercap);

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
	public String getServphone();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getServphone <em>Servphone</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Servphone</em>' attribute.
	 * @see #getServphone()
	 */
	public void setServphone(String servphone);

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
	public String getCompnum();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getCompnum <em>Compnum</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Compnum</em>' attribute.
	 * @see #getCompnum()
	 */
	public void setCompnum(String compnum);

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
	public String getServnum();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getServnum <em>Servnum</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Servnum</em>' attribute.
	 * @see #getServnum()
	 */
	public void setServnum(String servnum);

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
	public String getBusiscope();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getBusiscope <em>Busiscope</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Busiscope</em>' attribute.
	 * @see #getBusiscope()
	 */
	public void setBusiscope(String busiscope);

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
	public String getSuborg();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getSuborg <em>Suborg</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Suborg</em>' attribute.
	 * @see #getSuborg()
	 */
	public void setSuborg(String suborg);

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
	 * Sets the value of the '{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getCompdesc <em>Compdesc</em>}' attribute.
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
	 * Sets the value of the '{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getThreeago <em>Threeago</em>}' attribute.
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
	 * Sets the value of the '{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getThreeagoincome <em>Threeagoincome</em>}' attribute.
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
	 * Sets the value of the '{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getThreeagoprofit <em>Threeagoprofit</em>}' attribute.
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
	 * Sets the value of the '{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getTwoago <em>Twoago</em>}' attribute.
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
	 * Sets the value of the '{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getTwoagoincome <em>Twoagoincome</em>}' attribute.
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
	 * Sets the value of the '{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getTwoagoprofit <em>Twoagoprofit</em>}' attribute.
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
	 * Sets the value of the '{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getLastyear <em>Lastyear</em>}' attribute.
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
	 * Sets the value of the '{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getLastyearincome <em>Lastyearincome</em>}' attribute.
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
	 * Sets the value of the '{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getLastyearprofit <em>Lastyearprofit</em>}' attribute.
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
	 * Sets the value of the '{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getLastproperty <em>Lastproperty</em>}' attribute.
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
	 * Sets the value of the '{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getLastpropertynet <em>Lastpropertynet</em>}' attribute.
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
	 * Sets the value of the '{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getLastfloat <em>Lastfloat</em>}' attribute.
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
	 * Sets the value of the '{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getLastlongdebt <em>Lastlongdebt</em>}' attribute.
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
	 * Sets the value of the '{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getLastshortdebt <em>Lastshortdebt</em>}' attribute.
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
	 * Sets the value of the '{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getLastnetprofit <em>Lastnetprofit</em>}' attribute.
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
	 * Sets the value of the '{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getMainprod <em>Mainprod</em>}' attribute.
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
	 * Sets the value of the '{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getAgentprod <em>Agentprod</em>}' attribute.
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
	 * Sets the value of the '{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getQualify1 <em>Qualify1</em>}' attribute.
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
	 * Sets the value of the '{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getQualify1exp <em>Qualify1exp</em>}' attribute.
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
	 * Sets the value of the '{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getQualify2 <em>Qualify2</em>}' attribute.
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
	 * Sets the value of the '{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getQualify2exp <em>Qualify2exp</em>}' attribute.
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
	 * Sets the value of the '{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getQualify3 <em>Qualify3</em>}' attribute.
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
	 * Sets the value of the '{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getQualify3exp <em>Qualify3exp</em>}' attribute.
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
	 * Sets the value of the '{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getQualifycomm <em>Qualifycomm</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Qualifycomm</em>' attribute.
	 * @see #getQualifycomm()
	 */
	public void setQualifycomm(String qualifycomm);

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
	public String getIssupplier();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getIssupplier <em>Issupplier</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Issupplier</em>' attribute.
	 * @see #getIssupplier()
	 */
	public void setIssupplier(String issupplier);

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
	public String getCustjc();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getCustjc <em>Custjc</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Custjc</em>' attribute.
	 * @see #getCustjc()
	 */
	public void setCustjc(String custjc);

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
	public BigDecimal getGroupno();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getGroupno <em>Groupno</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Groupno</em>' attribute.
	 * @see #getGroupno()
	 */
	public void setGroupno(BigDecimal groupno);

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
	public String getLedgercustid();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getLedgercustid <em>Ledgercustid</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Ledgercustid</em>' attribute.
	 * @see #getLedgercustid()
	 */
	public void setLedgercustid(String ledgercustid);

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
	public String getLedgercustname();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getLedgercustname <em>Ledgercustname</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Ledgercustname</em>' attribute.
	 * @see #getLedgercustname()
	 */
	public void setLedgercustname(String ledgercustname);

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
	public String getEnglishName();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getEnglishName <em>EnglishName</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>EnglishName</em>' attribute.
	 * @see #getEnglishName()
	 */
	public void setEnglishName(String englishName);

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
	public String getContacts();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getContacts <em>Contacts</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Contacts</em>' attribute.
	 * @see #getContacts()
	 */
	public void setContacts(String contacts);

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
	public String getCustomertype();

	/**
	 * Sets the value of the '{@link com.zhonghe.ame.chargeContract.chargeContract.MisCustinfo#getCustomertype <em>Customertype</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Customertype</em>' attribute.
	 * @see #getCustomertype()
	 */
	public void setCustomertype(String customertype);


}