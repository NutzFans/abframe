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
<link rel="stylesheet" href="../../common/layuimini/lib/font-awesome-4.7.0/css/font-awesome.min.css" media="all">
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
	 	<input id="upmenuid" name="acmenu.acMenu.menuid" class="nui-hidden">
	 	<input id="menuaction" name="acmenu.menuaction" class="nui-hidden">
        	<table style="table-layout:fixed;" id="table_file1">
	            <tr>
					<td align="right" style="width:100px">父菜单显示名称：</td>
					<td>
						<input class="nui-textbox" name="acmenu.acMenu.menulabel" id="menulabel" style="width:250px" readonly="readonly">
					</td>
				</tr>
				<tr>
					<td align="right" style="width:100px">菜单名称：</td>
					<td>
						<input name="acmenu.menuname" id="menuname" class="nui-textbox" style="width:250px"  required="true"/>
					</td>
				</tr>
				<tr>
					<td align="right" style="width:100px">菜单显示名称：</td>
					<td>
						<input name="acmenu.menulabel" id="menulabel1" class="nui-textbox" style="width:250px;"  required="true"/>
					</td>
				</tr>
				<tr>
					<td align="right" style="width:100px">菜单代码：</td>
					<td>
						<input name="acmenu.menucode" id="menucode" class="nui-textbox" style="width:250px" required="true"/>
					</td>
				</tr>
				<tr>
					<td align="right" style="width:100px">是否叶子菜单：</td>
					<td>
						<input class="nui-dictcombobox" dictTypeId="ABF_YESORNO" name="acmenu.isleaf" id="isleaf" style="width:250px" shownullItem="false" required="true" onValuechanged="changeRd"/>
					</td>
				</tr>
				<tr>
					<td align="right" style="width:100px">功能名称：</td>
					<td>
						<input name="acmenu.funccode" id="funccode" class="nui-buttonedit" onbuttonclick="showEmployee1" style="width:250px;" showClose="false" allowInput="false" required="false"/>
					</td>
				</tr>
				<tr>
					<td align="right" style="width:100px">页面打开方式：</td>
					<td>
						<input class="nui-dictcombobox" dictTypeId="ABF_PAGEOPENMODE" name="acmenu.openmode" id="openmode" style="width:250px" shownullItem="true" required="false" />
					</td>
				</tr>
				<tr>
					<td align="right" style="width:100px">显示顺序：</td>
					<td>
						<input class="nui-textbox" name="acmenu.displayorder" id="displayorder" style="width:250px" onValuechanged="checkNumber"/>
					</td>
				</tr>
				<tr>
					<td align="right" style="width:100px">菜单图标：</td>
					<td>
						<input onbuttonclick="onButtonEdit" class="nui-buttonedit" name="acmenu.imagepath" id="imagepath" style="width:250px" >
					</td>
				</tr>
				<tr id="a1">
					<td align="right" style="width:100px">菜单层次：</td>
					<td>
						<input class="nui-textbox" name="acmenu.menulevel" id="menulevel" style="width:250px" readonly="readonly">
					</td>
				</tr>
				<tr id="a2">
					<td align="right" style="width:100px">子节点数：</td>
					<td>
						<input class="nui-textbox" name="acmenu.subcount" id="subcount" style="width:250px" readonly="readonly">
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
	<a class="nui-button" onclick="saveMenu" id="a" style="width:60px;margin-right:20px;">保存</a>
	<a class="nui-button" onclick="onCancel('cancel')" style="width:60px;" id="kos">关闭</a>
