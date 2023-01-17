<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): mengyy
  - Date: 2019-09-04 19:31:10
  - Description:
-->
<head>
<title>负责员工</title>
</head>
<body>
	<div style="width:100%;">
        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
            <table style="width:100%;">
                <tr>
                    <td style="width:100%;">
                        <a class="nui-button" iconCls="icon-edit" onclick="updateOrg('emp_grid')" plain="true">修改员工直属领导</a>
                    </td>
                </tr>
            </table>           
        </div>
    </div>
    <div id="emp_grid"  class="nui-datagrid" style="width:100%;" showPager="false"
    dataField="emps" multiSelect="true" allowAlternating="true"
    url='com.primeton.eos.ame_permanage.ame_leave_apply.queryEmpGrid.biz.ext'>
    <div property="columns">
	    <div type="checkcolumn"></div>
        <div field="empcode" width="60" headerAlign="center" align="left" allowSort="true">员工工号</div>
    	<div field="empname" width="60" headerAlign="center" align="left" allowSort="true">人员姓名</div>
    	<div field="empstatus" width="60" headerAlign="center" align="center" renderer="empstatus" allowSort="true">人员状态</div>   
        <div field="userid" width="60" headerAlign="center" align="center" allowSort="true">用户登录</div>
        <div field="gender" width="40" headerAlign="center" align="center" renderer="gender" allowSort="true">性别</div>
        <div field="orgname" width="80" headerAlign="center" align="center" allowSort="true">所属部门</div>
        <div field="majorname" width="80" headerAlign="center" align="center" allowSort="true">直接主管</div>
    </div>
	</div>
</body>
</html>