/*******************************************************************************
 * $Header: /cvsroot/MIS10/src/NEWERP/org.gocom.abframe.tools/src/org/gocom/abframe/tools/ExcelTemplate.java,v 1.31 2019/12/05 02:16:27 zhuhx Exp $
 * $Revision: 1.31 $
 * $Date: 2019/12/05 02:16:27 $
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
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFDataFormat;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRichTextString;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.apache.poi.ss.util.CellRangeAddress;

import com.eos.data.xpath.XPathLocator;
import com.eos.foundation.data.DataObjectUtil;
import com.eos.foundation.database.DatabaseUtil;
import com.eos.foundation.eoscommon.LogUtil;
import com.primeton.data.sdo.impl.PropertyImpl;
import com.primeton.data.sdo.impl.TypeReference;
import com.primeton.data.sdo.impl.types.BooleanType;
import com.primeton.data.sdo.impl.types.DateTimeType;
import com.primeton.data.sdo.impl.types.DateType;
import com.primeton.data.sdo.impl.types.DecimalType;
import com.primeton.data.sdo.impl.types.FloatType;
import com.primeton.data.sdo.impl.types.IntType;
import com.primeton.data.sdo.impl.types.IntegerType;
import com.primeton.data.sdo.impl.types.LongType;

import commonj.sdo.DataObject;
import commonj.sdo.Type;

/**
 *
 * Excel模板实现类<BR>
 * 实现通过自定义Excel数据模版,将结果集填充到模版相应位置，自动创建输出到指定的文件，允许Excel模版设置公式，调用方法如下：<BR>
 * <pre>
 *     ExcelTemplate template=new ExcelTemplate(templateFilePath,outputFilePath)
 *     //template.setIncludeFormula(true);设置包含公式
 *     template.generate(ResultSet);//resultset为ArrayList对象,数据行以Map封装
 *     //template.generate(titleMap,dataList)//显示主表、明细表信息
 * </pre>
 *
 * @author 翁增仁
 * wengzr (mailto:wengzr@primeton.com)
 */
/*
 * 修改历史
 * $Log: ExcelTemplate.java,v $
 * Revision 1.31  2019/12/05 02:16:27  zhuhx
 * *** empty log message ***
 *
 * Revision 1.30  2019/11/28 22:44:49  zhuhx
 * ����������������
 *
 * Revision 1.29  2019/11/27 00:46:44  zhuhx
 * ����������������
 *
 * Revision 1.28  2019/04/24 23:49:30  yaoyi-ze
 * ��̬���鵼�빦�������ֶ�δǩ�˴���ĸ��
 *
 * Revision 1.27  2019/01/06 18:52:08  yaoyi-ze
 * �깤Ʊ����BUG�޸�
 *
 * Revision 1.26  2019/01/02 00:59:04  zhuhx
 * �����깤Ʊbug�޸�
 *
 * Revision 1.25  2018/12/05 01:15:27  zhuhx
 * ������ʽ���?��
 *
 * Revision 1.24  2018/09/04 21:26:50  zhangyb
 * *** empty log message ***
 *
 * Revision 1.23  2018/08/15 00:20:50  mengyy-ze
 * poi��3.16
 *
 * Revision 1.22  2018/07/18 00:32:12  huangqj
 * �����
 *
 * Revision 1.21  2018/05/01 18:28:09  yaoyi-ze
 * *** empty log message ***
 *
 * Revision 1.20  2018/04/10 22:08:20  yaoyi-ze
 * �깤ȷ��Ʊ����
 *
 * Revision 1.19  2018/01/15 02:11:05  zhuhx
 * *** empty log message ***
 *
 * Revision 1.18  2018/01/13 21:30:23  zhuhx
 * *** empty log message ***
 *
 * Revision 1.17  2018/01/03 01:56:19  zhuhx
 * Ԥ�㵼��������ģ���sheetҳ������
 *
 * Revision 1.16  2017/12/03 22:04:16  zhuhx
 * ��sheetҳ����
 *
 * Revision 1.15  2017/12/01 02:18:47  zhuhx
 * ��ҳ������δ��ɣ�
 *
 * Revision 1.14  2017/10/25 01:43:47  yaoyi-ze
 * ��Ա��������JAVA����
 *
 * Revision 1.13  2017/09/24 21:44:25  yaoyi-ze
 * ��̬���ڵ���
 *
 * Revision 1.12  2017/09/21 23:50:37  yaoyi-ze
 * ��̬���ڵ���
 *
 * Revision 1.11  2017/08/20 19:26:49  yaoyi-ze
 * BUG  xiu fu
 *
 * Revision 1.10  2017/08/10 23:28:51  jisx
 * �������
 *
 * Revision 1.9  2017/08/10 02:25:53  jisx
 * �������
 *
 * Revision 1.8  2017/08/03 23:57:57  jisx
 * �������
 *
 * Revision 1.7  2017/08/03 01:52:21  jisx
 * �������
 *
 * Revision 1.6  2017/07/27 18:03:18  jisx
 * ���ӵ�������
 *
 * Revision 1.5  2017/02/08 05:52:04  zhuhx
 * ������ǰҳ��Ԥ����ݣ����ߣ�
 *
 * Revision 1.4  2017/01/19 04:02:30  zhuhx
 * ����Ԥ������������ĸĶ�
 *
 * Revision 1.3  2016/08/27 09:02:37  zhuyl-ze
 * �����Ա���ϵ���
 * ���㵼���޸�(����������ѯ��ݲ�һ��)
 * �����Ա�鿴ҳ����Ա״̬ҵ���ֵ��޸�
 *
 * Revision 1.2  2016/07/28 07:26:54  zhuyl-ze
 * titleCellBold����Ϊtrue
 *
 * Revision 1.1  2013/06/02 19:53:23  huangqj
 * *** empty log message ***
 *
 * Revision 1.10  2010/12/07 03:10:10  caisy
 * 清除system.out
 *
 * Revision 1.9  2010/12/01 03:22:41  caisy
 * 更改编码为UTF-8
 *
 * Revision 1.8  2010/11/30 16:12:51  caisy
 * 编码改为UTF-8
 *
 * Revision 1.7  2009/04/14 03:52:05  caisy
 * Update：excel导出
 *
 * Revision 1.6  2009/03/30 05:39:38  caisy
 * 代码规范
 *
 * Revision 1.5  2009/03/10 15:48:44  caisy
 * Update:组织机构接口BUG修改
 *
 * Revision 1.4  2009/01/21 04:28:43  caisy
 * HSSFCell废除了setEncoding和getStringCellValue方法，所有调用地方都被调整了
 *
 * Revision 1.3  2009/01/20 10:15:42  caisy
 * 消除编译警告
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
 * Revision 1.1  2008/11/28 04:03:02  wengzr
 * Added:增加系统信息工具类SystemInfo
 * Refactor:将Excel工具类从customize移入到utils
 *
 * Revision 1.2  2008/11/17 11:19:43  wengzr
 * refactor:将ChangeUtil移到org.gocom.abframe.tools构件包
 *
 * Revision 1.1  2008/11/12 14:41:55  wengzr
 * Added:utility构件包名称修改为org.gocom.abframe.tools
 *
 * Revision 1.1  2008/10/07 09:25:48  wengzr
 * *** empty log message ***
 *
 * Revision 1.6  2008/09/25 16:31:26  wengzr
 * Update:增加自动生成Excel模板文件方法
 *
 * Revision 1.5  2008/09/10 15:37:20  wengzr
 * Update:实现数据字典导入导出
 *
 * Revision 1.4  2008/09/09 16:05:41  wengzr
 * Update:增加Excel数据导入功能
 *
 * Revision 1.3  2008/09/04 13:16:58  wengzr
 * Update:增加注释
 *
 * Revision 1.2  2008/09/03 12:00:12  wengzr
 * Update:增加Excel模板使用#_id，导出将自动生成行序列号
 *
 * Revision 1.1  2008/09/02 17:19:01  wengzr
 * 提交CVS
 *
 */
public class ExcelTemplate {

	/**
	 * 模板文件名
	 */
	private String templateFile;

	/**
	 * 输出文件名
	 */
	private String outputFile;

	/**
	 * Excel模板定义的输出字段名数组
	 */
	private String[] fieldNames;
	
	/**
	 * Excel模板定义的输出字段名数组
	 */
	private String[] outFieldNames;
	
	/**
	 * Excel模板定义的输出字段名数组
	 */
	private String[] resumeFieldNames;
	
	/**
	 * Excel模板定义的输出字段名数组
	 */
	private String[] workFieldNames;
	
	/**
	 * Excel模板定义的输出字段名数组
	 */
	private String[] projFieldNames;
	
	/**
	 * Excel模板定义的输出字段名数组
	 */
	private String[] certFieldNames;

	/**
	 * 输出的起始行,默认为-1,不输出
	 */
	private int startRow=-1;

	private int tempStartRowNum=-1;

	/**
	 * 默认字体大小
	 */
	private int fontSize=10;
	/**
	 * 默认字体
	 */
	private String fontName="宋体";

	/**
	 * 是否设置信息标题栏边框,默认情况不设置边框
	 */
	private boolean titleCellBold=true;

	/**
	 * 是否设置空白栏边框，默认情况不设置边框
	 */
	private boolean blankCellBold=false;
	/**
	 * 是否自动分工作薄
	 */
	private boolean autoSheet=false;
	/**
	 * 是否自动分页
	 */
	private boolean autoPagination=false;
	/**
	 * 分页行数
	 */
	private int maxrow=-1;
	/**
	 * 是否有公式
	 */
	private boolean hasFormula=false;
	/**
	 * 关键字
	 * &-表示模版信息内容字段
	 * #-表示模版明细内容字段
	 * formula-表示模版函数关键字
	 * ~-表示Cell当前行，当包含":"时，表示当前行减1
	 */
	private final String TITLE_FLAG="&";
	private final String CONTENT_FLAG="#";
	private final String FORMULA_FLAG="formula";
	private final String UNLIMIT_FLAG="~";
	private final String FIELD_AUTO_ID="_id";
	//判断是否是budgetTemp
	private  String a="";
	/**
	 * 公式计算操作符号
	 */
	private final String[] OP_FLAG=new String[]{"+","-","*","/","%",":"};

	/**
	 * 默认构造函数
	 *
	 */
	public ExcelTemplate(){

	}
	/**
	 * 构造器
	 * @param templateFile 模版文件
	 * @param outputFile 输出文件
	 */
	public ExcelTemplate(String templateFile,String outputFile){
		this.templateFile=templateFile;
		this.outputFile=outputFile;
	}

	/**
	 * 设置模版文件是否包含Excel公式
	 * @param hasFormula
	 */
	public void setIncludeFormula(boolean hasFormula){
		this.hasFormula=hasFormula;
	}

	/**
	 * 设置标题栏是否需要边框
	 * @param b
	 */
	public void setTitleCellBold(boolean titleCellBold){
		this.titleCellBold=titleCellBold;
	}

	/**
	 * 设置空白行是否需要显示边框
	 * @param blankCellBold
	 */
	public void setBlankCellBold(boolean blankCellBold){
		this.blankCellBold=blankCellBold;
	}

	/**
	 * 设置是否分工作薄
	 * @param b
	 */
	public void setAutoSheet(boolean autoSheet){
		this.autoSheet=autoSheet;
		this.autoPagination=(autoSheet?false:autoPagination);
	}
	/**
	 * 是否自动分页
	 * @param autoPagination
	 */
	public void setAutoPagination(boolean autoPagination){
		this.autoPagination=autoPagination;
		this.autoSheet=(autoPagination?false:autoSheet);
	}
	/**
	 * 设置分页最大行
	 * @param maxrow
	 */
	public void setMaxRow(int maxrow){
		this.maxrow=maxrow;
	}
	/**
	 * 设置字体大小，默认10号字体
	 * @param size
	 */
	public void setFontSize(int size){
		this.fontSize=size;
	}

	public void setFontName(String fontName){
		this.fontName=fontName;
	}

	/**
	 * 初始化工作模版，获取模版配置起始行(start)以及对应字段填充位置(fieldNames)
	 * @param sheet
	 */
	private void initialize(HSSFSheet sheet){
        boolean setStart=false;
        int rows  = sheet.getPhysicalNumberOfRows();

        for (int r = 0; r < rows; r++){
            HSSFRow row   = sheet.getRow(r);

            if (row != null) {
                int cells = row.getPhysicalNumberOfCells();
                for(short c = 0; c < cells; c++){
                	HSSFCell cell  = row.getCell(c);
                	if(cell!=null)
                	{
                		String value=null;
                		if(cell.getCellType()==HSSFCell.CELL_TYPE_NUMERIC){
                			value=""+cell.getNumericCellValue();
                		}else if(cell.getCellType()==HSSFCell.CELL_TYPE_BOOLEAN){
                			value=""+cell.getBooleanCellValue();
                		}else if(cell.getCellType()==HSSFCell.CELL_TYPE_FORMULA){
                			value=""+cell.getCellFormula();
                		}else{
                			value=cell.getRichStringCellValue().getString();
                		}
                    	if(value!=null&&!"".equals(value))
                    	{
                    		value=value.trim();
                    		//内容数据
                    		if(value.startsWith(CONTENT_FLAG)){
                        		if(!setStart){
                        			this.startRow=r;//设置内容填充起始行
                        			this.fieldNames=new String[cells];
                        			setStart=true;
                        		}
                        		this.fieldNames[c]=value.substring(1);//初始化内容字段
                    		}

                    	}

                	}

                }
            }
        }

	}
	
