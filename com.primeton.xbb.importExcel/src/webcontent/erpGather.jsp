<%@page pageEncoding="UTF-8"%>
<%@include file="/common/common.jsp"%>
<%@include file="/common/skins/skin0/component.jsp" %>
<html>
<!-- 
  - Author(s): xuqq
  - Date: 2017-03-30 10:18:35
  - Description:
-->
<head>
<title>收款分年导入</title>
<h:css href="/css/style1/style-custom.css" />
</head>
<body>
<w:panel id="panel1" width="100%" title="收入表导入过程">
	<table align="center" border="0" width="100%" class="form_table">
		<tr>
			<td class="form_label">1. 删除指定年月的已有数据</td>
			<td colspan="3">

			请选择:
				<h:select id="select1" property="year">
					<h:option label="2018" value="2018"/>
					<h:option label="2017" value="2017"/>
					<h:option label="2016" value="2016"/>
					<h:option label="2015" value="2015"/>
					<h:option label="2014" value="2014"/>
					<h:option label="2013" value="2013"/>
					<h:option label="2012" value="2012"/>
				</h:select> 年 
				<h:select id="select2" property="month">
					<h:option label="1" value="1"/>
					<h:option label="2" value="2"/>
					<h:option label="3" value="3"/>
					<h:option label="4" value="4"/>
					<h:option label="5" value="5"/>
					<h:option label="6" value="6"/>
					<h:option label="7" value="7"/>
					<h:option label="8" value="8"/>
					<h:option label="9" value="9"/>
					<h:option label="10" value="10"/>
					<h:option label="11" value="11"/>
					<h:option label="12" value="12"/>
				</h:select> 月
					&nbsp;&nbsp;&nbsp;&nbsp; 
				<input type="submit" align="left" value="确定" onclick="callBiz()">
				
			</td>
		</tr>
		<tr>
			<td class="form_label">
				2. Excel 文件要求：<br/>
				(1)上传用的 Excel 文件版本为 97-2003 版本，即 .xls 为后缀的版本，数据全部放在第一个工作表内，数据要从第三行开始填写。<br/>
				(2)可以下载 Excel 模板文件，模板中的所有说明性文字不用去掉，数据列要与模板文件中的列一致。<br/>
				(3)如果数据的“部门名称”、“收款对应收入年份”和“收款日期”列填写不当或为空，那么此条数据会被视为不符合条件的数据，不会导入。
			</td>
			<td colspan="3"><a href="/default/Erp_Gather.xls">点击下载
			Excel 模板文件</a></td>
		</tr>

		<tr>
			<td class="form_label">3.上传增加好数据的 Excel 文件</td>
			<td colspan="3">
				<form id="form1" action="com.primeton.xbb.importExcel.readGather.flow" method="post" enctype="multipart/form-data">
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
			<th>合同编号</th>
			<th>支付单位</th>
			<th>收款日期</th>
			<th>收款金额</th>
			<th>销售</th>
			<th>部门</th>
			<th>二级部门</th>
			<th>部门名称</th>
			<th>收款对应收入年份</th>
		</tr>
		<tr>
			<th></th>
			<th>对应系统中准确名称</th>
			<th>日期型：yyyy/MM/dd</th>
			<th>数值型</th>
			<th></th>
			<th></th>
			<th></th>
			<th></th>
			<th>年份或"未确认收入预收款"</th>
		</tr>

	</table>
</w:panel>
</body>
<script>
function callBiz(){
	if( confirm("是否删除选择年份的数据?")){
		// 调用业务流
		var myAjax = new Ajax("com.primeton.xbb.importExcel.newcomponent.deleteGather.biz");

		//添加参数, 第一个为参数名, 第二个为参数值)
		myAjax.addParam("year",window.document.getElementById("select1").value );
		myAjax.addParam("month",window.document.getElementById("select2").value );
		// 还支持其他形式的参数,如entity,form等,详见参考手册.
	
		//开始调用
		myAjax.submit();

		//取得调用后的结果
		var returnNode =myAjax.getValue("/root/data/deleteNumbers");
		if(returnNode){
			alert("成功删除"+returnNode+"条数据");
		}else{
			alert("数据库中没有与选择年份相同的数据，请导入新数据！");
		}
		
	
	}
}


</script>
</html>