<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.util.List"%>
<%@page import="commonj.sdo.DataObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@ page import="java.util.Map"%>
<%
	String contextPath=request.getContextPath();
%>
<html>
<head>
<title>开票信息维护</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%=request.getContextPath()%>/common/nui/nui.js" type="text/javascript"></script>
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
	<div class="nui-fit">
		<div class="mini-panel" title="" style="width: 100%;">
			<fieldset id="field1" style="border: solid 1px #aaa; padding: 3px; width: 100%;">
				<legend>开票信息</legend>
				<form id="form1" method="post">
					<input name="files" id="fileids" class="nui-hidden" />
					<input class="nui-hidden" name="id" />
					<input class="nui-hidden" name=historyActualInvoiceSum id="historyActualInvoiceSum" />
					<div style="padding: 5px;">
						<table style="table-layout: fixed;">
							<tr>
								<td class="form_label" align="right">申请人</td>
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
									<input id="contractNo" name="contractNo" onbuttonclick="onButtonEdit" class="nui-buttonedit" style="width: 300px" required="true" />
								</td>
								<td align="right" style="width: 160px">合同名称：</td>
								<td colspan="3">
									<input id="contractName" name="contractName" class="nui-textbox" style="width: 100%" required="true" />
								</td>
							</tr>
							<tr>
								<td align="right" style="width: 100px">专业类别：</td>
								<td>
									<input id="major" name="major" class="nui-dictcombobox" dictTypeId="ZH_MAJOR_TYPE" style="width: 300px" required="true" />
								</td>
								<td align="right" style="width: 160px">工程类别：</td>
								<td>
									<input id="projectType" name="projectType" class="nui-dictcombobox" dictTypeId="ZH_PROJECT_TYPE" style="width: 300px" required="true" />
								</td>
								<td align="right" style="width: 160px">集团内外：</td>
								<td>
									<input id="headquarterGroup" name="headquarterGroup" class="nui-dictcombobox" dictTypeId="ZH_GROUP" style="width: 300px" required="true" />
								</td>
							</tr>
							<tr>
								<td align="right" style="width: 160px">服务范围：</td>
								<td>
									<input name="bidService" id="bidService" class="nui-dictcombobox" dictTypeId="ZH_BID_SERVICE" style="width: 300px" required="true" />
								</td>
							</tr>
							<tr>
								<td align="right" style="width: 160px">发票抬头类别：</td>
								<td>
									<input name="invoiceNameType" id="invoiceNameType" class="nui-dictcombobox" dictTypeId="ZH_INVOICE_NAME_TYPE" style="width: 300px" required="true" />
								</td>
								<td align="right" style="width: 160px">发票类型：</td>
								<td>
									<input name="invoiceType" id="invoiceType" class="nui-dictcombobox" dictTypeId="MIS_MA_INVOICETYPE" style="width: 300px" required="true" onvaluechanged="invoiceType" />
								</td>
								<td align="right" style="width: 160px">税率（%）：</td>
								<td>
									<input name="invoiceRate" id="invoiceRate" class="nui-textbox" style="width: 300px" required="true" onvaluechanged="editContractSum" value="6" />
								</td>
							</tr>
							<tr>
								<td align="right" style="width: 160px">用途：</td>
								<td>
									<input name="invoiceUsed" id="invoiceUsed" class="nui-dictcombobox" dictTypeId="INVOICE_USED" style="width: 100%" required="true" />
								</td>
								<td align="right" style="width: 160px">本次收款进度：</td>
								<td>
									<input id="payType" name="payType" class="nui-dictcombobox" dictTypeId="payType" style="width: 300px" />
								</td>
								<td align="right" style="width: 160px">合同金额（元）：</td>
								<td>
									<input id="invoiceSumCapital" name="invoiceSumCapital" class="nui-textbox" vtype="float" style="width: 300px" />
								</td>
							</tr>
							<tr>
								<td align="right" style="width: 160px">实际开票金额（元）：</td>
								<td>
									<input id="actualInvoiceSum" name="actualInvoiceSum" class="nui-textbox" vtype="float" style="width: 300px" required="true" />
								</td>								
							</tr>
							<tr>
								<td align="right" style="width: 160px">开票金额（元）：</td>
								<td>
									<input id="invoiceSum" name="invoiceSum" class="nui-textbox" vtype="float" style="width: 300px" required="true" onvaluechanged="editContractSum" />
								</td>
								<td align="right" style="width: 160px">账面收入（元）：</td>
								<td>
									<input id="bookIncome" name="bookIncome" class="nui-textbox" style="width: 300px" required="true" />
								</td>
								<td align="right" style="width: 160px">税额：</td>
								<td>
									<input name="invoiceTax" id="invoiceTax" class="nui-textbox" style="width: 300px" required="true" />
								</td>
							</tr>
							<tr>
								<td align="right" style="width: 160px">名称：</td>
								<td colspan="3">
									<input name="payerName" id="payerName" class="nui-textbox" style="width: 100%" required="true" />
								</td>
								<td align="right" style="width: 160px">是否有产值分配：</td>
								<td>
									<input id="allotFlag" name="allotFlag" class="nui-dictcombobox" dictTypeId="ZH_YN" style="width: 100%" required="true" />
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
								<td align="right" style="width: 160px">回款金额（元）：</td>
								<td>
									<input id="receivableSum" name="receivableSum" class="nui-textbox" vtype="float" style="width: 300px" onvaluechanged="receivableSum" />
								</td>
								<td align="right" style="width: 160px">余额（元）：</td>
								<td>
									<input id="balanceSum" name="balanceSum" class="nui-textbox" style="width: 300px" />
								</td>
								<td align="right" style="width: 160px">回款时间：</td>
								<td>
									<input id="receivableData" name="receivableData" enabled="true" class="nui-datepicker" style="width: 300px" />
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
				<div id="allotDataGrid" class="nui-datagrid" style="width: 100%; height: 150px;" allowCellEdit="true" allowCellSelect="true" showPager="false" oncellendedit="onCellEndEdit">
					<div property="columns">
						<div field="username" headerAlign="center">申请人</div>
						<div field="orgname" headerAlign="center">承办部门</div>
						<div field="invoiceSum" headerAlign="center">
							开票金额（元）
							<input property="editor" class="nui-textbox" style="width: 100%;" required="true" />
						</div>
						<div field="bookIncome" headerAlign="center">
							账面收入（元）
							<input property="editor" class="nui-textbox" style="width: 100%;" required="true" />
						</div>
						<div field="invoiceTax" headerAlign="center">税额（元）</div>
					</div>
				</div>
			</fieldset>			
			
			<fieldset id="field2" style="border: solid 1px #aaa; padding: 3px;">
				<legend>上传附件</legend>
				<jsp:include page="/ame_common/inputFile.jsp" />
			</fieldset>
		</div>
	</div>

	<div style="text-align: center; padding: 10px;" class="nui-toolbar">
		<a class="nui-button" onclick="onOk()" id="creatReimbProcess" style="width: 80px; margin-right: 20px;">提交</a>
		<a class="nui-button" onclick="onCancel" id="saveReimbProcess" style="width: 80px; margin-right: 140px;">关闭</a>
	</div>

	<script type="text/javascript">
		nui.parse();
		<%
			UserObject user = (UserObject) session.getAttribute("userObject");
		 	String username = user.getUserName();
		 	String userno = user.getUserId();
		 	String userOrgName = user.getUserOrgName();
		 	String userOrgId = user.getUserOrgId();
		 	Map<String,Object> a = user.getAttributes();
		 	String empid = (String) a.get("empid");
		 	DataObject[] roles = (DataObject[])a.get("roles");
		 %>
		var form = new nui.Form("form1");
		var allotDataGrid = nui.get("allotDataGrid");
		var grid2 = nui.get("datagrid2");
		var id = "";

		function onOk() {
			//定义变量接受form表单数据
			var form = new nui.Form("#form1");
			form.validate();
			if (form.isValid() == false) {
				nui.alert("请检查必填项");
				return;
			}
			var data = form.getData();
			document.getElementById("fileCatalog").value = "invoiceinfo";
			form2.submit();
		}

		function SaveData() {
			var form = new nui.Form("#form1");
			var data = form.getData();
			var allotDatas = allotDataGrid.getData();
			data.id = id;
			var json = nui.encode({
				'data' : data,
				'allotDatas' : allotDatas
			});
			if (!confirm("是否保存？")) {
				return;
			} else {
				nui.ajax({
					url : "com.zhonghe.ame.invoice.invoice.updateInvoice.biz.ext",
					data : json,
					type : 'POST',
					cache : false,
					contentType : 'text/json',
					success : function(text) {
						if (text.result == 1) {
							nui.alert("编辑成功", null, function() {
								window.CloseOwnerWindow("save");
							});
						} else {
							nui.alert("编辑失败")
						}
					},
					error : function(jqXHR, textStatus, errorThrown) {
						alert(jqXHR.responseText);
					}
				});
			}
		}

		function setEditData(data) {
			var form = new nui.Form("#form1");
			form.setData(data);
			nui.get("contractNo").setText(data.contractNo);
			nui.get("createUserid").setValue(data.createUserid);
			nui.get("createUsername").setValue(data.createUsername);
			nui.get("createTime").setValue(data.createTime);
			nui.get("historyActualInvoiceSum").setValue(data.actualInvoiceSum);
			queryAllotDatas(data.id);
			id = data.id;
			var grid_0 = nui.get("grid_0");
			grid_0.load({
				"groupid" : "INVOICE",
				"relationid" : data.id
			});
			grid_0.sortBy("fileTime", "desc");
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
			}else if(field == "bookIncome"){
				var invoiceSum = record.invoiceSum;
				var bookIncome = record.bookIncome;
				abs = function(val) {
					var str = (val).toFixed(2) + '';
					var intSum = str.substring(0, str.indexOf(".")).replace(/\B(?=(?:\d{3})+$)/g, '');
					var dot = str.substring(str.length, str.indexOf("."))
					var ret = intSum + dot;
					return ret;
				}
				var invoiceTax = abs(invoiceSum - bookIncome);
				allotDataGrid.updateRow(record, {
					"invoiceTax" : invoiceTax
				});
			}
		}				

		function onCancel(e) {
			CloseWindow("cancel");
		}

		function CloseWindow(action) {
			if (window.CloseOwnerWindow)
				return window.CloseOwnerWindow(action);
			else
				window.close();
		}

		function onButtonEdit(e) {
			var btnEdit = this;
			mini.open({
				url : "/default/contractPact/invoice/invoiceContracList.jsp",
				title : "收费合同信息",
				width : '90%',
				height : '90%',
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

		function receivableSum() {
			var receivableSum = nui.get("receivableSum").getValue();
			var invoiceSum = nui.get("invoiceSum").getValue();
			abs = function(val) {
				var str = (val).toFixed(2) + '';
				var intSum = str.substring(0, str.indexOf(".")).replace(/\B(?=(?:\d{3})+$)/g, '');
				var dot = str.substring(str.length, str.indexOf("."))
				var ret = intSum + dot;
				return ret;
			}
			nui.get("balanceSum").setValue(abs(invoiceSum - receivableSum));
		}

		function finish(appStatus) {
			if (appStatus == 2) {
				nui.get("receivableSum").enable();
				nui.get("receivableSum").setRequired(true);
				nui.get("receivableData").enable();
				nui.get("receivableData").setRequired(true);
				nui.get("invoiceNameType").setRequired(false);
				nui.get("invoiceNameType").disable();
				nui.get("invoiceType").setRequired(false);
				nui.get("invoiceType").disable();
				nui.get("invoiceRate").setRequired(false);
				nui.get("invoiceRate").disable();
				nui.get("invoiceUsed").setRequired(false);
				nui.get("invoiceUsed").disable();
				nui.get("invoiceSum").setRequired(false);
				nui.get("invoiceSum").disable();
				nui.get("taxpayerNumber").setRequired(false);
				nui.get("taxpayerNumber").disable();
				nui.get("invoiceRemark").setRequired(false);
				nui.get("invoiceRemark").disable();
				nui.get("contractNo").setRequired(false);
				nui.get("contractNo").disable();
				var bookIncome = nui.get("bookIncome").getValue();
				var invoiceTax = nui.get("invoiceTax").getValue();
				abs = function(val) {
					var str = (val).toFixed(2) + '';
					var intSum = str.substring(0, str.indexOf(".")).replace(/\B(?=(?:\d{3})+$)/g, '');
					var dot = str.substring(str.length, str.indexOf("."))
					var ret = intSum + dot;
					return ret;
				}
				var a = abs(bookIncome * 1 * 0.06);
				nui.get("verification").setValue(abs(a - invoiceTax));
			} else {
				nui.get("receivableSum").setRequired(false);
				nui.get("receivableSum").disable();
				nui.get("receivableData").setRequired(false);
				nui.get("receivableData").disable();
			}
		}
	</script>

</body>
</html>