<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): wanglinqiong
  - Date: 2016-05-12 16:17:56
  - Description:
-->
<head>
<title>菜单录入</title>
<%@include file="/common/skins/skin0/component.jsp" %>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
    </style>
</head>
<body>
<div class="nui-fit">
	<div title="菜单录入">
	 	<form id="form1" method="post" >
	 		<input id="menuid" name="acmenu.menuid" class="nui-hidden">
	        	<table style="table-layout:fixed;" id="table_file1">
					<tr>
						<td align="right">菜单名称：</td>
						<td>
							<input name="acmenu.menuname" id="menuname" class="nui-textbox" style="width:250px" required="true"/>
						</td>
					</tr>
					<tr>
						<td align="right">菜单显示名称：</td>
						<td>
							<input name="acmenu.menulabel" id="menulabel" class="nui-textbox" style="width:250px;" required="true"/>
						</td>
					</tr>
					<tr>
						<td align="right">菜单代码：</td>
						<td>
							<input name="acmenu.menucode" id="menucode"  class="nui-textbox" style="width:250px" required="true"/>
						</td>
					</tr>
					<tr>
						<td align="right">显示顺序：</td>
						<td>
							<input class="nui-textbox" name="acmenu.displayorder" id="displayorder" style="width:250px" onValuechanged="checkNumber" />
						</td>
					</tr>
					<tr>
						<td align="right">菜单闭合图片路径：</td>
						<td>
							<input onbuttonclick="onButtonEdit" class="nui-buttonedit" name="acmenu.imagepath" id="imagepath" style="width:250px" allowInput="false">
						</td>
					</tr>
					<tr>
						<td align="right">菜单展开图片路径：</td>
						<td>
							<input onbuttonclick="onButtonEdit" class="nui-buttonedit" name="acmenu.expandpath" id="expandpath" style="width:250px" allowInput="false">
						</td>
					</tr>
					<tr>
						<td align="right" style="width:100px">菜单描述：</td>
						<td>
							<input class="nui-textarea" name="acmenu.menudesc" id="menudesc" style="width:250px">
						</td>
					</tr>
	        	</table>
        </form>
  	</div>
</div>
<div style="text-align:center;padding:10px;" class="nui-toolbar">
	<a class="nui-button" onclick="saveTopMenu" id="a" style="width:60px;margin-right:20px;">保存</a>
	<a class="nui-button" onclick="onCancel('cancel')" style="width:60px;">关闭</a>
</div>
    <script type="text/javascript">
		nui.parse();
    	var form = new nui.Form("form1");
    	var projectid = <%=request.getParameter("projectid")%>;
    	
    	//选择图标
    	function onButtonEdit(e) {
		    var btnEdit = this;
		    nui.open({
				url:"<%=request.getContextPath() %>/abframe/rights/iconmanage/pcIcon.jsp",
				title: "选择列表",
				width: 600,
				height: 400,
				ondestroy: function (action) {
					if (action == "ok") {
						var iframe = this.getIFrameEl();
						var data = iframe.contentWindow.GetData();
						data = nui.clone(data);    //必须
						if (data) {
			                btnEdit.setValue(data[0]);
			                btnEdit.setText(data[1]);		 
						}
					}
				}
			});
		}
		function saveTopMenu(){
			if(!form.validate()){
				alert("请检查表单的完整性!");
				return;
			}
			var data = form.getData();
			var json = nui.encode({"menu":data.acmenu});
			nui.ajax({
		        type:'post',
		        data:json,
		        async:false,
		        contentType: 'text/json',
		        url:'org.gocom.abframe.rights.menu.MenuManager.insertTopMenu.biz.ext',
		        success:function(o){
		        	var result = o.result;
		        	if(result=='1'){
		        		alert("保存成功！");
		        		onCancel("cancel");
		        	}else{
		        		alert("保存失败！");
		        	}
		        }
			});
		}
		
		function SetData(data){
		
		}
		
		function CloseWindow(action) {            
	        if (action == "close" && form.isChanged()) {
	            if (confirm("数据被修改了，是否先保存？")) {
	                return false;
	            }
	        }
	        if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
	        else window.close();            
	    }
	
	    function onCancel(e) {
	        CloseWindow("cancel");
	        window.opener.search();
	    }
	    
	    function checkNumber(e){
	        if (!isNumber(e.value)) {
	            alert("请输出正确的数字!") ;
	            nui.get("displayorder").setValue("");
	        }
	    }
   	</script>
</body>
</html>