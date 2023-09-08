<%@page import="com.eos.data.datacontext.UserObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/common/common.jsp"%>
<html>
<head>
<title>选择签约方</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%=request.getContextPath()%>/common/nui/nui.js" type="text/javascript"></script>
<style type="text/css">
.nui-radiobuttonlist-item {
	float: left;
	margin-left: 200px;
	color: pink;
}
</style>
</head>
<body>
	<div style="width: auto; height: 100%; padding: 5px; overflow: hidden;">
		<div id="form1">
			<div class="nui-toolbar" style="border-bottom: 0; padding: 5px;">
				<table>
					<tr>
						<td style="width: 70px; text-align: right;">供货商名称:</td>
						<td style="width: 205px">
							<input name="criteria._expr[1]._value" class="nui-textbox" style="width: 200px" />
							<input class="nui-hidden" name="criteria._expr[1]._property" value="custname" />
							<input class="nui-hidden" name="criteria._expr[1]._op" value="like" />
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
			<div id="datagrid1" class="nui-datagrid" style="width: 100%; height: 340px;" url="com.zhonghe.ame.payContract.payContract.queryPurSuppliersInfo.biz.ext" dataField="purSuppliers"
				sizeList="[10,30,50,100]" pageSize="10" allowAlternating="true" onrowdblclick="onRowDblClick">
				<div property="columns">
					<div type="checkcolumn" width="10"></div>
					<div field="custid" visible="false">供货商主键</div>
					<div field="custname" align="left" headerAlign="center">供货商名称</div>
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

		init();

		function init() {
			grid.sortBy("createDate", "desc");
			grid.load();
		}

		function search() {
			var data = form.getData();
			grid.sortBy("createDate", "desc");
			grid.load(data);
		}

		function reset() {
			form.reset();
			init();
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