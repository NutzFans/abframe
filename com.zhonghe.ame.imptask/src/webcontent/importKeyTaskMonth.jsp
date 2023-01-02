<%@page import="org.json.simple.JSONObject"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/common/common.jsp"%>
<%@include file="/common/skins/skin0/component.jsp" %>
<html>
<head>
<title></title>
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
		<legend>重点任务月度计划导入</legend>
		<form id="form2" action="com.zhonghe.ame.imptask.importKeyTaskMonth.flow" target="hidden_frame" method="post" enctype="multipart/form-data">
			<input class="nui-hidden"name="keytaskId" id="keytaskId">
	        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
	            <table style="width:100%;">
		            <tr>	
		            	<td style="width:550px;"colspan="5">
		            		请选择附件：<input type='file' id="uploadfile" name='uploadfile' size='30'>
		       	  		</td>
	                </tr>
	                <tr>
			            <td style="width:2%;" align="left" >上传注意事项：</td>
				        <td style="width:12%;" colspan="2">
				        	<div style="color: red;">（1）上传用的 Excel 文件版本为 97-2003版本，即 .xls 为后缀的版本，数据全部放在第一个工作表内，数据从第三行开始读取一直读到最后一行。</div>
				       	</td>
			        </tr>
			         <tr>
			        	<td style="width:13%;"colspan="5"><a href="<%=request.getContextPath() %>/keytaskimport.xls">点击下载Excel 模板文件</a></td>
			        </tr>
	            </table>           
	        </div>
        </form>
         <iframe name='hidden_frame' id="hidden_frame" style='display:none'></iframe> 
	  <div style="text-align:center;padding:10px;" class="nui-toolbar">
		<a class="nui-button" onclick="onOk()" style="width:60px;margin-right:20px;" id="sureButton">提交</a>
		<a class="nui-button" onclick="onCancel()" style="width:60px;margin-right:20px;">取消</a>  
	  </div>
    </fieldset>
</body>
<script>

	nui.parse();
	var datas = [];
    //导入数据的判断
		<%
		String msg = (String)request.getAttribute("exception");
		JSONObject json = (JSONObject)request.getAttribute("json");//成功数据
		JSONObject json1 = (JSONObject)request.getAttribute("json1");//失败数据
		%>
		
		var result = <%=json %>;
		var result1 = <%=json1 %>;
		var msg = <%=msg %>;
		var keytaskId= "<%=request.getParameter("keytaskId")%>";
		nui.get("keytaskId").setValue(keytaskId);
		if(msg==0||msg==1){
			msg = nui.encode(msg);
			result = result.json;
			result = nui.decode(result)
			result1 = nui.encode(result1.json);
		}

	function onOk(){
		var fileName = document.getElementById("uploadfile").value;
		var keytaskId = nui.get("keytaskId").getValue();
		
		if(fileName == ""){
			showTips("请选择附件！");
			return;
		}else{
			form2.submit();
			nui.get("sureButton").setEnabled(false);
			onCancel();
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