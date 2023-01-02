<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): mengyy
  - Date: 2020-08-19 17:06:26
  - Description:
-->
<head>
<title>员工请假记录</title>
</head>
<body>
	<div id="leveapply_grid"   sizeList="[200,1000]" pageSize="200"  showPager="true" frozenStartColumn="0" frozenEndColumn="4"dataField="queryLeaves" 
	showSummaryRow="true" class="nui-datagrid" style="width:100%;" ondrawcell="ondrawqueryLeave"
	url="com.primeton.eos.ame_permanage.ame_leavepro.queryLeave.biz.ext"  multiSelect="true"  >
   		<div property="columns" >
            <div field="empname" width="60" align="center" headerAlign="center"  allowSort="true">姓名</div>
            <div field="leavetypename" width="60" align="center" headerAlign="center" allowSort="true">请假类型</div>
            <div field="status" width="60" align="center" headerAlign="center" allowSort="true" renderer="getleaveStatus">审批状态</div>
            <div field="totaldays" width="60" align="center" allowSort="true" headerAlign="center" >请假天数</div>
            <div field="qjdate" width="250" align="center" allowSort="true" headerAlign="center">请假时间</div>
            <div field="orgname" name="orgname" width="80" align="center" headerAlign="center" allowSort="true" >所属部门</div>
            <div field="reason" width="200" align="left" headerAlign="center" allowSort="true">请假原因</div>
            <div field="applydate" width="80" align="center" headerAlign="center" allowSort="true" >申请日期</div>
            <div field="confirdate" width="80" align="center" headerAlign="center" allowSort="true" >HR确认日期</div>
        </div>
    </div>
</body>
</html>