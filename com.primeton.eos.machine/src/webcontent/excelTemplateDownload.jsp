<%@page pageEncoding="UTF-8"%>
<%@include file="/common/common.jsp"%>
<%@include file="/common/skins/skin0/component.jsp" %>
<html>
<h:css href="/css/style1/style-custom.css"/>
<!-- 
  - Author(s): huangqj
  - Date: 2014-09-17 15:57:29
  - Description:
-->
<head>
<title>机器管理模块上传模版</title>
</head>
<body>
	<w:panel id="panel1" width="100%" title="Excel上传模版">
	<table align="center" border="0" width="100%" class="form_table">
		<tr>
			<td class="form_label">
				Excel 文件要求：<br/>
				(1)上传用的 Excel 文件版本为 97-2003 版本，即 .xls 为后缀的版本，数据全部放在第一个工作表内，数据要从第三行开始填写。<br/>
				(2)可以下载 Excel 模板文件，模板中的所有说明性文字不用去掉，数据列要与模板文件中的列一致。<br/>
				(3)如果数据的"资产编号"为空或者已存在，则该条数据不会录入
			</td>
			<td colspan="3"><a href="/default/abframe/import-template/importExcelTemplate.xls">点击下载
			Excel 添加模板文件</a></td>
			<td colspan="3"><a href="/default/abframe/import-template/scrapTemplate.xls">点击下载
			Excel 报废模板文件</a></td>
		</tr>
	</table>
	</w:panel>
</body>
</html>