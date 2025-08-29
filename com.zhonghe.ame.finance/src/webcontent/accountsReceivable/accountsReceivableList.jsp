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
<title>应收账款管理</title>
</head>
<body>
	<div id="tabs" class="nui-tabs" activeIndex="0" style="width: auto; height: 99%; padding: 5px;" onactivechanged="tabActiveChanged">
		<div title="应收账款台账">
			<div id="tzForm">
				<input name="critria._entity" value="com.zhonghe.ame.invoice.ZhInvoice.ZhInvoiceEntity" class="nui-hidden" />
				<input name="critria._expr[0]._property" value="secondaryOrg" class="nui-hidden" />
				<input name="critria._expr[0]._op" value="in" class="nui-hidden" />
				<input id="searchOrgids" name="critria._expr[0]._value" class="nui-hidden" />
				<input name="critria._expr[100].appStatus" value="2" class="nui-hidden" />
				<input name="critria._expr[101]._value" value="0" class="nui-hidden" />
				<input name="critria._expr[101]._property" value="balanceSum" class="nui-hidden" />
				<input name="critria._expr[101]._op" value=">" class="nui-hidden" />
				<div class="nui-toolbar" style="border-bottom: 0; padding: 5px;">
					<table>
						<tr>
							<td style="width: 70px; text-align: right;">合同编号：</td>
							<td>
								<input name="critria._expr[1]._value" class="nui-textbox" style="width: 200px" />
								<input class="nui-hidden" name="critria._expr[1]._property" value="contractNo" />
								<input class="nui-hidden" name="critria._expr[1]._op" value="like" />
							</td>
							<td style="width: 70px; text-align: right;">合同名称：</td>
							<td>
								<input name="critria._expr[2]._value" class="nui-textbox" style="width: 200px" />
								<input class="nui-hidden" name="critria._expr[2]._property" value="contractName" />
								<input class="nui-hidden" name="critria._expr[2]._op" value="like" />
							</td>
							<td style="width: 70px; text-align: right;">开票日期：</td>
							<td>
								<input class="nui-hidden" name="critria._expr[3]._op" value="between" />
								<input class="nui-hidden" name="critria._expr[3]._pattern" value="yyyy-MM-dd" />
								<input class="nui-hidden" name="critria._expr[3]._property" value="createTime" />
								<input class="nui-datepicker" name="critria._expr[3]._min" style="width: 110px" />
								<span>至</span>
								<input class="nui-datepicker" name="critria._expr[3]._max" style="width: 110px" />
							</td>
						</tr>
						<tr>
							<td style="width: 90px; text-align: right;">合同承办单位：</td>
							<td>
								<input id="secondaryOrg" name="critria._expr[6].secondaryOrg" class="nui-combobox" textField="secOrgname" valueField="secOrg" style="width: 200px" showNullItem="true" />
							</td>
							<td style="width: 70px; text-align: right;">付款单位：</td>
							<td>
								<input name="critria._expr[4]._value" class="nui-textbox" style="width: 200px" />
								<input class="nui-hidden" name="critria._expr[4]._property" value="payerName" />
								<input class="nui-hidden" name="critria._expr[4]._op" value="like" />
							</td>
							<td style="width: 80px; text-align: right;">集团内/外：</td>
							<td>
								<input id="headquarterGroup" name="critria._expr[5]._value" class="nui-combobox" textField="dictName" valueField="dictID" showNullItem="true" style="width: 110px" />
								<input name="critria._expr[5]._property" value="headquarterGroup" class="nui-hidden" />
								<input name="critria._expr[5]._op" value="in" class="nui-hidden" />
								<a class="nui-button" id="tzSearch" iconCls="icon-search" onclick="tzSearch()">查询</a>
								<a class="nui-button" id="tzReset" iconCls="icon-reload" onclick="tzReset()">重置</a>
								<a class="nui-button" id="tzExport" iconCls="icon-download" onclick="tzExport()">导出</a>
							</td>
						</tr>
					</table>
				</div>
			</div>

			<div class="nui-fit">
				<div id="tzDataGrid" sizeList="[5000]" showPager="true" dataField="data" showSummaryRow="true" pageSize="5000" class="nui-datagrid" style="width: 100%; height: 100%;"
					url="com.zhonghe.ame.payment.payMent.payMentAll.biz.ext" allowSortColumn=true showSummaryRow="true" virtualScroll="true" virtualColumns="true">
					<div property="columns">
						<div field="createTime" dateFormat="yyyy-MM-dd" width="80" align="center" headerAlign="center" allowSort="true">开票日期</div>
						<div field="createUsername" width="60" align="center" headerAlign="center">经办人</div>
						<div field="secondaryOrgname" width="180" align="center" headerAlign="center">合同承办单位</div>
						<div field="contractNo" width="200" align="center" headerAlign="center">合同编号</div>
						<div field="contractName" width="250" align="center" headerAlign="center">合同名称</div>
						<div field="payerName" width="200" align="center" headerAlign="center">付款单位</div>
						<div field="invoiceSum" width="100" align="center" headerAlign="center" allowSort="true" summaryType="sum" dataType="currency">开票金额（元）</div>
						<div field="receivableSum" width="100" align="center" headerAlign="center" allowSort="true" summaryType="sum" dataType="currency">回款金额（元）</div>
						<div field="balanceSum" width="100" align="center" headerAlign="center" allowSort="true" summaryType="sum" dataType="currency">余额（元）</div>
						<div field="headquarterGroup" align="center" headerAlign="center" allowSort="true" renderer="ZH_GROUP">集团内/外</div>
					</div>
				</div>
			</div>
		</div>

		<div title="应收账款统计">
			<div id="tjForm">
				<input id="tjSec" name="tjSec" class="nui-hidden" />
				<div class="nui-toolbar" style="border-bottom: 0; padding: 5px;">
					<table>
						<tr>
							<td style="width: 70px; text-align: right;">统计年月：</td>
							<td>
								<input id="tjYearMonth" name="tjYearMonth" class="nui-monthpicker" style="width: 110px" />
							</td>
							<td style="width: 70px; text-align: right;">统计单位：</td>
							<td>
								<input id="tjSecondaryOrg" name="tjSecondaryOrg" class="nui-combobox" textField="secOrgname" valueField="secOrg" style="width: 200px" showNullItem="true" />
							</td>
							<td style="width: 70px; text-align: right;">集团内/外：</td>
							<td>
								<input id="tjHeadquarterGroup" name="tjHeadquarterGroup" class="nui-combobox" textField="dictName" valueField="dictID" style="width: 110px" showNullItem="true" />
							</td>
							<td>
								<a class="nui-button" id="tjSearch" iconCls="icon-search" onclick="tjSearch()">查询</a>
								<a class="nui-button" id="tjReset" iconCls="icon-reload" onclick="tjReset()">重置</a>
								<a class="nui-button" id="tjExport" iconCls="icon-download" onclick="tjExport()">导出</a>
							</td>
						</tr>
					</table>
				</div>
			</div>

			<div class="nui-fit">
				<div id="tjDataGrid" class="nui-datagrid" showPager="false" showSummaryRow="true" style="width: 100%;" url="com.zhonghe.ame.finance.accountsReceivable.queryTjAccountsReceivable.biz.ext"
					dataField="datas">
					<div property="columns">
						<div field="secOrgname" headerAlign="center" align="center" width="150">承办单位</div>
						<div header="年度回款情况" headerAlign="center" align="center">
							<div property="columns">
								<div field="invoiceSumTotal" headerAlign="center" align="center" summaryType="sum" dataType="currency" width="120">1-当月开票金额(万元)</div>
								<div field="receivableSumTotal" headerAlign="center" align="center" summaryType="sum" dataType="currency" width="120">1-当月回款金额(万元)</div>
								<div field="collectionRateText" headerAlign="center" align="center" width="60">回款率(%)</div>
								<div field="averageDay" headerAlign="center" align="center" width="100">平均回款天数(天)</div>
							</div>
						</div>
						<div header="本年形成应收账款情况" headerAlign="center" align="center">
							<div property="columns">
								<div field="monthlyAccountsReceivableTotal" headerAlign="center" align="center" summaryType="sum" dataType="currency" width="140">1-当月形成应收账款(万元)</div>
								<div field="monthlyInvoicingPortionTotal" headerAlign="center" align="center" summaryType="sum" dataType="currency" width="140">其中：当月开票部分(万元)</div>
								<div field="proportionText" headerAlign="center" align="center" width="60">占比(%)</div>
							</div>
						</div>
						<div header="应收账款情况（含结转）及账龄分析" headerAlign="center" align="center">
							<div property="columns">
								<div field="accountsReceivableBalanceTotal" headerAlign="center" align="center" summaryType="sum" dataType="currency" width="110">应收账款余额(万元)</div>
								<div field="oneBalanceTotal" headerAlign="center" align="center" summaryType="sum" dataType="currency" width="100">其中：1年以内</div>
								<div field="oneTwoBalanceTotal" headerAlign="center" align="center" summaryType="sum" dataType="currency" width="100">其中：1-2年</div>
								<div field="twoThreeBalanceTotal" headerAlign="center" align="center" summaryType="sum" dataType="currency" width="100">其中：2-3年</div>
								<div field="threeBalanceTotal" headerAlign="center" align="center" summaryType="sum" dataType="currency" width="100">其中：3年以上</div>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>

	</div>

	<form name="viewlist1" id="viewlist1" action="com.primeton.eos.ame_common.ameExportCommon.flow" method="post">
		<input type="hidden" name="_eosFlowAction" value="action0" filter="false" />
		<input type="hidden" name="downloadFile" filter="false" />
		<input type="hidden" name="fileName" filter="false" />
	</form>

	<script type="text/javascript">
		nui.parse();
		var tzForm = new nui.Form("#tzForm");
		var tjForm = new nui.Form("#tjForm");
		var tzDataGrid = nui.get("tzDataGrid");
		var tjDataGrid = nui.get("tjDataGrid");
		var tabs = nui.get("tabs");
		var secOrgId;

		function tabActiveChanged(e) {
			if (e.tab.title == "应收账款台账") {
				tzInit();
			}else if(e.tab.title == "应收账款统计"){
				tjInit();
			}
		}

		function tzInit() {
			var headquarterGroup = [];
			headquarterGroup.push({dictID: "0,3,4", dictName: "集团内"});
			headquarterGroup.push({dictID: "1", dictName: "集团外"});
			nui.get("headquarterGroup").setData(headquarterGroup);
			var json = nui.encode({
				'loginUserId' : userId,
				'loginUserOrgId' : userOrgId,
				'authCode' : 'cwyszk'
			});
			nui.ajax({
				url : "com.zhonghe.ame.contractPact.statisticalReport.queryMonthlyBudgetTrackAuth.biz.ext",
				type : 'POST',
				async : false,
				data : json,
				contentType : 'text/json',
				success : function(o) {
					if (o.result == "1") {
						initSecOrgCombobox(null);
					} else {
						setSecOrg(userOrgId);
						initSecOrgCombobox(secOrgId);
					}
					tzSearch();
				}
			});
		}
		
		function tjInit(){
			var headquarterGroup = [];
			headquarterGroup.push({dictID: "0", dictName: "集团内"});
			headquarterGroup.push({dictID: "1", dictName: "集团外"});
			nui.get("tjHeadquarterGroup").setData(headquarterGroup);
			var today = new Date();
			var lastMonth = new Date(today);
			lastMonth.setMonth(today.getMonth() - 1);
			nui.get("tjYearMonth").setValue(lastMonth);
			tjSearch();
		}

		function setSecOrg(userOrgId) {
			var json = nui.encode({
				'userOrgId' : userOrgId
			});
			ajaxCommon({
				url : "com.primeton.eos.common.orgUtils.getSecOrg.biz.ext",
				data : json,
				async : false,
				success : function(result) {
					var data = result.data;
					secOrgId = data.ORGID;
				}
			});
		}
		
		function initSecOrgCombobox(secOrgId) {
			ajaxCommon({
				"url" : "com.zhonghe.ame.kaohe.common.getBusSecOrgList.biz.ext",
				contentType : 'text/json',
				async: false,
				success : function(result) {
					var datas = result.secOrgList;
					if(secOrgId != null){
						var orgIdSet = new Set(secOrgId.split(','));
						var filteredDatas = datas.filter(item => orgIdSet.has(item.secOrg));
						nui.get("secondaryOrg").setData(filteredDatas);
						nui.get("tjSecondaryOrg").setData(filteredDatas);
						nui.get("searchOrgids").setValue(secOrgId);
						nui.get("tjSec").setValue(secOrgId);
					}else{
						nui.get("secondaryOrg").setData(datas);
						nui.get("tjSecondaryOrg").setData(datas);
					}
				}
			});
		}

		function tzSearch() {
			var data = tzForm.getData();
			tzDataGrid.sortBy("createTime", "asc");
			tzDataGrid.load(data);
		}
		
		function tzReset(){
			tzForm.reset();
			tzInit();
		}
		
		function tjSearch(){
			tjDataGrid.load({
				"tjSec": nui.get("tjSec").getValue(),
				"tjYearMonth": nui.get("tjYearMonth").getValue(),
				"tjSecondaryOrg": nui.get("tjSecondaryOrg").getValue(),
				"tjHeadquarterGroup": nui.get("tjHeadquarterGroup").getValue()
			});
		}
		
		function tjReset(){
			tjForm.reset();
			tzInit();
			tjInit();
		}
		
		function tzExport(){
			var data = tzForm.getData();
			exportExcel({
				"data" : data,
				"url" : "com.zhonghe.ame.finance.accountsReceivable.exportTzExcel.biz.ext",
				"fileName" : "应收账款台账"
			})
		}
		
		function tjExport(){
			var data = {
				"tjSec": nui.get("tjSec").getValue(),
				"tjYearMonth": nui.get("tjYearMonth").getValue(),
				"tjSecondaryOrg": nui.get("tjSecondaryOrg").getValue(),
				"tjHeadquarterGroup": nui.get("tjHeadquarterGroup").getValue()
			};
			exportExcel({
				"data" : data,
				"url" : "com.zhonghe.ame.finance.accountsReceivable.exportTjExcel.biz.ext",
				"fileName" : "应收账款统计"
			})
		}
				

		function ZH_GROUP(e) {
			return nui.getDictText("ZH_GROUP", e.value);
		}
	</script>

</body>
</html>