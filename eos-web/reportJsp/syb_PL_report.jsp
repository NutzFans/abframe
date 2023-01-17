<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/WEB-INF/runqianReport4.tld" prefix="report" %>

<%
String info="deptno="+request.getParameter("deptno")+";year=2013";
String deptno=request.getParameter("deptno");

 //这里为两种方法准备图片连接的公共部分
String appmap = request.getContextPath();
String printImage = "<img alt=打印 src='" + appmap + "/images/print.gif' border=no style='vertical-align:middle'>";
String wordImage = "<img alt=导出Word src='" + appmap + "/images/doc.gif' border=no style='vertical-align:middle'>";
String excelImage = "<img alt=导出excel src='" + appmap + "/images/excel.gif' border=no style='vertical-align:middle'>";
String pdfImage = "<img alt=导出PDF文件 src='" + appmap + "/images/pdf.gif' border=no style='vertical-align:middle'>";
String firstPageImage = "<img src='" + appmap + "/images/firstpage.gif' border=no style='vertical-align:middle'>";
String lastPageImage = "<img src='" + appmap + "/images/lastpage.gif' border=no style='vertical-align:middle'>";
String nextPageImage = "<img src='" + appmap + "/images/nextpage.gif' border=no style='vertical-align:middle'>";
String prevPageImage = "<img src='" + appmap + "/images/prevpage.gif' border=no style='vertical-align:middle'>";
String submitImage = "<img alt=保存到数据库 src='" + appmap + "/images/savedata.gif' border=no style='vertical-align:middle'>";
String importExcelImage = "<img alt=导入Excel文件 src='" + appmap + "/images/importExcel.gif' border=no style='vertical-align:middle'>";
%>

<table align=center>
<tr><td>
<% if(deptno.length()!=0 ){ 
		String reportName="";
		switch(Integer.parseInt(deptno)){
		 case (34):
		 reportName="dept_PL_Middleware.raq";
	            break;
		 case (35):
		 reportName="dept_PL_public.raq";
		 break;
		 case (36):
		 reportName="dept_PL_finance.raq";
		 break;
	}
%>

<report:html name="report1" reportFileName="<%=reportName %>"
				params=""
				 
				needSaveAsPdf="yes" 
				needSaveAsWord="yes" 
				needPrint="yes" 
				needSaveAsExcel="yes"
				
				wordLabel="<%=wordImage%>"
				excelLabel="<%=excelImage%>"
				pdfLabel="<%=pdfImage%>"
				printLabel="<%=printImage %>"
				appletJarName="runqianReport4Applet.jar,dmGraphApplet.jar"
/>

<%}else{ %>
<report:html name="report1" reportFileName="report_0.raq"/>
<%} %>
</td></tr>
<!--  
<tr><td>
<%=deptno %>
</td></tr>
-->
 
</table>


</body>
</html>