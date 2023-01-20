/*******************************************************************************
 * $Header: /cvsroot/MIS10/src/NEWERP/org.gocom.abframe.tools/src/org/gocom/abframe/tools/FileUploadUtil.java,v 1.4 2020/11/06 00:34:12 mengyy-ze Exp $
 * $Revision: 1.4 $
 * $Date: 2020/11/06 00:34:12 $
 *
 *==============================================================================
 *
 * Copyright (c) 2001-2006 Primeton Technologies, Ltd.
 * All rights reserved.
 * 
 * Created on 2008-11-27
 *******************************************************************************/


package org.gocom.abframe.tools;

import java.io.File;

import java.util.ArrayList;
import java.util.List;
import com.eos.foundation.common.utils.FileUtil;
import com.eos.system.annotation.Bizlet;
import com.eos.system.utility.StringUtil;
import com.primeton.ext.access.http.IUploadFile;

/**
 * 
 * 文件上传工具类
 *
 * @author 蔡述尧 
 * (mailto:caisy@primeton.com)
 */
/*
 * 修改历史
 * $Log: FileUploadUtil.java,v $
 * Revision 1.4  2020/11/06 00:34:12  mengyy-ze
 * �ϴ�������ʾ�ļ���С
 *
 * Revision 1.3  2019/11/01 01:02:14  jiaoyw
 * �ʼ�ģ���ϴ�����ʱ�������ϵ��ļ��뱾���ļ�����ͬ�������ְԱ������˽���ʼ�����ְ��֪��
 *
 * Revision 1.2  2013/09/10 10:02:26  huangqj
 * *** empty log message ***
 *
 * Revision 1.1  2013/06/02 19:53:23  huangqj
 * *** empty log message ***
 *
 * Revision 1.4  2010/12/01 03:22:41  caisy
 * 更改编码为UTF-8
 *
 * Revision 1.3  2010/11/30 16:12:51  caisy
 * 编码改为UTF-8
 *
 * Revision 1.2  2009/03/30 08:33:29  caisy
 * 代码规范
 *
 */
@Bizlet(value="文件上传工具类")
public class FileUploadUtil {
	
	
	@Bizlet(value="移动上传文件到指定的分类目录")
	public static void moveUploadFileToCatalog(String fileCatalog,IUploadFile[] uploadFiles){
		
		if(StringUtil.isNullOrBlank(fileCatalog))
			return ;
		for(IUploadFile uploadFile:uploadFiles){
			String catalogPath= uploadFile.getFilePath().substring(0, uploadFile.getFilePath().lastIndexOf(SystemInfo.FILE_SEPARATOR))+SystemInfo.FILE_SEPARATOR+fileCatalog;
			File catalogDir=new File(catalogPath);
			if(!catalogDir.exists()){
				catalogDir.mkdir();
			}
			File moveFile=new File(uploadFile.getFilePath());
			if(moveFile.exists()){
				File targetFile=new File(catalogPath+SystemInfo.FILE_SEPARATOR+getFileName(uploadFile.getFilePath()));
				if(targetFile.exists()){
					targetFile.delete();
				}
				FileUtil.moveFileToDir(uploadFile.getFilePath(), catalogPath);
			}
		}
	}
	
	@Bizlet(value="获取文件大小")
	public static Long[] getFileSize(IUploadFile[] uploadFiles){
		
		List<Long> list = new ArrayList<Long>();  
		
		for(IUploadFile uploadFile:uploadFiles){
			long filesize = uploadFile.getSize();
			list.add(filesize); 
		}
		Long[] arrayResult = (Long[]) list.toArray(new Long[list.size()]);  
		return arrayResult; 
	}
	
	/**
	 * 将上传文件移到指定目录，上传的文件名称保持不变。
	 * @param fileCatalog
	 * @param uploadFiles
	 */
	@Bizlet(value="移动上传文件（上传服务器的文件名不改变）移到到指定的分类目录")
	public static void moveUploadFileWithOriginalFileNameToCatalog(String fileCatalog,IUploadFile[] uploadFiles){
		if(StringUtil.isNullOrBlank(fileCatalog)){
			return ;
		}
		for(IUploadFile uploadFile:uploadFiles){
			String catalogPath= uploadFile.getFilePath().substring(0, uploadFile.getFilePath().lastIndexOf(SystemInfo.FILE_SEPARATOR))+SystemInfo.FILE_SEPARATOR+fileCatalog;
			File catalogDir=new File(catalogPath);
			if(!catalogDir.exists()){
				catalogDir.mkdir();
			}
			File moveFile=new File(uploadFile.getFilePath());
			if(moveFile.exists()){
				File targetFile=new File(catalogPath+SystemInfo.FILE_SEPARATOR+getFileName(uploadFile.getFilePath()));
				if(targetFile.exists()){
					targetFile.delete();
				}
				FileUtil.moveFileToDir(uploadFile.getFilePath(), catalogPath);
				//将移动后的文件名称修改为上传文件的真实名称
				FileUtil.renameFile(catalogPath+SystemInfo.FILE_SEPARATOR+getFileName(uploadFile.getFilePath()), uploadFile.getClientFileName());
			}
		}
	}
	
	@Bizlet(value="获取分类文件路径")
	public static String getCatalogFilePathWithOriginalFileName(String fileCatalog,IUploadFile uploadFile){
		String filePath = uploadFile.getFilePath();
		//上传文件的真实文件名称
		String fileName=uploadFile.getClientFileName();
		int lastIndex=filePath.lastIndexOf(SystemInfo.FILE_SEPARATOR);
		if(StringUtil.isNotNullAndBlank(fileCatalog)){
			return filePath.substring(0, lastIndex)+SystemInfo.FILE_SEPARATOR+fileCatalog+SystemInfo.FILE_SEPARATOR+fileName;
		}else{
			return filePath.substring(0, lastIndex)+SystemInfo.FILE_SEPARATOR+fileName;
		}
	}
	
	
	@Bizlet(value="获取分类文件路径")
	public static String getCatalogFilePath(String fileCatalog,String filePath){
		if(StringUtil.isNotNullAndBlank(fileCatalog)){
			int lastIndex=filePath.lastIndexOf(SystemInfo.FILE_SEPARATOR);
			String fileName=filePath.substring(lastIndex+1);
			return filePath.substring(0, lastIndex)+SystemInfo.FILE_SEPARATOR+fileCatalog+SystemInfo.FILE_SEPARATOR+fileName;
		}else{
			return filePath;
		}
	}
	
	private static String getFileName(String filePath){
		int lastIndex=filePath.lastIndexOf(SystemInfo.FILE_SEPARATOR);
		return filePath.substring(lastIndex+1);
	}
	
	public static void main(String[] args){
		String f="D:\\software\\primeton\\EOS6_LA2_1278\\eosserver\\working\\eos-default\\upload\\2a8181e61dd7d566011dd7f31ea20174.xls";
		String s="test";
		System.out.println(getCatalogFilePath(s,f));
	}

}
