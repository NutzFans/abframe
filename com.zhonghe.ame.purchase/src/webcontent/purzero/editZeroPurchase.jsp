<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<%
	long workItemID = (Long) request.getAttribute("workItemID");
%>
<html>
<head>
<title>零星采购</title>
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
	<div class="nui-fit">
		<div class="mini-panel" title="" style="width: 100%;">
			<fieldset id="field1" style="border: solid 1px #aaa; padding: 3px; width: 98%;">
				<legend>零星采购信息</legend>
				<form id="form1" method="post">
					<input name="files" id="fileids" class="nui-hidden" />
					<input name="id" id="id" class="nui-hidden" />
					<div style="padding: 5px; margin-left: 5%;">
						<table style="table-layout: fixed;" id="table_file" width="60%">
							<tr>
								<td align="right" style="width: 140px">零星采购名称：</td>
								<td colspan="4">
									<input name="purchaseName" id="purchaseName" class="nui-textbox" required="true" style="width: 100%" required="true" />
								</td>
								<td width="120px" class="form_label" align="right">采购单位：</td>
								<td colspan="2">
									<input name="createdOrgname" id="createdOrgname" class="nui-textbox" required="true" style="width: 100%;" readonly="readonly" />
								</td>
							</tr>
							<tr>
								<td align="right" style="width: 140px">
									合同名称
									<span style="color: red;">(若有)</span>
									：
								</td>
								<td colspan="4">
									<input name="contract" id="contract" class="nui-textbox" style="width: 100%;" />
								</td>
								<td width="120px" class="form_label" align="right">总金额(万元)：</td>
								<td colspan="2">
									<input name="totalAmount" id="totalAmount" style="width: 100%" class="nui-textbox" required="true" />
								</td>
							</tr>
							<tr>
								<td align="right" style="width: 140px">供方/乙方/承包人全称：</td>
								<td colspan="4">
									<input name="contractor" id="contractor" required="true" class="nui-textbox" style="width: 100%;" />
								</td>
								<td align="right" style="width: 100px">预计采购时间：</td>
								<td colspan="2">
									<input name="purchaseDate" id="purchaseDate" class="nui-datepicker" style="width: 100%" required="true" />
								</td>
							</tr>
							<tr>
								<td class="form_label" align="right">申请原因：</td>
								<td colspan="7">
									<input style="width: 100%; height: 120px;" name="applyReason" class="nui-textarea" id="remark" required="true" />
								</td>
							</tr>
						</table>
					</div>
				</form>
				<fieldset style="height: 100%; border: solid 1px #aaa; padding: 3px; width: 90%;">
					<legend>计划明细</legend>
					<div class="fieldset-body" style="width: 100%; height: 100%; margin: 0px auto">
						<a class="nui-button" id="addbtn" iconCls="icon-add" onclick="addTicket()">增加</a>
						<a class="nui-button" id="deltbtn" iconCls="icon-remove" onclick="removeTicket()">删除</a>
						<div id="grid_traveldetail" class="nui-datagrid" style="width: 100%; height: auto;" allowCellSelect="true" showPager="false" allowCellEdit="true" multiSelect="true" oncellendedit="changeValueon"
							dataField="purZeroItem" url="com.zhonghe.ame.purchase.purchaseItems.queryPurZeroItem.biz.ext">
							<div property="columns">
								<div field="itemName" width="130" align="center" headerAlign="center" vtype="required">
									采购物项名称
									<input id="itemName" name="itemName" property="editor" class="nui-textbox" width="100%" />
								</div>
								<div field="brandSpec" width="130" align="center" headerAlign="center">
									品牌/型号/规格
									<input id="brandSpec" name="brandSpec" property="editor" class="nui-textbox" width="100%" />
								</div>

								<div field="unit" width="80" align="center" headerAlign="center">单位
									<input name="unit" property="editor" class="nui-textbox" style="width:100%;" />
								</div>
								
								<div field="onePrice" width="130" align="center" headerAlign="center" vtype="required">
									单价(万元)
									<input id="onePrice" name="onePrice" property="editor" class="nui-spinner" minValue="0" maxValue="999999999" width="100%" />
								</div>
								<div field="num" width="130" align="center" headerAlign="center" vtype="required">
									数量
									<input id="num" name="num" property="editor" class="nui-spinner" minValue="0" maxValue="999999999" width="100%" />
								</div>
								<div field="totalPrice" width="130" align="center" headerAlign="center">
									总价(万元)
									<input id="totalPrice" name="totalPrice" property="editor" class="nui-textbox" readonly="readonly" width="100%" />
								</div>
							</div>
						</div>
					</div>
				</fieldset>
			</fieldset>

			<fieldset id="field3" style="border: solid 1px #aaa; padding: 0px;">
				<jsp:include page="/purchase/common/inputFilePurchase.jsp" />
			</fieldset>

			<jsp:include page="/ame_common/misOpinion.jsp" />
		</div>
	</div>
	<div style="text-align: center; padding: 10px;" class="nui-toolbar">
		<a class="nui-button" onclick="onOk(0)" id="saveFeame" iconCls="icon-save" style="width: 80px; margin-right: 20px;">保存</a>
		<a class="nui-button" onclick="onOk(1)" id="creatFeame" iconCls="icon-ok" style="width: 80px; margin-right: 20px;">提交</a>
		<a class="nui-button" onclick="onOk(2)" id="zzFeame" iconCls="icon-split" style="width: 80px; margin-right: 20px;">中止</a>
		<a class="nui-button" onclick="closeCancel()" iconCls="icon-close" id="saveReimbProcess" style="width: 80px; margin-right: 140px;">关闭</a>
	</div>
	<script type="text/javascript">
		nui.parse();
		var form = new nui.Form("#form1");
		var grid_traveldetail = nui.get("grid_traveldetail");
		var type;
		init();
		function init() {
			var json = nui.encode({
				"workitemid" :<%=workItemID%>});
			nui.ajax({
				url : "com.zhonghe.ame.purchase.purchaseItems.queryPurZeroDetail.biz.ext",
				type : 'POST',
				data : json,
				success : function(o) {
					if (o.purZero.totalAmount >= 5) {
						$(".leader").css("display", "");
					}
					if (o.workitem.activityInstName == "提交备案") {
						form.setEnabled(false);
						$(".selectReportUser").css("display", "");
						$("#saveFeame").css("display", "none");
						$("#zzFeame").css("display", "none");
						nui.get("reportUser").setEnabled(true)
					}
					form.setData(o.purZero)
					//设置审核意见基本信息
					nui.get("processinstid").setValue(o.workitem.processInstID);
					nui.get("processinstname").setValue(o.workitem.processInstName);
					nui.get("activitydefid").setValue(o.workitem.activityDefID);
					nui.get("workitemname").setValue(o.workitem.workItemName);
					nui.get("workitemid").setValue(<%=workItemID%>);
					nui.get("isshow").setValue("1");
					nui.get("auditstatus").setValue("4");
					document.getElementById("salesEdit").style.display = "none";
					nui.get("auditopinion").setValue("");
					//查询审核意见
					var grid = nui.get("datagrid1");
					if (o.workitem.processInstID != null || o.workitem.processInstID != "") {
						grid.load({
							processInstID : o.workitem.processInstID
						});
						grid.sortBy("time", "desc");
					}
					initMisOpinion({
						auditstatus : "1"
					});

					var jsonData = {
						"zeroId" : o.purZero.id
					}

					grid_traveldetail.load(jsonData);

					// 查询附件
					var grid_0 = nui.get("grid_0");
					grid_0.load({
						"groupid" : "purchaseZero",
						"relationid" : o.purZero.id
					});
					grid_0.sortBy("fileTime", "desc");

				},
				error : function(jqXHR, textStatus, errorThrown) {
					alert(jqXHR.responseText);
				}
			});
		}
		
		function changeValueon(e) {
			var record = e.record;
			if (e.field == "num" || e.field == "onePrice") {
				if (record.num != null && record.onePrice != null) {
					var totalPrice1 = mulFloat(record.num, record.onePrice);
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

		//选择部门领导
		function selectManager() {
			var btnEdit = this;
			selectUser(function(data) {
				btnEdit.setValue(data.userid);
				btnEdit.setText(data.empname);
				nui.get("managerName").setValue(data.empname)
			})
		}
		
		//选择分管领导
		function selectLeader() {
			var btnEdit = this;
			selectUser(function(data) {
				btnEdit.setValue(data.userid);
				btnEdit.setText(data.empname);
				nui.get("leaderName").setValue(data.empname)
			})
		}

		//选择备案人员
		function selectReportUser() {
			var btnEdit = this;
			selectUser(function(data) {
				btnEdit.setValue(data.userid);
				btnEdit.setText(data.empname);
				nui.get("reportUserName").setValue(data.empname)
			})
		}

		//添加附件功能
		function onOk(e) {
			type = e;
			var formData = form.getData(), gridChanges = grid_traveldetail.getChanges(), gridData = grid_traveldetail.getData();
			var totalAmount = nui.get("totalAmount").getValue();
			formData.type = type;
			if (type == 1) {
				if (!form.validate() || gridData.length < 1) {
					nui.alert("请检查表单和采购明细填写是否完整!");
					return;
				}
				if (totalAmount >= 10) {
					alert("零星采购总金额不能大于10万元");
					return;
				}
				grid_traveldetail.validate();
				if (grid_traveldetail.isValid() == false) {
					var error = grid_traveldetail.getCellErrors()[0];
					grid_traveldetail.beginEditCell(error.record, error.column);
					return;
				}
				info = "是否提交？"
			} else if (type == 0) {
				info = "是否暂时保存？"
			} else {
				info = "是否中止流程？"
				nui.get("auditstatus").setValue(2);
			}
			document.getElementById("fileCatalog").value = "purchaseZero";
			nui.confirm("确定" + info, "系统提示", function(action) {
				if (action == "ok") {
					fileForm.submit();
				}
			})
		}

		function SaveData1() {
			var formData = form.getData(), gridChanges = grid_traveldetail.getChanges(), gridData = grid_traveldetail.getData();
			var totalAmount = nui.get("totalAmount").getValue();
			formData.type = type;
			if (type == 1) {
			} else if (type == 0) {
			} else {
				nui.get("auditstatus").setValue(2);
			}
			formData.files = nui.get("fileids").getValue();
			var data_opioion = opioionform.getData();
			var json = nui.encode({
				"purZero" : formData,
				"purZeroItem" : gridChanges,
				"misOpinion" : data_opioion.misOpinion
			});
			if (!confirm(info)) {
				nui.get("saveFeame").enable();
				nui.get("creatFeame").enable();
				nui.get("zzFeame").enable();
				return;
			} else {
				ajaxCommon({
					"url" : "com.zhonghe.ame.purchase.purzero.editPurZero.biz.ext",
					"data" : json,
					"success" : function(data) {
						if (type == 1) {
							showTips("提交成功")
							closeOk();
						} else if (type == 0) {
							showTips("暂时保存成功")
							closeOk();
						} else {
							showTips("中止成功")
							closeOk();
						}
					}
				});
			}
		}

		function addTicket() {
			var rowS = {
				name : "New Row"
			}
			grid_traveldetail.addRow(rowS);
		}

		function removeTicket() {
			var rows = grid_traveldetail.getSelecteds();
			if (rows.length > 0) {
				grid_traveldetail.removeRows(rows, true);
				totalAmount();
			} else {
				nui.alert("请至少选中一条记录！");
			}
		}

		//计算总金额
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

		//判断是否是项监部
		function isExist(judge) {
			var bool;
			var json = nui.encode({
				org : {
					"orgid" : userOrgId
				}
			});
			nui.ajax({
				url : "com.zhonghe.ame.purchase.common.queryOrgByOrgId.biz.ext",
				data : json,
				async : false,
				type : "post",
				success : function(text) {
					if (text.res.branch == "4" || text.res.branch == "5") {
						judge = 3;
					}

				}
			});
			return judge;
		}
		
	</script>
</body>
</html>