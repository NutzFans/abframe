<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): mengyy
  - Date: 2019-09-04 19:31:10
  - Description:
-->
<head>
<title>费用借款列表</title>
</head>
<body>
	<div style="color: red;">提醒：请领导与离职本人沟通借款处理，并在审核意见中注明处理意见，如要求本人离职前还款，或者转移给他人，如离职前未完成借款处理，财务将无法完成交接。</div>
	<div id="expBeiList_grid" class="nui-datagrid" style="width:100%;"  url="com.primeton.eos.ame_fee.feeTypeTree.queryBeilist.biz.ext"  multiSelect="true"
   		 frozenStartColumn="0" frozenEndColumn="8" 
         dataField="expbeiList" pageSize="200" sizeList="[100,500]" showPager="true" showSummaryRow="true" ondrawsummarycell="onDrawSummaryCell">
		<div property="columns">
			<div field="processinstid" width="0"></div>
			<div field="expno" width="90px" align="center"  headerAlign="center" allowSort="true" renderer="getDetail">付款申请单号</div>
			<div field="exptype" width="90px" align="left" renderer="dictGetType" headerAlign="center" allowSort="true">付款类型</div>
			<div field="expusername" width="55px" align="center"  headerAlign="center" allowSort="true" >申请人</div>
			<div field="transfername" width="55px" align="center"  headerAlign="center" allowSort="true" >转移人</div>
			<div field="orgname" width="100px" align="center"  headerAlign="center" allowSort="true">受益部门</div>
			<div field="expstatus" width="80px" align="center" renderer="dictGetStatus" headerAlign="center" allowSort="true">付款状态</div>
			<div field="confamt" width="90px" align="right" dataType="currency" headerAlign="center" allowSort="true" summaryType="sum">借款金额</div>
			<div field="hxje" width="70px" align="right" dataType="currency" headerAlign="center" allowSort="true" summaryType="sum">已核销金额</div>
			<div field="hxjeing" width="70px" align="right" dataType="currency" headerAlign="center" allowSort="true" summaryType="sum">在途核销</div>
			<div field="nohxje" width="70px" align="right" dataType="currency" headerAlign="center" allowSort="true" summaryType="sum">未核销金额</div>
			<div field="hxstatus" width="70px" align="center" renderer="getHxStatus" headerAlign="center" allowSort="true">核销状态</div>
			<div field="tbdate" width="80px" align="center"  headerAlign="center" allowSort="true">申请日期</div>
			<div field="paydate" width="80px" align="center" headerAlign="center"  allowSort="true">付款日期</div>
		</div>
  	</div>
</body>
</html>