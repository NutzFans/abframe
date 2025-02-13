<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<head>
<title>开具发票申请</title>
<style type="text/css">
body {
	margin: 0;
	padding: 0;
	border: 0;
	width: 100%;
	height: 100%;
	overflow: hidden;
}

.hidden {
	display: none;
}
</style>
</head>
<body>
	<div class="nui-fit" style="padding: 5px;">
		<fieldset id="field1" style="border: solid 1px #aaa;">
			<legend>开具发票申请</legend>
			<form id="form1" method="post">
				<input name="files" id="fileids" class="nui-hidden" />
				<input class="nui-hidden" name="id" />
				<input class="nui-hidden" name="processid" />
				<div style="padding: 5px;">
					<table style="table-layout: fixed;">
						<tr>
							<td class="form_label" align="right">申请人：</td>
							<td>
								<input name="createUserid" id="createUserid" class="nui-hidden" style="width: 300px" />
								<input id="createUsername" name="createUsername" class="nui-textbox" enabled="false" style="width: 300px" required="true" />
							</td>
							<td align="right" style="width: 160px">合同实施部门：</td>
							<td>
								<input name="implementOrg" id="implementOrg" class="nui-hidden" style="width: 300px;" />
								<input name="implementOrgname" id="implementOrgname" class="nui-textbox" enabled="false" style="width: 300px" required="true" />
							</td>
							<td align="right" style="width: 160px">申请日期：</td>
							<td>
								<input id="createTime" name="createTime" enabled="false" class="nui-datepicker" style="width: 300px" required="true" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 160px">合同编号：</td>
							<td>
								<input id="contractNo" name="contractNo" onbuttonclick="onButtonEdit" class="nui-buttonedit" style="width: 300px" required="true" allowInput="false" emptyText="必填项，数据来源于收费合同" />
							</td>
							<td align="right" style="width: 160px">合同名称：</td>
							<td colspan="3">
								<input id="contractName" name="contractName" class="nui-textbox" style="width: 100%" required="true" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 100px">专业类别：</td>
							<td>
								<input id="major" name="major" class="nui-dictcombobox" dictTypeId="ZH_MAJOR_TYPE" style="width: 300px" required="true" />
							</td>
							<td align="right" style="width: 160px">工程类别：</td>
							<td>
								<input id="projectType" name="projectType" class="nui-dictcombobox" dictTypeId="ZH_PROJECT_TYPE" style="width: 300px" required="true" enabled="false" />
							</td>
							<td align="right" style="width: 160px">集团内外：</td>
							<td>
								<input id="headquarterGroup" name="headquarterGroup" class="nui-dictcombobox" dictTypeId="ZH_GROUP" style="width: 300px" required="true" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 160px">服务范围：</td>
							<td>
								<input name="bidService" id="bidService" class="nui-dictcombobox" dictTypeId="ZH_BID_SERVICE" style="width: 300px" required="true" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 160px">发票抬头类别：</td>
							<td>
								<input name="invoiceNameType" id="invoiceNameType" class="nui-dictcombobox" dictTypeId="ZH_INVOICE_NAME_TYPE" style="width: 300px" required="true" />
							</td>
							<td align="right" style="width: 160px">发票类型：</td>
							<td>
								<input name="invoiceType" id="invoiceType" class="nui-dictcombobox" dictTypeId="MIS_MA_INVOICETYPE" style="width: 300px" required="true" />
							</td>
							<td align="right" style="width: 160px">税率（%）：</td>
							<td>
								<input name="invoiceRate" id="invoiceRate" class="nui-textbox" style="width: 300px" required="true" onvaluechanged="editContractSum" value="6" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 160px">用途：</td>
							<td>
								<input name="invoiceUsed" id="invoiceUsed" class="nui-dictcombobox" dictTypeId="INVOICE_USED" style="width: 300px" required="true" />
							</td>
							<td align="right" style="width: 160px">本次收款进度：</td>
							<td>
								<input id="payType" name="payType" class="nui-dictcombobox" dictTypeId="payType" style="width: 300px" required="true" />
							</td>
							<td align="right" style="width: 160px">合同金额（元）：</td>
							<td>
								<input id="invoiceSumCapital" name="invoiceSumCapital" class="nui-textbox" vtype="float" required="true" style="width: 300px" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 160px">开票金额（元）：</td>
							<td>
								<input id="invoiceSum" name="invoiceSum" id="invoiceSum" class="nui-textbox" vtype="float" style="width: 300px" required="true" onvaluechanged="editContractSum" />
							</td>
							<td align="right" style="width: 160px">账面收入（元）：</td>
							<td>
								<input id="bookIncome" name="bookIncome" class="nui-textbox" style="width: 300px" required="true" enabled="false" />
							</td>
							<td align="right" style="width: 160px">税额：</td>
							<td>
								<input name="invoiceTax" id="invoiceTax" class="nui-textbox" style="width: 300px" required="true" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 160px">开票金额大写：</td>
							<td colspan="3">
								<input id="invoiceSumChinese" class="nui-textbox" style="width: 100%" required="true" enabled="false" />
							</td>
							<td align="right" style="width: 160px">是否有产值分配：</td>
							<td>
								<input id="allotFlag" name="allotFlag" class="nui-dictcombobox" dictTypeId="ZH_YN" style="width: 100%" required="true" onvaluechanged="allotFlagChange" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 160px">名称：</td>
							<td colspan="5">
								<input name="payerName" id="payerName" class="nui-textbox" style="width: 100%" required="true" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 160px">纳税人识别号：</td>
							<td colspan="5">
								<input name="taxpayerNumber" id="taxpayerNumber" class="nui-textbox" style="width: 100%" required="true" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 160px">发票备注：</td>
							<td colspan="5">
								<input name="invoiceRemark" id="invoiceRemark" class="nui-textbox" style="width: 100%" required="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 160px">数电发票接收人邮箱：</td>
							<td colspan="5">
								<input name="invoiceUserMail" class="nui-textbox" style="width: 100%" required="true" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 160px">备注：</td>
							<td colspan="5">
								<input name="remark" class="nui-textarea" style="width: 100%; height: 235px" required="false" />
							</td>
						</tr>
					</table>
				</div>
			</form>
		</fieldset>

		<fieldset id="field3" style="border: solid 1px #aaa;" class="hidden">
			<legend>
				产值分配
				<span style="color: red">（金额单位：元）</span>
			</legend>
			<div>
				<div class="nui-toolbar" style="border-bottom: 0; padding: 0px;">
					<table style="width: 100%;">
						<tr>
							<td style="width: 100%;">
								<a class="nui-button" iconCls="icon-add" onclick="addRow()" plain="true">增加</a>
								<a class="nui-button" iconCls="icon-remove" onclick="removeRow()" plain="true">删除</a>
							</td>
						</tr>
					</table>
				</div>
			</div>
			<div id="allotDataGrid" class="nui-datagrid" style="width: 100%; height: 150px;" allowCellEdit="true" allowCellSelect="true" showPager="false" oncellbeginedit="onCellBeginEdit"
				oncellendedit="onCellEndEdit">
				<div property="columns">
					<div type="checkcolumn">○</div>
					<div field="username" headerAlign="center">
						申请人
						<input property="editor" class="nui-buttonedit" style="width: 100%;" onbuttonclick="czfpUserSelect" required="true" allowInput="false" />
					</div>
					<div field="orgname" headerAlign="center">承办部门</div>
					<div field="invoiceSum" headerAlign="center">
						开票金额（元）
						<input property="editor" class="nui-textbox" style="width: 100%;" required="true" />
					</div>
					<div field="bookIncome" headerAlign="center">账面收入（元）</div>
					<div field="invoiceTax" headerAlign="center">税额（元）</div>
				</div>
			</div>
		</fieldset>

		<fieldset id="field2" style="border: solid 1px #aaa;">
			<legend>上传附件</legend>
			<jsp:include page="/ame_common/inputFile.jsp" />
		</fieldset>

		<jsp:include page="/ame_common/misOpinion.jsp" />
	</div>

	<div style="text-align: center; position: relative; bottom: 10px" class="nui-toolbar">
		<a class="nui-button" onclick="onOk(0)" id="saveFeame" iconCls="icon-save" style="width: 80px; margin-right: 20px;">保存</a>
		<a class="nui-button" onclick="onOk(1)" id="creatFeame" iconCls="icon-ok" style="width: 80px; margin-right: 20px;">提交</a>
		<a class="nui-button" onclick="onOk(2)" id="zzFeame" iconCls="icon-split" style="width: 80px; margin-right: 20px;">中止</a>
		<a class="nui-button" onclick="closeCancel" iconCls="icon-close" style="width: 80px;">关闭</a>
	</div>

	<script type="text/javascript">
		nui.parse();
		<%long workItemID = (Long) request.getAttribute("workItemID");%>
		var form = new nui.Form("form1");
		var allotDataGrid = nui.get("allotDataGrid");
		var type;

		init();

		function init() {
			var data = {workItemID :<%=workItemID%>};
			var json = nui.encode(data);
			ajaxCommon({
				url : "com.zhonghe.ame.invoice.invoice.getInvoiceProcess.biz.ext",
				data : json,
				success : function(o) {
					form.setData(o.invoice);
					nui.get("contractNo").setText(o.invoice.contractNo);
					nui.get("invoiceSumChinese").setValue(functiondigitUppercase(nui.get("invoiceSum").getValue()));
					queryAllotDatas(o.invoice.id);
					//附件查询
					var grid_0 = nui.get("grid_0");
					grid_0.load({
						"groupid" : "INVOICE",
						"relationid" : o.invoice.id
					});
					grid_0.sortBy("fileTime", "desc");
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
				}
			});
		}
		
		function queryAllotDatas(invoiceId) {
			nui.ajax({
				url : "com.zhonghe.ame.invoice.invoice.queryAllotDatas.biz.ext",
				type : "post",
				contentType : 'text/json',
				data : {
					"invoiceId" : invoiceId
				},
				success : function(result) {
					var allotFlag = nui.get("allotFlag").getValue();
					if (result.data.length > 0 && allotFlag === '1') {
						$('#field3').removeClass('hidden');
						nui.parse();
						allotDataGrid.setData(result.data);
					}
				}
			})
		}

		function onButtonEdit(e) {
			var btnEdit = this;
			mini.open({
				url : "/default/contractPact/invoice/invoiceContracList.jsp",
				title : "选择合同 - 收费合同信息",
				width : '1200',
				height : '610',
				ondestroy : function(action) {
					if (action == "ok") {
						var iframe = this.getIFrameEl();
						var data = iframe.contentWindow.GetData();
						data = mini.clone(data); //必须
						if (data) {
							console.log(data);
							btnEdit.setValue(data.contractNo);
							btnEdit.setText(data.contractNo);
							nui.get("contractName").setValue(data.contractName);
							nui.get("major").setValue(data.major);
							nui.get("projectType").setValue(data.projectType);
							nui.get("headquarterGroup").setValue(data.headquarterGroup);
							nui.get("payerName").setValue(data.signatoryName);
							nui.get("invoiceNameType").setValue(data.payee);
							nui.get("invoiceSumCapital").setValue(data.contractSum);
							btnEdit.doValueChanged();
						}
					}

				}
			});
		}

		function editContractSum() {
			var rate = nui.get("invoiceRate").getValue();
			var invoiceSum = nui.get("invoiceSum").getValue();
			var c = rate / 100;
			var s = 1 + c;
			var bookIncome = invoiceSum / s;
			abs = function(val) {
				var str = (val).toFixed(2) + '';
				var intSum = str.substring(0, str.indexOf(".")).replace(/\B(?=(?:\d{3})+$)/g, '');
				var dot = str.substring(str.length, str.indexOf("."))
				var ret = intSum + dot;
				return ret;
			}
			nui.get("bookIncome").setValue(abs(bookIncome));
			nui.get("invoiceTax").setValue(abs(invoiceSum - abs(bookIncome)));
		}

		function functiondigitUppercase(price) {
			if (price.substr(0, 1) == "-") {
				price = price.slice(1);
			}
			price = price * 1.0;
			if (price === 0) {
				return "零";
			}
			var unit = "仟佰拾亿仟佰拾万仟佰拾元角分", str = "";
			price += "00";
			var point = price.indexOf('.');
			if (point >= 0) {
				price = price.substring(0, point) + price.substr(point + 1, 2);
			}
			unit = unit.substr(unit.length - price.length);
			for (var i = 0; i < price.length; i++) {
				str += '零壹贰叁肆伍陆柒捌玖'.charAt(price.charAt(i)) + unit.charAt(i);
			}
			var result = str.replace(/零(仟|佰|拾|角)/g, "零").replace(/(零)+/g, "零").replace(/零(万|亿|元)/g, "$1").replace(/(亿)万/g, "$1$2").replace(/^元零?|零分/g, "").replace(/元$/g, "元整");
			return result;
		}

		function allotFlagChange() {
			var allotFlag = nui.get("allotFlag").getValue();
			if (allotFlag === '1') {
				$('#field3').removeClass('hidden');
				nui.parse();
				var data = [ {
					"userid" : nui.get('createUserid').getValue(),
					"username" : nui.get('createUsername').getValue(),
					"orgid" : nui.get('implementOrg').getValue(),
					"orgname" : nui.get('implementOrgname').getValue(),
					"invoiceSum" : 0,
					"bookIncome" : 0,
					"invoiceTax" : 0,
					"dataType" : "1"
				} ]
				allotDataGrid.setData(data);
			}
			if (allotFlag === '0') {
				$('#field3').addClass('hidden');
				nui.parse();
				var data = [];
				allotDataGrid.setData(data);
			}
		}
		
		function onCellBeginEdit(e) {
			var record = e.record;
			var field = e.field;
			if (field == "username" && record.dataType == "1") {
				// dataType的值为1时，申请人字段不能编辑
				e.cancel = true;
			}
		}
		
		function onCellEndEdit(e) {
			var record = e.record;
			var field = e.field;
			if (field == "invoiceSum") {
				var rate = nui.get("invoiceRate").getValue();
				var invoiceSum = record.invoiceSum;
				var c = rate / 100;
				var s = 1 + c;
				var bookIncome = invoiceSum / s;
				abs = function(val) {
					var str = (val).toFixed(2) + '';
					var intSum = str.substring(0, str.indexOf(".")).replace(/\B(?=(?:\d{3})+$)/g, '');
					var dot = str.substring(str.length, str.indexOf("."))
					var ret = intSum + dot;
					return ret;
				}
				bookIncome = abs(bookIncome);
				var invoiceTax = abs(invoiceSum - bookIncome);
				allotDataGrid.updateRow(record, {
					"bookIncome" : bookIncome,
					"invoiceTax" : invoiceTax
				});
			}
		}
		
		function czfpUserSelect() {
			mini.open({
				url : "/default/contractPact/invoice/selectCzfpUser.jsp",
				title : "产值分配 - 选择经办人",
				width : '500',
				height : '350',
				ondestroy : function(action) {
					if (action == "ok") {
						var iframe = this.getIFrameEl();
						var data = iframe.contentWindow.GetData();
						data = mini.clone(data); //必须
						allotDataGrid.cancelEdit();
						var row = allotDataGrid.getSelected();
						allotDataGrid.updateRow(row, {
							"userid" : data.userid,
							"username" : data.empname,
							"orgid" : data.orgid,
							"orgname" : data.orgname,
							"invoiceSum" : 0,
							"bookIncome" : 0,
							"invoiceTax" : 0,
							"dataType" : "0"
						});
					}
				}
			});
		}
		
		function addRow() {
			var newRow = {
				"invoiceSum" : 0,
				"bookIncome" : 0,
				"invoiceTax" : 0,
				"dataType" : "0"
			};
			var size = allotDataGrid.getData().length;
			allotDataGrid.addRow(newRow, size + 1);
		}

		function removeRow() {
			var row = allotDataGrid.getSelecteds();
			if (row.length > 0 && row[0].dataType != "1") {
				allotDataGrid.removeRows(row, true);
			} else {
				showTips("该选中记录是系统生成的无法删除", "danger");
			}
		}								

		function onOk(e) {
			//定义变量接受form表单数据
			var form = new nui.Form("#form1");
			type = e;
			if (type == 1) {
				form.validate();
				if (form.isValid() == false) {
					showTips("请检查表单的完整性!", "danger");
					return;
				}
				var allotFlag = nui.get("allotFlag").getValue();
				if (allotFlag == "1") {
					var rows = allotDataGrid.getData();
					var sum = rows.reduce((acc, curr) => acc + Number(curr.invoiceSum), 0);
					var invoiceSum = Number(nui.get("invoiceSum").getValue());
					if(sum != invoiceSum){
						showTips("产值分配的开票金额之和,需要等于表单中开票金额字段的值", "danger");
						return;
					}
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
			nui.get("saveFeame").disable();
			nui.get("creatFeame").disable();
			nui.get("zzFeame").disable();
			document.getElementById("fileCatalog").value = "invoiceinfo";
			form2.submit();
		}

		function SaveData() {
			var form = new nui.Form("#form1");
			var data = form.getData();
			var allotDatas = allotDataGrid.getData();
			var info = "";
			data.type = type;
			if (type == 1) {
				info = "是否提交？"
			} else if (type == 0) {
				info = "是否暂时保存？"
			} else {
				info = "是否中止流程？"
				nui.get("auditstatus").setValue(2);
			}
			var data_opioion = opioionform.getData();
			data.files = nui.get("fileids").getValue();
			var json = nui.encode({
				'cpData' : data,
				'allotDatas': allotDatas,
				"misOpinion" : data_opioion.misOpinion
			});
			if (!confirm(info)) {
				nui.get("saveFeame").enable();
				nui.get("creatFeame").enable();
				nui.get("zzFeame").enable();
				return;
			} else {
				ajaxCommon({
					url : "com.zhonghe.ame.invoice.invoice.editinvoice.biz.ext",
					data : json,
					success : function(text) {
						if (text.result == "1") {
							if (type == 1) {
								showTips("开票申请流程提交成功");
								closeOk();
							} else if (type == 0) {
								showTips("开票申请流程暂时保存成功")
								closeOk();
							} else {
								showTips("中止成功")
								closeOk();
							}
						} else {
							showTips("提交失败！");
							nui.get("saveFeame").enable();
							nui.get("creatFeame").enable();
							nui.get("zzFeame").enable();
						}
					}
				});
			}
		}
	</script>

</body>
</html>