	/**
	 * 初始化工作模版，获取模版配置起始行(start)以及对应字段填充位置(fieldNames)
	 * 用于初始化简历
	 * @param sheet
	 */
	private void initialize4Resume(HSSFSheet sheet){
        this.resumeFieldNames = new String[17];
        this.resumeFieldNames[0] = "empname";
        this.resumeFieldNames[1] = "gender";
        this.resumeFieldNames[2] = "birthdate";
        this.resumeFieldNames[3] = "workdate";
        this.resumeFieldNames[4] = "indate";
        this.resumeFieldNames[5] = "cardno";
        this.resumeFieldNames[6] = "education";
        this.resumeFieldNames[7] = "specialty";
        this.resumeFieldNames[8] = "school";
        this.resumeFieldNames[9] = "orgname";
        this.resumeFieldNames[10] = "duty";
        this.resumeFieldNames[11] = "technology";
        this.resumeFieldNames[12] = "email";
        this.resumeFieldNames[13] = "tel";
        this.resumeFieldNames[14] = "userid";
        this.resumeFieldNames[15] = "otherdescription";
        this.resumeFieldNames[16] = "abilitydescription";
        
		this.workFieldNames = new String[5];
        this.workFieldNames[0] = "startdate";
        this.workFieldNames[1] = "enddate";
        this.workFieldNames[2] = "companyname";
        this.workFieldNames[3] = "duty";
        this.workFieldNames[4] = "workdescription";
        
        this.projFieldNames = new String[5];
        this.projFieldNames[0] = "beginenddate";
        this.projFieldNames[1] = "projectname";
        this.projFieldNames[2] = "custname";
        this.projFieldNames[3] = "projectintroduce";
        this.projFieldNames[4] = "projectduty";
        
        this.certFieldNames = new String[5];
        this.certFieldNames[0] = "cardtype1";
        this.certFieldNames[1] = "cardno";
        this.certFieldNames[2] = "startdate";
        this.certFieldNames[3] = "enddate";
        this.certFieldNames[4] = "remark";
	}
	
	
	/**
	 * 初始化工作模版，获取模版配置起始行(start)以及对应字段填充位置(fieldNames)
	 * 用于初始化简历
	 * @param sheet
	 */
	private void initializeOut(HSSFSheet sheet){
        this.outFieldNames = new String[29];
        this.outFieldNames[0] = "sybname";
        this.outFieldNames[1] = "empname";
        this.outFieldNames[2] = "miscustname";
        this.outFieldNames[3] = "projectName";
        this.outFieldNames[4] = "projectno";
        this.outFieldNames[5] = "suppliersname";
        this.outFieldNames[6] = "outpername";
        this.outFieldNames[7] = "orgname";
        this.outFieldNames[8] = "year";
        this.outFieldNames[9] = "month";
        this.outFieldNames[10] = "standarddays";
        this.outFieldNames[11] = "rcdate";
        this.outFieldNames[12] = "lcdate";
        this.outFieldNames[13] = "accrueddays";
        this.outFieldNames[14] = "attendancedays";
        this.outFieldNames[15] = "adddays";
        this.outFieldNames[16] = "totaldays";
        this.outFieldNames[17] = "agreeddays";
        this.outFieldNames[18] = "remark";
        this.outFieldNames[19] = "updatedays";
        this.outFieldNames[20] = "latenum";
        this.outFieldNames[21] = "leavenum";
        this.outFieldNames[22] = "signnum";
        this.outFieldNames[23] = "signoutnum";
        this.outFieldNames[24] = "losedays";
        this.outFieldNames[25] = "price";
        this.outFieldNames[26] = "months";
        this.outFieldNames[27] = "accruedcost";
        this.outFieldNames[28] = "penaltycost";
        this.outFieldNames[29] = "attendanceid";
	}

	/**
	 * 计算公式,默认范围从0行到工作薄结尾
	 * @param wb
	 * @param sheet
	 */
	private void calcFormula(HSSFWorkbook wb,HSSFSheet sheet){
		this.calcFormula(wb,sheet,0,sheet.getPhysicalNumberOfRows());
	}

	/**
	 * 计算公式函数,范围从开始行(start_row)到结束行(end_row)
	 * @param wb HSSFWorkbook
	 * @param sheet HSSFSHeet
	 * @param start_rang
	 * @param end_rang
	 */
	private void calcFormula(HSSFWorkbook wb,HSSFSheet sheet,int start_rang,int end_rang){
        //int rows  = sheet.getPhysicalNumberOfRows();
		HSSFCellStyle borderStyle=this.getBorderStyle(wb);
		HSSFCellStyle noneStyle=this.getNoneStyle(wb);		
        for (int r = start_rang; r < end_rang; r++){
            HSSFRow row   = sheet.getRow(r);
            if (row != null) {
                int cells = row.getPhysicalNumberOfCells();
                for(short c = 0; c < cells; c++){
                	HSSFCell cell  = row.getCell(c);
                	if(cell!=null){
                		if(cell.getCellType()==HSSFCell.CELL_TYPE_STRING){
                        	String value=cell.getRichStringCellValue().getString();
                        	if(value!=null){
                        		value=value.trim().toLowerCase();
                        		if(value.startsWith(FORMULA_FLAG))
                        		{
                        			int index=value.indexOf("=");
                        			String formula=value.substring(index+1);
                        			//判断函数是否包含以#开头,如果是以#开头表示必须显示边框，
                        			String flag=formula.substring(0,1);
                        			boolean showBold=false;
                        			if(flag.equals(CONTENT_FLAG)){
                        				formula=formula.substring(1);
                        				showBold=true;
                        			}
                       			   //如果包含':'符号则统计公式不包含当前行,否则会引发公式循环引用错误.
                        			if(formula.indexOf(":")!=-1){
                        				formula=formula.replaceAll(UNLIMIT_FLAG,r+"").toUpperCase();
                        			}else{
                        				formula=formula.replaceAll(UNLIMIT_FLAG,(r+1)+"").toUpperCase();
                        			}

                        			//判断公式对应的Cell内容是否为blank,
                        			//如果公式对应的CELL内容为空，则设置为""
                        			int rightIndex=formula.indexOf(")");
                        			int leftIndex=formula.indexOf("(");
                        			String content=formula.substring(leftIndex+1,rightIndex);
                        			int opIndex=this.getOpIndex(content);
                        			String startPos=content.substring(0,opIndex);
                        			String endPos=content.substring(opIndex+1);

                        			int start_col=this.getColumnIndex(startPos.charAt(0));
                    				int start_row=Integer.parseInt(startPos.substring(1));
                    				int end_col=this.getColumnIndex(endPos.charAt(0));
                    				int end_row=Integer.parseInt(endPos.substring(1));

                    				HSSFCell startC=sheet.getRow(start_row-1).getCell((short)start_col);
                    				HSSFCell endC=sheet.getRow(end_row-1).getCell((short)end_col);

                    				//判断公式开始Cell与结束cell内容是否无效
                    				//当为均为无效的cell值，并且当前公式不包含":"，则设置公式框内容为""，
                    				//包含":" 则设置为计算公式
                    				if(invalidCellValue(startC)&&invalidCellValue(endC)){
                    					if(formula.indexOf(":")==-1){
                    						cell.setCellValue( new HSSFRichTextString(""));
                    					}else{
    	                        			cell=row.createCell((short)c);
    	                        			cell.setCellType(HSSFCell.CELL_TYPE_FORMULA);
    	                        			cell.setCellFormula(formula);
                    					}
                    				}else{
	                        			//重建Cell
	                        			cell=row.createCell((short)c);
	                        			cell.setCellType(HSSFCell.CELL_TYPE_FORMULA);
	                        			cell.setCellFormula(formula);
                    				}

                    				
                        			if(showBold){
                        				cell.setCellStyle(borderStyle);
                        			}else{
                        				cell.setCellStyle(noneStyle);
                        			}


                        		}
                        	}
                		}
                	}

                }
            }
        }
	}

	/**
	 * 设置公式文本框为空白栏，当统计开始行减1==startRowNum时
	 * @param cell
	 * @param startRowNum
	 */
	private void setFormulaBlankCell(HSSFCell cell,int startRowNum){
    	if (cell != null) {
			if (cell.getCellType() == HSSFCell.CELL_TYPE_STRING) {
				String value = cell.getRichStringCellValue().getString();
				if (value != null) {
					value = value.trim().toLowerCase();
					if (value.startsWith(FORMULA_FLAG)) {
						int index = value.indexOf("=");
						String formula = value.substring(index + 1);
						String flag = formula.substring(0, 1);
						if (flag.equals(CONTENT_FLAG))formula = formula.substring(1);
						if (formula.indexOf(":") != -1) {
							int rightIndex = formula.indexOf(")");
							int leftIndex = formula.indexOf("(");
							String content = formula.substring(leftIndex + 1,rightIndex).toUpperCase();
							int opIndex = this.getOpIndex(content);
							String startPos = content.substring(0, opIndex);
							String colValue = startPos.substring(1,opIndex);
							if(Integer.parseInt(colValue)-1==startRowNum)
								cell.setCellType(HSSFCell.CELL_TYPE_BLANK);
						}
					}
				}
			}
		}



	}

	/**
	 * 生成填充模版标题数据
	 *
	 * @param titleMap
	 * @param wb
	 * @param sheet
	 * @throws Exception
	 */
	private void generateTitleDatas(DataObject exportInfo,HSSFWorkbook wb,HSSFSheet sheet)throws Exception{
        int rows  = sheet.getPhysicalNumberOfRows();
        HSSFCellStyle borderStyle=this.getBorderStyle(wb);
        HSSFCellStyle noneStyle=this.getNoneStyle(wb);        
        for (int r = 0; r < rows; r++){
            HSSFRow row   = sheet.getRow(r);
            if (row != null) {

                int cells =row.getPhysicalNumberOfCells();
                for(short c = 0; c < cells; c++){
                	HSSFCell cell  = row.getCell(c);
                	if(cell!=null){
                		if(cell.getCellType()==HSSFCell.CELL_TYPE_STRING){
                        	String value=cell.getRichStringCellValue().getString();
                        	if(value!=null){
                        		value=value.trim();
                        		if(value.startsWith(TITLE_FLAG)){
                        			value=value.substring(1);
                        			//获取对应的值，支持XPATH取值
                        			Object obj=XPathLocator.newInstance().getValue(exportInfo, value);
                        			String content=obj+"";

                        			//String content=exportInfo.getString(value);
                        			if(content==null||content.equals("null"))content="";
                        			//重建Cell，填充标题值
                        			cell=row.createCell((short)c);                        			
                        			cell.setCellType(HSSFCell.CELL_TYPE_STRING);                        			
                        			cell.setCellValue( new HSSFRichTextString(content));

                        			if(!titleCellBold){
                        				cell.setCellStyle(noneStyle);
                        			}else{
                        				cell.setCellStyle(borderStyle);
                        			}
                        		}
                        	}
                		}
                	}

                }
            }
        }
	}
	/**
	 * 生成新填充模版标题数据
	 *
	 * @param titleMap
	 * @param wb
	 * @param sheet
	 * @throws Exception
	 */
	private void generateTitleDatas1(DataObject exportInfo,HSSFWorkbook wb,HSSFSheet sheet)throws Exception{
        int rows  = sheet.getPhysicalNumberOfRows();
        for (int r = 0; r < rows; r++){
            HSSFRow row   = sheet.getRow(r);
            if (row != null) {
            	int aaa = row.getHeight();

                int cells =row.getPhysicalNumberOfCells();
                for(short c = 0; c <= cells; c++){
                	HSSFCell cell  = row.getCell(c);
                	HSSFCell oldcell  = row.getCell(c);
                	if(cell!=null){
                		if(cell.getCellType()==HSSFCell.CELL_TYPE_STRING){
                        	String value=cell.getRichStringCellValue().getString();
                        	if(value!=null){
                        		value=value.trim();
                        		if(value.startsWith(TITLE_FLAG)){
                        			value=value.substring(1);
                        			//获取对应的值，支持XPATH取值
                        			Object obj=XPathLocator.newInstance().getValue(exportInfo, value);
                        			String content1=obj+"";
                        			if(content1.contains("%")){
                        				if(content1==null)content1="";
                        				cell=row.createCell((short)c);                        			
                            			cell.setCellType(HSSFCell.CELL_TYPE_STRING);                        			
                            			cell.setCellValue( new HSSFRichTextString(content1));
                        			}else{
                        				double content = 0;
                        				if(!"null".equals(content1)){
                        					content = new java.text.DecimalFormat().parse(content1).doubleValue();
                        				}else{
                        					content = 0;
                        				}
                        				//String content=exportInfo.getString(value);
                        				//重建Cell，填充标题值
                        				
                        					cell=row.createCell((short)c);                        			
                            				cell.setCellType(HSSFCell.CELL_TYPE_NUMERIC);                        			
                            				cell.setCellValue( content);
                            				cell.setCellStyle(oldcell.getCellStyle());
                            				sheet.setForceFormulaRecalculation(true);
                        			}

                        		}
                        	}
                		}else if(cell.getCellType()==HSSFCell.CELL_TYPE_FORMULA ){
                			cell.setCellFormula(cell.getCellFormula());
                		}
                	}

                }
            }
        }
	}
	
	/**
	 * 将指定的对象数组resulset输出到指定的Excel位置
	 * @param resultset List<DataObject>对象数组
	 * @param wb HSSFWorkbook
	 * @param sheet HSSFSheet
	 */
	private void generateContentDatas(List<DataObject> resultset,HSSFWorkbook wb,HSSFSheet sheet){
		HSSFCellStyle borderStyle=this.getBorderStyle(wb);
		HSSFCellStyle noneStyle=this.getNoneStyle(wb);
		HSSFCellStyle alignCenter = this.getBorderStyleAlign(wb,HSSFCellStyle.ALIGN_CENTER);
		HSSFCellStyle hssfCellStyleDate = this.getBorderStyle(wb);
		HSSFCellStyle hssfCellStyleTime = this.getBorderStyle(wb);
		HSSFDataFormat df = wb.createDataFormat();
		hssfCellStyleDate.setDataFormat(df.getFormat("yyyy-MM-dd"));
		hssfCellStyleTime.setDataFormat(df.getFormat("yyyy-MM-dd hh:mm:ss"));
		//默认行号
		int autoRowId=1;

        for(Iterator it=resultset.iterator();it.hasNext();autoRowId++){
        	DataObject content=(DataObject)it.next();

        	HSSFRow sourceRow=sheet.getRow(startRow);
        	HSSFRow row=sheet.createRow(startRow++);
        	int aaa = sourceRow.getPhysicalNumberOfCells();
        	

        	for(int i=0;i<sourceRow.getPhysicalNumberOfCells();i++){
        		//输出自动生成的行号
        		if(fieldNames[i]!=null&&fieldNames[i].equals(FIELD_AUTO_ID)){
          			HSSFCell cell=row.createCell((short)i);        			
        			cell.setCellStyle(borderStyle);
        			cell.setCellType(HSSFCell.CELL_TYPE_STRING);
    				cell.setCellValue(autoRowId);
    				continue;
        		}

        		if(fieldNames[i]!=null){
        			HSSFCell cell=row.createCell((short)i);        			
        			cell.setCellStyle(borderStyle);
        			if(content!=null){
        				//字段名支持xpath取值
        				Object value=XPathLocator.newInstance().getValue(content, fieldNames[i]);

            			//Object value=content.get(fieldNames[i]);
            			if(value!=null){
            				//如果是外包人员模板,将个别字段设定文本居中格式
            				if(this.templateFile.contains("purOutpersonsTemplate")){
            					if(fieldNames[i].equals("outpername") || fieldNames[i].equals("gender") || fieldNames[i].equals("degree") || 
            							fieldNames[i].equals("gradudate") || fieldNames[i].equals("currentstatus") || 
            							fieldNames[i].equals("startdate") || fieldNames[i].equals("expenddate") || fieldNames[i].equals("actenddate")){
            						cell.setCellStyle(alignCenter);
            					}
            				}
    	        			if(value instanceof Double|| value instanceof BigDecimal){
    	        				cell.setCellType(HSSFCell.CELL_TYPE_NUMERIC);
    	        				cell.setCellValue(Double.parseDouble(value.toString()));
    	        			}else if(value instanceof Date){//增加日期格式设置
    	        				
    	        				SimpleDateFormat format;
    	        				Date formatcontent = null;
    	        				if(value instanceof Timestamp){
    	        					cell.setCellStyle(hssfCellStyleTime);
    	        					format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
    	        					try {
										formatcontent = format.parse(((Date) value).toLocaleString());
									} catch (ParseException e) {
										// TODO 自动生成的 catch 块
										e.printStackTrace();
									}
    	        				}else{
    	        					cell.setCellStyle(hssfCellStyleDate);
    	        					format = new SimpleDateFormat("yyyy-MM-dd");
    	        					try {
    	        						formatcontent = format.parse(((Date) value).toLocaleString());
									} catch (ParseException e) {
										// TODO 自动生成的 catch 块
										e.printStackTrace();
									}
    	        				}
							    cell.setCellValue(formatcontent);
    	        			}else{
	        					cell.setCellType(HSSFCell.CELL_TYPE_STRING);
    	        				cell.setCellValue(new HSSFRichTextString(value.toString()));
    	        			}
            			}else{
            				cell.setCellType(HSSFCell.CELL_TYPE_BLANK);
            			}

        			}else{
        				
        				cell.setCellType(HSSFCell.CELL_TYPE_BLANK);
        				if(!blankCellBold){
        					cell.setCellStyle(noneStyle);
        				}else{
        					cell.setCellStyle(borderStyle);
        				}
        			}
        		}else{
    				HSSFCell sourceCell=sourceRow.getCell((short)i);
    				if(sourceCell!=null&&
    						sourceCell.getCellType()==HSSFCell.CELL_TYPE_STRING&&
    						sourceCell.getRichStringCellValue().getString()!=null&&
    						sourceCell.getRichStringCellValue().getString().toLowerCase().startsWith(FORMULA_FLAG)){

	    				HSSFCell cell=row.createCell((short)i);
	    				cell.setCellType(HSSFCell.CELL_TYPE_STRING);
	    				cell.setCellValue(sourceCell.getRichStringCellValue());
    				}
    			}
        	}

        	if(it.hasNext()){
        		//向下平推一行
        		//sheet.shiftRows(startRow-1,sheet.getLastRowNum(),1);
        		shiftDown(sheet,startRow-1, sheet.getLastRowNum(), 1);
        	}

        }
	}
	
