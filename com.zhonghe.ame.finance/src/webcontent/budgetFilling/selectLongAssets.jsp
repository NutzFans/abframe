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
<title>长期资产管理</title>
</head>
<body>
	<div class="nui-fit" style="padding: 5px;">
		<div id="form1">
			<input id="years" name="criteria._expr[0].zjYear" class="nui-hidden" />
			<input id="secOrg" name="criteria._expr[1].secondaryOrg" class="nui-hidden" />
			<input name="criteria._expr[2]._property" value="clazz" class="nui-hidden" />
			<input name="criteria._expr[2]._op" value="in" class="nui-hidden" />
			<input id="clazz" name="criteria._expr[2]._value" class="nui-hidden" />
			<div class="nui-toolbar" style="border-bottom: 0; padding: 5px;">
				<table>
					<tr>
						<td style="width: 60px; text-align: right;">资产名称:</td>
						<td style="width: 205px">
							<input name="criteria._expr[4]._value" class="nui-textbox" style="width: 200px" />
							<input class="nui-hidden" name="criteria._expr[4]._property" value="name" />
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

		<div id="longAssetsGrid" idField="id" dataField="datas" class="nui-datagrid" style="height: 92%" url="com.zhonghe.ame.finance.budgetFilling.queryLongAssetsItem.biz.ext" multiSelect="true"
			virtualScroll="true" virtualColumns="true" frozenStartColumn="0" frozenEndColumn="5" sizeList="[1000]" pageSize="1000">
			<div property="columns">
				<div type="checkcolumn"></div>
				<div type="indexcolumn"></div>
				<div field="zjYear" width="60" align="center" headerAlign="center" allowSort="true">年份</div>
				<div field="department" width="150" align="center" headerAlign="center" allowSort="true">资产所属部门</div>
				<div field="name" width="200" align="center" headerAlign="center" allowSort="true">资产名称</div>
				<div field="clazz" width="80" align="center" headerAlign="center" allowSort="true" renderer="ZH_GROUP">资产分类</div>
				<div field="total" width="120" align="center" headerAlign="center" allowSort="false" dataType="currency">合计</div>
				<div field="jan" width="120" align="center" headerAlign="center" allowSort="false" dataType="currency">1月</div>
				<div field="feb" width="120" align="center" headerAlign="center" allowSort="false" dataType="currency">2月</div>
				<div field="mar" width="120" align="center" headerAlign="center" allowSort="false" dataType="currency">3月</div>
				<div field="apr" width="120" align="center" headerAlign="center" allowSort="false" dataType="currency">4月</div>
				<div field="may" width="120" align="center" headerAlign="center" allowSort="false" dataType="currency">5月</div>
				<div field="jun" width="120" align="center" headerAlign="center" allowSort="false" dataType="currency">6月</div>
				<div field="jul" width="120" align="center" headerAlign="center" allowSort="false" dataType="currency">7月</div>
				<div field="aug" width="120" align="center" headerAlign="center" allowSort="false" dataType="currency">8月</div>
				<div field="sep" width="120" align="center" headerAlign="center" allowSort="false" dataType="currency">9月</div>
				<div field="oct" width="120" align="center" headerAlign="center" allowSort="false" dataType="currency">10月</div>
				<div field="nov" width="120" align="center" headerAlign="center" allowSort="false" dataType="currency">11月</div>
				<div field="dec" width="120" align="center" headerAlign="center" allowSort="false" dataType="currency">12月</div>
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
		var longAssetsGrid = nui.get("longAssetsGrid");
		var baseInfo;

		function initData(data) {
			baseInfo = data;
			init();
		}

		function init() {
			nui.get("years").setValue(baseInfo.years);
			nui.get("secOrg").setValue(baseInfo.secOrg);
			// nui.get("clazz").setValue(baseInfo.clazz);
			search();
		}

		function search() {
			var data = form.getData();
			longAssetsGrid.sortBy("procTime", "desc");
			longAssetsGrid.load(data);
		}

		function reset() {
			form.reset();
			init();
		}

		function onOk() {
			CloseWindow("ok");
		}

		function getDatas() {
			var rows = longAssetsGrid.getSelecteds();
			if (rows.length > 0) {
				return rows.map(row=>{
					var createName = userName;
					var createTime = new Date();
					var sourceId = row.id;
					return {
						...row, "createName": createName, "createTime": createTime, "id": null, "sourceId": sourceId, "assetsName": row.name
					}
				})
			}
			return rows;
		}
	</script>

</body>
</html>