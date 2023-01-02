<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/common/common.jsp"%>
<html>
<!-- 
  - Author(s): 张一博
  - Date: 2018-04-10 10:50:08
  - Description:
-->
<head>
<title>操作项目</title>
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
<style type="text/css">
	body{margin: 0;padding: 0;width: 100%;height: 100%;}
</style>
</head>
<body>
<div class="nui-fit">
	<div title="应用信息" style="padding: 30px 0;">
	 	<form id="form1" method="post" >
	 		<table style="table-layout:fixed;margin-bottom: 10px" id="table_file1">
	            <tr>
					<td align="right" style="width:100px"></td>
					<td>
        				<input id="operate" style="width:200px" onvaluechanged="operate()" class="nui-radiobuttonlist" data="[{id:'move', text: '移动'}, {id: 'copy', text: '复制'}]" value="move"/>	
					</td>
				</tr>
			</table>
        </form>
  	</div>
</div>
<div style="text-align:center;padding:10px;" class="nui-toolbar">
	<a class="nui-button" onclick="ok()" iconCls="icon-ok"  style="width:60px;margin-right:20px;">确定</a>
	<a class="nui-button" onclick="onCancel('cancel')" iconCls="icon-cancel" style="width: 60px;margin-right: 20px;">关闭</a>
</div>
</body>
<script type="text/javascript">
	nui.parse();
	var data = null;
	
	function ok(){
		var operate = nui.get("operate").getValue();
    	data = {"opertion":operate,"indatea":"0000-00-00",newEmpprop:"0.00"};
    	CloseWindow("ok");
	}
	
	function getData(){
		return data;
	}
	
	function onCancel(data){
		CloseWindow(data);
	}
	function CloseWindow(action) {
		if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
		else window.close();
	}
	
</script>
</html>