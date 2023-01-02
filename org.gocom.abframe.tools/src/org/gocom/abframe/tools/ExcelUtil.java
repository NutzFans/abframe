/*******************************************************************************
 * $Header: /cvsroot/MIS10/src/NEWERP/org.gocom.abframe.tools/src/org/gocom/abframe/tools/ExcelUtil.java,v 1.10 2020/03/02 19:14:14 lipc Exp $
 * $Revision: 1.10 $
 * $Date: 2020/03/02 19:14:14 $
 *
 *==============================================================================
 *
 * Copyright (c) 2001-2006 Primeton Technologies, Ltd.
 * All rights reserved.
 *
 * Created on 2008-9-3
 *******************************************************************************/


package org.gocom.abframe.tools;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.eos.foundation.common.io.FileUtil;
import com.eos.foundation.eoscommon.ConfigurationUtil;
import com.eos.runtime.core.ApplicationContext;
import com.eos.system.annotation.Bizlet;
import com.eos.system.annotation.BizletParam;
import com.eos.system.annotation.ParamType;

import commonj.sdo.DataObject;

/**
 *
 * Excel文件操作工具类<BR>
 *
 * @author 翁增仁
 * wengzr (mailto:wengzr@primeton.com)
 */
/*
 * 修改历史
 * $Log: ExcelUtil.java,v $
 * Revision 1.10  2020/03/02 19:14:14  lipc
 * �ɹ���ͬ����ģ��
 *
 * Revision 1.9  2018/04/10 21:43:31  yaoyi-ze
 * �깤ȷ��Ʊ����
 *
 * Revision 1.8  2018/01/03 01:56:19  zhuhx
 * Ԥ�㵼��������ģ���sheetҳ������
 *
 * Revision 1.7  2017/12/03 22:04:16  zhuhx
 * ��sheetҳ����
 *
 * Revision 1.6  2017/12/01 02:18:33  zhuhx
 * ��ҳ������δ��ɣ�
 *
 * Revision 1.5  2017/10/25 01:43:47  yaoyi-ze
 * ��Ա��������JAVA����
 *
 * Revision 1.4  2017/09/24 21:44:25  yaoyi-ze
 * ��̬���ڵ���
 *
 * Revision 1.3  2017/08/03 23:57:57  jisx
 * �������
 *
 * Revision 1.2  2017/07/27 17:56:04  jisx
 * ���ӵ�������
 *
 * Revision 1.1  2013/06/02 19:53:23  huangqj
 * *** empty log message ***
 *
 * Revision 1.7  2010/12/01 03:22:41  caisy
 * 更改编码为UTF-8
 *
 * Revision 1.6  2010/11/30 16:12:51  caisy
 * 编码改为UTF-8
 *
 * Revision 1.5  2009/03/30 05:39:38  caisy
 * 代码规范
 *
 * Revision 1.4  2009/02/24 06:47:40  xusl
 * *** empty log message ***
 *
 * Revision 1.3  2009/02/09 07:10:53  xusl
 * 解决业务字典的“导出”功能
 *
 * Revision 1.2  2009/01/07 07:04:14  xusl
 * *** empty log message ***
 *
 * Revision 1.1  2009/01/07 06:52:12  liuxiang
 * *** empty log message ***
 *
 * Revision 1.1  2009/01/05 02:34:56  caisy
 * abframe二期初始版本
 *
 * Revision 1.3  2008/12/01 09:05:17  wengzr
 * Update:增加EXCEL_EXPORT_MAXNUM配置
 *
 * Revision 1.2  2008/11/30 11:12:22  wengzr
 * Added:增加运算构件注释
 *
 * Revision 1.1  2008/11/28 04:03:02  wengzr
 * Added:增加系统信息工具类SystemInfo
 * Refactor:将Excel工具类从customize移入到utils
 *
 * Revision 1.1  2008/11/12 14:41:55  wengzr
 * Added:utility构件包名称修改为org.gocom.abframe.tools
 *
 * Revision 1.1  2008/10/07 09:25:48  wengzr
 * *** empty log message ***
 *
 * Revision 1.12  2008/09/25 16:31:26  wengzr
 * Update:增加自动生成Excel模板文件方法
 *
 * Revision 1.11  2008/09/17 09:38:31  wengzr
 * Update:重构常量定义
 *
 * Revision 1.10  2008/09/15 10:06:50  wengzr
 * Refactor:重构配置文件的获取方式,将Excel配置放入eosinfo
 *
 * Revision 1.9  2008/09/09 16:05:41  wengzr
 * Update:增加Excel数据导入功能
 *
 * Revision 1.8  2008/09/09 13:28:22  wengzr
 * ***** empty log *******
 *
 * Revision 1.7  2008/09/05 14:58:43  wengzr
 * 提交CVS
 *
 * Revision 1.6  2008/09/04 13:16:58  wengzr
 * Update:增加注释
 *
 * Revision 1.5  2008/09/03 13:27:08  wengzr
 * Update:增加使用分页导出Excel,分Sheet导出运算逻辑
 *
 * Revision 1.4  2008/09/03 12:00:12  wengzr
 * Update:增加Excel模板使用#_id，导出将自动生成行序列号
 *
 * Revision 1.3  2008/09/02 18:07:38  wengzr
 * 提交CVS
 *
 * Revision 1.2  2008/09/02 17:55:29  wengzr
 * Update:增加EXCEL输出文件时间戳
 *
 * Revision 1.1  2008/09/02 17:19:01  wengzr
 * 提交CVS
 *
 */
