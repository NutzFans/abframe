<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%
	String contextPath=request.getContextPath();
 %>
<html>
<!-- 
  - Author(s): mengyy
  - Date: 2017-11-14 16:09:44
  - Description:
-->
<head>
<title>发薪人数导入</title>
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
		<legend>导入发薪人数</legend>
		<form id="form2" class="" action="com.primeton.xbb.importExcel.importPayroll.flow" target="hidden_frame" method="post" enctype="multipart/form-data">
			<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
			<table width="100%" align="center" >
				<tr>
			      	<td><p>1. Excel 文件要求：</p>
						<p>(1)上传用的 Excel 文件版本为 97-2003 版本，即 .xls 为后缀的版本，数据全部放在第一个工作表内，数据要从第三行开始填写。</p>
						<p>(2)可以下载 Excel 模板文件，模板中的所有说明性文字不用去掉，数据列要与模板文件中的列一致。<p>
					</td>
					<td><a href="/default/payrollTemplate.xls">点击下载Excel 模板文件</a></td>
			    </tr>
				<tr>
					<td>2.上传增加好数据的 Excel 文件</td>
			      	<td>请选择附件：<input type='file' id="uploadfile" name='uploadfile' size='30'></td>
			    </tr>
		  	</table>
		  	</div>
	  </form>
	  <div style="text-align:center;padding:10px;" class="nui-toolbar">
		<a class="nui-button" onclick="onOk" style="width:60px;margin-right:20px;" id="sureButton">提交</a>
	  </div>
    </fieldset>
    <iframe name='hidden_frame' id="hidden_frame" style='display:none'></iframe>

</body>
<script>

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
			if(succcount>0){
				if(errcount>0){
					alert("导入成功："+succcount+"条,导入失败："+errcount+"条,其中部门名为："+errormsg+",请确认！")
				}else{
					alert("导入成功："+succcount+"条")
				}
			}else{
				alert("没有数据导入！");
			}
		}else{
			alert("导入失败！")
		}
	}

		
	
</script>
</html>