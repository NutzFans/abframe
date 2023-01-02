<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): mengyy
  - Date: 2019-09-05 19:33:45
  - Description:
-->
<head>
<title>代办任务</title>
</head>
<body>
	<div id="taskList_grid" class="nui-datagrid bpsDatagrid" style="width: 100%;" showPager="true" allowResize="true"
		url="org.gocom.bps.wfclient.task.business.task.queryMyTasks.biz.ext" allowAlternating="true" allowCellWrap="true"
	    dataField="tasks" pageSize="200" sizeList="[50,100]" >
	    <div property="columns">
	        <div name="action" headerAlign="center" cellCls="textof_clip" align="center" renderer="onActionRenderer" width="50">操作</div>
	        <div field="workItemName" headerAlign="center" align="center" width="80" >工作项名称</div>
	        <div field="processChName" headerAlign="center" align="center" width="100">流程定义名称</div>
	        <div field="processInstName" headerAlign="center" align="left" width="200">流程实例名称</div>                                
	        <div field="createTime" headerAlign="center" align="left" dateFormat="yyyy-MM-dd HH:mm:ss" width="90">任务启动时间</div> 
	        <div field="workItemDesc" headerAlign="center" align="left" width="100"  >工作项备注</div> 
	    </div>
	</div>
</body>
</html>