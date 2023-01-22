<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<!-- 
  - Author(s): zhuhx
  - Date: 2020-03-18 14:17:51
  - Description:
-->
<head>
<title>本期已确认收入</title>
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
         <div id="grid_1" class="nui-datagrid" style="width:100%;height:350px;" allowResize="true" dataField="csReveForecastFins" showSummaryRow="true" ondrawsummarycell="doCsReveSum"
	    url="com.primeton.eos.ame_income.csReveForcastFin.queryconfirmReveForeCastFin.biz.ext" showPager="false" multiSelect="true" 
	   >
			<div property="columns">
				<div field="custname" width="150" align="left" allowSort="true" headerAlign="center">签署客户</div>			
				<div field="contnum" width="70" align="center" headerAlign="center" allowSort="true" renderer="detailCont">合同编号</div> 
				<div field="reveno" width="80" align="center"  headerAlign="center" allowSort="true" renderer="detailReve">收入确认次数</div>
				<div field="actservicesum" width="80" align="right" headerAlign="center" dataType="currency" summaryType="sum" currencyUnit="￥">已确认服务金额</div>
				<div field="actservicesum2" width="120" align="right" headerAlign="center" dataType="currency" summaryType="sum" currencyUnit="￥">已确认服务金额（不含税）</div>
				<div field="setstart" width="80" align="center" headerAlign="center" allowSort="true" >结算开始年月</div>	
				<div field="setend" width="80" align="center" headerAlign="center" allowSort="true" >结算结束年月</div>	
				<div field="labormonth" width="80" align="center" headerAlign="center" allowSort="true" >本期确认工作量</div>	
				<div field="labormonthact" width="80" align="center" headerAlign="center" allowSort="true" >本期实际工作量</div>
				<div field="confirmday" width="80" align="center" headerAlign="center" allowSort="true" >财报确认日期</div>	
				<div field="confirmdayStart" width="80" align="center" headerAlign="center" allowSort="true">应收开始日期</div>	
				<div field="projectno" width="100" renderer="detailProj" headerAlign="center" allowSort="true">项目编号</div>
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
    function doCsReveSum(e){        	
        if (e.field == "actservicesum" || e.field == "actservicesum2") {
            e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
        }
    }
		
    </script>
</html>