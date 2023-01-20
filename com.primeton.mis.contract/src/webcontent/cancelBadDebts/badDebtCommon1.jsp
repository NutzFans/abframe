<%@page pageEncoding="UTF-8"%>
<%@include file="/common/common.jsp"%>
<%@include file="/common/skins/skin0/component.jsp" %>
<html>
<!-- 
  - Author(s): 李鹏程
  - Date: 2019-12-06 14:30:17
  - Description:
-->
<head>
<title>Title</title>
</head>
<body>
					<fieldset style="border: solid 1px #aaa; padding: 3px;">
					<legend>合同收入记录列表</legend>
					<div id="grid_income" class="nui-datagrid"
						style="width: 100%; height: auto;" allowResize="false"
						dataField="csReveForecasts"
						url="com.primeton.eos.ame_income.cancelBadDebts.getCsReveForecast1.biz.ext"
						allowCellSelect="true" showPager="false" idField="appid"
						onselectionchanged="selectionChanged" multiSelect="false">
						<div property="columns">
							<div field="contnum" width="0">合同编号</div>
							<div field="reveno" width="60" headerAlign="center"
								align="center" headerAlign="center">收入确认次数</div>
							<div field="reveproof" width="80" headerAlign="center"
								align="center" headerAlign="center" renderer="dictproof">预计收入确认证据</div>
							<div field="revetimedesc" width="80" headerAlign="center"
								align="left" headerAlign="center">收入确认时点描述</div>
							<div field="newyearmonth" width="70" headerAlign="center"
								align="center" headerAlign="center">预计确认年月</div>
							<div field="fcsum" width="70" align="right" headerAlign="center"
								dataType="currency">预计确认金额</div>
							<div field="status" width="70" align="center"
								headerAlign="center" renderer="dictstatus1">目前确认状态</div>
							<div field="actsum" width="70" align="right" headerAlign="center"
								dataType="currency">实际确认金额</div>
							<div field="fcreverate" width="50" align="center"
								headerAlign="center" numberFormat="p1">本次确认比例</div>
							<div field="confirmday" width="70" align="center"
								headerAlign="center">确认日期</div>
							<div field="contorderno" width="70" align="center"
								headerAlign="center">订单编号</div>
							<div field="memo" width="70" align="center" headerAlign="center">说明</div>
							<div field="processinstid" width="0">流程实例ID</div>
							<div field="productsum" width="0">预计产品</div>
							<div field="servicesum" width="0">预计服务</div>
							<div field="masum" width="0">预计MA</div>
							<div field="actproductsum" width="0">实际产品</div>
							<div field="actservicesum" width="0">实际服务</div>
							<div field="actmasum" width="0">实际MA</div>
							<div field="contorderno" width="0">订单id</div>
						</div>
					</div>
				</fieldset>
				<fieldset style="border: solid 1px #aaa; padding: 3px;">
					<legend>合同收款记录列表</legend>
					<span style="color:red"><b>提示:以下显示黄色部分为要申请坏账核销或者合同减值的收款列</b></span>
					<div id="csGatherFcGrid1" class="nui-datagrid"
						style="width: 100%; height: auto;" allowResize="true"
						dataField="csGatherFcs" showSummaryRow="false" showPager="false"
						url="com.primeton.eos.ame_income.cancelBadDebts.getCsGatherFc.biz.ext"
						multiSelect="true" onselectionchanged="showTicket1"  ondrawcell="drawGather"
						allowUnselect="true">
						<div property="columns">
							<div field="gatherno" width="60" align="center"
								headerAlign="center">收款次数</div>
							<div field="status" width="60" align="center"
								headerAlign="center" renderer="dictstatus">收款状态</div>
							<div field="billstatus" width="60" align="center"
								headerAlign="center" renderer="dictstatusbill">开票状态</div>
							<div field="gathertype" width="70" align="center"
								headerAlign="center" renderer="dictGatherFcType">收款类型</div>
							<div field="newyearmonth" width="80" align="center"
								headerAlign="center">预计收款年月</div>
							<div field="fcsum" width="130" align="right" headerAlign="center"
								dataType="currency" summaryType="sum" currencyUnit="￥">预计收款金额（含税）</div>
							<div field="productsum" width="150" align="right"
								headerAlign="center" dataType="currency" summaryType="sum"
								currencyUnit="￥">预计收款产品金额（含税）</div>
							<div field="servicesum" width="150" align="right"
								headerAlign="center" dataType="currency" summaryType="sum"
								currencyUnit="￥">预计收款服务金额（含税）</div>
							<div field="fcreverate" width="80" align="center"
								headerAlign="center" numberFormat="p1">预计确认比例</div>
							<div field="actsum" width="130" align="right"
								headerAlign="center" dataType="currency" summaryType="sum"
								currencyUnit="￥">已收款金额</div>
						</div>
					</div>
				</fieldset>
				
			

</body>
</html>