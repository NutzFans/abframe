<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): mengyy
  - Date: 2019-10-25 15:43:42
  - Description:
-->
<head>
<title>员工合同信息</title>
</head>
<body>
    <!-- 合同属性（劳动合同、实习协议、其他协议）、合同性质（固定期限合同、无固定期限合同）、合同期限、合同开始日期、合同结束日期、职位；允许上传附件； -->
    <div id="Contract_grid" class="nui-datagrid" style="width:100%;height:auto;" dataField="cons"
        showPager="false" allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true"
        url="org.gocom.abframe.org.employee.EmpContract.getEmpContractByName.biz.ext" allowSortColumn="true" allowCellWrap="true">			            
        <div property="columns">
        	<input field="empcontid" class="nui-hidden" visible="false">
        	<div field="conttype" width="80" headerAlign="center" align="center"allowSort="true" renderer="getConttype">合同属性</div>
            <div field="contprop" width="100" headerAlign="center" align="center"renderer="getContprop">合同性质</div>
            <div field="conttime" width="80" headerAlign="center" align="left">合同期限(年)</div>
            <div field="contstart" width="80" headerAlign="center" align="left">合同开始日期</div>
            <div field="contend" width="80" headerAlign="center" align="left">合同结束日期</div>
    	</div>
	</div>
</body>
</html>