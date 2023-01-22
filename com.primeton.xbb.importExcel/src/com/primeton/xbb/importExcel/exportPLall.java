/**
 * 
 */
package com.primeton.xbb.importExcel;



import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.swing.JButton;

import org.gocom.abframe.tools.UtilConfiguration;

import com.eos.foundation.common.io.FileUtil;
import com.eos.foundation.database.DatabaseUtil;
import com.eos.foundation.eoscommon.ConfigurationUtil;
import com.eos.runtime.core.ApplicationContext;
import com.eos.system.annotation.Bizlet;
import com.runqian.report4.model.ReportDefine;
import com.runqian.report4.usermodel.Context;
import com.runqian.report4.usermodel.Engine;
import com.runqian.report4.usermodel.IReport;
import com.runqian.report4.util.ReportUtils;
import com.runqian.report4.view.excel.ExcelReport;

import commonj.sdo.DataObject;

/**
 * @author EPCNB324
 * @date 2016-07-28 17:06:45
 *
 */
@Bizlet("")
public class exportPLall  {

	/**
	 * @param year
	 * @param reportFile
	 * @author EPCNB324
	 * @throws Exception 
	 * 
	 */
	JButton open = null;
	public String path;

	@Bizlet("")
	public static String export(String year, String reportFile, int action,DataObject[] orgid)
			throws Exception {
		
		//获取报表文件路径
		ReportDefine rd = (ReportDefine) ReportUtils.read(reportFile.replace("\\\\", "\\"));
		
		//导出的excel文件用导出时间编号
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
		ExcelReport erp = new ExcelReport();
		

		//循环添加sheet
		int flag = 0;
		for (int x = 0; x < orgid.length; x++) {
			Context cxt = new Context();
			cxt.setParamValue("orgid", orgid[x].getInt("orgid"));
			cxt.setParamValue("year", year);
			cxt.setParamValue("action", action);
			Engine engine = new Engine(rd, cxt);
			try {
				IReport iReport = engine.calc();
				//确定分页名
				commonj.sdo.DataObject org = commonj.sdo.helper.DataFactory.INSTANCE.create("org.gocom.abframe.dataset.organization","OmOrganization");
				org.setInt("orgid", orgid[x].getInt("orgid"));
				DatabaseUtil.expandEntityByTemplate("default", org, org);
				erp.export(org.getString("orgname"), iReport);
				flag++;
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		//导出excel
		String templateDir=ApplicationContext.getInstance().getWarRealPath()+ConfigurationUtil.getContributionConfig(UtilConfiguration.CONTRIBUTION_ABFRAME_UTILS,
				UtilConfiguration.MODULE_ABFRAME,
				UtilConfiguration.GROUP_EXCEL,
				UtilConfiguration.EXCEL_TEMPLATE_PATH);
		if(!templateDir.endsWith("/")){
			templateDir+="/";
		}
		String tempDir=templateDir+"PLAll/";
		File file=new File(tempDir);
		if(!file.exists()){
			//创建临时目录
			FileUtil.mkDir(tempDir);
			//file.createNewFile();
		}
		String url=tempDir+df.format(new Date())+".xls";
		if(flag!=0)
		{	   
				erp.saveTo(url);  
		}
		return url;
	}
}
