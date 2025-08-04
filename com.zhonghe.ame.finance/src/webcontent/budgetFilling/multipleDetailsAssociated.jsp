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
<title>填报数据 - 会计科目</title>
</head>
<body>
	<div class="nui-fit" style="padding: 5px;">
		<fieldset id="field1" style="border: solid 1px #aaa; padding: 5px;">
			<legend>
				合计信息 -
				<span style="color: red">项监部名称请规范填写</span>
			</legend>
			<form id="totalForm" method="post">
				<input id="tableId" name="id" class="nui-hidden" />
				<input id="fillingLedgerId" name="main_id" class="nui-hidden" />
				<div style="padding: 5px;">
					<table style="table-layout: fixed;">
						<tr>
							<td align="right" style="width: 85px">项监部名称：</td>
							<td colspan="3">
								<input id="xmbName" name="xmb_name" class="nui-textbox" style="width: 100%" required="true" />
							</td>
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
			<legend>关联 - 付款计划（可选）</legend>
			<div>功能开发中...</div>
		</fieldset>

		<fieldset id="field3" style="border: solid 1px #aaa; padding: 5px;">
			<legend>关联 - 采购计划（可选）</legend>
			<div>功能开发中...</div>
		</fieldset>

		<fieldset id="field4" style="border: solid 1px #aaa; padding: 5px;">
			<legend>无关联 - 费用明细（可选）</legend>
			<div style="width: 1370px">
				<div class="nui-toolbar" style="border-bottom: 0; padding: 0px;">
					<table>
						<tr>
							<td>
								<a class="nui-button" iconCls="icon-add" onclick="addPenetrateRow()">新增</a>
								<a class="nui-button" iconCls="icon-remove" onclick="removePenetrateRow()">删除</a>
							</td>
						</tr>
					</table>
				</div>
				<div id="penetrateAssociatedGrid" multiSelect="true" class="nui-datagrid" style="height: 300px;" frozenStartColumn="0" frozenEndColumn="6" virtualScroll="true" virtualColumns="true"
					showPager="false" showSummaryRow="true" allowCellEdit="true" allowCellSelect="true" oncellendedit="penetrateCellEndEdit" oncellvalidation="penetrateCellValidation">
					<div property="columns">
						<div type="checkcolumn"></div>
						<div type="indexcolumn"></div>
						<div field="matterName" width="200" headerAlign="center" align="left" vtype="required">
							事项名称
							<input property="editor" class="mini-textbox" style="width: 100%" required="true" />
						</div>
						<div field="involvingTotal" width="80" headerAlign="center" align="center" vtype="required">
							涉及数量
							<input property="editor" class="mini-spinner" allowLimitValue="false" showButton="false" style="width: 100%" required="true" />
						</div>
						<div field="unitMeasure" width="80" headerAlign="center" align="center" vtype="required">
							计量单位
							<input property="editor" class="mini-textbox" style="width: 100%" required="true" />
						</div>
						<div field="unitPrice" width="120" headerAlign="center" align="center" vtype="required">
							单价(元) - 不含税
							<input property="editor" class="mini-spinner" allowLimitValue="false" format="n2" showButton="false" style="width: 100%" required="true" />
						</div>
						<div field="totalAmount" width="120" headerAlign="center" align="center" summaryType="sum" dataType="currency">总金额 - 不含税</div>
						<div field="jan" width="120" headerAlign="center" align="center" summaryType="sum" dataType="currency">
							1月
							<input property="editor" class="mini-spinner" allowLimitValue="false" format="n2" showButton="false" style="width: 100%" />
						</div>
						<div field="feb" width="120" headerAlign="center" align="center" summaryType="sum" dataType="currency">
							2月
							<input property="editor" class="mini-spinner" allowLimitValue="false" format="n2" showButton="false" style="width: 100%" />
						</div>
						<div field="mar" width="120" headerAlign="center" align="center" summaryType="sum" dataType="currency">
							3月
							<input property="editor" class="mini-spinner" allowLimitValue="false" format="n2" showButton="false" style="width: 100%" />
						</div>
						<div field="apr" width="100" headerAlign="center" align="center" summaryType="sum" dataType="currency">
							4月
							<input property="editor" class="mini-spinner" allowLimitValue="false" format="n2" showButton="false" style="width: 100%" />
						</div>
						<div field="may" width="100" headerAlign="center" align="center" summaryType="sum" dataType="currency">
							5月
							<input property="editor" class="mini-spinner" allowLimitValue="false" format="n2" showButton="false" style="width: 100%" />
						</div>
						<div field="jun" width="100" headerAlign="center" align="center" summaryType="sum" dataType="currency">
							6月
							<input property="editor" class="mini-spinner" allowLimitValue="false" format="n2" showButton="false" style="width: 100%" />
						</div>
						<div field="jul" width="100" headerAlign="center" align="center" summaryType="sum" dataType="currency">
							7月
							<input property="editor" class="mini-spinner" allowLimitValue="false" format="n2" style="width: 100%" />
						</div>
						<div field="aug" width="100" headerAlign="center" align="center" summaryType="sum" dataType="currency">
							8月
							<input property="editor" class="mini-spinner" allowLimitValue="false" format="n2" showButton="false" style="width: 100%" />
						</div>
						<div field="sep" width="100" headerAlign="center" align="center" summaryType="sum" dataType="currency">
							9月
							<input property="editor" class="mini-spinner" allowLimitValue="false" format="n2" showButton="false" style="width: 100%" />
						</div>
						<div field="oct" width="100" headerAlign="center" align="center" summaryType="sum" dataType="currency">
							10月
							<input property="editor" class="mini-spinner" allowLimitValue="false" format="n2" showButton="false" style="width: 100%" />
						</div>
						<div field="nov" width="100" headerAlign="center" align="center" summaryType="sum" dataType="currency">
							11月
							<input property="editor" class="mini-spinner" allowLimitValue="false" format="n2" showButton="false" style="width: 100%" />
						</div>
						<div field="dec" width="100" headerAlign="center" align="center" summaryType="sum" dataType="currency">
							12月
							<input property="editor" class="mini-spinner" allowLimitValue="false" format="n2" showButton="false" style="width: 100%" />
						</div>
						<div field="remark" width="200" headerAlign="center" align="left">
							备注
							<input property="editor" class="mini-textbox" style="width: 100%" />
						</div>
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
		var penetrateAssociatedGrid = nui.get("penetrateAssociatedGrid");

		function initData(data) {
			nui.get("fillingLedgerId").setValue(data.id);
			nui.get("tbYear").setValue(data.budgetYear);
			nui.get("tbName").setValue(data.parent + " - " + data.name);
		}
		
		function editData(budgetInfo, data){
			nui.get("tbYear").setValue(budgetInfo.budgetYear);
			nui.get("tbName").setValue(budgetInfo.parent + " - " + budgetInfo.name);
			nui.get("tableId").setValue(data.id);
			nui.get("fillingLedgerId").setValue(data.mainId);
			nui.get("xmbName").setValue(data.xmbName);
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
			var json = nui.encode({
				"mainId": data.mainId,
				"xmbId" : data.id,
			});
			ajaxCommon({
				url : "com.zhonghe.ame.finance.budgetFilling.queryAssociatedPenetrateEntityByMainIdAndXmbId.biz.ext",
				data : json,
				contentType : 'text/json',
				success : function(result) {
					var datas = result.datas;
					penetrateAssociatedGrid.setData(datas);
				}
			});			
		}

		function addPenetrateRow() {
			var newRow = {involvingTotal: 0, unitPrice: 0, totalAmount: 0, jan: 0, feb: 0, mar: 0, apr: 0, may: 0, jun: 0, jul: 0, aug: 0, sep: 0, oct: 0, nov: 0, dec: 0};
			var index = penetrateAssociatedGrid.getData().length;
			penetrateAssociatedGrid.addRow(newRow, index + 1);
			penetrateAssociatedGrid.beginEditRow(newRow);
		}

		function removePenetrateRow() {
			var rows = penetrateAssociatedGrid.getSelecteds();
			if (rows.length > 0) {
				penetrateAssociatedGrid.removeRows(rows, false);
				updateTotalFormData();
			}
		}

		function penetrateCellEndEdit(e) {
			var record = e.record;
			if (e.field == "involvingTotal" || e.field == "unitPrice") {
				if (record.involvingTotal != null && record.unitPrice != null) {
					var totalAmount = mulFloat(record.involvingTotal, record.unitPrice);
					penetrateAssociatedGrid.updateRow(e.row, {
						totalAmount : totalAmount
					});
				}
			}
			updateTotalFormData();
		}

		function updateTotalFormData() {
			var rows = penetrateAssociatedGrid.data;
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
			nui.get("totalAmount").setValue(datas[0]);
			nui.get("janAmount").setValue(datas[1]);
			nui.get("febAmount").setValue(datas[2]);
			nui.get("marAmount").setValue(datas[3]);
			nui.get("aprAmount").setValue(datas[4]);
			nui.get("mayAmount").setValue(datas[5]);
			nui.get("junAmount").setValue(datas[6]);
			nui.get("julAmount").setValue(datas[7]);
			nui.get("augAmount").setValue(datas[8]);
			nui.get("sepAmount").setValue(datas[9]);
			nui.get("octAmount").setValue(datas[10]);
			nui.get("novAmount").setValue(datas[11]);
			nui.get("decAmount").setValue(datas[12]);
		}
		
		
		function penetrateCellValidation(e) {
			if (e.field == "totalAmount") {
				var record = e.record;
				var monthAmount = record.jan + record.feb + record.mar + record.apr + record.may + record.jun + record.jul + record.aug + record.sep + record.oct + record.nov + record.dec;
				if(monthAmount == record.totalAmount){
					e.isValid = true;
				}else{
					e.isValid = false;
					e.errorText = "每条数据中[各月的金额]相加必须等于[总金额-不含税]";
				}				
			}
		}		
		
		function save(){
			if (!form.validate()) {
				showTips("请检查表单的完整性!", "danger");
				return;
			}
			penetrateAssociatedGrid.validate();
			if (penetrateAssociatedGrid.isValid() == false) {
				var error = penetrateAssociatedGrid.getCellErrors()[0];
				penetrateAssociatedGrid.beginEditCell(error.record, error.column);
				showTips("费用明细数据有错误，请检查!", "danger");
				return;
			}
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
					formData.create_code = userId;
					formData.create_name = userName;
					var gridPenetrateAssociatedData = penetrateAssociatedGrid.getData();
					var json = nui.encode({
						"multipleDetailsAssociated" : formData,
						"penetrateAssociatedGrid" : gridPenetrateAssociatedData,
					});
					ajaxCommon({
						"url" : "com.zhonghe.ame.finance.budgetFilling.saveMultipleDetailsAssociated.biz.ext",
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