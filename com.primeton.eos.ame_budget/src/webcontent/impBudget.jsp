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
		<input type="hidden" name="_eosFlowAction" value="action0">
		<h:hidden property="projectId" id="projectId"/>
		<h:hidden property="projectName" id="projectName"/>
		<h:hidden id="versionid" property="versionid"/>
		<table>
		<tr>
			<td >
				导入预算时,模板中涉及到日期的格式必须自定义设置为"yyyy-MM-dd"格式
			</td>
		</tr>
		<tr style="height:5px"><td></td></tr>
		<tr>
			<td align="center">
				<input type="file" id="uploadfile" name="uploadfile" size="40"/>
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
		function test(msg){
			if(msg=="w"){
				alert("导入数据项目编号有误,请核对!");
				document.getElementById("a").disabled=false;
			}else if(msg=="O"){
				alert("导入数据人员级别存在为空,请核对!");
				document.getElementById("a").disabled=false;
			}
			else if(msg=="s"){
				alert("预算版本导入成功!");
				CloseWindow();
			}else{
				alert("预算版本导入失败!");
				CloseWindow();
			}
			<%--var obj = document.getElementById("uploadfile") ; 
			obj.outerHTML=obj.outerHTML; --%>
		}
		function SetData(data){
			document.getElementById("projectId").value=data.projectid; 
			document.getElementById("projectName").value=data.projectName; 
			document.getElementById("versionid").value=data.versionid; 
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
		function CloseWindow() {    
            if (window.CloseOwnerWindow) return window.CloseOwnerWindow();
            else window.close();            
        }
	</script>
</body>
</html>