	/**
	 * 将指定的对象数组resulset输出到指定的Excel位置
	 * @param resultset List<DataObject>对象数组
	 * @param wb HSSFWorkbook
	 * @param sheet HSSFSheet
	 */
	private void generateContentDatas1(List<DataObject> resultset,HSSFWorkbook wb,HSSFSheet sheet){
		HSSFCellStyle borderStyle=this.getBorderStyle(wb);
		HSSFCellStyle noneStyle=this.getNoneStyle(wb);
		HSSFCellStyle alignCenter = this.getBorderStyleAlign(wb,HSSFCellStyle.ALIGN_CENTER);
		
		//默认行号
		int autoRowId=1;

        for(Iterator it=resultset.iterator();it.hasNext();autoRowId++){
        	DataObject content=(DataObject)it.next();

        	HSSFRow sourceRow=sheet.getRow(startRow);
        	HSSFRow row=sheet.createRow(startRow++);
        	int aaa = sourceRow.getPhysicalNumberOfCells();
        	

        	for(int i=0;i<sourceRow.getPhysicalNumberOfCells();i++){
        		//输出自动生成的行号
        		if(fieldNames[i]!=null&&fieldNames[i].equals(FIELD_AUTO_ID)){
          			HSSFCell cell=row.createCell((short)i);        			
        			cell.setCellStyle(borderStyle);
        			cell.setCellType(HSSFCell.CELL_TYPE_STRING);
    				cell.setCellValue(autoRowId);
    				continue;
        		}
        		
        		if(fieldNames[i]!=null){
        			HSSFCell cell=row.createCell((short)i);        			
        			cell.setCellStyle(borderStyle);
        			if(content!=null){
        				//字段名支持xpath取值
        				Object value=XPathLocator.newInstance().getValue(content, fieldNames[i]);

            			//Object value=content.get(fieldNames[i]);
            			if(value!=null){
            				//如果是外包人员模板,将个别字段设定文本居中格式
            				if(this.templateFile.contains("purOutpersonsTemplate")){
            					if(fieldNames[i].equals("outpername") || fieldNames[i].equals("gender") || fieldNames[i].equals("degree") || 
            							fieldNames[i].equals("gradudate") || fieldNames[i].equals("currentstatus") || 
            							fieldNames[i].equals("startdate") || fieldNames[i].equals("expenddate") || fieldNames[i].equals("actenddate")){
            						cell.setCellStyle(alignCenter);
            					}
            				}
    	        			if(value instanceof Double|| value instanceof BigDecimal){
    	        				cell.setCellType(HSSFCell.CELL_TYPE_NUMERIC);
    	        				cell.setCellValue(Double.parseDouble(value.toString()));
    	        			}else{
    	        				cell.setCellType(HSSFCell.CELL_TYPE_STRING);
    	        				cell.setCellValue(new HSSFRichTextString(value.toString()));
    	        			}
            			}else{
            				cell.setCellType(HSSFCell.CELL_TYPE_BLANK);
            			}

        			}else{
        				
        				cell.setCellType(HSSFCell.CELL_TYPE_BLANK);
        				if(!blankCellBold){
        					cell.setCellStyle(noneStyle);
        				}else{
        					cell.setCellStyle(borderStyle);
        				}
        			}
        		}else{
        			HSSFCell sourceCell=sourceRow.getCell((short)i);
        			HSSFCell cell1=row.createCell((short)i);
        			Integer num1 = sourceRow.getRowNum()+1;
        			String num = num1.toString();
    				if(i==16){   					
    					cell1.setCellStyle(borderStyle);
	    				cell1.setCellType(HSSFCell.CELL_TYPE_FORMULA);
	    				cell1.setCellFormula("O"+num+"+P"+num);
    				}else if(i==19){
    					cell1.setCellStyle(borderStyle);
	    				cell1.setCellType(HSSFCell.CELL_TYPE_FORMULA);
	    				cell1.setCellFormula("R"+num+"-Q"+num);
    				}else if(i==26){
    					cell1.setCellStyle(borderStyle);
	    				cell1.setCellType(HSSFCell.CELL_TYPE_FORMULA);
	    				cell1.setCellFormula("ROUND(R"+num+"/K"+num+",3)");
    				}else if(i==27){
    					cell1.setCellStyle(borderStyle);
	    				cell1.setCellType(HSSFCell.CELL_TYPE_FORMULA);
	    				cell1.setCellFormula("ROUND(AA"+num+"*Z"+num+",2)");
    				}else if(i==28){
    					cell1.setCellStyle(borderStyle);
	    				cell1.setCellType(HSSFCell.CELL_TYPE_FORMULA);
	    				cell1.setCellFormula("IF((Y"+num+"*5+IF(T"+num+">0,T"+num+"*10,0))>10,Y"+num+"*5+IF(T"+num+">0,T"+num+"*10,0)-10,0)");
    				}
    				if(sourceCell!=null&&
    						sourceCell.getCellType()==HSSFCell.CELL_TYPE_STRING&&
    						sourceCell.getRichStringCellValue().getString()!=null&&
    						sourceCell.getRichStringCellValue().getString().toLowerCase().startsWith(FORMULA_FLAG)){

	    				HSSFCell cell=row.createCell((short)i);
	    				cell.setCellType(HSSFCell.CELL_TYPE_STRING);
	    				cell.setCellValue(sourceCell.getRichStringCellValue());
    				}
    			}
        	}

        	if(it.hasNext()){
        		//向下平推一行
        		//sheet.shiftRows(startRow-1,sheet.getLastRowNum(),1);
        		shiftDown(sheet,startRow-1, sheet.getLastRowNum(), 1);
        	}

        }
	}
	
