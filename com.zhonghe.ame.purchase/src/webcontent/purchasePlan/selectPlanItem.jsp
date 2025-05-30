<%@page import="com.eos.data.datacontext.UserObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/common/common.jsp"%>
<html>
<head>
<title>采购计划 - 物项明细</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%=request.getContextPath()%>/common/nui/nui.js" type="text/javascript"></script>
<style type="text/css">
.nui-radiobuttonlist-item {
	float: left;
	margin-left: 200px;
	color: pink;
}

.mini-grid-cell-nowrap {
	white-space: nowrap;
}
</style>
</head>
<body>
	<div style="width: auto; height: 100%; padding: 5px; overflow: hidden;">
		<div class="nui-fit">
			<div id="datagrid1" sizeList="[15,30,50]" dataField="purPlanItem" pageSize="15" url="com.zhonghe.ame.purchase.purchaseItems.queryPurPlanItem.biz.ext" class="nui-datagrid"
				style="width: 100%; height: 475px;" allowAlternating="true" idField="id" onrowdblclick="onRowDblClick">
				<div property="columns">
					<div type="checkcolumn">○</div>
					<div field="code" align="center" headerAlign="center">计划编号</div>
					<div field=purchaseFirstName align="center" headerAlign="center">物项大类名称</div>
					<div field="purchaseTwoName" align="center" headerAlign="center">物项中类名称</div>
					<div field="materialName" align="center" headerAlign="center">采购物项名称</div>
					<div field="newUnit" width="40" align="center" headerAlign="center" renderer="unitValue">单位</div>
					<div field="newNumber" width="50" align="center" headerAlign="center">数量</div>
					<div field="budgetAmount" width="80" align="center" headerAlign="center">计划初始金额(万元)</div>
					<div field="newBudgetAmount" width="80" align="center" headerAlign="center" renderer="newBudgetAmountRender">上次变更后金额(万元)</div>
				</div>
			</div>
		</div>

		<div style="text-align: center; padding: 5px; border-top: 0px;" class="nui-toolbar">
			<a class="nui-button" onclick="onOk()" id="creatReimbProcess" style="width: 80px;" iconCls="icon-ok">确定</a>
			<a class="nui-button" onclick="onCancel()" id="saveReimbProcess" style="width: 80px; margin-left: 56px" iconCls="icon-close">关闭</a>
		</div>

	</div>

	<script type="text/javascript">
		nui.parse();
		var grid = nui.get("datagrid1");

		function SetData(data) {
			var jsonData = {
				"planId" : data.planId
			}
			grid.load(jsonData);
		}

		function onOk() {
			var row = grid.getSelected();
			CloseWindow("ok");
		}

		function onRowDblClick(e) {
			onOk();
		}

		function onCancel(e) {
			CloseWindow("cancel");
		}

		function GetData() {
			var row = grid.getSelected();
			row.id = null;
			row.model = "1";
			return row;
		}

		//标准方法接口定义
		function CloseWindow(action) {
			if (window.CloseOwnerWindow) {
				return window.CloseOwnerWindow(action);
			} else {
				window.close();
			}
		}

		function unitValue(e) {
			return nui.getDictText("ZH_UNIT", e.value);
		}
		
		function newBudgetAmountRender(e){
			if (e.row.budgetAmount == e.value) {
				return "/";
			} else {
				return e.value;
			}
		}
		
	</script>
</body>
</html>