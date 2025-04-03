<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<head>
<title>采购立项申请</title>
<style type="text/css">
body {
	margin: 0;
	padding: 0;
	border: 0;
	width: 100%;
	height: 100%;
	overflow: hidden;
}

body .mini-textboxlist {
	border-collapse: collapse;
}
</style>
</head>
<body>
	<div class="nui-fit" style="padding: 5px;">
		<fieldset id="field1" style="border: solid 1px #aaa;">
			<legend>
				采购立项
				<span style="color: red;">(如立项类别涉密，请线下采购)</span>
			</legend>
			<form id="form1" method="post">
				<input name="files" id="fileids" class="nui-hidden" />
				<input id="id" class="nui-hidden" name="id" />
				<div style="padding: 5px;">
					<table style="table-layout: fixed;">
						<tr>
							<td align="right" style="width: 100px">立项名称：</td>
							<td colspan="7">
								<input id="proAppName" name="proAppName" class="nui-textbox" style="width: 100%" required="true" />
								<input name="planId" id="planId" class="nui-hidden" style="width: 100%" required="true" />
								<input name="putunder" id="putunder" class="nui-hidden" style="width: 100%" required="true" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 120px">采购需求单位：</td>
							<td colspan="5">
								<span data-placement="right" data-tooltip="通过添加的明细自动带出">
									<input name="orgUnits" id="orgUnits" class="nui-textboxlist" dataField="orgUnits" url="com.zhonghe.ame.purchase.common.queryOrgByName.biz.ext" valueField="orgcode" textField="orgname"
										inputMode="false" style="width: 910px" enabled="false" />
								</span>
							</td>
							<td align="right" style="width: 100px">立项编号：</td>
							<td>
								<input name="proAppCode" class="nui-textbox" style="width: 100%" readonly="readonly" emptyText="系统自动生成" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 130px">是否为涉密协作配套：</td>
							<td>
								<input id="isSmpt" name="isSmpt" class="nui-dictcombobox" dictTypeId="ZH_YN" required="true" visible="true" style="width: 100%;" />
							</td>
							<td align="right" style="width: 120px">所属项目名称：</td>
							<td>
								<input name="projectId" class="nui-textbox" required="true" style="width: 100%" />
							</td>
							<td align="right" style="width: 130px">立项金额(万元)：</td>
							<td>
								<input name="proAppApplyPrice" id="proAppApplyPrice" class="nui-textbox" readonly="readonly" style="width: 100%" required="ture" emptyText="系统自动计算生成" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 100px">集采类型：</td>
							<td>
								<input class="nui-dictcombobox" name="type" id="type" dictTypeId="ZH_PURCHASE_NEW" required="true" visible="true" style="width: 100%;" onvaluechanged="isType" />
							</td>
							<td align="right" style="width: 100px">费用来源：</td>
							<td>
								<input name="costFrom" class="nui-dictcombobox" dictTypeId="ZH_COST_FROM" required="true" style="width: 100%;" />
							</td>
							<td align="right" style="width: 100px">物项类别：</td>
							<td>
								<input id="proAppObjType" name="proAppObjType" class="nui-dictcombobox" dictTypeId="MIS_APPOBJTYPE" required="true" style="width: 100%;" />
							</td>
							<td align="right" style="width: 100px">建议采购方式：</td>
							<td>
								<input id="purchasMode" name="purchasMode" class="nui-dictcombobox" dictTypeId="ZH_CGFS_NEW" required="true" style="width: 100%;" onvaluechanged="purchasModeChange" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 120px;">是否招标限价：</td>
							<td>
								<input id="tenderLimit" name="tenderLimit" class="nui-dictcombobox" dictTypeId="ZH_YN" required="true" style="width: 100%;" onvaluechanged="isLimit" />
							</td>
							<td align="right" style="width: 100px">招标限价金额：</td>
							<td>
								<input id="limit" name="limit" class="nui-textbox" required="ture" style="width: 100%;" />
							</td>
							<td align="right" style="width: 100px">是否电子采购：</td>
							<td>
								<input id="isDzcg" name="isDzcg" class="nui-dictcombobox" dictTypeId="ZH_YN" required="true" style="width: 100%;" />
							</td>
							<td align="right" style="width: 120px">电采平台发布公告：</td>
							<td>
								<input id="isGb" name="isGb" class="nui-dictcombobox" dictTypeId="ZH_YN" required="true" style="width: 100%;" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 120px;">立项范围：</td>
							<td colspan="7">
								<input style="width: 100%; height: 120px;" name="proAppRange" class="nui-textarea" required="true" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 100px">供应商选取范围：</td>
							<td>
								<input id="supplierScope" name="supplierScope" class="nui-dictcombobox" dictTypeId="ZH_SUPPLIER_SCOPE" required="true" style="width: 100%;" onvaluechanged="isSupplierScope" />
							</td>
							<td align="right" style="width: 100px">供应商信息：</td>
							<td colspan="3">
								<input class="nui-textboxlist" style="width: 600px;" textField="custname" valueField="custid" id="supplierSel" name="supplierSel"
									url="com.zhonghe.ame.purchase.purSupplier.querySupplierByName.biz.ext" dataField="purSuppliers" inputMode="false" />
							</td>
							<td align="right" style="width: 100px">合同/订单性质：</td>
							<td>
								<input id="nature" name="nature" class="nui-dictcombobox" dictTypeId="ZH_NATURE" required="true" style="width: 100%;" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 120px">选择上述供应商原因：</td>
							<td colspan="3">
								<input id="supplierReason" name="supplierReason" class="nui-textarea" required="ture" style="width: 100%; height: 120px" />
							</td>
							<td align="right" style="width: 100px">相关情况说明：</td>
							<td colspan="4">
								<input name="remark" class="nui-textarea" required="ture" style="width: 100%; height: 120px" />
							</td>
						</tr>
					</table>
				</div>
			</form>
		</fieldset>

		<fieldset id="field3" style="border: solid 1px #aaa;">
			<legend>明细</legend>
			<div>
				<div class="nui-toolbar" style="border-bottom: 0; padding: 0px;">
					<table style="width: 100%;">
						<tr>
							<td style="width: 100%;">
								<a class="nui-button" id="addbtn" iconCls="icon-add" onclick="addTicket()">增加</a>
								<a class="nui-button" id="delbtn" iconCls="icon-remove" onclick="removeTicket()">删除</a>
							</td>
						</tr>
					</table>
				</div>
			</div>
			<div id="grid_detail" class="nui-datagrid" style="width: 100%; height: auto;" allowCellSelect="true" showPager="false" allowCellEdit="true" multiSelect="true" oncellendedit="getHTZQ">
				<div property="columns">
					<div type="checkcolumn"></div>
					<div type="indexcolumn" align="center" headerAlign="center" visible="false"></div>
					<div field="planName" width="110" align="center" headerAlign="center">计划名称</div>
					<div field="planCode" width="110" align="center" headerAlign="center">计划编号(物项明细编号)</div>
					<div field="materialName" width="110" align="center" headerAlign="center" vtype="required">采购物项名称</div>
					<div field="purchaseFirstName" width="110" align="center" headerAlign="center" vtype="required">物项大类</div>
					<div field="purchaseTwoName" width="110" align="center" headerAlign="center" vtype="required">物项中类</div>
					<div field="budgetAmount" width="110" align="center" headerAlign="center" vtype="required">预算金额(万元)</div>
					<div field="amount" width="110" align="center" headerAlign="center" vtype="required">
						<span style="color: red;">立项金额(万元)</span>
						<input property="editor" class="nui-spinner" minValue="0" maxValue="999999999" name="amount" visible="true" width="100%" />
					</div>
					<div field="sumamount" width="110" align="center" headerAlign="center" vtype="required">剩余可立项金额(万元)</div>
					<div field="needOrgName" width="60" align="center" headerAlign="center">采购单位</div>
					<div field="putunder" width="100" align="center" headerAlign="center" renderer="zhPutUnder">物项归口部门</div>
				</div>
			</div>
		</fieldset>

		<fieldset id="field2" style="border: solid 1px #aaa;">
			<legend>
				技术规格书、合同文本、费用估算表、支撑材料
			</legend>
			<jsp:include page="/ame_common/inputFile.jsp" />
		</fieldset>
	</div>

	<div style="text-align: center; position: relative; bottom: 10px" class="nui-toolbar">
		<a class="nui-button" onclick="onOk(0)" id="saveReimb" iconCls="icon-save" style="width: 80px; margin-right: 20px;">暂存</a>
		<a class="nui-button" onclick="onOk(1)" id="creatReimbProcess" iconCls="icon-ok" style="width: 80px; margin-right: 20px;">提交</a>
		<a class="nui-button" onclick="closeCancel" id="saveReimbProcess" iconCls="icon-close" style="width: 80px; margin-right: 140px;">关闭</a>
	</div>

	<script type="text/javascript">
		var tip = new mini.ToolTip();
		tip.set({
			target : document,
			selector : '[data-tooltip], [data-placement]'
		});
		nui.parse();
		var istype, info;
		var orgIdSet = new Set();
		var orgNameSet = new Set();
		var form = new nui.Form("#form1");
		var gridDtl = nui.get("#grid_detail");

		$("#orgUnits > tbody > tr > td").attr("style", "background: #FFFFE6");
		$("#supplierSel > tbody > tr > td").attr("style", "background: #FFFFE6");

		function addTicket() {
			var type = nui.get("type").getValue();
			if (!type) {
				showTips("请先选择集采类型", "danger");
				return;
			} else {
				nui.open({
					url : "/default/purchase/common/selectPurchasePlan.jsp",
					title : "采购立项 - 采购计划选择",
					width : '1300',
					height : '610',
					onload : function() {
						var iframe = this.getIFrameEl();
						iframe.contentWindow.initData({
							"type" : type,
							"orgId" : userOrgId
						});
					},
					ondestroy : function(action) {
						if (action == "ok") {
							var iframe = this.getIFrameEl();
							var data = iframe.contentWindow.GetData();
							data = nui.clone(data);
							if (data && data.length > 0) {
								var index = 0;
								var rows = gridDtl.getData();
								if (rows) {
									index = gridDtl.indexOf(rows[rows.length - 1]);
									index = index + 1;
								}
								for (var i = 0; i < data.length; i++) {
									data[i].planId = data[i].id
									data[i].planCode = data[i].code
									data[i].planName = data[i].name
									data[i].purchaseFirstName = data[i].purchaseFirstName
									data[i].purchaseTwoName = data[i].purchaseTwoName
									data[i].budgetAmount = data[i].newBudgetAmount
									var orgId = String(data[i].needOrgId);
									var orgName = data[i].needOrgName;
									orgIdSet.add(orgId);
									orgNameSet.add(orgName);
								}
								gridDtl.addRows(data, index);
								if (gridDtl.getData().length > 0) {
									nui.get("type").setReadOnly(true);
								}
								nui.get('orgUnits').setValue(Array.from(orgIdSet).join(','));
								nui.get('orgUnits').setText(Array.from(orgNameSet).join(','));
								putunderChanged();
							}
						}
					}
				});
			}
		}

		function putunderChanged() {
			var type = nui.get("type").getValue();
			var putunder = nui.get("putunder").getValue();
			var rowsData = gridDtl.data;
			if (putunder) {
				var putunders = putunder.split(",");
			} else {
				var putunders = [];
			}
			if (rowsData.length > 0) {
				for (var i = 0; i < rowsData.length; i++) {
					if (!putunders.includes(rowsData[i].putunder.toString())) {
						putunders.push(rowsData[i].putunder.toString());
					}
				}
				nui.get("putunder").setValue(putunders.toString());
			}
		}

		function removeTicket() {
			var rows = gridDtl.getSelecteds();
			if (rows.length > 0) {
				gridDtl.removeRows(rows, true);
				if (gridDtl.getData().length == 0) {
					nui.get("type").setReadOnly(false);
					nui.get("planId").setValue("");
					nui.get("putunder").setValue("");
				}
				var rows = gridDtl.getData();
				if (rows.length == 0) {
					orgIdSet = new Set();
					orgNameSet = new Set();
					nui.get('orgUnits').setValue(null);
					nui.get('orgUnits').setText(null);
				} else {
					orgIdSet = new Set();
					orgNameSet = new Set();
					for (var i = 0; i < rows.length; i++) {
						var orgId = String(rows[i].needOrgId);
						var orgName = rows[i].needOrgName;
						orgIdSet.add(orgId);
						orgNameSet.add(orgName);
					}
					nui.get('orgUnits').setValue(Array.from(orgIdSet).join(','));
					nui.get('orgUnits').setText(Array.from(orgNameSet).join(','));
				}
			} else {
				showTips("请至少选中一条记录！");
				return;
			}
		}

		function getHTZQ(e) {
			var row = e.row;
			if (e.value > row.sumamount) {
				showTips("立项金额大于剩余可立项金额", "danger")
				gridDtl.updateRow(row, {
					"amount" : ""
				})
				return;
			}
			if (e.field == "amount") {
				var tempData = nui.get(grid_detail).data;
				var a = tempData.length;
				var b = 0;
				for (var i = 0; i < a; i++) {
					if (tempData[i].amount != undefined) {
						b = addFloat(b, tempData[i].amount);
					} else {
						var x = 0;
						b += x;
					}
				}
				nui.get("proAppApplyPrice").setValue(b);
			}
		}

		function isSupplierScope() {
			var classified = nui.get("supplierScope").getValue();
			if (classified == "1") {
				$("#supplierSel > tbody > tr > td").attr("style", "background: #FFFFFF");
				nui.get("supplierSel").setRequired(false);
				nui.get("supplierReason").setRequired(false);
			} else if (classified == "2") {
				$("#supplierSel > tbody > tr > td").attr("style", "background: #FFFFE6");
				nui.get("supplierSel").setRequired(true);
				nui.get("supplierReason").setRequired(true);
			}
		}

		function purchasModeChange() {
			var purchasMode = nui.get("purchasMode").getValue();
			if (purchasMode == "零星采购") {
				nui.get("supplierScope").setValue("2");
				nui.get("supplierScope").setReadOnly(true);
			} else {
				nui.get("supplierScope").setValue(null);
				nui.get("supplierScope").setReadOnly(false);
			}
		}

		function isLimit() {
			if (nui.get("tenderLimit").getValue() == '1') {
				nui.get("limit").setRequired(true);
			} else {
				nui.get("limit").setRequired(false);
			}
		}

		function isType() {
			var type = nui.get("type").getValue();
			var fields = form.getFields();
			if (type == "1") {
				$("#supplierSel > tbody > tr > td").attr("style", "background: #FFFFFF");
				nui.get("supplierSel").setRequired(false);
				nui.get("purchasMode").setValue("电子商城采购")
				nui.get("supplierScope").setValue("1")
				nui.get("isDzcg").setValue("1")
				nui.get("isGb").setValue("1")
				nui.get("purchasMode").setReadOnly(true)
				nui.get("supplierScope").setReadOnly(true)
				nui.get("isDzcg").setReadOnly(true)
				nui.get("isGb").setReadOnly(true)
				nui.get("proAppObjType").setRequired(false);
				nui.get("nature").setRequired(false);
				nui.get("isDzcg").setRequired(false);
				nui.get("isGb").setRequired(false);
				nui.get("tenderLimit").setRequired(false);
				nui.get("limit").setRequired(false);
				nui.get("supplierReason").setRequired(false);
			} else {
				nui.get("purchasMode").setReadOnly(false)
				nui.get("supplierScope").setReadOnly(false)
				nui.get("isDzcg").setReadOnly(false)
				nui.get("isGb").setReadOnly(false)
				nui.get("proAppObjType").setRequired(true);
				nui.get("nature").setRequired(true);
				nui.get("isDzcg").setRequired(true);
				nui.get("isGb").setRequired(true);
				nui.get("tenderLimit").setRequired(true);
			}
		}

		function zhPutUnder(e) {
			return nui.getDictText('ZH_PUTUNDER', e.value);
		}

		function isStrEmpty(obj) {
			if (typeof obj == "undefined" || obj == null || obj == "") {
				return true;
			} else {
				return false;
			}
		}

		function onOk(e) {
			istype = e;
			if (istype == 0) {
				var proAppName = nui.get("proAppName").getValue();
				if (isStrEmpty(proAppName)) {
					showTips("请填写立项名称并保证其正确性！", "danger");
					return;
				}
			} else if (istype == 1) {
				form.validate();
				if (form.isValid() == false) {
					showTips("请检查表单的完整性!", "danger");
					return;
				}
				gridDtl.validate();
				if (gridDtl.isValid() == false) {
					var error = gridDtl.getCellErrors()[0];
					gridDtl.beginEditCell(error.record, error.column);
					showTips("明细数据有错误，请检查!", "danger");
					return;
				}
				// 已上传的文件数量
				var gridFileCount = nui.get("grid_0").getData().length;
				if (gridFileCount == 0) {
					// 刚新增(未上传)的文件数量
					var newFileCount = document.getElementsByName("uploadfile").length;
					if (newFileCount == 0) {
						showTips("请上传相关附件", "danger");
						return;
					}
				}
			}
			nui.get("saveReimb").disable();
			nui.get("creatReimbProcess").disable();
			document.getElementById("fileCatalog").value = "proAppCost";
			form2.submit();
		}

		function setPutunder(proAppDtl) {
			var putunders = [];
			var type = nui.get("type").getValue();
			for (var i = 0; i < proAppDtl.length; i++) {
				if (!putunders.includes(proAppDtl[i].putunder.toString())) {
					putunders.push(proAppDtl[i].putunder.toString())
				}
			}
			return putunders.toString();
		}

		function SaveData() {
			var data = form.getData();
			var proAppDtl = gridDtl.getData();
			data.putunder = this.setPutunder(proAppDtl);
			data.supplierId = nui.get("supplierSel").getValue();
			data.supplierName = nui.get("supplierSel").getText();
			data.proAppOrgId = nui.get('orgUnits').getValue();
			data.proAppOrgName = nui.get('orgUnits').getText();
			data.istype = istype;
			data.files = nui.get("fileids").getValue();
			var json = nui.encode({
				"proApp" : data,
				"proAppDtl" : proAppDtl
			});
			ajaxCommon({
				url : "com.zhonghe.ame.purchase.purchaseProApp.addProApp.biz.ext",
				data : json,
				contentType : 'text/json',
				success : function(text) {
					if (text.result == "1") {
						showTips("操作成功");
						closeOk();
					} else {
						showTips("操作失败,请联系管理员", "danger");
						nui.get("saveReimb").enable();
						nui.get("creatReimbProcess").enable();
					}
				}
			});
		}
	</script>

</body>
</html>