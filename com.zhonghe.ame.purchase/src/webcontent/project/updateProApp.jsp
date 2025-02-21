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
				<input class="nui-hidden" name="processid" />
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
								<input id="purchasMode" name="purchasMode" class="nui-dictcombobox" dictTypeId="ZH_CGFS" required="true" style="width: 100%;" onvaluechanged="purchasModeChange" />
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
			<div id="grid_detail" class="nui-datagrid" style="width: 100%; height: auto;" dataField="datas" url="com.zhonghe.ame.purchase.dao.projectApproval.queryProAppDtl.biz.ext" allowCellSelect="true"
				showPager="false" allowCellEdit="true" multiSelect="true" oncellendedit="getHTZQ">
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
				估算表、采购方案和支撑材料(可上传多个附件)
				<a href="<%=request.getContextPath()%>/purProgramMoneyTable.docx" download="采购立项费用估算表">采购立项费用估算表下载</a>
			</legend>
			<jsp:include page="/ame_common/inputFile.jsp" />
		</fieldset>
	</div>

	<div style="text-align: center; position: relative; bottom: 10px" class="nui-toolbar">
		<a class="nui-button" onclick="onOk()" id="saveReimb" iconCls="icon-save" style="width: 80px; margin-right: 20px;">保存</a>
		<a class="nui-button" onclick="closeCancel" iconCls="icon-close" style="width: 80px;">关闭</a>
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

		function setData(data) {
			var json = nui.encode({
				"id" : data.id
			});
			ajaxCommon({
				url : "com.zhonghe.ame.purchase.purchaseProApp.queryProApp.biz.ext",
				data : json,
				success : function(result) {
					var data = result.proApp[0];
					form.setData(data);
					nui.get('supplierSel').setValue(data.supplierId);
					nui.get('supplierSel').setText(data.supplierName);
					nui.get('orgUnits').setValue(data.proAppOrgId);
					nui.get('orgUnits').setText(data.proAppOrgName);
					var grid_0 = nui.get("grid_0");
					grid_0.load({
						"groupid" : "proAppCost",
						"relationid" : data.id
					});
					grid_0.sortBy("fileTime", "desc");
					isType();
					isSupplierScope();
					gridDtl.load({
						"pid" : data.id
					});
				}
			});
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
			isLimit();
		}

		function isLimit() {
			if (nui.get("tenderLimit").getValue() == '1') {
				nui.get("limit").setRequired(true);
			} else {
				nui.get("limit").setRequired(false);
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

		function getHTZQ(e) {
			var row = e.row;
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

		function onOk() {
			form.validate();
			if (form.isValid() == false) {
				showTips("请检查表单的完整性!", "danger");
				return;
			}
			document.getElementById("fileCatalog").value = "proAppCost";
			form2.submit();
		}

		function SaveData() {
			var data = form.getData();
			var proAppDtl = gridDtl.getData();
			data.supplierId = nui.get("supplierSel").getValue();
			data.supplierName = nui.get("supplierSel").getText();
			data.proAppOrgId = nui.get('orgUnits').getValue();
			data.proAppOrgName = nui.get('orgUnits').getText();
			var json = nui.encode({
				"proApp" : data,
				"proAppDtl" : proAppDtl
			});
			ajaxCommon({
				url : "com.zhonghe.ame.purchase.purchaseProApp.updateProApp.biz.ext",
				data : json,
				contentType : 'text/json',
				success : function(text) {
					if (text.result == "1") {
						showTips("操作成功");
						closeOk();
					} else {
						showTips("操作失败,请联系管理员", "danger");
					}
				}
			});
		}
	</script>

</body>
</html>