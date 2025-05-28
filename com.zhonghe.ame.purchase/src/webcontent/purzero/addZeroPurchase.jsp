<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<head>
<title>小额采购及立项申请</title>
<style type="text/css">
body {
	margin: 0;
	padding: 0;
	border: 0;
	width: 100%;
	height: 100%;
	overflow: hidden;
}
</style>
</head>
<body>
	<div class="nui-fit" style="padding: 5px;">
		<fieldset id="field1" style="border: solid 1px #aaa;">
			<legend> 小额采购及立项申请 </legend>
			<form id="form1" method="post">
				<input name="files" id="fileids" class="nui-hidden" />
				<div style="padding: 5px;">
					<table style="table-layout: fixed;">
						<tr>
							<td align="right" style="width: 140px">小额采购名称：</td>
							<td colspan="2">
								<input name="purchaseName" id="purchaseName" class="nui-textbox" required="true" style="width: 400px" required="true" />
							</td>
							<td align="right" style="width: 140px">采购单位：</td>
							<td>
								<input name="createdOrgname" id="createdOrgname" class="nui-textbox" required="true" style="width: 200px;" readonly="readonly" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 140px">
								合同名称
								<span style="color: red;">(若有)</span>
								：
							</td>
							<td colspan="2">
								<input name="contract" id="contract" class="nui-textbox" style="width: 100%;" />
							</td>
							<td align="right" style="width: 140px">总金额(万元)：</td>
							<td>
								<input name="totalAmount" id="totalAmount" style="width: 100%" class="nui-textbox" readonly="readonly" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 140px">供方/乙方/承包人全称：</td>
							<td colspan="2">
								<input name="contractor" id="contractor" class="nui-textbox" required="true" style="width: 100%;" />
							</td>
							<td align="right" style="width: 140px">预计采购时间：</td>
							<td>
								<input name="purchaseDate" id="purchaseDate" class="nui-datepicker" style="width: 100%" required="true" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 140px">是否为科研项目：</td>
							<td colspan="2">
								<input name="keYanProject" id="keYanProject" class="nui-dictcombobox" dictTypeId="ZH_YN" style="width: 100%;" required="true" />
							</td>
							<td align="right" style="width: 140px">是否已有年度采购计划：</td>
							<td>
								<input name="isPlan" id="isPlan" class="nui-dictcombobox" dictTypeId="ZH_YN" style="width: 200px" required="true" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 140px">申请原因、市场调研情况或比价情况：</td>
							<td colspan="5">
								<input style="width: 100%; height: 120px;" name="applyReason" class="nui-textarea" id="remark" required="true" />
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
								<a class="nui-button" id="deltbtn" iconCls="icon-remove" onclick="removeTicket()">删除</a>
							</td>
						</tr>
					</table>
				</div>
			</div>
			<div id="grid_traveldetail" class="nui-datagrid" style="width: 100%; height: auto;" allowCellSelect="true" showPager="false" allowCellEdit="true" multiSelect="true" oncellendedit="changeValueon">
				<div property="columns">
					<div type="checkcolumn"></div>
					<div field="itemName" width="130" align="center" headerAlign="center" vtype="required">
						采购物项名称
						<input name="itemName" property="editor" class="nui-textbox" width="100%" />
					</div>
					<div field="brandSpec" width="130" align="center" headerAlign="center">
						品牌/型号/规格
						<input name="brandSpec" property="editor" class="nui-textbox" width="100%" />
					</div>
					<div field="unit" width="80" align="center" headerAlign="center">
						单位
						<input name="unit" property="editor" class="nui-textbox" style="width: 100%;" />
					</div>
					<div field="onePrice" align="center" headerAlign="center" vtype="float">
						<span style="color: red;">单价(万元)</span>
						<input name="onePrice" property="editor" class="nui-textbox" width="100%" />
					</div>
					<div field="num" align="center" headerAlign="center" vtype="required">
						数量
						<input name="num" property="editor" class="nui-spinner" minValue="0" value="0" maxValue="999999999" width="100%" />
					</div>
					<div field="totalPrice" width="130" align="center" headerAlign="center">
						<span style="color: red;">总价(万元)</span>
						<input name="totalPrice" property="editor" class="nui-textbox" readonly="readonly" width="100%" />
					</div>
				</div>
			</div>
		</fieldset>

		<fieldset id="field2" style="border: solid 1px #aaa;">
			<legend>上传附件</legend>
			<jsp:include page="/ame_common/inputFile.jsp" />
		</fieldset>
	</div>

	<div style="text-align: center; position: relative; bottom: 10px" class="nui-toolbar">
		<a class="nui-button" onclick="onOk(0)" id="saveReimb" iconCls="icon-save" style="width: 80px; margin-right: 20px;">暂存</a>
		<a class="nui-button" onclick="onOk(1)" id="creatReimbProcess" iconCls="icon-ok" style="width: 80px; margin-right: 20px;">提交</a>
		<a class="nui-button" onclick="closeCancel" id="saveReimbProcess" iconCls="icon-close" style="width: 80px; margin-right: 140px;">关闭</a>
	</div>

	<script type="text/javascript">
		nui.parse();
		var form = new nui.Form("#form1");
		var grid_traveldetail = nui.get("grid_traveldetail");
		var type;

		init();

		function init() {
			getSecOrg(userOrgId);
		}

		function getSecOrg(userOrgId) {
			var json = nui.encode({
				'userOrgId' : userOrgId
			});
			ajaxCommon({
				url : "com.primeton.eos.common.orgUtils.getSecOrg.biz.ext",
				data : json,
				success : function(result) {
					var data = result.data;
					nui.get("createdOrgname").setValue(data.ORGNAME);
				}
			});
		}

		function changeValueon(e) {
			var record = e.record;
			if (e.field == "num" || e.field == "onePrice") {
				if (record.num != null && record.onePrice != null) {
					var totalPrice1 = mulFloat(record.num, record.onePrice).toString();
					if(record.hasOwnProperty('sumamount')){
						if (Number(totalPrice1) > Number(record.sumamount)) {
							showTips("总价不能超过剩余可立项的金额："+record.sumamount+"（万元）", "danger");
							return;
						}
					}
					grid_traveldetail.updateRow(e.row, {
						totalPrice : totalPrice1
					});
					totalAmount();
				} else {
					grid_traveldetail.updateRow(e.row, {
						totalPrice : ""
					});

				}
			}
		}

		function addTicket() {
			var isPlan = nui.get("isPlan").getValue();
			if (!isPlan) {
				showTips("请先选择是否有采购计划", "danger");
				return;
			} else {
				if (isPlan == "0") {
					var rowS = {
						name : "New Row"
					}
					grid_traveldetail.addRow(rowS);
					if (grid_traveldetail.getData().length > 0) {
						nui.get("isPlan").setReadOnly(true);
					}
				}else if(isPlan == "1"){
					nui.open({
						url : "/default/purchase/common/selectPurchasePlan.jsp",
						title : "小额采购 - 采购计划选择",
						width : '1300',
						height : '610',
						onload : function() {
							var iframe = this.getIFrameEl();
							iframe.contentWindow.initData({
								"type" : "2",
								"orgId" : userOrgId
							});
						},
						ondestroy : function(action) {
							if (action == "ok") {
								var iframe = this.getIFrameEl();
								var data = iframe.contentWindow.GetData();
								data = nui.clone(data);
								if (data && data.length > 0) {
									var rows = grid_traveldetail.getData();
									if (rows) {
										index = grid_traveldetail.indexOf(rows[rows.length - 1]);
										index = index + 1;
									}
									for (var i = 0; i < data.length; i++) {
										data[i].planId = data[i].id
										data[i].id = null
										data[i].planCode = data[i].code
										data[i].itemName = data[i].materialName
										data[i].brandSpec = data[i].purchaseFirstName+" - "+data[i].purchaseTwoName
										data[i].unit = nui.getDictText("ZH_UNIT", data[i].newUnit)
										data[i].num = data[i].newNumber
									}
									grid_traveldetail.addRows(data, index);
									if (grid_traveldetail.getData().length > 0) {
										nui.get("isPlan").setReadOnly(true);
									}
								}
							}
						}
					});
				}
			}
		}

		function removeTicket() {
			var rows = grid_traveldetail.getSelecteds();
			if (rows.length > 0) {
				grid_traveldetail.removeRows(rows, true);
				if (grid_traveldetail.getData().length == 0) {
					nui.get("isPlan").setReadOnly(false);
				}
				totalAmount();
			} else {
				showTips("请至少选中一条记录！", "danger");
			}
		}

		function totalAmount() {
			var tempData = grid_traveldetail.data;
			var a = tempData.length;
			var b = 0;
			for (var i = 0; i < a; i++) {
				if (!!tempData[i].totalPrice && tempData[i].totalPrice > 0) {
					b = addFloat(b, tempData[i].totalPrice)
				} else {
					var x = 0;
					b = addFloat(b, x)
				}
			}
			nui.get("totalAmount").setValue(b)
		}

		function isStrEmpty(obj) {
			if (typeof obj == "undefined" || obj == null || obj == "") {
				return true;
			} else {
				return false;
			}
		}

		function onOk(e) {
			type = e;
			var info;
			if (type == 0) {
				var purchaseName = nui.get("purchaseName").getValue();
				if (isStrEmpty(purchaseName)) {
					showTips("请填写小额采购名称并保证其正确性！", "danger");
					return;
				}
				info = "暂存流程表单？"
			} else if (type == 1) {
				if (!form.validate()) {
					showTips("请检查表单的完整性!", "danger");
					return;
				}
				var totalAmount = nui.get("totalAmount").getValue();
				if (totalAmount > 2) {
					showTips("小额采购总金额不能大于2万元!", "danger");
					return;
				}
				var gridData = grid_traveldetail.getData();
				if(gridData.length > 0){
					grid_traveldetail.validate();
					if (grid_traveldetail.isValid() == false) {
						var error = grid_traveldetail.getCellErrors()[0];
						grid_traveldetail.beginEditCell(error.record, error.column);
						showTips("明细数据有错误，请检查!", "danger");
						return;
					}
				}else{
					showTips("请填写明细数据!", "danger");
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
				info = "提交流程表单？"
			}

			document.getElementById("fileCatalog").value = "purchaseZero";

			nui.confirm("确定" + info, "系统提示", function(action) {
				if (action == "ok") {
					nui.get("saveReimb").disable();
					nui.get("creatReimbProcess").disable();
					nui.mask({
						el : document.body,
						cls : 'mini-mask-loading',
						html : '表单提交中...'
					});
					form2.submit();
				}
			});
		}

		function SaveData() {
			setTimeout(function() {
				nui.unmask(document.body);
				var formData = form.getData();
				var gridData = grid_traveldetail.getData();
				formData.type = type;
				formData.files = nui.get("fileids").getValue();
				var json = nui.encode({
					"purZero" : formData,
					"purZeroItem" : gridData
				});
				ajaxCommon({
					"url" : "com.zhonghe.ame.purchase.purchaseItems.addPurZero.biz.ext",
					data : json,
					contentType : 'text/json',
					success : function(text) {
						if (text.result == "1") {
							showTips("操作成功");
							closeOk();
						} else {
							nui.get("saveReimb").enable();
							nui.get("creatReimbProcess").enable();
						}
					}
				});
			}, 2000);
		}
	</script>

</body>
</html>