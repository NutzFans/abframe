<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/common.jsp"%>
<%@include file="/common/skins/skin0/component.jsp" %>
<html>
<!-- 
  - Author(s): jisx
  - Date: 2017-07-28 14:24:20
  - Description:
-->
<head>
	<title>导入人员信息</title>
	<link href="../demo.css" rel="stylesheet" type="text/css" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
	    #box{
	    	width:100%;
	    	height: 100%;
	    	background: rgba(122,122,122,0.8);
	    	text-align:center;
	    	line-height:100px;
	    	color:#1C1C1C;
	    	position: absolute;
	    	top:0;
	    	bottom:0;
	    	left:0;
	    	right:0;
	     	z-inde:999;
	    	display: none;
	    	font-size:16px;
	    }
	    #form2{
	    	visibility: visible;
	    }
    </style>
</head>
<body>
	<div id="box">导入中...</div>
	<form id="form2" action="org.gocom.abframe.org.employee.importPerson.flow" target="hidden_frame" method="post" enctype="multipart/form-data">
        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
            <table style="width:100%;">
            	<tr>
	            	<td style="width:550px;" colspan="5">
	            		请选择附件：<input type='file' id="uploadfile" name='uploadfile' >
	       	  		</td>
                </tr>
                <tr>
		            <td style="width:2%;" align="left">上传注意事项：</td>
			        <td style="width:12%;" align="left">
			        	<div style="color: red;">（1）上传用的 Excel 文件版本为 97-2003版本，即以 .xls 为后缀的版本，数据全部放在第一个工作表内。</div>
			        	<div style="color: red;">（2）在学历信息、合同、试用期相关信息、人员、组织相关信息的最后不要留空白行，日期的格式为YYYY/MM/DD。</div>
			       	</td>
		        </tr>
            </table>           
        </div>
        </form>
       
        <iframe name='hidden_frame' id="hidden_frame" style='display:none'></iframe>
	  <div style="text-align:center;padding:10px;" class="nui-toolbar">
		<a class="nui-button" onclick="onOk()" style="width:60px;margin-right:20px;" id="sureButton">提交</a>
		<a class="nui-button" onclick="onCancel()" style="width:60px;margin-right:20px;">取消</a>  
	  </div>
	  <form name="viewlist1" id="viewlist1" action="com.primeton.eos.ame_common.ameExportCommon.flow" method="post">
		<input type="hidden" name="_eosFlowAction" value="action0" filter="false"/>
		<input type="hidden" name="downloadFile" filter="false"/>
		<input type="hidden" name="fileName" filter="false"/>
	</form> 
</body>

<script type="text/javascript">
	nui.parse();
	var box = document.getElementById("box");
	var form = document.getElementById("form2");
	function onOk(){
		
		var fileName = document.getElementById("uploadfile").value;
		
		if(fileName == ""){
			alert("请选择附件！");
			return;
		}else{
			form2.submit();
			box.style.display = "block";
			form.style.visibility = "hidden";
		}
		return;
	}
	
	function test(msg){
		box.style.display = "none";
		form.style.visibility = "visible";
		var obj = eval('(' + msg + ')');
		var content = obj.content;
		var empnames = obj.empnames;
		var message;
		if((content == null ||content=="")&&(empnames==""||empnames==null)){
			message="导入成功！";
		}else if(empnames == "" || empnames == null){
			message = "导入成功！其中，"+content+"字段值导入失败。";
		}else{
			message = "导入成功！其中人员"+empnames+"导入失败！"+content+"字段值导入失败。";
		}
		confirm(message);
		onCancel("ok");
	}

	function onCancel(action) {
		CloseWindow(action);
	}
    
    function CloseWindow(action) {
		if (window.CloseOwnerWindow){
			return window.CloseOwnerWindow(action);
		}else{
			window.close();
		}
	}
</script>
</html>