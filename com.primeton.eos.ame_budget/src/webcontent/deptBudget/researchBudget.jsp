<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): wanglinqiong
  - Date: 2016-05-13 15:11:04
  - Description:
-->
<head>
<title>研发成本tab页面</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<%@include file="/common/common.jsp"%>
<h:script src='<%="/common/scripts/eos-web.js"%>' />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body>
<div style="width: 1450px;height: 100%;overflow:scroll; margin: 0px;">
	<div class="nui-toolbar" style="border-bottom:0;padding:0px;width:1080px;">
        <table style="width:100%;">
        	<tr>
                <td align="center">
                    	研发成本汇总
                </td>
            </tr>
         </table>           
    </div>
	<div id="grid_research" class="nui-datagrid" style="width:1082px;height:auto;" dataField="sumCost" url="com.primeton.eos.ame_budget.deptbudget.queryCost.biz.ext" 
    sizeList="[10,20,50,100]" idField="appid" showPager="false" showSummaryRow="true" ondrawsummarycell="doCountSum">
		<div property="columns">
			<div field="type" width="140" align="center"  headerAlign="center" >类别</div>
			<div field="quar1" width="150" align="right" headerAlign="center" numberFormat="n0" summaryType="sum">Q1</div>
			<div field="quar2" width="150" align="right"  headerAlign="center" numberFormat="n0" summaryType="sum">Q2</div>
			<div field="quar3" width="150" align="right" headerAlign="center" numberFormat="n0" summaryType="sum">Q3</div>				
			<div field="quar4" width="150" align="right"  headerAlign="center" numberFormat="n0" summaryType="sum">Q4</div>
			<div field="totalfee" width="170" align="right"  headerAlign="center" numberFormat="n0" summaryType="sum">汇总</div>
		</div>
	</div>
	<br/>
	<div id="tab_sale" class="nui-tabs" activeIndex="0" style="width:1150px;height:1090px" onActivechanged="changeSaleTab()">
		
	</div>
</div>
	<script type="text/javascript">
		nui.parse();
		var grid = nui.get("grid_research");
    	//研发成本costtype设置为4
    	var costtype = "4";
    	var costtypename = "研发成本";
    	var year = '<%=request.getParameter("year") %>';
    	var orgid = '<%=request.getParameter("orgid") %>';
    	var orgname = '<%=request.getParameter("orgname") %>';
    	//判断orgid是事业部还是业单元，或者是事业部但是没有业务单元
		var orgFlag = '<%=request.getParameter("orgFlag") %>';
		//锁定解锁
		var budstatus = '<%=request.getParameter("budstatus") %>';
		var tab_sale  = nui.get("tab_sale");
		init();
    	//判断orgid是事业部还是业单元，或者是事业部但是没有业务单元
    	function init(){
	    	/* 王林琼测试tab页面懒加载方式（优化页面打开速度） */
			//人力投入页面
			grid.load({year:year,costtype:costtype,orgid:orgid});
			var tab_personInput = {name: "tab_personInput", id: "tab_personInput", title: "人力投入"};
			tab_sale.addTab(tab_personInput,1);
			tab_sale.setActiveIndex(0);
			//运营费用页面
			var tab_saleOperatCost = {name: "tab_saleOperatCost", id: "tab_saleOperatCost", title: "运营费用"};
			tab_sale.addTab(tab_saleOperatCost,1);
			//买入卖出页面
			var tab_saleInOut = {name: "tab_saleInOut", id: "tab_saleInOut", title: "买入卖出"};
			tab_sale.addTab(tab_saleInOut,2);
			//采购页面
			var tab_salePurchase = {name: "tab_salePurchase", id: "tab_salePurchase", title: "采购"};
			tab_sale.addTab(tab_salePurchase,3);
			/* 王林琼测试 */
		}
		
		function changeSaleTab(e){
			if(tab_sale.getActiveTab()._id==1){//人力投入
				tab_sale.loadTab("<%=request.getContextPath() %>/ame_budget/deptBudget/personInput.jsp?year="+year+"&orgid="+orgid+"&orgname="+orgname+"&costtype="+costtype+"&orgFlag="+ orgFlag+"&budstatus="+ budstatus+"&costtypename="+ costtypename);
			}
			if(tab_sale.getActiveTab()._id==2){//运营费用
				tab_sale.loadTab("<%=request.getContextPath() %>/ame_budget/deptBudget/operatCost.jsp?year="+year+"&orgid="+orgid+"&orgname="+orgname+"&costtype="+costtype+"&orgFlag="+ orgFlag+"&budstatus="+ budstatus+"&costtypename="+ costtypename);
			}
			if(tab_sale.getActiveTab()._id==3){//买入卖出
				tab_sale.loadTab("<%=request.getContextPath() %>/ame_budget/deptBudget/inOut.jsp?year="+year+"&orgid="+orgid+"&orgname="+orgname+"&costtype="+costtype+"&orgFlag="+ orgFlag+"&budstatus="+ budstatus+"&costtypename="+ costtypename);
			}
			if(tab_sale.getActiveTab()._id==4){//采购
				tab_sale.loadTab("<%=request.getContextPath() %>/ame_budget/deptBudget/purchase.jsp?year="+year+"&orgid="+orgid+"&orgname="+orgname+"&costtype="+costtype+"&orgFlag="+ orgFlag+"&budstatus="+ budstatus+"&costtypename="+ costtypename);
			}
		} 
		//tab页面点击按钮操作后触发效果刷新汇总数据
		function reload(){
			grid.load({year:year,costtype:costtype,orgid:orgid});
		}
		function doCountSum(e){  
           	if (e.field=="quar1") {
                e.cellHtml = "<div align='right'><b>" + formatNumber(e.cellHtml,'#,##') + "</b></div>";
            }
           	if (e.field=="quar2") {
                e.cellHtml = "<div align='right'><b>" + formatNumber(e.cellHtml,'#,##') + "</b></div>";
            }
           	if (e.field=="quar3") {
                e.cellHtml = "<div align='right'><b>" + formatNumber(e.cellHtml,'#,##') + "</b></div>";
            }
           	if (e.field=="quar4") {
                e.cellHtml = "<div align='right'><b>" + formatNumber(e.cellHtml,'#,##') + "</b></div>";
            }
           	if (e.field=="totalfee") {
                e.cellHtml = "<div align='right'><b>" + formatNumber(e.cellHtml,'#,##') + "</b></div>";
            }
        }
  </script>
</body>
</html>