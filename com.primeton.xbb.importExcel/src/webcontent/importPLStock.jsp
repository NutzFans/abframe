<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String contextPath=request.getContextPath();
 %>
<html>
<!-- 
  - Author(s): mengyy
  - Date: 2019-04-18 15:23:27
  - Description:
-->
<head>
<title>导入PL存货余额</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
<style type="text/css">
    body{
        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
    }
    table{
    	border-collapse: collapse;
    	border:none;
    	
    }
    td{
    	border: solid #909AA6 1px;
    }
</style>
</head>
<body>
<fieldset id="autoPettyExp">
	<legend>导入PL存货余额</legend>
	<form id="form2" class="" action="com.primeton.xbb.importExcel.importPLStock.flow" target="hidden_frame" method="post" enctype="multipart/form-data">
		<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
		<table width="100%" align="center" >
			<tr>
		      	<td><p>1. Excel 文件要求：</p>
					<p>(1)上传用的 Excel 文件版本为 97-2003 版本，即 .xls 为后缀的版本，数据全部放在第一个工作表内，数据要从第三行开始填写。</p>
					<p>(2)可以下载 Excel 模板文件，模板中的所有说明性文字不用去掉，数据列要与模板文件中的列一致。<p>
				</td>
				<td><a href="/default/abframe/import-template/departmentPLStockTemplate.xls">点击下载Excel 模板文件</a></td>
		    </tr>
			<tr>
				<td>2.上传增加好数据的 Excel 文件</td>
		      	<td>请选择附件：<input type='file' id="uploadfile" name='uploadfile' size='30'></td>
		    </tr>
	  	</table>
	  	</div>
	  </form>
	  <table width="1052px;">
	  	<tr align="center">
	  		<td>年份</td>
	  		<td>合同编号</td>
	  		<td>期初余额</td>
	  		<td>Q1存货余额</td>
	  		<td>Q2存货余额</td>
	  		<td>Q3存货余额</td>
	  		<td>Q4存货余额</td>
	  		<td>销售所属部门</td>
	  	</tr>
	  	<tr align="center">
	  		<td>yyyy</td>
	  		<td></td>
	  		<td>数值型</td>
	  		<td>数值型</td>
	  		<td>数值型</td>
	  		<td>数值型</td>
	  		<td>数值型</td>
	  		<td>对应系统中准确名称</td>
	  	</tr>
	  </table>
	  <div style="text-align:center;padding:10px;" class="nui-toolbar">
		<a class="nui-button" onclick="onOk" style="width:60px;margin-right:20px;" id="sureButton">提交</a>
	  </div>
    </fieldset>
    <iframe name='hidden_frame' id="hidden_frame" style='display:none'></iframe>
</body>
<script type="text/javascript">
	nui.parse();

	function onOk(){
		var fileName = document.getElementById("uploadfile").value;
		if(fileName == ""){
			alert("请选择附件！");
			return;
		}else{
			form2.submit();
			//nui.get("sureButton").setEnabled(false);
		}
	}
		
	
	function test(data){
		var aaa = eval('(' + data + ')');
		
		var errormsg = aaa.errormessage;
		var msg = aaa.msg;
		var succcount = aaa.succcount;
		var errcount = aaa.errcount;
		
		if(msg =='0'){
			alert("导入成功！");
		}else{
			alert("导入失败！失败原因可能因为以下部门名称错误："+errormsg+",请确认后重新导入！")
		}
	}
</script>
</html>