	/**
	 * 将指定的对象数组resulset输出到指定的Excel位置
	 * 用于导出简历
	 * @param resultset List<DataObject>对象数组
	 * @param wb HSSFWorkbook
	 * @param sheet HSSFSheet
	 */
	private void generateContentDatas4Resume(DataObject resume,HSSFWorkbook wb,HSSFSheet sheet){
		HSSFCellStyle borderStyle=this.getBorderStyle(wb);
		HSSFCellStyle borderStyle1=this.getBorderStyle(wb);
		HSSFCellStyle noneStyle=this.getNoneStyle(wb);
		HSSFCellStyle newStyle=this.getBorderStyle(wb);
		HSSFCellStyle newStyle1=this.getBorderStyle(wb);
		borderStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		borderStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
		borderStyle.setWrapText(true);
		borderStyle1.setAlignment(HSSFCellStyle.ALIGN_LEFT);
		borderStyle1.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
		borderStyle1.setWrapText(true);
		newStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
		newStyle.setWrapText(true);
		newStyle1.setVerticalAlignment(HSSFCellStyle.VERTICAL_TOP);
		newStyle1.setWrapText(true);
		
		/*String ability = resume.getString("abilitydescription");
		HSSFRichTextString newAbility = new HSSFRichTextString(ability);
		HSSFRow abilityRow = sheet.getRow(9);
		HSSFCell abilityCell = abilityRow.getCell((short)0);
		abilityCell.setCellValue(newAbility);*/
		
		//创建单元格边框
		for(int row = 1; row<6;row++){
			HSSFRow row1=sheet.getRow(row);
			HSSFCell cell=row1.createCell((short)2);        			
			cell.setCellStyle(borderStyle);
			HSSFCell cell1=row1.createCell((short)5);        			
			cell1.setCellStyle(borderStyle);
			HSSFCell cell2=row1.createCell((short)8);        			
			cell2.setCellStyle(borderStyle);
		}
		HSSFRow row2=sheet.getRow(6);
		row2.setHeight((short)500);
		Object ability = XPathLocator.newInstance().getValue(resume, "abilitydescription");
		Object other = XPathLocator.newInstance().getValue(resume, "otherdescription");
		
		for(int i=1;i<9;i++){
			if(i==1){
				if(other!=null){
					HSSFCell cell=row2.createCell((short)i);
					cell.setCellValue(new HSSFRichTextString(other.toString()));
					cell.setCellStyle(newStyle);
				}	
			}else{
				HSSFCell cell=row2.createCell((short)i);        			
				cell.setCellStyle(borderStyle);
			}
		}
		HSSFRow row3=sheet.getRow(9);
		row3.setHeight((short)2500);
		for(int i=0;i<9;i++){
			if(i==0){
				if(ability!=null){
					HSSFCell cell = row3.createCell((short)i);
					cell.setCellValue(new HSSFRichTextString(ability.toString()));
					cell.setCellStyle(newStyle1);
				}
			}else{
				HSSFCell cell=row3.createCell((short)i);        			
				cell.setCellStyle(newStyle1);
			}
		}
		
		Map<String,DataObject[]> map1 = (Map<String, DataObject[]>) resume.get("map1");
		DataObject[] workExp  = map1.get("workExps");
		DataObject[] projExp  = map1.get("projExps");
		DataObject[] cert  = map1.get("certs");
		int size1 = workExp.length;
		int size2 = projExp.length;
		int size3 = cert.length;
		
		//默认行号
		int autoRowId=1;
		int cellsNum = 5;
		
		if(size3==0){
			startRow = 21;
        	HSSFRow row=sheet.getRow(startRow++);
        	for(int i=0;i<9;i++){
        		HSSFCell cell=row.createCell((short)i);        			
        		if(i==7){
        			cell.setCellStyle(borderStyle1);
        		}else{
        			cell.setCellStyle(borderStyle);
        		}
        	}
		}else{
	        for(int a=0;a<size3;a++,autoRowId++){
	        	DataObject content=cert[a];
	        	
	        	startRow = 21;
	        	HSSFRow sourceRow=sheet.getRow(startRow);
	        	HSSFRow row=sheet.createRow(startRow++);
	        	int j=0;
	        	
	        	for(int i=0;j<cellsNum;j++){
	        		//输出自动生成的行号
	        		if(certFieldNames[j]!=null&&certFieldNames[j].equals(FIELD_AUTO_ID)){
	          			HSSFCell cell=row.createCell((short)i);        			
	          			if(i==7){
	            			cell.setCellStyle(borderStyle1);
	            		}else{
	            			cell.setCellStyle(borderStyle);
	            		}
	        			cell.setCellType(HSSFCell.CELL_TYPE_STRING);
	    				cell.setCellValue(autoRowId);
	    				continue;
	        		}
	
	        		if(certFieldNames[j]!=null){
	        			HSSFCell cell=row.createCell((short)i);        			
	        			if(i==7){
	            			cell.setCellStyle(borderStyle1);
	            		}else{
	            			cell.setCellStyle(borderStyle);
	            		}
	        			if(content!=null){
	        				//字段名支持xpath取值
	        				Object value=XPathLocator.newInstance().getValue(content, certFieldNames[j]);
	
	            			//Object value=content.get(fieldNames[i]);
	            			if(value!=null){
	    	        			if(value instanceof Double|| value instanceof BigDecimal){
	    	        				cell.setCellType(HSSFCell.CELL_TYPE_NUMERIC);
	    	        				cell.setCellValue(Double.parseDouble(value.toString()));
	    	        			}else{
	    	        				cell.setCellType(HSSFCell.CELL_TYPE_STRING);
	    	        				cell.setCellValue(new HSSFRichTextString(value.toString()));
	    	        			}
	            			}else{
	            				cell.setCellType(HSSFCell.CELL_TYPE_BLANK);
	            			}
	
	        			}else{
	        				
	        				cell.setCellType(HSSFCell.CELL_TYPE_BLANK);
	        				if(!blankCellBold){
	        					cell.setCellStyle(noneStyle);
	        				}else{
	        					if(i==7){
	        	        			cell.setCellStyle(borderStyle1);
	        	        		}else{
	        	        			cell.setCellStyle(borderStyle);
	        	        		}
	        				}
	        			}
	        		}else{
	    				HSSFCell sourceCell=sourceRow.getCell((short)i);
	    				if(sourceCell!=null&&
	    						sourceCell.getCellType()==HSSFCell.CELL_TYPE_STRING&&
	    						sourceCell.getRichStringCellValue().getString()!=null&&
	    						sourceCell.getRichStringCellValue().getString().toLowerCase().startsWith(FORMULA_FLAG)){
	
		    				HSSFCell cell=row.createCell((short)i);
		    				cell.setCellType(HSSFCell.CELL_TYPE_STRING);
		    				cell.setCellValue(sourceCell.getRichStringCellValue());
	    				}
	    			}
	        		if(i==4){
	        			i++;
	        		}else{
	        			i += 2;
	        		}
	        		HSSFCell cell=row.createCell((short)1);        			
	    			cell.setCellStyle(borderStyle);
	    			HSSFCell cell1=row.createCell((short)3);        			
	    			cell1.setCellStyle(borderStyle);
	    			HSSFCell cell2=row.createCell((short)6);        			
	    			cell2.setCellStyle(borderStyle);
	    			HSSFCell cell3=row.createCell((short)8);        			
	    			cell3.setCellStyle(borderStyle);
	        		
	        	}
	        	if(a<size3-1){
	        		//向下平推一行
	        		//sheet.shiftRows(startRow-1,sheet.getLastRowNum(),1);
	        		shiftDown(sheet,startRow-1, sheet.getLastRowNum(), 1);
	        	}
	        }
		}
	        
		if(size2==0){
			startRow = 17;
        	HSSFRow row=sheet.getRow(startRow++);
        	for(int i=0;i<9;i++){
        		HSSFCell cell=row.createCell((short)i);        			
    			if(i==5||i==7){
    				cell.setCellStyle(borderStyle1);
    			}else{
    				cell.setCellStyle(borderStyle);
    			}
        	}
		}else{
	        for(int b=0;b<size2;b++,autoRowId++){
	        	DataObject content=projExp[b];
	        	
	        	startRow = 17;
	        	HSSFRow sourceRow=sheet.getRow(startRow);
	        	HSSFRow row=sheet.createRow(startRow++);
	        	int j=0;
	
	        	for(int i=0;j<cellsNum;j++){
	        		//输出自动生成的行号
	        		if(projFieldNames[j]!=null&&projFieldNames[j].equals(FIELD_AUTO_ID)){
	          			HSSFCell cell=row.createCell((short)i);        			
	          			if(i==5||i==7){
	        				cell.setCellStyle(borderStyle1);
	        			}else{
	        				cell.setCellStyle(borderStyle);
	        			}
	        			cell.setCellType(HSSFCell.CELL_TYPE_STRING);
	    				cell.setCellValue(autoRowId);
	    				continue;
	        		}
	
	        		if(projFieldNames[j]!=null){
	        			HSSFCell cell=row.createCell((short)i);        			
	        			if(i==5||i==7){
	        				cell.setCellStyle(borderStyle1);
	        			}else{
	        				cell.setCellStyle(borderStyle);
	        			}
	        			if(content!=null){
	        				//字段名支持xpath取值
	        				Object value=XPathLocator.newInstance().getValue(content, projFieldNames[j]);
	
	            			//Object value=content.get(fieldNames[i]);
	            			if(value!=null){
	    	        			if(value instanceof Double|| value instanceof BigDecimal){
	    	        				cell.setCellType(HSSFCell.CELL_TYPE_NUMERIC);
	    	        				cell.setCellValue(Double.parseDouble(value.toString()));
	    	        			}else{
	    	        				cell.setCellType(HSSFCell.CELL_TYPE_STRING);
	    	        				cell.setCellValue(new HSSFRichTextString(value.toString()));
	    	        			}
	            			}else{
	            				cell.setCellType(HSSFCell.CELL_TYPE_BLANK);
	            			}
	
	        			}else{
	        				
	        				cell.setCellType(HSSFCell.CELL_TYPE_BLANK);
	        				if(!blankCellBold){
	        					cell.setCellStyle(noneStyle);
	        				}else{
	        					if(i==5||i==7){
	        	    				cell.setCellStyle(borderStyle1);
	        	    			}else{
	        	    				cell.setCellStyle(borderStyle);
	        	    			}
	        				}
	        			}
	        		}else{
	    				HSSFCell sourceCell=sourceRow.getCell((short)i);
	    				if(sourceCell!=null&&
	    						sourceCell.getCellType()==HSSFCell.CELL_TYPE_STRING&&
	    						sourceCell.getRichStringCellValue().getString()!=null&&
	    						sourceCell.getRichStringCellValue().getString().toLowerCase().startsWith(FORMULA_FLAG)){
	
		    				HSSFCell cell=row.createCell((short)i);
		    				cell.setCellType(HSSFCell.CELL_TYPE_STRING);
		    				cell.setCellValue(sourceCell.getRichStringCellValue());
	    				}
	    			}
	        		if(i==4){
	        			i++;
	        		}else{
	        			i += 2;
	        		}
	        		HSSFCell cell=row.createCell((short)1);        			
	    			cell.setCellStyle(borderStyle);
	    			HSSFCell cell1=row.createCell((short)3);        			
	    			cell1.setCellStyle(borderStyle);
	    			HSSFCell cell2=row.createCell((short)6);        			
	    			cell2.setCellStyle(borderStyle);
	    			HSSFCell cell3=row.createCell((short)8);        			
	    			cell3.setCellStyle(borderStyle);
	        	}
	        	if(b<size2-1){
	        		//向下平推一行
	        		//sheet.shiftRows(startRow-1,sheet.getLastRowNum(),1);
	        		shiftDown(sheet,startRow-1, sheet.getLastRowNum(), 1);
	        	}
	        }
		}
        
		if(size1==0){
			startRow = 13;
        	HSSFRow row=sheet.getRow(startRow++);
        	for(int i=0;i<9;i++){
        		HSSFCell cell=row.createCell((short)i);        			
    			if(i==6){
    				cell.setCellStyle(borderStyle1);
    			}else{
    				cell.setCellStyle(borderStyle);
    			}
        	}
		}else{
	        for(int c=0;c<size1;c++,autoRowId++){
	        	DataObject content=workExp[c];
	        	
	        	startRow = 13;
	        	HSSFRow sourceRow=sheet.getRow(startRow);
	        	HSSFRow row=sheet.createRow(startRow++);
	        	int j=0;
	
	        	for(int i=0;j<cellsNum;j++){
	        		//输出自动生成的行号
	        		if(workFieldNames[j]!=null&&workFieldNames[j].equals(FIELD_AUTO_ID)){
	          			HSSFCell cell=row.createCell((short)i);        			
	          			if(i==6){
	        				cell.setCellStyle(borderStyle1);
	        			}else{
	        				cell.setCellStyle(borderStyle);
	        			}
	        			cell.setCellType(HSSFCell.CELL_TYPE_STRING);
	    				cell.setCellValue(autoRowId);
	    				continue;
	        		}
	
	        		if(workFieldNames[j]!=null){
	        			HSSFCell cell=row.createCell((short)i);        			
	        			if(i==6){
	        				cell.setCellStyle(borderStyle1);
	        			}else{
	        				cell.setCellStyle(borderStyle);
	        			}
	        			if(content!=null){
	        				//字段名支持xpath取值
	        				Object value=XPathLocator.newInstance().getValue(content, workFieldNames[j]);
	
	            			//Object value=content.get(fieldNames[i]);
	            			if(value!=null){
	    	        			if(value instanceof Double|| value instanceof BigDecimal){
	    	        				cell.setCellType(HSSFCell.CELL_TYPE_NUMERIC);
	    	        				cell.setCellValue(Double.parseDouble(value.toString()));
	    	        			}else{
	    	        				cell.setCellType(HSSFCell.CELL_TYPE_STRING);
	    	        				cell.setCellValue(new HSSFRichTextString(value.toString()));
	    	        			}
	            			}else{
	            				cell.setCellType(HSSFCell.CELL_TYPE_BLANK);
	            			}
	
	        			}else{
	        				
	        				cell.setCellType(HSSFCell.CELL_TYPE_BLANK);
	        				if(!blankCellBold){
	        					cell.setCellStyle(noneStyle);
	        				}else{
	        					if(i==6){
	        	    				cell.setCellStyle(borderStyle1);
	        	    			}else{
	        	    				cell.setCellStyle(borderStyle);
	        	    			}
	        				}
	        			}
	        		}else{
	    				HSSFCell sourceCell=sourceRow.getCell((short)i);
	    				if(sourceCell!=null&&
	    						sourceCell.getCellType()==HSSFCell.CELL_TYPE_STRING&&
	    						sourceCell.getRichStringCellValue().getString()!=null&&
	    						sourceCell.getRichStringCellValue().getString().toLowerCase().startsWith(FORMULA_FLAG)){
	
		    				HSSFCell cell=row.createCell((short)i);
		    				cell.setCellType(HSSFCell.CELL_TYPE_STRING);
		    				cell.setCellValue(sourceCell.getRichStringCellValue());
	    				}
	    			}
	        		if(i==0||i==1){
	        			i++;
	        		}else{
	        			i += 2;
	        		}
	        		HSSFCell cell=row.createCell((short)3);        			
	    			cell.setCellStyle(borderStyle);
	    			HSSFCell cell1=row.createCell((short)5);        			
	    			cell1.setCellStyle(borderStyle);
	    			HSSFCell cell2=row.createCell((short)7);        			
	    			cell2.setCellStyle(borderStyle);
	    			HSSFCell cell3=row.createCell((short)8);        			
	    			cell3.setCellStyle(borderStyle);
	        	}
	        	if(c<size1-1){
	        		//向下平推一行
	        		//sheet.shiftRows(startRow-1,sheet.getLastRowNum(),1);
	        		shiftDown(sheet,startRow-1, sheet.getLastRowNum(), 1);
	        	}
	        }
		}
		
		//调整单元格高度
		for(int i=13;i<13+size1;i++){
			HSSFRow row=sheet.getRow(i);
			row.setHeight((short)800);
		}
		
		if(size1==0){
			for(int i=13+size1+3+1;i<13+size1+3+size2+1;i++){
				HSSFRow row=sheet.getRow(i);
				row.setHeight((short)800);
			}
		}else{
			for(int i=13+size1+3;i<13+size1+3+size2;i++){
				HSSFRow row=sheet.getRow(i);
				row.setHeight((short)800);
			}
		}
		
		if((size1 == 0 && size2 != 0) || (size1 != 0 && size2 == 0)){
			for(int i=13+size1+3+size2+3+1;i<13+size1+3+size2+3+size3+1;i++){
				HSSFRow row=sheet.getRow(i);
				row.setHeight((short)800);
			}
		}else if(size1 == 0 && size2 == 0){
			for(int i=13+size1+3+size2+3+2;i<13+size1+3+size2+3+size3+2;i++){
				HSSFRow row=sheet.getRow(i);
				row.setHeight((short)800);
			}
		}else{
			for(int i=13+size1+3+size2+3;i<13+size1+3+size2+3+size3;i++){
				HSSFRow row=sheet.getRow(i);
				row.setHeight((short)800);
			}
		}
	}
	
	/**
	 * 将结果集填充到Excel模版,resultset必须是以Map封装行
	 * @param
	 * @param resultset 数据内容
	 * @throws Exception
	 */
	public void generate(List<DataObject> resultset)throws Exception{
		this.generate(resultset,null);

	}
	/**
	 * 将结果集填充到Excel模版,resultset必须是以Map封装行
	 * @param titleMap 标题信息
	 * @param resultset 结果集
	 * @throws Exception
	 */
	public void generate(List<DataObject> resultset,DataObject exportInfo)throws Exception{
        POIFSFileSystem fs =new POIFSFileSystem(new FileInputStream(templateFile));
        HSSFWorkbook wb = new HSSFWorkbook(fs);
        HSSFSheet sheet = wb.getSheetAt(0);
        initialize(sheet);
        if(startRow==-1)
        	return ;


        if(this.autoPagination){
        	this.generatePagination(wb,sheet,resultset,exportInfo);
        }
        else if(this.autoSheet){
        	generatePaginationSheet(wb,sheet,resultset,exportInfo);
        }
        else{
            String a;
			//先填充标题
            if(exportInfo!=null)
            	 this.a = exportInfo.getType().getName();
            if("BudgetTemp".equals(this.a)){
            	this.generateTitleDatas1(exportInfo,wb,sheet);
            	sheet.setForceFormulaRecalculation(true);
            }else{
            	this.generateTitleDatas(exportInfo,wb,sheet);
            }
            //生成数据内容
            if("QueryOutCount".equals(this.a)){
            	this.generateContentDatas1(resultset,wb,sheet);
            }else{
            	this.generateContentDatas(resultset,wb,sheet);
            }            
            if(hasFormula){
            	this.calcFormula(wb,sheet);
            }
        }
        FileOutputStream fileOut = new FileOutputStream(outputFile);
        wb.write(fileOut);
        fileOut.close();
	}
	
	
	/**
	 * 将结果集填充到Excel模版,resultset必须是以Map封装行
	 * 用于导出简历,支持多sheet页
	 * @param titleMap 标题信息
	 * @param resultset 结果集
	 * @throws Exception
	 */
	public void generate4Resume(DataObject[] resultset,DataObject exportInfo)throws Exception{
		int size = resultset.length;
		
		POIFSFileSystem fs =new POIFSFileSystem(new FileInputStream(templateFile));
        HSSFWorkbook wb = new HSSFWorkbook(fs);
        HSSFSheet[] sheet = new HSSFSheet[size];
        
        for (int i=0;i<size;i++){
        	DataObject  resume = resultset[i];
        	String name = resume.getString("empname");
        	
        	sheet[i] = wb.cloneSheet(0);//第一个sheet页的内容
        	if(name!=null&&name!=""){
        		wb.setSheetName(i+1, name);
        	}else{
        		wb.setSheetName(i+1, "sheet1");
        	}
        	initialize4Resume(sheet[i]);
	
            String a;
			//先填充标题
            this.generateTitleDatas(resume,wb,sheet[i]);
            //生成数据内容
            this.generateContentDatas4Resume(resume,wb,sheet[i]);
        
	        /*if(i<size-1){
	        	HSSFSheet sheetNext=wb.createSheet();//创建sheet页
	        	//http://www.cnblogs.com/duelsol/p/3853982.html
	        	initialize4Resume(sheetNext);
	        }*/
        }
        wb.removeSheetAt(0);
        FileOutputStream fileOut = new FileOutputStream(outputFile);
        wb.write(fileOut);
        fileOut.close();
	}
	
	/**
	 * 将结果集填充到Excel模版,resultset必须是以Map封装行
	 * 支持多sheet页导出
	 * @param titleMap 标题信息
	 * @param resultset 结果集
	 * @throws Exception
	 */
	public void generate4sheet(List<HashMap> resultset,DataObject exportInfo)throws Exception{
		int size = resultset.size();
		
		POIFSFileSystem fs =new POIFSFileSystem(new FileInputStream(templateFile));
        HSSFWorkbook wb = new HSSFWorkbook(fs);
        
    	HSSFSheet[] sheet = new HSSFSheet[size];
    	for (int i=0;i<size;i++){
    		HashMap aaa = resultset.get(i);
    		
    		DataObject[]  resume = (DataObject[]) aaa.get("temp1");
    		sheet[i] = wb.getSheetAt(i);
    		initialize(sheet[i]);
    		if(startRow==-1){
    			return ;
    		}
    		String a;
    		//先填充标题
    		this.generateTitleDatas(exportInfo,wb,sheet[i]);
    		//生成数据内容
    		this.generateContentDatas(Arrays.asList(resume),wb,sheet[i]);
    		
    		/*if(i<size-1){
        	HSSFSheet sheetNext=wb.createSheet();//创建sheet页
        	//http://www.cnblogs.com/duelsol/p/3853982.html
        	initialize4Resume(sheetNext);
        }*/
    	}
        FileOutputStream fileOut = new FileOutputStream(outputFile);
        wb.write(fileOut);
        fileOut.close();
	}
	
