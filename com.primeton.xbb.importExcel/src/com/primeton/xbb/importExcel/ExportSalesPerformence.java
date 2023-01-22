/**
 * 
 */
package com.primeton.xbb.importExcel;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.gocom.abframe.tools.UtilConfiguration;

import com.eos.foundation.common.io.FileUtil;
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
 * @author xuqq
 * @date 2017-03-15 16:36:56
 *
 */
@Bizlet("")
public class ExportSalesPerformence {

	/**
	 * @param year 
	 * @param startmonth 
	 * @param endmonth 
	 * @param org 
	 * @param File 
	 * @return
	 * @throws Exception 
	 */
	@Bizlet("")
	public static String exportSalesPerformence(String year, String startmonth,
			String userid, String endmonth, DataObject[] org, String reportFile)
			throws Exception {
		//获取报表文件路径
		ReportDefine rd = (ReportDefine) ReportUtils.read(reportFile.replace(
				"\\\\", "\\"));

		//导出的excel文件用导出时间编号
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
		ExcelReport erp = new ExcelReport();
		erp.setFomulaExported(true);

		//循环添加sheet
		int flag = 0;
		for (int x = 0; x < org.length; x++) {
			Context cxt = new Context();
			cxt.setParamValue("orgseq", org[x].getString("orgseq"));
			cxt.setParamValue("year", year);
			cxt.setParamValue("startmonth", Integer.parseInt(startmonth));
			cxt.setParamValue("endmonth", Integer.parseInt(endmonth));
			cxt.setParamValue("userid", userid);
			cxt.setParamValue("orgid", org[x].getString("orgid"));
			cxt.setParamValue("isHaveAll", null);
			Engine engine = new Engine(rd, cxt);
			try {
				IReport iReport = engine.calc();
				erp.export(org[x].getString("orgname"), iReport);
				flag++;
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}

		//导出excel
		String templateDir = ApplicationContext.getInstance().getWarRealPath()
				+ ConfigurationUtil.getContributionConfig(
						UtilConfiguration.CONTRIBUTION_ABFRAME_UTILS,
						UtilConfiguration.MODULE_ABFRAME,
						UtilConfiguration.GROUP_EXCEL,
						UtilConfiguration.EXCEL_TEMPLATE_PATH);
		if (!templateDir.endsWith("/")) {
			templateDir += "/";
		}
		String tempDir = templateDir + "SalesPerformence/";
		File file = new File(tempDir);
		if (!file.exists()) {
			//创建临时目录
			FileUtil.mkDir(tempDir);
			//file.createNewFile();
		}
		String url = tempDir + df.format(new Date()) + ".xls";
		if (flag != 0) {
			erp.saveTo(url);
		}

		return url;
	}

	/**
	 * 
	 */
	@Bizlet("")
	public static String exportDeptBudget(String year,DataObject[] org, String reportFile) throws Exception{
		//获取报表文件路径
		ReportDefine rd = (ReportDefine) ReportUtils.read(reportFile.replace(
				"\\\\", "\\"));

		//导出的excel文件用导出时间编号
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
		ExcelReport erp = new ExcelReport();
		erp.setFomulaExported(true);

		//循环添加sheet
		int flag = 0;
		for (int x = 0; x < org.length; x++) {
			Context cxt = new Context();
			cxt.setParamValue("year", year);
			cxt.setParamValue("orgid", org[x].getString("orgid"));
			Engine engine = new Engine(rd, cxt);
			try {
				IReport iReport = engine.calc();
				erp.export(org[x].getString("orgname"), iReport);
				flag++;
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		
		//导出excel
		String templateDir = ApplicationContext.getInstance().getWarRealPath()
				+ ConfigurationUtil.getContributionConfig(
						UtilConfiguration.CONTRIBUTION_ABFRAME_UTILS,
						UtilConfiguration.MODULE_ABFRAME,
						UtilConfiguration.GROUP_EXCEL,
						UtilConfiguration.EXCEL_TEMPLATE_PATH);
		if (!templateDir.endsWith("/")) {
			templateDir += "/";
		}
		String tempDir = templateDir + "DeptBudget/";
		File file = new File(tempDir);
		if (!file.exists()) {
			//创建临时目录
			FileUtil.mkDir(tempDir);
			//file.createNewFile();
		}
		String url = tempDir + df.format(new Date()) + ".xls";
		if (flag != 0) {
			erp.saveTo(url);
		}

		return url;
	}

}
