<%@page import="com.eos.data.datacontext.UserObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/common/common.jsp"%>
<html>
<head>
<title>选择合同 - 收费合同信息</title>
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
			<input class="nui-hidden" name="critria._entity" value="com.zhonghe.ame.chargeContract.chargeContract.ZhChargeContractEntity" />
			<input name="critria._expr[12].appStatus" class="nui-hidden" />
			<input name="critria._expr[28].issupagreement" class="nui-hidden" />
			<div class="nui-toolbar" style="border-bottom: 0; padding: 5px;">
				<table>
					<tr>
						<td style="width: 60px; text-align: right;">经办人:</td>
						<td style="width: 155px">
							<input name="critria._expr[1].createUsername" class="nui-textbox" id="createUsername" style="width: 150px" />
							<input class="nui-hidden" name="critria._expr[1]._op" value="like" id="createUsernameOp" />
							<input name="critria._expr[0].createUserid" class="nui-hidden" id="createUserid" />
						</td>
						<td style="width: 60px; text-align: right;">合同编号:</td>
						<td style="width: 255px">
							<input name="critria._expr[10]._value" class="nui-textbox" style="width: 250px" />
							<input class="nui-hidden" name="critria._expr[10]._property" value="contractNo" />
							<input class="nui-hidden" name="critria._expr[10]._op" value="like" />
						</td>
						<td style="width: 60px; text-align: right;">合同名称:</td>
						<td style="width: 385px">
							<input name="critria._expr[6]._value" class="nui-textbox" style="width: 380px" />
							<input class="nui-hidden" name="critria._expr[6]._property" value="contractName" />
							<input class="nui-hidden" name="critria._expr[6]._op" value="like" />
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
			<div id="datagrid1" sizeList="[15,30,50]" dataField="data" pageSize="15" class="nui-datagrid" style="width: 100%; height: 475px;"
				url="com.zhonghe.ame.chargeContract.chargeContract.queryChargeContractAll.biz.ext" allowAlternating="true" idField="id" onrowdblclick="onRowDblClick">
				<div property="columns">
					<div type="checkcolumn">○</div>
					<div field="id" headerAlign="center" visible="false">id</div>
					<div field="createUsername" width="50" align="center" headerAlign="center" allowSort="true">经办人</div>
					<div field="implementOrgname" width="120" headerAlign="center" allowSort="true" align="center">承办部门</div>
					<div field="createTime" width="55" headerAlign="center" allowSort="true" align="center">申请日期</div>
					<div field="contractNo" width="120" headerAlign="center" allowSort="true" align="center">合同编号</div>
					<div field="contractName" width="150" align="center" headerAlign="center" allowSort="true" renderer="lookInfo">合同名称</div>
					<div field="contractSum" width="60" align="center" headerAlign="center" allowSort="true" dataType="currency">合同金额</div>
					<div field="appStatus" width="55" align="center" headerAlign="center" allowSort="true" renderer="ZH_FLOW_TYPE">审批状态</div>
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
			data.critria._expr[12].appStatus = 2;
			data.critria._expr[28].issupagreement = "n";
			grid.sortBy("createTime", "desc");
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