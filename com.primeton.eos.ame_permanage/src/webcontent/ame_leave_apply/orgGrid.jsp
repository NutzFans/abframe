<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): mengyy
  - Date: 2019-09-04 19:31:10
  - Description:
-->
<head>
<title>负责部门信息</title>
</head>
<body>
	<div style="width:100%;" id="updateOrg">
        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
            <table style="width:100%;">
                <tr>
                    <td style="width:100%;">
                        <a class="nui-button" iconCls="icon-edit" onclick="updateOrg('org_grid')" plain="true">修改机构负责人</a>
                    </td>
                </tr>
            </table>           
        </div>
    </div>
    <div id="org_grid"  class="nui-datagrid" style="width:100%;"
    dataField="oaOrg" multiSelect="true" pageSize="200" sizeList="[10,20,30,50]" allowAlternating="true"
    url='org.gocom.abframe.org.organization.OrgManager.queryOrgByCriteria.biz.ext'>
    <div property="columns">
	    <div type="checkcolumn"></div>
        <div field="orgcode" width="50" headerAlign="center" align="center">机构代码</div>
    	<div field="orgname" width="100" headerAlign="center" align="center" >机构名称</div>     
        <div field="orgtype" width="70" headerAlign="center" align="center" renderer="orgtype">机构类型</div>
        <div field="status" width="50" headerAlign="center"  align="center" renderer="orgstatus">机构状态</div> 
        <div field="orgdegree" width="50" headerAlign="center" align="center" renderer="orgdegree">机构等级</div> 
    </div>
	</div>
	<div id="win1" class="nui-window" title="选择人员" style="width:200px;height:220px;" 
		    showMaxButton="true" showCollapseButton="true" showShadow="true"
		    showToolbar="false" showFooter="true" showModal="false" allowResize="true" allowDrag="true">
	    	<div style="padding:5px;">
	    		<input class="nui-hidden" id="empid">
	    		<input id="lookup2"  class="nui-textboxlist"  searchField="name" style="width:70%"
					url="com.primeton.eos.ame_budget.budgetOrgManager.queryEmpByName.biz.ext" value="" text=""
					textField="EMPNAME" valueField="USERID" onvaluechanged="changeName"/>
	    	</div>
		    <div property="footbar" style="padding:5px;margin-left: 10px;">
		        <input type='button' value='确定' onclick="sureDate()" style="vertical-align: bottom;"/>
		        <input type='button' value='关闭' onclick="hideWindow()" style="vertical-align: bottom;margin-left: 20px"/>
		    </div>
	</div> 
</body>
</html>