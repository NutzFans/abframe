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
<title>长期资产 - 编辑</title>
</head>
<body>
	<div class="nui-fit" style="padding: 5px;">
		<fieldset id="field1" style="border: solid 1px #aaa; padding: 5px;">
			<legend>基本信息</legend>
			<div style="width: 99%">
				<form id="editForm" method="post">
					<input name="id" class="nui-hidden" />
					<table style="table-layout: fixed;">
						<tr>
							<td align="right" style="width: 100px">资产所属单位：</td>
							<td>
								<input id="secondaryOrg" name="secondaryOrg" class="nui-hidden" />
								<input id="secondaryOrgname" name="secondaryOrgname" class="nui-textbox" style="width: 200px" required="true" enabled="false" />
							</td>
							<td align="right" style="width: 100px">资产所属部门：</td>
							<td>
								<input id="department" name="department" class="nui-textbox" style="width: 200px" required="true" />
							</td>
							<td align="right" style="width: 100px">资产创建人：</td>
							<td>
								<input id="createUserid" name="createUserid" class="nui-hidden" />
								<input id="createUsername" name="createUsername" class="nui-textbox" style="width: 200px" required="true" enabled="false" />
							</td>
							<td align="right" style="width: 100px">资产创建时间：</td>
							<td>
								<input id="createTime" name="createTime" class="nui-datepicker" style="width: 200px" required="true" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 100px">长期资产名称：</td>
							<td colspan="3">
								<input name="name" class="nui-textbox" style="width: 100%" required="true" />
							</td>
							<td align="right" style="width: 100px">长期资产分类：</td>
							<td>
								<input id="classId" name="clazz" class="nui-dictcombobox" dictTypeId="ZH_CW_CQZCFL" style="width: 200px" required="true" onvaluechanged="calculateAndAdjustData" />
							</td>
							<td align="right" style="width: 100px">长期资产类别：</td>
							<td>
								<input name="category" class="nui-dictcombobox" dictTypeId="ZH_CW_ZCLB" style="width: 200px" required="true" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 100px">型号规格：</td>
							<td>
								<input name="spec" class="nui-textbox" style="width: 200px" />
							</td>
							<td align="right" style="width: 100px">生产厂家：</td>
							<td>
								<input name="factory" class="nui-textbox" style="width: 200px" />
							</td>
							<td align="right" style="width: 100px">计量单位：</td>
							<td>
								<input name="unit" class="nui-textbox" style="width: 200px" required="true" />
							</td>
							<td align="right" style="width: 100px">现存数量：</td>
							<td>
								<input name="stock" class="nui-textbox" style="width: 200px" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 100px">购买计划：</td>
							<td colspan="3">
								<input name="planContent" class="nui-textarea" style="width: 100%; height: 65px" required="true" />
							</td>
							<td align="right" style="width: 100px">购买时间：</td>
							<td colspan="3">
								<input name="planTime" class="nui-textarea" style="width: 100%; height: 65px" required="true" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 100px">数量：</td>
							<td>
								<input id="quantity" name="quantity" class="mini-spinner" allowLimitValue="false" format="n2" showButton="false" style="width: 200px" required="true" onvaluechanged="calculateAndAdjustData" />
							</td>
							<td align="right" style="width: 100px">单价(元)：</td>
							<td>
								<input id="price" name="price" class="mini-spinner" allowLimitValue="false" format="n2" showButton="false" style="width: 200px" required="true" onvaluechanged="calculateAndAdjustData" />
							</td>
							<td align="right" style="width: 100px">总价预算：</td>
							<td>
								<input id="total" name="total" class="mini-spinner" allowLimitValue="false" format="n2" showButton="false" style="width: 200px" required="true" enabled="false" />
							</td>
							<td align="right" style="width: 100px">采购/装修日期：</td>
							<td>
								<input name="procTime" class="nui-datepicker" style="width: 200px" required="true" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 100px">税率：</td>
							<td>
								<input id="taxRate" name="taxRate" class="nui-dictcombobox" dictTypeId="ZH_CW_CQZCSL" style="width: 200px" required="true" onvaluechanged="calculateAndAdjustData" />
							</td>
							<td align="right" style="width: 100px">不含税金额：</td>
							<td>
								<input id="amountTax" name="amountTax" class="mini-spinner" allowLimitValue="false" format="n2" showButton="false" style="width: 200px" required="true" enabled="false" />
							</td>
							<td align="right" style="width: 100px">总折旧(月)：</td>
							<td>
								<input id="depreciationMonth" name="depreciationMonth" class="mini-spinner" minValue="36" maxValue="240" showButton="false" style="width: 200px" required="true"
									onvaluechanged="calculateAndAdjustData" />
							</td>
							<td align="right" style="width: 100px">月折旧/摊销率：</td>
							<td>
								<input id="depreciationRate" name="depreciationRate" class="mini-spinner" allowLimitValue="false" format="n3" showButton="false" style="width: 200px" required="true" enabled="false" />
							</td>
						</tr>
					</table>
				</form>
			</div>
		</fieldset>
		<br>
		<fieldset id="field2" style="border: solid 1px #aaa; padding: 5px;">
			<legend>
				资产折旧明细 -
				<span style="color: red">【基本信息】填写完成后点击【生成】按钮生成【各年资产折旧明细】</span>
			</legend>
			<div style="width: 99%; margin: 0 auto;">
				<div class="nui-toolbar" style="border-bottom: 0; padding: 0px;">
					<table>
						<tr>
							<td>
								<a class="nui-button" iconCls="icon-add" onclick="generateData()">生成</a>
							</td>
						</tr>
					</table>
				</div>
				<div id="zjGrid" class="nui-datagrid" style="height: 400px;" virtualScroll="true" virtualColumns="true" showPager="false" showSummaryRow="true">
					<div property="columns">
						<div type="indexcolumn"></div>
						<div field="zjYear" width="120" headerAlign="center" align="center">折旧年份</div>
						<div field="zjZb" width="120" headerAlign="center" align="center" summaryType="sum">折旧占比</div>
						<div field="total" width="120" headerAlign="center" align="center" summaryType="sum" dataType="currency">折旧金额</div>
						<div field="jan" headerAlign="center" align="center" summaryType="sum" dataType="currency">1月</div>
						<div field="feb" headerAlign="center" align="center" summaryType="sum" dataType="currency">2月</div>
						<div field="mar" headerAlign="center" align="center" summaryType="sum" dataType="currency">3月</div>
						<div field="apr" headerAlign="center" align="center" summaryType="sum" dataType="currency">4月</div>
						<div field="may" headerAlign="center" align="center" summaryType="sum" dataType="currency">5月</div>
						<div field="jun" headerAlign="center" align="center" summaryType="sum" dataType="currency">6月</div>
						<div field="jul" headerAlign="center" align="center" summaryType="sum" dataType="currency">7月</div>
						<div field="aug" headerAlign="center" align="center" summaryType="sum" dataType="currency">8月</div>
						<div field="sep" headerAlign="center" align="center" summaryType="sum" dataType="currency">9月</div>
						<div field="oct" headerAlign="center" align="center" summaryType="sum" dataType="currency">10月</div>
						<div field="nov" headerAlign="center" align="center" summaryType="sum" dataType="currency">11月</div>
						<div field="dec" headerAlign="center" align="center" summaryType="sum" dataType="currency">12月</div>
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
		var editForm = new nui.Form("#editForm");
		var zjGrid = nui.get("zjGrid");

		function setEditData(data) {
			editForm.setData(data);
			var json = nui.encode({
				"assetsId" : data.id,
				"sortField" : "zjYear",
				"sortOrder" : "asc"
			});
			ajaxCommon({
				"url" : "com.zhonghe.ame.finance.longTermAssets.queryAssetsItemList.biz.ext",
				data : json,
				contentType : 'text/json',
				success : function(res) {
					var datas = res.assetsItemList;
					zjGrid.setData(datas);
				}
			});
		}

		function calculateAndAdjustData() {
			var quantity = nui.get("quantity").getValue();
			var price = nui.get("price").getValue();
			var total = mulFloat(quantity, price);
			nui.get("total").setValue(total);
			var taxRate = addFloat(1, nui.get("taxRate").getValue());
			var amountTax = divFloat(total, taxRate);
			nui.get("amountTax").setValue(amountTax);
			var classId = nui.get("classId").getValue();
			var depreciationMonth = nui.get("depreciationMonth").getValue();
			if (classId == "固定资产") {
				var depreciationRate = divAccuracyFloat(0.995, depreciationMonth, 3);
				nui.get("depreciationRate").setValue(depreciationRate);
			} else {
				var depreciationRate = divAccuracyFloat(1, depreciationMonth, 3);
				nui.get("depreciationRate").setValue(depreciationRate);
			}
		}

		function generateData() {
			if (!editForm.validate()) {
				showTips("请检查基本信息表单的完整性!", "danger");
				return;
			}
			var formData = editForm.getData();
			var json = nui.encode({
				"data" : formData
			});
			ajaxCommon({
				"url" : "com.zhonghe.ame.finance.longTermAssets.generateData.biz.ext",
				data : json,
				contentType : 'text/json',
				success : function(res) {
					var datas = res.result;
					zjGrid.setData(datas);
				}
			});
		}

		function save() {
			if (!editForm.validate()) {
				showTips("请检查基本信息表单的完整性!", "danger");
				return;
			}
			var formData = editForm.getData();
			var json = nui.encode({
				"data" : formData
			});
			ajaxCommon({
				"url" : "com.zhonghe.ame.finance.longTermAssets.generateData.biz.ext",
				data : json,
				contentType : 'text/json',
				success : function(res) {
					var datas = res.result;
					zjGrid.setData(datas);
					nui.confirm("确定保存数据吗？", "系统提示", function(action) {
						if (action == "ok") {
							nui.get("saveBtn").disable();
							nui.get("closeBtn").disable();
							nui.mask({
								el : document.body,
								cls : 'mini-mask-loading',
								html : '表单保存中...'
							});
							var formData = editForm.getData();
							formData.updateUserid = userId;
							formData.updateUsername = userName;
							formData.updateTime = new Date();
							var json = nui.encode({
								"assetsData" : formData,
								"assetsItemGrid" : zjGrid.getData()
							});
							ajaxCommon({
								"url" : "com.zhonghe.ame.finance.longTermAssets.saveAssetsData.biz.ext",
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
			});
		}

		function divAccuracyFloat(num1, num2, accuracy) {
			num1 = parseFloat(num1);
			num2 = parseFloat(num2);
			return parseFloat(num1 / num2).toFixed(accuracy);
		}
	</script>

</body>
</html>