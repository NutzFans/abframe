<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): mengyy
  - Date: 2020-02-27 15:50:41
  - Description:
-->
<head>
<title>员工合同信息</title>
</head>
<body>
	<!-- 合同属性（劳动合同、实习协议、其他协议）、合同性质（固定期限合同、无固定期限合同）、合同期限、合同开始日期、合同结束日期、职位；允许上传附件； -->
	<div id="Contract" class="nui-datagrid" style="width:100%;height:auto;" dataField="cons"
	    showPager="false" allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true"
	    url="org.gocom.abframe.org.employee.EmpContract.getEmpContractByName.biz.ext" allowSortColumn="true" allowCellWrap="true">			            
	    <div property="columns">
	    	<input field="empcontid" class="nui-hidden" visible="false">
	    	<div field="conttype" width="60" headerAlign="center" align="center"allowSort="true" renderer="getConttype">合同属性</div>
	        <div field="contprop" width="80" headerAlign="center" align="center"renderer="getContprop">合同性质</div>
	        <div field="conttime" width="70" headerAlign="center" align="left">合同期限(年)</div>
	        <div field="contstart" width="80" headerAlign="center" align="left">合同开始日期</div>
	        <div field="contend" width="80" headerAlign="center" align="left">合同结束日期</div>
	        <div field="position" width="80" headerAlign="center" align="center" renderer="getPosition">职位分类</div>
	        <div field="positionname" width="80" headerAlign="center"  align="left">职位名称</div>
	        <div field="contcompany"  width="60" headerAlign="center"  align="center" renderer="company" allowSort="true" >签署公司</div>
	        <div field="contuserid"  width="60" headerAlign="center"  align="center" allowSort="true" >签署工号</div>
	        <div field="contworkplace"  width="60" headerAlign="center"  align="center" renderer="workplace" allowSort="true" >工作地</div>
	        <div field="contstatus"  width="60" headerAlign="center"  align="center" renderer="contstatus" allowSort="true" >签署状态</div>
	        <div field="remark"  width="60" headerAlign="center"  align="center" allowSort="true" >备注</div>
	        <div field="agentname" width="80"  headerAlign="center" align="center" displayField="agentname">经办人</div>
	        <div field="files" renderer="onFileRenderer" width="100" hight="100"  align="left" headerAlign="center">附件</div>
		</div>
	</div>
</body>
</html>