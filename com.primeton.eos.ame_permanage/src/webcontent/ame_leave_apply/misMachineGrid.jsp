<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): mengyy
  - Date: 2019-09-04 19:31:10
  - Description:
-->
<head>
<title>资产信息</title>
</head>
<body>
	<div id="misMachine_grid" class="nui-datagrid" style="width:auto;height:auto;" frozenStartColumn="0" frozenEndColumn="3" 
        url="com.primeton.eos.machine.machine.machineQuery.biz.ext" dataField="machinedata" 
        idField="id"  sizeList="[10,20,50]" pageSize="200" multiSelect="true"  showSummaryRow="true" 
        allowCellEdit="true" allowCellSelect="true">
	    <div property="columns">
	    	<div field="assetnum" width="80" headerAlign="center" renderer="onMachinRenderer" allowSort="true">资产编号</div>
	    	<div field="buytime"width="80" headerAlign="center" dateFormat="yyyy-MM-dd" allowSort="true">购买日期</div>
	    	<div field="assetAmount" width="100" headerAlign="center" dataType="currency" currencyUnit="￥" allowSort="true" summaryType="sum">资产原值(元)</div>
	    	<div field="type"width="80" renderer="dictType" headerAlign="center" allowSort="true">资产父类型</div>
	    	<div field="secType"width="80" renderer="dictSecType" headerAlign="center" allowSort="true">资产子类型</div>
	    	<div field="status"width="50" renderer="dictStatus" headerAlign="center" allowSort="true">状态</div>
	    	<div field="area" renderer="dictArea" width="50" headerAlign="center" allowSort="true">区域</div>
	    	<div field="storageType"width="50" renderer="dictStorageType" headerAlign="center" allowSort="true">管理类型</div>
	    	<div field="emp"width="60" headerAlign="center">负责人</div>
	    	<div field="deptname" width="120" headerAlign="center">所属部门</div>
	    	<div field="isguoteng" renderer="dictIsGuoteng" width="100" headerAlign="center">资产分类</div>
	    </div>
	</div>
</body>
</html>