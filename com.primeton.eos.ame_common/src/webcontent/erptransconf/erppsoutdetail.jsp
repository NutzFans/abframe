<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%
	String contextPath=request.getContextPath();
 %>
<html>
<!-- 
  - Author(s): xuqq
  - Date: 2017-01-03 16:07:20
  - Description:
-->
<head>
	<title>财务核算工时明细查看</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<script src="../common/nui/nui.js" type="text/javascript"></script>
	<script type="text/javascript" src="<%=contextPath %>/common/components/swffileupload/swfupload/swffileupload.js"></script>
	<style type="text/css">
	    /* body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    } */
    </style>
</head>
<body>
<div>
	<fieldset style="width:1333px;border:solid 1px #aaa;padding:3px;">
		<legend><span id="titletext" style="font-size: 12px;">财务核算工时明细</span></legend>
		<div id="datagrid1" class="nui-datagrid" style="width:100%;height:auto;" dataField="ErpPsOut" pageSize="20" sizeList="[10,20,50,100,500]" 
	        url="com.primeton.eos.ame_common.erptransconf.queryErpPsOut.biz.ext"   allowResize="true"   showpager="true"
	        allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true" showSummaryRow="true" 
	        ondrawsummarycell="doSum" allowSortColumn="true" virtualScroll="true" allowHeaderWrap="true"
	        onheadercellclick="headerSort" >
	        <div property="columns"> 
	            <%--<div field="org" width="100" headerAlign="center" align="center" allowSort="false" renderer="showorg" visible="false">所属事业部</div>   --%> 
	            <div field="pkCorp" width="100" headerAlign="center" align="center" allowSort="false" renderer="onGendercost" >成本类型</div>  
	            <div field="year"  width="60" headerAlign="center" align="center" allowSort="true">财务年</div>
	            <div field="month"  width="60" headerAlign="center" align="center" allowSort="true">财务月</div>  
	            <div field="serviceDate"  width="160" headerAlign="center" align="center" allowSort="true">填报如期</div>   
	            <div field="empCode"  width="60" headerAlign="center" align="center" allowSort="true">员工工号</div>   
	            <div field="empName"  width="60" headerAlign="center" align="center" allowSort="true">员工姓名</div>  
	            <div field="empOrgname"  width="160" headerAlign="center" align="center" allowSort="true">员工所属部门</div>  
	            <div field="buyOrgname"  width="60" headerAlign="center" align="center" allowSort="true">受益部门</div>    
	            <div field="prjNum"  width="120" headerAlign="center" align="center" allowSort="true">项目编号</div> 
	            <div field="prjName"  width="260" headerAlign="center" align="center" allowSort="true">项目名称</div>   
	            <div field="workingHours"  width="60" headerAlign="center" align="center" allowSort="true">工作时间</div>      
	            <div field="unitPrice"  width="60" headerAlign="center" align="center" allowSort="true">工时单价</div>
	            <div field="costs" summaryType="sum" width="auto" headerAlign="center" align="right" allowSort="true" dataType="float" decimalPlaces="2" >工时成本</div>
	        </div>
	    </div>
	</fieldset>
</div>
<div style="text-align:center;padding:10px;width:1318px;" class="nui-toolbar">
	<a class="nui-button" onclick="onCancel('cancel')" style="width:60px;" id="canelButton">关闭</a>
</div>
<script type="text/javascript">
	nui.parse();
	var grid = nui.get("datagrid1");
	//接受url的参数
	var type = getUrlParam("type");
	var year = getUrlParam("year");
	var month = getUrlParam("month");
	function getUrlParam(name) { 
		var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); 
		var r = window.location.search.substr(1).match(reg); 
		if (r != null) 
		return decodeURIComponent(r[2]); 
		return null; 
	}
	init();
	function init(){
		var json = {"type": type,"year": year,"month":month};
		grid.load(json,function(){
				
			});
	}
	
 	//数据汇总
    function doSum(e){
    	if (e.field == "staticcost") {
            e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
        }
        if (e.field == "costs") {
            e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
        }
    }
    
    function onCancel(e) {
    	CloseWindow("cancel");
    }
        
    //标准方法接口定义
    function CloseWindow(action) {            
        if (action == "close" && form.isChanged()) {
            if (confirm("数据被修改了，是否先保存？")) {
                return false;
            }
        }
        if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
        else window.close();            
    }
    
    function onGendercost(e){
    	return nui.getDictText('AME_LABORTYPE',e.value);
    }
</script>
</body>
</html>