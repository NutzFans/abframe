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
	<title>导入简历界面</title>
	<link href="../demo.css" rel="stylesheet" type="text/css" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
    </style>
</head>
<body>
	<form id="form2" action="com.primeton.eos.ame_resume.importResume.flow" target="hidden_frame" method="post" enctype="multipart/form-data">
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
			        	<div style="color: red;">（1）只有基于标准模板的简历才能进行导入。标准参考模板点击<a href="#" style="color:blue;" onclick="downloadResumeTemplate()" id="saveExpRei" iconCls="icon-download">下载</a>：</div>
			        	<div style="color: red;">（2）上传用的 Excel 文件版本为 97-2003版本，即以 .xls 为后缀的版本，数据全部放在第一个工作表内。</div>
			        	<div style="color: red;">（3）在工作经历、项目经验、证书的最后不要留空白行，日期的格式为YYYY/MM/DD。</div>
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
	var aa = "";
	
	function onOk(){
		var fileName = document.getElementById("uploadfile").value;
		if(fileName == ""){
			alert("请选择附件！");
			return;
		}else{
			form2.submit();
		}
		return;
	}
	
	function test(msg){
		aa = msg;
		onCancel("ok");
	}

	function getData(){
		var data = aa;
		return data;
	}
	
	function downloadResumeTemplate(){
		nui.ajax({
			url: "com.primeton.eos.ame_resume.resumeManage.exportResumeTemplate.biz.ext",
			data: {},
			type: 'POST',
			cache: false,
			contentType: 'text/json',
			success: function(text){
				nui.unmask();
	     		var filePath = text.downloadFile;
	        	var fileName = "简历";
	        	var myDate = new Date();
	        	var year = myDate.getFullYear();
	        	var month = myDate.getMonth()+1;
	        	var day = myDate.getDate();
	        	var hours = myDate.getHours();
	        	var minutes = myDate.getMinutes();
	        	var seconds = myDate.getSeconds();
	        	var curDateTime = year;
	        	if(month>9){
					curDateTime = curDateTime + "" + month;
				}else{
					curDateTime = curDateTime + "0" + month;
					}
	        	if(day>9){
					curDateTime = curDateTime + day;
				}else{
					curDateTime = curDateTime + "0" + day;
					}
				if(hours>9){
					curDateTime = curDateTime + hours;
				}else{
					curDateTime = curDateTime + "0" + hours;
					}
				if(minutes>9){
					curDateTime = curDateTime + minutes;
				}else{
					curDateTime = curDateTime + "0" + minutes;
					}
				if(seconds>9){
					curDateTime = curDateTime + seconds;
				}else{
					curDateTime = curDateTime + "0" + seconds;
				}
				fileName = fileName + "_" + curDateTime + ".xls";
				var frm = document.getElementById("viewlist1");
	        	frm.elements["downloadFile"].value = filePath;
	        	frm.elements["fileName"].value = fileName;
			    frm.submit();	    			
			},
			error: function(jqXHR, textStatus, errorThrown){
				CloseWindow();
			}
		});
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