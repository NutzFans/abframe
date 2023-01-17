<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): zhang-yb
  - Date: 2018-05-28 16:42:11
  - Description:
-->
<head>
	<title>新增角色人员</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
		body{margin: 0;padding: 0;width: 100%;height: 100%;}
		form{margin: 10px auto;}
		.mini-textboxlist-border{height: 80px;}
	</style>
</head>
<body>
<div class="nui-fit" id="form1" >
    <form>
		<table>
			<tr>
				<td style="width: 10%;vertical-align: top" align="right">人员：</td>
				<td style="width: 100%">
					<input property="editor" name = "userid" class="nui-textboxlist"  searchField="name" style="width:95%;"
				url="com.primeton.eos.ame_budget.budgetOrgManager.queryEmpByName.biz.ext" 
				textField="EMPNAME" valueField="USERID" />
				</td>
			</tr>
        </table> 
    </form>
</div>

<div class="nui-toolbar" style="text-align:center;padding-top:8px;padding-bottom:8px;" borderStyle="border:0;">
    <a class="nui-button" style="width:60px;" onclick="onOk">确定</a>
    <span style="display:inline-block;width:25px;"></span>
    <a class="nui-button" style="width:60px;" onclick="onCancel">取消</a>
</div>
</body>
<script type="text/javascript">
	nui.parse();
	var form = new nui.Form("#form1");
	
	//为母页面做返回数据使用
	function GetData() {
		var data = form.getData();
		return data;
	}
	
	//确认按钮
	function onOk(){
		CloseWindow("ok");
	}
	
	//取消按钮
	function onCancel(){
		CloseWindow("cancel");
	}
	
	//关闭窗口
	function CloseWindow(action) {
		if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
		else window.close();
	}
</script>
</html>