@Bizlet("Excel工具操作类")
public class ExcelUtil {

	private ExcelUtil(){
		//工具类不允许实例化
	}


	/**
	 * 将Excel数据导入到数据库指定的表，默认每500条数据执行一次批处理导入
	 *
	 * @param excelFile Excel文件名
	 * @param entityFullName 导入的实体全名
	 * @return
	 * @throws Exception
	 */
	@Bizlet(
		value="将Excel数据导入到数据库指定的表",
		params = { 
			@BizletParam(index = 0, paramAlias = "excelFile",type=ParamType.CONSTANT),
	        @BizletParam(index = 1, paramAlias = "entityFullName",type=ParamType.CONSTANT)
	   }
	)
	public static int importExcel(String excelFile,String entityFullName)throws Exception{
		ExcelTemplate template=new ExcelTemplate();
		return template.importData(excelFile, entityFullName, 500);
	}
	
	
	/**
	 * 将Excel数据导入到数据库指定的表，默认每500条数据执行一次批处理导入
	 * 用于将简历数据导入到页面上
	 * @param excelFile Excel文件名
	 * @param entityFullName 导入的实体全名
	 * @return
	 * @throws Exception
	 */
	@Bizlet(
		value="将Excel数据导入到数据库指定的表",
		params = { 
			@BizletParam(index = 0, paramAlias = "excelFile",type=ParamType.CONSTANT),
	   }
	)
	public static DataObject[] importExcelOut(String excelFile)throws Exception{
		ExcelTemplate template=new ExcelTemplate();
		return template.importDataOut(excelFile);
	}
	
	/**
	 * 将Excel数据导入到数据库指定的表，默认每500条数据执行一次批处理导入
	 * 用于将简历数据导入到页面上
	 * @param excelFile Excel文件名
	 * @param entityFullName 导入的实体全名
	 * @return
	 * @throws Exception
	 */
	@Bizlet(
		value="将Excel数据导入到数据库指定的表",
		params = { 
			@BizletParam(index = 0, paramAlias = "excelFile",type=ParamType.CONSTANT),
	        @BizletParam(index = 1, paramAlias = "entityFullName",type=ParamType.CONSTANT)
	   }
	)
	public static Map importExcel4Resume(String excelFile,String resumeEntityName,String workExpEntityName,String projExpEntityName,String certEntityName)throws Exception{
		ExcelTemplate template=new ExcelTemplate();
		return template.importData4Resume(excelFile, resumeEntityName, workExpEntityName, projExpEntityName, certEntityName);
	}
	
	
	/**
	 * 将Excel数据导入到数据库指定的表，默认每500条数据执行一次批处理导入
	 * 用于将简历数据导入到页面上
	 * @param excelFile Excel文件名
	 * @param entityFullName 导入的实体全名
	 * @return
	 * @throws Exception
	 */
	@Bizlet(
		value="将Excel数据导入到数据库指定的表",
		params = { 
			@BizletParam(index = 0, paramAlias = "excelFile",type=ParamType.CONSTANT),
	        @BizletParam(index = 1, paramAlias = "entityFullName",type=ParamType.CONSTANT)
	   }
	)
	public static DataObject [] importExcelPerson(String excelFile,String EmpEntityName,String EduEntityName,String ConEntityName,String VerEntityName,String AcEntityName,String LevelEntityName)throws Exception{
		ExcelTemplate template=new ExcelTemplate();
		return template.importDataEmp(excelFile, EmpEntityName, EduEntityName, ConEntityName, VerEntityName,AcEntityName,LevelEntityName);
	}
	
