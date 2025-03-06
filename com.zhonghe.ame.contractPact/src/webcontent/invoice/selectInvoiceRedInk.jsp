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
								<input id="historySecondaryOrg" class="nui-textbox" enabled="false" style="width: 300px" />
							</td>
							<td align="right" style="width: 160px">申请部门：</td>
							<td>
								<input id=historyImplementOrg class="nui-textbox" enabled="false" style="width: 300px" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 160px">申请日期：</td>
							<td>
								<input id="historyCreateTime" enabled="false" class="nui-datepicker" style="width: 300px" required="true" />
							</td>
							<td align="right" style="width: 160px">合同编号：</td>
							<td>
								<input id="historyContractNo" onbuttonclick="onButtonEdit" class="nui-buttonedit" style="width: 300px" required="true" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 160px">合同名称：</td>
							<td colspan="5">
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
							<td align="right" style="width: 160px">发票格式：</td>
							<td colspan="5">
								<input id="historyInvoiceFormat" class="nui-dictcombobox" dictTypeId="INVOICE_FORMAT" style="width: 100%" enabled="false" multiSelect="true" />
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
								<input name="secondaryOrg" id="secondaryOrg" class="nui-hidden" style="width: 300px" />
								<input name="secondaryOrgname" id="secondaryOrgname" class="nui-textbox" enabled="false" style="width: 300px" required="true" />
							</td>
							<td align="right" style="width: 160px">申请部门：</td>
							<td>
								<input name="implementOrg" id="implementOrg" class="nui-hidden" style="width: 300px;" />
								<input name="implementOrgname" id="implementOrgname" class="nui-textbox" enabled="false" style="width: 300px" required="true" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 160px">申请日期：</td>
							<td>
								<input id="createTime" name="createTime" class="nui-datepicker" style="width: 300px" enabled="false" required="true" />
							</td>
							<td align="right" style="width: 160px">合同编号：</td>
							<td>
								<input id="contractNo" name="contractNo" onbuttonclick="onButtonEdit" class="nui-buttonedit" style="width: 300px" required="true" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 160px">合同名称：</td>
							<td colspan="5">
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
								<input id="invoiceSum" name="invoiceSum" class="nui-textbox" vtype="float" style="width: 300px" required="true" emptyText="数字格式、只能为负数" enabled="false" />
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
							<td align="right" style="width: 160px">发票格式：</td>
							<td colspan="5">
								<input name="invoiceFormat" class="nui-dictcombobox" dictTypeId="INVOICE_FORMAT" style="width: 100%" enabled="false" multiSelect="true" />
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
			<div id="allotDataGrid" class="nui-datagrid" style="width: 100%; height: 150px;" allowCellEdit="true" allowCellSelect="true" showPager="false">
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
			<jsp:include page="/ame_common/detailFileExpand.jsp" />
		</fieldset>
	</div>

	<script type="text/javascript">
		nui.parse();
		var form = new nui.Form("#form1");
		var historyAllotDataGrid = nui.get("historyAllotDataGrid");
		var allotDataGrid = nui.get("allotDataGrid");
		var processid =<%=request.getParameter("processInstID")%>;
		
		init();
		
		function init() {
			var data = {"processid" : processid};
			var json = nui.encode(data);
			ajaxCommon({
				url : "com.zhonghe.ame.purchase.purchaseProApp.queryInvoiceByProcessId.biz.ext",
				data : json,
				success : function(result) {
					var data = result.proApp[0];
					form.setData(data)
					queryHistory(data.relateCont);
					queryAllotDatas(data.id, data.allotFlag);
					nui.get("contractNo").setText(data.contractNo);
					nui.get("invoiceSumChinese").setValue(functiondigitUppercase(nui.get("invoiceSum").getValue()));
					var detailFileExpandGrid = nui.get("detailFileExpandGrid");
					detailFileExpandGrid.load({
						"groupid" : "INVOICE",
						"relationid" : data.id
					});
					detailFileExpandGrid.sortBy("fileTime", "desc");
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
					nui.get("historySecondaryOrg").setValue(data.secondaryOrgname);
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
					nui.get("historyInvoiceFormat").setValue(data.invoiceFormat);
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
		
	</script>

</body>
</html>