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
<title>填报数据 - 其他</title>
</head>
<body>
	<div class="nui-fit" style="padding: 5px;">
		<fieldset id="field1" style="border: solid 1px #aaa; padding: 5px;">
			<legend>合计信息</legend>
			<form id="totalForm" method="post">
				<input id="otherId" name="id" class="nui-hidden" />
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
			<legend>其他 - 费用明细</legend>
			<div style="width: 1370px">
				<div id="toolbarBtnDiv" class="nui-toolbar" style="border-bottom: 0; padding: 0px;">
					<table>
						<tr>
							<td>
								<a class="nui-button" iconCls="icon-add" onclick="addRow()">新增</a>
								<a class="nui-button" iconCls="icon-remove" onclick="removeRow()">删除</a>
							</td>
						</tr>
					</table>
				</div>
				<div id="otherAssociatedGrid" multiSelect="true" class="nui-datagrid" style="height: 515px;" frozenStartColumn="0" frozenEndColumn="5" virtualScroll="true" virtualColumns="true" showPager="false"
					showSummaryRow="true" allowCellEdit="true" allowCellSelect="true" oncellendedit="otherCellEndEdit" oncellvalidation="otherCellValidation">
					<div property="columns">
						<div type="checkcolumn"></div>
						<div type="indexcolumn"></div>
						<div field="createName" width="60" headerAlign="center" align="center">创建人</div>
						<div field="createTime" width="90" dateFormat="yyyy-MM-dd" headerAlign="center" align="center">创建日期</div>
						<div field="matterName" width="200" headerAlign="center" align="left" vtype="required">
							费用名称
							<input property="editor" class="mini-textbox" style="width: 100%" required="true" />
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
							<input property="editor" class="mini-spinner" allowLimitValue="false" format="n2" showButton="false" style="width: 100%" />
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
		var otherAssociatedGrid = nui.get("otherAssociatedGrid");
		
		function initData(data) {
			if(data.viewStatus){
				$("#toolbarBtnDiv").hide();
				$("#saveBtn").hide();
			}
			nui.get("otherId").setValue(data.id);
			nui.get("tbYear").setValue(data.budgetYear);
			nui.get("tbName").setValue(data.name);
			var json = nui.encode({
				"id" : data.id,
			});
			ajaxCommon({
				url : "com.zhonghe.ame.finance.budgetFilling.queryZhCaiwuBudgetFillingMarginById.biz.ext",
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
				url : "com.zhonghe.ame.finance.budgetFilling.queryAssociatedOtherEntityByMainId.biz.ext",
				data : json,
				contentType : 'text/json',
				success : function(result) {
					var datas = result.datas;
					otherAssociatedGrid.setData(datas);
				}
			});
		}

		function addRow() {
			var newRow = {totalAmount: 0, jan: 0, feb: 0, mar: 0, apr: 0, may: 0, jun: 0, jul: 0, aug: 0, sep: 0, oct: 0, nov: 0, dec: 0, createCode: userId, createName: userName, createTime: new Date()};
			var index = otherAssociatedGrid.getData().length;
			otherAssociatedGrid.addRow(newRow, index + 1);
			otherAssociatedGrid.beginEditRow(newRow);
		}
		
		function removeRow(){
			var rows = otherAssociatedGrid.getSelecteds();
			if (rows.length > 0) {
				otherAssociatedGrid.removeRows(rows, false);
				updateTotalFormData();
			}
		}
		
		function otherCellEndEdit(e){
			var record = e.record;
			if (e.field == "jan" || e.field == "feb" || e.field == "mar" || e.field == "apr" || e.field == "may" || e.field == "jun" || e.field == "jul" || e.field == "aug" || e.field == "sep" || e.field == "oct" || e.field == "nov" || e.field == "dec") {
				var totalAmount = record.jan + record.feb + record.mar + record.apr + record.may + record.jun + record.jul + record.aug + record.sep + record.oct + record.nov + record.dec;
				otherAssociatedGrid.updateRow(e.row, {
					totalAmount : totalAmount
				});
			}
			updateTotalFormData();			
		}
		
		function otherCellValidation(e){
			if(e.field == "totalAmount"){
				if(e.value != 0){
					e.isValid = true;
				}else{
					e.isValid = false;
					e.errorText = "[合计-不含税]必填，该值可通过填写[月份]金额自动汇总";
				}
			}
		}
		
		function updateTotalFormData(){
			var rows = otherAssociatedGrid.data;
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
					var gridData = otherAssociatedGrid.getData();
					var json = nui.encode({
						"otherAssociated" : formData,
						"ohterAssociatedGrid" : gridData,
					});
					ajaxCommon({
						"url" : "com.zhonghe.ame.finance.budgetFilling.saveOtherAssociated.biz.ext",
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