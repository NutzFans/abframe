<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): mengyy
  - Date: 2019-09-04 19:31:10
  - Description:
-->
<head>
<title>我负责的项目及受益项目</title>
</head>
<body>
	<div id="rdProject_grid" frozenStartColumn="0" frozenEndColumn="4" showPager="false" dataField="rdprojects" 
    	showSummaryRow="true" multiSelect="true" allowSortColumn="true" 
    	class="nui-datagrid" style="width:100%;" url="com.primeton.eos.ame_permanage.ame_leave_apply.queryRdPojectGrid.biz.ext" >
        <div property="columns">
            <div field="projectName" width="140" align="left" headerAlign="center" allowSort="true" renderer="getProjectNameDetail">项目名称</div>
            <div field="projectno" width="100" align="center" headerAlign="center" allowSort="true" >项目编号</div>
            <div field="projectType" width="100" align="center" headerAlign="center" allowSort="true" renderer="dictProType">项目类型</div>
            <div field="orgname" width="80" align="center" headerAlign="center" allowSort="true" >受益部门</div>
            <div field="managername" width="70" align="center" headerAlign="center" allowSort="true" >项目负责人</div>
            <div field="custname" width="90" align="left" headerAlign="center" allowSort="true" >对应客户</div>
            <div field="projectStatus" width="80" align="center" headerAlign="center" allowSort="true" renderer="dictprojectStatus">项目操作状态</div>
            <div field="outstatus" width="80" align="center" headerAlign="center" allowSort="true" renderer="dictGetOutStatus">项目商务状态</div>
            <div field="projectDestatus" width="80" align="center" headerAlign="center" allowSort="true" renderer="dictGetDeStatus">项目交付状态</div>
            <div field="contnum" width="90" align="center" headerAlign="center" allowSort="true" >合同编号</div>
            <div field="createdate" width="80" align="center" headerAlign="center" allowSort="true"  dateFormat="yyyy-MM-dd">创建日期</div>
        </div>
    </div>
</body>
</html>