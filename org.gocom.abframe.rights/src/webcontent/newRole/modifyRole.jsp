<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): wanglinqiong
  - Date: 2016-05-12 16:17:56
  - Description:
-->
<head>
<title>角色管理</title>
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
	<div title="角色管理">
	 	<form id="form1" method="post" >
        	<table style="table-layout:fixed;" id="table_file1">
	            <tr>
					<td align="right" style="width:100px">角色编号：</td>
					<td>
						<input class="nui-textbox" name="acRole.roleid" id="roleid" style="width:200px" required="true" onvaluechanged="checkId" />
					</td>
					<td align="right" style="width:100px">角色名称：</td>
					<td>
						<input name="acRole.rolename" id="rolename" class="nui-textbox" style="width:200px"  required="true"/>
					</td>
				</tr>
				<tr>
					<td align="right" style="width:100px">类别：</td>
					<td>
						<input name="acRole.roletype" id="roletype" class="nui-dictcombobox"  dictTypeId="ABF_ROLETYPE" style="width:200px;"  required="true"/>
					</td>
					<td align="right" style="width:100px">所属应用：</td>
					<td>
						<input name="acRole.appid" id="appid" valueField="appid" textField="appname" class="nui-combobox" shownullItem="true" style="width:200px" />
					</td>
				</tr>
				<tr>
					<!-- <td align="right" style="width:100px">创建时间：</td>
					<td>
						<input name="acRole.createtime" id="createtime" class="nui-datepicker"  style="width:200px;"  required="true"/>
					</td> -->
					<td align="right" style="width:100px">角色适用：</td>
					<td>
						<input name="acRole.suittype" id="suittype" class="nui-dictcombobox" dictTypeId="AME_ROLESUITTYPE" style="width:200px" multiSelect="true" showNullItem="true" />
					</td>
				</tr>
				<tr>
					<td align="right" style="width:100px">备注说明：</td>
					<td colspan="3">
						<input name="acRole.remark" id="remark" class="nui-textbox"   style="width:100%" inputStyle="text-align: left;"  />
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
    	var roleid;
    	var saveURL ="org.gocom.abframe.rights.role.newRoleManage.saveRole.biz.ext";
    	
    	function saveMenu(){
    		if(!form.validate()){
				alert("请检查表单的完整性!");
				return;
			}
    		var data = form.getData();
			nui.ajax({
		        type:'post',
		        data:data,
		        async:false,
		        contentType: 'text/json',
		        url:saveURL,
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
    	}
    	
    	var roleid;
    	function SetData(data){
    		if(data.roleid != null && data.roleid != ""){
    			roleid = data.roleid;
    		}
    		var json = nui.encode({});
			nui.ajax({
				url:'org.gocom.abframe.rights.role.RoleManager.queryAppAll.biz.ext',
		        type:'post',
		        data:json,
		        contentType: 'text/json',
		        success:function(o){
		        	nui.get("appid").setData(o.appList);
		        	if(roleid!='null'&&roleid!=""&&roleid!=null){
		        		var data = nui.encode({"aRoleCode":roleid});
		        		nui.ajax({
							url:'org.gocom.abframe.rights.role.RoleManager.expandRoleByCode.biz.ext',
					        type:'post',
					        data:data,
					        contentType: 'text/json',
					        success:function(o){
				        		var acRole = {"acRole":o.aRole};
				        		form.setData(acRole);
				        		nui.get("roleid").setReadOnly(true);
					        }
						});
		        	}
		        }
			});
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
	    }
	    
		function checkId(){
			var roleid = nui.get("roleid").getValue();
			var json = nui.encode({"aRoleCode":roleid});
			nui.ajax({
				url:'org.gocom.abframe.rights.role.RoleManager.expandRoleByCode.biz.ext',
		        type:'post',
		        data:json,
		        contentType: 'text/json',
		        success:function(o){
		        	var result = o.result;
		        	if(result == "1"){
		        		alert("该角色ID已存在，请确认后再进行操作！");
		        		nui.get("roleid").setValue("");
		        	}
		        }
			});
		}
   	</script>
</body>
</html>