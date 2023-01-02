package com.primeton.xbb.importExcel;

import java.io.FileOutputStream;   
import java.sql.Connection;   
import java.util.Map;   
  



import javax.sql.DataSource;   
  



import org.springframework.jdbc.core.JdbcTemplate;   

import com.runqian.base4.util.DBTypes;   
import com.runqian.report4.model.ReportDefine;
import com.runqian.report4.usermodel.Context;   
import com.runqian.report4.usermodel.DataSourceConfig;   
import com.runqian.report4.usermodel.Engine;   
import com.runqian.report4.usermodel.IReport;   
import com.runqian.report4.util.ReportUtils;   
import com.runqian.report4.view.excel.ExcelReport;

public class PL_exportExcelAll {
	public void exprot(String year,String reportFile) throws Exception
	{
		int[] orgid = new int[15];
		orgid[0]=34; orgid[1]=35;orgid[2]=36;orgid[3]=302;orgid[4]=304;orgid[5]=308;orgid[6]=309;orgid[7]=310;orgid[8]=312;
		orgid[9]=313;orgid[10]=314;orgid[11]=315;orgid[12]=316;orgid[13]=317;orgid[14]=318;
		Context cxt=new Context();
		ReportDefine rd=(ReportDefine)ReportUtils.read(reportFile);
		
		ExcelReport erp=new ExcelReport();
		for(int x=0;x<15;x++)
		   {
		     cxt.setParamValue("orgid",Integer.toString(orgid[x]));
		     cxt.setParamValue("year",year);
		     Engine engine=new Engine(rd,cxt);
		     IReport iReport=engine.calc();
		     erp.export("sheet"+Integer.toString(x),iReport);
		   }
	}

}
