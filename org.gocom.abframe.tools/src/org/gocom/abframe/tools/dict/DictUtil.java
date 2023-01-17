/*******************************************************************************
 * $Header: /cvsroot/MIS10/src/NEWERP/org.gocom.abframe.tools/src/org/gocom/abframe/tools/dict/DictUtil.java,v 1.3 2017/10/18 01:20:42 zhangyb Exp $
 * $Revision: 1.3 $
 * $Date: 2017/10/18 01:20:42 $
 *
 *==============================================================================
 *
 * Copyright (c) 2001-2006 Primeton Technologies, Ltd.
 * All rights reserved.
 * 
 * Created on 2010-4-9
 *******************************************************************************/


package org.gocom.abframe.tools.dict;


import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;

import javax.management.MBeanServerConnection;
import javax.management.ObjectName;

import org.gocom.abframe.tools.ExcelTemplate2;
import org.gocom.abframe.tools.UtilConfiguration;

import com.eos.foundation.common.io.FileUtil;
import com.eos.foundation.eoscommon.ConfigurationUtil;
import com.eos.runtime.core.ApplicationContext;
import com.eos.server.dict.config.DictManagerMBean;
import com.eos.system.annotation.Bizlet;
import com.eos.system.management.MBeanServerAccessor;
import com.eos.system.management.MBeanServerFactory;
import com.eos.system.management.ObjectNameFactory;
import com.eos.system.utility.StringUtil;

import commonj.sdo.DataObject;

/**
 * TODO fill class info here
 *
 * @author 蔡述尧
 * @date 2010-04-09 19:44:39
 */
/*
 * Modify history
 * $Log: DictUtil.java,v $
 * Revision 1.3  2017/10/18 01:20:42  zhangyb
 * *** empty log message ***
 *
 * Revision 1.2  2017/10/17 23:06:07  huangqj
 * ҵ���ֵ�����
 *
 * Revision 1.1  2013/06/02 19:53:42  huangqj
 * *** empty log message ***
 *
 * Revision 1.1  2010/12/26 22:23:04  caisy
 * 业务字典导入导出使用统一模板
 *
 * Revision 1.1.2.1  2010/04/28 10:23:45  caisy
 * 业务字典导入
 * 
 */
@Bizlet("字典导入导出工具")
public class DictUtil {

	/**
	 * @author 蔡述尧
	 * 
	 */
	@Bizlet("")
	public static String dictExport(DataObject[] dictdata,DataObject exportInfo) throws Exception{
		String templateFilename = "DictTemplate";
		return dictExport(dictdata,exportInfo, templateFilename);     
   }
	/**
	 * @author 蔡述尧
	 * 
	 */
	public static String dictExport(DataObject[] dictdata,DataObject exportInfo,String templateFilename) throws Exception{
			ExcelTemplate2 template=getTemplateFile(templateFilename,generateOutputExcelFileName(templateFilename));
	        template.initialize();
	        if(template.getStartRow()==-1)
	        	return null ;
	        
	        //先填充标题
	        if(exportInfo!=null)
	        	template.generateTitleDatas(exportInfo);
	        //生成数据内容
	            template.generateDictDatas(Arrays.asList(dictdata));
	            template.writeToFile();
			return template.getOutputFile();
		
	}
	/**
	 * @author 蔡述尧
	 * @throws Exception 
	 * 
	 */
	@Bizlet("")
	public static boolean dictReload(String Ip,Integer port) throws Exception {
		
		MBeanServerConnection mbsc = MBeanServerFactory.getMBeanServer(Ip, port);
		ObjectName configName = ObjectNameFactory.buildObjectName ("management", "csoms","DictManagerMBean");
		//获得MBean代理实例
		DictManagerMBean dictManagerMBean = MBeanServerAccessor.newProxyInstance(mbsc, configName, DictManagerMBean.class);
		//调用Mbean中的方法
		boolean result = dictManagerMBean.reloadAllDict();
		return result;
	}
	/**
	 * @author 蔡述尧
	 * @throws Exception 
	 * 
	 */
	@Bizlet("")
	public static int dictImport(String excelFile) throws Exception {
		String templateFilename = "DictTemplate";
		ExcelTemplate2 template=getImportTemplateFile(templateFilename);
		template.initialize();
		return template.importDictData(excelFile, 500);
	}
	/**
	 * 生成EXCEL输出文件，默认带时间戳
	 * @param templateFilename 文件名
	 * @return
	 */
	private static String generateOutputExcelFileName(String templateFilename){
		String filename=templateFilename;
		if(templateFilename.endsWith(".xls")){
			filename=templateFilename.substring(0,templateFilename.length()-4);
		}

		SimpleDateFormat format=new SimpleDateFormat("yyyyMMddHHmmss");
		String datetimeString=format.format(new Date());

		filename=filename+"_"+datetimeString+".xls";
		return filename;
	}
	
	/**
	 * 生成导入的模板
	 * @param templateName
	 * @param inoutfile
	 * @return
	 * @throws Exception
	 */
	private static ExcelTemplate2 getImportTemplateFile(String templateName) throws Exception {
		return getTemplateFile(templateName,null);
	}
	/**
	 * 生成模板
	 * @param templateName
	 * @param inoutfile
	 * @return
	 * @throws Exception
	 */
	private static ExcelTemplate2 getTemplateFile(String templateName,String inoutfile) throws Exception {
		if(templateName.indexOf(".xls")==-1){
			templateName+=".xls";
		}

		//临时路径是服务器当前war下面的excel-config目录
		String templateDir=ApplicationContext.getInstance().getWarRealPath()+ConfigurationUtil.getContributionConfig(UtilConfiguration.CONTRIBUTION_ABFRAME_UTILS,
				UtilConfiguration.MODULE_ABFRAME,
				UtilConfiguration.GROUP_EXCEL,
				UtilConfiguration.EXCEL_TEMPLATE_PATH);
		
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
		String templateFile=templateDir+templateName;
		if(StringUtil.isNullOrBlank(inoutfile)){
		    inoutfile=tempDir+generateOutputExcelFileName(templateName);
		}
		return new ExcelTemplate2(templateFile,inoutfile);
	}
}
