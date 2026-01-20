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

.nui-radiobuttonlist-item {
	float: left;
	margin-left: 200px;
	color: pink;
}
</style>
<head>
<title>选择客户</title>
</head>
<body>
	<div class="nui-fit" style="padding: 5px">
		<div id="searchForm">
			<div class="nui-toolbar" style="border-bottom: 0; padding: 5px;">
				<table>
					<tr>
						<td style="width: 60px; text-align: right;">客户名称：</td>
						<td style="width: 205px">
							<input name="criteria._expr[1]._value" class="nui-textbox" style="width: 200px" />
							<input name="criteria._expr[1]._property" value="custname" class="nui-hidden" />
							<input name="criteria._expr[1]._op" value="like" class="nui-hidden" />
						</td>
						<td style="width: 110px; text-align: right;">统一社会信用代码：</td>
						<td style="width: 205px">
							<input name="criteria._expr[2]._value" class="nui-textbox" style="width: 200px" />
							<input name="criteria._expr[2]._property" value="custnum" class="nui-hidden" />
							<input name="criteria._expr[2]._op" value="like" class="nui-hidden" />
						</td>
						<td>
							<a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查询</a>
							<a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset()">重置</a>
						</td>
					</tr>
				</table>
			</div>
		</div>

		<div class="nui-toolbar" style="border-bottom: 0; padding: 5px;">
			<table>
				<tr>
					<td>
						<span style="color: red;">在不便使用客户具体名称情况时，内置 某单位（集团内）与 某单位（集团外）作为标准化代称供选择使用</span>
					</td>
				</tr>
			</table>
		</div>

		<div class="nui-fit">
			<div id="custDataGrid" class="nui-datagrid" style="width: 100%; height: 340px;" url="com.zhonghe.ame.marketInfo.marketinfo.khxx.newCustomers.queryNewCustomersList.biz.ext" dataField="dataList"
				sizeList="[10,30,50,100]" pageSize="10" allowAlternating="true" onrowdblclick="onRowDblClick">
				<div property="columns">
					<div type="checkcolumn" width="10"></div>
					<div field="custid" visible="false">客户主键</div>
					<div field="custname" align="left" headerAlign="center">客户名称</div>
					<div field="custnum" headerAlign="center" align="left">统一社会信用代码</div>
					<div field="appStatus" headerAlign="center" align="center" renderer="onActionRenderer">审核状态</div>
				</div>
			</div>
		</div>
	</div>

	<div style="text-align: center; padding-top: 5px; padding-bottom: 10px; margin-bottom: 1px" class="nui-toolbar">
		<a class="nui-button" onclick="onOk()" style="width: 60px; margin-right: 20px;" iconCls="icon-save">保存</a>
		<a class="nui-button" onclick="onCancel()" style="width: 60px;" iconCls="icon-close">关闭</a>
	</div>

	<script type="text/javascript">
		nui.parse();
		var searchForm = new nui.Form("#searchForm");
		var custDataGrid = nui.get("custDataGrid");

		search();

		function search() {
			var data = searchForm.getData();
			custDataGrid.sortBy("createDate", "desc");
			custDataGrid.load(data);
		}

		function reset() {
			searchForm.reset();
			search();
		}

		function onActionRenderer(e) {
			var record = e.record;
			var s = nui.getDictText('ZH_FLOW_TYPE', e.value);
			return s;
		}

		function onOk() {
			var row = custDataGrid.getSelected();
			if (row.appStatus == '2') {
				CloseWindow("ok");
			} else {
				showTips("只有审核状态为 [审批通过] 的客户才可以被使用！", "danger");
			}
		}

		function onRowDblClick(e) {
			onOk();
		}

		function onCancel(e) {
			CloseWindow("cancel");
		}

		function GetData() {
			var row = custDataGrid.getSelected();
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
	</script>

</body>
</html>