/*******************************************************************************
 *
 * Copyright (c) 2001-2006 Primeton Technologies, Ltd.
 * All rights reserved.
 *
 * Created on Apr 11, 2008
 *******************************************************************************/
package com.primeton.components.web.fileupload.ds_fileupload.impl;

import com.primeton.components.web.fileupload.ds_fileupload.FielUpload;
import com.primeton.ext.data.sdo.DataUtil;
import com.primeton.ext.data.sdo.ExtendedDataObjectImpl;

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
 *   <li>{@link com.primeton.components.web.fileupload.ds_fileupload.impl.FielUploadImpl#getFileId <em>FileId</em>}</li>
 *   <li>{@link com.primeton.components.web.fileupload.ds_fileupload.impl.FielUploadImpl#getFileName <em>FileName</em>}</li>
 *   <li>{@link com.primeton.components.web.fileupload.ds_fileupload.impl.FielUploadImpl#getFileData <em>FileData</em>}</li>
 *   <li>{@link com.primeton.components.web.fileupload.ds_fileupload.impl.FielUploadImpl#getFilePath <em>FilePath</em>}</li>
 *   <li>{@link com.primeton.components.web.fileupload.ds_fileupload.impl.FielUploadImpl#getUploadUser <em>UploadUser</em>}</li>
 *   <li>{@link com.primeton.components.web.fileupload.ds_fileupload.impl.FielUploadImpl#getUploadTime <em>UploadTime</em>}</li>
 *   <li>{@link com.primeton.components.web.fileupload.ds_fileupload.impl.FielUploadImpl#getSaveType <em>SaveType</em>}</li>
 *   <li>{@link com.primeton.components.web.fileupload.ds_fileupload.impl.FielUploadImpl#getContentType <em>ContentType</em>}</li>
 *   <li>{@link com.primeton.components.web.fileupload.ds_fileupload.impl.FielUploadImpl#getClientFileName <em>ClientFileName</em>}</li>
 *   <li>{@link com.primeton.components.web.fileupload.ds_fileupload.impl.FielUploadImpl#getClientPath <em>ClientPath</em>}</li>
 *   <li>{@link com.primeton.components.web.fileupload.ds_fileupload.impl.FielUploadImpl#getName <em>Name</em>}</li>
 *   <li>{@link com.primeton.components.web.fileupload.ds_fileupload.impl.FielUploadImpl#getSize <em>Size</em>}</li>
 * </ul>
 * </p>
 *
 * @extends ExtendedDataObjectImpl;
 *
 * @implements FielUpload;
 */

public class FielUploadImpl extends ExtendedDataObjectImpl implements FielUpload {
	/**
	 * Comment for <code>serialVersionUID</code>
	 */
	private static final long serialVersionUID = 1L;
	public final static int INDEX_FILEID = 0;
	public final static int INDEX_FILENAME = 1;
	public final static int INDEX_FILEDATA = 2;
	public final static int INDEX_FILEPATH = 3;
	public final static int INDEX_UPLOADUSER = 4;
	public final static int INDEX_UPLOADTIME = 5;
	public final static int INDEX_SAVETYPE = 6;
	public final static int INDEX_CONTENTTYPE = 7;
	public final static int INDEX_CLIENTFILENAME = 8;
	public final static int INDEX_CLIENTPATH = 9;
	public final static int INDEX_NAME = 10;
	public final static int INDEX_SIZE = 11;
	public final static int SDO_PROPERTY_COUNT = 12;

	public final static int EXTENDED_PROPERTY_COUNT = -1;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 */
	public FielUploadImpl() {
		this(TYPE);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 */
	public FielUploadImpl(Type type) {
		super(type);
	}

	protected void validate() {
		validateType(TYPE);
	}

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
	public String getFileId() {
		return DataUtil.toString(super.getByIndex(INDEX_FILEID, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getFileId <em>FileId</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>FileId</em>' attribute.
	 * @see #getFileId()
	 */
	public void setFileId(String fileId) {
		super.setByIndex(INDEX_FILEID, fileId);
	}

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
	public String getFileName() {
		return DataUtil.toString(super.getByIndex(INDEX_FILENAME, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getFileName <em>FileName</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>FileName</em>' attribute.
	 * @see #getFileName()
	 */
	public void setFileName(String fileName) {
		super.setByIndex(INDEX_FILENAME, fileName);
	}

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
	public byte[] getFileData() {
		return DataUtil.toBytes(super.getByIndex(INDEX_FILEDATA, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getFileData <em>FileData</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>FileData</em>' attribute.
	 * @see #getFileData()
	 */
	public void setFileData(byte[] fileData) {
		super.setByIndex(INDEX_FILEDATA, fileData);
	}

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
	public String getFilePath() {
		return DataUtil.toString(super.getByIndex(INDEX_FILEPATH, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getFilePath <em>FilePath</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>FilePath</em>' attribute.
	 * @see #getFilePath()
	 */
	public void setFilePath(String filePath) {
		super.setByIndex(INDEX_FILEPATH, filePath);
	}

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
	public String getUploadUser() {
		return DataUtil.toString(super.getByIndex(INDEX_UPLOADUSER, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getUploadUser <em>UploadUser</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>UploadUser</em>' attribute.
	 * @see #getUploadUser()
	 */
	public void setUploadUser(String uploadUser) {
		super.setByIndex(INDEX_UPLOADUSER, uploadUser);
	}

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
	public Date getUploadTime() {
		return DataUtil.toDate(super.getByIndex(INDEX_UPLOADTIME, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getUploadTime <em>UploadTime</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>UploadTime</em>' attribute.
	 * @see #getUploadTime()
	 */
	public void setUploadTime(Date uploadTime) {
		super.setByIndex(INDEX_UPLOADTIME, uploadTime);
	}

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
	public int getSaveType() {
		return DataUtil.toInt(super.getByIndex(INDEX_SAVETYPE, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getSaveType <em>SaveType</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>SaveType</em>' attribute.
	 * @see #getSaveType()
	 */
	public void setSaveType(int saveType) {
		super.setByIndex(INDEX_SAVETYPE, saveType);
	}

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
	public String getContentType() {
		return DataUtil.toString(super.getByIndex(INDEX_CONTENTTYPE, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getContentType <em>ContentType</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>ContentType</em>' attribute.
	 * @see #getContentType()
	 */
	public void setContentType(String contentType) {
		super.setByIndex(INDEX_CONTENTTYPE, contentType);
	}

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
	public String getClientFileName() {
		return DataUtil.toString(super.getByIndex(INDEX_CLIENTFILENAME, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getClientFileName <em>ClientFileName</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>ClientFileName</em>' attribute.
	 * @see #getClientFileName()
	 */
	public void setClientFileName(String clientFileName) {
		super.setByIndex(INDEX_CLIENTFILENAME, clientFileName);
	}

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
	public String getClientPath() {
		return DataUtil.toString(super.getByIndex(INDEX_CLIENTPATH, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getClientPath <em>ClientPath</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>ClientPath</em>' attribute.
	 * @see #getClientPath()
	 */
	public void setClientPath(String clientPath) {
		super.setByIndex(INDEX_CLIENTPATH, clientPath);
	}

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
	public String getName() {
		return DataUtil.toString(super.getByIndex(INDEX_NAME, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getName <em>Name</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Name</em>' attribute.
	 * @see #getName()
	 */
	public void setName(String name) {
		super.setByIndex(INDEX_NAME, name);
	}

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
	public long getSize() {
		return DataUtil.toLong(super.getByIndex(INDEX_SIZE, true));
	}

	/**
	 * Sets the value of the '{@link com.primeton.eos.Test#getSize <em>Size</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Size</em>' attribute.
	 * @see #getSize()
	 */
	public void setSize(long size) {
		super.setByIndex(INDEX_SIZE, size);
	}


}