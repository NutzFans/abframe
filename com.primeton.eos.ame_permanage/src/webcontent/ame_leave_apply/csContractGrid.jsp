<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): mengyy
  - Date: 2019-09-04 19:31:10
  - Description:
-->
<head>
<title>合同信息</title>
</head>
<body>
    <div id="csContract_grid" dataField="contracts" class="nui-datagrid" style="width:100%;height:auto;" showSummaryRow="true"
    	url="com.primeton.eos.ame_permanage.ame_leave_apply.queryCsContractGrid.biz.ext" idField="id" allowResize="true" ondrawsummarycell="onDrawSummaryCell"
    	 showPager="false" allowAlternating="true" multiSelect="true">
	    <div property="columns">
	        <div field="contnum" width="73" renderer="onTitleRenderer" headerAlign="center" allowSort="true">合同存档编号</div>
	        <div field="contreg" width="70" headerAlign="center" dateFormat="yyyy-MM-dd" allowSort="true">登记日期</div>
	        <div field="custname" width="130" dateFormat="yyyy-MM-dd" headerAlign="center" allowSort="true">签署单位</div>
	        <div field="projectname" width="140" headerAlign="center">合同项目名称</div>
	        <div field="prodmon" dataType="currency" summaryType="sum" currencyUnit="￥" align="right" width="100" headerAlign="center" allowSort="true">产品金额（元）</div>
	        <div field="servmon" dataType="currency" summaryType="sum" currencyUnit="￥" align="right" width="100" headerAlign="center" allowSort="true">服务金额（元）</div>
	        <div field="contsum" dataType="currency" summaryType="sum" currencyUnit="￥" align="right" width="100" headerAlign="center" allowSort="true">总金额（元）</div>
	        <div field="gathermon" dataType="currency" summaryType="sum" currencyUnit="￥" align="right" width="100" headerAlign="center">已收款金额（元）</div>
	        <div field="salename" width="50" headerAlign="center" allowSort="true">销售姓名</div>
	        <div field="org" renderer="onGenderRenderer" width="80" headerAlign="center" allowSort="true">部门</div>
	        <div field="status" renderer="onGender1Renderer" width="60" headerAlign="center" allowSort="true">合同状态</div>
	    </div>
	</div>
</body>
</html>