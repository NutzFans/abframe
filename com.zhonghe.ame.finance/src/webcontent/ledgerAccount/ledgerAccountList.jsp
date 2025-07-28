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
<title>会计科目管理</title>
</head>
<body>
	<div style="width: auto; height: 99%; padding: 5px;">
		<div id="ledgerAccountForm">
			<div class="nui-toolbar" style="border-bottom: 0; padding: 5px;">
				<table>
					<tr>
						<td style="width: 80px; text-align: right;">科目名称：</td>
						<td>
							<input name="criteria._expr[1]._value" class="nui-textbox" style="width: 200px" />
							<input name="criteria._expr[1]._property" value="name" class="nui-hidden" />
							<input name="criteria._expr[1]._op" value="like" class="nui-hidden" />
						</td>
						<td style="width: 80px; text-align: right;">科目分类：</td>
						<td>
							<input name="criteria._expr[2].category" class="nui-dictcombobox" dictTypeId="CW_KM_CLASS" showNullItem="true" nullItemText="全部" style="width: 150px" />
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
						<a class="nui-button" id="cwkjkm_add" iconCls="icon-add" onclick="add()">新增</a>
						<a class="nui-button" id="cwkjkm_edit" iconCls="icon-edit" onclick="edit()">编辑</a>
						<a class="nui-button" id="cwkjkm_del" iconCls="icon-remove" onclick="del()">删除</a>
						<a class="nui-button" id="cwkjkm_import" iconCls="icon-upload" onclick="improt()">导入</a>
					</td>
				</tr>
			</table>
		</div>

		<div class="nui-fit">
			<div id="ledgerAccountGrid" sizeList="[100,200]" showPager="true" dataField="ledgerAccountList" pageSize="100" class="nui-datagrid" style="width: 100%; height: 100%;" multiSelect="true"
				url="com.zhonghe.ame.finance.ledgerAccount.queryLedgerAccountList.biz.ext">
				<div property="columns">
					<div type="checkcolumn"></div>
					<div field="name" width="100" align="left" headerAlign="center">科目名称</div>
					<div field="category" width="200" align="center" headerAlign="center" renderer="CW_KM_CLASS">科目分类</div>
					<div field="sorting" width="50" align="center" headerAlign="center">排序</div>
					<div field="centralizedDepartmentName" width="100" align="center" headerAlign="center">归口部门</div>
					<div header="职能部门" headerAlign="center">
						<div property="columns">
							<div field="znErpCode" width="100" align="center" headerAlign="center">科目代码</div>
							<div field="znErpName" width="200" align="left" headerAlign="center">ERP预算及会计科目</div>
							<div field="znErpRemark" width="250" align="left" headerAlign="center">说明</div>
						</div>
					</div>
					<div header="项目部" headerAlign="center">
						<div property="columns">
							<div field="xmErpCode" width="100" align="center" headerAlign="center">科目代码</div>
							<div field="xmErpName" width="200" align="left" headerAlign="center">ERP预算及会计科目</div>
							<div field="xmErpRemark" width="250" align="left" headerAlign="center">说明</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>

	<script type="text/javascript">
		nui.parse();
		var ledgerAccountForm = new nui.Form("#ledgerAccountForm");
		var ledgerAccountGrid = nui.get("ledgerAccountGrid");

		init();

		function init() {
			// 按钮权限
			if (userId != 'sysadmin') {
				getOpeatorButtonAuth("cwkjkm_add,cwkjkm_edit,cwkjkm_del,cwkjkm_import");
			}
			search();
		}

		function add() {
			nui.open({
				url : "/default/finance/ledgerAccount/addLedgerAccount.jsp",
				width : '900',
				height : '460',
				allowResize : false,
				title : "会计科目 - 新增",
				onload : function() {
					var iframe = this.getIFrameEl();
				},
				ondestroy : function(action) {
					search();
				}
			});
		}

		function edit() {
			var rows = ledgerAccountGrid.getSelecteds();
			if (rows.length > 1 || rows.length == 0) {
				showTips("只能选中一条记录进行编辑", "danger");
				return;
			} else {
				var data = rows[0];
				nui.open({
					url : "/default/finance/ledgerAccount/editLedgerAccount.jsp",
					width : '900',
					height : '460',
					allowResize : false,
					title : "会计科目 - 编辑",
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
			var rows = ledgerAccountGrid.getSelecteds();
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
						url : "com.zhonghe.ame.finance.ledgerAccount.deleteLedgerAccountById.biz.ext",
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
				url : "/default/finance/ledgerAccount/importLedgerAccount.jsp",
				width : '400',
				height : '180',
				title : "会计科目 - 导入",
				onload : function() {
					var iframe = this.getIFrameEl();
				},
				ondestroy : function(action) {
					search();
				}
			});
		}		

		function search() {
			var data = ledgerAccountForm.getData();
			ledgerAccountGrid.load(data);
		}
		
		function reset() {
			ledgerAccountForm.reset();
			init();
		}		

		function CW_KM_CLASS(e) {
			if(e.value.includes(",")){
				return e.value.split(',').map(part => nui.getDictText("CW_KM_CLASS", part)).join('，');
			}else{
				return nui.getDictText("CW_KM_CLASS", e.value);
			}
			
		}
	</script>

</body>
</html>