<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%
	String contextPath=request.getContextPath();
 %>
<html>
<!-- 
  - Author(s): wanglinqiong
  - Date: 2016-05-12 16:17:56
  - Description:
-->
<head>
<title>人力成本结算工时信息</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<%@include file="/common/common.jsp"%>
<h:script src='<%="/common/scripts/eos-web.js"%>' />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
    </style>
</head>
<body style="width:100%;height:100%;padding:0px;margin:0px;">
	<div class="nui-fit">
		<div style="width:100%;">
	        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
	            <table style="width:100%;">
	            	<tr>
	                    <td style="width:20%;">
	                    	人力服务成本月度统计
	                    </td>
	                </tr>
                 </table>           
	        </div>
	    </div>
        <div id="grid_erpPs" class="nui-datagrid" style="width:100%;height:auto;" showPager="false" dataField="erpPsGather"
         	url="com.primeton.eos.ame_income.csReveForeProcess.erpPs.biz.ext">
            <div property="columns">
              <div field="year" width="50px" align="center" headerAlign="center">年份</div>
              <div field="month1" width="35px" align="center" headerAlign="center" renderer="doView">1月</div>  
              <div field="month2" width="35px" align="center" headerAlign="center" renderer="doView">2月</div>  
              <div field="month3" width="35px" align="center" headerAlign="center" renderer="doView">3月</div>  
              <div field="month4" width="35px" align="center" headerAlign="center" renderer="doView">4月</div>  
              <div field="month5" width="35px" align="center" headerAlign="center" renderer="doView">5月</div>  
              <div field="month6" width="35px" align="center" headerAlign="center" renderer="doView">6月</div>  
              <div field="month7" width="35px" align="center" headerAlign="center" renderer="doView">7月</div>  
              <div field="month8" width="35px" align="center" headerAlign="center" renderer="doView">8月</div>  
              <div field="month9" width="35px" align="center" headerAlign="center" renderer="doView">9月</div>  
              <div field="month10" width="35px" align="center" headerAlign="center" renderer="doView">10月</div>  
              <div field="month11" width="35px" align="center" headerAlign="center" renderer="doView">11月</div>  
              <div field="month12" width="35px" align="center" headerAlign="center" renderer="doView">12月</div>  
              <div field="yearMoney" width="35px" align="center" headerAlign="center">全年</div>  
            </div>
      	</div>
      	<br/>
      	<div id="detailErpPsOfMonth">
      		<div style="width:100%;">
	        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
	            <table style="width:100%;">
	            	<tr>
	                    <td style="width:20%;">
	                    	人力服务成本详情
	                    </td>
	                </tr>
                 </table>           
	        </div>
	    </div>
	        <div id="grid_erpPsMonthDeatil" class="nui-datagrid" style="width:100%;height:500px;" showPager="false" sortMode="client"dataField="erpPss"
	         	url="com.primeton.eos.ame_income.csReveForeProcess.ErpPsDetail.biz.ext" showSummaryRow="true" ondrawsummarycell="onDrawSummaryCell">
	            <div property="columns">
	              <div field="year" width="70px" align="center" headerAlign="center">年份</div>
	              <div field="month" width="50px" align="center" headerAlign="center">月份</div>  
	              <div field="empCode" width="80px" align="center" headerAlign="center">工号</div>
	              <div field="empName" width="90px" align="center" headerAlign="center">姓名</div>
	              <div field="degree" width="70px" align="center" headerAlign="center">级别</div>
	              <div field="empOrgname" width="160px" align="left" headerAlign="center">部门</div>
	              <div field="prjName" width="120px" align="center" headerAlign="center">项目名称</div>
	              <div field="prjNum" width="100px" align="center" headerAlign="center">项目编号</div>
	              <div field="serviceDate" width="90px" headerAlign="center">日期</div>
	              <div field="unitPrice" width="80px" headerAlign="center">单价</div>
	              <div field="workingHours" width="60px" headerAlign="center">工时</div>
	              <div field="otwHours" width="90px" headerAlign="center">其中加班工时</div>
	              <div field="costs" width="100px" headerAlign="center" align="right"summaryType="sum" renderer="rendererMoney">成本</div>
	              <div field="buyEmpname" width="80px" headerAlign="center">受益人</div>
	              <div field="buyParentorgname" width="90px" headerAlign="center">受益人部门</div>
	            </div>
	      	</div>
	     </div>
	</div>
	<div style="text-align:center;padding:10px;border-width:1px 0px 0px 0px;" id="temp1" class="nui-toolbar">
    	<a class="nui-button" onclick="onCancel" style="width:60px;">关闭</a>
	</div> 
    <script type="text/javascript">
		nui.parse();
		var grid_erpPs = nui.get("grid_erpPs");
		var grid_erpPsMonthDeatil = nui.get("grid_erpPsMonthDeatil");
		var contnum = '<%=request.getParameter("contnum") %>';
// 		var contnum = '2015-L218';
		init();
		function init(){
			document.getElementById("detailErpPsOfMonth").style.display="none";
			grid_erpPs.load({contnum :contnum});
		}
		function onCancel(e) {
			if (window.CloseOwnerWindow) return window.CloseOwnerWindow();
	        else window.close();  
	    }
	    //汇总值处理
	    function onDrawSummaryCell(e) {
            if(e.field=='costs'){
            	e.cellHtml = "<div align='right'><b>" + formatNumber(e.cellHtml,'#,##.##') + "</b></div>";
            }
        }
        function doView(e){
        	if(e.value==0){
        		return;
        	}else{
        		return "<a href='javascript:void(0)' onclick='javascript:loadDetail(" + e.columnIndex + ","+ e.record.year+")' title='点击查看'> " + formatNumber(e.value,'#,##.##') + " </a>";
        	}
        	
        }
        function rendererMoney(e){
    		return formatNumber(e.value,'#,##.##') ;
        }
        function loadDetail(month,year){
        	document.getElementById("detailErpPsOfMonth").style.display="";
        	grid_erpPsMonthDeatil.load({contnum:contnum,year:year,month:month});
        }
	    </script>
</body>
</html>