	/**
	 * 将Excel数据导入到数据库指定的表
	 * 用于将完工票数据导入到数据库中
	 * @param excelFile Excel文件名
	 * @param entityFullName 导入的实体全名
	 * @return
	 * @throws Exception
	 */
	@Bizlet(
		value="将Excel数据导入到数据库指定的表",
		params = { 
			@BizletParam(index = 0, paramAlias = "excelFile",type=ParamType.CONSTANT),
	        @BizletParam(index = 1, paramAlias = "entityFullName",type=ParamType.CONSTANT)
	   }
	)
	public static Map importExcelBill(String excelFile)throws Exception{
		ExcelTemplate template=new ExcelTemplate();
		return template.importExcelBill(excelFile);
	}


	/**
	 * 将指定的对象数组exportObjects导出到指定模板的Excel文件
	 *
	 * @param exportObjects 待导出的对象数组
	 * @param exportInfo  模板文件的其他附加信息(非结果集内容)
	 * @param templateFilename 模板文件名(不带扩展名),对应到在user-config.xml配置路径下的模板文件
	 * @return 返回生成的Excel文件下载路径
	 * @throws Exception
	 */
	@Bizlet(
		value="将指定的对象数组导出到指定模板的Excel文件",
		params = { 
			@BizletParam(index = 0, paramAlias = "exportObjects",type=ParamType.VARIABLE),
	        @BizletParam(index = 1, paramAlias = "exportInfo",type=ParamType.VARIABLE),
	        @BizletParam(index = 2, paramAlias = "templateFilename",type=ParamType.CONSTANT)
	    }
	)
	public static String exportExcel(DataObject[] exportObjects,DataObject exportInfo,String templateFilename) throws Exception{
		return exportExcel(exportObjects,exportInfo,templateFilename,false,false);
	}

	/**
	 * 分页将对象数组导出到指定的模板Excel文件,注意：此时模板文件必需包含Excel表格的分页符
	 * @param exportObjects 待导出的对象数组
	 * @param exportInfo  模板文件的其他附加信息(非结果集内容)
	 * @param templateFilename 模板文件名(不带扩展名),对应到在user-config.xml配置路径下的模板文件
	 * @return 返回生成的Excel文件下载路径
	 * @throws Exception
	 */
	@Bizlet(
		value="分页将对象数组导出到指定的模板Excel文件",
		params = { 
			@BizletParam(index = 0, paramAlias = "exportObjects",type=ParamType.VARIABLE),
	        @BizletParam(index = 1, paramAlias = "exportInfo",type=ParamType.VARIABLE),
	        @BizletParam(index = 2, paramAlias = "templateFilename",type=ParamType.CONSTANT)
	    }
	)
	public static String exportExcelWithPagnation(DataObject[] exportObjects,DataObject exportInfo,String templateFilename) throws Exception{
		return exportExcel(exportObjects,exportInfo,templateFilename,true,false);
	}

	/**
	 * 分工作表将对象数组导出到指定的模板Excel文件，默认情况下输出工作表最大行:20000
	 * @param exportObjects 待导出的对象数组
	 * @param exportInfo  模板文件的其他附加信息(非结果集内容)
	 * @param templateFilename 模板文件名(不带扩展名),对应到在user-config.xml配置路径下的模板文件
	 * @return 返回生成的Excel文件下载路径
	 * @throws Exception
	 */
	@Bizlet(
		value="分工作表将对象数组导出到指定的模板Excel文件",
		params = { 
			@BizletParam(index = 0, paramAlias = "exportObjects",type=ParamType.VARIABLE),
	        @BizletParam(index = 1, paramAlias = "exportInfo",type=ParamType.VARIABLE),
	        @BizletParam(index = 2, paramAlias = "templateFilename",type=ParamType.CONSTANT)
	    }
	)
	public static String exportExcelWithSheet(DataObject[] exportObjects,DataObject exportInfo,String templateFilename) throws Exception{
		return exportExcel(exportObjects,exportInfo,templateFilename,false,true);
	}
	
