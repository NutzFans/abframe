<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/common/common.jsp"%>
<%@include file="/common/skins/skin0/component.jsp" %>
<html>
<!-- 
  - Author(s): mengyy
  - Date: 2019-03-21 17:10:38
  - Description:
-->
<head>
	<title>工时导入</title>
	<link href="../demo.css" rel="stylesheet" type="text/css" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
    </style>
</head>
<body>
	<fieldset id="importPLExcel">
		<legend>工时导入</legend>
		<form id="form2" class="" action="com.primeton.rdmgr.labor.input.rd.impl.importRdLabor.flow" target="hidden_frame" method="post" enctype="multipart/form-data">
        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
            <table style="width:100%;">
                <tr>
	            	<td style="width:550px;" colspan="5">
	            		请选择附件：<input type='file' id="uploadfile" name='uploadfile' size='30'>
	       	  		</td>
                </tr>
                <tr>
		            <td style="width:13%;" align="right" >上传注意事项：</td>
			        <td style="width:12%x;" colspan="4">
			        	<div style="color: red;">上传用的 Excel 文件版本为 97-2003版本，即 .xls 为后缀的版本，数据全部放在第一个工作表内，数据要从第三行开始填写。</div>
			       	</td>
		        </tr>
		        <tr>
		        	<td style="width:13%;"colspan="5"><a href="/default/abframe/import-template/importRdLabordetail.xls">点击下载Excel 模板文件</a></td>
		        </tr>
            </table>           
        </div>
        </form>
	  <div style="text-align:center;padding:10px;" class="nui-toolbar">
		<a class="nui-button" onclick="onOk" style="width:60px;margin-right:20px;" id="sureButton">提交</a>
		<a class="nui-button" onclick="onCancel()" style="width:60px;margin-right:20px;">取消</a>  
	  </div>
    </fieldset>
    <iframe name='hidden_frame' id="hidden_frame" style='display:none'></iframe>
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
					alert("导入成功："+succcount+"条,导入失败："+errcount+"条,其中部门名为："+errormsg+",请确认！");
				}else{
					alert("导入成功："+succcount+"条");
					CloseWindow("ok");
				}
			}else{
				alert("没有数据导入！");
			}
		}else{
			alert("导入失败！")
		}
	}
	
	//关闭
   function onCancel(e){
		CloseWindow(e);
	}
	function CloseWindow(action) {
		if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
		else window.close();
	}
		
</script>
</body>
</html>