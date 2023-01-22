<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%
	String contextPath=request.getContextPath();
 %>
<html>
<!-- 
  - Author(s): Administrator
  - Date: 2016-06-20 13:57:53
  - Description:
-->
<head>
<title>Title</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
    </style>
</head>
<body>
	<fieldset id="autoPettyExp">
		<legend>手工采购计提数据导入</legend>
		<form id="form2" class="" action="com.primeton.eos.ame_common.AutoPettyExp.flow" target="hidden_frame" method="post" enctype="multipart/form-data">
			<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
			<div style="color: red;">说明：本功能将手工计提的采购成本导入系统，自动生成“其他外购、项目分包”类型的报销单，支持部门费用报表数据的取数</div>
			<table width="100%" align="center">
				<tr>
			      	<td>
			      		请选择类型：<input class="nui-combobox" name="importType" value="2" valueField="id" textField="text" data="[{id:2,text: '其他外购'},{id:3,text: '项目分包'},{id:4,text: '外购产品成本'}]">
			      	</td>
			      	<td>请选择附件：<input type='file' id="uploadfile" name='uploadfile' size='30'></td>
			    </tr>
		  	</table>
		  	</div>
	  </form>
	  <div style="text-align:center;padding:10px;" class="nui-toolbar">
		<a class="nui-button" onclick="onOk" style="width:90px;margin-right:20px;" id="sureButton">导入数据</a>
	  </div>
    </fieldset>
    <iframe name='hidden_frame' id="hidden_frame" style='display:none'></iframe>
	<script>
		function onOk(){
			var fileName = document.getElementById("uploadfile").value;
			if(fileName == ""){
				alert("请选择附件！");
				return;
			}else{
				form2.submit();
				nui.get("sureButton").setEnabled(false);
			}
		}
	</script>
</body>
</html>