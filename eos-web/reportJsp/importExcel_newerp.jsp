<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/WEB-INF/runqianReport4.tld" prefix="report" %>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.runqian.report4.usermodel.Context"%>
<html> 
<link type="text/css" href="css/style.css" rel="stylesheet"/>

<head>
<title>Excel Import</title>
</head>
<%@ include file="raqLinkFunction.jsp" %>
<%
request.setCharacterEncoding( "GBK" );
String report = request.getParameter( "raq" );
String reportFileHome=Context.getInitCtx().getMainDir();
StringBuffer param=new StringBuffer();

//保证报表名称的完整性
int iTmp = 0;
if( (iTmp = report.lastIndexOf(".raq")) <= 0 ){
	report = report + ".raq";
	iTmp = 0;
}

Enumeration paramNames = request.getParameterNames();
if(paramNames!=null){
	while(paramNames.hasMoreElements()){
		String paramName = (String) paramNames.nextElement();
		String paramValue=request.getParameter(paramName);
		if(paramValue!=null){
			//把参数拼成name=value;name2=value2;.....的形式
			param.append(paramName).append("=").append(paramValue).append(";");
		}
	}
}

//以下代码是检测这个报表是否有相应的参数模板
String paramFile = report.substring(0,iTmp)+"_arg.raq";
File f=new File(application.getRealPath(reportFileHome+ File.separator +paramFile));

%>

<script language=javascript>
function _bindingEditor( cell ) {
	cell.bgColor="#FF0000";
	var oldvalue="";
	if(report1.currCell)
		oldvalue=report1.currCell.value;
		var table = _lookupTable( cell );
	if( ! _submitEditor( table ) ) return; //将当前编辑框的数据输入到table中去
	if(report1.currCell)
	if(report1.currCell&&report1.currCell.value!=oldvalue) {
		report1.currCell.style.backgroundColor="#FF0000";//修改背景色样式
		report1.currCell.oldBkcolor="#FF0000";//修改系统默认读取的单元格背景色
	}
	var editor = _lookupEditor( table, cell );
	table.currEditor = editor;
	_setRowColBackColor( cell );
	_setEditorStyle( editor, cell );
}
</script>

<body>

<% //这里为两种方法准备图片连接的公共部分
String appmap = request.getContextPath();
String printImage = "<img alt=打印 src='" + appmap + "/images/print.gif' border=no style='vertical-align:middle' title='打印'>";
String wordImage = "<img alt=导出Word src='" + appmap + "/images/doc.gif' border=no style='vertical-align:middle' title='导出到Word'>";
String excelImage = "<img alt=导出excel src='" + appmap + "/images/excel.gif' border=no style='vertical-align:middle' title='导出到excel'>";
String pdfImage = "<img alt=导出PDF文件 src='" + appmap + "/images/pdf.gif' border=no style='vertical-align:middle' title='导出到PDF文件'>";
String firstPageImage = "<img src='" + appmap + "/images/firstpage.gif' border=no style='vertical-align:middle' title=''>";
String lastPageImage = "<img src='" + appmap + "/images/lastpage.gif' border=no style='vertical-align:middle' title=''>";
String nextPageImage = "<img src='" + appmap + "/images/nextpage.gif' border=no style='vertical-align:middle' title=''>";
String prevPageImage = "<img src='" + appmap + "/images/prevpage.gif' border=no style='vertical-align:middle' title=''>";
String submitImage = "<img alt=保存到数据库 src='" + appmap + "/images/savedata.gif' border=no style='vertical-align:middle' title='保存到数据库'>";
String importExcelImage = "<img alt=导入Excel文件 src='" + appmap + "/images/importExcel.gif' border=no style='vertical-align:middle' title='导入Excel文件'>";

String titleName="数据";
String test="";
String deleteStr="";
if(report.indexOf("erp_income")!=-1){
	titleName="收入数据";
	test="doUpdateID('income')";
	deleteStr="doDeleteID('income')";
}
if(report.indexOf("erp_ps")!=-1){
	titleName="工时数据";
	test="doUpdateID('ps')";
	deleteStr="doDeleteID('ps')";
}

%>
<br/>
<table align="center">
	<tr>
		<td align="center"><%=titleName %>--Excel导入并入库功能表</td>
	</tr>
</table>
<br/>
<table align=center>
	<tr><td>
<report:html name="report1" 
	reportFileName="<%=report%>" 

	needImportExcel="yes" 
	importExcelLabel="<%=importExcelImage%>"

/>


	</td></tr>
	<tr><td>
	<table>
		<tr>
			<td><input type="button" onclick="<%=test %>" value="导入数据生成对应ID"></td>
			<td>&nbsp;&nbsp;&nbsp;</td>
			<td>请选择要删除的年份和月份：</td>
			<td>
			
			<form id="myForm"  method="get">
			<select name="select_year">
				<option value="2011">2011年</option>
				<option value="2012">2012年</option>
				<option value="2013">2013年</option>
			</select>
			
<%
	if(report.indexOf("erp_ps")!=-1){
%>			
			<select name="select_month">
				<option value="1">1月</option>
				<option value="2">2月</option>
				<option value="3">3月</option>
				<option value="4">4月</option>
				<option value="5">5月</option>
				<option value="6">6月</option>
				<option value="7">7月</option>
				<option value="8">8月</option>
				<option value="9">9月</option>
				<option value="10">10月</option>
				<option value="11">11月</option>
				<option value="12">12月</option>
			</select>
<%
}
 %>
			<input type="button" onclick="<%=deleteStr %>" value="删除对应年月的已有数据">	
		</form>
			
			</td>
		</tr>
	</table>
			
		
		
	</td></tr>
</table>


</body>

</html>
