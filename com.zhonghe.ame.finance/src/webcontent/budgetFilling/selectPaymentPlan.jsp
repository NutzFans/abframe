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
<title>付款计划</title>
</head>
<body>
	<div class="nui-fit" style="padding: 5px;">
		<div id="form1">
			<input id="years" name="criteria._expr[0].years" class="nui-hidden" />
			<input id="secOrg" name="criteria._expr[1].secondaryOrg" class="nui-hidden" />
			<div class="nui-toolbar" style="border-bottom: 0; padding: 5px;">
				<table>
					<tr>
						<td style="width: 60px; text-align: right;">合同名称:</td>
						<td style="width: 205px">
							<input name="criteria._expr[4]._value" class="nui-textbox" style="width: 200px" />
							<input class="nui-hidden" name="criteria._expr[4]._property" value="contractName" />
							<input class="nui-hidden" name="criteria._expr[4]._op" value="like" />
						</td>
						<td>
							<a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查询</a>
							<a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset()">重置</a>
						</td>
					</tr>
				</table>
			</div>
		</div>

		<div id="annualPayGrid" idField="id" dataField="payPlanInfos" class="nui-datagrid" style="height: 92%" url="com.zhonghe.ame.annualPlan.annualPlan.queryAnnualPayPlan.biz.ext" multiSelect="true"
			virtualScroll="true" virtualColumns="true" frozenStartColumn="0" frozenEndColumn="4" sizeList="[1000]" pageSize="1000">
			<div property="columns">
				<div type="checkcolumn"></div>
				<div type="indexcolumn"></div>
				<div field="years" width="60" align="center" headerAlign="center" allowSort="true">年份</div>
				<div field="secondaryOrgname" width="150" align="center" headerAlign="center" allowSort="true">合同承办部门</div>
				<div field="contractName" width="200" align="center" headerAlign="center" allowSort="true">合同名称</div>
				<div field="jan" width="120" align="center" headerAlign="center" allowSort="false" dataType="currency">1月计划</div>
				<div field="feb" width="120" align="center" headerAlign="center" allowSort="false" dataType="currency">2月计划</div>
				<div field="mar" width="120" align="center" headerAlign="center" allowSort="false" dataType="currency">3月计划</div>
				<div field="apr" width="120" align="center" headerAlign="center" allowSort="false" dataType="currency">4月计划</div>
				<div field="may" width="120" align="center" headerAlign="center" allowSort="false" dataType="currency">5月计划</div>
				<div field="jun" width="120" align="center" headerAlign="center" allowSort="false" dataType="currency">6月计划</div>
				<div field="jul" width="120" align="center" headerAlign="center" allowSort="false" dataType="currency">7月计划</div>
				<div field="aug" width="120" align="center" headerAlign="center" allowSort="false" dataType="currency">8月计划</div>
				<div field="sep" width="120" align="center" headerAlign="center" allowSort="false" dataType="currency">9月计划</div>
				<div field="oct" width="120" align="center" headerAlign="center" allowSort="false" dataType="currency">10月计划</div>
				<div field="nov" width="120" align="center" headerAlign="center" allowSort="false" dataType="currency">11月计划</div>
				<div field="dec" width="120" align="center" headerAlign="center" allowSort="false" dataType="currency">12月计划</div>
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
		var annualPayGrid = nui.get("annualPayGrid");
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
			annualPayGrid.sortBy("createTime", "desc");
			annualPayGrid.load(data);
		}

		function reset() {
			form.reset();
			init();
		}
		
		function onOk() {
			CloseWindow("ok");
		}

		function getDatas() {
			var rows = annualPayGrid.getSelecteds();
			if (rows.length > 0) {
				return rows.map(row=>{
					var totalTax = row.jan + row.feb + row.mar + row.apr + row.may + row.jun + row.jul + row.aug + row.sep + row.oct + row.nov + row.dec;
					var createName = userName;
					var createCode = userId;
					var createTime = new Date();
					var sourceId = row.id;
					return {
						...row, "totalTax": totalTax, "createCode": createCode, "createName": createName, "createTime": createTime, "id": null, "sourceId": sourceId, 
						"totalAmount": 0, "janAmount": 0, "febAmount": 0, "marAmount": 0, "aprAmount": 0, "mayAmount": 0, "junAmount": 0, "julAmount": 0, 
						"augAmount": 0, "sepAmount": 0, "octAmount": 0, "novAmount": 0, "decAmount": 0
					}
				})
			}
			return rows;
		}				
		
	</script>

</body>
</html>