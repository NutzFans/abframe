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
<title>年度采购计划</title>
</head>
<body>
	<div id="tabs" class="nui-tabs" activeIndex="0" style="width: auto; height: 99%; padding: 5px;" onactivechanged="tabActiveChanged">
		<div title="年度采购计划">
			<div style="width: auto; height: 99%; padding: 5px;">
				<div id="purPlanForm">
					<div class="nui-toolbar" style="border-bottom: 0; padding: 5px;">
						<table>
							<tr>
								<td style="width: 70px; text-align: right;">计划年度:</td>
								<td style="width: 105px">
									<input name="criteria._expr[3].year" class="nui-textbox" style="width: 100px" />
								</td>
								<td style="width: 60px; text-align: right;">经办人:</td>
								<td style="width: 105px">
									<input name="criteria._expr[1].createdUsername" class="nui-textbox" style="width: 100px" id="createUsername" />
									<input class="nui-hidden" name="criteria._expr[1]._op" value="like" />
									<input name="criteria._expr[10]._value" class="nui-hidden" id="createdBy" />
									<input class="nui-hidden" name="criteria._expr[10]._property" value="createdBy" />
									<input class="nui-hidden" name="criteria._expr[10]._op" value="=" />
								</td>
								<td style="width: 90px; text-align: right;">采购计划单位:</td>
								<td style="width: 155px">
									<input class="nui-hidden" name="criteria._expr[2]._property" value="needOrgId" />
									<input class="nui-hidden" name="criteria._expr[2]._op" value="in" id="tempCond1" />
									<input class="nui-hidden" name="criteria._expr[2]._ref" value="" id="tempCond2" />
									<input class="nui-hidden" name="criteria._ref[0]._id" value="1" />
									<input class="nui-hidden" name="criteria._ref[0]._entity" value="org.gocom.abframe.dataset.organization.OmOrganization" />
									<input class="nui-hidden" name="criteria._ref[0]._select._field[0]" value="orgid" />
									<input class="nui-hidden" name="criteria._ref[0]._expr[0]._property" value="orgseq" />
									<input class="nui-hidden" name="criteria._ref[0]._expr[0]._op" value="like" />
									<input class="nui-hidden" name="criteria._ref[0]._expr[0]._likeRule" value="end" />
									<input id="orgid2" name="criteria._ref[0]._expr[0]._value" style="width: 150px" class="nui-combobox" textField="orgname" valueField="orgseq" dataField="orgs" showNullItem="true"
										allowInput="true" />
									<input class="nui-hidden" name="criteria._expr[11]._property" value="needOrgId" />
									<input class="nui-hidden" name="criteria._expr[11]._op" value="in" />
									<input class="nui-hidden" name="criteria._expr[11]._value" id="orgids2" />
								</td>
								<td style="width: 80px; text-align: right;">采购计划名称:</td>
								<td>
									<input name="criteria._expr[4]._value" class="nui-textbox" style="width: 228px" />
									<input class="nui-hidden" name="criteria._expr[4]._property" value="name" />
									<input class="nui-hidden" name="criteria._expr[4]._op" value="like" />
								</td>
							</tr>
							<tr>
								<td style="width: 60px; text-align: right;">计划类型:</td>
								<td style="width: 105px">
									<input name="criteria._expr[5].extend2" class="nui-dictcombobox" dictTypeId="CG_PLAN_TYPE" showNullItem="true" nullItemText="全部" style="width: 100px" />
								</td>
								<td style="width: 60px; text-align: right;">采购类型:</td>
								<td style="width: 105px">
									<input name="criteria._expr[6].type" class="nui-dictcombobox" dictTypeId="ZH_PURCHASE_NEW" showNullItem="true" nullItemText="全部" style="width: 100px" />
								</td>
								<td style="width: 70px; text-align: right;">是否有变更:</td>
								<td style="width: 155px">
									<input name="criteria._expr[7].changeState" class="nui-dictcombobox" dictTypeId="CG_PLAN_CHANGE" showNullItem="true" nullItemText="全部" style="width: 150px" />
								</td>
								<td style="width: 60px; text-align: right;">审批状态:</td>
								<td>
									<input name="criteria._expr[8].status" class="nui-dictcombobox" dictTypeId="ZH_FLOW_TYPE" showNullItem="true" nullItemText="全部" style="width: 100px" />
									<a class="nui-button" id="search" iconCls="icon-search" onclick="purPlanSearch()">查询</a>
									<a class="nui-button" id="reset" iconCls="icon-reload" onclick="purPlanReset()">重置</a>
								</td>
							</tr>
						</table>
					</div>
				</div>

				<div class="nui-toolbar" style="border-bottom: 0; padding: 5px;">
					<table style="width: 100%;">
						<tr>
							<td>
								<a class="nui-button" id="cgjh_add" iconCls="icon-add" onclick="add()">年度计划</a>
								<a class="nui-button" id="cgjh_temp" iconCls="icon-add" onclick="addTemp()">临时计划</a>
								<a class="nui-button" id="cgjh_change" iconCls="icon-add" onclick="changePlan()">计划变更</a>
								<a class="nui-button" id="edit" iconCls="icon-edit" onclick="zc_edit()">编辑</a>
								<a class="nui-button" id="del" iconCls="icon-remove" onclick="deleteInfo()">删除</a>
								<a class="nui-button" id="cgjh_zf" iconCls="icon-edit" onclick="zf_edit()">作废</a>
								<a class="nui-button" id="cgjh_exportExcel" iconCls="icon-download" onclick="onPurPlanExportExcel()">导出</a>
								<a class="nui-button" id="cgjh_print" iconCls="icon-print" onclick="print()">打印</a>
								<a class="nui-button" id="cgjh_help" iconCls="icon-help" onclick="help()">帮助</a>
								<a class="nui-button" id="cgjh_help_bcbg" iconCls="icon-help" onclick="help_bcbg()">帮助(补充/变更)</a>
							</td>
						</tr>
					</table>
				</div>

				<div class="nui-fit">
					<div id="purPlanGrid" frozenStartColumn="0" sizeList="[25,50,100]" pageSize="25" showPager="true" dataField="data" class="nui-datagrid" style="width: 100%; height: 100%;"
						url="com.zhonghe.ame.purchase.purchaseItems.queryPurPlanList.biz.ext" multiSelect="false" allowSortColumn="true">
						<div property="columns">
							<div name="temp123" type="checkcolumn"></div>
							<div type="indexcolumn" align="center" headerAlign="center">序号</div>
							<div field="createdUsername" width="50" align="center" headerAlign="center">经办人</div>
							<div field="needOrgName" width="120" align="center" headerAlign="center">采购计划单位</div>
							<div field="year" width="50" align="center" headerAlign="center" allowSort="true">计划年度</div>
							<div field="name" width="200" align="center" headerAlign="center" renderer="lookInfo">采购计划名称</div>
							<div field="status" width="60" align="center" headerAlign="center" renderer="onActionRenderer">审批状态</div>
							<div field="budgetAmount" width="80" align="center" headerAlign="center">计划金额（万元）</div>
							<div field="newBudgetAmount" width="85" align="center" headerAlign="center" renderer="changeBudgetRenderer">变更后计划金额（万元）</div>
							<div field="extend2" width="60" align="center" headerAlign="center" renderer="CG_PLAN_TYPE">计划类型</div>
							<div field="type" width="60" align="center" headerAlign="center" renderer="ZH_PURCHASE_NEW">采购类型</div>
							<div field="changeState" width="60" align="center" headerAlign="center" renderer="CG_PLAN_CHANGE">是否有变更</div>
							<div field="sumamountRate" width="80" align="center" headerAlign="center" renderer="sumamountRateRenderer">计划执行情况(%)</div>
							<div field="createdTime" width="80" align="center" headerAlign="center" dateFormat="yyyy-MM-dd" allowSort="true">申请时间</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div name="purPlanItemTab" title="采购计划明细">
			<div style="width: auto; height: 99%; padding: 5px;">
				<div id="purPlanItemForm">
					<div class="nui-toolbar" style="border-bottom: 0; padding: 5px;">
						<table>
							<tr>
								<td style="width: 70px; text-align: right;">计划年度:</td>
								<td style="width: 105px">
									<input name="criteria._expr[3].year" class="nui-textbox" style="width: 100px" />
								</td>
								<td style="width: 60px; text-align: right;">经办人:</td>
								<td style="width: 105px">
									<input name="criteria._expr[1].createdUsername" class="nui-textbox" style="width: 100px" id="createUsernameItem" />
									<input class="nui-hidden" name="criteria._expr[1]._op" value="like" />
									<input name="criteria._expr[10]._value" class="nui-hidden" id="createdByItem" />
									<input class="nui-hidden" name="criteria._expr[10]._property" value="createdBy" />
									<input class="nui-hidden" name="criteria._expr[10]._op" value="=" />
								</td>
								<td style="width: 90px; text-align: right;">采购计划单位:</td>
								<td style="width: 155px">
									<input class="nui-hidden" name="criteria._expr[2]._property" value="needOrgId" />
									<input class="nui-hidden" name="criteria._expr[2]._op" value="in" id="tempCondItem" />
									<input class="nui-hidden" name="criteria._expr[2]._ref" value="" id="tempCondItem2" />
									<input class="nui-hidden" name="criteria._ref[0]._id" value="1" />
									<input class="nui-hidden" name="criteria._ref[0]._entity" value="org.gocom.abframe.dataset.organization.OmOrganization" />
									<input class="nui-hidden" name="criteria._ref[0]._select._field[0]" value="orgid" />
									<input class="nui-hidden" name="criteria._ref[0]._expr[0]._property" value="orgseq" />
									<input class="nui-hidden" name="criteria._ref[0]._expr[0]._op" value="like" />
									<input class="nui-hidden" name="criteria._ref[0]._expr[0]._likeRule" value="end" />
									<input id="orgidItem" name="criteria._ref[0]._expr[0]._value" style="width: 150px" class="nui-combobox" textField="orgname" valueField="orgseq" dataField="orgs" showNullItem="true"
										allowInput="true" />
									<input class="nui-hidden" name="criteria._expr[11]._property" value="needOrgId" />
									<input class="nui-hidden" name="criteria._expr[11]._op" value="in" />
									<input class="nui-hidden" name="criteria._expr[11]._value" id="orgidsItem" />
								</td>
								<td style="width: 80px; text-align: right;">采购计划名称:</td>
								<td style="width: 155px">
									<input name="criteria._expr[4]._value" class="nui-textbox" style="width: 150px" />
									<input class="nui-hidden" name="criteria._expr[4]._property" value="name" />
									<input class="nui-hidden" name="criteria._expr[4]._op" value="like" />
								</td>
								<td style="width: 80px; text-align: right;">采购物项名称:</td>
								<td style="width: 155px">
									<input name="criteria._expr[5]._value" class="nui-textbox" style="width: 150px" />
									<input class="nui-hidden" name="criteria._expr[5]._property" value="materialName" />
									<input class="nui-hidden" name="criteria._expr[5]._op" value="like" />
								</td>
							</tr>
							<tr>
								<td style="width: 60px; text-align: right;">采购类型:</td>
								<td style="width: 105px">
									<input name="criteria._expr[6].type" class="nui-dictcombobox" dictTypeId="ZH_PURCHASE_NEW" showNullItem="true" nullItemText="全部" style="width: 100px" />
								</td>
								<td style="width: 80px; text-align: right;">物项归口部门:</td>
								<td style="width: 105px">
									<input name="criteria._expr[8].centralizedDept" class="nui-dictcombobox" dictTypeId="ZH_PUTUNDER" shownullItem="true" nullItemText="全部" style="width: 100px" />
								</td>
								<td style="width: 80px; text-align: right;">物项大类:</td>
								<td style="width: 155px">
									<input name="criteria._expr[9].purchaseFirstName" class="nui-textbox" style="width: 150px" />
								</td>
								<td style="width: 80px; text-align: right;">物项中类:</td>
								<td style="width: 155px">
									<input name="criteria._expr[20].purchaseTwoName" class="nui-textbox" style="width: 150px" />
								</td>
								<td style="width: 80px; text-align: right;">计划编码:</td>
								<td style="width: 155px">
									<input name="criteria._expr[21].code" class="nui-textbox" style="width: 150px" />
								</td>
								<td>
									<a class="nui-button" id="search" iconCls="icon-search" onclick="purPlanItemSearch()">查询</a>
									<a class="nui-button" id="reset" iconCls="icon-reload" onclick="purPlanItemReset()">重置</a>
								</td>
							</tr>
						</table>
					</div>
				</div>

				<div class="nui-toolbar" style="border-bottom: 0; padding: 5px;">
					<table style="width: 100%;">
						<tr>
							<td>
								<a class="nui-button" id="cgjhItem_exportExcel" iconCls="icon-download" onclick="onPurPlanItemExportExcel()">导出</a>
							</td>
						</tr>
					</table>
				</div>

				<div class="nui-fit">
					<div id="purPlanItemGrid" frozenStartColumn="0" frozenEndColumn="4" sizeList="[25,50,100]" pageSize="25" showPager="true" dataField="data" class="nui-datagrid" style="width: 100%; height: 100%;"
						url="com.zhonghe.ame.purchase.purchaseItems.queryPurPlanItemList.biz.ext" multiSelect="false" allowSortColumn="true">
						<div property="columns">
							<div name="temp123" type="checkcolumn"></div>
							<div type="indexcolumn" align="center" headerAlign="center">序号</div>
							<div field="code" width="150" align="center" headerAlign="center">计划编号</div>
							<div field="year" width="60" align="center" headerAlign="center" allowSort="true">计划年度</div>
							<div field="name" width="250" align="center" headerAlign="center">采购计划名称</div>
							<div field="type" width="70" align="center" headerAlign="center" renderer="ZH_PURCHASE_NEW">采购类型</div>
							<div field="createdUsername" width="70" align="center" headerAlign="center">经办人</div>
							<div field="needOrgName" width="150" align="center" headerAlign="center">采购计划单位</div>
							<div field="materialName" width="250" align="center" headerAlign="center">采购物项名称</div>
							<div field="purchaseFirstName" width="130" align="center" headerAlign="center">物项大类</div>
							<div field="purchaseTwoName" width="130" align="center" headerAlign="center">物项中类</div>
							<div field="centralizedDept" width="150" align="center" headerAlign="center" renderer="ZH_PUTUNDER">物项归口部门</div>
							<div field="budgetAmount" width="100" align="center" headerAlign="center">计划金额（万元）</div>
							<div field="newBudgetAmount" width="140" align="center" headerAlign="center" renderer="changeBudgetRenderer">变更后计划金额（万元）</div>
							<div field="sumamount" width="130" align="center" headerAlign="center">已立项金额(万元)</div>
							<div field="sumamountRate" width="100" align="center" headerAlign="center" renderer="sumamountRateRenderer">计划执行情况(%)</div>
							<div field="updatedTime" width="80" align="center" headerAlign="center" dateFormat="yyyy-MM-dd" allowSort="true">申请时间</div>
						</div>
					</div>
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
		var purPlanForm = new nui.Form("#purPlanForm");
		var purPlanGrid = nui.get("purPlanGrid");
		var purPlanItemForm = new nui.Form("#purPlanItemForm");
		var purPlanItemGrid = nui.get("purPlanItemGrid");
		var tabs = nui.get("tabs");

		function tabActiveChanged(e) {
			if (e.tab.title == "年度采购计划") {
				purPlanInit();
			} else if (e.tab.title == "采购计划明细") {
				purPlanItemInit();
			}
		}

		function purPlanInit() {
			//按钮权限的控制
			getOpeatorButtonAuth("cgjh_exportExcel,cgjh_zf,cgjh_add,cgjh_help,cgjh_help_bcbg");
			//code:对应功能编码，map：对于机构的查询条件
			var json = {
				"code" : "cgjh"
			};
			nui.ajax({
				url : "com.primeton.eos.ame_auth.ame_auth.getownorg1.biz.ext",
				data : json,
				type : 'POST',
				contentType : 'text/json',
				success : function(text) {
					if (text.orgs) {
						if (text.orgs.length == 0) {
							//当没有有权的机构时将申请人设置为登陆人
							nui.get("createdBy").setValue(userId);
							nui.get("createUsername").setValue(userName);
							nui.get("createUsername").setReadOnly(true);
						}
						//根据情况选择一种
						nui.get("orgid2").setData(text.orgs);
						nui.get("orgids2").setValue(text.orgids);
					} else {
						//当没有有权的机构时将申请人设置为登陆人
						nui.get("createdBy").setValue(userId);
						nui.get("createUsername").setValue(userName);
						nui.get("createUsername").setReadOnly(true);
					}
					purPlanSearch();
				}
			});
		}

		function purPlanSearch() {
			if (nui.get("orgid2").getValue() == "") {
				nui.get("tempCond1").setValue("=");
				nui.get("tempCond2").setValue("");
			} else {
				nui.get("tempCond1").setValue("in");
				nui.get("tempCond2").setValue("1");
			}
			var data = purPlanForm.getData(); //获取表单JS对象数据
			purPlanGrid.sortBy('createdTime', 'desc');
			purPlanGrid.load(data); //datagrid加载数据
		}

		function purPlanReset() {
			purPlanForm.reset();
			purPlanInit();
		}

		function purPlanItemInit() {
			//code:对应功能编码，map：对于机构的查询条件
			var json = {
				"code" : "cgjh"
			};
			nui.ajax({
				url : "com.primeton.eos.ame_auth.ame_auth.getownorg1.biz.ext",
				data : json,
				type : 'POST',
				contentType : 'text/json',
				success : function(text) {
					if (text.orgs) {
						if (text.orgs.length == 0) {
							//当没有有权的机构时将申请人设置为登陆人
							nui.get("createdByItem").setValue(userId);
							nui.get("createUsernameItem").setValue(userName);
							nui.get("createUsernameItem").setReadOnly(true);
						}
						//根据情况选择一种
						nui.get("orgidItem").setData(text.orgs);
						nui.get("orgidsItem").setValue(text.orgids);
					} else {
						//当没有有权的机构时将申请人设置为登陆人
						nui.get("createdByItem").setValue(userId);
						nui.get("createUsernameItem").setValue(userName);
						nui.get("createUsernameItem").setReadOnly(true);
					}
					purPlanItemSearch();
				}
			});
		}

		function purPlanItemSearch() {
			if (nui.get("orgidItem").getValue() == "") {
				nui.get("tempCondItem").setValue("=");
				nui.get("tempCondItem2").setValue("");
			} else {
				nui.get("tempCondItem").setValue("in");
				nui.get("tempCondItem2").setValue("1");
			}
			var data = purPlanItemForm.getData(); //获取表单JS对象数据
			purPlanItemGrid.sortBy('updatedTime', 'desc');
			purPlanItemGrid.load(data); //datagrid加载数据
		}

		function purPlanItemReset() {
			purPlanItemForm.reset();
			purPlanItemInit();
		}

		function add() {
			nui.open({
				url : "/default/purchase/purchasePlan/purchasePlanAdd.jsp",
				width : '100%',
				height : '100%',
				title : '新增年度采购计划',
				onload : function() {
					var iframe = this.getIFrameEl();
				},
				ondestroy : function(action) {
					purPlanReset();
				}
			})
		}

		function addTemp() {
			nui.open({
				url : "/default/purchase/purchasePlan/BCPurchasePlanAdd.jsp",
				width : '100%',
				height : '100%',
				title : '新增临时采购计划',
				onload : function() {
					var iframe = this.getIFrameEl();
				},
				ondestroy : function(action) {
					purPlanReset();
				}
			})
		}

		function changePlan() {
			var row = purPlanGrid.getSelecteds();
			if (row.length > 1 || row.length == 0) {
				showTips("只能选中一条记录发起计划变更！", "danger");
				return;
			}
			var data = row[0];
			if (data.status == "2") {
				if (data.extend2 == "0") {
					nui.open({
						url : "/default/purchase/purchasePlan/addPurchasePlanChange.jsp",
						width : '100%',
						height : '100%',
						title : "新增变更采购计划",
						onload : function() {
							var iframe = this.getIFrameEl();
							iframe.contentWindow.setEditData(data);
						},
						ondestroy : function(action) {
							purPlanSearch();
						}
					})
				} else {
					showTips("只能对计划类型为【年度计划】的记录发起计划变更！", "danger");
				}
			} else {
				showTips("只能对审批状态为【审批通过】的采购计划发起计划变更！", "danger");
			}
		}
		
		// 暂存编辑
		function zc_edit() {
			var row = purPlanGrid.getSelecteds();
			if (row.length > 1 || row.length == 0) {
				showTips("只能选中一条数据记录进行编辑", "danger");
				return;
			}
			var data = row[0];
			if (data.status == '0') {
				var json = {
					"processID" : data.processid
				};
				ajaxCommon({
					url : "com.zhonghe.ame.invoice.invoice.getWorkItemByProcessInstID.biz.ext",
					data : json,
					success : function(result) {
						if (JSON.stringify(result) !== '{}') {
							nui.open({
								url : "/default/bps/wfclient/task/dispatchTaskExecute.jsp?workItemID=" + result.workItemID,
								width : '100%',
								height : '100%',
								ondestroy : function(action) {
									purPlanGrid.reload();
									purPlanSearch();
								}
							})
						}
					}
				});
			} else {
				showTips("只能编辑审批状态为【草稿】的数据", "danger");
			}
		}
		
		function zf_edit() {
			var row = purPlanGrid.getSelecteds();
			if (row.length > 1 || row.length == 0) {
				showTips("只能选中一条项目记录进行作废", "danger");
				return;
			} else {
				var row = row[0];
				if (row.status == '2') {
					if (!confirm("是否作废？")) {
						return;
					} else {
						if (row) {
							var json = nui.encode({
								'data' : row
							});
							nui.ajax({
								url : "com.zhonghe.ame.purchase.purchaseItems.zfPurchasePlanById.biz.ext",
								type : 'POST',
								data : json,
								contentType : 'text/json',
								success : function(o) {
									if (o.result == 1) {
										showTips("作废成功");
										purPlanGrid.reload();
										purPlanSearch();
									} else if (o.result == 2) {
										showTips("有采购立项关联了该计划无法作废！", "danger");
									} else {
										showTips("作废失败，请联系信息技术部人员！", "danger");
									}
								}
							});
						} else {
							showTips("只能选中一条项目记录进行作废", "danger");
						}
					}
				} else {
					showTips("只能作废审批状态为【审批通过】的数据", "danger");
				}
			}
		}
		
		function deleteInfo() {
			var rows = purPlanGrid.getSelecteds();
			if (rows.length == 0) {
				showTips("请选中需要删除的数据记录", "danger");
			} else {
				var status = rows.every(item => item.status == '4');
				if(status){
					if (!confirm("是否删除？")) {
						return;
					}else{
						var datas = rows.map(row => ({ id: row.id }));
						var json = nui.encode({
							'datas' : datas
						});
						nui.ajax({
							url : "com.zhonghe.ame.purchase.purchaseItems.delPurPlan.biz.ext",
							type : 'POST',
							data : json,
							contentType : 'text/json',
							success : function(o) {
								if (o.result == 1) {
									showTips("删除成功");
									purPlanGrid.reload();
									purPlanSearch();
								} else {
									showTips("删除失败，请联系信息技术部人员！", "danger");
								}
							}
						});
					}
				}else{
					showTips("只能删除审批状态为【作废】的数据", "danger");
				}
			}
		}				
				

		function onActionRenderer(e) {
			var record = e.record;
			var processId = record.processid;
			var s = "<a  href='javascript:void(0)' onclick='feeView();' >" + nui.getDictText('ZH_FLOW_TYPE', e.value) + "</a>";
			return s;
		}

		function feeView() {
			var selectRow = purPlanGrid.getSelected();
			var processId = selectRow.processid;
			var url = "/default/bps/wfclient/task/processinstView.jsp";
			var title = "流程图查看";
			var width = 1000;
			nui.open({
				url : url,
				title : title,
				width : "100%",
				height : "100%",
				onload : function() {
					var iframe = this.getIFrameEl();
					if (iframe.contentWindow.initData) {
						iframe.contentWindow.initData({
							"processInstID" : processId
						});
					}
				}
			});
		}

		function CG_PLAN_TYPE(e) {
			return nui.getDictText('CG_PLAN_TYPE', e.value);
		}

		function ZH_PURCHASE_NEW(e) {
			return nui.getDictText('ZH_PURCHASE_NEW', e.value);
		}

		function CG_PLAN_CHANGE(e) {
			if(e.value == "1"){
				var id = e.row.id;
				var s = "<a  href='javascript:void(0)' onclick='changeItemView(" + id + ");' >" + nui.getDictText('CG_PLAN_CHANGE', e.value) + "</a>";
				return s;
			}else{
				return nui.getDictText('CG_PLAN_CHANGE', e.value);
			}
		}
		
		function changeItemView(id) {
			var executeUrl = "<%=request.getContextPath()%>/purchase/plan/changeItemView.jsp?id=" + id;
			window.open(executeUrl);
		}		

		function ZH_PUTUNDER(e) {
			return nui.getDictText('ZH_PUTUNDER', e.value);
		}

		function changeBudgetRenderer(e) {
			if (e.row.budgetAmount == e.value) {
				return "/";
			} else {
				return e.value;
			}
		}

		function sumamountRateRenderer(e) {
			if (e.row.extend2 == "2") {
				return "/";
			} else {
				return e.value;
			}
		}
		
		function lookInfo(e) {
			var id = e.row.id;
			var extend2 = e.row.extend2;
			if (id == 0 || id == null) {
				showTips("数据错误，请联系管理员", "danger");
			} else {
				return "<a href='javascript:void(0)' onclick='doView(" + id + ","+ extend2 +");' title='点击查看'>" + e.value + "</a>";
			}
		}
		
		function doView(id,extend2) {
			if(extend2=="2"){
				var executeUrl = "<%=request.getContextPath()%>/purchase/plan/changePurPlanDetailById.jsp?id=" + id;
				window.open(executeUrl);
			}else{
				var executeUrl = "<%=request.getContextPath()%>/purchase/plan/purPlanDetailById.jsp?id=" + id;
				window.open(executeUrl);
			}
		}
		
		function print() {
			var row = purPlanGrid.getSelected();
			if (row) {
				if(row.extend2 == "2"){
					executeUrl = "<%=request.getContextPath()%>/purchase/print/changePurPlanDetailPrint.jsp?id=" + row.id;
					window.open(executeUrl);				
				}else{
					executeUrl = "<%=request.getContextPath()%>/purchase/print/purPlanDetailPrint.jsp?id=" + row.id;
					window.open(executeUrl);
				}
			} else {
				showTips("请选中一条记录！", "danger");
			}
		}
		
		function onPurPlanExportExcel(){
			var data = purPlanForm.getData();
			exportExcel({"data":data,"url": "com.zhonghe.ame.purchase.exportExcel.exportaPurPlanList.biz.ext","fileName":"采购计划表"});
		}
		
		function onPurPlanItemExportExcel(){
			var data = purPlanItemForm.getData();
			exportExcel({"data":data,"url": "com.zhonghe.ame.purchase.exportExcel.exportaPurPlanItemList.biz.ext","fileName":"采购计划明细表"});
		}
		
		function help() {
			executeUrl = "<%=request.getContextPath()%>/purchase/purchasePlan/purchasePlanDesgin.jsp";
			window.open(executeUrl);
		}
		
		function help_bcbg(){
			executeUrl = "<%=request.getContextPath()%>/purchase/purchasePlan/purchasePlanBcbgDesgin.jsp";
			window.open(executeUrl);
		}										
		
	</script>

</body>
</html>