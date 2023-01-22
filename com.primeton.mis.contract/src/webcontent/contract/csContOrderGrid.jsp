<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): mengyy
  - Date: 2020-05-21 19:32:22
  - Description:
-->
<head>
<title>Title</title>
</head>
<body>
	<fieldset style="border:solid 1px #aaa;padding:3px;">
		<legend>合同订单信息</legend>
		<div id="csContOrder_grid" class="nui-datagrid" style="width:99%;height:auto;" frozenStartColumn="0" frozenEndColumn="3"dataField="csContOrders"
            showPager="false" url="com.primeton.mis.contract.contract.getCsContOrder.biz.ext"  
            showSummaryRow="true"  ondrawsummarycell="drawSum">			            
            <div property="columns">
                <div field="contorderno" width="100" headerAlign="center" align="center">订单编号</div>
                <div field="orderreg" width="100" headerAlign="center" renderer="onDealDate" dateFormate="yyyy-MM-dd" align="left">订单登记日期</div>
                <div field="orderdate" width="100" headerAlign="center" renderer="onDealDate" dateFormate="yyyy-MM-dd" align="left">订单签订日期</div>
                <div field="ordermon" dataType="currency" width="150" headerAlign="center" align="right" summaryType="sum">合同订单金额</div>
                <div field="orderprodmon" dataType="currency" width="120" headerAlign="center" align="right" summaryType="sum">订单产品金额</div>
                <div field="servjsmon" dataType="currency" width="120" headerAlign="center" align="right" summaryType="sum">技术服务金额</div>
                <div field="prodwbmon" dataType="currency" width="120" headerAlign="center" align="right" summaryType="sum">产品维保金额</div>
                <div field="orderservmon" dataType="currency" width="120" headerAlign="center" align="right" summaryType="sum">订单服务金额</div>
                <!-- 分包金额 -->
                <div field="servsubmon" dataType="currency" width="120" headerAlign="center" align="right" summaryType="sum">订单采购1</div>
                <!-- 分成金额 -->
                <div name="othmon" field="othmon" dataType="currency" width="120" headerAlign="center" align="right" summaryType="sum">订单采购2</div>
                <div field="memo" name="memo" width="auto" headerAlign="center" align="left">备注说明</div>
            </div>
        </div>
	</fieldset>
	<fieldset style="border:solid 1px #aaa;padding:3px;">
		<legend>合同业务分类信息</legend>
		 <div id="csContType_grid" class="nui-datagrid" style="width:80%;height:auto;" dataField="contTypes" 
        	showPager="false" url="com.primeton.mis.contract.contract.getContType.biz.ext" 
        	 showSummaryRow="true" ondrawsummarycell="drawSum">			            
            <div property="columns">
                <div field="contnum" width="100" headerAlign="center" align="left">合同编号</div>
                <div field="contorderno" width="100" headerAlign="center" align="left">合同订单编号</div>
                <div field="type" width="100" renderer="getCsContracttype" headerAlign="center" align="left">合同业务分类</div>
                <div field="summon" dataType="currency" width="80" headerAlign="center" align="right" summaryType="sum">业务分类金额</div>
                <div field="taxrate" dataType="currency" width="80" headerAlign="center" align="right">税率</div>
                <div field="summon2" dataType="currency" width="80" headerAlign="center" align="right" summaryType="sum">不含税金额</div>
            </div>
        </div>
	</fieldset>
	
</body>
</html>