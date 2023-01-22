<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="commonj.sdo.DataObject"%>
<%@page import="java.util.Map"%>
<html>
<!-- 
  - Author(s): zhuhx
  - Date: 2020-03-18 14:17:51
  - Description:
-->
<head>
<title>工作量明细</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
    <style type="text/css">
    html, body
    {
        font-size:12px;
        padding:0;
        margin:0;
        border:0;
        height:100%;
        overflow:hidden;
    }
    </style>
</head>
<body style="width:100%;height:100%;padding:0px;margin:0px;">
	<div class="nui-fit">
        <div id="grid_1" class="nui-datagrid" style="width:100%;height:360px;" showPager="false" 
        	url="com.primeton.eos.ame_income.csReveForcastFin.getReveFinLabor.biz.ext" 
         	sortMode="client"dataField="pemps" showSummaryRow="true" ondrawsummarycell="onDrawSummaryCell" >
		    <div property="columns">
  		      <div field="contnum" width="30px" align="center" headerAlign="center">合同编号</div> 
		      <div field="laborDate" width="25px" dateFormat="yyyy-MM-dd" align="center" headerAlign="center">工时日期</div>
		      <div field="userId" width="20px" align="center" headerAlign="center">人员工号</div>  
		      <div field="userName" width="20px" align="center" headerAlign="center">人员姓名</div>
		      <div field="actHours" width="20px"  align="right" headerAlign="center" summaryType="sum">工作时间</div>
		      <div field="deptname" width="30px" align="center" headerAlign="center">人员所在部门</div>
		      <div field="salesName" width="25px" align="center" headerAlign="center">受益部门</div>
		      <div field="projectno" width="30px" align="center" headerAlign="center" >项目代码</div>  
		      <div field="projectname" width="55px" headerAlign="center" >项目名称</div> 
		      <div field="standcost" width="30px" align="right" dataType="currency" summaryType="sum" headerAlign="center">成本</div>
		    </div>
      </div>
	</div>
	<div style="text-align:center;padding:10px;border-width:1px 0px 0px 0px;" id="temp1" class="nui-toolbar">
    	<a class="nui-button" onclick="onCancel" style="width:60px;">关闭</a>
	</div> 
</body>
<script type="text/javascript">

	nui.parse();
	var grid = nui.get("grid_1");
	var contnum = getUrlParam("contnum");
	var startdate= getUrlParam("startdate");
	var enddate= getUrlParam("enddate");
	search();
	function getUrlParam(name) { 
		var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); 
		var r = window.location.search.substr(1).match(reg); 
		if (r != null) 
		return unescape(r[2]); 
		return null; 
	} 	
	
	//查询
	function search() {
		var data= {"contnum":contnum,"startdate":startdate,"enddate":enddate}; 
	  	grid.load(data); //datagrid加载数据
	}
			
	
	function onCancel(e) {
		if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
        else window.close();  
    }
    //汇总值处理
    function onDrawSummaryCell(e) {
        if(e.field=='actHours'){
        	var actDays = (parseFloat(e.value)/8/20.5).toFixed(2);
        	e.cellHtml = "<div align='right'><b>" + actDays+"人月"+ "</b></div>";
        }
        if(e.field=='standcost'){
        	e.cellHtml = "<div align='right'><b>" +e.cellHtml+ "</b></div>";
        }
    }
    
    </script>
</html>