package com.primeton.xbb.importExcel;

import java.text.SimpleDateFormat;


import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.primeton.das.sql.impl.ibatis.sqlmap.engine.type.SimpleDateFormatter;
import com.runqian.report4.usermodel.input.AbstractExcelListener;
import com.sun.org.apache.xerces.internal.impl.xpath.regex.ParseException;

public class myExcelImportRule extends AbstractExcelListener {
	public void process() throws Throwable{
		int rowNum=excelReport.getRowCount();
		short k=excelReport.getColCount();
		int colNum=k;
		System.out.println("行为"+rowNum+"列为"+colNum);
		List<String> list = new ArrayList<String>();
		list.add("华东政企事业部");list.add("华南政企事业部");list.add("北方政企事业部");list.add("北方金融事业部");
		list.add("南方金融事业部");list.add("华东金融事业部");list.add("大客户事业部");list.add("电网事业部");
		list.add("能源事业部");list.add("发电事业部");list.add("通信事业部");list.add("华南公共事业部");list.add("西北区域");
		list.add("西南区域");list.add("解决方案中心");list.add("武汉交付中心");list.add("事业部 小计");list.add("运营平台 合计");
		list.add("产品平台 合计");list.add("支撑平台 合计");list.add("普元 总计");list.add(null);
		for(int j=1;j<=rowNum;++j){
			for(int i=1;i<=colNum;++i){
				Object obj=excelReport.getCell( j, (short)i ).getValue();
				//判断日期是否输入正确
				if(i==6 && j==1)
				{
					SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
					boolean convertSuccess=true;
					try {
						// 设置lenient为false. 否则SimpleDateFormat会比较宽松地验证日期，比如2007/02/29会被接受，并转换成2007/03/01
						format.setLenient(false);
						format.parse(obj.toString());
						} catch (Exception e) {
						 e.printStackTrace();
						// 如果throw java.text.ParseException或者NullPointerException，就说明格式不对
						convertSuccess=false;
				        }
					if(convertSuccess==false){
						throw new Exception( "导入的excel文件中第"+j+"行第"+i+"列,“"+obj.toString()+"”"+"不是正确的日期格式，应为yyyy-MM-dd" );
					}
				}
				
				if(i==1 && j>2 ){
					if(obj!=null){
						if(!list.contains(obj.toString())){
							throw new Exception( "导入的excel文件中第"+j+"行第"+i+"列,“"+obj.toString()+"”"+"不是正确事业部名称");
						}	
					}
				}
				if(i>1 &&j>2){
					if(obj!=null && !obj.toString().equals("#DIV/0!"))
					{
						Pattern pattern = Pattern.compile("[0-9]*");
				           Matcher isNum = pattern.matcher(obj.toString());
				           if( !isNum.matches() ){
				               System.out.println("不是数字");
				               return;
				           }
				           System.out.println("是数字");
						/*for(int l=obj.toString().length();--l>=0;){
						      int chr=obj.toString().charAt(l);
						      if(chr<48 || chr>57)
						      {
						    	throw new Exception( "导入的excel文件中第"+j+"行第"+i+"列,“"+obj.toString()+"”"+"非数字" );
						      }
						   }*/
					}
					 
				}
			}
		}
	}
}
