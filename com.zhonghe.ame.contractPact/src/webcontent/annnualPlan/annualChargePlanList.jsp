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

.mini-grid-summaryCell {
	text-align: center;
}
</style>
<head>
<title>开票计划跟踪</title>
</head>
<body>
	<div style="width: auto; height: 99%; padding: 5px;">
		<div id="form1">
			<input class="nui-hidden" name="criteria._entity" value="com.zhonghe.ame.annualPlan.annualPlan.AnnualChargePlanQueryEntity" />
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
						<td style="width: 60px; text-align: right;">付款单位:</td>
						<td style="width: 155px">
							<input name="criteria._expr[5]._value" class="nui-combobox" url="com.zhonghe.ame.chargeContract.chargeContract.queryCusts.biz.ext" filterType="like" textField="custname" valueField="custname"
								dataField="custs" valueFromSelect="true" allowInput="true" style="width: 150px" />
							<input class="nui-hidden" name="criteria._expr[5]._property" value="signatoryName" />
							<input class="nui-hidden" name="criteria._expr[5]._op" value="like" />
						</td>
						<td style="width: 60px; text-align: right;">收款方:</td>
						<td style="width: 155px">
							<input name="criteria._expr[6]._value" class="nui-dictcombobox" dictTypeId="PAYER" nullItemText="全部" showNullItem="true" style="width: 150px" />
							<input class="nui-hidden" name="criteria._expr[6]._property" value="payee" />
							<input class="nui-hidden" name="criteria._expr[6]._op" value="=" />
						</td>
					</tr>
					<tr>
						<td style="width: 60px; text-align: right;">专业类别:</td>
						<td style="width: 155px">
							<input name="criteria._expr[7]._value" class="nui-dictcombobox" dictTypeId="ZH_MAJOR_TYPE" nullItemText="全部" showNullItem="true" style="width: 150px" />
							<input class="nui-hidden" name="criteria._expr[7]._property" value="major" />
							<input class="nui-hidden" name="criteria._expr[7]._op" value="=" />
						</td>
						<td style="width: 60px; text-align: right;">工程类别:</td>
						<td style="width: 155px">
							<input name="criteria._expr[8]._value" class="nui-dictcombobox" dictTypeId="ZH_PROJECT_TYPE" showNullItem="true" nullItemText="全部" style="width: 150px" />
							<input class="nui-hidden" name="criteria._expr[8]._property" value="projectType" />
							<input class="nui-hidden" name="criteria._expr[8]._op" value="=" />
						</td>
						<td style="width: 70px; text-align: right;">集团内/外:</td>
						<td style="width: 155px">
							<input name="criteria._expr[9]._value" class="nui-dictcombobox" dictTypeId="ZH_GROUP" showNullItem="true" nullItemText="全部" style="width: 150px" />
							<input class="nui-hidden" name="criteria._expr[9]._property" value="headquarterGroup" />
							<input class="nui-hidden" name="criteria._expr[9]._op" value="=" />
						</td>
						<td style="width: 70px; text-align: right;">合同状态:</td>
						<td style="width: 155px">
							<input name="criteria._expr[10]._value" class="nui-dictcombobox" dictTypeId="ZH_CONTRACT_STATUS" showNullItem="true" nullItemText="全部" style="width: 150px" />
							<input class="nui-hidden" name="criteria._expr[10]._property" value="contractStauts" />
							<input class="nui-hidden" name="criteria._expr[10]._op" value="=" />
						</td>
						<td style="width: 70px; text-align: right;">风险等级:</td>
						<td style="width: 155px">
							<input name="criteria._expr[20]._value" class="nui-dictcombobox" dictTypeId="RISK_LEVEL" showNullItem="true" nullItemText="全部" style="width: 150px" />
							<input class="nui-hidden" name="criteria._expr[20]._property" value="riskLevel" />
							<input class="nui-hidden" name="criteria._expr[20]._op" value="=" />
						</td>
						<td style="width: 60px; text-align: right;">年份:</td>
						<td colspan="3">
							<input id="years" name="criteria._expr[11]._value" class="nui-textbox" style="width: 65px" />
							<input class="nui-hidden" name="criteria._expr[11]._property" value="years" />
							<input class="nui-hidden" name="criteria._expr[11]._op" value="=" />
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
						<a class="nui-button" id="chargeAnnualPlan_add" iconCls="icon-add" onclick="add()">新增</a>
						<a class="nui-button" id="chargeAnnualPlan_edit" iconCls="icon-edit" onclick="edit()">编辑</a>
						<a class="nui-button" id="chargeAnnualPlan_del" iconCls="icon-remove" onclick="deleteInfo()">删除</a>
						<a class="nui-button" id="chargeAnnualPlan_sync" iconCls="icon-goto" onclick="syncInfo()">同步</a>
						<a class="nui-button" id="export" iconCls="icon-download" onclick="exportExcel()">导出</a>
						<span style="color: red; vertical-align: inherit">说明：新增、编辑、删除只适用于待签、非合同、产值分配，已签请通过收费合同管理模块进行维护</span>
					</td>
				</tr>
			</table>
		</div>

		<div class="nui-fit">
			<div id="annualChargeGrid" sizeList="[2000]" dataField="chargePlanInfos" pageSize="2000" class="nui-datagrid" style="width: 100%; height: 100%;"
				url="com.zhonghe.ame.annualPlan.annualPlan.queryAnnualChargePlan.biz.ext" idField="id" frozenStartColumn="0" frozenEndColumn="8" showSummaryRow="true" virtualScroll="true" virtualColumns="true"
				multiSelect="true" onshowrowdetail="onShowRowDetail" onupdate="setHeaderBackColor" ondrawsummarycell="onDrawSummaryCell">
				<div property="columns">
					<div type="checkcolumn"></div>
					<div type="expandcolumn" renderer="expandColumn">+</div>
					<div field="id" headerAlign="center" visible="false">id</div>
					<div field="contractStauts" headerAlign="center" align="center" renderer="ZH_CONTRACT_STATUS" width="75" allowSort="true">合同状态</div>
					<div field="years" width="60" align="center" headerAlign="center" allowSort="true">年份</div>
					<div field="createUsername" width="60" align="center" headerAlign="center" allowSort="true">经办人</div>
					<div field="secondaryOrgname" width="150" align="center" headerAlign="center" allowSort="true">合同承办部门</div>
					<div field="contractNo" width="200" align="center" headerAlign="center" allowSort="true">合同编号</div>
					<div field="contractName" width="200" align="center" headerAlign="center" allowSort="true">合同名称</div>
					<div field="signatoryName" width="200" align="center" headerAlign="center" allowSort="true">付款单位</div>
					<div field="payee" width="100" align="center" headerAlign="center" allowSort="true" renderer="PAYER">收款方</div>
					<div field="contractSum" width="120" align="center" headerAlign="center" allowSort="true" summaryType="sum" dataType="currency">合同金额（元）</div>
					<div field="sum" width="130" align="center" headerAlign="center" allowSort="true" summaryType="sum" dataType="currency">计划收款金额（元）</div>
					<div field="sumExcludeTax" width="130" align="center" headerAlign="center" allowSort="true" summaryType="sum" dataType="currency">计划收入金额（元）</div>
					<div field="sumTotalBookIncome" width="135" align="center" headerAlign="center" allowSort="true" summaryType="sum" dataType="currency">当年实际完成收入（元）</div>
					<div field="jan" width="120" align="center" headerAlign="center" allowSort="false" summaryType="sum" dataType="currency" renderer="setBackColor">1月计划</div>
					<div field="janActual" width="120" align="center" headerAlign="center" allowSort="false" summaryType="sum" dataType="currency" renderer="setBackColor">1月实际</div>
					<div field="feb" width="120" align="center" headerAlign="center" allowSort="false" summaryType="sum" dataType="currency" renderer="setBackColor">2月计划</div>
					<div field="febActual" width="120" align="center" headerAlign="center" allowSort="false" summaryType="sum" dataType="currency" renderer="setBackColor">2月实际</div>
					<div field="mar" width="120" align="center" headerAlign="center" allowSort="false" summaryType="sum" dataType="currency" renderer="setBackColor">3月计划</div>
					<div field="marActual" width="120" align="center" headerAlign="center" allowSort="false" summaryType="sum" dataType="currency" renderer="setBackColor">3月实际</div>
					<div field="apr" width="120" align="center" headerAlign="center" allowSort="false" summaryType="sum" dataType="currency" renderer="setBackColor">4月计划</div>
					<div field="aprActual" width="120" align="center" headerAlign="center" allowSort="false" summaryType="sum" dataType="currency" renderer="setBackColor">4月实际</div>
					<div field="may" width="120" align="center" headerAlign="center" allowSort="false" summaryType="sum" dataType="currency" renderer="setBackColor">5月计划</div>
					<div field="mayActual" width="120" align="center" headerAlign="center" allowSort="false" summaryType="sum" dataType="currency" renderer="setBackColor">5月实际</div>
					<div field="jun" width="120" align="center" headerAlign="center" allowSort="false" summaryType="sum" dataType="currency" renderer="setBackColor">6月计划</div>
					<div field="junActual" width="120" align="center" headerAlign="center" allowSort="false" summaryType="sum" dataType="currency" renderer="setBackColor">6月实际</div>
					<div field="jul" width="120" align="center" headerAlign="center" allowSort="false" summaryType="sum" dataType="currency" renderer="setBackColor">7月计划</div>
					<div field="julActual" width="120" align="center" headerAlign="center" allowSort="false" summaryType="sum" dataType="currency" renderer="setBackColor">7月实际</div>
					<div field="aug" width="120" align="center" headerAlign="center" allowSort="false" summaryType="sum" dataType="currency" renderer="setBackColor">8月计划</div>
					<div field="augActual" width="120" align="center" headerAlign="center" allowSort="false" summaryType="sum" dataType="currency" renderer="setBackColor">8月实际</div>
					<div field="sep" width="120" align="center" headerAlign="center" allowSort="false" summaryType="sum" dataType="currency" renderer="setBackColor">9月计划</div>
					<div field="sepActual" width="120" align="center" headerAlign="center" allowSort="false" summaryType="sum" dataType="currency" renderer="setBackColor">9月实际</div>
					<div field="oct" width="120" align="center" headerAlign="center" allowSort="false" summaryType="sum" dataType="currency" renderer="setBackColor">10月计划</div>
					<div field="octActual" width="120" align="center" headerAlign="center" allowSort="false" summaryType="sum" dataType="currency" renderer="setBackColor">10月实际</div>
					<div field="nov" width="120" align="center" headerAlign="center" allowSort="false" summaryType="sum" dataType="currency" renderer="setBackColor">11月计划</div>
					<div field="novActual" width="120" align="center" headerAlign="center" allowSort="false" summaryType="sum" dataType="currency" renderer="setBackColor">11月实际</div>
					<div field="dec" width="120" align="center" headerAlign="center" allowSort="false" summaryType="sum" dataType="currency" renderer="setBackColor">12月计划</div>
					<div field="decActual" width="120" align="center" headerAlign="center" allowSort="false" summaryType="sum" dataType="currency" renderer="setBackColor">12月实际</div>
					<div field="major" width="80" align="center" headerAlign="center" allowSort="true" renderer="ZH_MAJOR_TYPE">专业类别</div>
					<div field="projectType" width="80" align="center" headerAlign="center" allowSort="true" renderer="ZH_PROJECT_TYPE">工程类别</div>
					<div field="headquarterGroup" width="80" align="center" headerAlign="center" allowSort="true" renderer="ZH_GROUP">集团内外</div>
					<div field="riskLevel" width="80" align="center" headerAlign="center" allowSort="true" renderer="RISK_LEVEL">风险等级</div>
					<div field="estimatedDate" dateFormat="yyyy-MM-dd" width="90" headerAlign="center" align="center" allowSort="true">预计签署日期</div>
				</div>
			</div>
		</div>

	</div>

	<div id="invoiceInfo" style="display: none;">
		<div id="invoiceGrid" sizeList="[5]" dataField="invoiceInfos" pageSize="5" class="nui-datagrid" url="com.zhonghe.ame.annualPlan.annualPlan.queryInvoiceDetailsByCriteria.biz.ext"
			style="width: 710px; height: 203px; margin-left: 670px">
			<div property="columns">
				<div field="id" headerAlign="center" visible="false">id</div>
				<div field="createTime" dateFormat="yyyy-MM-dd" align="center" headerAlign="center">开票日期</div>
				<div field="invoiceSum" align="center" headerAlign="center" summaryType="sum" dataType="currency">开票金额（元）</div>
				<div field="bookIncome" align="center" headerAlign="center" summaryType="sum" dataType="currency">账面收入（元）</div>
				<div field="invoiceTax" align="center" headerAlign="center" summaryType="sum" dataType="currency">税额（元）</div>
				<div field="receivableSum" align="center" headerAlign="center" summaryType="sum" dataType="currency">回款金额（元）</div>
				<div field="balanceSum" align="center" headerAlign="center" summaryType="sum" dataType="currency">余额（元）</div>
				<div field="receivableData" dateFormat="yyyy-MM-dd" align="center" headerAlign="center">回款时间</div>
			</div>
		</div>
	</div>

	<form name="exprotExcelFlow" id="exprotExcelFlow" action="com.primeton.eos.ame_common.ameExportCommon.flow" method="post">
		<input type="hidden" name="_eosFlowAction" value="action0" filter="false" />
		<input type="hidden" name="downloadFile" filter="false" />
		<input type="hidden" name="fileName" filter="false" />
	</form>

	<script type="text/javascript">
		var headerColumnObj = {};
		nui.parse();
		var form = new nui.Form("#form1");
		var annualChargeGrid = nui.get("annualChargeGrid");
		var invoiceGrid = nui.get("invoiceGrid");
		var invoiceInfo = document.getElementById("invoiceInfo");
		var now = new Date();
		var currentYear = now.getFullYear();
		var currentMonth = now.getMonth() + 1;

		init();

		function init(){
			// 按钮权限
			if(userId !='sysadmin'){
				// 新增按钮 - chargeAnnualPlan_add，编辑按钮 - chargeAnnualPlan_edit，删除按钮 - chargeAnnualPlan_del，同步按钮 - chargeAnnualPlan_sync
				getOpeatorButtonAuth("chargeAnnualPlan_add,chargeAnnualPlan_edit,chargeAnnualPlan_del,chargeAnnualPlan_sync");
			}
					
			var json = nui.encode({
				'loginUserId' : userId,
				'loginUserOrgId': userOrgId,
				'authCode': 'chargeAnnualPlan'
			});
			nui.ajax({
				url : "com.zhonghe.ame.annualPlan.auth.queryAnnualPlanAuth.biz.ext",
				type : 'POST',
				data : json,
				contentType : 'text/json',
				success : function(o) {
					if(o.result == "2"){
						nui.get("secOrgId").setValue(o.secOrgId);
						nui.get("secOrgName").setValue(o.secOrgName);
						nui.get("secOrgName").setReadOnly(true);
						
					}else if(o.result == "3"){
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
			annualChargeGrid.sortBy("createTime", "desc");
			annualChargeGrid.load(data);
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
			var invoice = e.sender;
			var row = e.record;
			var td = invoice.getRowDetailCellEl(row);
			td.appendChild(invoiceInfo);
			invoiceInfo.style.display = "block";
			var data = {
				'contractNo' : row.contractNo,
				'secOrg' : row.secondaryOrg,
				'startDate' : row.years + '-01-01',
				'endDate' : row.years + "-12-31"
			};
			invoiceGrid.load(data);
		}

		function setBackColor(e) {
			var record = e.record;
			var field = e.field;
			var dataYear = record.years;
			if (field == 'jan' && isColorRender(currentYear, currentMonth, dataYear, 1)) {
				var janActual = record.janActual;
				if (areBigDecimalsEqual(e.value, janActual)) {
					e.cellStyle = "background-color: #f6ffed";
				} else {
					e.cellStyle = "background-color: #ffccc7";
				}
			}
			if (field == 'janActual' && isColorRender(currentYear, currentMonth, dataYear, 1)) {
				var jan = record.jan;
				if (areBigDecimalsEqual(e.value, jan)) {
					e.cellStyle = "background-color: #f6ffed";
				} else {
					e.cellStyle = "background-color: #ffccc7";
				}
			}
			if (field == 'feb' && isColorRender(currentYear, currentMonth, dataYear, 2)) {
				var febActual = record.febActual;
				if (areBigDecimalsEqual(e.value, febActual)) {
					e.cellStyle = "background-color: #f6ffed";
				} else {
					e.cellStyle = "background-color: #ffccc7";
				}
			}
			if (field == 'febActual' && isColorRender(currentYear, currentMonth, dataYear, 2)) {
				var feb = record.feb;
				if (areBigDecimalsEqual(e.value, feb)) {
					e.cellStyle = "background-color: #f6ffed";
				} else {
					e.cellStyle = "background-color: #ffccc7";
				}
			}
			if (field == 'mar' && isColorRender(currentYear, currentMonth, dataYear, 3)) {
				var marActual = record.marActual;
				if (areBigDecimalsEqual(e.value, marActual)) {
					e.cellStyle = "background-color: #f6ffed";
				} else {
					e.cellStyle = "background-color: #ffccc7";
				}
			}
			if (field == 'marActual' && isColorRender(currentYear, currentMonth, dataYear, 3)) {
				var mar = record.mar;
				if (areBigDecimalsEqual(e.value, mar)) {
					e.cellStyle = "background-color: #f6ffed";
				} else {
					e.cellStyle = "background-color: #ffccc7";
				}
			}
			if (field == 'apr' && isColorRender(currentYear, currentMonth, dataYear, 4)) {
				var aprActual = record.aprActual;
				if (areBigDecimalsEqual(e.value, aprActual)) {
					e.cellStyle = "background-color: #f6ffed";
				} else {
					e.cellStyle = "background-color: #ffccc7";
				}
			}
			if (field == 'aprActual' && isColorRender(currentYear, currentMonth, dataYear, 4)) {
				var apr = record.apr;
				if (areBigDecimalsEqual(e.value, apr)) {
					e.cellStyle = "background-color: #f6ffed";
				} else {
					e.cellStyle = "background-color: #ffccc7";
				}
			}
			if (field == 'may' && isColorRender(currentYear, currentMonth, dataYear, 5)) {
				var mayActual = record.mayActual;
				if (areBigDecimalsEqual(e.value, mayActual)) {
					e.cellStyle = "background-color: #f6ffed";
				} else {
					e.cellStyle = "background-color: #ffccc7";
				}
			}
			if (field == 'mayActual' && isColorRender(currentYear, currentMonth, dataYear, 5)) {
				var may = record.may;
				if (areBigDecimalsEqual(e.value, may)) {
					e.cellStyle = "background-color: #f6ffed";
				} else {
					e.cellStyle = "background-color: #ffccc7";
				}
			}
			if (field == 'jun' && isColorRender(currentYear, currentMonth, dataYear, 6)) {
				var junActual = record.junActual;
				if (areBigDecimalsEqual(e.value, junActual)) {
					e.cellStyle = "background-color: #f6ffed";
				} else {
					e.cellStyle = "background-color: #ffccc7";
				}
			}
			if (field == 'junActual' && isColorRender(currentYear, currentMonth, dataYear, 6)) {
				var jun = record.jun;
				if (areBigDecimalsEqual(e.value, jun)) {
					e.cellStyle = "background-color: #f6ffed";
				} else {
					e.cellStyle = "background-color: #ffccc7";
				}
			}
			if (field == 'jul' && isColorRender(currentYear, currentMonth, dataYear, 7)) {
				var julActual = record.julActual;
				if (areBigDecimalsEqual(e.value, julActual)) {
					e.cellStyle = "background-color: #f6ffed";
				} else {
					e.cellStyle = "background-color: #ffccc7";
				}
			}
			if (field == 'julActual' && isColorRender(currentYear, currentMonth, dataYear, 7)) {
				var jul = record.jul;
				if (areBigDecimalsEqual(e.value, jul)) {
					e.cellStyle = "background-color: #f6ffed";
				} else {
					e.cellStyle = "background-color: #ffccc7";
				}
			}
			if (field == 'aug' && isColorRender(currentYear, currentMonth, dataYear, 8)) {
				var augActual = record.augActual;
				if (areBigDecimalsEqual(e.value, augActual)) {
					e.cellStyle = "background-color: #f6ffed";
				} else {
					e.cellStyle = "background-color: #ffccc7";
				}
			}
			if (field == 'augActual' && isColorRender(currentYear, currentMonth, dataYear, 8)) {
				var aug = record.aug;
				if (areBigDecimalsEqual(e.value, aug)) {
					e.cellStyle = "background-color: #f6ffed";
				} else {
					e.cellStyle = "background-color: #ffccc7";
				}
			}
			if (field == 'sep' && isColorRender(currentYear, currentMonth, dataYear, 9)) {
				var sepActual = record.sepActual;
				if (areBigDecimalsEqual(e.value, sepActual)) {
					e.cellStyle = "background-color: #f6ffed";
				} else {
					e.cellStyle = "background-color: #ffccc7";
				}
			}
			if (field == 'sepActual' && isColorRender(currentYear, currentMonth, dataYear, 9)) {
				var sep = record.sep;
				if (areBigDecimalsEqual(e.value, sep)) {
					e.cellStyle = "background-color: #f6ffed";
				} else {
					e.cellStyle = "background-color: #ffccc7";
				}
			}
			if (field == 'oct' && isColorRender(currentYear, currentMonth, dataYear, 10)) {
				var octActual = record.octActual;
				if (areBigDecimalsEqual(e.value, octActual)) {
					e.cellStyle = "background-color: #f6ffed";
				} else {
					e.cellStyle = "background-color: #ffccc7";
				}
			}
			if (field == 'octActual' && isColorRender(currentYear, currentMonth, dataYear, 10)) {
				var oct = record.oct;
				if (areBigDecimalsEqual(e.value, oct)) {
					e.cellStyle = "background-color: #f6ffed";
				} else {
					e.cellStyle = "background-color: #ffccc7";
				}
			}
			if (field == 'nov' && isColorRender(currentYear, currentMonth, dataYear, 11)) {
				var novActual = record.novActual;
				if (areBigDecimalsEqual(e.value, novActual)) {
					e.cellStyle = "background-color: #f6ffed";
				} else {
					e.cellStyle = "background-color: #ffccc7";
				}
			}
			if (field == 'novActual' && isColorRender(currentYear, currentMonth, dataYear, 11)) {
				var nov = record.nov;
				if (areBigDecimalsEqual(e.value, nov)) {
					e.cellStyle = "background-color: #f6ffed";
				} else {
					e.cellStyle = "background-color: #ffccc7";
				}
			}
			if (field == 'dec' && isColorRender(currentYear, currentMonth, dataYear, 12)) {
				var decActual = record.decActual;
				if (areBigDecimalsEqual(e.value, decActual)) {
					e.cellStyle = "background-color: #f6ffed";
				} else {
					e.cellStyle = "background-color: #ffccc7";
				}
			}
			if (field == 'decActual' && isColorRender(currentYear, currentMonth, dataYear, 12)) {
				var dec = record.dec;
				if (areBigDecimalsEqual(e.value, dec)) {
					e.cellStyle = "background-color: #f6ffed";
				} else {
					e.cellStyle = "background-color: #ffccc7";
				}
			}
			return e.value;
		}

		function areBigDecimalsEqual(value1, value2) {
			var formattedValue1 = parseFloat(value1).toFixed(2);
			var formattedValue2 = parseFloat(value2).toFixed(2);
			return formattedValue1 === formattedValue2;
		}

		function isColorRender(currentYear, currentMonth, dataYear, dataMonth) {
			if (dataYear < currentYear) {
				return true;
			}
			if (dataYear == currentYear && dataMonth <= currentMonth) {
				return true;
			}
			if (dataYear > currentYear) {
				return false;
			}
		}

		function add() {
			nui.open({
				url : "/default/contractPact/annnualPlan/addAnnualCharge.jsp",
				width : '100%',
				height : '100%',
				title : "新增收款/开票计划",
				onload : function() {
					var iframe = this.getIFrameEl();
				},
				ondestroy : function(action) {
					search();
				}
			})
		}

		function edit() {
			var row = annualChargeGrid.getSelecteds();
			if (row.length > 1 || row.length == 0) {
				showTips("只能选中一条记录进行编辑", "danger");
				return;
			}
			var data = row[0];
			if (data.contractStauts != '1') {
				nui.open({
					url : "/default/contractPact/annnualPlan/editAnnualCharge.jsp",
					width : '100%',
					height : '100%',
					title : "编辑收款/开票计划",
					onload : function() {
						var iframe = this.getIFrameEl();
						iframe.contentWindow.setEditData(data);
					},
					ondestroy : function(action) {
						search();
					}
				})
			} else {
				showTips("只能编辑合同状态为【待签、非合同、产值分配】的数据", "danger");
			}
		}

		function deleteInfo() {
			var rows = annualChargeGrid.getSelecteds();
			if (rows.length == 0) {
				showTips("请选中需要删除的数据记录", "danger");
			} else {
				var status = rows.every(item => item.contractStauts != '1');
				if (status) {
					status = rows.every(item=> isStrEmpty(item.contractNo));
					if (status) {
						if (!confirm("是否删除？")) {
							return;
						} else {
							var datas = rows.map(row => ({ id: row.id }));
							var json = nui.encode({
								'datas' : datas
							});
							nui.ajax({
								url : "com.zhonghe.ame.annualPlan.annualPlan.delAnnualChargePlan.biz.ext",
								type : 'POST',
								data : json,
								contentType : 'text/json',
								success : function(o) {
									if (o.result == 1) {
										showTips("删除成功");
										annualChargeGrid.reload();
									} else {
										showTips("删除失败，请联系信息技术部人员！", "danger");
									}
								}
							});
						}
					} else {
						showTips("存在合同编号且合同状态为【待签、非合同、产值分配】的数据由系统生产，无法删除", "danger");
					}
				} else {
					showTips("只能删除合同状态为【待签、非合同、产值分配】的数据", "danger");
				}
			}
		}
		
		function syncInfo() {
			var rows = annualChargeGrid.getSelecteds();
			if (rows.length > 0) {
				nui.MessageBox.show({
					width : 400,
					title : "选中数据同步 -> 年度收入预算",
					buttons : [ "ok", "cancel" ],
					message : "您通过复选框选中了多条数据，是否同步这些选中的数据 ?",
					iconCls : "mini-messagebox-question",
					callback : function(action) {
						if (action == "ok") {
							nui.prompt("请输入<div style=\"display: initial;color: red;\">同意选中数据同步</div>", "防止误操作", function(action, value) {
								if (action == "ok") {
									if (value == "同意选中数据同步") {
										var syncwait = nui.loading("数据同步中......", "等待");
										var datas = rows.map(function(row) {return row.id;}).join(',');
										var json = nui.encode({
											'datas' : datas
										});
										nui.ajax({
											url : "com.zhonghe.ame.annualPlan.annualPlan.syncAnnualPlanYear.biz.ext",
											type : 'POST',
											data : json,
											contentType : 'text/json',
											success : function(o) {
												nui.hideMessageBox(syncwait);
												if(o.result=="1"){
													showTips("数据同步成功");
												}else{
													showTips("数据同步异常，请联系管理员！", "danger");
												}
											}
										});										
									} else {
										showTips("输入内容错误，请重新操作！", "danger");
									}
								}
							})
						}
					}
				});
			} else {
				nui.MessageBox.show({
					width : 330,
					title : "查询结果数据同步 -> 年度收入预算",
					buttons : [ "ok", "cancel" ],
					message : "查询结果数据，是否同步当前查询结果数据 ?",
					iconCls : "mini-messagebox-question",
					callback : function(action) {
						if (action == "ok") {
							nui.prompt("请输入<div style=\"display: initial;color: red;\">同意查询结果数据同步</div>", "防止误操作", function(action, value) {
								if (action == "ok") {
									if (value == "同意查询结果数据同步") {
										var syncwait = nui.loading("数据同步中......", "等待");
										var data = form.getData();
										nui.ajax({
											url : "com.zhonghe.ame.annualPlan.annualPlan.syncAnnualPlanYear.biz.ext",
											type : 'POST',
											data : data,
											contentType : 'text/json',
											success : function(o) {
												nui.hideMessageBox(syncwait);
												if(o.result=="1"){
													showTips("数据同步成功");
												}else{
													showTips("数据同步异常，请联系管理员！", "danger");
												}
											}
										});
									} else {
										showTips("输入内容错误，请重新操作！", "danger");
									}
								}
							})
						}
					}
				});
			}
		}
		
		//导出
		function exportExcel() {
			var rows = annualChargeGrid.getSelecteds();
			var json;
			if(rows.length == 0){
				if (!confirm("是否确认导出？")) {
					return;
				}
				var form = new nui.Form("#form1");
				var data = form.getData(); //获取表单JS对象数据
				json = nui.encode(data);
			}else{
				if (!confirm("确定要导出选中数据(如需导出查询结果数据，请取消选中)？")) {
					return;
				}
				var ids = rows.map(row => row.id).join(',');
				json = nui.encode({
						"criteria":{
							"_expr": [{
								"_property": "id",
								"_op": "in",
								"_value": ids
							}]
						}
					}
				);
			}
			nui.ajax({
					url : "com.zhonghe.ame.annualPlan.annualPlan.exportAnnualChargePlanExcel.biz.ext",
					type : "post",
					data : json,
					cache : false,
					contentType : 'text/json',
					success : function(o) {
						var filePath = o.downloadFile;
						var fileName = "收款-开票计划";
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

		function PAYER(e) {
			return nui.getDictText("PAYER", e.value);
		}

		function ZH_MAJOR_TYPE(e) {
			return nui.getDictText("ZH_MAJOR_TYPE", e.value);
		}

		function ZH_PROJECT_TYPE(e) {
			return nui.getDictText("ZH_PROJECT_TYPE", e.value);
		}

		function ZH_GROUP(e) {
			return nui.getDictText("ZH_GROUP", e.value);
		}

		function RISK_LEVEL(e) {
			return nui.getDictText("RISK_LEVEL", e.value);
		}

		function ZH_CONTRACT_STATUS(e) {
			if (e.value == '1') {
				e.cellStyle = "color: green";
			} else {
				e.cellStyle = "color: red";
			}
			return nui.getDictText("ZH_CONTRACT_STATUS", e.value);
		}

		function isStrEmpty(obj) {
			if (typeof obj == "undefined" || obj == null || obj == "") {
				return true;
			} else {
				return false;
			}
		}
		
		function onDrawSummaryCell(e){
			if(e.field == "jan"){
				headerColumnObj.jan = e.column.summaryValue
			}else if(e.field == "janActual"){
				headerColumnObj.janActual = e.column.summaryValue
			}else if(e.field == "feb"){
				headerColumnObj.feb = e.column.summaryValue
			}else if(e.field == "febActual"){
				headerColumnObj.febActual = e.column.summaryValue
			}else if(e.field == "mar"){
				headerColumnObj.mar = e.column.summaryValue
			}else if(e.field == "marActual"){
				headerColumnObj.marActual = e.column.summaryValue
			}else if(e.field == "apr"){
				headerColumnObj.apr = e.column.summaryValue
			}else if(e.field == "aprActual"){
				headerColumnObj.aprActual = e.column.summaryValue
			}else if(e.field == "may"){
				headerColumnObj.may = e.column.summaryValue
			}else if(e.field == "mayActual"){
				headerColumnObj.mayActual = e.column.summaryValue
			}else if(e.field == "jun"){
				headerColumnObj.jun = e.column.summaryValue
			}else if(e.field == "junActual"){
				headerColumnObj.junActual = e.column.summaryValue
			}else if(e.field == "jul"){
				headerColumnObj.jul = e.column.summaryValue
			}else if(e.field == "julActual"){
				headerColumnObj.julActual = e.column.summaryValue
			}else if(e.field == "aug"){
				headerColumnObj.aug = e.column.summaryValue
			}else if(e.field == "augActual"){
				headerColumnObj.augActual = e.column.summaryValue
			}else if(e.field == "sep"){
				headerColumnObj.sep = e.column.summaryValue
			}else if(e.field == "sepActual"){
				headerColumnObj.sepActual = e.column.summaryValue
			}else if(e.field == "oct"){
				headerColumnObj.oct = e.column.summaryValue
			}else if(e.field == "octActual"){
				headerColumnObj.octActual = e.column.summaryValue
			}else if(e.field == "nov"){
				headerColumnObj.nov = e.column.summaryValue
			}else if(e.field == "novActual"){
				headerColumnObj.novActual = e.column.summaryValue
			}else if(e.field == "dec"){
				headerColumnObj.dec = e.column.summaryValue
			}else if(e.field == "decActual"){
				headerColumnObj.decActual = e.column.summaryValue
			}
		}
		
		function setHeaderBackColor(){
			var dataYear = nui.get("years").getValue();
			if(isColorRender(currentYear, currentMonth, dataYear, 1)){
				if (areBigDecimalsEqual(headerColumnObj.jan, headerColumnObj.janActual)) {
					$('.mini-grid-headerCell-inner.mini-grid-headerCell-nowrap').filter(function(){
						return $(this).text().trim() === '1月计划';
					}).parent('div').css('background-color', '#f6ffed');
					$('.mini-grid-headerCell-inner.mini-grid-headerCell-nowrap').filter(function(){
						return $(this).text().trim() === '1月实际';
					}).parent('div').css('background-color', '#f6ffed');
				}else{
					$('.mini-grid-headerCell-inner.mini-grid-headerCell-nowrap').filter(function(){
						return $(this).text().trim() === '1月计划';
					}).parent('div').css('background-color', '#ffccc7');
					$('.mini-grid-headerCell-inner.mini-grid-headerCell-nowrap').filter(function(){
						return $(this).text().trim() === '1月实际';
					}).parent('div').css('background-color', '#ffccc7');
				}
			}
			if(isColorRender(currentYear, currentMonth, dataYear, 2)){
				if (areBigDecimalsEqual(headerColumnObj.feb, headerColumnObj.febActual)) {
					$('.mini-grid-headerCell-inner.mini-grid-headerCell-nowrap').filter(function(){
						return $(this).text().trim() === '2月计划';
					}).parent('div').css('background-color', '#f6ffed');
					$('.mini-grid-headerCell-inner.mini-grid-headerCell-nowrap').filter(function(){
						return $(this).text().trim() === '2月实际';
					}).parent('div').css('background-color', '#f6ffed');
				}else{
					$('.mini-grid-headerCell-inner.mini-grid-headerCell-nowrap').filter(function(){
						return $(this).text().trim() === '2月计划';
					}).parent('div').css('background-color', '#ffccc7');
					$('.mini-grid-headerCell-inner.mini-grid-headerCell-nowrap').filter(function(){
						return $(this).text().trim() === '2月实际';
					}).parent('div').css('background-color', '#ffccc7');
				}
			}
			if(isColorRender(currentYear, currentMonth, dataYear, 3)){
				if (areBigDecimalsEqual(headerColumnObj.mar, headerColumnObj.marActual)) {
					$('.mini-grid-headerCell-inner.mini-grid-headerCell-nowrap').filter(function(){
						return $(this).text().trim() === '3月计划';
					}).parent('div').css('background-color', '#f6ffed');
					$('.mini-grid-headerCell-inner.mini-grid-headerCell-nowrap').filter(function(){
						return $(this).text().trim() === '3月实际';
					}).parent('div').css('background-color', '#f6ffed');
				}else{
					$('.mini-grid-headerCell-inner.mini-grid-headerCell-nowrap').filter(function(){
						return $(this).text().trim() === '3月计划';
					}).parent('div').css('background-color', '#ffccc7');
					$('.mini-grid-headerCell-inner.mini-grid-headerCell-nowrap').filter(function(){
						return $(this).text().trim() === '3月实际';
					}).parent('div').css('background-color', '#ffccc7');
				}
			}
			if(isColorRender(currentYear, currentMonth, dataYear, 4)){
				if (areBigDecimalsEqual(headerColumnObj.apr, headerColumnObj.aprActual)) {
					$('.mini-grid-headerCell-inner.mini-grid-headerCell-nowrap').filter(function(){
						return $(this).text().trim() === '4月计划';
					}).parent('div').css('background-color', '#f6ffed');
					$('.mini-grid-headerCell-inner.mini-grid-headerCell-nowrap').filter(function(){
						return $(this).text().trim() === '4月实际';
					}).parent('div').css('background-color', '#f6ffed');
				}else{
					$('.mini-grid-headerCell-inner.mini-grid-headerCell-nowrap').filter(function(){
						return $(this).text().trim() === '4月计划';
					}).parent('div').css('background-color', '#ffccc7');
					$('.mini-grid-headerCell-inner.mini-grid-headerCell-nowrap').filter(function(){
						return $(this).text().trim() === '4月实际';
					}).parent('div').css('background-color', '#ffccc7');
				}
			}
			if(isColorRender(currentYear, currentMonth, dataYear, 5)){
				if (areBigDecimalsEqual(headerColumnObj.may, headerColumnObj.mayActual)) {
					$('.mini-grid-headerCell-inner.mini-grid-headerCell-nowrap').filter(function(){
						return $(this).text().trim() === '5月计划';
					}).parent('div').css('background-color', '#f6ffed');
					$('.mini-grid-headerCell-inner.mini-grid-headerCell-nowrap').filter(function(){
						return $(this).text().trim() === '5月实际';
					}).parent('div').css('background-color', '#f6ffed');
				}else{
					$('.mini-grid-headerCell-inner.mini-grid-headerCell-nowrap').filter(function(){
						return $(this).text().trim() === '5月计划';
					}).parent('div').css('background-color', '#ffccc7');
					$('.mini-grid-headerCell-inner.mini-grid-headerCell-nowrap').filter(function(){
						return $(this).text().trim() === '5月实际';
					}).parent('div').css('background-color', '#ffccc7');
				}
			}
			if(isColorRender(currentYear, currentMonth, dataYear, 6)){
				if (areBigDecimalsEqual(headerColumnObj.jun, headerColumnObj.junActual)) {
					$('.mini-grid-headerCell-inner.mini-grid-headerCell-nowrap').filter(function(){
						return $(this).text().trim() === '6月计划';
					}).parent('div').css('background-color', '#f6ffed');
					$('.mini-grid-headerCell-inner.mini-grid-headerCell-nowrap').filter(function(){
						return $(this).text().trim() === '6月实际';
					}).parent('div').css('background-color', '#f6ffed');
				}else{
					$('.mini-grid-headerCell-inner.mini-grid-headerCell-nowrap').filter(function(){
						return $(this).text().trim() === '6月计划';
					}).parent('div').css('background-color', '#ffccc7');
					$('.mini-grid-headerCell-inner.mini-grid-headerCell-nowrap').filter(function(){
						return $(this).text().trim() === '6月实际';
					}).parent('div').css('background-color', '#ffccc7');
				}
			}
			if(isColorRender(currentYear, currentMonth, dataYear, 7)){
				if (areBigDecimalsEqual(headerColumnObj.jul, headerColumnObj.julActual)) {
					$('.mini-grid-headerCell-inner.mini-grid-headerCell-nowrap').filter(function(){
						return $(this).text().trim() === '7月计划';
					}).parent('div').css('background-color', '#f6ffed');
					$('.mini-grid-headerCell-inner.mini-grid-headerCell-nowrap').filter(function(){
						return $(this).text().trim() === '7月实际';
					}).parent('div').css('background-color', '#f6ffed');
				}else{
					$('.mini-grid-headerCell-inner.mini-grid-headerCell-nowrap').filter(function(){
						return $(this).text().trim() === '7月计划';
					}).parent('div').css('background-color', '#ffccc7');
					$('.mini-grid-headerCell-inner.mini-grid-headerCell-nowrap').filter(function(){
						return $(this).text().trim() === '7月实际';
					}).parent('div').css('background-color', '#ffccc7');
				}
			}
			if(isColorRender(currentYear, currentMonth, dataYear, 8)){
				if (areBigDecimalsEqual(headerColumnObj.aug, headerColumnObj.augActual)) {
					$('.mini-grid-headerCell-inner.mini-grid-headerCell-nowrap').filter(function(){
						return $(this).text().trim() === '8月计划';
					}).parent('div').css('background-color', '#f6ffed');
					$('.mini-grid-headerCell-inner.mini-grid-headerCell-nowrap').filter(function(){
						return $(this).text().trim() === '8月实际';
					}).parent('div').css('background-color', '#f6ffed');
				}else{
					$('.mini-grid-headerCell-inner.mini-grid-headerCell-nowrap').filter(function(){
						return $(this).text().trim() === '8月计划';
					}).parent('div').css('background-color', '#ffccc7');
					$('.mini-grid-headerCell-inner.mini-grid-headerCell-nowrap').filter(function(){
						return $(this).text().trim() === '8月实际';
					}).parent('div').css('background-color', '#ffccc7');
				}
			}
			if(isColorRender(currentYear, currentMonth, dataYear, 9)){
				if (areBigDecimalsEqual(headerColumnObj.sep, headerColumnObj.sepActual)) {
					$('.mini-grid-headerCell-inner.mini-grid-headerCell-nowrap').filter(function(){
						return $(this).text().trim() === '9月计划';
					}).parent('div').css('background-color', '#f6ffed');
					$('.mini-grid-headerCell-inner.mini-grid-headerCell-nowrap').filter(function(){
						return $(this).text().trim() === '9月实际';
					}).parent('div').css('background-color', '#f6ffed');
				}else{
					$('.mini-grid-headerCell-inner.mini-grid-headerCell-nowrap').filter(function(){
						return $(this).text().trim() === '9月计划';
					}).parent('div').css('background-color', '#ffccc7');
					$('.mini-grid-headerCell-inner.mini-grid-headerCell-nowrap').filter(function(){
						return $(this).text().trim() === '9月实际';
					}).parent('div').css('background-color', '#ffccc7');
				}
			}
			if(isColorRender(currentYear, currentMonth, dataYear, 10)){
				if (areBigDecimalsEqual(headerColumnObj.oct, headerColumnObj.octActual)) {
					$('.mini-grid-headerCell-inner.mini-grid-headerCell-nowrap').filter(function(){
						return $(this).text().trim() === '10月计划';
					}).parent('div').css('background-color', '#f6ffed');
					$('.mini-grid-headerCell-inner.mini-grid-headerCell-nowrap').filter(function(){
						return $(this).text().trim() === '10月实际';
					}).parent('div').css('background-color', '#f6ffed');
				}else{
					$('.mini-grid-headerCell-inner.mini-grid-headerCell-nowrap').filter(function(){
						return $(this).text().trim() === '10月计划';
					}).parent('div').css('background-color', '#ffccc7');
					$('.mini-grid-headerCell-inner.mini-grid-headerCell-nowrap').filter(function(){
						return $(this).text().trim() === '10月实际';
					}).parent('div').css('background-color', '#ffccc7');
				}
			}
			if(isColorRender(currentYear, currentMonth, dataYear, 11)){
				if (areBigDecimalsEqual(headerColumnObj.nov, headerColumnObj.novActual)) {
					$('.mini-grid-headerCell-inner.mini-grid-headerCell-nowrap').filter(function(){
						return $(this).text().trim() === '11月计划';
					}).parent('div').css('background-color', '#f6ffed');
					$('.mini-grid-headerCell-inner.mini-grid-headerCell-nowrap').filter(function(){
						return $(this).text().trim() === '11月实际';
					}).parent('div').css('background-color', '#f6ffed');
				}else{
					$('.mini-grid-headerCell-inner.mini-grid-headerCell-nowrap').filter(function(){
						return $(this).text().trim() === '11月计划';
					}).parent('div').css('background-color', '#ffccc7');
					$('.mini-grid-headerCell-inner.mini-grid-headerCell-nowrap').filter(function(){
						return $(this).text().trim() === '11月实际';
					}).parent('div').css('background-color', '#ffccc7');
				}
			}
			if(isColorRender(currentYear, currentMonth, dataYear, 12)){
				if (areBigDecimalsEqual(headerColumnObj.dec, headerColumnObj.decActual)) {
					$('.mini-grid-headerCell-inner.mini-grid-headerCell-nowrap').filter(function(){
						return $(this).text().trim() === '12月计划';
					}).parent('div').css('background-color', '#f6ffed');
					$('.mini-grid-headerCell-inner.mini-grid-headerCell-nowrap').filter(function(){
						return $(this).text().trim() === '12月实际';
					}).parent('div').css('background-color', '#f6ffed');
				}else{
					$('.mini-grid-headerCell-inner.mini-grid-headerCell-nowrap').filter(function(){
						return $(this).text().trim() === '12月计划';
					}).parent('div').css('background-color', '#ffccc7');
					$('.mini-grid-headerCell-inner.mini-grid-headerCell-nowrap').filter(function(){
						return $(this).text().trim() === '12月实际';
					}).parent('div').css('background-color', '#ffccc7');
				}
			}																																																												
		}
		
	</script>

</body>
</html>