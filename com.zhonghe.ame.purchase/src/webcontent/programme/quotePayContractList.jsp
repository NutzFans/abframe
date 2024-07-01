<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<head>
<title></title>
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
	<div class="nui-panel" title="付费合同管理" showHeader="false" style="width: 100%;">
		<div id="form1">
			<input class="nui-hidden" name="critria._entity" value="com.zhonghe.ame.payContract.payContract.ZhPayContractEntity" />
			<input name="critria._expr[12].appStatus" class="nui-hidden" value="2" />
			<div class="nui-toolbar" style="border-bottom: 0; padding: 0px;">
				<table align="center" border="0" width="100%" class="form_table">
					<tr>
						<td class="form_label" align="right">经办人:</td>
						<td colspan="1">
							<input name="critria._expr[1].createUsername" class="nui-textbox" style="width: 100%;" />
							<input class="nui-hidden" name="critria._expr[1]._op" value="like" />
						</td>
						<td class="form_label" align="right">合同编号:</td>
						<td colspan="1">
							<input name="critria._expr[10]._value" class="nui-textbox" style="width: 100%" />
							<input class="nui-hidden" name="critria._expr[10]._property" value="contractNo" />
							<input class="nui-hidden" name="critria._expr[10]._op" value="like" />
						</td>
						<td class="form_label" align="right">合同名称:</td>
						<td colspan="1">
							<input name="critria._expr[6]._value" class="nui-textbox" style="width: 100%" />
							<input class="nui-hidden" name="critria._expr[6]._property" value="contractName" />
							<input class="nui-hidden" name="critria._expr[6]._op" value="like" />
						</td>
						<td colspan="2" align="right">
							<a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查询</a>
							<a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset()">重置</a>
						</td>
					</tr>
				</table>
			</div>
		</div>
		<div>
			<div id="datagrid1" sizeList="[20,50]" pageSize="20" showPager="true" dataField="data" align="center" class="nui-datagrid" style="width: 100%; height: 500px;"
				url="com.zhonghe.ame.payContract.payContract.payContractAll.biz.ext" allowSortColumn=true>
				<div property="columns">
					<div name="temp123" type="checkcolumn"></div>
					<div type="indexcolumn" align="center" headerAlign="center">序号</div>
					<div field="createTime" headerAlign="center" allowSort="true" align="center">申请日期</div>
					<div field="createUsername" width="60" headerAlign="center" allowSort="true" align="center">经办人</div>
					<div field="contractNo" width="180" headerAlign="center" allowSort="true" align="center">合同编号</div>
					<div field="contractName" width="250" headerAlign="center" allowSort="true" align="center">合同名称</div>
					<div field="contractSum" width="120" headerAlign="center" allowSort="true" dataType="currency" align="center">合同金额（元）</div>
					<div field="implementOrgname" width="190" headerAlign="center" allowSort="true" align="center">合同承办部门</div>
					<div field="contractType" width="120" headerAlign="center" allowSort="true" renderer="ZH_CONTRACT_TYPE" align="center">合同类型</div>
					<div field="appStatus" headerAlign="center" allowSort="true" renderer="ZH_FLOW_TYPE" align="center">审批状态</div>
				</div>
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

		init();

		function init() {
			var data = form.getData(); //获取表单JS对象数据
			grid.sortBy("createTime", "desc");
			grid.load(data); //datagrid加载数据
		}

		function search() {
			var form = new nui.Form("#form1");
			var data = form.getData(); //获取表单JS对象数据
			grid.sortBy("createTime", "desc");
			grid.load(data); //datagrid加载数据
		}

		function reset() {
			var form = new nui.Form("#form1");
			form.reset();
			grid.load();
			search()
		}

		function onOk() {
			var row = grid.getSelected();
			CloseWindow("ok");
		}

		function CloseWindow(action) {
			if (window.CloseOwnerWindow)
				return window.CloseOwnerWindow(action);
			else
				window.close();
		}

		function GetData() {
			var row = grid.getSelected();
			return row;
		}

		//回车触发
		function onKeyEnter() {
			search();
		}

		function onCancel(e) {
			CloseWindow("cancel");
		}

		function ZH_CONTRACT_TYPE(e) {
			return nui.getDictText("ZH_CONTRACT_TYPE", e.value);
		}

		function ZH_FLOW_TYPE(e) {
			return nui.getDictText("ZH_FLOW_TYPE", e.value);
		}
	</script>
</body>
</html>