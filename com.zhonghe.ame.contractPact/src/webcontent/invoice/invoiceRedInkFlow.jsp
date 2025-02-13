<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<head>
<title>开具发票信息 - 红冲/作废</title>
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
	<%
		long workItemID = (Long) request.getAttribute("workItemID");
	%>
	<div class="nui-fit" style="padding: 5px;">
		<fieldset id="field1" style="border: solid 1px #aaa;">
			<legend>原 - 开票信息</legend>
			<form>
				<div style="padding: 5px;">
					<table style="table-layout: fixed;">
						<tr>
							<td align="right">申请人：</td>
							<td>
								<input id="historyCreateUsername" class="nui-textbox" enabled="false" style="width: 300px" required="true" />
							</td>
							<td align="right" style="width: 160px">申请单位：</td>
							<td>
								<input id=historyImplementOrg class="nui-textbox" enabled="false" style="width: 300px" />
							</td>
							<td align="right" style="width: 160px">申请日期：</td>
							<td>
								<input id="historyCreateTime" enabled="false" class="nui-datepicker" style="width: 300px" required="true" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 160px">合同编号：</td>
							<td>
								<input id="historyContractNo" onbuttonclick="onButtonEdit" class="nui-buttonedit" style="width: 300px" required="true" enabled="false" />
							</td>
							<td align="right" style="width: 160px">合同名称：</td>
							<td colspan="3">
								<input id="historyContractName" class="nui-textbox" style="width: 100%" required="true" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 100px">专业类别：</td>
							<td>
								<input id="historyMajor" class="nui-dictcombobox" dictTypeId="ZH_MAJOR_TYPE" style="width: 300px" required="true" enabled="false" />
							</td>
							<td align="right" style="width: 160px">工程类别：</td>
							<td>
								<input id="historyProjectType" class="nui-dictcombobox" dictTypeId="ZH_PROJECT_TYPE" style="width: 300px" required="true" enabled="false" />
							</td>
							<td align="right" style="width: 160px">集团内外：</td>
							<td>
								<input id="historyHeadquarterGroup" class="nui-dictcombobox" dictTypeId="ZH_GROUP" style="width: 300px" required="true" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 160px">服务范围：</td>
							<td>
								<input id="historyBidService" class="nui-dictcombobox" dictTypeId="ZH_BID_SERVICE" style="width: 300px" required="true" enabled="false"/>
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 160px">发票抬头类别：</td>
							<td>
								<input id="historyInvoiceNameType" class="nui-dictcombobox" dictTypeId="ZH_INVOICE_NAME_TYPE" style="width: 300px" required="true" enabled="false" />
							</td>
							<td align="right" style="width: 160px">发票类型：</td>
							<td>
								<input id="historyInvoiceType" class="nui-dictcombobox" dictTypeId="MIS_MA_INVOICETYPE" style="width: 300px" required="true" enabled="false" onvaluechanged="invoiceType" />
							</td>
							<td align="right" style="width: 160px">税率（%）：</td>
							<td>
								<input id="historyInvoiceRate" class="nui-textbox" style="width: 300px" required="true" onvaluechanged="editContractSum" value="6" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 160px">用途：</td>
							<td>
								<input id="historyInvoiceUsed" class="nui-dictcombobox" dictTypeId="INVOICE_USED" style="width: 300px" required="true" enabled="false" />
							</td>
							<td align="right" style="width: 160px">本次收款进度：</td>
							<td>
								<input id="historyPayType" class="nui-dictcombobox" dictTypeId="payType" style="width: 300px" required="true" enabled="false" />
							</td>
							<td align="right" style="width: 160px">合同金额（元）：</td>
							<td>
								<input id="historyInvoiceSumCapital" class="nui-textbox" vtype="float" style="width: 300px" required="true" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 160px">开票金额（元）：</td>
							<td>
								<input id="historyInvoiceSum" id="invoiceSum" class="nui-textbox" vtype="float" style="width: 300px" required="true" onvaluechanged="editContractSum" enabled="false" />
							</td>
							<td align="right" style="width: 160px">账面收入（元）：</td>
							<td>
								<input id="historyBookIncome" class="nui-textbox" style="width: 300px" required="true" enabled="false" onvaluechanged="editInvoiceTax" />
							</td>
							<td align="right" style="width: 160px">税额：</td>
							<td>
								<input id="historyInvoiceTax" class="nui-textbox" style="width: 300px" required="true" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 160px">开票金额大写：</td>
							<td colspan="3">
								<input id="historyInvoiceSumChinese" class="nui-textbox" style="width: 100%" required="true" enabled="false" />
							</td>
							<td align="right" style="width: 160px">是否有产值分配：</td>
							<td>
								<input id="historyAllotFlag" class="nui-dictcombobox" dictTypeId="ZH_YN" style="width: 100%" required="true" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 160px">名称：</td>
							<td colspan="5">
								<input id="historyPayerName" class="nui-textbox" style="width: 100%" required="true" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 160px">纳税人识别号：</td>
							<td colspan="5">
								<input id="historyTaxpayerNumber" class="nui-textbox" style="width: 100%" required="true" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 160px">发票备注：</td>
							<td colspan="5">
								<input id="historyInvoiceRemark" class="nui-textbox" style="width: 100%" required="false" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 160px">数电发票接收人邮箱：</td>
							<td colspan="5">
								<input id="historyInvoiceUserMail" class="nui-textbox" style="width: 100%" required="false" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 160px">备注：</td>
							<td colspan="5">
								<input id="historyRemark" class="nui-textarea" style="width: 100%; height: 100px" required="false" enabled="false" />
							</td>
						</tr>
					</table>
				</div>
			</form>
		</fieldset>
		
		<fieldset id="historyAllotFieldset" style="border: solid 1px #aaa;" class="hidden">
			<legend>
				原 - 产值分配
				<span style="color: red">（金额单位：元）</span>
			</legend>
			<div id="historyAllotDataGrid" class="nui-datagrid" style="width: 100%; height: 150px;" showPager="false">
				<div property="columns">
					<div field="username" headerAlign="center">申请人</div>
					<div field="orgname" headerAlign="center">承办部门</div>
					<div field="invoiceSum" headerAlign="center">开票金额（元）</div>
					<div field="bookIncome" headerAlign="center">账面收入（元）</div>
					<div field="invoiceTax" headerAlign="center">税额（元）</div>
				</div>
			</div>
		</fieldset>		
		
		<fieldset id="field2" style="border: solid 1px #aaa;">
			<legend>红冲/作废 - 开票信息</legend>
			<form id="form1" method="post">
				<input name="files" id="fileids" class="nui-hidden" />
				<input name="id" id="id" class="nui-hidden" />
				<input class="nui-hidden" name="invoiceNameType" />
				<input class="nui-hidden" name="processid" />
				<input name="relateCont" id="relateCont" class="nui-hidden" />
				<div style="padding: 5px;">
					<table style="table-layout: fixed;">
						<tr>
							<td align="right">申请人</td>
							<td>
								<input name="createUserid" id="createUserid" class="nui-hidden" style="width: 300px" />
								<input id="createUsername" name="createUsername" class="nui-textbox" enabled="false" style="width: 300px" required="true" />
							</td>
							<td align="right" style="width: 160px">申请单位：</td>
							<td>
								<input name="implementOrg" id="implementOrg" class="nui-hidden" style="width: 300px;" />
								<input name="implementOrgname" id="implementOrgname" class="nui-textbox" enabled="false" style="width: 300px" required="true" />
							</td>
							<td align="right" style="width: 160px">申请日期：</td>
							<td>
								<input id="createTime" name="createTime" class="nui-datepicker" style="width: 300px" enabled="false" required="true" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 160px">合同编号：</td>
							<td>
								<input id="contractNo" name="contractNo" onbuttonclick="onButtonEdit" class="nui-buttonedit" style="width: 300px" required="true" enabled="false" />
							</td>
							<td align="right" style="width: 160px">合同名称：</td>
							<td colspan="3">
								<input id="contractName" name="contractName" class="nui-textbox" style="width: 100%" required="true" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 100px">申请红冲/作废：</td>
							<td>
								<input id="redInkType" name="redInkType" class="nui-dictcombobox" dictTypeId="ZH_RED_INK_TYPE" style="width: 300px" required="true" enabled="false" />
							</td>
							<td align="right" style="width: 160px">红冲/作废金额大写：</td>
							<td colspan="3">
								<input id="invoiceSumChinese" class="nui-textbox" style="width: 100%" required="true" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 160px">红冲/作废金额（元）：</td>
							<td>
								<input id="invoiceSum" name="invoiceSum" class="nui-textbox" vtype="float" style="width: 300px" required="true" onvaluechanged="editContractSum" emptyText="数字格式、只能为负数" enabled="false" />
							</td>
							<td align="right" style="width: 160px">账面收入（元）：</td>
							<td>
								<input id="bookIncome" name="bookIncome" class="nui-textbox" style="width: 300px" required="true" enabled="false" onvaluechanged="editInvoiceTax" />
							</td>
							<td align="right" style="width: 160px">税额：</td>
							<td>
								<input name="invoiceTax" id="invoiceTax" class="nui-textbox" style="width: 300px" required="true" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 160px">数电发票接收人邮箱：</td>
							<td colspan="5">
								<input name="invoiceUserMail" class="nui-textbox" style="width: 100%" required="true" enabled="false"/>
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 160px">红冲/作废原因：</td>
							<td colspan="5">
								<input name="remark" class="nui-textarea" style="width: 100%; height: 200px" required="true" enabled="false" />
							</td>
						</tr>
					</table>
				</div>
			</form>
		</fieldset>
		
		<fieldset id="allotFieldset" style="border: solid 1px #aaa;" class="hidden">
			<legend>
				红冲/作废 - 产值分配
				<span style="color: red">（金额单位：元）数字格式、只能为负数 </span>
			</legend>
			<div id="allotDataGrid" class="nui-datagrid" style="width: 100%; height: 150px;" allowCellEdit="true" allowCellSelect="true" showPager="false" oncellendedit="onCellEndEdit">
				<div property="columns">
					<div field="username" headerAlign="center">申请人</div>
					<div field="orgname" headerAlign="center">承办部门</div>
					<div field="invoiceSum" headerAlign="center">红冲/作废金额（元）</div>
					<div field="bookIncome" headerAlign="center">
						账面收入（元）
						<input property="editor" class="nui-textbox" style="width: 100%;" required="true" />
						</div>
					<div field="invoiceTax" headerAlign="center">税额（元）</div>
				</div>
			</div>
		</fieldset>		
		
		<fieldset id="field3" style="border: solid 1px #aaa;">
			<legend>原 - 开票信息附件</legend>
			<jsp:include page="/ame_common/detailFile.jsp" />
		</fieldset>
		<fieldset id="field4" style="border: solid 1px #aaa;">
			<legend>红冲/作废 - 上传附件</legend>
			<jsp:include page="/ame_common/inputFileExpand.jsp" />
		</fieldset>

		<jsp:include page="/ame_common/misOpinion_Freeflow.jsp" />
	</div>

	<div style="text-align: center; padding: 5px;" class="nui-toolbar">
		<a class="nui-button" onclick="countersign()" id="countersign" iconCls="icon-user" style="width: 80px; margin-right: 20px;">加签</a>
		<a class="nui-button" onclick="submit()" id="creatReimbProcess" iconCls="icon-ok" style="width: 80px; margin-right: 20px;">提交</a>
		<a class="nui-button" onclick="closeCancel()" id="saveReimbProcess" iconCls="icon-close" style="width: 80px; margin-right: 0px;">关闭</a>
		<a class="nui-button" id="kjfplist_sp_print" iconCls="icon-print" onclick="printBtn()" style="width: 80px;">打印</a>
	</div>

	<script type="text/javascript">
		nui.parse();
		var form = new nui.Form("#form1");
		var historyAllotDataGrid = nui.get("historyAllotDataGrid");
		var allotDataGrid = nui.get("allotDataGrid");
		var opioionform = new nui.Form("#opioionform");
		var id;
		var workItemInfo;
		var beforeBookIncome;
		var titleText, countersignUsers;
		
		init();
		
		function init() {
			// 按钮权限
			if(userId !='sysadmin'){
				// 审批页-打印按钮 - kjfplist_sp_print
				getOpeatorButtonAuth("kjfplist_sp_print");
			}
			var data = {workitemid :<%=workItemID%>};
			var json = nui.encode(data);
			ajaxCommon({
				url : "com.zhonghe.ame.invoice.invoice.queryInvoiceInfo.biz.ext",
				data : json,
				success : function(o) {
					workItemInfo = o.workitemInfo;
					form.setData(o.data)
					queryHistory(o.data.relateCont);
					queryAllotDatas(o.data.id, o.data.allotFlag);
					id = o.data.id;
					beforeBookIncome = o.data.bookIncome;
					nui.get("backTo").setData(o.data.backList);
					nui.get("contractNo").setText(o.data.contractNo);
					nui.get("invoiceSumChinese").setValue(functiondigitUppercase(nui.get("invoiceSum").getValue()));
					if(workItemInfo.workItemName == '财务开票' && o.data.allotFlag === '0'){
						nui.get('bookIncome').enable();
					}
					var inputFileExpandGrid = nui.get("inputFileExpandGrid");
					inputFileExpandGrid.load({
						"groupid" : "INVOICE",
						"relationid" : o.data.id
					});
					inputFileExpandGrid.sortBy("fileTime", "desc");
					$("#inputFileExpandField").toggle();
					var misOpinionGrid = nui.get("datagrid1");
					misOpinionGrid.load({
						processInstID : o.data.processid
					});
					misOpinionGrid.sortBy("time", "desc");
					setTimeout(function() {
						//注销掉删除操作
						$(".Delete_Button").hide();
					}, 300);
					//初始化处理意见
					initMisOpinion({
						auditstatus : "1"
					});
					
				}
			});
		}
		
		function queryAllotDatas(invoiceId, allotFlag) {
			nui.ajax({
				url : "com.zhonghe.ame.invoice.invoice.queryAllotDatas.biz.ext",
				type : "post",
				contentType : 'text/json',
				data : {
					"invoiceId" : invoiceId
				},
				success : function(result) {
					if (result.data.length > 0 && allotFlag === '1') {
						$('#allotFieldset').removeClass('hidden');
						nui.parse();
						allotDataGrid.setData(result.data);
					}
				}
			})
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
		
		function queryHistory(str) {
			var json = {
				"id" : str
			};
			nui.ajax({
				url : "com.zhonghe.ame.invoice.invoice.queryInvoiceById.biz.ext",
				type : "post",
				contentType : 'text/json',
				data : json,
				success : function(result) {
					var data = result.data;
					nui.get("historyCreateUsername").setValue(data.createUsername);
					nui.get("historyImplementOrg").setValue(data.implementOrgname);
					nui.get("historyCreateTime").setValue(data.createTime);
					nui.get("historyContractNo").setText(data.contractNo);
					nui.get("historyContractName").setValue(data.contractName);
					nui.get("historyMajor").setValue(data.major);
					nui.get("historyBidService").setValue(data.bidService);
					nui.get("historyProjectType").setValue(data.projectType);
					nui.get("historyHeadquarterGroup").setValue(data.headquarterGroup);
					nui.get("historyInvoiceNameType").setValue(data.invoiceNameType);
					nui.get("historyInvoiceType").setValue(data.invoiceType);
					nui.get("historyInvoiceRate").setValue(data.invoiceRate);
					nui.get("historyInvoiceUsed").setValue(data.invoiceUsed);
					nui.get("historyPayType").setValue(data.payType);
					nui.get("historyInvoiceSumCapital").setValue(data.invoiceSumCapital);
					nui.get("historyInvoiceSum").setValue(data.invoiceSum);
					nui.get("historyBookIncome").setValue(data.bookIncome);
					nui.get("historyInvoiceTax").setValue(data.invoiceTax);
					nui.get("historyAllotFlag").setValue(data.allotFlag);
					nui.get("historyPayerName").setValue(data.payerName);
					nui.get("historyTaxpayerNumber").setValue(data.taxpayerNumber);
					nui.get("historyInvoiceRemark").setValue(data.invoiceRemark);
					nui.get("historyRemark").setValue(data.remark);
					nui.get("historyInvoiceUserMail").setValue(data.invoiceUserMail);
					nui.get("historyInvoiceSumChinese").setValue(functiondigitUppercase(nui.get("historyInvoiceSum").getValue()));
					
					queryHistoryAllotDatas(data.id);

					var grid_0 = nui.get("grid_0");
					grid_0.load({
						"groupid" : "INVOICE",
						"relationid" : data.id
					});
					grid_0.sortBy("fileTime", "desc");

				}
			})
		}
		
		function queryHistoryAllotDatas(invoiceId) {
			nui.ajax({
				url : "com.zhonghe.ame.invoice.invoice.queryAllotDatas.biz.ext",
				type : "post",
				contentType : 'text/json',
				data : {
					"invoiceId" : invoiceId
				},
				success : function(result) {
					var allotFlag = nui.get("historyAllotFlag").getValue();
					if (result.data.length > 0 && allotFlag === '1') {
						$('#historyAllotFieldset').removeClass('hidden');
						nui.parse();
						historyAllotDataGrid.setData(result.data);
					}
				}
			})
		}		
		
		function editInvoiceTax(){
			var invoiceSum = nui.get("invoiceSum").getValue();
			var bookIncome = nui.get("bookIncome").getValue();
			abs = function(val) {
				var str = (val).toFixed(2) + '';
				var intSum = str.substring(0, str.indexOf(".")).replace(/\B(?=(?:\d{3})+$)/g, '');
				var dot = str.substring(str.length, str.indexOf("."))
				var ret = intSum + dot;
				return ret;
			}
			nui.get("invoiceTax").setValue(abs(invoiceSum - bookIncome));
		}							
		
		function countersign() {
			selectOmEmployee();
		}
		
		function selectOmEmployee() {
			var btnEdit = this;
			nui.open({
				url: "<%=request.getContextPath()%>/contractPact/selectUsers.jsp",
				title : "立项单位经办人",
				width : 430,
				height : 400,
				ondestroy : function(action) {
					var user, users = "【";
					countersignUsers = [];
					if (action == "ok") {
						var iframe = this.getIFrameEl();
						var data = iframe.contentWindow.GetData();
						data = nui.clone(data); //必须
						if (data) {
							for (var i = 0; i < data.length; i++) {
								user = {};
								user.id = data[i].userid
								user.name = data[i].empname
								user.typeCode = "person"
								countersignUsers.push(user);
								if (i == 0) {
									users = users + data[i].empname;
								} else {
									users = users + "," + data[i].empname;
								}
							}
							users = users + "】";
							titleText = "增加审批人员" + users + "并提交";
							submitProcess(titleText);
						}
					}
				}
			});
		}
		
		function onCellEndEdit(e) {
			var record = e.record;
			var field = e.field;
			if (field == "bookIncome") {
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
				var rows = allotDataGrid.getData();
				var sum = rows.reduce((acc, curr) => acc + Number(curr.bookIncome), 0);
				nui.get("bookIncome").setValue(sum);
				editInvoiceTax();
			}
		}		
		
		function printBtn() {
			var url = "<%=request.getContextPath()%>/contractPact/print/invoiceRedInkListPrint.jsp?id=" + id;
			var myWindow = window.open(url);
			myWindow.onload = function() {
				myWindow.document.title = "打印页面";
				myWindow.setViewData(selectRow);
			};
		}

		function submit() {
			var auditstatus = nui.get("auditstatus").getValue();
			if (auditstatus == "2") { //终止流程
				titleText = "终止";
				submitProcess("终止");
			} else if (auditstatus == "0") { //退回流程
				if (!nui.get("backTo").getValue()) {
					nui.alert("退回环节不能为空！");
					return;
				}
				titleText = "退回";
				submitProcess("退回");
			} else if (auditstatus == "1") { //提交流程
				titleText = "提交";
				submitProcess("提交");
			}
		}

		function submitProcess(title) {
			nui.confirm("确定" + title + "流程吗？", "操作提示", function(action) {
				if (action == "ok") {
					var misOpinion = opioionform.getData().misOpinion;//审核意见
					nui.get("creatReimbProcess").setEnabled(false);
					var json = {
						misOpinion : misOpinion,
						workItemID :<%=workItemID%>,
						"countersignUsers" : countersignUsers
					};
					saveData(json);
				}
			});
		}

		function saveData(json) {
			var bookIncome = nui.get("bookIncome").getValue();
			var invoiceTax = nui.get("invoiceTax").getValue();
			if (beforeBookIncome != bookIncome) {
				json.bookIncome = bookIncome;
				json.invoiceTax = invoiceTax;
			}
			ajaxCommon({
				url : "com.zhonghe.ame.invoice.invoice.invoiceRedInkReview.biz.ext",
				data : json,
				success : function(o) {
					if (o.result == "success") {
						showTips(titleText + "成功", "系统提示")
						closeOk();
					} else {
						showTips("提交失败，请联系信息技术部人员！")
					}
				}
			})
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
	</script>

</body>
</html>