	/**
	 * 将结果集填充到Excel模版,resultset必须是以Map封装行
	 * 支持多sheet页动态导出(按照第一页的模版)
	 * @param exportInfo 标题信息集
	 * @param resultset 结果集
	 * @param sheetNames sheet页名称
	 * @throws Exception
	 */
	public void generate4Autosheet(DataObject [] resultset,DataObject [] exportInfo,String[] sheetNames)throws Exception{
		POIFSFileSystem fs =new POIFSFileSystem(new FileInputStream(templateFile));
        HSSFWorkbook wb = new HSSFWorkbook(fs);
		
    	// 模板页
    	  HSSFSheet sheetModel = null;
    	  // 新建的Sheet页
    	  HSSFSheet newSheet = null;
    	  for (int i = 0; i < sheetNames.length; i++) {
    		  // 读取模板中模板Sheet页中的内容
		  	  sheetModel = wb.getSheetAt(0);
	    	   // 设置新建Sheet的页名
	    	  newSheet = wb.createSheet(sheetNames[i]);
	    	// 将模板中的内容复制到新建的Sheet页中
	    	   copySheet(wb, sheetModel, newSheet, sheetModel.getFirstRowNum(), sheetModel.getLastRowNum());
	    	   initialize(newSheet);
        		if(startRow==-1){
        			return ;
        		}
	    	   if(exportInfo[i]!=null){
	    		   this.a = exportInfo[i].getType().getName();
	    	   }
	    	   if("BudgetTemp".equals(this.a)){
	            	this.generateTitleDatas1(exportInfo[i],wb,newSheet);
	            	newSheet.setForceFormulaRecalculation(true);
	            }else{
	            	this.generateTitleDatas(exportInfo[i],wb,newSheet);
	            }
	    	 //生成数据内容
        		this.generateContentDatas(Arrays.asList(resultset[i]),wb,newSheet);
        		 if(hasFormula){
                 	this.calcFormula(wb,newSheet);
                 }
    	  }
    	  
    	  	wb.removeSheetAt(0);
	        FileOutputStream fileOut = new FileOutputStream(outputFile);
	        wb.write(fileOut);
	        fileOut.close();
	}

	/**
	 * EXCEL分页
	 * 必须在EXCEL模版的最后一行插入EXCEL分页符!
	 * @param wb HSSFWorkbook
	 * @param sourceSheet HSSFSheet
	 * @param resultset 填充数据集
	 * @param titleMap 信息栏内容
	 * @throws Exception
	 */
	private void generatePagination(HSSFWorkbook wb,HSSFSheet sourceSheet,List<DataObject> resultset,DataObject exportInfo)throws Exception{
    	int startPosition=startRow;
    	tempStartRowNum=startRow;
    	int count=resultset.size() / maxrow;
    	int num=resultset.size() % maxrow;
    	int rows=sourceSheet.getPhysicalNumberOfRows();
    	LogUtil.logInfo("rows={0}",null ,new Object[]{rows});
    	if(num>0){
    		count=count+1;
    		num=maxrow-num;
    		//不足指定的maxrow，添加空行
    		for(int i=0;i<num;i++){
    			resultset.add(null);
    		}
    	}
    	//删除最后一行的分页符
    	try{
    		sourceSheet.removeRowBreak(rows-1);
    	}catch(NullPointerException npe){
    		throw new Exception("指定的EXCEL模版文件["+this.templateFile+"] 未插入分页符");
    	}
    	//超过1页则插入分页符
    	for(int i=1;i<count;i++){
    		//设置分页符
    		sourceSheet.setRowBreak(i*rows-1);
    		this.copyRows(sourceSheet,sourceSheet,0,rows,i*rows+1);

    	}
    	if(exportInfo!=null)
    		this.generateTitleDatas(exportInfo,wb,sourceSheet);

    	int current_page=0;
    	while(current_page<count){
    		List<DataObject> newList=resultset.subList(current_page*maxrow,maxrow*(current_page+1));
    		this.generateContentDatas(newList,wb,sourceSheet);
    		current_page++;
    		//计算下一行的数据填充起始位置
    		startRow=current_page*rows+maxrow+startPosition;
    	}
        if(hasFormula)
        	this.calcFormula(wb,sourceSheet);

	}


	/**
	 * 生成分页的工作薄模版
	 * @param wb HSSFWorkbook
	 * @param sourceSheet HSSFSheet
	 * @param resultset 填充数据集
	 * @param titleMap 信息(标题)栏内容
	 */
	private void generatePaginationSheet(HSSFWorkbook wb,HSSFSheet sourceSheet,List<DataObject> resultset,DataObject exportInfo)throws Exception{
    	int startPosition=startRow;
    	int count=resultset.size() / maxrow;
    	int num=resultset.size() % maxrow;

    	if(num>0){
    		count=count+1;
    		num=maxrow-num;
    		//不足指定的maxrow，添加空行
    		for(int i=0;i<num;i++){
    			resultset.add(null);
    		}

    	}
    	for(int i=1;i<count;i++){
    		HSSFSheet newsheet=wb.createSheet("Page "+i);
    		this.copyRows(sourceSheet,newsheet,0,sourceSheet.getLastRowNum(),0);
    	}

    	if(count>1){
    		for(int i=0;i<wb.getNumberOfSheets();i++){
    			startRow=startPosition;
    			List<DataObject> newList=resultset.subList(i*maxrow,maxrow*(i+1));
    			HSSFSheet sheet=wb.getSheetAt(i);
    	        //先填充标题
    	        if(exportInfo!=null)
    	        	this.generateTitleDatas(exportInfo,wb,sheet);
                this.generateContentDatas(newList,wb,sheet);
                if(hasFormula)
                	this.calcFormula(wb,sheet);
    		}
    	}else{
			HSSFSheet sheet=wb.getSheetAt(0);
	        if(exportInfo!=null)
	        	this.generateTitleDatas(exportInfo,wb,sheet);

            this.generateContentDatas(resultset,wb,sheet);
            if(hasFormula)
            	this.calcFormula(wb,sheet);

    	}
	}

	private HSSFCellStyle getBorderStyle(HSSFWorkbook wb){
        HSSFCellStyle style = wb.createCellStyle();
        HSSFFont font=wb.createFont();
        font.setFontHeightInPoints((short)fontSize);
        font.setFontName(fontName);
        style.setFont(font);
        style.setBorderBottom(HSSFCellStyle.BORDER_THIN);
        style.setBorderLeft(HSSFCellStyle.BORDER_THIN);
        style.setBorderRight(HSSFCellStyle.BORDER_THIN);
        style.setBorderTop(HSSFCellStyle.BORDER_THIN);
        return style;
	}
	private HSSFCellStyle getNoneStyle(HSSFWorkbook wb){
        HSSFCellStyle style = wb.createCellStyle();
        HSSFFont font=wb.createFont();
        font.setFontHeightInPoints((short)fontSize);
        font.setFontName(fontName);
        style.setFont(font);
        style.setBorderBottom(HSSFCellStyle.BORDER_NONE);
        style.setBorderLeft(HSSFCellStyle.BORDER_NONE);
        style.setBorderRight(HSSFCellStyle.BORDER_NONE);
        style.setBorderTop(HSSFCellStyle.BORDER_NONE);
        return style;
	}
	
	/**
	 * 可设置字体文本位置
	 * @param wb
	 * @param align
	 * @return
	 */
	private HSSFCellStyle getBorderStyleAlign(HSSFWorkbook wb,short align){
        HSSFCellStyle style = wb.createCellStyle();
        HSSFFont font=wb.createFont();
        font.setFontHeightInPoints((short)fontSize);
        font.setFontName(fontName);
        style.setFont(font);
        style.setBorderBottom(HSSFCellStyle.BORDER_THIN);
        style.setBorderLeft(HSSFCellStyle.BORDER_THIN);
        style.setBorderRight(HSSFCellStyle.BORDER_THIN);
        style.setBorderTop(HSSFCellStyle.BORDER_THIN);
		style.setAlignment(align);
        return style;
	}


	/**
     * 向下平推表格，并复制格式与内容
     * @param thisrow：当前行号
     * @param lastrow：最后行号
     * @param shiftcount：平推量
     */
    private void shiftDown(HSSFSheet sheet,int thisrow, int lastrow, int shiftcount) {
        sheet.shiftRows(thisrow, lastrow, shiftcount);

        for (int z = 0; z < shiftcount; z++) {
            HSSFRow row = sheet.getRow(thisrow);
            HSSFRow oldrow = sheet.getRow(thisrow + shiftcount);
            //将各行的行高复制
            oldrow.setHeight(row.getHeight());
            //将各个单元格的格式复制
            for (short i = 0; i <= oldrow.getPhysicalNumberOfCells(); i++) {

                HSSFCell cell = row.createCell(i);
                HSSFCell oldcell = oldrow.getCell(i);

                if (oldcell != null) {                    
                    switch(oldcell.getCellType()){
                    case HSSFCell.CELL_TYPE_STRING:
                    	cell.setCellType(HSSFCell.CELL_TYPE_STRING);
                    	cell.setCellValue(oldcell.getRichStringCellValue());
                    	break;
                    case HSSFCell.CELL_TYPE_NUMERIC:
                    	cell.setCellType(HSSFCell.CELL_TYPE_NUMERIC);
                    	cell.setCellValue(oldcell.getNumericCellValue());
                    	break;
                    default:
                    	cell.setCellType(HSSFCell.CELL_TYPE_STRING);
                    	cell.setCellValue(oldcell.getRichStringCellValue());

                    }
                    cell.setCellStyle(oldcell.getCellStyle());
                 }
            }

            //将有列跨越的复制
            Vector regs = findRegion(sheet,oldrow);
            if (regs.size() != 0) {
                for (int i = 0; i < regs.size(); i++) {
                	CellRangeAddress reg = (CellRangeAddress) regs.get(i);
                    reg.setFirstRow(row.getRowNum());
                    reg.setLastRow(row.getRowNum());
                    sheet.addMergedRegion(reg);
                }
            }
            thisrow++;
        }
    }

     /**
     * 查找所有的合并单元格
     * @param oldrow
     * @return
     */
    private Vector findRegion(HSSFSheet sheet ,HSSFRow oldrow) {
        Vector regs = new Vector();
        int num = sheet.getNumMergedRegions();
        int curRowid = oldrow.getRowNum();
        for (int i = 0; i < num; i++) {
            CellRangeAddress reg = sheet.getMergedRegion(i);
            if (reg.getFirstRow() == reg.getLastRow() && reg.getFirstRow() == curRowid) {
                regs.add(reg);
            }
        }
        return regs;
    }


    /**
     * 复制EXCEL行到指定的工作薄上
     * ××如果是分页显示，需要增加一个判断：当复制行包含公式forumla=sum(G7:G~)字样时候，必须修改其实行G7为相应的新行。
     * @param sourceSheet  原工作薄
     * @param targetSheet 目标工作薄
     * @param pStartRow 复制起始行
     * @param pEndRow 复制终止行
     * @param pPosition 插入位置
     */
    private void copyRows(HSSFSheet sourceSheet, HSSFSheet targetSheet,int pStartRow, int pEndRow, int pPosition) {

		HSSFRow sourceRow = null;
		HSSFRow targetRow = null;
		HSSFCell sourceCell = null;
		HSSFCell targetCell = null;
		CellRangeAddress region = null;
		int cType;
		int i;
		short j;
		int targetRowFrom;
		int targetRowTo;

		if ((pStartRow == -1) || (pEndRow == -1)) {
			return;
		}
		// 拷贝合并的单元格
		for (i = 0; i < sourceSheet.getNumMergedRegions(); i++) {
			region = sourceSheet.getMergedRegion(i);
			if ((region.getFirstRow() >= pStartRow)&& (region.getLastRow() <= pEndRow)) {
				targetRowFrom = region.getFirstRow() - pStartRow + pPosition;
				targetRowTo = region.getLastRow() - pStartRow + pPosition;
				region.setFirstRow(targetRowFrom);
				region.setLastRow(targetRowTo);
				targetSheet.addMergedRegion(region);
			}
		}
		// 设置列宽
		for (i = pStartRow; i <= pEndRow; i++) {
			sourceRow = sourceSheet.getRow(i);
			if (sourceRow != null) {
				for (j = sourceRow.getFirstCellNum(); j < sourceRow.getLastCellNum(); j++) {
					targetSheet.setColumnWidth(j, sourceSheet.getColumnWidth(j));
				}
				break;
			}
		}

		// 拷贝行并填充数据
		for (; i <= pEndRow; i++) {
			sourceRow = sourceSheet.getRow(i);
			if (sourceRow == null) {
				continue;
			}
			targetRow = targetSheet.createRow(i - pStartRow + pPosition);
			targetRow.setHeight(sourceRow.getHeight());
			for (j = sourceRow.getFirstCellNum(); j < sourceRow.getLastCellNum(); j++) {
				sourceCell = sourceRow.getCell(j);
				if (sourceCell == null) {
					continue;
				}

				targetCell = targetRow.createCell(j);				
				targetCell.setCellStyle(sourceCell.getCellStyle());
				cType = sourceCell.getCellType();
				targetCell.setCellType(cType);
				switch (cType) {
				case HSSFCell.CELL_TYPE_BOOLEAN:
					targetCell.setCellValue(sourceCell.getBooleanCellValue());
					break;
				case HSSFCell.CELL_TYPE_ERROR:
					targetCell.setCellErrorValue(sourceCell.getErrorCellValue());
					break;
				case HSSFCell.CELL_TYPE_FORMULA:
					targetCell.setCellFormula(parseFormula(sourceCell.getCellFormula()));
					break;
				case HSSFCell.CELL_TYPE_NUMERIC:
					targetCell.setCellValue(sourceCell.getNumericCellValue());
					break;
				case HSSFCell.CELL_TYPE_STRING:
					targetCell.setCellValue(sourceCell.getRichStringCellValue());
					break;
				}
				if(this.autoPagination){
					this.setFormulaBlankCell(sourceCell,tempStartRowNum);
				}
			}
		}
	}
    private String parseFormula(String pPOIFormula) {
		final String cstReplaceString = "ATTR(semiVolatile)"; //$NON-NLS-1$
		StringBuffer result = null;
		int index;
		result = new StringBuffer();
		index = pPOIFormula.indexOf(cstReplaceString);
		if (index >= 0) {
			result.append(pPOIFormula.substring(0, index));
			result.append(pPOIFormula.substring(index+ cstReplaceString.length()));
		} else {
			result.append(pPOIFormula);
		}
		return result.toString();
	}



    /**
	 * 将列的索引换算成ABCD字母，这个方法要在插入公式时用到
	 * @param colIndex 列索引。
	 * @return ABCD字母。
	 */
    /*
    private String getColLetter(int colIndex){
     String ch = "";
        if (colIndex  < 26)
            ch = "" + (char)((colIndex) + 65);
        else
           ch = "" + (char)((colIndex) / 26 + 65 - 1) + (char)((colIndex) % 26 + 65);
        return ch;
    }
    */
    private int getColumnIndex(char c){
    	int i=c;
    	return i-65;
    }
    private int getOpIndex(String s){
    	for(int i=0;i<OP_FLAG.length;i++){
    		int index=s.indexOf(OP_FLAG[i]);
    		if(index!=-1){
    			return index;
    		}
    	}
    	return -1;
    }

