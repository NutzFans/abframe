package com.zhonghe.ame.kaohe;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.gocom.abframe.tools.ExcelTemplate;
import org.gocom.abframe.tools.UtilConfiguration;

import com.eos.foundation.common.io.FileUtil;
import com.eos.foundation.eoscommon.ConfigurationUtil;
import com.eos.runtime.core.ApplicationContext;
import com.eos.system.annotation.Bizlet;

import commonj.sdo.DataObject;

@Bizlet("多Sheet页Excel生成工具类")
public class SheetExcelUtil {

	@Bizlet("多Sheet页Excel导出")
	public static String exportExcelWithSheet(Map<String, List<DataObject>> excelMap, DataObject[] exportInfo, String[] sheetNames, String templateFilename) throws Exception {
		String filename = templateFilename;

		if (filename.indexOf(".xls") == -1) {
			filename += ".xls";
		}

		// 临时路径是服务器当前war下面的excel-config目录
		String templateDir = ApplicationContext.getInstance().getWarRealPath()
				+ ConfigurationUtil.getContributionConfig(UtilConfiguration.CONTRIBUTION_ABFRAME_UTILS, UtilConfiguration.MODULE_ABFRAME, UtilConfiguration.GROUP_EXCEL,
						UtilConfiguration.EXCEL_TEMPLATE_PATH);
		String excelExportMaxnum = ConfigurationUtil.getContributionConfig(UtilConfiguration.CONTRIBUTION_ABFRAME_UTILS, UtilConfiguration.MODULE_ABFRAME, UtilConfiguration.GROUP_EXCEL,
				UtilConfiguration.EXCEL_EXPORT_MAXNUM);

		if (!templateDir.endsWith("/")) {
			templateDir += "/";
		}
		String tempDir = templateDir + "temp/";
		File file = new File(tempDir);
		if (!file.exists()) {
			// 创建临时目录
			FileUtil.mkDir(tempDir);
		}

		String templateFile = templateDir + filename;
		String outputFile = tempDir + generateOutputExcelFile(filename);
		ExcelTemplate template = new ExcelTemplate(templateFile, outputFile);
		template.setAutoPagination(false);
		template.setAutoSheet(true);
		int excelExportMaxnumInt = 0;
		excelExportMaxnumInt = Integer.parseInt(excelExportMaxnum);
		template.setMaxRow(excelExportMaxnumInt);

		template.generateWithMoreSheet(excelMap, exportInfo, sheetNames);

		return outputFile;
	}

	// 生成EXCEL输出文件，默认带时间戳
	private static String generateOutputExcelFile(String templateFilename) {
		String filename = templateFilename;
		if (templateFilename.endsWith(".xls")) {
			filename = templateFilename.substring(0, templateFilename.length() - 4);
		}

		SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
		String datetimeString = format.format(new Date());

		filename = filename + "_" + datetimeString + ".xls";
		return filename;
	}
	
}
