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
<title>填报数据 - 关联开票收款计划</title>
</head>
<body>
	<div class="nui-fit" style="padding: 5px;">
		<fieldset id="field1" style="border: solid 1px #aaa; padding: 5px;">
			<legend>合计信息</legend>
			<form id="totalForm" method="post">
				<input id="fillingIncomeId" name="id" class="nui-hidden" />
				<div style="padding: 5px;">
					<table style="table-layout: fixed;">
						<tr>
							<td align="right" style="width: 85px">填报年度：</td>
							<td>
								<input id="tbYear" class="nui-textbox" style="width: 120px" enabled="false" />
							</td>
							<td align="right" style="width: 85px">填报项：</td>
							<td colspan="3">
								<input id="tbName" class="nui-textbox" style="width: 100%" enabled="false" />
							</td>
							<td align="right" style="width: 85px">合计(不含税)：</td>
							<td>
								<input id="totalAmount" name="total_amount" class="mini-spinner" allowLimitValue="false" format="n2" style="width: 120px" showButton="false" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 85px">1月(不含税)：</td>
							<td>
								<input id="janAmount" name="jan_amount" class="mini-spinner" allowLimitValue="false" format="n2" style="width: 120px" showButton="false" enabled="false" />
							</td>
							<td align="right" style="width: 85px">2月(不含税)：</td>
							<td>
								<input id="febAmount" name="feb_amount" class="mini-spinner" allowLimitValue="false" format="n2" style="width: 120px" showButton="false" enabled="false" />
							</td>
							<td align="right" style="width: 85px">3月(不含税)：</td>
							<td>
								<input id="marAmount" name="mar_amount" class="mini-spinner" allowLimitValue="false" format="n2" style="width: 120px" showButton="false" enabled="false" />
							</td>
							<td align="right" style="width: 85px">4月(不含税)：</td>
							<td>
								<input id="aprAmount" name="apr_amount" class="mini-spinner" allowLimitValue="false" format="n2" style="width: 120px" showButton="false" enabled="false" />
							</td>
							<td align="right" style="width: 85px">5月(不含税)：</td>
							<td>
								<input id="mayAmount" name="may_amount" class="mini-spinner" allowLimitValue="false" format="n2" style="width: 120px" showButton="false" enabled="false" />
							</td>
							<td align="right" style="width: 85px">6月(不含税)：</td>
							<td>
								<input id="junAmount" name="jun_amount" class="mini-spinner" allowLimitValue="false" format="n2" style="width: 120px" showButton="false" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 85px">7月(不含税)：</td>
							<td>
								<input id="julAmount" name="jul_amount" class="mini-spinner" allowLimitValue="false" format="n2" style="width: 120px" showButton="false" enabled="false" />
							</td>
							<td align="right" style="width: 85px">8月(不含税)：</td>
							<td>
								<input id="augAmount" name="aug_amount" class="mini-spinner" allowLimitValue="false" format="n2" style="width: 120px" showButton="false" enabled="false" />
							</td>
							<td align="right" style="width: 85px">9月(不含税)：</td>
							<td>
								<input id="sepAmount" name="sep_amount" class="mini-spinner" allowLimitValue="false" format="n2" style="width: 120px" showButton="false" enabled="false" />
							</td>
							<td align="right" style="width: 85px">10月(不含税)：</td>
							<td>
								<input id="octAmount" name="oct_amount" class="mini-spinner" allowLimitValue="false" format="n2" style="width: 120px" showButton="false" enabled="false" />
							</td>
							<td align="right" style="width: 85px">11月(不含税)：</td>
							<td>
								<input id="novAmount" name="nov_amount" class="mini-spinner" allowLimitValue="false" format="n2" style="width: 120px" showButton="false" enabled="false" />
							</td>
							<td align="right" style="width: 85px">12月(不含税)：</td>
							<td>
								<input id="decAmount" name="dec_amount" class="mini-spinner" allowLimitValue="false" format="n2" style="width: 120px" showButton="false" enabled="false" />
							</td>
						</tr>
					</table>
				</div>
			</form>
		</fieldset>

		<fieldset id="field2" style="border: solid 1px #aaa; padding: 5px;">
			<legend>关联 - 开票收款计划</legend>
			<div style="width: 1370px">
				<div class="nui-toolbar" style="border-bottom: 0; padding: 0px;">
					<table>
						<tr>
							<td>
								<a class="nui-button" iconCls="icon-add" onclick="selectData()">选择</a>
								<a class="nui-button" iconCls="icon-remove" onclick="removeRow()">删除</a>
							</td>
						</tr>
					</table>
				</div>
				<div id="incomeAssociatedGrid" multiSelect="true" class="nui-datagrid" style="height: 415px;" frozenStartColumn="0" frozenEndColumn="4" virtualScroll="true" virtualColumns="true" showPager="false"
					showSummaryRow="true">
					<div property="columns">
						<div type="checkcolumn"></div>
						<div type="indexcolumn"></div>
						<div field="createName" width="60" headerAlign="center" align="center">关联人</div>
						<div field="createTime" width="90" dateFormat="yyyy-MM-dd" headerAlign="center" align="center">关联日期</div>
						<div field="contractName" width="200" headerAlign="center" align="center">合同名称</div>
						<div field="totalAmount" width="120" headerAlign="center" align="center" summaryType="sum" dataType="currency">合计</div>
						<div field="jan" width="120" headerAlign="center" align="center" summaryType="sum" dataType="currency">1月</div>
						<div field="feb" width="120" headerAlign="center" align="center" summaryType="sum" dataType="currency">2月</div>
						<div field="mar" width="120" headerAlign="center" align="center" summaryType="sum" dataType="currency">3月</div>
						<div field="apr" width="100" headerAlign="center" align="center" summaryType="sum" dataType="currency">4月</div>
						<div field="may" width="100" headerAlign="center" align="center" summaryType="sum" dataType="currency">5月</div>
						<div field="jun" width="100" headerAlign="center" align="center" summaryType="sum" dataType="currency">6月</div>
						<div field="jul" width="100" headerAlign="center" align="center" summaryType="sum" dataType="currency">7月</div>
						<div field="aug" width="100" headerAlign="center" align="center" summaryType="sum" dataType="currency">8月</div>
						<div field="sep" width="100" headerAlign="center" align="center" summaryType="sum" dataType="currency">9月</div>
						<div field="oct" width="100" headerAlign="center" align="center" summaryType="sum" dataType="currency">10月</div>
						<div field="nov" width="100" headerAlign="center" align="center" summaryType="sum" dataType="currency">11月</div>
						<div field="dec" width="100" headerAlign="center" align="center" summaryType="sum" dataType="currency">12月</div>
					</div>
				</div>
			</div>
		</fieldset>

	</div>

	<div style="text-align: center; padding: 5px; margin-bottom: 1px" class="nui-toolbar">
		<a id="saveBtn" class="nui-button" onclick="save()" style="width: 60px; margin-right: 20px;" iconCls="icon-save">保存</a>
		<a id="closeBtn" class="nui-button" onclick="closeCancel()" style="width: 60px;" iconCls="icon-close">关闭</a>
	</div>

	<script type="text/javascript">
		nui.parse();
		var form = new nui.Form("totalForm");
		var incomeAssociatedGrid = nui.get("incomeAssociatedGrid");
		var budgetInfo;

		function initData(data) {
			budgetInfo = data;
			nui.get("fillingIncomeId").setValue(data.id);
			nui.get("tbYear").setValue(data.budgetYear);
			nui.get("tbName").setValue(data.parent + " - " + data.name);
			var json = nui.encode({
				"id" : data.id,
			});
			ajaxCommon({
				url : "com.zhonghe.ame.finance.budgetFilling.queryZhCaiwuBudgetFillingIncomeById.biz.ext",
				data : json,
				contentType : 'text/json',
				success : function(result) {
					var data = result.data;
					nui.get("totalAmount").setValue(data.totalAmount);
					nui.get("janAmount").setValue(data.janAmount);
					nui.get("febAmount").setValue(data.febAmount);
					nui.get("marAmount").setValue(data.marAmount);
					nui.get("aprAmount").setValue(data.aprAmount);
					nui.get("mayAmount").setValue(data.mayAmount);
					nui.get("junAmount").setValue(data.junAmount);
					nui.get("julAmount").setValue(data.julAmount);
					nui.get("augAmount").setValue(data.augAmount);
					nui.get("sepAmount").setValue(data.sepAmount);
					nui.get("octAmount").setValue(data.octAmount);
					nui.get("novAmount").setValue(data.novAmount);
					nui.get("decAmount").setValue(data.decAmount);
				}
			});
			ajaxCommon({
				url : "com.zhonghe.ame.finance.budgetFilling.queryAssociatedAnnnualPlanEntityByMainId.biz.ext",
				data : json,
				contentType : 'text/json',
				success : function(result) {
					var datas = result.datas;
					incomeAssociatedGrid.setData(datas);
				}
			});
		}

		function selectData() {
			var headquarterGroup;
			if (budgetInfo.name == "集团内") {
				headquarterGroup = "0,3,4";
			}
			if (budgetInfo.name == "集团外") {
				headquarterGroup = "1";
			}
			var secOrg = budgetInfo.fillingInOrg;
			var years = budgetInfo.budgetYear;
			mini.open({
				url : "/default/finance/budgetFilling/selectAnnnualPlan.jsp",
				title : "开票收款计划",
				width : '1200px',
				height : '610px',
				allowResize : false,
				onload : function() {
					var data = {
						"headquarterGroup" : headquarterGroup,
						"secOrg" : secOrg,
						"years" : years
					};
					var iframe = this.getIFrameEl();
					iframe.contentWindow.initData(data);
				},
				ondestroy : function(action) {
					if (action == "ok") {
						var iframe = this.getIFrameEl();
						var datas = iframe.contentWindow.getDatas();
						datas = mini.clone(datas);
						if (datas.length > 0) {
							var rows = incomeAssociatedGrid.data;
							addOrUpdateRows(datas, rows);
							updateTotalFormData();
						}
					}
				}
			});
		}
		
		function removeRow() {
			var rows = incomeAssociatedGrid.getSelecteds();
			if (rows.length > 0) {
				incomeAssociatedGrid.removeRows(rows, false);
			} else {
				showTips("请至少选中一条记录！", "danger");
			}
			updateTotalFormData();
		}

		// 新增或更新行
		function addOrUpdateRows(datas, rows) {
			if (rows.length > 0) {
				for (var data of datas) {
					var row = hasPropertyValue(rows, "sourceId", data.sourceId);
					if(typeof row === 'undefined'){
						incomeAssociatedGrid.addRow(data);
					}else{
						incomeAssociatedGrid.updateRow(row, data);
					}
				}
			} else {
				incomeAssociatedGrid.addRows(datas);
			}
		}
		
		// 更新totalForm表单中的数据
		function updateTotalFormData(){
			var rows = incomeAssociatedGrid.data;
			var datas = Array(13).fill(0);
			for (var row of rows) {
				datas[0] += row.totalAmount;
				datas[1] += row.jan;
				datas[2] += row.feb;
				datas[3] += row.mar;
				datas[4] += row.apr;
				datas[5] += row.may;
				datas[6] += row.jun;
				datas[7] += row.jul;
				datas[8] += row.aug;
				datas[9] += row.sep;
				datas[10] += row.oct;
				datas[11] += row.nov;
				datas[12] += row.dec;
			}
			nui.get("totalAmount").setValue(divFloat(datas[0], 1.06));
			nui.get("janAmount").setValue(divFloat(datas[1], 1.06));
			nui.get("febAmount").setValue(divFloat(datas[2], 1.06));
			nui.get("marAmount").setValue(divFloat(datas[3], 1.06));
			nui.get("aprAmount").setValue(divFloat(datas[4], 1.06));
			nui.get("mayAmount").setValue(divFloat(datas[5], 1.06));
			nui.get("junAmount").setValue(divFloat(datas[6], 1.06));
			nui.get("julAmount").setValue(divFloat(datas[7], 1.06));
			nui.get("augAmount").setValue(divFloat(datas[8], 1.06));
			nui.get("sepAmount").setValue(divFloat(datas[9], 1.06));
			nui.get("octAmount").setValue(divFloat(datas[10], 1.06));
			nui.get("novAmount").setValue(divFloat(datas[11], 1.06));
			nui.get("decAmount").setValue(divFloat(datas[12], 1.06));
		}
		
		// 返回指定属性值在给定数组中满足条件的元素，如果没有则返回 undefined
		function hasPropertyValue(arr, key, value) {
		  	return arr.find(obj => obj[key] === value);
		}		
		
		function save(){
			nui.confirm("确定保存数据吗？", "系统提示", function(action) {
				if (action == "ok") {
					nui.get("saveBtn").disable();
					nui.get("closeBtn").disable();
					nui.mask({
						el : document.body,
						cls : 'mini-mask-loading',
						html : '表单保存中...'
					});
					var formData = form.getData();
					formData.update_name = userName;
					var gridData = incomeAssociatedGrid.getData();
					var json = nui.encode({
						"incomeAssociated" : formData,
						"incomeAssociatedGrid" : gridData,
					});
					ajaxCommon({
						"url" : "com.zhonghe.ame.finance.budgetFilling.saveIncomeAssociated.biz.ext",
						data : json,
						contentType : 'text/json',
						success : function(text) {
							nui.unmask(document.body);
							if (text.result == "1") {
								showTips("保存成功");
								closeOk();
							} else {
								nui.get("saveBtn").enable();
								nui.get("closeBtn").enable();
							}
						}
					});
				}
			});
		}
		
	</script>

</body>
</html>