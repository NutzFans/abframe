<%@page import="com.eos.data.datacontext.UserObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/common/common.jsp"%>
<html>
<head>
<title>采购立项列表</title>
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
						<td style="width: 60px; text-align: right;">立项名称:</td>
						<td style="width: 205px">
							<input name="criteria._expr[1]._value" class="nui-textbox" style="width: 200px" />
							<input class="nui-hidden" name="criteria._expr[1]._property" value="proAppName" />
							<input class="nui-hidden" name="criteria._expr[1]._op" value="like" />
						</td>
						<td style="width: 60px; text-align: right;">立项编号:</td>
						<td style="width: 205px">
							<input name="criteria._expr[2]._value" class="nui-textbox" style="width: 200px" />
							<input class="nui-hidden" name="criteria._expr[2]._property" value="proAppCode" />
							<input class="nui-hidden" name="criteria._expr[2]._op" value="like" />
							<input class="nui-hidden" name="criteria._expr[3].status" value="2" />
							<input class="nui-hidden" name="criteria._expr[4].type" value="3" />
							<input id="typeOP" class="nui-hidden" name="criteria._expr[4]._op" />
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
			<div id="datagrid1" frozenStartColumn="0" sizeList="[10,20,50,100]" showPager="true" dataField="proApp" showSummaryRow="true" ondrawsummarycell="onDrawSummaryCell" onrowdblclick="onRowDblClick"
				class="nui-datagrid" style="width: 100%; height: 550px" url="com.zhonghe.ame.purchase.purchaseProApp.queryProApp.biz.ext" multiSelect="false" allowSortColumn=true>
				<div property="columns">
					<div type="indexcolumn" align="center" headerAlign="center">序号</div>
					<div type="checkcolumn"></div>
					<div field="proAppName" width="200" align="center" headerAlign="center" allowSort="true">立项名称</div>
					<div field="proAppCode" width="150" align="center" headerAlign="center" allowSort="true">立项编号</div>
					<div field="proAppOrgName" width="150" align="center" headerAlign="center" allowSort="true">立项单位</div>
					<div field="type" width="60" align="center" headerAlign="center" renderer="ZH_PURCHASE">集采类型</div>
					<div field="purchasMode" width="60" align="center" headerAlign="center" allowSort="true" renderer="getPurchasMode">采购方式</div>
					<div field="proAppApplyPrice" width="100" align="center" headerAlign="center" allowSort="true">立项申请金额(万元)</div>
					<div field="createdTime" dateFormat="yyyy-MM-dd" width="60" allowSort="true" align="center" headerAlign="center">申请日期</div>
					<div field="status" width="60" align="center" headerAlign="center" allowSort="true" renderer="getStatus">状态</div>
				</div>
			</div>
		</div>

		<div style="text-align: center; padding: 5px; border-top: 0px;" class="nui-toolbar">
			<a class="nui-button" onclick="onOk()" id="creatReimbProcess" style="width: 80px; margin-right: 20px;" iconCls="icon-ok">确定</a>
			<a class="nui-button" onclick="onCancel" id="saveReimbProcess" style="width: 80px; margin-right: 140px;" iconCls="icon-close">关闭</a>
		</div>
	</div>

	<script type="text/javascript">
		nui.parse();
		var form = new nui.Form("#form1");
		var grid = nui.get("datagrid1");
		var addType = "<%=request.getParameter("addType")%>";

		search();

		function search() {
			var form = new nui.Form("#form1");
			if (addType == "add_zxcg") {
				nui.get("typeOP").setValue("=");
			} else {
				nui.get("typeOP").setValue("<>");
			}
			var data = form.getData(); //获取表单JS对象数据
			grid.sortBy("createdTime", "desc");
			grid.load(data); //datagrid加载数据
		}

		function onOk() {
			var row = grid.getSelected();
			CloseWindow("ok");
		}

		function reset() {
			var form = new nui.Form("#form1");
			form.reset();
			grid.sortBy("createdTime", "desc");
			grid.load();
			search()
		}

		function GetData() {
			var row = grid.getSelected();
			return row;
		}

		function onKeyEnter() {
			search();
		}

		function onDrawSummaryCell(e) {
			var result = e.result;
			var grid = e.sender;
		}

		function onRowDblClick(e) {
			onOk();
		}

		function onCancel(e) {
			CloseWindow("cancel");
		}

		//标准方法接口定义
		function CloseWindow(action) {
			if (window.CloseOwnerWindow) {
				return window.CloseOwnerWindow(action);
			} else {
				window.close();
			}
		}

		function getStatus(e) {
			return nui.getDictText('ZH_FLOW_TYPE', e.value);
		}

		function getPurchasMode(e) {
			return nui.getDictText('ZH_CGFS', e.value);
		}

		function ZH_PURCHASE(e) {
			return nui.getDictText("ZH_PURCHASE", e.value);
		}
	</script>
</body>
</html>