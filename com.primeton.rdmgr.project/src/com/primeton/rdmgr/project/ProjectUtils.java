/**
 * 
 */
package com.primeton.rdmgr.project;

import java.io.File;
import java.io.FileInputStream;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Calendar;
import java.util.List;







import org.apache.commons.fileupload.servlet.ServletRequestContext;
import org.gocom.abframe.tools.UtilConfiguration;

import com.eos.foundation.common.io.FileUtil;
import com.eos.foundation.common.utils.*;
import com.eos.foundation.eoscommon.BusinessDictUtil;
import com.eos.foundation.eoscommon.ConfigurationUtil;
import com.eos.runtime.core.ApplicationContext;
import com.eos.system.annotation.Bizlet;
import com.raqsoft.dm.Sequence;
import com.raqsoft.report.model.ReportDefine;
import com.raqsoft.report.usermodel.Context;
import com.raqsoft.report.usermodel.Engine;
import com.raqsoft.report.usermodel.IReport;
import com.raqsoft.report.util.ReportUtils;
/**
 * @author wkq
 * @date 2011-03-16 18:00:45
 * 
 */
@Bizlet("")
public class ProjectUtils {
	
	/**
	 * @return
	 * @author wkq
	 */
	@Bizlet("���һ������")
	public static String[] calcWeek() {
		// TODO �Զ���ɷ������
		List<String> weeks = new ArrayList<String>();
		Date d = new Date();
		Calendar c = Calendar.getInstance();
		c.setTime(d);
		int week = c.get(Calendar.DAY_OF_WEEK);
		int count = 0;
		switch (week) {
		case 1:
			count = 6;
			break;
		case 6:
		case 7:
			count = week - 2;
			break;
		default:
			count = week + 5;
			break;
		}
		for (int i = 0; i < 5; i++) {
			Date day = new Date(d.getTime() - count * 24 * 3600 * 1000);
			String s = DateUtil.format(day, "yyyy-MM-dd");
			weeks.add(s);
			count--;
		}
		return weeks.toArray(new String[weeks.size()]);
	}
	
	@Bizlet("")
	public static String exportProjCheckV5(String projectid, String name) throws Throwable{
		
		URL raq = ServletRequestContext.class.getResource("/");
		String reportFile=raq.toString().replaceAll("/classes/", "").replaceAll("file:/", "")+"/reportFiles/"+name;
		String licsence = BusinessDictUtil.getDictName("AME_SYSCONF", "licsence");
		String lic=raq.toString().replaceAll("/classes/", "").replaceAll("file:/", "")+"/classes/"+licsence;
		
		Context cxt = new Context(); // 构建报表引擎计算环境
		//赋参数
		int id = Integer.parseInt(projectid);
		cxt.setParamValue("projectid", id);
		
		File flic = new File(lic);
		
		FileInputStream lis = new FileInputStream(flic);
		
		Sequence.readLicense(Sequence.P_RPT, lis);
		
		ReportDefine rd = (ReportDefine)ReportUtils.read(reportFile);
		
		Engine enging = new Engine(rd, cxt);

		IReport iReport = enging.calc();
		
		//导出路径
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
		String templateDir = ApplicationContext.getInstance().getWarRealPath()
				+ ConfigurationUtil.getContributionConfig(
						UtilConfiguration.CONTRIBUTION_ABFRAME_UTILS,
						UtilConfiguration.MODULE_ABFRAME,
						UtilConfiguration.GROUP_EXCEL,
						UtilConfiguration.EXCEL_TEMPLATE_PATH);
		if (!templateDir.endsWith("/")) {
			templateDir += "/";
		}
		String tempDir = templateDir + "ProjCheck\\";
		File file = new File(tempDir);
		if (!file.exists()) {
			//创建临时目录
			FileUtil.mkDir(tempDir);
			//file.createNewFile();
		}
		String url = tempDir + df.format(new Date()) + ".pdf";
		ReportUtils.exportToPDF(url,iReport,false,false);

		return url;
	}

}
