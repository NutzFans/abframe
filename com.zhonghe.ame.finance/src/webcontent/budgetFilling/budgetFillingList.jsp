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
								<a class="nui-button" id="budgetFillingExport" iconCls="icon-download" onclick="budgetFillingExport()">导出</a>
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
						<div width="100" headerAlign="center" align="center" renderer="fillInDetails">填报明细</div>
						<div field="fillingStage" width="100" headerAlign="center" align="center">填报阶段</div>
					</div>
				</div>
			</div>
		</div>

		<div name="hjydDimTab" title="合计 - 月度" visible="false">
			<div id="totalMonthForm">
				<div class="nui-toolbar" style="border-bottom: 0; padding: 5px;">
					<table>
						<tr>
							<td style="width: 60px; text-align: right;">预算年份:</td>
							<td>
								<input id="totalMonthYear" class="nui-textbox" style="width: 100px" />
							</td>
							<td>
								<a class="nui-button" id="totalMonthSearch" iconCls="icon-search" onclick="totalMonthSearch()">查询</a>
								<a class="nui-button" id="totalMonthReset" iconCls="icon-reload" onclick="totalMonthReset()">重置</a>
								<a class="nui-button" id="totalFillingExport" iconCls="icon-download" onclick="totalFillingExport()">导出</a>
							</td>
						</tr>
					</table>
				</div>
			</div>
			<div class="nui-fit">
				<div class="mini-panel" title="第一部分：财务报表" showCollapseButton="true" expanded="true" style="width: 100%; height: 650px;">
					<div id="totalMonthCwbbTreeGrid" class="mini-treegrid" showTreeIcon="false" treeColumn="name" idField="id" parentField="parent" resultAsTree="false" allowMoveColumn="false"
						allowResizeColumn="false" allowResize="false" style="width: 100%; height: 600px" frozenStartColumn="0" frozenEndColumn="2">
						<div property="columns">
							<div field="serial_number" width="60" headerAlign="center" align="center">序号</div>
							<div name="name" field="name" width="200" headerAlign="center" align="left">填报项</div>
							<div field="total_amount" width="150" headerAlign="center" align="center" dataType="currency">合计</div>
							<div field="jan_amount" width="150" headerAlign="center" align="center" dataType="currency">1月</div>
							<div field="feb_amount" width="150" headerAlign="center" align="center" dataType="currency">2月</div>
							<div field="mar_amount" width="150" headerAlign="center" align="center" dataType="currency">3月</div>
							<div field="apr_amount" width="150" headerAlign="center" align="center" dataType="currency">4月</div>
							<div field="may_amount" width="150" headerAlign="center" align="center" dataType="currency">5月</div>
							<div field="jun_amount" width="150" headerAlign="center" align="center" dataType="currency">6月</div>
							<div field="jul_amount" width="150" headerAlign="center" align="center" dataType="currency">7月</div>
							<div field="aug_amount" width="150" headerAlign="center" align="center" dataType="currency">8月</div>
							<div field="sep_amount" width="150" headerAlign="center" align="center" dataType="currency">9月</div>
							<div field="oct_amount" width="150" headerAlign="center" align="center" dataType="currency">10月</div>
							<div field="nov_amount" width="150" headerAlign="center" align="center" dataType="currency">11月</div>
							<div field="dec_amount" width="150" headerAlign="center" align="center" dataType="currency">12月</div>
						</div>
					</div>
				</div>
				<div class="mini-panel" title="第二部分：人员及人均情况" showCollapseButton="true" expanded="true" style="width: 100%; height: 300px;">
					<div id="totalMonthRyjrjqkTreeGrid" class="mini-treegrid" showTreeIcon="false" treeColumn="name" idField="id" parentField="parent" resultAsTree="false" allowMoveColumn="false"
						allowResizeColumn="false" allowResize="false" style="width: 100%; height: 250px" frozenStartColumn="0" frozenEndColumn="2">
						<div property="columns">
							<div field="serial_number" width="60" headerAlign="center" align="center">序号</div>
							<div name="name" field="name" width="200" headerAlign="center" align="left">填报项</div>
							<div field="average_actual" width="150" headerAlign="center" align="center" dataType="currency">平均实际</div>
							<div field="jan" width="150" headerAlign="center" align="center" dataType="currency">1月</div>
							<div field="feb" width="150" headerAlign="center" align="center" dataType="currency">2月</div>
							<div field="mar" width="150" headerAlign="center" align="center" dataType="currency">3月</div>
							<div field="apr" width="150" headerAlign="center" align="center" dataType="currency">4月</div>
							<div field="may" width="150" headerAlign="center" align="center" dataType="currency">5月</div>
							<div field="jun" width="150" headerAlign="center" align="center" dataType="currency">6月</div>
							<div field="jul" width="150" headerAlign="center" align="center" dataType="currency">7月</div>
							<div field="aug" width="150" headerAlign="center" align="center" dataType="currency">8月</div>
							<div field="sep" width="150" headerAlign="center" align="center" dataType="currency">9月</div>
							<div field="oct" width="150" headerAlign="center" align="center" dataType="currency">10月</div>
							<div field="nov" width="150" headerAlign="center" align="center" dataType="currency">11月</div>
							<div field="dec" width="150" headerAlign="center" align="center" dataType="currency">12月</div>
						</div>
					</div>
				</div>
				<div class="mini-panel" title="第三部分：劳动生产率" showCollapseButton="true" expanded="true" style="width: 100%; height: 350px;">
					<div id="totalMonthLdsclTreeGrid" class="mini-treegrid" showTreeIcon="false" treeColumn="name" idField="id" parentField="parent" resultAsTree="false" allowMoveColumn="false"
						allowResizeColumn="false" allowResize="false" style="width: 100%; height: 303px" frozenStartColumn="0" frozenEndColumn="2">
						<div property="columns">
							<div field="serial_number" width="60" headerAlign="center" align="center">序号</div>
							<div name="name" field="name" width="200" headerAlign="center" align="left">填报项</div>
							<div field="total_amount" width="150" headerAlign="center" align="center" dataType="currency">合计</div>
							<div field="jan_amount" width="150" headerAlign="center" align="center" dataType="currency">1月</div>
							<div field="feb_amount" width="150" headerAlign="center" align="center" dataType="currency">2月</div>
							<div field="mar_amount" width="150" headerAlign="center" align="center" dataType="currency">3月</div>
							<div field="apr_amount" width="150" headerAlign="center" align="center" dataType="currency">4月</div>
							<div field="may_amount" width="150" headerAlign="center" align="center" dataType="currency">5月</div>
							<div field="jun_amount" width="150" headerAlign="center" align="center" dataType="currency">6月</div>
							<div field="jul_amount" width="150" headerAlign="center" align="center" dataType="currency">7月</div>
							<div field="aug_amount" width="150" headerAlign="center" align="center" dataType="currency">8月</div>
							<div field="sep_amount" width="150" headerAlign="center" align="center" dataType="currency">9月</div>
							<div field="oct_amount" width="150" headerAlign="center" align="center" dataType="currency">10月</div>
							<div field="nov_amount" width="150" headerAlign="center" align="center" dataType="currency">11月</div>
							<div field="dec_amount" width="150" headerAlign="center" align="center" dataType="currency">12月</div>
						</div>
					</div>
				</div>
				<div class="mini-panel" title="第四部分：人工成本-全口径" showCollapseButton="true" expanded="true" style="width: 100%; height: 380px;">
					<div id="totalMonthRgcbqkjTreeGrid" class="mini-treegrid" showTreeIcon="false" treeColumn="name" idField="id" parentField="parent" resultAsTree="false" allowMoveColumn="false"
						allowResizeColumn="false" allowResize="false" style="width: 100%; height: 330px" frozenStartColumn="0" frozenEndColumn="2">
						<div property="columns">
							<div field="serial_number" width="60" headerAlign="center" align="center">序号</div>
							<div name="name" field="name" width="200" headerAlign="center" align="left">填报项</div>
							<div field="total_amount" width="150" headerAlign="center" align="center" dataType="currency">合计</div>
							<div field="jan_amount" width="150" headerAlign="center" align="center" dataType="currency">1月</div>
							<div field="feb_amount" width="150" headerAlign="center" align="center" dataType="currency">2月</div>
							<div field="mar_amount" width="150" headerAlign="center" align="center" dataType="currency">3月</div>
							<div field="apr_amount" width="150" headerAlign="center" align="center" dataType="currency">4月</div>
							<div field="may_amount" width="150" headerAlign="center" align="center" dataType="currency">5月</div>
							<div field="jun_amount" width="150" headerAlign="center" align="center" dataType="currency">6月</div>
							<div field="jul_amount" width="150" headerAlign="center" align="center" dataType="currency">7月</div>
							<div field="aug_amount" width="150" headerAlign="center" align="center" dataType="currency">8月</div>
							<div field="sep_amount" width="150" headerAlign="center" align="center" dataType="currency">9月</div>
							<div field="oct_amount" width="150" headerAlign="center" align="center" dataType="currency">10月</div>
							<div field="nov_amount" width="150" headerAlign="center" align="center" dataType="currency">11月</div>
							<div field="dec_amount" width="150" headerAlign="center" align="center" dataType="currency">12月</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div name="hjztDimTab" title="合计 - 主体" visible="false">
			<div id="totalZTForm">
				<div class="nui-toolbar" style="border-bottom: 0; padding: 5px;">
					<table>
						<tr>
							<td style="width: 60px; text-align: right;">预算年份:</td>
							<td>
								<input id="totalZTYear" class="nui-textbox" style="width: 100px" />
							</td>
							<td>
								<a class="nui-button" id="totalZTSearch" iconCls="icon-search" onclick="totalZTSearch()">查询</a>
								<a class="nui-button" id="totalZTReset" iconCls="icon-reload" onclick="totalZTReset()">重置</a>
								<a class="nui-button" id="totalZTExport" iconCls="icon-download" onclick="totalZTExport()">导出</a>
							</td>
						</tr>
					</table>
				</div>
			</div>
			<div class="nui-fit">
				<div class="mini-panel" title="第一部分：财务报表" showCollapseButton="true" expanded="true" style="width: 100%; height: 650px;">
					<div id="totalZTCwbbTreeGrid" class="mini-treegrid" showTreeIcon="false" treeColumn="name" idField="id" parentField="parent" resultAsTree="false" allowMoveColumn="false" allowResizeColumn="false"
						allowResize="false" style="width: 100%; height: 600px"></div>
				</div>
				<div class="mini-panel" title="第二部分：人员及人均情况" showCollapseButton="true" expanded="true" style="width: 100%; height: 300px;">
					<div id="totalZTRyjrjqkTreeGrid" class="mini-treegrid" showTreeIcon="false" treeColumn="name" idField="id" parentField="parent" resultAsTree="false" allowMoveColumn="false"
						allowResizeColumn="false" allowResize="false" style="width: 100%; height: 250px"></div>
				</div>
				<div class="mini-panel" title="第三部分：劳动生产率" showCollapseButton="true" expanded="true" style="width: 100%; height: 350px;">
					<div id="totalZTLdsclTreeGrid" class="mini-treegrid" showTreeIcon="false" treeColumn="name" idField="id" parentField="parent" resultAsTree="false" allowMoveColumn="false"
						allowResizeColumn="false" allowResize="false" style="width: 100%; height: 303px"></div>
				</div>
				<div class="mini-panel" title="第四部分：人工成本-全口径" showCollapseButton="true" expanded="true" style="width: 100%; height: 380px;">
					<div id="totalZTRgcbqkjTreeGrid" class="mini-treegrid" showTreeIcon="false" treeColumn="name" idField="id" parentField="parent" resultAsTree="false" allowMoveColumn="false"
						allowResizeColumn="false" allowResize="false" style="width: 100%; height: 330px"></div>
				</div>
			</div>
		</div>
	</div>

	<form name="viewlist1" id="viewlist1" action="com.primeton.eos.ame_common.ameExportCommon.flow" method="post">
		<input type="hidden" name="_eosFlowAction" value="action0" filter="false" />
		<input type="hidden" name="downloadFile" filter="false" />
		<input type="hidden" name="fileName" filter="false" />
	</form>

	<script type="text/javascript">
		nui.parse();
		var budgetFillingForm = new nui.Form("#budgetFillingForm");
		var budgetFillingGrid = nui.get("#budgetFillingGrid");
		var totalMonthCwbbTreeGrid = nui.get("#totalMonthCwbbTreeGrid");
		var totalMonthRyjrjqkTreeGrid = nui.get("#totalMonthRyjrjqkTreeGrid");
		var totalMonthLdsclTreeGrid = nui.get("#totalMonthLdsclTreeGrid");
		var totalMonthRgcbqkjTreeGrid = nui.get("#totalMonthRgcbqkjTreeGrid");
		var totalZTCwbbTreeGrid = nui.get("#totalZTCwbbTreeGrid");
		var totalZTRyjrjqkTreeGrid = nui.get("#totalZTRyjrjqkTreeGrid");
		var totalZTLdsclTreeGrid = nui.get("#totalZTLdsclTreeGrid");
		var totalZTRgcbqkjTreeGrid = nui.get("#totalZTRgcbqkjTreeGrid");
		
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
			} else if(e.tab.title == "合计 - 月度"){
				hjydInit();
			} else if(e.tab.title == "合计 - 主体"){
				hjztInit();
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
			var date = new Date();
			date.setMonth(date.getMonth() - 1);
			var year = date.getFullYear();
			nui.get("budgetYear").setValue(year);
			search();
		}
		
		function hjydInit(){
			var date = new Date();
			date.setMonth(date.getMonth() - 1);
			var year = date.getFullYear();
			nui.get("totalMonthYear").setValue(year);
			totalMonthSearch();
		}
		
		function hjztInit(){
			var date = new Date();
			date.setMonth(date.getMonth() - 1);
			var year = date.getFullYear();
			nui.get("totalZTYear").setValue(year);
			totalZTSearch();
		}
		
		function totalMonthSearch(){
			var budgetYear = nui.get("totalMonthYear").getValue();
			var json = nui.encode({
				'budgetYear' : budgetYear
			});
			ajaxCommon({
				url : "com.zhonghe.ame.finance.budgetFilling.queryTotalMonthDatas.biz.ext",
				contentType : 'text/json',
				async : false,
				data : json,
				success : function(result) {
					var cwbbDatas = result.totalMonthDatas.cwbb !=null ? result.totalMonthDatas.cwbb : [];
					var ryjrjqkDatas = result.totalMonthDatas.ryjrjqk !=null ? result.totalMonthDatas.ryjrjqk : [];
					var rgcbqkjDatas = result.totalMonthDatas.rgcbqkj !=null ? result.totalMonthDatas.rgcbqkj : [];
					var ldsclDatas = result.totalMonthDatas.ldscl !=null ? result.totalMonthDatas.ldscl : [];
					totalMonthCwbbTreeGrid.loadList(cwbbDatas, "id", "parent");
					totalMonthRyjrjqkTreeGrid.loadList(ryjrjqkDatas, "id", "parent");
					totalMonthRgcbqkjTreeGrid.loadList(rgcbqkjDatas, "id", "parent");
					totalMonthLdsclTreeGrid.loadList(ldsclDatas, "id", "parent");
				}
			});
		}
		
		function totalMonthReset() {
			hjydInit();
		}		
		
		function totalZTSearch(){
			var budgetYear = nui.get("totalZTYear").getValue();
			var json = nui.encode({
				'budgetYear' : budgetYear
			});
			ajaxCommon({
				url : "com.zhonghe.ame.finance.budgetFilling.queryTotalZTDatas.biz.ext",
				contentType : 'text/json',
				async : false,
				data : json,
				success : function(result) {
					var columnDatas = result.totalZTDatas.column;
					var ryjrjqkColumnDatas = result.totalZTDatas.ryjrjqkColumn;
					totalZTCwbbTreeGrid.set({
						columns: columnDatas
					});
					totalZTRyjrjqkTreeGrid.set({
						columns: ryjrjqkColumnDatas
					});
					totalZTRgcbqkjTreeGrid.set({
						columns: columnDatas
					});
					totalZTLdsclTreeGrid.set({
						columns: columnDatas
					});
					var cwbbDatas = result.totalZTDatas.cwbb !=null ? result.totalZTDatas.cwbb : [];
					totalZTCwbbTreeGrid.loadList(cwbbDatas, "id", "parent");
					totalZTCwbbTreeGrid.setFrozenStartColumn(0);
					totalZTCwbbTreeGrid.setFrozenEndColumn(2);
					var ryjrjqkDatas = result.totalZTDatas.ryjrjqk !=null ? result.totalZTDatas.ryjrjqk : [];
					totalZTRyjrjqkTreeGrid.loadList(ryjrjqkDatas, "id", "parent");
					totalZTRyjrjqkTreeGrid.setFrozenStartColumn(0);
					totalZTRyjrjqkTreeGrid.setFrozenEndColumn(2);
					var rgcbqkjDatas = result.totalZTDatas.rgcbqkj !=null ? result.totalZTDatas.rgcbqkj : [];
					totalZTRgcbqkjTreeGrid.loadList(rgcbqkjDatas, "id", "parent");
					totalZTRgcbqkjTreeGrid.setFrozenStartColumn(0);
					totalZTRgcbqkjTreeGrid.setFrozenEndColumn(2);
					var ldsclDatas = result.totalZTDatas.ldscl !=null ? result.totalZTDatas.ldscl : [];
					totalZTLdsclTreeGrid.loadList(ldsclDatas, "id", "parent");
					totalZTLdsclTreeGrid.setFrozenStartColumn(0);
					totalZTLdsclTreeGrid.setFrozenEndColumn(2);					
				}
			});						
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
					showCloseButton : false,
					allowResize : false,
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
		
		function fillInDetails(e){
			var s = "<a  href='javascript:void(0)' onclick='fillInDetailsView();' >查看</a>";
			return s
		}
		
		function fillInDetailsView(){
			var row = budgetFillingGrid.getSelected();
			executeUrl = "/default/finance/budgetFilling/tbsjBudgetFilling.jsp?id=" + row.id;
			window.open(executeUrl);
		}
		
		function budgetFillingExport() {
			var rows = budgetFillingGrid.getSelecteds();
			if(rows.length != 0){
				var ids = rows.map(row => row.id).join(',');
				var data = {
					"ids" : ids
				};
				exportExcel({
					"data" : data,
					"url" : "com.zhonghe.ame.finance.budgetFilling.exportBudgetFillingExcel.biz.ext",
					"fileName" : "年度预算填报"
				})
			}else{
				showTips("请通过复选框选中要导出的数据", "danger");
				return;
			}
		}
		
		function totalFillingExport(){
			var budgetYear = nui.get("totalMonthYear").getValue();
			var data = {
				"budgetYear": budgetYear
			};
			exportExcel({
				"data" : data,
				"url" : "com.zhonghe.ame.finance.budgetFilling.exportMonthFillingExcel.biz.ext",
				"fileName" : "年度预算填报_(合计-月度)"
			})
		}
		
		function totalZTExport(){
			var budgetYear = nui.get("totalZTYear").getValue();
			var data = {
				"budgetYear": budgetYear
			};
			exportExcel({
				"data" : data,
				"url" : "com.zhonghe.ame.finance.budgetFilling.exportZTFillingExcel.biz.ext",
				"fileName" : "年度预算填报_(合计-主体)"
			})
		}				
		
	</script>

</body>
</html>