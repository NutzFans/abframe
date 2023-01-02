<%@page pageEncoding="UTF-8"%>
<%@include file="/common/common.jsp"%>
<%@include file="/common/skins/skin0/component.jsp" %>
<html>
<!-- 
  - Author(s): EPCNB324
  - Date: 2016-07-18 17:00:34
  - Description:
-->
<head>
<title>人事入离转数据导入页面</title>
<h:css href="/css/style1/style-custom.css" />
</head>
<body>

<w:panel id="panel1" width="100%" title="人事表导入过程">
	<table align="center" border="0" width="100%" class="form_table">
		<tr>
			<td class="form_label">1. 指定导入时间</td>
			<td colspan="3">
			请选择:
				 <w:date format="yyyy年MM月dd日" property=="InsertData" defaultNull="false"/>
 				 &nbsp;&nbsp;&nbsp;&nbsp; 
 			</td>
		</tr>
		<tr>
			<td class="form_label">
				2. Excel 文件要求：<br/>
				(1)上传用的 Excel 文件版本为 97-2003 版本，即 .xls 为后缀的版本，数据全部放在第一个工作表内，数据要从第三行开始填写。<br/>
				(2)可以下载 Excel 模板文件，模板中的所有说明性文字不用去掉，数据列要与模板文件中的列一致。<br/>
				(3)如果数据的“年”或“月”列为空，那么此条数据会被视为不符合条件的数据，不会导入。
			</td>
			<td colspan="3"><a href="/default/psTemplate.xls">点击下载
			Excel 模板文件</a></td>
		</tr>

		<tr>
			<td class="form_label">3.上传增加好数据的 Excel 文件</td>
			<td colspan="3">
				<form id="form1" action="com.primeton.xbb.importExcel.readPS.flow" method="post" enctype="multipart/form-data">
					<input id="action" type="hidden" name="_eosFlowAction" value="action1">
					<h:file name="uploadFile" /> 
					&nbsp;&nbsp;&nbsp;&nbsp; 
					<input type="submit" align="left" value="提交">
				</form>
			</td>
		</tr>

	</table>
</w:panel>
<br/>

<w:panel id="list_panel" width="100%" title="excel 模板文件样式">
	<table align="center" border="0" width="100%" class="EOS_table">
		<tr>
			<th>年</th>
			<th>月</th>
			<th>姓名</th>
			<th>部门</th>
			<th>项目名称</th>
			<th>项目编号</th>
			<th>日期</th>
			<th>单价</th>
			<th>工时</th>
			<th>成本</th>
			<th>受益人</th>
			<th>受益人部门</th>
		</tr>
		<tr>
			<th>必填</th>
			<th>必填</th>
			<th></th>
			<th></th>
			<th></th>
			<th></th>
			<th>日期型：yyyy-MM-dd</th>
			<th>数值型</th>
			<th>数值型</th>
			<th>数值型</th>
			<th></th>
			<th>准确的部门全名</th>
		</tr>
	</table>
</w:panel>

</body>
</html>