    /**
     * 判断是否无效Cell
     * @param cell
     * @return
     */
    private boolean invalidCellValue(HSSFCell cell){
    	if(cell.getCellType()==HSSFCell.CELL_TYPE_BLANK){
    		return true;
    	}
    	else if(cell.getCellType()==HSSFCell.CELL_TYPE_STRING){
    		if(cell.getRichStringCellValue().getString()==null||cell.getRichStringCellValue().getString().equals("")){
    			return true;
    		}
    	}
    	else if(cell.getCellType()==HSSFCell.CELL_TYPE_ERROR){
    		return true;
    	}

    	return false;
    }

    /**
     * 将目标Excel文件的内容导入到数据表
     * @param targetFile Excel文件路径
     * @param entityName SDO数据实体全名
     * @return 返回1 导入成功
     *
     * @throws Exception
     */
    public int importData(String targetFile,String entityName,int submitCount)throws Exception{
        POIFSFileSystem fs =new POIFSFileSystem(new FileInputStream(targetFile));
        HSSFWorkbook wb = new HSSFWorkbook(fs);

        for(int sheetCount=0;sheetCount<wb.getNumberOfSheets();sheetCount++){
        	HSSFSheet sheet = wb.getSheetAt(sheetCount);
        	int rows  = sheet.getPhysicalNumberOfRows();
            initialize(sheet);
            if(startRow==-1)
            	continue;

            List<DataObject> dataObjects=new ArrayList<DataObject>();

            //第一行为#字段名
            //第二行为字段标题，因此内容读取从startRow+2
            for(int rowCount=startRow+2;rowCount<rows;rowCount++){

            	HSSFRow sourceRow=sheet.getRow(rowCount);

            	DataObject importEntity=DataObjectUtil.createDataObject(entityName);

            	//判断某一行是否允许插入，当该行的所有列cell均为BLANK时不插入数据库
            	boolean allowInsert=false;

            	//以下构造导入的实体对象，并根据Excel单元格的内容填充实体属性值
            	for(int cellCount=0;cellCount<fieldNames.length;cellCount++){

            		String propertyName=fieldNames[cellCount];
            		HSSFCell cell=sourceRow.getCell((short)cellCount);

            		if(cell==null||cell.getCellType()==HSSFCell.CELL_TYPE_BLANK)
            			continue;

            		allowInsert=true;

            		String value=null;

            		if(cell.getCellType()==HSSFCell.CELL_TYPE_NUMERIC){
            			 if (HSSFDateUtil.isCellDateFormatted(cell)){
            	                SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            	                value= dateFormat.format((cell.getDateCellValue()));
            	             
            	             }else{  
            	                value=String.valueOf((long) cell.getNumericCellValue());  
            	             }
            		}else if(cell.getCellType()==HSSFCell.CELL_TYPE_BOOLEAN){
            			value=cell.getBooleanCellValue()+"";
            		}else{
            			value=cell.getRichStringCellValue().getString();
            		}

            		TypeReference typeReference=(TypeReference)importEntity.getType().getProperty(propertyName).getType();
            		Type propertyType=typeReference.getActualType();

            		if(propertyType instanceof IntType||propertyType instanceof IntegerType){
            			//防止可能出现的Excel表格读取自动加.号
              			if(value.indexOf(".")!=-1)
            				value=value.substring(0,value.indexOf("."));

            			importEntity.set(fieldNames[cellCount],ChangeUtil.toInteger(value));
            		}
            		else if(propertyType instanceof BooleanType){
            			importEntity.set(fieldNames[cellCount],ChangeUtil.toBoolean(Boolean.valueOf(value)));
            		}
            		else if(propertyType instanceof FloatType){
            			importEntity.set(fieldNames[cellCount],ChangeUtil.toFloat(value));
            		}
            		else if(propertyType instanceof LongType){
            			if(value.indexOf(".")!=-1)
            				value=value.substring(0,value.indexOf("."));
            			importEntity.set(fieldNames[cellCount],ChangeUtil.toLong(value));
            		}
            		else if(propertyType instanceof DecimalType){
            			importEntity.set(fieldNames[cellCount],ChangeUtil.toBigDecimal(value));
            		}
            		else if(propertyType instanceof DateType){
            			importEntity.set(fieldNames[cellCount],ChangeUtil.changeToDBDate(value));
            		}
            		else if(propertyType instanceof DateTimeType){
            			importEntity.set(fieldNames[cellCount],ChangeUtil.toTimestamp(value));
            		}
            		else{
            			importEntity.set(fieldNames[cellCount], value);
            		}

            	}


            	if(dataObjects.size()<submitCount){
            		if(allowInsert)
            			dataObjects.add(importEntity);
            	}else{
            		if(dataObjects.size()>0){
	            		DatabaseUtil.insertEntityBatch("default", dataObjects.toArray(new DataObject[dataObjects.size()]));
	            		dataObjects.clear();
            		}
            	}

            	if(rowCount==rows-1){
            		if(dataObjects.size()>0)
            			DatabaseUtil.insertEntityBatch("default", dataObjects.toArray(new DataObject[dataObjects.size()]));

            	}


            }

        }

        return 1;
    }
    
    /**
     * 将目标Excel文件的内容导入到数据表
     * @param targetFile Excel文件路径
     * @param entityName SDO数据实体全名
     * @return 返回1 导入成功
     *
     * @throws Exception
     */
    public Map importData4Resume(String targetFile,String resumeEntityName,String workExpEntityName,String projExpEntityName,String certEntityName)throws Exception{
    	POIFSFileSystem fs =new POIFSFileSystem(new FileInputStream(targetFile));
        HSSFWorkbook wb = new HSSFWorkbook(fs);
        HSSFSheet sheet = wb.getSheetAt(0);
        initialize4Resume(sheet);
        
        //取工作经历、项目经验、证书的长度
        int workExpNum = 0;
        int projExpNum = 0;
        int certNum = 0;
        int workExpInit = 0,projExpInit = 0,certInit = 0;
        
        for(int i=0;i<sheet.getPhysicalNumberOfRows();i++){
        	HSSFRow row = sheet.getRow(i);
        	HSSFCell cell = row.getCell((short)0);
        	String flag=null;
        	if(cell==null){
        		continue;
        	}else if(cell.getCellType()==HSSFCell.CELL_TYPE_NUMERIC){
    			 if (HSSFDateUtil.isCellDateFormatted(cell)){
    	                SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    	                flag= dateFormat.format((cell.getDateCellValue()));
    	             }else{  
    	            	 flag=String.valueOf((long) cell.getNumericCellValue());  
    	             }
    		}else if(cell.getCellType()==HSSFCell.CELL_TYPE_BOOLEAN){
    			flag=cell.getBooleanCellValue()+"";
    		}else{
    			flag=cell.getRichStringCellValue().getString();
    		}
    		
    		if(flag.equals("工作经历")){
    			workExpInit = i+2;
    		}else if(flag.equals("项目经验")){
    			projExpInit = i+2;
    		}else if(flag.equals("证件")){
    			certInit = i+2;
    		}
        }
        
        //int workExpInit = 13;
        for(int i=workExpInit;isRowEmpty(sheet.getRow(i))!=true;i++){
        	workExpNum++;
        }
        //int projExpInit = 13 + workExpNum + 3;
        for(int i=projExpInit;isRowEmpty(sheet.getRow(i))!=true;i++){
        	projExpNum++;
        }
        //int certInit = 13 + workExpNum + 3 + projExpNum + 3;
        for(int i=certInit;isRowEmpty(sheet.getRow(i))!=true;i++){
        	certNum++;
        }
        
        //创建实体
        DataObject resumeEntity=DataObjectUtil.createDataObject(resumeEntityName);
        DataObject[] workExpEntity = new DataObject[workExpNum];
        for(int i=0;i<workExpNum;i++){
        	workExpEntity[i] = DataObjectUtil.createDataObject(workExpEntityName);
        }
        DataObject[] projExpEntity = new DataObject[projExpNum];
        for(int i=0;i<projExpNum;i++){
        	projExpEntity[i] = DataObjectUtil.createDataObject(projExpEntityName);
        }
        DataObject[] certEntity = new DataObject[certNum];
        for(int i=0;i<certNum;i++){
        	certEntity[i] = DataObjectUtil.createDataObject(certEntityName);
        }
        
        for(int i=1;i<6;i++){
        	HSSFRow row = sheet.getRow(i);
        	HSSFCell cell1 = row.getCell((short)1);
        	HSSFCell cell2 = row.getCell((short)4);
        	HSSFCell cell3 = row.getCell((short)7);
        	
    		String value1=null;
    		if(cell1.getCellType()==HSSFCell.CELL_TYPE_NUMERIC){
    			 if (HSSFDateUtil.isCellDateFormatted(cell1)){
    	                SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    	                value1= dateFormat.format((cell1.getDateCellValue()));
    	             }else{  
    	                value1=String.valueOf((long) cell1.getNumericCellValue());  
    	             }
    		}else if(cell1.getCellType()==HSSFCell.CELL_TYPE_BOOLEAN){
    			value1=cell1.getBooleanCellValue()+"";
    		}else{
    			value1=cell1.getRichStringCellValue().getString();
    		}
    		String value2=null;
    		if(cell2.getCellType()==HSSFCell.CELL_TYPE_NUMERIC){
    			 if (HSSFDateUtil.isCellDateFormatted(cell2)){
    	                SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    	                value2= dateFormat.format((cell2.getDateCellValue()));
    	             }else{  
    	                value2=String.valueOf((long) cell2.getNumericCellValue());  
    	             }
    		}else if(cell2.getCellType()==HSSFCell.CELL_TYPE_BOOLEAN){
    			value2=cell2.getBooleanCellValue()+"";
    		}else{
    			value2=cell2.getRichStringCellValue().getString();
    		}
    		
    		String value3=null;
    		if(cell3.getCellType()==HSSFCell.CELL_TYPE_NUMERIC){
    			 if (HSSFDateUtil.isCellDateFormatted(cell3)){
    	                SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    	                value3= dateFormat.format((cell3.getDateCellValue()));
    	             }else{  
    	                value3=String.valueOf((long) cell3.getNumericCellValue());  
    	             }
    		}else if(cell3.getCellType()==HSSFCell.CELL_TYPE_BOOLEAN){
    			value3=cell3.getBooleanCellValue()+"";
    		}else{
    			value3=cell3.getRichStringCellValue().getString();
    		}
    		
        	resumeEntity.set(resumeFieldNames[3*i-3], value1);
        	resumeEntity.set(resumeFieldNames[3*i-2], value2);
        	resumeEntity.set(resumeFieldNames[3*i-1], value3);
        }
        
        HSSFRow otherDescripRow = sheet.getRow(6);
        HSSFRow abilityRow = sheet .getRow(9);
        HSSFCell otherDescripCell = otherDescripRow.getCell((short)1);
        HSSFCell abilityCell = abilityRow.getCell((short)0);
        
		String otherDescripVal=null;
		if(otherDescripCell.getCellType()==HSSFCell.CELL_TYPE_NUMERIC){
			 if (HSSFDateUtil.isCellDateFormatted(otherDescripCell)){
	                SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	                otherDescripVal= dateFormat.format((otherDescripCell.getDateCellValue()));
	             }else{  
	            	 otherDescripVal=String.valueOf((long) otherDescripCell.getNumericCellValue());  
	             }
		}else if(otherDescripCell.getCellType()==HSSFCell.CELL_TYPE_BOOLEAN){
			otherDescripVal=otherDescripCell.getBooleanCellValue()+"";
		}else{
			otherDescripVal=otherDescripCell.getRichStringCellValue().getString();
		}
        
        String abilityVal=null;
		if(abilityCell.getCellType()==HSSFCell.CELL_TYPE_NUMERIC){
			 if (HSSFDateUtil.isCellDateFormatted(abilityCell)){
	                SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	                abilityVal= dateFormat.format((abilityCell.getDateCellValue()));
	             }else{  
	            	 abilityVal=String.valueOf((long) abilityCell.getNumericCellValue());  
	             }
		}else if(abilityCell.getCellType()==HSSFCell.CELL_TYPE_BOOLEAN){
			abilityVal=abilityCell.getBooleanCellValue()+"";
		}else{
			abilityVal=abilityCell.getRichStringCellValue().getString();
		}
		abilityVal = abilityVal.replace("\n", "<br>");
		abilityVal = abilityVal.replace("\t", "<br/>");
		abilityVal = abilityVal.replace("'", "<br1>");
		abilityVal = abilityVal.replace("\"", "<br2>");
       
		resumeEntity.set(resumeFieldNames[15], otherDescripVal);
        resumeEntity.set(resumeFieldNames[16], abilityVal);
        Map<String,DataObject []> map = new HashMap<String, DataObject []>();
        DataObject [] P = {resumeEntity};
        map.put("reusme", P);
        
        for(int i=0;i<workExpNum;i++){
        	int k=0;
        	HSSFRow row = sheet.getRow(workExpInit+i);
        	for(int j=0;j<5;j++){
        		HSSFCell cell = row.getCell((short)k);
        		String value=null;
        		if(cell.getCellType()==HSSFCell.CELL_TYPE_NUMERIC){
        			 if (HSSFDateUtil.isCellDateFormatted(cell)){
        	                SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        	                value= dateFormat.format((cell.getDateCellValue()));
        	             }else{  
        	                value=String.valueOf((long) cell.getNumericCellValue());  
        	             }
        		}else if(cell.getCellType()==HSSFCell.CELL_TYPE_BOOLEAN){
        			value=cell.getBooleanCellValue()+"";
        		}else{
        			value=cell.getRichStringCellValue().getString();
        		}
        		workExpEntity[i].set(workFieldNames[j], value);
        		if(k==0||k==1){
        			k++;
        		}else{
        			k += 2;
        		}
        	}
        }
        
        map.put("workExp", workExpEntity);
        
        for(int i=0;i<projExpNum;i++){
        	int k=0;
        	HSSFRow row = sheet.getRow(projExpInit+i);
        	for(int j=0;j<5;j++){
        		HSSFCell cell = row.getCell((short)k);
        		String value=null;
        		if(cell.getCellType()==HSSFCell.CELL_TYPE_NUMERIC){
        			 if (HSSFDateUtil.isCellDateFormatted(cell)){
        	                SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        	                value= dateFormat.format((cell.getDateCellValue()));
        	             }else{  
        	                value=String.valueOf((long) cell.getNumericCellValue());  
        	             }
        		}else if(cell.getCellType()==HSSFCell.CELL_TYPE_BOOLEAN){
        			value=cell.getBooleanCellValue()+"";
        		}else{
        			value=cell.getRichStringCellValue().getString();
        		}
        		projExpEntity[i].set(projFieldNames[j], value);
        		if(k==4){
        			k++;
        		}else{
        			k += 2;
        		}
        	}
        }
        
        map.put("projExp", projExpEntity);

        for(int i=0;i<certNum;i++){
        	int k=0;
        	HSSFRow row = sheet.getRow(certInit+i);
        	for(int j=0;j<5;j++){
        		HSSFCell cell = row.getCell((short)k);
        		String value=null;
        		if(cell.getCellType()==HSSFCell.CELL_TYPE_NUMERIC){
        			 if (HSSFDateUtil.isCellDateFormatted(cell)){
        	                SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        	                value= dateFormat.format((cell.getDateCellValue()));
        	             }else{  
        	                value=String.valueOf((long) cell.getNumericCellValue());  
        	             }
        		}else if(cell.getCellType()==HSSFCell.CELL_TYPE_BOOLEAN){
        			value=cell.getBooleanCellValue()+"";
        		}else{
        			value=cell.getRichStringCellValue().getString();
        		}
        		certEntity[i].set(certFieldNames[j], value);
        		if(k==4){
        			k++;
        		}else{
        			k += 2;
        		}
        	}
        }
        
        map.put("cert", certEntity);
    	
    	return map;
    }
    
