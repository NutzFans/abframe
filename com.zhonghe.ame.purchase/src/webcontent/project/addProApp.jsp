<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<head>
<title>采购计划立项申请</title>
<style type="text/css">
body {
	margin: 0;
	padding: 0;
	border: 0;
	width: 100%;
	height: 100%;
	overflow: hidden;
}
	body .mini-textboxlist{
		border-collapse: collapse;
	}
</style>
</head>
<body>
	<div class="nui-fit">
		<div class="nui-panel" title="" style="width: 100%;">
			<fieldset id="field1" style="border: solid 1px #aaa;">
				<legend>
					采购立项
					<span style="color: red;">(如立项类别涉密，请线下采购)</span>
				</legend>
				<form id="form1" method="post">
					<input name="files" id="fileids" class="nui-hidden" />
					<input id="id" class="nui-hidden" name="id" />
					<div style="padding: 1px; width: 100%">
						<table style="table-layout: fixed;">
							<tr>
								<td align="right" style="width: 100px">立项名称：</td>
								<td colspan="3">
									<input name="proAppName" class="nui-textbox" style="width: 100%" required="true" />
									<input name="planId" id="planId" class="nui-hidden" style="width: 100%" required="true" />
									<input name="putunder" id="putunder" class="nui-hidden" style="width: 100%" required="true" />
								</td>
								<td align="right">立项编号：</td>
								<td colspan="1">
									<input name="proAppCode" class="nui-textbox" style="width: 100%" readonly="readonly" emptyText="系统自动生成" />
								</td>
								<td align="right" style="width: 120px">立项申请单位：</td>
								<td colspan="3">
									<input name="proAppOrgName" value="<%=userOrgName%>" class="nui-textbox" style="width: 100%" required="true" />
									<input name="proAppOrgId" value="<%=userOrgId%>" class="nui-hidden" style="width: 100%" required="true" />
								</td>
							</tr>
							<tr>
								<td align="right" width="130">是否为涉密协作配套：</td>
								<td colspan="1">
									<input id="isSmpt" name="isSmpt" class="nui-dictcombobox" dictTypeId="ZH_YN" required="true" visible="true" style="width: 100%;" />
								</td>
								<td align="right">所属项目名称：</td>
								<td colspan="1">
									<input name="projectId" class="nui-textbox" required="true" style="width: 100%" />
								</td>
								<td colspan="1" align="right" width="130">立项金额(万元)：</td>
								<td colspan="1">
									<input name="proAppApplyPrice" id="proAppApplyPrice" class="nui-textbox" readonly="readonly" style="width: 100%" required="ture" />
								</td>
							</tr>
							<tr>
								<td align="right">集采类型：</td>
								<td>
									<input class="nui-dictcombobox" name="type" id="type" dictTypeId="ZH_PURCHASE" required="true" visible="true" style="width: 100%;" onvaluechanged="isType" />
								</td>
								<td align="right">费用来源：</td>
								<td>
									<input name="costFrom" class="nui-dictcombobox" dictTypeId="ZH_COST_FROM" required="true" style="width: 100%;" />
								</td>
								<td align="right">物项类别：</td>
								<td>
									<input id="proAppObjType" name="proAppObjType" class="nui-dictcombobox" dictTypeId="MIS_APPOBJTYPE" required="true" style="width: 100%;" />
								</td>
								<td align="right">采购方式：</td>
								<td>
									<input id="purchasMode" name="purchasMode" class="nui-dictcombobox" dictTypeId="ZH_CGFS" required="true" style="width: 100%;" onvaluechanged="purchasModeChange" />
								</td>
							</tr>
							<tr>
								<td align="right">采购方式理由：</td>
								<td colspan="8">
									<input id="wayReason" name="wayReason" class="nui-textarea" required="true" style="width: 100%;" emptyText="若为一级集采，则此项非必填" />
								</td>
							</tr>
							<tr>
								<td align="right" style="width: 120px;">是否招标限价：</td>
								<td>
									<input id="tenderLimit" name="tenderLimit" class="nui-dictcombobox" dictTypeId="ZH_YN" required="true" style="width: 100%;" onvaluechanged="isLimit()" />
								</td>
								<td colspan="1" align="right" style="width: 100px">招标限价金额：</td>
								<td>
									<input id="limit" name="limit" class="nui-textbox" required="ture" style="width: 100%;" />
								</td>
								<td align="right" style="width: 100px">是否电子采购：</td>
								<td>
									<input id="isDzcg" name="isDzcg" class="nui-dictcombobox" dictTypeId="ZH_YN" required="true" style="width: 100%;" />
								</td>
								<td align="right" style="width: 100px">电采平台发布公告：</td>
								<td>
									<input id="isGb" name="isGb" class="nui-dictcombobox" dictTypeId="ZH_YN" required="true" style="width: 100%;" />
								</td>
							</tr>
							<tr>
								<td align="right" style="width: 120px;">立项范围：</td>
								<td colspan="7">
									<input style="width: 100%; height: 40px;" name="proAppRange" class="nui-textarea" required="true" />
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
								<td align="right" colspan="1" style="width: 120px">选择上述供应商原因：</td>
								<td colspan="3">
									<input id="supplierReason" name="supplierReason" class="nui-textarea" required="ture" style="width: 100%;" />
								</td>
								<td align="right" style="width: 100px">相关情况说明：</td>
								<td colspan="4">
									<input name="remark" class="nui-textarea" required="ture" style="width: 100%;" />
								</td>
							</tr>
						</table>
					</div>
				</form>
			</fieldset>

			<fieldset style="height: 80%; border: solid 1px #aaa; padding: 1px;">
				<legend>明细</legend>
				<div class="fieldset-body" style="width: 100%; height: 100%; margin: 0px auto">
					<a class="nui-button" id="addbtn" iconCls="icon-add" onclick="addTicket()">增加</a>
					<a class="nui-button" id="delbtn" iconCls="icon-remove" onclick="removeTicket()">删除</a>
					<div id="grid_detail" class="nui-datagrid" style="width: 100%; height: auto;" allowCellSelect="true" showPager="false" allowCellEdit="true" multiSelect="true" oncellendedit="getHTZQ">
						<div property="columns">
							<div type="checkcolumn"></div>
							<div type="indexcolumn" align="center" headerAlign="center" visible="false"></div>
							<div field="planName" width="110" align="center" headerAlign="center">计划名称</div>
							<div field="planCode" width="110" align="center" headerAlign="center">计划编号(物项明细编号)</div>
							<div field="materialName" width="110" align="center" headerAlign="center" vtype="required">采购物项名称</div>
							<div field="budgetAmount" width="110" align="center" headerAlign="center" vtype="required">预算金额(万元)</div>
							<div field="amount" width="110" align="center" headerAlign="center" vtype="required">
								<span style="color: red;">立项金额(万元)</span>
								<input property="editor" class="nui-spinner" minValue="0" maxValue="999999999" name="amount" visible="true" width="100%" />
							</div>
							<div field="sumamount" width="110" align="center" headerAlign="center" vtype="required">剩余可立项金额(万元)</div>
							<div field="needOrgName" width="60" align="center" headerAlign="center" renderer="unitValue">采购单位</div>
							<div field="contractamount" width="100" align="center" headerAlign="center" renderer="onViewL" visible="false">
								拟签合同金额(元)
								<input property="editor" class="nui-spinner" minValue="0" maxValue="999999999" id="contractamount" name="contractamount" />
							</div>
							<div field="putunder" width="100" align="center" headerAlign="center" renderer="zhPutUnder">物项归口部门</div>
						</div>
					</div>
				</div>
			</fieldset>

			<fieldset id="field2" style="border: solid 1px #aaa; padding: 3px;">
				<legend>
					估算表、采购方案和支撑材料(可上传多个附件)
					<a href="<%=request.getContextPath()%>/purProgramMoneyTable.docx" download="采购立项费用估算表">采购立项费用估算表下载</a>
				</legend>
				<jsp:include page="/ame_common/addFiles.jsp" />
			</fieldset>
			<form id="opioionform" method="post"></form>
		</div>
	</div>

	<div style="text-align: center; padding: 5px;" class="nui-toolbar">
		<a class="nui-button" onclick="onOk(0)" id="saveReimb" iconCls="icon-save" style="width: 80px; margin-right: 20px;">暂存</a>
		<a class="nui-button" onclick="onOk(1)" id="creatReimbProcess" iconCls="icon-ok" style="width: 80px; margin-right: 20px;">提交</a>
		<a class="nui-button" onclick="closeCancel" id="saveReimbProcess" iconCls="icon-close" style="width: 80px; margin-right: 140px;">关闭</a>
	</div>

	<script type="text/javascript">
		nui.parse();
		var istype, info;
		var form = new nui.Form("#form1");
		var gridDtl = nui.get("#grid_detail");
		
		$("#supplierSel > tbody > tr > td").attr("style", "background: #FFFFE6");

		function addTicket() {
			var type = nui.get("type").getValue()
			var putunder = nui.get("putunder").getValue()
			var num = gridDtl.getData().length;
			if (type == 2 && num > 0) {
				showTips("二级集采只能增加一个计划", "danger");
				return;
			}
			if (!type) {
				showTips("请先选择集采类型", "danger");
				return;
			} else {
				var btnEdit = this;
				nui.open({
					url : "/default/purchase/common/selectPurchasePlan.jsp?type=" + type + "&putunder=" + putunder,
					title : "采购计划列表",
					width : '80%',
					height : '70%',
					allowResize : true,
					ondestroy : function(action) {
						if (action == "ok") {
							var tempData;
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
									data[i].planCode = data[i].code
									data[i].planName = data[i].name
									data[i].budgetAmount = data[i].newBudgetAmount
								}
								gridDtl.addRows(data, index);
								if (gridDtl.getData().length > 0) {
									nui.get("type").setReadOnly(true)
								}
								putunderChanged();
							}
						}
					}
				});
			}
		}
		
		function onOk(e) {
			istype = e;
			if (istype == 0) {
				info = "暂存";
			} else if (istype == 1) {
				info = "提交";
				if (!form.validate()) {
					showTips("请检查表单完整性", "danger");
					return;
				}
				gridDtl.validate();
				if (gridDtl.isValid() == false) {
					var error = gridDtl.getCellErrors()[0];
					gridDtl.beginEditCell(error.record, error.column);
					return;
				}
				var filePaths = document.getElementsByName("uploadfile").length;
				if (filePaths == 0) {
					showTips("估算表和支撑材料附件不可以为空", "danger");
					return;
				} else {
					for (var j = 0; j < filePaths; j++) {
						var a = document.getElementsByName("remarkList")[j].value;
						if (a == null || a == "") {
							showTips("估算表和支撑材料附件不可以为空", "danger");
							nui.get("saveReimbProcess").enable();
							nui.get("creatReimbProcess").enable();
							return;
						}
					}
				}
			}
			document.getElementById("fileCatalog").value = "proAppCost";
			nui.confirm("确定" + info + "单据", "系统提示", function(action) {
				if (action == "ok") {
					form2.submit();
				}
			})
		}
		
		//删除行
		function removeTicket() {
			var rows = gridDtl.getSelecteds();
			if (rows.length > 0) {
				gridDtl.removeRows(rows, true);
				if (gridDtl.getData().length == 0) {
					nui.get("type").setReadOnly(false);
					nui.get("planId").setValue("");
					nui.get("putunder").setValue("");
				}
			} else {
				showTips("请至少选中一条记录！");
			}
		}
		
		function SaveData() {
			var data = form.getData();
			var proAppDtl = gridDtl.getData();
			data.putunder = this.setPutunder(proAppDtl);
			data.supplierId = nui.get("supplierSel").getValue();
			data.supplierName = nui.get("supplierSel").getText();
			data.judge = getJudge();
			data.istype = istype;
			data.files = nui.get("fileids").getValue();
			var json = nui.encode({
				"proApp" : data,
				"proAppDtl" : proAppDtl,
				"misOpinion" : {
					"auditstatus" : 3
				}
			});
			ajaxCommon({
				url : "com.zhonghe.ame.purchase.purchaseProApp.addProApp.biz.ext",
				data : json,
				contentType : 'text/json',
				success : function(text) {
					if (text.result == "1") {
						showTips(info + "成功")
						closeOk();
					} else {
						showTips(info + "失败,请联系管理员", "danger")
					}
				}
			});
		}

		function setPutunder(proAppDtl) {
			var putunders = [];
			for (var i = 0; i < proAppDtl.length; i++) {
				if (!putunders.includes(proAppDtl[i].putunder.toString())) {
					putunders.push(proAppDtl[i].putunder.toString())
				}
			}
			return putunders.toString();
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
				nui.get("proAppApplyPrice").setValue(b)
			}
		}

		function onSumamount() {
			var tempData = nui.get(grid_detail).data;
			var a = tempData.length;
			var b = 0;
			for (var i = 0; i < a; i++) {
				if (tempData[i].amount != undefined) {
					b = addFloat(b, tempData[i].amount);
				} else {
					var x = 0;
					b = addFloat(b, x)
				}
			}
			nui.get("proAppApplyPrice").setValue(b)
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

		function isClassified() {
			var classified = nui.get("classified").getValue();
			if (classified == "1") {
				nui.alert("涉密采购请线下进行")
				nui.get("classified").setValue("");
			}
		}
		
		function purchasModeChange(){
			var purchasMode = nui.get("purchasMode").getValue();
			if(purchasMode=="零星采购"){
				nui.get("supplierScope").setValue("2");
			}else{
				nui.get("supplierScope").setValue(null);
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
				nui.get("wayReason").setRequired(false);
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
				nui.get("wayReason").setRequired(true);
				nui.get("isDzcg").setRequired(true);
				nui.get("isGb").setRequired(true);
				nui.get("tenderLimit").setRequired(true);
			}
		}

		function isLimit() {
			if (nui.get("tenderLimit").getValue() == '1') {
				nui.get("limit").setRequired(true);
			} else {
				nui.get("limit").setRequired(false);
			}
		}

		function zhPutUnder(e) {
			return nui.getDictText('ZH_PUTUNDER', e.value);//设置业务字典值
		}

		function zhYn(e) {
			return nui.getDictText('MIS_YN', e.value);//设置业务字典值
		}

		function putunderChanged() {
			var putunder = nui.get("putunder").getValue()
			var rowsData = gridDtl.data;

			if (putunder) {
				var putunders = putunder.split(",");
			} else {
				putunders = [];
			}
			if (rowsData.length > 0) {
				for (var i = 0; i < rowsData.length; i++) {
					if (!putunders.includes(rowsData[i].putunder.toString())) {
						putunders.push(rowsData[i].putunder.toString())
					}
				}
				nui.get("putunder").setValue(putunders.toString());
			}
		}
	</script>

</body>
</html>