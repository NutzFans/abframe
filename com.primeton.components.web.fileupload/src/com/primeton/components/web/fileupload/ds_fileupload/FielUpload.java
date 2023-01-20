/*******************************************************************************
 *
 * Copyright (c) 2001-2006 Primeton Technologies, Ltd.
 * All rights reserved.
 *
 * Created on Apr 11, 2008
 *******************************************************************************/
package com.primeton.components.web.fileupload.ds_fileupload;

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
 *   <li>{@link com.primeton.components.web.fileupload.ds_fileupload.FielUpload#getFileId <em>FileId</em>}</li>
 *   <li>{@link com.primeton.components.web.fileupload.ds_fileupload.FielUpload#getFileName <em>FileName</em>}</li>
 *   <li>{@link com.primeton.components.web.fileupload.ds_fileupload.FielUpload#getFileData <em>FileData</em>}</li>
 *   <li>{@link com.primeton.components.web.fileupload.ds_fileupload.FielUpload#getFilePath <em>FilePath</em>}</li>
 *   <li>{@link com.primeton.components.web.fileupload.ds_fileupload.FielUpload#getUploadUser <em>UploadUser</em>}</li>
 *   <li>{@link com.primeton.components.web.fileupload.ds_fileupload.FielUpload#getUploadTime <em>UploadTime</em>}</li>
 *   <li>{@link com.primeton.components.web.fileupload.ds_fileupload.FielUpload#getSaveType <em>SaveType</em>}</li>
 *   <li>{@link com.primeton.components.web.fileupload.ds_fileupload.FielUpload#getContentType <em>ContentType</em>}</li>
 *   <li>{@link com.primeton.components.web.fileupload.ds_fileupload.FielUpload#getClientFileName <em>ClientFileName</em>}</li>
 *   <li>{@link com.primeton.components.web.fileupload.ds_fileupload.FielUpload#getClientPath <em>ClientPath</em>}</li>
 *   <li>{@link com.primeton.components.web.fileupload.ds_fileupload.FielUpload#getName <em>Name</em>}</li>
 *   <li>{@link com.primeton.components.web.fileupload.ds_fileupload.FielUpload#getSize <em>Size</em>}</li>
 * </ul>
 * </p>
 *
 * @extends DataObject;
 */
public interface FielUpload extends DataObject {

	public final static String QNAME = "com.primeton.components.web.fileupload.ds_fileupload.FielUpload";

	public final static Type TYPE = TypeHelper.INSTANCE.getType("com.primeton.components.web.fileupload.ds_fileupload", "FielUpload");

	public final static IObjectFactory<FielUpload> FACTORY = new IObjectFactory<FielUpload>() {
		public FielUpload create() {
			return (FielUpload) DataFactory.INSTANCE.create(TYPE);
		}
	};

	/**
	 * Returns the value of the '<em><b>FileId</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>FileId</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>FileId</em>' attribute.
	 * @see #setFileId(java.lang.String)
	 */
	public String getFileId();

	/**
	 * Sets the value of the '{@link com.primeton.components.web.fileupload.ds_fileupload.FielUpload#getFileId <em>FileId</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>FileId</em>' attribute.
	 * @see #getFileId()
	 */
	public void setFileId(String fileId);

	/**
	 * Returns the value of the '<em><b>FileName</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>FileName</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>FileName</em>' attribute.
	 * @see #setFileName(java.lang.String)
	 */
	public String getFileName();

	/**
	 * Sets the value of the '{@link com.primeton.components.web.fileupload.ds_fileupload.FielUpload#getFileName <em>FileName</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>FileName</em>' attribute.
	 * @see #getFileName()
	 */
	public void setFileName(String fileName);

	/**
	 * Returns the value of the '<em><b>FileData</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>FileData</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>FileData</em>' attribute.
	 * @see #setFileData(byte[])
	 */
	public byte[] getFileData();

	/**
	 * Sets the value of the '{@link com.primeton.components.web.fileupload.ds_fileupload.FielUpload#getFileData <em>FileData</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>FileData</em>' attribute.
	 * @see #getFileData()
	 */
	public void setFileData(byte[] fileData);

	/**
	 * Returns the value of the '<em><b>FilePath</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>FilePath</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>FilePath</em>' attribute.
	 * @see #setFilePath(java.lang.String)
	 */
	public String getFilePath();

	/**
	 * Sets the value of the '{@link com.primeton.components.web.fileupload.ds_fileupload.FielUpload#getFilePath <em>FilePath</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>FilePath</em>' attribute.
	 * @see #getFilePath()
	 */
	public void setFilePath(String filePath);

	/**
	 * Returns the value of the '<em><b>UploadUser</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>UploadUser</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>UploadUser</em>' attribute.
	 * @see #setUploadUser(java.lang.String)
	 */
	public String getUploadUser();

	/**
	 * Sets the value of the '{@link com.primeton.components.web.fileupload.ds_fileupload.FielUpload#getUploadUser <em>UploadUser</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>UploadUser</em>' attribute.
	 * @see #getUploadUser()
	 */
	public void setUploadUser(String uploadUser);

	/**
	 * Returns the value of the '<em><b>UploadTime</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>UploadTime</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>UploadTime</em>' attribute.
	 * @see #setUploadTime(java.util.Date)
	 */
	public Date getUploadTime();

	/**
	 * Sets the value of the '{@link com.primeton.components.web.fileupload.ds_fileupload.FielUpload#getUploadTime <em>UploadTime</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>UploadTime</em>' attribute.
	 * @see #getUploadTime()
	 */
	public void setUploadTime(Date uploadTime);

	/**
	 * Returns the value of the '<em><b>SaveType</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>SaveType</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>SaveType</em>' attribute.
	 * @see #setSaveType(int)
	 */
	public int getSaveType();

	/**
	 * Sets the value of the '{@link com.primeton.components.web.fileupload.ds_fileupload.FielUpload#getSaveType <em>SaveType</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>SaveType</em>' attribute.
	 * @see #getSaveType()
	 */
	public void setSaveType(int saveType);

	/**
	 * Returns the value of the '<em><b>ContentType</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>ContentType</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>ContentType</em>' attribute.
	 * @see #setContentType(java.lang.String)
	 */
	public String getContentType();

	/**
	 * Sets the value of the '{@link com.primeton.components.web.fileupload.ds_fileupload.FielUpload#getContentType <em>ContentType</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>ContentType</em>' attribute.
	 * @see #getContentType()
	 */
	public void setContentType(String contentType);

	/**
	 * Returns the value of the '<em><b>ClientFileName</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>ClientFileName</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>ClientFileName</em>' attribute.
	 * @see #setClientFileName(java.lang.String)
	 */
	public String getClientFileName();

	/**
	 * Sets the value of the '{@link com.primeton.components.web.fileupload.ds_fileupload.FielUpload#getClientFileName <em>ClientFileName</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>ClientFileName</em>' attribute.
	 * @see #getClientFileName()
	 */
	public void setClientFileName(String clientFileName);

	/**
	 * Returns the value of the '<em><b>ClientPath</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>ClientPath</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>ClientPath</em>' attribute.
	 * @see #setClientPath(java.lang.String)
	 */
	public String getClientPath();

	/**
	 * Sets the value of the '{@link com.primeton.components.web.fileupload.ds_fileupload.FielUpload#getClientPath <em>ClientPath</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>ClientPath</em>' attribute.
	 * @see #getClientPath()
	 */
	public void setClientPath(String clientPath);

	/**
	 * Returns the value of the '<em><b>Name</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Name</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Name</em>' attribute.
	 * @see #setName(java.lang.String)
	 */
	public String getName();

	/**
	 * Sets the value of the '{@link com.primeton.components.web.fileupload.ds_fileupload.FielUpload#getName <em>Name</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Name</em>' attribute.
	 * @see #getName()
	 */
	public void setName(String name);

	/**
	 * Returns the value of the '<em><b>Size</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Size</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Size</em>' attribute.
	 * @see #setSize(long)
	 */
	public long getSize();

	/**
	 * Sets the value of the '{@link com.primeton.components.web.fileupload.ds_fileupload.FielUpload#getSize <em>Size</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Size</em>' attribute.
	 * @see #getSize()
	 */
	public void setSize(long size);


}