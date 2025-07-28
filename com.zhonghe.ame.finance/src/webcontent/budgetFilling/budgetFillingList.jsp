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
<title>预算填报管理</title>
</head>
<body>
	<div id="tabs" class="nui-tabs" activeIndex="0" style="width: auto; height: 99%; padding: 5px;" onactivechanged="tabActiveChanged">
		<div title="预算主体 - 填报">
			<div id="budgetFillingForm">
				<input name="criteria._expr[0]._property" value="budgetAccountId" class="nui-hidden" />
				<input name="criteria._expr[0]._op" value="in" class="nui-hidden" />
				<input id="searchBudgetAccountIds" name="criteria._expr[0]._value" class="nui-hidden" />
				<div class="nui-toolbar" style="border-bottom: 0; padding: 5px;">
					<table>
						<tr>
							<td style="width: 60px; text-align: right;">预算年份:</td>
							<td>
								<input id="budgetYear" name="criteria._expr[1].budgetYear" class="nui-textbox" style="width: 100px" />
							</td>
							<td style="width: 60px; text-align: right;">预算主体:</td>
							<td>
								<input id="budgetAccountId" name="criteria._expr[2].budgetAccountId" class="nui-combobox" textField="name" valueField="id" style="width: 200px" showNullItem="true" />
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
							<a class="nui-button" id="cwystb_scystb" iconCls="icon-add" onclick="scystb()">生成预算填报</a>
							<a class="nui-button" id="cwystb_tbsj" iconCls="icon-edit" onclick="tbsj()">填报数据</a>
							<a class="nui-button" id="cwystb_del" iconCls="icon-remove" onclick="cwystb_del()">删除</a>
						</td>
					</tr>
				</table>
			</div>

			<div class="nui-fit">
				<div id="budgetFillingGrid" sizeList="[50,100,500]" showPager="true" multiSelect="true" dataField="budgetFillingList" pageSize="50" class="nui-datagrid" style="width: 100%; height: 100%;"
					url="com.zhonghe.ame.finance.budgetFilling.queryBudgetFillingList.biz.ext">
					<div property="columns">
						<div type="checkcolumn"></div>
						<div field="budgetAccountName" width="200" headerAlign="center" align="center">预算主体</div>
						<div field="budgetYear" width="80" headerAlign="center" align="center">预算年份</div>
						<div width="100" headerAlign="center" align="center">填报明细</div>
						<div field="fillingStage" width="100" headerAlign="center" align="center">填报阶段</div>
					</div>
				</div>
			</div>

		</div>
		<div name="hjydDimTab" title="合计 - 月度" visible="false"></div>
		<div name="hjztDimTab" title="合计 - 主体" visible="false"></div>
	</div>

	<script type="text/javascript">
		nui.parse();
		var budgetFillingForm = new nui.Form("#budgetFillingForm");
		var budgetFillingGrid = nui.get("#budgetFillingGrid");
		var tabs = nui.get("tabs");
		var authVal = "0";

		function tabActiveChanged(e) {
			if (e.tab.title == "预算主体 - 填报") {
				var json = nui.encode({
					'loginUserId' : userId,
					'loginUserOrgId' : userOrgId,
					'authCode' : 'cwystb'
				});
				nui.ajax({
					url : "com.zhonghe.ame.contractPact.statisticalReport.queryMonthlyBudgetTrackAuth.biz.ext",
					type : 'POST',
					data : json,
					contentType : 'text/json',
					success : function(o) {
						if (o.result == "1") {
							authVal = "1";
							var hjydDimTab = tabs.getTab("hjydDimTab");
							var hjztDimTab = tabs.getTab("hjztDimTab");
							tabs.updateTab(hjydDimTab, {
								visible : true
							});
							tabs.updateTab(hjztDimTab, {
								visible : true
							});
						}
						init();
					}
				});
			}
		}

		function init() {
			// 按钮权限
			if (userId != 'sysadmin') {
				getOpeatorButtonAuth("cwystb_scystb,cwystb_del");
			}
			if (authVal == "1") {
				initBudgetAccountIdCombobox();
			} else {
				getBudgetAccount(userOrgId);
			}
			search();
		}

		function getBudgetAccount(userOrgId) {
			var json = nui.encode({
				'userOrgId' : userOrgId
			});
			ajaxCommon({
				url : "com.zhonghe.ame.finance.common.getBudgetAccountListByOrgId.biz.ext",
				data : json,
				async : false,
				success : function(result) {
					var data = result.data;
					nui.get("searchBudgetAccountIds").setValue(data.ids);
					nui.get("budgetAccountId").setData(data.list);
				}
			});
		}

		function initBudgetAccountIdCombobox() {
			ajaxCommon({
				"url" : "com.zhonghe.ame.finance.common.getBudgetAccountList.biz.ext",
				contentType : 'text/json',
				async : false,
				success : function(result) {
					var datas = result.budgetAccountList;
					nui.get("budgetAccountId").setData(datas);
				}
			});
		}

		function scystb() {
			nui.open({
				url : "/default/finance/budgetFilling/generateBudgetFilling.jsp",
				width : "450",
				height : "300",
				allowResize : false,
				title : "生成预算填报 - 年度",
				onload : function() {
					var iframe = this.getIFrameEl();
				},
				ondestroy : function(action) {
					search();
				}
			});
		}
		
		function tbsj(){
			var rows = budgetFillingGrid.getSelecteds();
			if (rows.length > 1 || rows.length == 0) {
				showTips("只能选中一条记录进行填报", "danger");
				return;
			}else{
				var data = rows[0];
				nui.open({
					url : "/default/finance/budgetFilling/tbsjBudgetFilling.jsp",
					width : '100%',
					height : '100%',
					title : "年度预算 - 填报数据",
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
		
		function cwystb_del(){
			var rows = budgetFillingGrid.getSelecteds();
			if (rows.length == 0) {
				showTips("请选中需要删除的数据记录", "danger");
			}else{
				if(!confirm("是否删除？")){
					return;
				}else{
					var datas = rows.map(row =>"'"+row.id+"'").join(',');
					var json = nui.encode({
						'datas' : datas
					});
					nui.ajax({
						url : "com.zhonghe.ame.finance.budgetFilling.deleteBudgetFilling.biz.ext",
						type : 'POST',
						data : json,
						contentType : 'text/json',
						success : function(o) {
							if (o.result == 1) {
								showTips("删除成功");
								budgetFillingGrid.reload();
							} else {
								showTips("删除失败，请联系信息技术部人员！", "danger");
							}
						}
					});
				}
			}
		}		

		function search() {
			var data = budgetFillingForm.getData();
			budgetFillingGrid.load(data);
		}

		function reset() {
			budgetFillingForm.reset();
			init();
		}
	</script>

</body>
</html>