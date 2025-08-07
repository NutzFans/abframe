<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<style type="text/css">
html,body {
	margin: 0;
	padding: 0;
	border: 0;
	width: 100%;
	height: 100%;
	overflow: hidden;
}

.mini-grid-cell-nowrap {
	white-space: nowrap;
}
</style>
<head>
<title>采购计划物项明细</title>
</head>
<body>
	<div class="nui-fit" style="padding: 5px;">
		<div id="form1">
			<input id="years" name="criteria._expr[0].year" class="nui-hidden" />
			<input id="secOrg" name="criteria._expr[1].needOrgId" class="nui-hidden" />
			<div class="nui-toolbar" style="border-bottom: 0; padding: 5px;">
				<table>
					<tr>
						<td style="width: 60px; text-align: right;">计划名称:</td>
						<td style="width: 205px">
							<input name="criteria._expr[4]._value" class="nui-textbox" style="width: 200px" />
							<input class="nui-hidden" name="criteria._expr[4]._property" value="name" />
							<input class="nui-hidden" name="criteria._expr[4]._op" value="like" />
						</td>
						<td style="width: 60px; text-align: right;">物项名称:</td>
						<td style="width: 205px">
							<input name="criteria._expr[5]._value" class="nui-textbox" style="width: 200px" />
							<input class="nui-hidden" name="criteria._expr[5]._property" value="materialName" />
							<input class="nui-hidden" name="criteria._expr[5]._op" value="like" />
						</td>
						<td>
							<a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查询</a>
							<a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset()">重置</a>
						</td>
					</tr>
				</table>
			</div>
		</div>

		<div id="purPlanItemGrid" idField="id" dataField="data" class="nui-datagrid" style="height: 92%" url="com.zhonghe.ame.purchase.purchaseItems.queryPurPlanItemList.biz.ext" multiSelect="true"
			virtualScroll="true" virtualColumns="true" sizeList="[1000]" pageSize="1000">
			<div property="columns">
				<div type="checkcolumn"></div>
				<div type="indexcolumn"></div>
				<div field="year" width="60" align="center" headerAlign="center" allowSort="true">年份</div>
				<div field="name" width="250" align="center" headerAlign="center" allowSort="true">采购计划名称</div>
				<div field="materialName" width="250" align="center" headerAlign="center">采购物项名称</div>
				<div field="budgetAmount" width="100" align="center" headerAlign="center">计划金额（万元）</div>
				<div field="newBudgetAmount" width="140" align="center" headerAlign="center" renderer="changeBudgetRenderer">变更后计划金额（万元）</div>
				<div field="sumamount" width="130" align="center" headerAlign="center">已立项金额(万元)</div>
				<div field="sumamountRate" width="100" align="center" headerAlign="center" renderer="sumamountRateRenderer">计划执行情况(%)</div>
			</div>
		</div>

	</div>

	<div style="text-align: center; padding: 5px; margin-bottom: 1px" class="nui-toolbar">
		<a class="nui-button" onclick="onOk()" style="width: 60px; margin-right: 20px;" iconCls="icon-ok">确定</a>
		<a class="nui-button" onclick="closeCancel()" style="width: 60px;" iconCls="icon-close">关闭</a>
	</div>

	<script type="text/javascript">
		nui.parse();
		var form = new nui.Form("#form1");
		var purPlanItemGrid = nui.get("purPlanItemGrid");
		var baseInfo;

		function initData(data) {
			baseInfo = data;
			init();
		}

		function init() {
			nui.get("years").setValue(baseInfo.years);
			nui.get("secOrg").setValue(baseInfo.secOrg);
			search();
		}

		function search() {
			var data = form.getData();
			purPlanItemGrid.sortBy("updatedTime", "desc");
			purPlanItemGrid.load(data);
		}

		function reset() {
			form.reset();
			init();
		}

		function onOk() {
			CloseWindow("ok");
		}
		
		function getDatas() {
			var rows = purPlanItemGrid.getSelecteds();
			if (rows.length > 0) {
				return rows.map(row=>{
					var totalTax =  mulFloat(row.newBudgetAmount, 10000);
					var createName = userName;
					var createCode = userId;
					var createTime = new Date();
					var sourceId = row.id;
					return {
						...row, "totalTax": totalTax, "planName": row.name, "createCode": createCode, "createName": createName, "createTime": createTime, "id": null, "sourceId": sourceId, 
						"totalAmount": 0, "jan": 0, "feb": 0, "mar": 0, "apr": 0, "may": 0, "jun": 0, "jul": 0, "aug": 0, "sep": 0, "oct": 0, "nov": 0, "dec": 0
					}
				})
			}
			return rows;
		}		

		function changeBudgetRenderer(e) {
			if (e.row.budgetAmount == e.value) {
				return "/";
			} else {
				return e.value;
			}
		}

		function sumamountRateRenderer(e) {
			if (e.row.extend2 == "2") {
				return "/";
			} else {
				return e.value;
			}
		}
	</script>

</body>
</html>