	@Bizlet(
			value="分工作表将对象数组导出到指定的模板Excel文件",
			params = { 
				@BizletParam(index = 0, paramAlias = "exportObjects",type=ParamType.VARIABLE),
		        @BizletParam(index = 1, paramAlias = "exportInfo",type=ParamType.VARIABLE),
		        @BizletParam(index = 2, paramAlias = "templateFilename",type=ParamType.CONSTANT)
		    }
		)
		public static String exportExcelWithComSheet(List<HashMap> exportObjects,DataObject exportInfo,String templateFilename) throws Exception{
			return exportExcel4ComSheet(exportObjects,exportInfo,templateFilename,false,true);
		}
	/**
	 * 分工作表将对象数组动态图导出到指定的模板Excel文件，（第一个sheet页为模版文件）
	 * @param exportObjects 待导出的对象数组
	 * @param exportInfo  模板文件的其他附加信息(非结果集内容)
	 * @param templateFilename 模板文件名(不带扩展名),对应到在user-config.xml配置路径下的模板文件
	 * @return 返回生成的Excel文件下载路径
	 * @throws Exception
	 */
	@Bizlet(
			value="分工作表将对象数组导出到指定的模板Excel文件",
			params = { 
				@BizletParam(index = 0, paramAlias = "exportObjects",type=ParamType.VARIABLE),
		        @BizletParam(index = 1, paramAlias = "exportInfo",type=ParamType.VARIABLE),
		        @BizletParam(index = 2, paramAlias = "templateFilename",type=ParamType.CONSTANT)
		    }
		)
		public static String exportExcelWithAutoSheet(DataObject [] exportObjects,DataObject [] exportInfo,String templateFilename,String[] sheetNames) throws Exception{
			return exportExcel4AutoSheet(exportObjects,exportInfo,templateFilename,false,true,sheetNames);
		}
	
	/**
	 * 分工作表将对象数组导出到指定的模板Excel文件，默认情况下输出工作表最大行:20000
	 * @param exportObjects 待导出的对象数组
	 * @param exportInfo  模板文件的其他附加信息(非结果集内容)
	 * @param templateFilename 模板文件名(不带扩展名),对应到在user-config.xml配置路径下的模板文件
	 * @return 返回生成的Excel文件下载路径
	 * @throws Exception
	 */
	@Bizlet(
		value="分工作表将对象数组导出到指定的模板Excel文件",
		params = { 
			@BizletParam(index = 0, paramAlias = "exportObjects",type=ParamType.VARIABLE),
	        @BizletParam(index = 1, paramAlias = "exportInfo",type=ParamType.VARIABLE),
	        @BizletParam(index = 2, paramAlias = "templateFilename",type=ParamType.CONSTANT)
	    }
	)
	public static String exportResumeExcel(DataObject[] exportObjects,DataObject exportInfo,String templateFilename) throws Exception{
		return exportExcel4Resume(exportObjects,exportInfo,templateFilename);
	}

