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
<title>Title</title>
</head>
<body>
<form id="form3" action="com.primeton.eos.ame_budget.importBudget.flow" target="hidden_frame" method="post" enctype="multipart/form-data">
		<input type="hidden" name="_eosFlowAction" value="action2">
		<table>
		<tr>
			<td >
				导入注意事项：</br>1、导入预算时,模板中的数据必须为数值类型。</br>
							2、导入成功后,会覆盖预算损益页面所有可编辑的数据。</br>
							3、如果希望导入的数据生效，需要点击“保存预算损益”按钮!
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
				<input type="button" value="导入预算" id="a" onclick="javascript:importLabor();" class="button">
			</td>
		</tr>
		</table>
	</form>
	<iframe name='hidden_frame' id="hidden_frame" style='display:none'></iframe>
	<script>
		var aa = "";
		function test(msg){
			aa = msg;
			if(msg!=0){
				CloseWindow("ok");
			}else{
				alert("预算导入失败!请检查模板格式是否正确");
				document.getElementById("a").disabled=false;
			}
		}
		
		function getData(){
			var data = aa;
			return data;
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