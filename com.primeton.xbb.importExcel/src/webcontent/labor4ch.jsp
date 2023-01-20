<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="commonj.sdo.DataObject"%>
<%@page import="java.util.Map"%>
<html>
<!-- 
  - Author(s): ChiaYang
  - Date: 2016-10-31 14:19:25
  - Description:
-->
<head>
	<title>人力成本存货明细</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body>
	<div class="nui-fix">
		<div class="nui-panel" title="人力成本结转明细" style="width: auto">
			<div id="form1">
		    <div id="datagrid1" class="nui-datagrid" style="width:100%;height:500px;"  dataField="erpLabs"  showPager="false"
		    url="com.primeton.xbb.importExcel.newcomponent.queryErpPsOut.biz.ext" allowResize="true" showSummaryRow="true" ondrawsummarycell="doCountNowPage">
			    <div property="columns">
			    	<div field="syb" width="120px;" align="center" headerAlign="center" >事业部</div>
			    	<div field="custjc" width="120px;" align="center" headerAlign="center" >客户简称</div>
			    	<div field="contnum" width="100px;" align="left" headerAlign="center" >合同编号</div>
			    	<div field="buyOrgname" width="80px;" align="center" headerAlign="center" >受益部门</div>
			    	<div field="costmemo" width="80px;" align="center" headerAlign="center"  renderer="dictGetAME_COSTTYPE">成本结转说明</div>
			    	<div field="stockdate" width="80px;" align="center" headerAlign="center" dateFormat="yyyy-MM-dd">存货结转日期</div>
			    	<div field="costs" width="125px;" align="right" headerAlign="center"  currencyUnit="￥" summaryType="sum" dataType="currency">工时成本</div>
			    	<div field="year" width="80px;" align="center" headerAlign="center" >财务年</div>
			    	<div field="month" width="80px;" align="center" headerAlign="center"  >财务月</div>
			    	<div field="serviceDate" width="150px;" align="center" headerAlign="center" dateFormat="yyyy-MM-dd">填报时间</div>
			    	<div field="empCode" width="125px;" align="left" headerAlign="center" >员工工号</div>
			    	<div field="empName" width="125px;" align="left" headerAlign="center" >员工名称</div>
			    	<div field="empOrgname" width="135px;" align="left" headerAlign="center" >员工所属部门</div>
			    	<div field="prjNum" width="120px;" align="left" headerAlign="center" >项目编号</div>
			    	<div field="prjName" width="70px;" align="left" headerAlign="center" >项目名称</div>
			    	<div field="workingHours" width="80px;" align="center" headerAlign="center" >工作时间</div>
			    	<div field="unitPrice" width="80px;" align="center" headerAlign="center" >工时单价</div>
			    </div>
			</div>
		</div>
	</div>
	<div style="text-align:center;padding:10px;border-width:1px 0px 0px 0px;" id="temp1" class="nui-toolbar">
	    	<a class="nui-button" onclick="onCancel" style="width:60px;">关闭</a>
		</div>
	<script type="text/javascript">
		nui.parse();
		var grid = nui.get("datagrid1");
		var form = new nui.Form("form1");
		var myyear = '<%=request.getParameter("years") %>';
		var mymonth = '<%=request.getParameter("months") %>';
		var salename = '<%=request.getParameter("salename") %>';
		var custname = '<%=request.getParameter("custname") %>';
		var syb = '<%=request.getParameter("syb") %>';
		var contnum = '<%=request.getParameter("contnum") %>';
		var chtype = '<%=request.getParameter("chtype") %>';
		//初始化加载数据,默认按照成本确认日期降序排列
		init();
	    function init() {
			var json = {"myyear":myyear,"mymonth": mymonth,"salename" : salename,"custjc" : custname,"contnum" : contnum,"syb" : syb,"chtype" : chtype };
			var data = nui.decode(json);
			grid.load(data); 
	    	grid.sortBy("confirmdate","desc");
	    }
	    
	    //数字列提供统计行
        function doCountNowPage(e){        	
            if (e.field == "costs") {
                e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
            }
        }
	    
	    //设置业务字典值-成本结转类型
	    function dictGetAME_COSTTYPE(e) {
	        return nui.getDictText('AME_COSTTYPE',e.value);
	    }
	    function onCancel(e) {
			if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
	        else window.close();  
	    }
	</script>
</body>
</html>