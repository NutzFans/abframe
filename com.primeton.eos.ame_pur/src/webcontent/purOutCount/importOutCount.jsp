<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/common/common.jsp"%>
<%@include file="/common/skins/skin0/component.jsp" %>
<html>
<!-- 
  - Author(s): yaoyi
  - Date: 2017-02-28 11:46:23
  - Description:
-->
<head>
<title>静态考勤统计导入</title>
	<link href="../demo.css" rel="stylesheet" type="text/css" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
    </style>
</head>
<body>
		<fieldset id="importOutCount">
		<legend>静态考勤统计导入</legend>
		<form id="form2" action="com.primeton.eos.ame_pur.importOutCunt.flow" target="hidden_frame" method="post" enctype="multipart/form-data">
        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
            <table style="width:100%;">
	            	<td style="width:550px;" colspan="5">
	            		请选择附件：<input type='file' id="uploadfile" name='uploadfile' size='30'>
	       	  		</td>
                </tr>
                <tr>
		            <td style="width:13%;" align="right" >上传注意事项：</td>
			        <td style="width:12%x;" colspan="5">
			        	<div style="color: red;">（1）上传用的 Excel 文件版本为 97-2003版本，即 .xls 为后缀的版本，数据全部放在第一个工作表内，数据要从第二行开始填写。</div>
			       	</td>
		        </tr>
            </table>           
        </div>
        </form>
        <iframe name='hidden_frame' id="hidden_frame" style='display:none'></iframe>
	  <div style="text-align:center;padding:10px;" class="nui-toolbar">
		<a class="nui-button" onclick="onOk" style="width:60px;margin-right:20px;" id="sureButton">提交</a>
		<a class="nui-button" onclick="onCancel()" style="width:60px;margin-right:20px;">取消</a>  
	  </div>
    </fieldset>
</body>
<script>

	nui.parse();
	var aa = "";
	var d = new Date();
	var  nowYear = d.getFullYear();
    $("#year").val(nowYear);
    var nowMonth = d.getMonth()+1;
    nowMonth =(nowMonth<10 ? "0"+nowMonth:nowMonth); 
   $("#min").val(nowMonth);
    
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
	
	function test(msg){
		aa = msg;
		onCancel("ok");
	}

	function getData(){
		var data = aa;
		return data;
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