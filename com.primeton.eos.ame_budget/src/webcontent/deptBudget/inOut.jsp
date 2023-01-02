<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): wanglinqiong
  - Date: 2016-05-13 15:11:04
  - Description:
-->
<head>
<title>买入卖出tab页面</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<%@include file="/common/common.jsp"%>
<h:script src='<%="/common/scripts/eos-web.js"%>' />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    .myRow{
	        background-color: #EBEDF1;border: 0px;
	    }
	    .myNum{
	        background-color: #EBEDF1;border: 0px;font-weight: bold;
	    }
    </style>
</head>
<body>
<div width="auto">
	<fieldset style="border:solid 1px #aaa;padding:3px;width:1080px;">
    <legend>买入卖出汇总</legend>
        <div id="grid_AllInOut" class="nui-datagrid" style="width:1080px;height:auto;" dataField="deptInoutBudgets" allowAlternating="true" ondrawcell="drawcell" 
    	 url="com.primeton.eos.ame_budget.buyInOut.queryBuyInOutList.biz.ext" showPager="false" ><!-- showSummaryRow="true" ondrawsummarycell="doCountSum" -->
			<div property="columns">
				<div field="type" width="60" align="center" headerAlign="center" >分类</div>
				<div field="month1" width="75" align="right" headerAlign="center" numberFormat="n0" summaryType="sum" >1月</div>
				<div field="month2" width="75" align="right" headerAlign="center" numberFormat="n0" summaryType="sum" >2月</div>
				<div field="month3" width="75" align="right" headerAlign="center" numberFormat="n0" summaryType="sum">3月</div>
				<div field="month4" width="75" align="right" headerAlign="center" numberFormat="n0" summaryType="sum">4月</div>
				<div field="month5" width="75" align="right" headerAlign="center" numberFormat="n0" summaryType="sum">5月</div>
				<div field="month6" width="75" align="right" headerAlign="center" numberFormat="n0" summaryType="sum">6月</div>
				<div field="month7" width="75" align="right" headerAlign="center" numberFormat="n0" summaryType="sum">7月</div>
				<div field="month8" width="75" align="right" headerAlign="center" numberFormat="n0" summaryType="sum">8月</div>
				<div field="month9" width="75" align="right" headerAlign="center" numberFormat="n0" summaryType="sum">9月</div>
				<div field="month10" width="75" align="right" headerAlign="center" numberFormat="n0" summaryType="sum">10月</div>
				<div field="month11" width="75" align="right" headerAlign="center" numberFormat="n0" summaryType="sum">11月</div>
				<div field="month12" width="75" align="right" headerAlign="center" numberFormat="n0" summaryType="sum">12月</div>
				<div field="year" width="75" align="right" headerAlign="center"  numberFormat="n0" summaryType="sum">全年</div>
			</div>
		</div>
    </fieldset>
    <fieldset style="border:solid 1px #aaa;padding:3px;width:1080px;">
    <legend>买入明细</legend>
    <div style="width:1080px;">
	        <div style="border-bottom:0;padding:0px;">
	            <table style="width:100%;">
	            	<tr>
	                    <td style="width:20%;"><!-- 公用一个页面 -->
	                        <span id="editbutton"><a class="nui-button" id="addOrEditBuyInSaleOut" iconCls="icon-edit"  onclick="modifBuyIn()" >增加/编辑买入成本</a></span>
	                    </td>
	                </tr>
                 </table>           
	        </div>
	    </div>
    	<div id="grid_BuyInDetail" class="nui-datagrid" dataField="deptInoutBudgets" style="width:1080px;height:auto;" allowCellSelect="true" showSummaryRow="true" onheadercellclick="clickBuyInHeader" sortMode="client"
        	url="com.primeton.eos.ame_budget.buyInOut.buyInList.biz.ext" showPager="false" allowCellEdit="true" ondrawsummarycell="doCountSum" allowAlternating="true">
            <div property="columns">
