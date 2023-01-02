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

/**
 * <!-- begin-user-doc -->
 * A representation of the model object '<em><b>Test</b></em>'.
 * <!-- end-user-doc -->
 *
 * <p>
 * The following features are supported:
 * <ul>
 *   <li>{@link com.primeton.ame.schindler.org.OmEmporgCopy1#getOrgid <em>Orgid</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.OmEmporgCopy1#getEmpid <em>Empid</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.OmEmporgCopy1#getIsmain <em>Ismain</em>}</li>
 *   <li>{@link com.primeton.ame.schindler.org.OmEmporgCopy1#getEmpprop <em>Empprop</em>}</li>
 * </ul>
 * </p>
 *
 * @extends DataObject;
 */
public interface OmEmporgCopy1 extends DataObject {

	public static final String QNAME = "com.primeton.ame.schindler.org.OmEmporgCopy1";

	public static final Type TYPE = TypeHelper.INSTANCE.getType("com.primeton.ame.schindler.org", "OmEmporgCopy1");

	public static final IObjectFactory<OmEmporgCopy1> FACTORY = new IObjectFactory<OmEmporgCopy1>() {
		public OmEmporgCopy1 create() {
			return (OmEmporgCopy1) DataFactory.INSTANCE.create(TYPE);
		}
	};

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
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.OmEmporgCopy1#getOrgid <em>Orgid</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Orgid</em>' attribute.
	 * @see #getOrgid()
	 */
	public void setOrgid(BigDecimal orgid);

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
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.OmEmporgCopy1#getEmpid <em>Empid</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Empid</em>' attribute.
	 * @see #getEmpid()
	 */
	public void setEmpid(BigDecimal empid);

	/**
	 * Returns the value of the '<em><b>Ismain</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Ismain</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Ismain</em>' attribute.
	 * @see #setIsmain(java.lang.String)
	 */
	public String getIsmain();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.OmEmporgCopy1#getIsmain <em>Ismain</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Ismain</em>' attribute.
	 * @see #getIsmain()
	 */
	public void setIsmain(String ismain);

	/**
	 * Returns the value of the '<em><b>Empprop</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Empprop</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Empprop</em>' attribute.
	 * @see #setEmpprop(java.math.BigDecimal)
	 */
	public BigDecimal getEmpprop();

	/**
	 * Sets the value of the '{@link com.primeton.ame.schindler.org.OmEmporgCopy1#getEmpprop <em>Empprop</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Empprop</em>' attribute.
	 * @see #getEmpprop()
	 */
	public void setEmpprop(BigDecimal empprop);


}