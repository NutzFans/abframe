<%@page pageEncoding="UTF-8"%>
<%@include file="/common/common.jsp"%>
<h:css href="/css/style1/style-custom.css"/>
<%@include file="/common/skins/skin0/component.jsp" %>
<html>
<!-- 
  - Author(s): zhuhx
  - Date: 2016-07-08 14:56:52
  - Description:
-->
<head>
<title>导入收入确认票</title>
</head>
<body>
<form id="form3" action="com.primeton.eos.ame_income.importSureBill.flow" target="hidden_frame" method="post" enctype="multipart/form-data">
		<input type="hidden" name="_eosFlowAction" value="action0">
		<table>
		<tr>
			<td >
				导入注意事项：</br>上传用的 Excel 文件版本为 97-2003版本，即 .xls 为后缀的版本，数据全部放在第一个工作表内，数据从第二行开始读取一直读到最后一行。
			</td>
		</tr>
		<tr style="height:5px"><td></td></tr>
		<tr>
			<td align="left" style = "width:300px">
				<input type="file" id="uploadfile" name="uploadfile" style = "width:300px"/>
			</td>
		</tr>
		<tr>
			<td align="center">
				<input type="button" value="导入开票数据" id="a" onclick="javascript:importLabor();" class="button">
			</td>
		</tr>
		</table>
	</form>
	<iframe name='hidden_frame' id="hidden_frame" style='display:none'></iframe>
	<script>
		function test(msg){
			if(msg!=null&&msg!=""&&msg!="null"){
				var message="导入成功！发票号为："+msg+"的发票导入失败,请核查后再进行操作！";
				alert(message);
				CloseWindow("ok");
			}else{
				alert("导入成功！");
				CloseWindow("ok");
			}
		}
		
		function importLabor(){
			var a=document.getElementById("uploadfile").value;
			if(a==null||a==""){
				alert("请选择一个文件!");
				return; 
			}
			form3.submit();
			document.getElementById("a").disabled=true;
		}
		function CloseWindow(action) {  
            if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
            else window.close();            
        }
	</script>
</body>
</html>