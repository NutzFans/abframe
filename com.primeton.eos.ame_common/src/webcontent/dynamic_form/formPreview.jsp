<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): 朱海翔
  - Date: 2019-04-24 16:30:56
  - Description:
-->
<head>
	<title>配置动态表单</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin: 0;padding: 0;border: 0;width: 100%;height: 100%;overflow: hidden;	
	    } 
    </style>
</head>
<body>
	<div class="nui-fit">
		<fieldset style="border: solid 1px #aaa;">
			<legend>表单信息预览</legend>
			<div id="prviewform">
			</div>
		</fieldset>
	</div>
	<div style="text-align:center;padding:10px;" class="nui-toolbar">
		<a class="nui-button"  id="closebtn" onclick="onCancel('cancel')" style="width:60px;">关闭</a>
	</div>
</body>
<script type="text/javascript">
	nui.parse();
	function setData(data){
		var data=nui.clone(data);
		if(data.formdata){
			getHtmls(data.formdata,"prviewform")
		}else{
			setDynamicForm(data.busform,data.buscode,"prviewform")
		}
	}
	
	 //关闭
    function onCancel(e) {
        CloseWindow("cancel");
    }
	//标准方法接口定义
    function CloseWindow(action) {
        if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
        else window.close();            
    }
</script>
<!-- 动态表单 -->
<script src="<%= request.getContextPath() %>/ame_common/js/dynamic-form.js" type="text/javascript"></script>
</html>