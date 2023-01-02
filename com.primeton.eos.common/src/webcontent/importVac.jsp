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
<title>年假数据导入</title>
	<link href="../demo.css" rel="stylesheet" type="text/css" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
    </style>
</head>
<body>

		<fieldset id="importvac">
		<legend>年假数据导入</legend>
		<form id="form2" class="" action="com.primeton.eos.common.importVaction.flow" target="hidden_frame" method="post" enctype="multipart/form-data">
        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
            <table style="width:100%;">
                <tr>
	            	<td style="width:100px;" align="right">
		            		请选择附件：
		       	  		</td>
		       	  		<td>
		       	  			<input type='file' id="uploadfile" name='uploadfile' size='30'>
		       	  		</td>
	       	  		<td><a href="<%=request.getContextPath() %>/abframe/import-template/impVac.xls">点击下载模板文件</a></td>
                </tr>
                <tr>
		            <td align="right" >上传注意事项：</td>
			        <td colspan="2">
			        	<div style="color: red;">（1）上传用的 Excel 文件版本为 97-2003版本，即 .xls 为后缀的版本，数据全部放在第一个工作表内，数据要从第二行开始填写。</div>
			        	<div style="color: red;">（2）excel里不能存在为空得数据；第一列工号一定要是“文本”格式</div>
			       	</td>
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
		
		
	function test(msg){
		if(msg==0){
			alert("导入成功");
			CloseWindow("ok");
		}else{
			alert("导入失败");
		}
	}

	 function onCancel() {
     	CloseWindow();
    }
   function CloseWindow(action) {
		if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
		else window.close();
	}
		
	
</script>
</html>