	/**
	 * 导出Excel文件,根据指定路径下的模板生成输出的Excel文件
	 *
	 * @param exportObjects 待导出的对象数组
	 * @param exportInfo 模板文件的其他附加信息(非结果集内容)
	 * @param templateFilename 模板文件名(不带扩展名),对应到在user-config.xml配置路径下的模板文件
	 * @param autoPagination 是否分页
	 * @param autoSheet 是否分工作表
	 * @return 返回生成的Excel文件下载路径
	 * @throws Exception
	 */
	private static String exportExcel(DataObject[] exportObjects,DataObject exportInfo,String templateFilename,boolean autoPagination,boolean autoSheet) throws Exception{
		String filename=templateFilename;

		if(filename.indexOf(".xls")==-1){
			filename+=".xls";
		}

		//临时路径是服务器当前war下面的excel-config目录
		String templateDir=ApplicationContext.getInstance().getWarRealPath()+ConfigurationUtil.getContributionConfig(UtilConfiguration.CONTRIBUTION_ABFRAME_UTILS,
				UtilConfiguration.MODULE_ABFRAME,
				UtilConfiguration.GROUP_EXCEL,
				UtilConfiguration.EXCEL_TEMPLATE_PATH);
		String excelExportMaxnum=ConfigurationUtil.getContributionConfig(UtilConfiguration.CONTRIBUTION_ABFRAME_UTILS,
				UtilConfiguration.MODULE_ABFRAME,
				UtilConfiguration.GROUP_EXCEL,
				UtilConfiguration.EXCEL_EXPORT_MAXNUM);
		
		if(!templateDir.endsWith("/")){
			templateDir+="/";
		}
		String tempDir=templateDir+"temp/";
		File file=new File(tempDir);
		if(!file.exists()){
			//创建临时目录
			FileUtil.mkDir(tempDir);
			//file.createNewFile();
		}

		String templateFile=templateDir+filename;
		String outputFile=tempDir+generateOutputExcelFile(filename);
				System.out.println("outputFile"+outputFile);
		ExcelTemplate template=new ExcelTemplate(templateFile,outputFile);
		template.setAutoPagination(autoPagination);
		template.setAutoSheet(autoSheet);
		int excelExportMaxnumInt = 0;
		try{
			excelExportMaxnumInt = Integer.parseInt(excelExportMaxnum);
		}catch (Exception e){
			e.printStackTrace();
		}
		template.setMaxRow(excelExportMaxnumInt);
		template.generate(Arrays.asList(exportObjects),exportInfo);

		return outputFile;
	}
	
	
	/**
	 * 导出Excel文件,根据指定路径下的模板生成输出的Excel文件
	 *
	 * @param exportObjects 待导出的对象数组
	 * @param exportInfo 模板文件的其他附加信息(非结果集内容)
	 * @param templateFilename 模板文件名(不带扩展名),对应到在user-config.xml配置路径下的模板文件
	 * @param autoPagination 是否分页
	 * @param autoSheet 是否分工作表
	 * @return 返回生成的Excel文件下载路径
	 * @throws Exception
	 */
	private static String exportExcel4AutoSheet(DataObject[] exportObjects,DataObject[] exportInfo,String templateFilename,boolean autoPagination,boolean autoSheet ,String[] sheetNames) throws Exception{
		String filename=templateFilename;

		if(filename.indexOf(".xls")==-1){
			filename+=".xls";
		}

		//临时路径是服务器当前war下面的excel-config目录
		String templateDir=ApplicationContext.getInstance().getWarRealPath()+ConfigurationUtil.getContributionConfig(UtilConfiguration.CONTRIBUTION_ABFRAME_UTILS,
				UtilConfiguration.MODULE_ABFRAME,
				UtilConfiguration.GROUP_EXCEL,
				UtilConfiguration.EXCEL_TEMPLATE_PATH);
		String excelExportMaxnum=ConfigurationUtil.getContributionConfig(UtilConfiguration.CONTRIBUTION_ABFRAME_UTILS,
				UtilConfiguration.MODULE_ABFRAME,
				UtilConfiguration.GROUP_EXCEL,
				UtilConfiguration.EXCEL_EXPORT_MAXNUM);
		
		if(!templateDir.endsWith("/")){
			templateDir+="/";
		}
		String tempDir=templateDir+"temp/";
		File file=new File(tempDir);
		if(!file.exists()){
			//创建临时目录
			FileUtil.mkDir(tempDir);
			//file.createNewFile();
		}

		String templateFile=templateDir+filename;
		String outputFile=tempDir+generateOutputExcelFile(filename);

		ExcelTemplate template=new ExcelTemplate(templateFile,outputFile);
		template.setAutoPagination(autoPagination);
		template.setAutoSheet(autoSheet);
		int excelExportMaxnumInt = 0;
		try{
			excelExportMaxnumInt = Integer.parseInt(excelExportMaxnum);
		}catch (Exception e){
			e.printStackTrace();
		}
		template.setMaxRow(excelExportMaxnumInt);
		template.generate4Autosheet(exportObjects,exportInfo, sheetNames);

		return outputFile;
	}
	
