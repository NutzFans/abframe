package com.primeton.eos.ame_budget;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.swing.JButton;
import org.gocom.abframe.tools.UtilConfiguration;
import com.eos.foundation.common.io.FileUtil;
import com.eos.foundation.eoscommon.ConfigurationUtil;
import com.eos.runtime.core.ApplicationContext;
import com.eos.system.annotation.Bizlet;
import com.runqian.report4.model.ReportDefine;
import com.runqian.report4.util.ReportUtils;
import commonj.sdo.DataObject;
import com.runqian.report4.usermodel.Context;
import com.runqian.report4.usermodel.Engine;
import com.runqian.report4.usermodel.IReport;
import com.runqian.report4.view.excel.ExcelReport;

@Bizlet("")
public class exportBudget {

	/**
	 * @param result
	 * @return 
	 * @throws Exception 
	 */
	
	JButton open = null;
	public String path;
	
	@Bizlet("")
	public static String exportBudget(DataObject[] result,String reportFile) throws Exception {
		//获取报表文件路径
		ReportDefine rd = (ReportDefine) ReportUtils.read(reportFile.replace("\\\\", "\\"));
		
		//导出的excel文件用导出时间编号
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
		ExcelReport erp = new ExcelReport();
		erp.setFomulaExported(true);
		
		//循环添加sheet
		int flag = 0;
		for(int x=0;x<result.length;x++){
			Context cxt = new Context();
			cxt.setParamValue("orgid", result[x].getString("orgid"));
			cxt.setParamValue("year", result[x].getString("budgetyear"));
			cxt.setParamValue("orgseq", result[x].getString("orgseq"));
			cxt.setParamValue("parentorgid", result[x].getString("parentorgid"));
			if(result[x].getDouble("orgdegree")==3){
				cxt.setParamValue("parentorgid1", result[x].getString("parentorgid"));
			}else{
				cxt.setParamValue("parentorgid1", null);
			}
			Engine engine = new Engine(rd, cxt);
			try{
				IReport iReport = engine.calc();
				erp.export(result[x].getString("orgname"), iReport);
				flag++;
			}catch (Exception e) {
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
		String tempDir=templateDir+"DeptBudget/";
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
