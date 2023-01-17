<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): mengyy
  - Date: 2019-09-04 19:31:10
  - Description:
-->
<head>
<title>费用报销列表</title>
</head>
<body>
	<div id="expRei_grid" frozenStartColumn="0" frozenEndColumn="4" showPager="false" dataField="expReiLists" 
    	showSummaryRow="true"   ondrawsummarycell="onDrawSummaryCell"
    	class="nui-datagrid" style="width:100%;" url="com.primeton.eos.ame_permanage.ame_leave_apply.queryExpReiList.biz.ext" 
    	multiSelect="true" allowSortColumn=true>
        <div property="columns">
        	<div field="reiid" width="80" align="center" headerAlign="center" allowSort="true" renderer="getExpRei">报销记录编号</div>
            <div field="exptype" width="100" align="center" headerAlign="center" allowSort="true" renderer="dictGetType">报销类型</div>
            <div field="expstatus" width="80" align="center" headerAlign="center" allowSort="true" renderer="dictGetStatus">报销状态</div>
            <div field="expusername" width="60" align="center" headerAlign="center" allowSort="true" >报销人</div>
            <div field="total" width="80" align="right" headerAlign="center" allowSort="true" dataType="currency" summaryType="sum" >填报金额</div>
            <div field="confamt" width="80" align="right" headerAlign="center" allowSort="true" dataType="currency" summaryType="sum" >确认金额</div>
            <div field="hxamt" width="80" align="right" headerAlign="center" allowSort="true" dataType="currency" summaryType="sum" >核销借款</div>
            <div field="payamt" width="80" align="right" headerAlign="center" allowSort="true" dataType="currency" summaryType="sum" >打款金额</div>
            <div field="tbdate" width="120" align="center" headerAlign="center" allowSort="true" renderer = "ondealdate">填报日期</div>
            <div field="checkdate" width="80" align="center" headerAlign="center" allowSort="true" dateFormat="yyyy-MM-dd">财务审核日期</div>
            <div field="paydate" width="80" align="center" headerAlign="center" allowSort="true"  dateFormat="yyyy-MM-dd">打款日期</div>
        </div>
    </div>
</body>
</html>