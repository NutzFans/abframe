<%@page import="com.eos.data.datacontext.UserObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<head>
<title>产值分配 - 选择经办人</title>
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
			<div class="nui-toolbar" style="border-bottom: 0; padding: 5px;">
				<table>
					<tr>
						<td style="width: 60px; text-align: right;">员工姓名:</td>
						<td style="width: 105px">
							<input class="nui-textbox" name="criteria._expr[0].empname" onenter="onKeyEnter" style="width: 100px;" />
							<input class="nui-hidden" name="criteria._expr[0]._op" value="like" />
							<input class="nui-hidden" name="criteria._expr[0]._likeRule" value="all" />
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
			<div id="datagrid1" sizeList="[5]" pageSize="5" dataField="omEmployees" pageSize="15" class="nui-datagrid" style="width: 100%; height: 205px;"
				url="com.primeton.eos.machine.machine.queryEmployee.biz.ext" idField="empid" onrowdblclick="onRowDblClick">
				<div property="columns">
					<div type="checkcolumn">○</div>
					<div field="userid" width="50" headerAlign="center" align="center" allowSort="true">员工帐号</div>
					<div field="empname" width="50" headerAlign="center" align="center" allowSort="true">员工姓名</div>
					<div field="orgname" width="150" headerAlign="center" align="center" allowSort="true">部门名称</div>
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

		search();

		function search() {
			var data = form.getData();
			grid.sortBy("userid", "asc");
			grid.load(data);
		}

		function reset() {
			form.reset();
			search();
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