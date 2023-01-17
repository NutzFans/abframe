<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): mengyy
  - Date: 2019-09-04 19:31:10
  - Description:
-->
<head>
<title>系统角色权限</title>
</head>
<body>
	<div style="width:100%;">
        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
            <table style="width:100%;">
                <tr>
                    <td style="width:1000px;">
                    	<a class="nui-button" id="okbutton" iconCls="icon-ok" onclick="onOkRole('operaRole_grid')">保存</a>
                    	<span style="color: red;">(如果权限删除，表示权限立即生效)</span>
                    </td>
                </tr>
                <tr>
                	<td >请选择下面的角色删除，并点击保存</td>
                </tr>
                <tr>
                	<td  style="width:1000px;">
                	<input class="nui-hidden" id="operatorid">
                	<input id="operaRole" class="nui-textboxlist" name="roleid" allowInput="true" textField="rolename" valueField="roleid" style="width:1030px;" />
                	</td>
                </tr>
            </table>           
        </div>
    </div>
    <!-- <div id="operaRole_grid" class="nui-datagrid" style="width:100%;height:auto;" dataField="emproles" showPager="false" 
		url="com.primeton.eos.ame_permanage.ame_leave_apply.queryEmpRole.biz.ext" allowCellSelect="true" allowCellEdit="true">			            
	    <div property="columns">
	        <div field="roleid" displayField="rolename" width="80" headerAlign="left" align="left">请选择下面的角色删除，并点击保存
		        <input property="editor" class="nui-textboxlist" name="roleid" allowInput="true" textField="rolename" valueField="roleid" searchField="name" style="width:160px;" 
				/>
			</div>
	    </div>
	</div> -->
</body>
</html>