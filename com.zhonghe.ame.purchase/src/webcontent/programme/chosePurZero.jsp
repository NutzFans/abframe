<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<head>
<title>零星采购</title>
<style type="text/css">
body {
	margin: 0;
	padding: 0;
	border: 0;
	width: 100%;
	height: 100%;
	overflow: hidden;
}
</style>
</head>
<body>
	<div id="form1">
		<input name="criteria._expr[12].status" class="nui-hidden" value="2" />
		<div class="nui-toolbar" style="border-bottom: 0; padding: 0px;">
			<table align="center" border="0" width="100%" class="form_table">
				<tr>
					<td class="form_label" align="right">经办人:</td>
					<td colspan="1">
						<input name="criteria._expr[3].createdName" class="nui-textbox" style="width: 100%;" />
						<input class="nui-hidden" name="critria._expr[3]._op" value="like" />
					</td>
					<td class="form_label" align="right">零星采购编号</td>
					<td>
						<input name="criteria._expr[2]._value" class="nui-textbox" style="width: 100%;" />
						<input class="nui-hidden" name="criteria._expr[2]._property" value="purchaseCode" />
						<input class="nui-hidden" name="criteria._expr[2]._op" value="like" />
					</td>
					<td class="form_label" align="right">零星采购名称</td>
					<td>
						<input name="criteria._expr[1]._value" class="nui-textbox" style="width: 100%;" />
						<input class="nui-hidden" name="criteria._expr[1]._property" value="purchaseName" />
						<input class="nui-hidden" name="criteria._expr[1]._op" value="like" />
					</td>
					<td colspan="2" align="right">
						<a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查询</a>
						<a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset()">重置</a>
					</td>
				</tr>
			</table>
		</div>
	</div>
	<div class="nui-fit">
		<div id="datagrid1" frozenStartColumn="0" sizeList="[20,50,100]" showPager="true" dataField="purZeroList" class="nui-datagrid" style="width: 100%; height: 80%;" pageSize="20"
			url="com.zhonghe.ame.purchase.purchaseItems.queryPurZeroList.biz.ext" multiSelect="false">
			<div property="columns">
				<div name="temp123" type="checkcolumn"></div>
				<div type="indexcolumn" align="center" headerAlign="center">序号</div>
				<div field="createdTime" headerAlign="center" allowSort="true" align="center">申请日期</div>
				<div field="createdName" width="60" align="center" headerAlign="center" allowSort="true">经办人</div>
				<div field="purchaseCode" width="180" align="left" headerAlign="center" allowSort="true">零星采购编号</div>
				<div field="purchaseName" width="250" align="left" headerAlign="center" allowSort="true">零星采购名称</div>
				<div field="totalAmount" width="120" headerAlign="center" allowSort="true" dataType="currency" align="center">采购金额（万元）</div>
				<div field="orgname" width="190" align="left" headerAlign="center" allowSort="true">采购单位</div>
				<div field="status" width="80" align="center" headerAlign="center" allowSort="true" renderer="ZH_FLOW_TYPE">状态</div>
			</div>
		</div>
		<div style="text-align: center; padding: 10px;" class="nui-toolbar">
			<a class="nui-button" onclick="onOk()" id="creatReimbProcess" style="width: 80px; margin-right: 20px;">确定</a>
			<a class="nui-button" onclick="onCancel" id="saveReimbProcess" style="width: 80px; margin-right: 140px;">关闭</a>
		</div>
	</div>

	<script type="text/javascript">
		nui.parse();
		var form = new nui.Form("#form1");
		var grid = nui.get("datagrid1");
		
		search();

		function search() {
			var form = new nui.Form("#form1");
			var data = form.getData(); //获取表单JS对象数据
			grid.sortBy('createdTime', 'desc');
			grid.load(data); //datagrid加载数据
		}

		function reset() {
			var form = new nui.Form("#form1");
			form.reset();
			search();
		}

		function onCancel(e) {
			CloseWindow("cancel");
		}
		
		//标准方法接口定义
		function CloseWindow(action) {
			if (window.CloseOwnerWindow)
				return window.CloseOwnerWindow(action);
			else
				window.close();
		}
		
		function onOk() {
			var row = grid.getSelected();
			CloseWindow("ok");
		}

		function GetData() {
			var row = grid.getSelected();
			return row;
		}
		
		function ZH_FLOW_TYPE(e) {
			return nui.getDictText("ZH_FLOW_TYPE", e.value);
		}

	</script>
</body>
</html>