<!--             	<div type="indexcolumn" width="25" align="center" headerAlign="center" cellCls="myIndex">编号</div> -->
                <div field="orgname" visible="false">部门</div>
                <div field="inoutid" visible="false">主键ID</div>
                <div field="orgid" visible="false" >部门ID</div>
                <div field="year" visible="false">预算年度</div>
                <div field="month" width="40" align="center" headerAlign="center">预算月份</div>
                <div field="inorgid" displayField="inorgname" width="100" align="left" headerAlign="center">买入部门</div>
                <div field="outorgid"  width="100" align="left" displayField="outorgname"  headerAlign="center" >卖出部门</div>
                <div field="money"  width="80" align="right" headerAlign="center" summaryType="sum" numberFormat="n0" dataType="float">金额</div>
                <div field="memo"  width="290" align="left" headerAlign="center">预算说明</div>
            </div>
        </div>
    </fieldset>
    <fieldset style="border:solid 1px #aaa;padding:3px;width:1080px;">
    <legend>卖出明细</legend>
    	<table style="width:1080px;">
        	<tr>
                <td style="width:20%;">
			    	<a class="nui-button" iconCls="icon-download" onclick="exportSaleOutDetail()">导出卖出明细</a>
                </td>
            </tr>
         </table>
    	<div id="grid_SaleOutDetail" class="nui-datagrid" dataField="deptInoutBudgets" style="width:1080px;height:auto;" allowCellSelect="true" showSummaryRow="true" onheadercellclick="clickSaleOutHeader" sortMode="client"
        	url="com.primeton.eos.ame_budget.buyInOut.saleOutList.biz.ext" showPager="false" allowCellEdit="true" ondrawsummarycell="doCountSum" allowAlternating="true">
            <div property="columns">
<!--             	<div type="indexcolumn" width="25" align="center" headerAlign="center" cellCls="myIndex">编号</div> -->
                <div field="orgname" visible="false">部门</div>
                <div field="inoutid" visible="false">主键ID</div>
                <div field="orgid" visible="false">部门ID</div>
                <div field="year" visible="false">预算年度</div>
                <div field="month" width="40" align="center" headerAlign="center" dataType="int">预算月份</div>
                <div field="inorgid" displayField="inorgname" width="100" align="left" headerAlign="center">买入部门</div>
                <div field="outorgid"  width="100" align="left" displayField="outorgname"  headerAlign="center">卖出部门</div>
                <div field="money"  width="80" align="right" headerAlign="center" summaryType="sum" numberFormat="n0" dataType="float">金额</div>
                <div field="memo"  width="290" align="left" headerAlign="center">预算说明</div>
            </div>
        </div>
        <form name="viewlist1" id="viewlist1" action="com.primeton.eos.ame_common.ameExportCommon.flow" method="post">
			<input type="hidden" name="_eosFlowAction" value="action0" filter="false"/>
			<input type="hidden" name="downloadFile" filter="false"/>
			<input type="hidden" name="fileName" filter="false"/>
		</form>
    </fieldset>
