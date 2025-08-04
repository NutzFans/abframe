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

.mini-grid-summaryCell {
	text-align: center;
}
</style>
<head>
<title>填报数据 - 项目部</title>
</head>
<body>
	<div class="nui-fit" style="padding: 5px;">
		<div class="nui-toolbar" style="border-bottom: 0; padding: 0px;">
			<table>
				<tr>
					<td>
						<a class="nui-button" iconCls="icon-add" onclick="addXmb()">新增</a>
						<a class="nui-button" iconCls="icon-edit" onclick="editXmb()">编辑</a>
						<a class="nui-button" iconCls="icon-remove" onclick="delXmb()">删除</a>
					</td>
				</tr>
			</table>
		</div>
		<div id="xmbAssociatedGrid" multiSelect="false" class="nui-datagrid" style="height: 580px;" frozenStartColumn="0" frozenEndColumn="3" virtualScroll="true" virtualColumns="true" showPager="false"
			showSummaryRow="true">
			<div property="columns">
				<div type="checkcolumn"></div>
				<div field="createName" width="60" headerAlign="center" align="center">填报人</div>
				<div field="createTime" width="90" dateFormat="yyyy-MM-dd" headerAlign="center" align="center">填报日期</div>
				<div field="xmbName" width="250" headerAlign="center" align="center">部门/项监部名称</div>
				<div field="totalAmount" width="120" headerAlign="center" align="center" summaryType="sum" dataType="currency">合计</div>
				<div field="janAmount" width="120" headerAlign="center" align="center" summaryType="sum" dataType="currency">1月</div>
				<div field="febAmount" width="120" headerAlign="center" align="center" summaryType="sum" dataType="currency">2月</div>
				<div field="marAmount" width="120" headerAlign="center" align="center" summaryType="sum" dataType="currency">3月</div>
				<div field="aprAmount" width="100" headerAlign="center" align="center" summaryType="sum" dataType="currency">4月</div>
				<div field="mayAmount" width="100" headerAlign="center" align="center" summaryType="sum" dataType="currency">5月</div>
				<div field="junAmount" width="100" headerAlign="center" align="center" summaryType="sum" dataType="currency">6月</div>
				<div field="julAmount" width="100" headerAlign="center" align="center" summaryType="sum" dataType="currency">7月</div>
				<div field="augAmount" width="100" headerAlign="center" align="center" summaryType="sum" dataType="currency">8月</div>
				<div field="sepAmount" width="100" headerAlign="center" align="center" summaryType="sum" dataType="currency">9月</div>
				<div field="octAmount" width="100" headerAlign="center" align="center" summaryType="sum" dataType="currency">10月</div>
				<div field="novAmount" width="100" headerAlign="center" align="center" summaryType="sum" dataType="currency">11月</div>
				<div field="decAmount" width="100" headerAlign="center" align="center" summaryType="sum" dataType="currency">12月</div>
			</div>
		</div>
	</div>

	<div style="text-align: center; padding: 5px; margin-bottom: 1px" class="nui-toolbar">
		<a id="saveBtn" class="nui-button" onclick="save()" style="width: 60px; margin-right: 20px;" iconCls="icon-close">关闭</a>
	</div>

	<script type="text/javascript">
		nui.parse();
		var xmbAssociatedGrid = nui.get("xmbAssociatedGrid");
		var budgetInfo;

		function initData(data) {
			budgetInfo = data;
			var json = nui.encode({
				"id" : data.id,
			});
			ajaxCommon({
				url : "com.zhonghe.ame.finance.budgetFilling.queryAssociatedXmbEntityByMainId.biz.ext",
				data : json,
				contentType : 'text/json',
				success : function(result) {
					var datas = result.datas;
					xmbAssociatedGrid.setData(datas);
				}
			});
		}

		function addXmb() {
			nui.open({
				url : "/default/finance/budgetFilling/multipleDetailsAssociated.jsp",
				title : budgetInfo.parent + " - " + budgetInfo.name,
				width : "1400px",
				height : "700px",
				allowResize : false,
				onload : function() {
					var iframe = this.getIFrameEl();
					iframe.contentWindow.initData(budgetInfo);
				},
				ondestroy : function(action) {
					if (action == "ok") {
						var json = nui.encode({
							'id' : budgetInfo.id
						});
						ajaxCommon({
							url : "com.zhonghe.ame.finance.budgetFilling.queryAssociatedXmbEntityByMainId.biz.ext",
							data : json,
							contentType : 'text/json',
							success : function(result) {
								var datas = result.datas;
								xmbAssociatedGrid.setData(datas);
							}
						});
					}
				}
			});
		}

		function editXmb() {
			var row = xmbAssociatedGrid.getSelecteds();
			if (row.length > 1 || row.length == 0) {
				showTips("只能选中一条记录进行编辑！", "danger");
				return;
			}
			var data = row[0];
			if (userId == data.createCode) {
				nui.open({
					url : "/default/finance/budgetFilling/multipleDetailsAssociated.jsp",
					title : budgetInfo.parent + " - " + budgetInfo.name,
					width : "1400px",
					height : "700px",
					allowResize : false,
					onload : function() {
						var iframe = this.getIFrameEl();
						iframe.contentWindow.editData(budgetInfo, data);
					},
					ondestroy : function(action) {
						if (action == "ok") {
							var json = nui.encode({
								'id' : budgetInfo.id
							});
							ajaxCommon({
								url : "com.zhonghe.ame.finance.budgetFilling.queryAssociatedXmbEntityByMainId.biz.ext",
								data : json,
								contentType : 'text/json',
								success : function(result) {
									var datas = result.datas;
									xmbAssociatedGrid.setData(datas);
								}
							});
						}
					}
				});
			} else {
				showTips("只有填报人可以对选中记录进行编辑！", "danger");
			}
		}

		function delXmb() {
			var row = xmbAssociatedGrid.getSelecteds();
			if (row.length > 1 || row.length == 0) {
				showTips("只能选中一条记录进行删除！", "danger");
				return;
			}
			if (confirm("是否删除？")) {
				var data = row[0];
				var json = nui.encode({
					'id' : data.id,
					'mainId' : data.mainId
				});
				ajaxCommon({
					url : "com.zhonghe.ame.finance.budgetFilling.deleteXmbAssociatedByIdAndMainId.biz.ext",
					data : json,
					contentType : 'text/json',
					success : function(o) {
						if (o.result == "1") {
							var json = nui.encode({
								"id" : budgetInfo.id,
							});
							ajaxCommon({
								url : "com.zhonghe.ame.finance.budgetFilling.queryAssociatedXmbEntityByMainId.biz.ext",
								data : json,
								contentType : 'text/json',
								success : function(result) {
									showTips("删除成功");
									var datas = result.datas;
									xmbAssociatedGrid.setData(datas);
								}
							})
						} else {
							showTips("删除失败，请联系信息技术部人员！", "danger");
						}
					}
				});
			}
		}

		function save() {
			var json = nui.encode({
				'id' : budgetInfo.id
			});
			ajaxCommon({
				"url" : "com.zhonghe.ame.finance.budgetFilling.updateLedgerAssociated.biz.ext",
				data : json,
				contentType : 'text/json',
				success : function(text) {
					closeOk();
				}
			});
		}
	</script>

</body>
</html>