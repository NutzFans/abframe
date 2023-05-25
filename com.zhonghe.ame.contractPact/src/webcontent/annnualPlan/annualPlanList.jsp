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
</style>
<head>
<title>收费/开票计划</title>
</head>
<body>
	<div style="width: auto; height: 99%; padding: 5px;">
		<div id="form1">
			<input class="nui-hidden" name="criteria._entity" value="com.zhonghe.ame.annualPlan.annualPlan.AnnualPayPlanNewEntity" />
			<div class="nui-toolbar" style="border-bottom: 0; padding: 5px;">
				<table>
					<tr>
						<td style="width: 60px; text-align: right;">经办人:</td>
						<td style="width: 155px">
							<input name="criteria._expr[1]._value" class="nui-textbox" style="width: 150px" id="createUsername" />
							<input class="nui-hidden" name="criteria._expr[1]._property" value="createUsername" />
							<input class="nui-hidden" name="criteria._expr[1]._op" value="like" />
							<input name="criteria._expr[13].createUserid" class="nui-hidden" id="createUserid" />
						</td>
						<td style="width: 90px; text-align: right;">合同承办部门:</td>
						<td style="width: 155px">
							<input id="secOrgName" name="criteria._expr[2]._value" class="nui-textbox" style="width: 150px" />
							<input class="nui-hidden" name="criteria._expr[2]._property" value="secondaryOrgname" />
							<input class="nui-hidden" name="criteria._expr[2]._op" value="like" />
							<input id="secOrgId" name="criteria._expr[12].secondaryOrg" class="nui-hidden" />
						</td>
						<td style="width: 60px; text-align: right;">合同编号:</td>
						<td style="width: 155px">
							<input name="criteria._expr[3]._value" class="nui-textbox" style="width: 150px" />
							<input class="nui-hidden" name="criteria._expr[3]._property" value="contractNo" />
							<input class="nui-hidden" name="criteria._expr[3]._op" value="like" />
						</td>
						<td style="width: 60px; text-align: right;">合同名称:</td>
						<td style="width: 155px">
							<input name="criteria._expr[4]._value" class="nui-textbox" style="width: 150px" />
							<input class="nui-hidden" name="criteria._expr[4]._property" value="contractName" />
							<input class="nui-hidden" name="criteria._expr[4]._op" value="like" />
						</td>
						<td style="width: 60px; text-align: right;">签约方:</td>
						<td style="width: 155px">
							<input name="criteria._expr[5]._value" class="nui-combobox" valueField="custname" url="com.primeton.eos.ame_pur.PurSupplier.queryPurSuppliersIsqualified.biz.ext" filterType="like"
								textField="custname" dataField="pursuppliers" valueFromSelect="true" allowInput="true" style="width: 150px" />
							<input class="nui-hidden" name="criteria._expr[5]._property" value="signatoryName" />
							<input class="nui-hidden" name="criteria._expr[5]._op" value="like" />
						</td>
					</tr>
					<tr>
						<td style="width: 60px; text-align: right;">合同类型:</td>
						<td style="width: 155px">
							<input name="criteria._expr[6].contractType" class="nui-dictcombobox" dictTypeId="ZH_CONTRACT_TYPE" showNullItem="true" nullItemText="全部" style="width: 150px" />
						</td>
						<td style="width: 60px; text-align: right;">是否采购:</td>
						<td style="width: 155px">
							<input name="criteria._expr[7].contractNature" class="nui-dictcombobox" dictTypeId="CONTRACT_NATURE" showNullItem="true" nullItemText="全部" style="width: 150px" />
						</td>
						<td style="width: 90px; text-align: right;">合同签约主体:</td>
						<td style="width: 155px">
							<input name="criteria._expr[23].contractSubject" class="nui-dictcombobox" dictTypeId="ZH_INVOICE_NAME_TYPE" showNullItem="true" nullItemText="全部" style="width: 150px" />
						</td>
						<td style="width: 60px; text-align: right;">付款方:</td>
						<td style="width: 155px">
							<input name="criteria._expr[24].payer" class="nui-dictcombobox" dictTypeId="ZH_INVOICE_NAME_TYPE" showNullItem="true" nullItemText="全部" style="width: 150px" />
						</td>
						<td style="width: 60px; text-align: right;">年份:</td>
						<td colspan="3">
							<input id="years" name="criteria._expr[11].years" class="nui-textbox" style="width: 65px" />
							<span style="color: red; vertical-align: inherit">默认当前年份</span>
						</td>
					</tr>
				</table>
			</div>
		</div>

		<div class="nui-toolbar" style="border-bottom: 0; padding: 1px;">
			<table style="width: 100%; text-align: center;">
				<tr>
					<td>
						<a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查询</a>
						<a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset()">重置</a>
					</td>
				</tr>
			</table>
		</div>

		<div class="nui-toolbar" style="border-bottom: 0; padding: 5px;">
			<table style="width: 100%;">
				<tr>
					<td>
						<a class="nui-button" id="export" iconCls="icon-download" onclick="exportExcel()">导出</a>
					</td>
				</tr>
			</table>
		</div>

		<div class="nui-fit">
			<div id="annualPayGrid" sizeList="[1000]" dataField="payPlanInfos" pageSize="1000" class="nui-datagrid" style="width: 100%; height: 100%;"
				url="com.zhonghe.ame.annualPlan.annualPlan.queryAnnualPayPlan.biz.ext" idField="id" frozenStartColumn="0" frozenEndColumn="7" showSummaryRow="true" onshowrowdetail="onShowRowDetail"
				virtualScroll="true" virtualColumns="true">
				<div property="columns">
					<div type="checkcolumn">○</div>
					<div type="expandcolumn" renderer="expandColumn">+</div>
					<div field="id" headerAlign="center" visible="false">id</div>
					<div field="years" width="60" align="center" headerAlign="center" allowSort="true">年份</div>
					<div field="createUsername" width="60" align="center" headerAlign="center" allowSort="true">经办人</div>
					<div field="secondaryOrgname" width="150" align="center" headerAlign="center" allowSort="true">合同承办部门</div>
					<div field="contractNo" width="200" align="center" headerAlign="center" allowSort="true">合同编号</div>
					<div field="contractName" width="200" align="center" headerAlign="center" allowSort="true">合同名称</div>
					<div field="payer" width="100" align="center" headerAlign="center" allowSort="true" renderer="ZH_INVOICE_NAME_TYPE">付款方</div>
					<div field="signatoryName" width="200" align="center" headerAlign="center" allowSort="true">签约方</div>
					<div field="contractSum" width="120" align="center" headerAlign="center" allowSort="true" summaryType="sum" dataType="currency">合同金额（元）</div>
					<div field="sum" width="130" align="center" headerAlign="center" allowSort="true" summaryType="sum" dataType="currency">计划付款金额（元）</div>
					<div field="jan" width="120" align="center" headerAlign="center" allowSort="true" summaryType="sum" dataType="currency">1月</div>
					<div field="feb" width="120" align="center" headerAlign="center" allowSort="true" summaryType="sum" dataType="currency">2月</div>
					<div field="mar" width="120" align="center" headerAlign="center" allowSort="true" summaryType="sum" dataType="currency">3月</div>
					<div field="apr" width="120" align="center" headerAlign="center" allowSort="true" summaryType="sum" dataType="currency">4月</div>
					<div field="may" width="120" align="center" headerAlign="center" allowSort="true" summaryType="sum" dataType="currency">5月</div>
					<div field="jun" width="120" align="center" headerAlign="center" allowSort="true" summaryType="sum" dataType="currency">6月</div>
					<div field="jul" width="120" align="center" headerAlign="center" allowSort="true" summaryType="sum" dataType="currency">7月</div>
					<div field="aug" width="120" align="center" headerAlign="center" allowSort="true" summaryType="sum" dataType="currency">8月</div>
					<div field="sep" width="120" align="center" headerAlign="center" allowSort="true" summaryType="sum" dataType="currency">9月</div>
					<div field="oct" width="120" align="center" headerAlign="center" allowSort="true" summaryType="sum" dataType="currency">10月</div>
					<div field="nov" width="120" align="center" headerAlign="center" allowSort="true" summaryType="sum" dataType="currency">11月</div>
					<div field="dec" width="120" align="center" headerAlign="center" allowSort="true" summaryType="sum" dataType="currency">12月</div>
					<div field="contractSubject" width="100" align="center" headerAlign="center" allowSort="true" renderer="ZH_INVOICE_NAME_TYPE">合同签约主体</div>
					<div field="contractType" width="100" align="center" headerAlign="center" allowSort="true" renderer="ZH_CONTRACT_TYPE">合同类型</div>
					<div field="contractNature" width="100" align="center" headerAlign="center" allowSort="true" renderer="CONTRACT_NATURE">是否采购</div>
				</div>
			</div>
		</div>
	</div>

	<div id="payMentInfo" style="display: none;">
		<div id="payMentGrid" sizeList="[5]" dataField="payMentInfos" pageSize="5" class="nui-datagrid" url="com.zhonghe.ame.annualPlan.annualPlan.queryPayMentByNo.biz.ext"
			style="width: 710px; height: 203px;">
			<div property="columns">
				<div field="id" headerAlign="center" visible="false">id</div>
				<div field="endTime" dateFormat="yyyy-MM-dd" align="center" headerAlign="center">付款日期</div>
				<div field="invoiceType" align="center" headerAlign="center" renderer="MIS_MA_INVOICETYPE">发票类型</div>
				<div field="payType" align="center" headerAlign="center" renderer="payType">本次付款进度</div>
				<div field="applyPayContractSum" align="center" headerAlign="center" summaryType="sum" dataType="currency">本次申请金额（元）</div>
				<div field="paidContractSum" align="center" headerAlign="center" summaryType="sum" dataType="currency">累计已支付金额（元）</div>
			</div>
		</div>
	</div>
	
	<form name="exprotExcelFlow" id="exprotExcelFlow" action="com.primeton.eos.ame_common.ameExportCommon.flow" method="post">
		<input type="hidden" name="_eosFlowAction" value="action0" filter="false" />
		<input type="hidden" name="downloadFile" filter="false" />
		<input type="hidden" name="fileName" filter="false" />
	</form>	

	<script type="text/javascript">
		nui.parse();
		var form = new nui.Form("#form1");
		var grid = nui.get("annualPayGrid");
		var payMentGrid = nui.get("payMentGrid");
		var payMentInfo = document.getElementById("payMentInfo");
		var now = new Date();

		init();

		function init() {
			var json = nui.encode({
				'loginUserId' : userId,
				'loginUserOrgId' : userOrgId,
				'authCode' : 'payAnnualPlan'
			});
			nui.ajax({
				url : "com.zhonghe.ame.annualPlan.auth.queryAnnualPlanAuth.biz.ext",
				type : 'POST',
				data : json,
				contentType : 'text/json',
				success : function(o) {
					if (o.result == "2") {
						nui.get("secOrgId").setValue(o.secOrgId);
						nui.get("secOrgName").setValue(o.secOrgName);
						nui.get("secOrgName").setReadOnly(true);

					} else if (o.result == "3") {
						nui.get("createUserid").setValue(userId);
						nui.get("createUsername").setValue(userName);
						nui.get("createUsername").setReadOnly(true);
					}
					nui.get("years").setValue(now.getFullYear());
					search();
				}
			});
		}

		function search() {
			var data = form.getData();
			grid.sortBy("createTime", "desc");
			grid.load(data);
		}

		function reset() {
			form.reset();
			init();
		}

		function expandColumn(e) {
			if (e.record.isInvoice == "0") {
				return "";
			} else {
				return "<div class='mini-grid-cell-inner  mini-grid-cell-nowrap' style=''><a class='mini-grid-ecIcon' href='javascript:#' onclick='return false'></a></div>"
			}
		}
		
		function onShowRowDetail(e) {
			var payMent = e.sender;
			var row = e.record;
			var td = payMent.getRowDetailCellEl(row);
			td.appendChild(payMentInfo);
			payMentInfo.style.display = "block";
			var data = {
				'contractNo' : row.contractNo
			};
			payMentGrid.load(data);
		}
		
		function exportExcel() {
			if (!confirm("是否确认导出？")) {
				return;
			}
			var form = new nui.Form("#form1");
			var data = form.getData(); //获取表单JS对象数据
			var json = nui.encode(data);
			nui.ajax({
				url : "com.zhonghe.ame.annualPlan.annualPlan.exportAnnualPayPlanExcel.biz.ext",
				type : "post",
				data : json,
				cache : false,
				contentType : 'text/json',
				success : function(o) {
					var filePath = o.downloadFile;
					var fileName = "付款计划";
					var myDate = new Date();
					var year = myDate.getFullYear();
					var month = myDate.getMonth() + 1;
					var day = myDate.getDate();
					var hours = myDate.getHours();
					var minutes = myDate.getMinutes();
					var seconds = myDate.getSeconds();
					var curDateTime = year;
					if (month > 9) {
						curDateTime = curDateTime + "" + month;
					} else {
						curDateTime = curDateTime + "0" + month;
					}
					if (day > 9) {
						curDateTime = curDateTime + day;
					} else {
						curDateTime = curDateTime + "0" + day;
					}
					if (hours > 9) {
						curDateTime = curDateTime + hours;
					} else {
						curDateTime = curDateTime + "0" + hours;
					}
					if (minutes > 9) {
						curDateTime = curDateTime + minutes;
					} else {
						curDateTime = curDateTime + "0" + minutes;
					}
					if (seconds > 9) {
						curDateTime = curDateTime + seconds;
					} else {
						curDateTime = curDateTime + "0" + seconds;
					}
					fileName = fileName + "_" + curDateTime + ".xls";
					var frm = document.getElementById("exprotExcelFlow");
					frm.elements["downloadFile"].value = filePath;
					frm.elements["fileName"].value = fileName;
					frm.submit();
				},
				error : function() {
					showTips("导出数据异常，请联系管理员！", "danger");
				}
			});
		}						

		function ZH_INVOICE_NAME_TYPE(e) {
			return nui.getDictText("ZH_INVOICE_NAME_TYPE", e.value);
		}

		function CONTRACT_NATURE(e) {
			return nui.getDictText("CONTRACT_NATURE", e.value);
		}

		function ZH_CONTRACT_TYPE(e) {
			return nui.getDictText("ZH_CONTRACT_TYPE", e.value);
		}

		function MIS_MA_INVOICETYPE(e) {
			return nui.getDictText("MIS_MA_INVOICETYPE", e.value);
		}
		
		function payType(e) {
			return nui.getDictText("payType", e.value);
		}		
	</script>

</body>
</html>