    /**
     * 将目标Excel文件的内容导入到数据表
     * @param targetFile Excel文件路径
     * @param entityName SDO数据实体全名..
     * @return 返回1 导入成功
     *
     * @throws Exception
     */
    public DataObject [] importDataEmp(String excelFile,String EmpEntityName,String EduEntityName,String ConEntityName,String VerEntityName,String AcEntityName,String LevelEntityName)throws Exception{
    	POIFSFileSystem fs =new POIFSFileSystem(new FileInputStream(excelFile));
        HSSFWorkbook wb = new HSSFWorkbook(fs);
        int total = wb.getNumberOfSheets();
        DataObject [] result = new DataObject[total];
        
        for(int i = 0; i<wb.getNumberOfSheets();i++){
        	HSSFSheet sheet = wb.getSheetAt(i);
        	int eduNum = 0;
        	int eduInit = 0;
        	
        	//获取学历行数
        	for(int l=0;l<sheet.getPhysicalNumberOfRows();l++){
            	HSSFRow row = sheet.getRow(l);
            	HSSFCell cell = row.getCell((short)3);
            	String flag=null;
            	if(cell==null){
            		continue;
            	}else if(cell.getCellType()==HSSFCell.CELL_TYPE_NUMERIC){
        			 if (HSSFDateUtil.isCellDateFormatted(cell)){
        	                SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        	                flag= dateFormat.format((cell.getDateCellValue()));
        	             }else{  
        	            	 flag=String.valueOf((long) cell.getNumericCellValue());  
        	             }
        		}else if(cell.getCellType()==HSSFCell.CELL_TYPE_BOOLEAN){
        			flag=cell.getBooleanCellValue()+"";
        		}else{
        			flag=cell.getRichStringCellValue().getString();
        		}
        		
        		if(flag.equals("开始时间")){
        			eduInit = l+1;
        		}
            }
        	
        	//eduInit = 21,22;
            for(int a=eduInit;a<sheet.getPhysicalNumberOfRows();a++){
            	HSSFRow r = sheet.getRow(a);
            	HSSFCell c = r.getCell((short)3);
            	String flags=null;
            	if(c==null){
            		continue;
            	}else if(c.getCellType()==HSSFCell.CELL_TYPE_NUMERIC){
        			 if (HSSFDateUtil.isCellDateFormatted(c)){
        	                SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        	                flags= dateFormat.format((c.getDateCellValue()));
        	             }else{  
        	            	 flags=String.valueOf((long) c.getNumericCellValue());  
        	             }
        		}else if(c.getCellType()==HSSFCell.CELL_TYPE_BOOLEAN){
        			flags=c.getBooleanCellValue()+"";
        		}else{
        			flags=c.getRichStringCellValue().getString();
        		}
            	
            	if(flags==null||flags.equals("")||flags.equals("起始时间")){
            		break;
            	}else{
            		eduNum++;
            	}
            }
            //人员信息
            DataObject emp=DataObjectUtil.createDataObject(EmpEntityName);
            String password = null;
            String empname = null;
            String indate = null;
            
            for(int b=4;b<18;b++){
            	HSSFRow row = sheet.getRow(b);
            	HSSFCell cell1 = row.getCell((short)3);
            	HSSFCell cell2 = row.getCell((short)5);
            	HSSFCell cell3 = row.getCell((short)7);
            	
        		String value1=getCellFormatValue(cell1);
        		String value2=getCellFormatValue(cell2);
        		String value3=getCellFormatValue(cell3);
        		
        		if(value1.equals("/")){
        			value1=null;
        		}
        		if(value2.equals("/")){
        			value2=null;
        		}
        		if(value3.equals("/")){
        			value3=null;
        		}
        		
        		if(b==4){
        			emp.set("empname",value1);
        			empname = value1;
        			emp.set("realname",value1);
        			emp.set("gender",value2);
        			emp.set("birthplace",value3);
        		}else if(b==5){
        			emp.set("birthdate",value2);
        			emp.set("cardno",value3);
        			password = value3.substring(value3.length()-6,value3.length());
        			emp.set("cardtype","id");
        		}else if(b==6){
        			emp.set("nation",value1	);
        			emp.set("mobileno",value2);
        			emp.set("pemail",value3);
        		}else if(b==7){
        			emp.set("indate",value1);
        			indate = value1;
        			emp.set("workplace",value2);
        			emp.set("socialstart",value3);
        		}else if(b==8){
        			emp.set("highestindate",value1);
        			emp.set("highestlen",value2);
        			emp.set("highestoutdate",value3);
        		}else if(b==9){
        			emp.set("htel",value1);
        			emp.set("hzipcode",value2);
        			emp.set("haddress",value3);
        		}else if(b==10){
        			emp.set("emergency",value1);
        			emp.set("emerelation",value2);
        			emp.set("emelink",value3);
        		}else if(b==11){
        			emp.set("resiproperty",value1);
        			emp.set("residence",value2);
        			emp.set("resiaddress",value3);
        		}else if(b==12){
        			emp.set("filesaveorg",value1);
        			emp.set("filecity",value2);
        			emp.set("fileaddress",value3);
        		}else if(b==13){
        			emp.set("ishaveresi",value1);
        			emp.set("resilimit",value2);
        			emp.set("residealorg",value3);
        		}else if(b==14){
        			emp.set("resistartdate",value1);
        			emp.set("resienddate",value2);
        			emp.set("marristatus",value3);
        		}else if(b==15){
        			emp.set("welfareplace",value1);
        			emp.set("fundno",value2);
        			emp.set("addfundno",value3);
        		}else if(b==16){
        			emp.set("nonagename",value1);
        			emp.set("nonagesex",value2);
        			emp.set("nonagebirth",value3);
        		}else if(b==17){
        			emp.set("isjoinpcf",value1);
        			emp.set("bankname",value2);
        			emp.set("bankacct",value3);
        		}
        		
            }
            
            if(eduNum != 0){
            	//学历信息
            	DataObject[] eduEntitys = new DataObject[eduNum];
                for(int k=0;k<eduNum;k++){
                	eduEntitys[k] = DataObjectUtil.createDataObject(EduEntityName);
                	HSSFRow eduRow = sheet.getRow(eduInit+k);
                	HSSFCell startCell = eduRow.getCell((short)3);
                	String startdate = getCellFormatValue(startCell);
                	HSSFCell endCell = eduRow.getCell((short)4);
                	String enddate = getCellFormatValue(endCell);
                	HSSFCell degreeCell = eduRow.getCell((short)5);
                	String degree = getCellFormatValue(degreeCell);
                	HSSFCell graduschoolCell = eduRow.getCell((short)6);
                	String graduschool = getCellFormatValue(graduschoolCell);
                	HSSFCell professionCell = eduRow.getCell((short)7);
                	String profession = getCellFormatValue(professionCell);
                	eduEntitys[k].set("startdate", startdate);
                	eduEntitys[k].set("enddate", enddate);
                	eduEntitys[k].set("degree", degree);
                	eduEntitys[k].set("graduschool", graduschool);
                	eduEntitys[k].set("profession", profession);
                }
                emp.set("edus", eduEntitys);
            }
            
            int end = 0;
            for(int o=0;o<sheet.getPhysicalNumberOfRows();o++){
            	HSSFRow row = sheet.getRow(o);
            	HSSFCell cell = row.getCell((short)3);
            	String flag=null;
            	if(cell==null){
            		continue;
            	}else if(cell.getCellType()==HSSFCell.CELL_TYPE_NUMERIC){
        			 if (HSSFDateUtil.isCellDateFormatted(cell)){
        	                SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        	                flag= dateFormat.format((cell.getDateCellValue()));
        	             }else{  
        	            	 flag=String.valueOf((long) cell.getNumericCellValue());  
        	             }
        		}else if(cell.getCellType()==HSSFCell.CELL_TYPE_BOOLEAN){
        			flag=cell.getBooleanCellValue()+"";
        		}else{
        			flag=cell.getRichStringCellValue().getString();
        		}
        		
        		if(flag.equals("合同结束时间")){
        			end = o+1;
        		}
            }
            
            //人员合同信息
            DataObject con=DataObjectUtil.createDataObject(ConEntityName);
            //转正信息
            DataObject ver=DataObjectUtil.createDataObject(VerEntityName);
            HSSFRow conRow = sheet.getRow(end);
            
            //合同日期
            HSSFCell constartCell = conRow.getCell((short)2);
            String contstart = getCellFormatValue(constartCell);
            HSSFCell contendCell = conRow.getCell((short)3);
            String contend = getCellFormatValue(contendCell);
            HSSFCell conttypeCell = conRow.getCell((short)4);
            String conttype = getCellFormatValue(conttypeCell);
            //试用日期
            HSSFCell veristartCell = conRow.getCell((short)5);
            String veristart = getCellFormatValue(veristartCell);
            HSSFCell veriendCell = conRow.getCell((short)6);
            String veriend = getCellFormatValue(veriendCell);
            //公司邮箱
            HSSFCell oemailCell = conRow.getCell((short)7);
            String oemail = getCellFormatValue(oemailCell);
            
            if(contstart.equals("/")){
            	contstart=null;
            }
            if(contend.equals("/")){
            	contend=null;
            }
            if(conttype.equals("/")){
            	conttype=null;
            }
            if(veristart.equals("/")){
            	veristart=null;
            }
            if(veriend.equals("/")){
            	veriend=null;
            }
            if(oemail.equals("/")){
            	oemail=null;
            }
            
            emp.set("oemail", oemail);
            
            if(contstart != null||contend!=null||conttype!=null){
                con.set("contstart", contstart);
                con.set("contend", contend);
                con.set("conttype", conttype);
            }
            
            if(veristart != null||veriend!=null){
            	ver.set("veristart", veristart);
            	ver.set("veriend", veriend);
            }
            
            
            //操作员信息
            DataObject ac=DataObjectUtil.createDataObject(AcEntityName);
            //人员级别信息
            DataObject level=DataObjectUtil.createDataObject(LevelEntityName);
            
            HSSFRow acRow = sheet.getRow(end+1);
            HSSFRow lastRow = sheet.getRow(end+2);
            
            String  empDegree = getCellFormatValue(acRow.getCell((short) 3));//人员类型
            String  userid = getCellFormatValue(acRow.getCell((short) 5));
            String  orgname = getCellFormatValue(lastRow.getCell((short) 3));
            String  empcode = getCellFormatValue(lastRow.getCell((short) 5));
            String  degree = getCellFormatValue(lastRow.getCell((short) 7));//人员级别
            
            if(empDegree.equals("/")){
            	empDegree=null;
            }else{
            	if(empDegree.equals("销售")){
            		emp.set("degree", "销售");
            	}else{
            		emp.set("degree", "人员");
            	}
            }
            if(userid.equals("/")){
            	userid=null;
            }else{
            	emp.set("userid", userid);
            	ac.set("userid",userid);
            	ac.set("password",password);
            	ac.set("operatorname",empname);
            	ac.set("authmode","local");
            	ac.set("status","running");
            	ac.set("menutype","default");
            }
            if(orgname.equals("/")){
            	orgname=null;
            }else{
            	emp.set("orgname", orgname);
            }
            if(empcode.equals("/")){
            	empcode=null;
            }else{
            	emp.set("empcode",empcode);
            }
            if(degree.equals("/")){
            	degree = null;
            	level = null;
            }else{
            	commonj.sdo.DataObject prices = commonj.sdo.helper.DataFactory.INSTANCE.create("com.primeton.eos.common.newdataset","MisPrice");
            	prices.set("currentstate", "1");
            	DatabaseUtil.expandEntityByTemplate("default", prices, prices);
            	level.set("userid", userid);
            	level.set("degree", degree);
            	level.set("startdate",prices.get("closedate"));
            	level.set("percostid",prices.get("percostid"));
            	level.set("enddate",indate);
            	level.set("isworkrate","1");
            	level.set("currentstate","1");
            }
            emp.set("ac",ac);
            emp.set("con",con);
            emp.set("ver",ver);
            DataObject [] oEmplevels = new DataObject[1];
            oEmplevels[0] = level;
            emp.set("oEmplevels",oEmplevels);
            result[i] = emp;
        }
    	
        return result;
    }
    
