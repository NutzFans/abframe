<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/common/common.jsp"%>
<%@include file="/common/skins/skin0/component.jsp" %>
<html>
<!-- 
  - Author(s): zhang-yb
  - Date: 2018-09-05 14:13:32
  - Description:
-->
<head>
<title>导入</title>
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
<style type="text/css">
	body{
        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
    }
</style>
</head>
<body>
<div class="nui-fit">
	<fieldset id="importCash">
		<legend>部门人头数导入</legend>
		<form id="form2" class="" action="com.primeton.eos.common.importDeptHeads.flow" target="hidden_frame" method="post" enctype="multipart/form-data">
	        <input class="nui-hidden" name="year"  id="year"/>
	        <input class="nui-hidden" name="month"  id="month"/>
	        <div class="nui-toolbar" style="padding:0px;">
	            <table style="width:100%;">
	                <tr>
		            	<td style="width:100px;" align="right">
		            		请选择附件：
		       	  		</td>
		       	  		<td>
		       	  			<input type='file' id="uploadfile" name='uploadfile' size='30'>
		       	  		</td>
	                </tr>
	            </table>           
	        </div>
	    </form>
	</fieldset>
</div>
<div style="text-align:center;padding:10px;" class="nui-toolbar">
	<a class="nui-button" onclick="onOk()" style="width:60px;margin-right:20px;" id="sureButton">提交</a>
	<a class="nui-button" onclick="onCancel()" style="width:60px;margin-right:20px;">取消</a>  
</div>
<iframe name='hidden_frame' id="hidden_frame" style='display:none'></iframe>
</body>
<script type="text/javascript">
	nui.parse();
	var form = new nui.Form("#form2");  
	var year = '<%=request.getParameter("year") %>';
	var month = '<%=request.getParameter("month") %>';
	
	nui.get("year").setValue(year);
	nui.get("month").setValue(month);
	//提交附件
	function onOk(){
		var fileName = document.getElementById("uploadfile").value;
		if(fileName == "" || fileName == null){
			nui.alert("请选择附件。");
			return;
		}
		var title = "确认导入"+month+"月的部门人头数么？";
		nui.confirm(title,"操作提示",function(o){
        	if("ok" == o){
				form.loading("操作中，请稍后......");
				form2.submit();
				nui.get("sureButton").setEnabled(false);
        	}
        });
		
	}
	
	/**
	*导入返回页面
	*/
	function checkImportResult(msg){
		if(msg){
			nui.get("sureButton").setEnabled(true);
			if(msg == 1){
				form.unmask();
				nui.alert("导入成功。","提示",function(e){
					CloseWindow("ok");
				})
			}else if(msg == -1){
				nui.alert("导入失败，请联系信息技术部")
			}
		}
		
	}
	
	//关闭模态窗口
	function onCancel(){
     	CloseWindow();
    }
   	function CloseWindow(action) {
		if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
		else window.close();
	}
</script>
</html>