<%@page import="com.eos.data.datacontext.UserObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/common/common.jsp"%>
<html>
<head>
<title>采购立项 - 采购计划选择</title>
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
		<div id="form1">
			<input class="nui-hidden" name="criteria._entity" value="com.zhonghe.ame.purchase.purchase.SelectPurchasePlan" />
			<input class="nui-hidden" name="criteria._expr[0].status" value="2" />
			<input id="secType" class="nui-hidden" name="criteria._expr[1].type" />
			<input class="nui-hidden" name="criteria._expr[2]._property" value="needOrgId" />
			<input class="nui-hidden" name="criteria._expr[2]._op" value="in" />
			<input id="orgids" class="nui-hidden" name="criteria._expr[2]._value" />
			<div class="nui-toolbar" style="border-bottom: 0; padding: 5px;">
				<table>
					<tr>
						<td style="width: 130px; text-align: right;">采购计划名称：</td>
						<td style="width: 320px">
							<input id="secName" class="nui-textbox" name="criteria._expr[3].name" style="width: 315px;" />
							<input class="nui-hidden" name="criteria._expr[3]._op" value="like" />
						</td>
						<td style="width: 130px; text-align: right;">采购计划编号：</td>
						<td style="width: 320px">
							<input id="secCode" class="nui-textbox" name="criteria._expr[4].code" style="width: 315px;" />
						</td>
						<td>
							<a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查询</a>
							<a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset()">重置</a>
						</td>
					</tr>
				</table>
			</div>
		</div>

		<div class="nui-fit">
			<div id="datagrid1" sizeList="[15,30,50]" dataField="data" multiSelect="true" pageSize="15" class="nui-datagrid" style="width: 100%; height: 475px;"
				url="com.zhonghe.ame.purchase.purchaseplan.selsetPlanItems.biz.ext">
				<div property="columns">
					<div type="checkcolumn">○</div>
					<div field="putunderName" align="center" headerAlign="center">归口部门</div>
					<div field="name" width="160" align="left" headerAlign="center">采购计划名称</div>
					<div field="code" width="100" align="left" headerAlign="center">采购计划编号</div>
					<div field="materialName" width="100" align="center" headerAlign="center">采购物项名称</div>
					<div field="needOrgName" width="100" align="center" headerAlign="center">采购单位</div>
					<div field="type" width="60" align="center" headerAlign="center" renderer="dictIshavebak">采购类型</div>
					<div field="year" width="50" align="center" headerAlign="center">计划年份</div>
					<div field="newBudgetAmount" width="70" align="center" headerAlign="center">预算金额(万元)</div>
					<div field="sumamount" width="80" align="center" headerAlign="center">可立项金额(万元)</div>
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
		var form = new nui.Form("#form1");
		var grid = nui.get("datagrid1");

		function initData(data) {
			nui.get("secType").setValue(data.type);
			var data = {
				"orgId" : data.orgId
			};
			var json = nui.encode(data);
			nui.ajax({
				url : "com.zhonghe.ame.purchase.common.getOrgStrsByOrgId.biz.ext",
				type : "post",
				data : json,
				contentType : 'text/json',
				success : function(result) {
					var orgids = result.data;
					nui.get("orgids").setValue(orgids);
					search();
				}
			});
		}

		function search() {
			var data = form.getData();
			grid.sortBy("year", "desc");
			grid.load(data);
		}

		function reset() {
			nui.get("secName").setValue(null);
			nui.get("secCode").setValue(null);
			search();
		}

		function dictIshavebak(e) {
			return nui.getDictText('ZH_PURCHASE', e.value);
		}

		function GetData() {
			var row = grid.getSelecteds();
			return row;
		}

		function onOk() {
			var row = grid.getSelecteds();
			for (var i = 0; i < row.length; i++) {
				if (row[i].sumamount <= 0) {
					showTips("存在可立项金额为0的计划，请重新选择", "danger");
					return;
				}
			}
			CloseWindow("ok");
		}

		function onCancel(e) {
			CloseWindow("cancel");
		}

		function CloseWindow(action) {
			if (window.CloseOwnerWindow) {
				return window.CloseOwnerWindow(action);
			} else {
				window.close();
			}
		}
	</script>

</body>
</html>