    /**
     * 将目标Excel文件的内容导入到数据表
     * @param targetFile Excel文件路径
     * @param entityName SDO数据实体全名..
     * @return 返回1 导入成功
     *
     * @throws Exception
     */
    public Map importExcelBill(String excelFile)throws Exception{
    	POIFSFileSystem fs =new POIFSFileSystem(new FileInputStream(excelFile));
        HSSFWorkbook wb = new HSSFWorkbook(fs);
        HSSFSheet sheet = wb.getSheetAt(0);
        int total = sheet.getPhysicalNumberOfRows();
        Map<Integer, Map>  map1 = new HashMap<Integer, Map>();
        int l = 0;
        for(int i=1;i<total;i++){
        	HSSFRow row = sheet.getRow(i);
        	HSSFCell zero = row.getCell((short) 0);//合同编号
        	HSSFCell one = row.getCell((short) 1);//开票日期
        	HSSFCell two = row.getCell((short) 2);//发票号
        	HSSFCell three = row.getCell((short) 3);//开票名称
        	HSSFCell four = row.getCell((short) 4);//开票内容
        	HSSFCell five = row.getCell((short) 5);//开票类型
        	HSSFCell salenameCell = row.getCell((short) 6);//销售姓名
        	HSSFCell six = row.getCell((short) 7);//销售额，不含税金额
        	HSSFCell seven = row.getCell((short) 8);//税金
        	HSSFCell eight = row.getCell((short) 9);//含税金额
        	
        	String contnum = getCellFormatValue(zero);
        	if(contnum==null||contnum==""){
        		break;
        	}
        	String billdate = getCellFormatValue(one);
        	String billno = getCellFormatValue(two);
        	String custname = getCellFormatValue(three);
        	String productname = getCellFormatValue(four);
        	String typename = getCellFormatValue(five);
        	String salename = getCellFormatValue(salenameCell);
        	BigDecimal u8xse = new BigDecimal(0);
        	BigDecimal tax = new BigDecimal(0);
        	BigDecimal money = new BigDecimal(0);
        	
        	
        	if(!getCellFormatValue(six).toString().isEmpty()||getCellFormatValue(six).toString()!=null){
        		u8xse = new BigDecimal(getCellFormatValue(six).toString());
        	}
        	if(!getCellFormatValue(seven).toString().isEmpty()||getCellFormatValue(seven).toString()!=null){
        		tax = new BigDecimal(getCellFormatValue(seven).toString());
        	}
        	if(!getCellFormatValue(eight).toString().isEmpty()||getCellFormatValue(eight).toString()!=null){
        		money = new BigDecimal(getCellFormatValue(eight).toString());
        	}
        	String u8xseS = u8xse.toString();
        	String taxS = tax.toString();
        	String moneyS = money.toString();
        	
        	BigDecimal u8xseTotal = u8xse;
        	BigDecimal taxTotal = tax;
        	BigDecimal moneyTotal = money;
        	
        	for(int k=i+1;k<total;k++){
        		HSSFRow row1 = sheet.getRow(k);
            	HSSFCell two1 = row1.getCell((short) 2);//发票号
            	
            	String billno1 = getCellFormatValue(two1);
        		if(billno.equals(billno1)){
        			HSSFCell four1 = row1.getCell((short) 4);//开票内容
        			HSSFCell salenameCell1 = row1.getCell((short) 6);//开票内容
                	HSSFCell six1 = row1.getCell((short) 7);//销售额
                	HSSFCell seven1 = row1.getCell((short) 8);//税金
                	HSSFCell eight1 = row1.getCell((short) 9);//含税金额
                	
                	BigDecimal u8xse1 = new BigDecimal(0);
                	BigDecimal tax1 = new BigDecimal(0);
                	BigDecimal money1 = new BigDecimal(0);
                	String productname1 = getCellFormatValue(four1);
                	String salename1 = getCellFormatValue(salenameCell1);
                	
                	if(getCellFormatValue(six1)!=null&&!getCellFormatValue(six1).isEmpty()){
                		u8xse1 = new BigDecimal(getCellFormatValue(six1).toString());
                	}
                	if(getCellFormatValue(seven1)!=null&&!getCellFormatValue(seven1).isEmpty()){
                		tax1 = new BigDecimal(getCellFormatValue(seven1).toString());
                	}
                	if(getCellFormatValue(eight1)!=null&&!getCellFormatValue(eight1).isEmpty()){
                		money1 = new BigDecimal(getCellFormatValue(eight1).toString());
                	}
                	String u8xseS1 = u8xse1.toString();
                	String taxS1 = tax1.toString();
                	String moneyS1 = money1.toString();
                	
        			productname += "," + productname1;
        			salename += "," + salename1;
        			u8xseS += "," + u8xseS1;
        			taxS += "," + taxS1;
        			moneyS += "," + moneyS1;
        			
        			u8xseTotal = u8xseTotal.add(u8xse1);
        			taxTotal = taxTotal.add(tax1);
        			moneyTotal = moneyTotal.add(money1);
        			i=k;
        		}else{
        			break;
        		}
        	}
        	String [] names = salename.split(",");
        	String [] prodns = productname.split(",");
        	String ids = null;
        	commonj.sdo.DataObject cs = commonj.sdo.helper.DataFactory.INSTANCE.create("com.primeton.mis.contract.contract","CsContract");
        	cs.set("contnum", contnum);
        	DatabaseUtil.expandEntityByTemplate("default", cs, cs);
        	Long contractid = (Long) cs.get("contractid");
        	for(int p=0;p<names.length;p++){
        		commonj.sdo.DataObject data = commonj.sdo.helper.DataFactory.INSTANCE.create("com.primeton.mis.contract.contract","CsContractsale");
        		data.set("contractid",cs.get("contractid"));
        		data.set("salename",names[p]);
        		DatabaseUtil.expandEntityByTemplate("default", data, data);
        		Long contsaleid = (Long) data.get("contsaleid");
        		if(typename.equals("服务")){
        			if(ids==null){
        				ids = contsaleid.toString();
        			}else{
        				ids += "," + contsaleid.toString();
        			}
        		}else{
        			commonj.sdo.DataObject eos = commonj.sdo.helper.DataFactory.INSTANCE.create("com.primeton.eos.ame_product.ame_product","QuoProd");
        			eos.set("prodname", prodns[p]);
        			DatabaseUtil.expandEntityByTemplate("default", eos, eos);
        			BigDecimal prodid = (BigDecimal) eos.get("prodid");
        			
        			commonj.sdo.DataObject prod = commonj.sdo.helper.DataFactory.INSTANCE.create("com.primeton.mis.contract.contract","CsContractProduct");
        			prod.set("contractid",contractid);
        			prod.set("contsaleid",contsaleid);
        			prod.set("prodname",prodid);
        			DatabaseUtil.expandEntityByTemplate("default", prod, prod);
        			
        			Long conProId = (Long) prod.get("conProId");
        			if(ids==null){
        				ids = conProId.toString();
        			}else{
        				ids += "," + conProId.toString();
        			}
        		}
        	}
        	
        	Map<String, String> map = new HashMap<String, String>();
        	map.put("ids", ids);
        	map.put("contnum", contnum);
        	map.put("billdate", billdate);
        	map.put("billno", billno);
        	map.put("custname", custname);
        	map.put("productname", productname);
        	map.put("typename", typename);
        	map.put("u8xseTotal", u8xseTotal.toString());
        	map.put("taxTotal", taxTotal.toString());
        	map.put("moneyTotal", moneyTotal.toString());
        	map.put("u8xseS", u8xseS);
        	map.put("taxS", taxS);
        	map.put("moneyS", moneyS);
        	map.put("salename", salename);
        	map1.put(l, map);
        	l++;
        }
        return map1;
    }
    
    /**
     * 将目标Excel文件的内容导入到数据表
     * @param targetFile Excel文件路径
     * @param entityName SDO数据实体全名
     * @return 返回1 导入成功
     *
     * @throws Exception
     */
    public DataObject[] importDataOut(String targetFile)throws Exception{
    	POIFSFileSystem fs =new POIFSFileSystem(new FileInputStream(targetFile));
        HSSFWorkbook wb = new HSSFWorkbook(fs);
        HSSFSheet sheet = wb.getSheetAt(0);
        Integer total = sheet.getLastRowNum();
        DataObject [] datas = new DataObject[total];
        
        for(int i=1;i<sheet.getPhysicalNumberOfRows();i++){
        	HSSFRow row = sheet.getRow(i);
        	commonj.sdo.DataObject data = commonj.sdo.helper.DataFactory.INSTANCE.create("com.primeton.eos.ame_pur.ame","PurOutCount");

        	HSSFCell standarddays1 =row.getCell((short) 10);
        	HSSFCell adddays1 =row.getCell((short) 15);
        	HSSFCell agreeddays1 =row.getCell((short) 17);
        	HSSFCell remark1 =row.getCell((short) 18);
        	HSSFCell updatedays1 =row.getCell((short) 19);//公式
        	HSSFCell signoutnum1 =row.getCell((short) 23);//公式
        	HSSFCell losedays1 =row.getCell((short) 24);
        	HSSFCell months1 =row.getCell((short) 26);//公式
        	HSSFCell accruedcost1 =row.getCell((short) 27);//公式
        	HSSFCell penaltycost1 =row.getCell((short) 28);//公式
        	HSSFCell attendanceid1 =row.getCell((short) 29);//公式
        	
        	String standarddays = getCellFormatValue(standarddays1);
        	String adddays = getCellFormatValue(adddays1);
        	String agreeddays = getCellFormatValue(agreeddays1);
        	String remark = getCellFormatValue(remark1);
        	String updatedays = getCellFormatValue(updatedays1);
        	String signoutnum = getCellFormatValue(signoutnum1);
        	String losedays = getCellFormatValue(losedays1);
        	String months = getCellFormatValue(months1);
        	String accruedcost = getCellFormatValue(accruedcost1);
        	String penaltycost = getCellFormatValue(penaltycost1);
        	String attendanceid = getCellFormatValue(attendanceid1);
        	
        	data.set("standarddays", standarddays);
        	data.set("adddays", adddays);
        	data.set("agreeddays", agreeddays);
        	data.set("remark", remark);
        	data.set("updatedays", updatedays);
        	data.set("signoutnum", signoutnum);
        	data.set("losedays", losedays);
        	data.set("months", months);
        	data.set("accruedcost", accruedcost);
        	data.set("penaltycost", penaltycost);
        	data.set("attendanceid", attendanceid);
        	
        	datas[i-1] = data;
        	
        }
    	return datas;
    }
    
    
    /**
     * 根据HSSFCell类型设置数据
     * @param cell
     * @return
     */
    private String getCellFormatValue(HSSFCell cell) {
        String cellvalue = "";
        if (cell != null) {
            // 判断当前Cell的Type
            switch (cell.getCellType()) {
            // 如果当前Cell的Type为NUMERIC
            case HSSFCell.CELL_TYPE_NUMERIC:
            case HSSFCell.CELL_TYPE_FORMULA: {
                // 判断当前的cell是否为Date
                if (HSSFDateUtil.isCellDateFormatted(cell)) {
                    // 如果是Date类型则，转化为Data格式
                    
                    //方法1：这样子的data格式是带时分秒的：2011-10-12 0:00:00
                    //cellvalue = cell.getDateCellValue().toLocaleString();
                    
                    //方法2：这样子的data格式是不带带时分秒的：2011-10-12
                    Date date = cell.getDateCellValue();
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                    cellvalue = sdf.format(date);
                    
                }else if(cell.getCellType()==HSSFCell.CELL_TYPE_FORMULA){
                	cellvalue = String.valueOf(cell.getNumericCellValue());
            		if(cellvalue.equals("NaN")){
            			cellvalue = cell.getRichStringCellValue().toString();
            		}
                }
                // 如果是纯数字
                else {
                    // 取得当前Cell的数值
                    cellvalue = String.valueOf(cell.getNumericCellValue());
                }
                break;
            }
            // 如果当前Cell的Type为STRIN
            case HSSFCell.CELL_TYPE_STRING:
                // 取得当前的Cell字符串
                cellvalue = cell.getRichStringCellValue().getString();
                break;
            // 默认的Cell值
            default:
                cellvalue = " ";
            }
        } else {
            cellvalue = "";
        }
        return cellvalue;

    }
    
    /*
     * 该行是否为空
     * 用于导入简历
     */
    private boolean isRowEmpty(HSSFRow row){
	    if(row == null){
	    	return true;
	    }else{
    		for(int i=0;i<9;i++){
	    		HSSFCell cell = row.getCell((short)i);
	    		if(cell!=null && cell.getCellType()!=HSSFCell.CELL_TYPE_BLANK){
	    			return false;
	    		}
	    	}
	    	return true;
	    }
    }


    /**
     * 如果模板文件是否存在
     * @param filename 模板文件名
     * @return 文件存在返回true,否则false
     * @throws IOException
     */
    protected boolean isExistTemplate(String templateFile)throws IOException{
    	File file=new File(templateFile);
    	return file.exists();

    }


    /**
     * 预初始化模板文件<BR>
     * 当用户指定的模板文件不存在时，将自动生成指定的模板文件，并第一行设置为要导出的字段列
     * @param templateFile 模板文件名
     * @param dataObject 数据实体对象
     * @throws Exception
     */
    public void prepareInitializeTemplate(String templateFile,DataObject dataObject) throws Exception{
    	 HSSFWorkbook wb = new HSSFWorkbook();
    	 FileOutputStream fileOut = new FileOutputStream(templateFile);
    	 HSSFSheet sheet = wb.createSheet("new sheet");
    	 //设置模板的第一行为输出字段定义列
    	 HSSFRow row = sheet.createRow((short)0);

    	 Object[] properties=dataObject.getType().getDeclaredProperties().toArray();
    	 for(int i=0;i<properties.length;i++){
    		 PropertyImpl property=(PropertyImpl)properties[i];
	    	 HSSFCell cell = row.createCell((short)i);
	    	 HSSFRichTextString text=new HSSFRichTextString("#"+property.getName());
	    	 cell.setCellValue(text);
    	 }
    	 wb.write(fileOut);
    	 fileOut.close();

    }
    
    /**
     * 
     * @param Excel工作簿对象
     * @param 模板Sheet页
     * @param 新建Sheet页
     * @param 模板页的第一行
     * @param 模板页的最后一行
     */
    private static void copySheet(HSSFWorkbook wb, HSSFSheet fromsheet, HSSFSheet newSheet, int firstrow, int lasttrow) {
     // 复制一个单元格样式到新建单元格
     if ((firstrow == -1) || (lasttrow == -1) || lasttrow < firstrow) {
      return;
     }
     // 复制合并的单元格
     CellRangeAddress region = null;
     for (int i = 0; i < fromsheet.getNumMergedRegions(); i++) {
      region = fromsheet.getMergedRegion(i);
      if ((region.getFirstRow() >= firstrow) && (region.getLastRow() <= lasttrow)) {
       newSheet.addMergedRegion(region);
      }
     }
     HSSFRow fromRow = null;
     HSSFRow newRow = null;
     HSSFCell newCell = null;
     HSSFCell fromCell = null;
     // 设置列宽
     for (int i = firstrow; i < lasttrow; i++) {
      fromRow = fromsheet.getRow(i);
      if (fromRow != null) {
       for (int j = fromRow.getLastCellNum(); j >= fromRow.getFirstCellNum(); j--) {
        int colnum = fromsheet.getColumnWidth((short) j);
        if (colnum > 100) {
         newSheet.setColumnWidth((short) j, (short) colnum);
        }
        if (colnum == 0) {
         newSheet.setColumnHidden((short) j, true);
        } else {
         newSheet.setColumnHidden((short) j, false);
        }
       }
       break;
      }
     }
     // 复制行并填充数据
     for (int i = 0; i < lasttrow; i++) {
      fromRow = fromsheet.getRow(i);
      if (fromRow == null) {
       continue;
      }
      newRow = newSheet.createRow(i - firstrow);
      //设置隐藏行
      boolean ishide = fromRow.getZeroHeight();
      if(ishide){
    	  newRow.setZeroHeight(true);
      }
      newRow.setHeight(fromRow.getHeight());
      for (int j = fromRow.getFirstCellNum(); j <= fromRow.getLastCellNum(); j++) {
       fromCell = fromRow.getCell((short) j);
       if (fromCell == null) {
        continue;
       }
       newCell = newRow.createCell((short) j);
       newCell.setCellStyle(fromCell.getCellStyle());
       int cType = fromCell.getCellType();
       newCell.setCellType(cType);
       switch (cType) {
        case HSSFCell.CELL_TYPE_STRING:
         newCell.setCellValue(fromCell.getRichStringCellValue());
         break;
        case HSSFCell.CELL_TYPE_NUMERIC:
         newCell.setCellValue(fromCell.getNumericCellValue());
         break;
        case HSSFCell.CELL_TYPE_FORMULA:
         newCell.setCellFormula(fromCell.getCellFormula());
         break;
        case HSSFCell.CELL_TYPE_BOOLEAN:
         newCell.setCellValue(fromCell.getBooleanCellValue());
         break;
        case HSSFCell.CELL_TYPE_ERROR:
         newCell.setCellValue(fromCell.getErrorCellValue());
         break;
        default:
         newCell.setCellValue(fromCell.getRichStringCellValue());
         break;
       }
      }
     }
    }
    
}
