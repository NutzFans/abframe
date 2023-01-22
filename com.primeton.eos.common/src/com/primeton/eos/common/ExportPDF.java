/**
 * 
 */
package com.primeton.eos.common;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.gocom.abframe.tools.UtilConfiguration;

import com.eos.foundation.common.io.FileUtil;
import com.eos.foundation.eoscommon.ConfigurationUtil;
import com.eos.runtime.core.ApplicationContext;
import com.eos.system.annotation.Bizlet;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.pdf.AcroFields;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfCopy;
import com.itextpdf.text.pdf.PdfImportedPage;
import com.itextpdf.text.pdf.PdfReader;
import com.itextpdf.text.pdf.PdfStamper;
import com.primeton.ext.system.embedded.EmbeddedSystemCache;

import commonj.sdo.DataObject;

/**
 * @author yaoyi
 * @date 2018-10-10 17:43:30
 *
 */
@Bizlet("")
public class ExportPDF {
	
	/**
	 *
	 * @param templateFilename 模板名称 
	 * @param data 对象数据 
	 * @return 返回生成的PDF文件下载路径
	 * @throws IOException
	 */
	@Bizlet()
    public static String exportPDFByTemplate(String templateFilename,DataObject data) throws IOException{
		String filename=templateFilename;

		if(filename.indexOf(".pdf")==-1){
			filename+=".pdf";
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

		String templateFile=templateDir+filename;
		String outputFile=tempDir+generateOutputExcelFile(filename);
		
        // 生成的新文件路径  
        PdfReader reader;  
        FileOutputStream out;  
        ByteArrayOutputStream bos;  
        PdfStamper stamper;  
        try {  
            out = new FileOutputStream(outputFile);// 输出流  
            reader = new PdfReader(templateFile);
            bos = new ByteArrayOutputStream();  
            stamper = new PdfStamper(reader, out);  
            AcroFields form = stamper.getAcroFields();  
  
            java.util.Iterator<String> it = form.getFields().keySet().iterator();
            BaseFont bf = BaseFont.createFont("C:/WINDOWS/Fonts/SIMSUN.TTC,1",BaseFont.IDENTITY_H, BaseFont.EMBEDDED);//设置系统字体
            while (it.hasNext()) {  
                String name = it.next().toString();
                String name1 = name;
                String value1 = "";
                if(name1.contains(".")){
                	String [] arr = name1.split("\\.");
                	DataObject data1 = (DataObject) data.get(arr[0]);
                	Object value = data1.get(arr[1]);
                    if(value instanceof Date){
                    	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
                    	value1 = formatter.format(value);
                    }else{
                    	value1 = String.valueOf(value);
                    }
                }else{
                	Object value = data.get(name1);
                    if(value instanceof Date){
                    	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
                    	value1 = formatter.format(value);
                    }else{
                    	value1 = String.valueOf(value);
                    }
                }
                if(value1.isEmpty()||value1.equals("null")){
                	value1="";
                }
                form.setField(name,value1);
                form.setFieldProperty(name,"textfont",bf,null);
            }
            stamper.setFormFlattening(true);// 如果为false那么生成的PDF文件还能编辑，一定要设为true
            stamper.close();
  
            Document doc = new Document();
            PdfCopy copy = new PdfCopy(doc, out);
            doc.open();
            PdfImportedPage importPage = copy.getImportedPage(new PdfReader(bos.toByteArray()), 1);
            copy.addPage(importPage);
            doc.close();
        } catch (IOException e) {  
            System.out.println(1);
        } catch (DocumentException e) {
            System.out.println(2);
        }
		return outputFile;
    }
	
	/**
	 * 生成PDF输出文件，默认带时间戳
	 * @param templateFilename 文件名
	 * @return
	 */
	private static String generateOutputExcelFile(String templateFilename){
		String filename=templateFilename;
		if(templateFilename.endsWith(".pdf")){
			filename=templateFilename.substring(0,templateFilename.length()-4);
		}

		SimpleDateFormat format=new SimpleDateFormat("yyyyMMddHHmmss");
		String datetimeString=format.format(new Date());

		filename=filename+"_"+datetimeString+".pdf";
		return filename;
	}
}
