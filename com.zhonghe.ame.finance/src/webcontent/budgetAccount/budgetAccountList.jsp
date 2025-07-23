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
<title>预算主体管理</title>
</head>
<body>
	<div style="width: auto; height: 99%; padding: 5px;">
		<div id="budgetAccountForm">
			<div class="nui-toolbar" style="border-bottom: 0; padding: 5px;">
				<table>
					<tr>
						<td style="width: 80px; text-align: right;">预算主体：</td>
						<td>
							<input name="criteria._expr[1]._value" class="nui-textbox" style="width: 200px" />
							<input name="criteria._expr[1]._property" value="name" class="nui-hidden" />
							<input name="criteria._expr[1]._op" value="like" class="nui-hidden" />
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
			<table style="width: 100%;">
				<tr>
					<td>
						<a class="nui-button" id="cwyszt_add" iconCls="icon-add" onclick="add()">新增</a>
						<a class="nui-button" id="cwyszt_edit" iconCls="icon-edit" onclick="edit()">编辑</a>
						<a class="nui-button" id="cwyszt_del" iconCls="icon-remove" onclick="del()">删除</a>
						<a class="nui-button" id="cwyszt_import" iconCls="icon-upload" onclick="improt()">导入</a>
					</td>
				</tr>
			</table>
		</div>

		<div class="nui-fit">
			<div id="budgetAccountGrid" sizeList="[100,200]" showPager="true" dataField="budgetAccountList" pageSize="100" class="nui-datagrid" style="width: 100%; height: 100%;" multiSelect="true"
				url="com.zhonghe.ame.finance.budgetAccount.queryBudgetAccountList.biz.ext">
				<div property="columns">
					<div type="checkcolumn"></div>
					<div field="name" width="200" align="center" headerAlign="center">预算主体</div>
					<div field="code" width="200" align="center" headerAlign="center">代码</div>
					<div field="sorting" width="50" align="center" headerAlign="center">排序</div>
					<div field="fillingInOrgName" width="200" align="center" headerAlign="center">预算填报组织</div>
					<div field="remark" width="300" align="left" headerAlign="center">备注</div>
				</div>
			</div>
		</div>

	</div>

	<script type="text/javascript">
		nui.parse();
		var budgetAccountForm = new nui.Form("#budgetAccountForm");
		var budgetAccountGrid = nui.get("budgetAccountGrid");

		init();

		function init() {
			// 按钮权限
			if (userId != 'sysadmin') {
				getOpeatorButtonAuth("cwyszt_add,cwyszt_edit,cwyszt_del,cwyszt_import");
			}
			search();
		}

		function add() {
			nui.open({
				url : "/default/finance/budgetAccount/addBudgetAccount.jsp",
				width : "450",
				height : "380",
				allowResize : false,
				title : "预算主体 - 新增",
				onload : function() {
					var iframe = this.getIFrameEl();
				},
				ondestroy : function(action) {
					search();
				}
			});
		}

		function edit() {
			var rows = budgetAccountGrid.getSelecteds();
			if (rows.length > 1 || rows.length == 0) {
				showTips("只能选中一条记录进行编辑", "danger");
				return;
			} else {
				var data = rows[0];
				nui.open({
					url : "/default/finance/budgetAccount/editBudgetAccount.jsp",
					width : "450",
					height : "380",
					allowResize : false,
					title : "预算主体 - 编辑",
					onload : function() {
						var iframe = this.getIFrameEl();
						iframe.contentWindow.setEditData(data);
					},
					ondestroy : function(action) {
						search();
					}
				})
			}
		}
		
		function del(){
			var rows = budgetAccountGrid.getSelecteds();
			if (rows.length == 0) {
				showTips("请选中需要删除的数据记录", "danger");
			}else{
				if (!confirm("是否删除？")) {
					return;
				}else{
					var datas = rows.map(row => ({ id: row.id }));
					var json = nui.encode({
							'datas' : datas
					});
					nui.ajax({
						url : "com.zhonghe.ame.finance.budgetAccount.deleteBudgetAccountById.biz.ext",
						type : 'POST',
						data : json,
						contentType : 'text/json',
						success : function(o) {
							if (o.result == 1) {
								showTips("删除成功");
								search();
							} else {
								showTips("删除失败，请联系系统管理员！", "danger");
							}
						}
					});
				}
			}
		}
		
		function improt(){
			nui.open({
				url : "/default/finance/budgetAccount/importBudgetAccount.jsp",
				width : '400',
				height : '180',
				title : "预算主体 - 导入",
				onload : function() {
					var iframe = this.getIFrameEl();
				},
				ondestroy : function(action) {
					search();
				}
			});
		}		

		function search() {
			var data = budgetAccountForm.getData();
			budgetAccountGrid.load(data);
		}

		function reset() {
			budgetAccountForm.reset();
			init();
		}
	</script>

</body>
</html>