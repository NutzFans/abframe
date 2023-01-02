<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): mengyy
  - Date: 2020-02-27 14:07:24
  - Description:
-->
<head>
	<title>员工信息详情</title>
	<style type="text/css">
	    .asLabel
	    {
	        border:0;background-color:#F5F5F5;cursor:default;    
	    }
	</style>
</head>
<body>
    <div style="width: auto;" >
		<fieldset id="field1" style="border:solid 1px #aaa;padding:3px;">
            <legend>人员信息</legend>
            <table style="table-layout:fixed;" id="table_file">
            	<tr>
                	<td width="160px" align="right">人员姓名：</td>
                    <td width="150px" id="empname" class = "asLabel"></td>
                    <td style="width:120px;" align="right">二级部门：</td>
                    <td style="width:150px;" id="orgname" class = "asLabel"></td>
                    <td style="width:120px;" align="right">员工工号：</td>
                    <td style="width:150px;" id="empcode" class = "asLabel"></td>
            		<td style="width:120px;" align="right">登录名：</td>
                    <td style="width:150px;" id="userid" class = "asLabel"></td>  
            	</tr>
            	<tr>
            		<td style="width:120px;" align="right">手机号：</td>
                    <td style="width:150px;" id="mobileno" class = "asLabel"></td>
                    <td style="width:120px;" align="right">员工属性：</td>
                    <td style="width:150px;" id="emptype" class = "asLabel"></td>
            		<td style="width:120px;" align="right">人员性质：</td>
                    <td style="width:150px;" id="nature" class = "asLabel"></td>
            		<td style="width:120px;" align="right" >所属公司：</td>
                    <td style="width:150px;" id="company" class = "asLabel"></td>
            	</tr>
            	<tr>
            		<td style="width:120px;" align="right">职位分类：</td>
                    <td style="width:150px;" id="positionname" class = "asLabel"></td>
            		<td style="width:120px;" align="right">职位名称：</td>
                    <td style="width:150px;" id="positioncall" class = "asLabel"></td>
            		<td style="width:120px;" align="right" >工作地：</td>
                    <td style="width:150px;" id="workplace" class = "asLabel"></td>
            		<td style="width:120px;" align="right" >办公邮箱：</td>
                    <td style="width:150px;" id="oemail" class = "asLabel"></td>
            	</tr>
            	<tr>
                    <td style="width:120px;" align="right">性别：</td>
                    <td style="width:150px;" id="gender" class = "asLabel"></td>
            	</tr>
            </table>
		</fieldset> 
	</div>
</body>
</html>