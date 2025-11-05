<%@page import="com.eos.data.datacontext.UserObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/common/common.jsp"%>
<html>
<head>
<title>选择小额采购</title>
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
			<input name="criteria._expr[23].status" class="nui-hidden" value="2" />
			<div class="nui-toolbar" style="border-bottom: 0; padding: 5px;">
				<table>
					<tr>
						<td style="width: 90px; text-align: right;">小额采购名称:</td>
						<td style="width: 245px">
							<input name="criteria._expr[1]._value" class="nui-textbox" style="width: 240px;" />
							<input class="nui-hidden" name="criteria._expr[1]._property" value="purchaseName" />
							<input class="nui-hidden" name="criteria._expr[1]._op" value="like" />
						</td>
						<td style="width: 90px; text-align: right;">小额采购编号:</td>
						<td style="width: 205px">
							<input name="criteria._expr[2]._value" class="nui-textbox" style="width: 200px;" />
							<input class="nui-hidden" name="criteria._expr[2]._property" value="purchaseCode" />
							<input class="nui-hidden" name="criteria._expr[2]._op" value="like" />
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
			<div id="datagrid1" frozenStartColumn="0" sizeList="[15,30,50]" dataField="purZeroList" class="nui-datagrid" style="width: 100%; height: 475px;" pageSize="15"
				url="com.zhonghe.ame.purchase.purchaseItems.queryPurZeroList.biz.ext" allowAlternating="true" idField="id" onrowdblclick="onRowDblClick">
				<div property="columns">
					<div type="checkcolumn">○</div>
					<div field="id" headerAlign="center" visible="false">id</div>
					<div field="purchaseName" width="100" align="left" headerAlign="center">小额采购名称</div>
					<div field="purchaseCode" width="100" align="left" headerAlign="center">小额采购编号</div>
					<div field="createdOrgname" width="100" align="left" headerAlign="center">采购单位</div>
					<div field="totalAmount" width="100" align="left" headerAlign="center" dataType="currency">金额（万元）</div>
					<div field="status" width="80" align="center" headerAlign="center" renderer="ZH_FLOW_TYPE">状态</div>
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
			grid.sortBy("createdTime", "desc");
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
		
		function ZH_FLOW_TYPE(e) {
			return nui.getDictText('ZH_FLOW_TYPE', e.value);
		}		
	</script>

</body>
</html>