	/**
	 * 导出Excel文件,根据指定路径下的模板生成输出的Excel文件
	 *
	 * @param exportObjects 待导出的对象数组
	 * @param exportInfo 模板文件的其他附加信息(非结果集内容)
	 * @param templateFilename 模板文件名(不带扩展名),对应到在user-config.xml配置路径下的模板文件
	 * @param autoPagination 是否分页
	 * @param autoSheet 是否分工作表
	 * @return 返回生成的Excel文件下载路径
	 * @throws Exception
	 */
	private static String exportExcel4ComSheet(List<HashMap> exportObjects,DataObject exportInfo,String templateFilename,boolean autoPagination,boolean autoSheet) throws Exception{
		String filename=templateFilename;

		if(filename.indexOf(".xls")==-1){
			filename+=".xls";
		}

		//临时路径是服务器当前war下面的excel-config目录
		String templateDir=ApplicationContext.getInstance().getWarRealPath()+ConfigurationUtil.getContributionConfig(UtilConfiguration.CONTRIBUTION_ABFRAME_UTILS,
				UtilConfiguration.MODULE_ABFRAME,
				UtilConfiguration.GROUP_EXCEL,
				UtilConfiguration.EXCEL_TEMPLATE_PATH);
		String excelExportMaxnum=ConfigurationUtil.getContributionConfig(UtilConfiguration.CONTRIBUTION_ABFRAME_UTILS,
				UtilConfiguration.MODULE_ABFRAME,
				UtilConfiguration.GROUP_EXCEL,
				UtilConfiguration.EXCEL_EXPORT_MAXNUM);
		
		if(!templateDir.endsWith("/")){
			templateDir+="/";
		}
		String tempDir=templateDir+"temp/";
		File file=new File(tempDir);
		if(!file.exists()){
			//创建临时目录
			FileUtil.mkDir(tempDir);
			//file.createNewFile();
		}

		String templateFile=templateDir+filename;
		String outputFile=tempDir+generateOutputExcelFile(filename);

		ExcelTemplate template=new ExcelTemplate(templateFile,outputFile);
		template.setAutoPagination(autoPagination);
		template.setAutoSheet(autoSheet);
		int excelExportMaxnumInt = 0;
		try{
			excelExportMaxnumInt = Integer.parseInt(excelExportMaxnum);
		}catch (Exception e){
			e.printStackTrace();
		}
		template.setMaxRow(excelExportMaxnumInt);
		template.generate4sheet(exportObjects,exportInfo);

		return outputFile;
	}
	
	/**
	 * 导出Excel文件,根据指定路径下的模板生成输出的Excel文件
	 * 用于导出简历
	 * @param exportObjects 待导出的对象数组
	 * @param exportInfo 模板文件的其他附加信息(非结果集内容)
	 * @param templateFilename 模板文件名(不带扩展名),对应到在user-config.xml配置路径下的模板文件
	 * @param autoPagination 是否分页
	 * @param autoSheet 是否分工作表
	 * @return 返回生成的Excel文件下载路径
	 * @throws Exception
	 */
	private static String exportExcel4Resume(DataObject[] exportObjects,DataObject exportInfo,String templateFilename) throws Exception{
		String filename=templateFilename;

		if(filename.indexOf(".xls")==-1){
			filename+=".xls";
		}

		//临时路径是服务器当前war下面的excel-config目录
		String templateDir=ApplicationContext.getInstance().getWarRealPath()+ConfigurationUtil.getContributionConfig(UtilConfiguration.CONTRIBUTION_ABFRAME_UTILS,
				UtilConfiguration.MODULE_ABFRAME,
				UtilConfiguration.GROUP_EXCEL,
				UtilConfiguration.EXCEL_TEMPLATE_PATH);
		String excelExportMaxnum=ConfigurationUtil.getContributionConfig(UtilConfiguration.CONTRIBUTION_ABFRAME_UTILS,
				UtilConfiguration.MODULE_ABFRAME,
				UtilConfiguration.GROUP_EXCEL,
				UtilConfiguration.EXCEL_EXPORT_MAXNUM);
		
		if(!templateDir.endsWith("/")){
			templateDir+="/";
		}
		String tempDir=templateDir+"temp/";
		File file=new File(tempDir);
		if(!file.exists()){
			//创建临时目录
			FileUtil.mkDir(tempDir);
			//file.createNewFile();
		}

		String templateFile=templateDir+filename;
		String outputFile=tempDir+generateOutputExcelFile(filename);

		ExcelTemplate template=new ExcelTemplate(templateFile,outputFile);
		int excelExportMaxnumInt = 0;
		try{
			excelExportMaxnumInt = Integer.parseInt(excelExportMaxnum);
		}catch (Exception e){
			e.printStackTrace();
		}
		template.setMaxRow(excelExportMaxnumInt);
		template.generate4Resume(exportObjects,exportInfo);

		return outputFile;
	}

	/**
	 * 生成EXCEL输出文件，默认带时间戳
	 * @param templateFilename 文件名
	 * @return
	 */
	private static String generateOutputExcelFile(String templateFilename){
		String filename=templateFilename;
		if(templateFilename.endsWith(".xls")){
			filename=templateFilename.substring(0,templateFilename.length()-4);
		}

		SimpleDateFormat format=new SimpleDateFormat("yyyyMMddHHmmss");
		String datetimeString=format.format(new Date());

		filename=filename+"_"+datetimeString+".xls";
		return filename;
	}

}
