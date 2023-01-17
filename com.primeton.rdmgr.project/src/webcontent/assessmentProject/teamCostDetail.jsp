<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@include file="/nui/common.jsp"%>
<%@ page import="com.eos.data.datacontext.UserObject"%>
<html>
<!-- 
  - Author(s): Administrator
  - Date: 2015-07-10 14:06:49
  - Description:
-->
<head>
	<title>考核团队奖金分配明细</title>
	<link href="../demo.css" rel="stylesheet" type="text/css" />
</head>
<body style="width:100%;height:100%;padding:0px;margin:0px;">
<div class="nui-fix">
	<div class="nui-panel" title="考核团队奖金分配明细" style="width:100%;">
		<div style="width:100%;" >
		    <div id="datagrid1" showPager="false" dataField="projAllots" ondrawsummarycell="drawSum"
	        	showSummaryRow="true"  sortMode="client" multiSelect="true" allowSortColumn="true" allowCellWrap="true" 
	        	class="nui-datagrid" style="width:100%;height:auto;" url="com.primeton.rdmgr.project.assessmentProject.getProjAllot.biz.ext" >
	            <div property="columns">
	            	<div field="empname" width="60" align="center" headerAlign="center" allowSort="true" >人员名称</div>
	                <div field="projrole" width="80" align="center" headerAlign="center" allowSort="true" >项目职责</div>
	                <div field="workdays" dataType="float" width="60" align="right"headerAlign="center" allowSort="true" summaryType="sum">人天数</div>
	                <div field="sum" dataType="float" width="100" align="right"headerAlign="center" allowSort="true" numberFormat="n2" summaryType="sum">奖金金额</div>
	                <div field="num" width="60" align="right"headerAlign="center" allowSort="true">考核评分</div>
	                <div field="evaluate" width="200" align="left"headerAlign="center" allowSort="true">考核评价</div>
	                <div field="remark" width="200" align="left"headerAlign="center" allowSort="true">备注</div>
	            </div>
	        </div>
		</div>
	</div>
</div>
</body>
<script>
	nui.parse();
	var grid = nui.get("datagrid1");
	var projcheckid = <%=request.getParameter("projcheckid")%>;
	
	init();
	function init(){
		var grid = nui.get("datagrid1");
		var data = {"projcheckid":projcheckid};
		grid.load(data);
	}
	
	function drawSum(e){
		if (e.field == "workdays"||e.field == "sum") {
            e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
        }
	}
</script>
</html>