</div>
    <script type="text/javascript">
		nui.parse();
    	var form = new nui.Form("form1");
    	var menuid = '<%=request.getParameter("menuid") %>';
    	var pName = '<%=request.getParameter("pName") %>';
    	var addURL ="org.gocom.abframe.rights.menu.MenuManager.insertSubMenu.biz.ext";
    	var updateURL ="org.gocom.abframe.rights.menu.MenuManager.updateMenu.biz.ext";
    	var start;
    	if(menuid!='null'&&menuid!=""){
    		start = '1';
    		document.getElementById('kos').style.display="none"
    		init();
    	}
    	
    	function saveMenu(){
    		if(!form.validate()){
				alert("请检查表单的完整性!");
				return;
			}
    		var data = form.getData();
    		var menuid = nui.get("menuid").getValue();
    		if(menuid==null||menuid==""){
    			var json = nui.encode({"upMenu":data.acmenu.acMenu,"subMenu":data.acmenu});
				nui.ajax({
			        type:'post',
			        data:json,
			        async:false,
			        contentType: 'text/json',
			        url:addURL,
			        success:function(o){
			        	var result = o.result;
			        	if(result=='1'){
			        		alert("保存成功！");
			        		onCancel("ok");
			        	}else{
			        		alert("保存失败！");
			        	}
			        }
				});
    		}else{
				var json = nui.encode({"newMenu":data.acmenu});
				nui.ajax({
			        type:'post',
			        data:json,
			        async:false,
			        contentType: 'text/json',
			        url:updateURL,
			        success:function(o){
			        	var result = o.result;
			        	if(result=='1'){
			        		alert("保存成功！");
			        		if(start=='1'){
			        			top["win"].search();
			        			window.opener.search();
			        		}else{
			        			onCancel("ok");
			        		}
			        	}else{
			        		alert("保存失败！");
			        	}
			        }
				});    		
    		}
    	}
    	
    	function init(){
    		var json = nui.encode({"menu":{"menuid":menuid}});
			nui.ajax({
				url:'org.gocom.abframe.rights.menu.MenuManager.expandMenuFillFuncname.biz.ext',
		        type:'post',
		        data:json,
		        contentType: 'text/json',
		        success:function(o){
		        	var k = {"acmenu":o.menu};
		        	form.setData(k);
		        	if(pName!='null'&&pName!=""){
		        		nui.get("menulabel").setValue(pName);
		        	}
		        	if(k.acmenu.imagepath!=null&&k.acmenu.imagepath!=""){
		        		nui.get("imagepath").setText(k.acmenu.imagepath);
	    				nui.get("imagepath").setValue(k.acmenu.imagepath);
		        	}
	    			if(k.acmenu.funcname!=null&&k.acmenu.funcname!=""){
	    				nui.get("funccode").setText(k.acmenu.funcname);
	    				nui.get("funccode").setValue(k.acmenu.funccode);
	    			}
	    			if(k.acmenu.isleaf=="n"){
	    				nui.get("isleaf").setReadOnly(true);
	    				nui.get("funccode").setReadOnly(true);
	    				nui.get("openmode").setReadOnly(true);
	    			}
		        }
			});
    	}
    	
    	function SetData(data){
    		var fangs = data.fangs;
    		if(data){
    			if(fangs=='1'){
    				nui.get("menulabel").setValue(data.menulabel);
    				nui.get("upmenuid").setValue(data.menuid);
    				nui.get("menulabel").setReadOnly(true);
    				document.getElementById('a1').style.display="none"
    				document.getElementById('a2').style.display="none"
    			}else{
    				var json = nui.encode({"menu":{"menuid":data.menuid}});
	    			nui.ajax({
	    				url:'org.gocom.abframe.rights.menu.MenuManager.expandMenuFillFuncname.biz.ext',
				        type:'post',
				        data:json,
				        contentType: 'text/json',
				        success:function(o){
				        	var k = {"acmenu":o.menu};
				        	form.setData(k);
				        	if(k.acmenu.imagepath!=null&&k.acmenu.imagepath!=""){
				        		nui.get("imagepath").setText(k.acmenu.imagepath);
			    				nui.get("imagepath").setValue(k.acmenu.imagepath);
				        	}
			    			if(k.acmenu.funcname!=null&&k.acmenu.funcname!=""){
			    				nui.get("funccode").setText(k.acmenu.funcname);
			    				nui.get("funccode").setValue(k.acmenu.funccode);
			    			}
			    			if(k.acmenu.isleaf=="n"){
			    				nui.get("isleaf").setReadOnly(true);
			    				nui.get("funccode").setReadOnly(true);
			    				nui.get("openmode").setReadOnly(true);
			    			}
				        }
					});
    			}
    		}
    	}
    	
    	function checkNumber(e){
	        if (!isNumber(e.value)) {
	            alert("请输出正确的数字!") ;
	            nui.get("displayorder").setValue("");
	        }
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
	        CloseWindow(e);
	        window.opener.search();
	    }
	    
	    //选择图标
    	function onButtonEdit(e) {
		    var btnEdit = this;
		    nui.open({
				url:"<%=request.getContextPath() %>/common/layuimini/page/icon.jsp",
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
		
		//选择功能
    	function showEmployee1(e) {
		    var btnEdit = this;
		    nui.open({
				url:"<%=request.getContextPath() %>/abframe/rights/newMenu/newFunctionSelect.jsp",
				title: "选择列表",
				width: 900,
				height: 440,
				ondestroy: function (action) {
					if (action == "ok") {
						var iframe = this.getIFrameEl();
						var data = iframe.contentWindow.GetData();
						data = nui.clone(data);    //必须
						if (data) {
			                btnEdit.setValue(data.funccode);
			                btnEdit.setText(data.funcname);		 
			                nui.get("menuaction").setValue(data.funcaction);
						}
					}
				}
			});
		}
		
		function changeRd(){
			var isleaf = nui.get("isleaf").getValue();
			if(isleaf=='y'){
				nui.get("funccode").setReadOnly(false);
				nui.get("funccode").setRequired(true);
				nui.get("openmode").setRequired(true);
				nui.get("openmode").setReadOnly(false);
			}else{
				nui.get("funccode").setRequired(false);
				nui.get("openmode").setRequired(false);
				nui.get("funccode").setReadOnly(true);
				nui.get("openmode").setReadOnly(true);
			}
		}
   	</script>
</body>
</html>