</div>
	<script type="text/javascript">
    	nui.parse();
    	var grid_AllInOut = nui.get("grid_AllInOut");
    	var grid_BuyInDetail = nui.get("grid_BuyInDetail");
    	var grid_SaleOutDetail = nui.get("grid_SaleOutDetail");
    	//事业部（或普元或业务单元）
    	var orgid = '<%=request.getParameter("orgid") %>';
    	//事业部名称
    	var orgname = '<%=request.getParameter("orgname") %>';
    	//年份
    	var year = '<%=request.getParameter("year") %>';
    	//成本类型
    	var costtype = '<%=request.getParameter("costtype") %>';
    	var costtypename = '<%=request.getParameter("costtypename") %>';
    	//初始化数据事业部查看权限（业务单元、或者事业部数据）
    	var orgFlag = '<%=request.getParameter("orgFlag") %>';
    	if(orgFlag=="1"||orgFlag=="2"){
    		document.getElementById("editbutton").innerHTML="<a class='nui-button' id='addOrEditRecurit' iconCls='icon-search' onclick='modifBuyIn()' >查看买入成本</a>";
    	}
    	init();
    	//初始化、重置调用方法
    	function init(){
    		grid_AllInOut.load({"orgid":orgid,"year":year,"costtype":costtype,"orgname":orgname,"orgFlag":orgFlag},function(){
    		});
    		grid_BuyInDetail.load({orgid:orgid,year:year,orgname:orgname,costtype:costtype,orgFlag:orgFlag,costtypename:costtypename});
    		grid_SaleOutDetail.load({orgid:orgid,year:year,orgname:orgname,costtype:costtype,orgFlag:orgFlag,costtypename:costtypename});
		}
		
		function modifBuyIn(){
			//锁定解锁
    		var budstatus = "";
			//点击
			nui.ajax({
                url: "com.primeton.eos.ame_budget.common.lockOrUnlock.biz.ext",
                data: {year:year},
                type: 'POST',
                cache: false,
                contentType: 'text/json',
                success: function (text) {
                	budstatus = text.budstatus;//1锁定、2解锁
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert(jqXHR.responseText);
                    CloseWindow();
                }
            });
			nui.open({
                url: "<%=request.getContextPath() %>/ame_budget/deptBudget/modifyBuyInOrOut.jsp",
                title: year+"年度买入月度成本", 
				width: 900,
	            height: 500,
                onload: function () {
                    var iframe = this.getIFrameEl();
                    var data = nui.decode({orgid:orgid,year:year,orgname:orgname,costtype:costtype,orgFlag:orgFlag,budstatus:budstatus,costtypename:costtypename});
                    iframe.contentWindow.SetData(data);
                },
                ondestroy: function (action) {
                	grid_AllInOut.reload();
                	grid_BuyInDetail.reload();
                	grid_SaleOutDetail.reload();
                	//父页面的汇总刷新
                    parent.reload();
                }
            });
		}
        function doCountSum(e){        	
            if (e.field == "money") {
                e.cellHtml = "<div align='right'><b>" + formatNumber(e.cellHtml,'#,##') + "</b></div>";
            }
        }
        function drawcell(e){
        	if(e.rowIndex==2){
        		if(e.field!="type"){
	        		e.cellCls="myNum";
        		}else{
	        		e.cellCls="myRow";
        		}
        	}
        }
        //导出卖出明细
        function exportSaleOutDetail(){
			var SaleOutDetails = grid_SaleOutDetail.getData();
			if(SaleOutDetails.length<1){
				alert("没有数据，不能导出！");
				return;
			}
			if(!confirm("导出卖出明细？")){
				return;
			}
			var json =  {SaleOutDetails:SaleOutDetails};
			nui.ajax({
    			url: "com.primeton.eos.ame_budget.buyInOut.exportSaleOutDetail.biz.ext",
		        type: "post",
		        data: json,
		        cache: false,
		        contentType: 'text/json',
		        success: function (o) {
		     		nui.unmask();
		     		var filePath = o.downloadFile;
		        	var fileName = "卖出明细.xls";
					var frm = document.getElementById("viewlist1");
		        	frm.elements["downloadFile"].value = filePath;
		        	frm.elements["fileName"].value = fileName;
				    frm.submit();
		        },
		        error: function () {
		        	alert("error");
		        }
			});
		}
		var flag1=true;
		function clickBuyInHeader(e){
			if(flag1){
				grid_BuyInDetail.sortBy(e.column.field, "desc");
				flag1=false;
			}else{
				grid_BuyInDetail.sortBy(e.column.field, "asc");
				flag1=true;
			}
		}
		var flag2=true;
		function clickSaleOutHeader(e){
			if(flag2){
				grid_SaleOutDetail.sortBy(e.column.field, "desc");
				flag2=false;
			}else{
				grid_SaleOutDetail.sortBy(e.column.field, "asc");
				flag2=true;
			}
		}
  </script>
</body>
</html>