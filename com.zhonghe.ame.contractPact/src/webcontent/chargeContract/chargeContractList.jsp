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
<title>收费合同管理</title>
</head>
<body>
	<div style="width: auto; height: 99%; padding: 5px;">
		<div id="form1">
			<input class="nui-hidden" name="critria._entity" value="com.zhonghe.ame.chargeContract.chargeContract.ZhChargeContractEntity" />
			<div class="nui-toolbar" style="border-bottom: 0; padding: 5px;">
				<table>
					<tr>
						<td style="width: 60px; text-align: right;">经办人:</td>
						<td style="width: 155px">
							<input name="critria._expr[1].createUsername" class="nui-textbox" id="createUsername" style="width: 150px" />
							<input class="nui-hidden" name="critria._expr[1]._op" value="like" id="createUsernameOp" />
							<input name="critria._expr[0].createUserid" class="nui-hidden" id="createUserid" />
						</td>
						<td style="width: 90px; text-align: right;">合同承办部门:</td>
						<td style="width: 155px">
							<input id="orgid2" name="critria._ref[0]._expr[0]._value" class="nui-combobox" textField="orgname" valueField="orgseq" dataField="orgs" showNullItem="true" allowInput="true"
								style="width: 150px" valueFromSelect="true" />
							<input class="nui-hidden" name="critria._expr[2]._property" value="implementOrg" id="implementOrgProp" />
							<input class="nui-hidden" name="critria._expr[2]._op" value="in" id="implementOrgOp" />
							<input class="nui-hidden" name="critria._expr[2]._ref" value="1" id="implementOrgRef" />
							<input class="nui-hidden" name="critria._ref[0]._id" value="1" />
							<input class="nui-hidden" name="critria._ref[0]._entity" value="org.gocom.abframe.dataset.organization.OmOrganization" />
							<input class="nui-hidden" name="critria._ref[0]._select._field[0]" value="orgid" />
							<input class="nui-hidden" name="critria._ref[0]._expr[0]._property" value="orgseq" />
							<input class="nui-hidden" name="critria._ref[0]._expr[0]._op" value="like" />
							<input class="nui-hidden" name="critria._ref[0]._expr[0]._likeRule" value="end" />
							<input class="nui-hidden" name="critria._expr[3]._property" value="implementOrg" id="implementOrgProp2" />
							<input class="nui-hidden" name="critria._expr[3]._op" value="in" id="implementOrgOp2" />
							<input class="nui-hidden" name="critria._expr[3]._value" id="orgids2" />
						</td>
						<td style="width: 60px; text-align: right;">合同编号:</td>
						<td style="width: 155px">
							<input name="critria._expr[10]._value" class="nui-textbox" style="width: 150px" />
							<input class="nui-hidden" name="critria._expr[10]._property" value="contractNo" />
							<input class="nui-hidden" name="critria._expr[10]._op" value="like" />
						</td>
						<td style="width: 60px; text-align: right;">合同名称:</td>
						<td style="width: 155px">
							<input name="critria._expr[6]._value" class="nui-textbox" style="width: 150px" />
							<input class="nui-hidden" name="critria._expr[6]._property" value="contractName" />
							<input class="nui-hidden" name="critria._expr[6]._op" value="like" />
						</td>
						<td style="width: 60px; text-align: right;">审批状态:</td>
						<td style="width: 155px">
							<input name="critria._expr[12].appStatus" class="nui-dictcombobox" dictTypeId="ZH_FLOW_TYPE" showNullItem="true" nullItemText="全部" style="width: 150px" />
						</td>
						<td style="width: 60px; text-align: right;">合同金额:</td>
						<td style="width: 245px">
							<input class="nui-hidden" name="critria._expr[21]._op" value="between" />
							<input class="nui-hidden" name="critria._expr[21]._property" value="contractSum" />
							<input class="nui-textbox" name="critria._expr[21]._min" style="width: 110px" />
							<span>至</span>
							<input class="nui-textbox" name="critria._expr[21]._max" style="width: 110px" />
						</td>
					</tr>
					<tr>
						<td style="width: 60px; text-align: right;">执行状态:</td>
						<td style="width: 155px">
							<input name="critria._expr[22].executeStatus" class="nui-dictcombobox" dictTypeId="EXECUTE_STATUS" showNullItem="true" nullItemText="全部" style="width: 150px" />
						</td>
						<td style="width: 60px; text-align: right;">签约方:</td>
						<td style="width: 155px">
							<input name="critria._expr[20]._value" class="nui-combobox" url="com.zhonghe.ame.chargeContract.chargeContract.queryCusts.biz.ext" filterType="like" textField="custname" valueField="custname"
								dataField="custs" valueFromSelect="true" allowInput="true" style="width: 150px" />
							<input class="nui-hidden" name="critria._expr[20]._property" value="signatoryName" />
							<input class="nui-hidden" name="critria._expr[20]._op" value="like" />
						</td>
						<td style="width: 90px; text-align: right;">合同签约主体:</td>
						<td style="width: 155px">
							<input name="critria._expr[23].contractSubject" class="nui-dictcombobox" dictTypeId="ZH_INVOICE_NAME_TYPE" showNullItem="true" nullItemText="全部" style="width: 150px" />
						</td>
						<td style="width: 60px; text-align: right;">收款方:</td>
						<td style="width: 155px">
							<input name="critria._expr[24].payee" class="nui-dictcombobox" dictTypeId="PAYER" showNullItem="true" nullItemText="全部" style="width: 150px" />
						</td>
						<td style="width: 60px; text-align: right;">合同密级:</td>
						<td style="width: 155px">
							<input name="critria._expr[9].contractSecretLevel" class="nui-dictcombobox" dictTypeId="CONTRACT_SECRET_LEVEL" showNullItem="true" nullItemText="全部" style="width: 150px" />
						</td>
						<td style="width: 60px; text-align: right;">签订日期:</td>
						<td style="width: 245px">
							<input class="nui-hidden" name="critria._expr[8]._op" value="between" />
							<input class="nui-hidden" name="critria._expr[8]._pattern" value="yyyy-MM-dd" />
							<input class="nui-hidden" name="critria._expr[8]._property" value="signingDate" />
							<input class="nui-datepicker" name="critria._expr[8]._min" style="width: 110px" />
							<span>至</span>
							<input class="nui-datepicker" name="critria._expr[8]._max" style="width: 110px" />
						</td>
					</tr>
					<tr>
						<td style="width: 60px; text-align: right;">项目密级:</td>
						<td style="width: 155px">
							<input name="critria._expr[26].projectSecretLevel" class="nui-dictcombobox" dictTypeId="PROJECT_SECRET_LEVEL" showNullItem="true" nullItemText="全部" style="width: 150px" />
						</td>
						<td style="width: 90px; text-align: right;">计划对外分包:</td>
						<td style="width: 155px">
							<input name="critria._expr[27].isfb" class="nui-dictcombobox" dictTypeId="ABF_YESORNO" showNullItem="true" nullItemText="全部" style="width: 150px" />
						</td>
						<td style="width: 60px; text-align: right;">补充协议:</td>
						<td style="width: 155px">
							<input name="critria._expr[28].issupagreement" class="nui-dictcombobox" dictTypeId="ABF_YESORNO" showNullItem="true" nullItemText="全部" style="width: 150px" />
						</td>
						<td style="width: 60px; text-align: right;">专业类别:</td>
						<td style="width: 155px">
							<input name="critria._expr[29].major" class="nui-dictcombobox" dictTypeId="ZH_MAJOR_TYPE" showNullItem="true" nullItemText="全部" style="width: 150px" />
						</td>
						<td style="width: 60px; text-align: right;">工程类别:</td>
						<td style="width: 155px">
							<input name="critria._expr[30].projectType" class="nui-dictcombobox" dictTypeId="ZH_PROJECT_TYPE" showNullItem="true" nullItemText="全部" style="width: 150px" />
						</td>
					</tr>
					<tr>
						<td style="width: 70px; text-align: right;">集团内/外:</td>
						<td style="width: 155px">
							<input name="critria._expr[31].headquarterGroup" class="nui-dictcombobox" dictTypeId="ZH_GROUP" showNullItem="true" nullItemText="全部" style="width: 150px" />
						</td>
						<td style="width: 100px; text-align: right;">招标人采购方式:</td>
						<td style="width: 155px">
							<input name="critria._expr[32].procurementType" class="nui-dictcombobox" dictTypeId="ZH_PROCUREMENT_TYPE" showNullItem="true" nullItemText="全部" style="width: 150px" />
						</td>
						<td style="width: 100px; text-align: right;">是否签订合同:</td>
						<td style="width: 155px">
							<input name="critria._expr[33].cachet" class="nui-dictcombobox" dictTypeId="ABF_YESORNO" showNullItem="true" nullItemText="全部" style="width: 150px" />
						</td>
					</tr>
				</table>
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
		</div>

		<div class="nui-toolbar" style="border-bottom: 0; padding: 5px;">
			<table style="width: 100%;">
				<tr>
					<td>
						<a class="nui-button" id="add" iconCls="icon-add" onclick="add()">新增</a>
						<a class="nui-button" id="bcxy" iconCls="icon-add" onclick="alteration()">发起补充协议签订申请</a>
						<a class="nui-button" id="edit" iconCls="icon-edit" onclick="zc_edit()">编辑</a>
						<a class="nui-button" id="del" iconCls="icon-remove" onclick="deleteInfo()">删除</a>
						<a class="nui-button" id="sfhtlist_wh" iconCls="icon-edit" onclick="wh_edit()">维护</a>
						<a class="nui-button" id="sfhtlist_zf" iconCls="icon-edit" onclick="zf_edit()">作废</a>
						<a class="nui-button" id="checkview" iconCls="icon-print" onclick="printBtn()">打印</a>
						<a class="nui-button" id="sfhtlist_bgjbr" iconCls="icon-edit" onclick="bgjbr_edit()">变更经办人</a>
						<a class="nui-button" id="sfhtlist_import" iconCls="icon-upload" onclick="improt()">导入</a>
						<a class="nui-button" id="export" iconCls="icon-download" onclick="exportExcel()">导出</a>
						<a class="nui-button" id="sfhtlist_help" iconCls="icon-help" onclick="help()">帮助</a>
					</td>
				</tr>
			</table>
		</div>

		<div class="nui-fit">
			<div id="datagrid1" sizeList="[20,50,100,500]" showPager="true" dataField="data" showSummaryRow="true" pageSize="20" class="nui-datagrid" style="width: 100%; height: 100%;"
				url="com.zhonghe.ame.chargeContract.chargeContract.queryChargeContractAll.biz.ext" allowSortColumn=true frozenStartColumn="0" frozenEndColumn="8" onshowrowdetail="onShowRowDetail">
				<div property="columns">
					<div type="checkcolumn">○</div>
					<div type="expandcolumn" renderer="expandColumn">+</div>
					<div field="id" headerAlign="center" allowSort="true" visible="false">id</div>
					<div field="createUsername" width="60" align="center" headerAlign="center" allowSort="true">经办人</div>
					<div field="implementOrgname" width="190" headerAlign="center" allowSort="true" align="center">合同承办部门</div>
					<div field="createTime" headerAlign="center" allowSort="true" align="center">申请日期</div>
					<div field="contractNo" width="180" headerAlign="center" allowSort="true" align="center">合同编号</div>
					<div field="contractName" width="250" align="center" headerAlign="center" allowSort="true" renderer="lookInfo">合同名称</div>
					<div field="appStatus" align="center" headerAlign="center" allowSort="true" renderer="onActionRenderer">审批状态</div>
					<div field="contractSum" width="120" align="center" headerAlign="center" allowSort="true" dataType="currency" summaryType="sum">合同金额（元）</div>
					<div field="finContractSum" width="150" align="center" headerAlign="center" allowSort="true" dataType="currency" summaryType="sum">合同最终金额（元）</div>
					<div field="noTaxSum" width="150" align="center" headerAlign="center" allowSort="true" dataType="currency" summaryType="sum">合同不含税金额（元）</div>
					<div field="payTax" width="120" align="center" headerAlign="center" allowSort="true" dataType="currency" summaryType="sum">税额（元）</div>
					<div field="contractBalance" width="120" align="center" headerAlign="center" allowSort="true" dataType="currency" summaryType="sum">合同余额（元）</div>
					<div field="finishTime" dateFormat="yyyy-MM-dd" width="90" headerAlign="center" align="center" allowSort="true">完成日期</div>
					<div field="executeStatus" width="80" align="center" headerAlign="center" allowSort="true" renderer="EXECUTE_STATUS">执行状态</div>
					<div field="signatoryName" width="250" align="center" headerAlign="center" allowSort="true">签约方</div>
					<div field="contractSubject" width="120" align="center" headerAlign="center" allowSort="true" renderer="zhInvoiceNameType">合同签约主体</div>
					<div field="payee" width="80" align="center" headerAlign="center" allowSort="true" renderer="PAYER">收款方</div>
					<div field="signingDate" dateFormat="yyyy-MM-dd" width="90" headerAlign="center" align="center">签订日期</div>
					<div field="contractSecretLevel" width="80" align="center" headerAlign="center" allowSort="true" renderer="CONTRACT_SECRET_LEVEL">合同密级</div>
					<div field="projectSecretLevel" width="80" align="center" headerAlign="center" allowSort="true" renderer="PROJECT_SECRET_LEVEL">项目密级</div>
					<div field="isfb" width="120" align="center" headerAlign="center" allowSort="true" renderer="ABF_YESORNO">是否计划对外分包</div>
					<div field="issupagreement" align="center" headerAlign="center" allowSort="true" renderer="ABF_YESORNO">是否协议变更</div>
					<div field="cachet" align="center" headerAlign="center" allowSort="true" renderer="ABF_YESORNO">是否签订合同</div>
					<div field="major" width="80" align="center" headerAlign="center" allowSort="true" renderer="ZH_MAJOR_TYPE">专业类别</div>
					<div field="projectType" width="80" align="center" headerAlign="center" allowSort="true" renderer="ZH_PROJECT_TYPE">工程类别</div>
					<div field="headquarterGroup" width="80" align="center" headerAlign="center" allowSort="true" renderer="ZH_GROUP">集团内外</div>
					<div field="contractModel" width="100" align="center" headerAlign="center" allowSort="true" renderer="CONTRACT_MODEL">合同价格模式</div>
					<div field="procurementType" width="150" align="center" headerAlign="center" allowSort="true" renderer="ZH_PROCUREMENT_TYPE">招标人采购方式</div>
				</div>
			</div>
		</div>
	</div>
	
	<div id="chargePlanInfo" style="display: none;">
		<div id="chargePlanGrid" sizeList="[5]" dataField="chargePlanInfos" pageSize="5" class="nui-datagrid" url="com.zhonghe.ame.annualPlan.annualPlan.queryAnnualPayPlanByChargeId.biz.ext"
			style="width: 1500px; height: 203px">
			<div property="columns">
				<div field="id" headerAlign="center" visible="false">id</div>
				<div field="years" align="center" headerAlign="center">年份</div>
				<div field="jan" align="center" headerAlign="center" summaryType="sum" dataType="currency">一月</div>
				<div field="feb" align="center" headerAlign="center" summaryType="sum" dataType="currency">二月</div>
				<div field="mar" align="center" headerAlign="center" summaryType="sum" dataType="currency">三月</div>
				<div field="apr" align="center" headerAlign="center" summaryType="sum" dataType="currency">四月</div>
				<div field="may" align="center" headerAlign="center" summaryType="sum" dataType="currency">五月</div>
				<div field="jun" align="center" headerAlign="center" summaryType="sum" dataType="currency">六月</div>
				<div field="jul" align="center" headerAlign="center" summaryType="sum" dataType="currency">七月</div>
				<div field="aug" align="center" headerAlign="center" summaryType="sum" dataType="currency">八月</div>
				<div field="sep" align="center" headerAlign="center" summaryType="sum" dataType="currency">九月</div>
				<div field="oct" align="center" headerAlign="center" summaryType="sum" dataType="currency">十月</div>
				<div field="nov" align="center" headerAlign="center" summaryType="sum" dataType="currency">十一月</div>
				<div field="dec" align="center" headerAlign="center" summaryType="sum" dataType="currency">十二月</div>
				<div field="sum" align="center" headerAlign="center" summaryType="sum" dataType="currency">总计</div>
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
		var grid = nui.get("datagrid1");
		var chargePlanGrid = nui.get("chargePlanGrid");
		var chargePlanInfo = document.getElementById("chargePlanInfo");
		var type = <%=request.getParameter("type")%>;
		var reve_grid = nui.get("reve_grid");
		var json=nui.encode({"iden": "1","expseq": null,"feeseq": null,"parentfeetypeid": null});
		var authOrg;
		
		init();
		
		function init() {
			// 按钮权限
			if (userId != 'sysadmin') {
				// 维护按钮 - sfhtlist_wh，导入按钮 - sfhtlist_import，变更经办人按钮 - sfhtlist_bgjbr，作废按钮 - sfhtlist_zf
				getOpeatorButtonAuth("sfhtlist_wh,sfhtlist_import,sfhtlist_bgjbr,sfhtlist_zf,sfhtlist_help");
			}

			//code:对应功能编码，map：对于机构的查询条件
			var json = {
				"code" : "sfhtlist"
			};
			nui.ajax({
				url : "com.primeton.eos.ame_auth.ame_auth.getownorg1.biz.ext",
				data : json,
				type : 'POST',
				contentType : 'text/json',
				success : function(text) {
					if(text.errcode == "没有有权的机构"){
						nui.get("createUserid").setValue(userId);
						nui.get("createUsername").setValue(userName);
						nui.get("createUsername").setReadOnly(true);
						authOrg = false;						
					}else{
						nui.get("createUsername").setName("critria._or[0]._and[0]._expr[1].createUsername");
						nui.get("createUsernameOp").setName("critria._or[0]._and[0]._expr[1]._op");
						nui.get("createUserid").setName("critria._or[0]._and[0]._expr[0].createUserid");
						nui.get("createUserid").setValue(userId);
						nui.get("implementOrgProp").setName("critria._or[0]._and[1]._expr[2]._property");
						nui.get("implementOrgOp").setName("critria._or[0]._and[1]._expr[2]._op");
						nui.get("implementOrgRef").setName("critria._or[0]._and[1]._expr[2]._ref");
						nui.get("orgid2").setData(text.orgs);
						nui.get("implementOrgProp2").setName("critria._or[0]._and[1]._expr[3]._property");
						nui.get("implementOrgOp2").setName("critria._or[0]._and[1]._expr[3]._op");
						nui.get("orgids2").setName("critria._or[0]._and[1]._expr[3]._value");
						nui.get("orgids2").setValue(text.orgids);
						authOrg = true;
					}
					search();
				}
			});
		}
		
		function search() {
			if(authOrg){
				if(nui.get("createUsername").getValue() != "" || nui.get("orgid2").getValue() != ""){
					if(nui.get("createUsername").getValue() == userName){
						nui.get("createUsername").setName("critria._expr[1].createUsername");
						nui.get("createUsernameOp").setName("critria._expr[1]._op");
						nui.get("createUserid").setName("critria._expr[0].createUserid");
						nui.get("createUserid").setValue(userId);
						nui.get("implementOrgProp").setName("critria._expr[2]._property");
						nui.get("implementOrgOp").setName("critria._expr[2]._op");
						nui.get("implementOrgRef").setName("critria._expr[2]._ref");
						nui.get("implementOrgProp2").setName("critria._expr[3]._property");
						nui.get("implementOrgOp2").setName("critria._expr[3]._op");
						nui.get("orgids2").setName("critria._expr[3]._value");
						nui.get("orgid2").setValue("");
						nui.get("orgids2").setValue("");						
					}else{
						nui.get("createUsername").setName("critria._expr[1].createUsername");
						nui.get("createUsernameOp").setName("critria._expr[1]._op");
						nui.get("createUserid").setName("critria._expr[0].createUserid");
						nui.get("createUserid").setValue("");
						nui.get("implementOrgProp").setName("critria._expr[2]._property");
						nui.get("implementOrgOp").setName("critria._expr[2]._op");
						nui.get("implementOrgRef").setName("critria._expr[2]._ref");
						nui.get("implementOrgProp2").setName("critria._expr[3]._property");
						nui.get("implementOrgOp2").setName("critria._expr[3]._op");
						nui.get("orgids2").setName("critria._expr[3]._value");						
					}
				}
			}
			var data = form.getData();
			grid.sortBy("createTime", "desc");
			grid.load(data);
		}
		
		function reset() {
			form.reset();
			init();
		}		
		
		function isStr(str, val) {
			if (str.indexOf(val) != -1) {
				return true;
			} else {
				return false;
			}
		}
		
		function lookInfo(e) {
			return "<a href='javascript:void(0)' onclick='doView();' title='点击查看'>" + e.value + "</a>";
		}						
		
		function doView() {
			var row = grid.getSelected();
			if (row) {
				if(row.issupagreement == "y"){
					executeUrl = "<%=request.getContextPath()%>/contractPact/print/chargeAlterationPrint.jsp?id=" + row.id;
					window.open(executeUrl);
				}else{
					executeUrl = "<%=request.getContextPath()%>/contractPact/print/chargeContractInfoPrint.jsp?id=" + row.id;
					window.open(executeUrl);
				}
			} else {
				showTips("请选中一条记录", "danger");
			}
		}
		
		function printBtn() {
			var row = grid.getSelected();
			if (row) {
				if(row.issupagreement == "y"){
					executeUrl = "<%=request.getContextPath()%>/contractPact/print/chargeAlterationPrint.jsp?id=" + row.id;
					window.open(executeUrl);
				}else{
					executeUrl = "<%=request.getContextPath()%>/contractPact/print/chargeContractInfoPrint.jsp?id=" + row.id;
					window.open(executeUrl);
				}
			} else {
				showTips("请选中一条记录", "danger");
			}
		}				
		
		function wh_edit() {
			var row = grid.getSelecteds();
			if (row.length > 1 || row.length == 0) {
				showTips("只能选中一条项目记录进行维护", "danger");
				return;
			}
			var data = row[0];
			if (data.appStatus == "2") {
				if (data.issupagreement == "y") {
					nui.open({
						url : "/default/contractPact/chargeContract/chargeContractAlterationEdit.jsp",
						width : '100%',
						height : '100%',
						title : "收费合同签订维护 - 补充协议",
						onload : function() {
							var iframe = this.getIFrameEl();
							iframe.contentWindow.setEditData(data);
						},
						ondestroy : function(action) {
							if (action == "ok") {
								grid.reload();
							}
							search();
						}
					})
				} else {
					nui.open({
						url : "/default/contractPact/chargeContract/chargeContractEdit.jsp",
						width : '100%',
						height : '100%',
						title : "收费合同签订维护",
						onload : function() {
							var iframe = this.getIFrameEl();
							iframe.contentWindow.setEditData(data);
						},
						ondestroy : function(action) {
							if (action == "ok") {
								grid.reload();
							}
							search();
						}
					})
				}
			} else {
				showTips("只能维护审批状态为【审批通过】的数据", "danger");
			}
		}

		// 暂存编辑
		function zc_edit() {
			var row = grid.getSelecteds();
			if (row.length > 1 || row.length == 0) {
				showTips("只能选中一条项目记录进行编辑", "danger");
				return;
			}
			var data = row[0];
			if (data.appStatus == '0') {
				var json = {
					"processID" : data.processid
				};
				ajaxCommon({
					url : "com.zhonghe.ame.chargeContract.chargeContract.getWorkItemByProcessInstID.biz.ext",
					data : json,
					success : function(result) {
						if (JSON.stringify(result) !== '{}') {
							nui.open({
								url : "/default/bps/wfclient/task/dispatchTaskExecute.jsp?workItemID=" + result.workItemID,
								width : '100%',
								height : '100%',
								ondestroy : function(action) {
									grid.reload();
									search();
								}
							})
						}
					}
				});
			} else {
				showTips("只能编辑审批状态为【草稿】的数据", "danger");
			}
		}
		
		function zf_edit(){
			var row = grid.getSelecteds();
			if (row.length > 1 || row.length == 0) {
				showTips("只能选中一条项目记录进行作废", "danger");
				return;
			}else{
				var row = row[0];
				if (row.appStatus == '2') {
					if (!confirm("是否作废？")) {
						return;
					} else {
						if (row) {
							var json = nui.encode({
								'data' : row
							});
							nui.ajax({
								url : "com.zhonghe.ame.chargeContract.chargeContract.zfChargeContractById.biz.ext",
								type : 'POST',
								data : json,
								contentType : 'text/json',
								success : function(o) {
									if (o.result == 1) {
										showTips("作废成功");
										grid.reload();
									} else if (o.result == 2) {
										showTips("该合同存在开票数据无法作废！", "danger");
									}else{
										showTips("作废失败，请联系信息技术部人员！", "danger");
									}
								}
							});
						} else {
							showTips("只能选中一条项目记录进行作废", "danger");
						}
					}
				} else {
					showTips("只能作废审批状态为【审批通过】的数据", "danger");
				}
			}			
		}

		function bgjbr_edit() {
			var row = grid.getSelecteds();
			if (row.length > 1 || row.length == 0) {
				showTips("只能选中一条项目记录进行经办人变更", "danger");
				return;
			}else{
				var row = row[0];
				if (row.appStatus == '2') {
					nui.open({
						url: "/default/contractPact/chargeContract/selectTransactor.jsp?id=" + row.id,
						title : "收费合同 - 变更经办人",
						width : 500,
						height : 350,
						ondestroy : function(action) {
							if (action == "ok") {
								grid.reload();
							}
						}
					});
				} else {
					showTips("只能对审批状态为【审批通过】的数据进行经办人变更", "danger");
				}
			}
		}

		function deleteInfo() {
			var row = grid.getSelecteds();
			if (row.length > 1 || row.length == 0) {
				showTips("只能选中一条项目记录进行删除", "danger");
				return;
			} else {
				var row = row[0];
				if (row.appStatus == '4') {
					if (!confirm("是否删除？")) {
						return;
					} else {
						if (row) {
							var json = nui.encode({
								'data' : row
							});
							nui.ajax({
								url : "com.zhonghe.ame.chargeContract.chargeContract.deleteChargeContractById.biz.ext",
								type : 'POST',
								data : json,
								contentType : 'text/json',
								success : function(o) {
									if (o.result == 1) {
										showTips("删除成功");
										grid.reload();
									} else {
										showTips("删除失败，请联系信息技术部人员！", "danger");
									}
								}
							});
						} else {
							showTips("只能选中一条项目记录进行删除", "danger");
						}
					}
				} else {
					showTips("只能删除审批状态为【作废】的数据", "danger");
				}
			}
		}

		function add() {
			nui.open({
				url : "/default/contractPact/chargeContract/chargeContractAdd.jsp",
				width : '100%',
				height : '100%',
				title : "收费合同签订申请",
				onload : function() {
					var iframe = this.getIFrameEl();
				},
				ondestroy : function(action) {
					search();
				}
			})
		}

		function onActionRenderer(e) {
			var record = e.record;
			var s = "<a  href='javascript:void(0)' onclick='feeView();' >" + nui.getDictText('ZH_FLOW_TYPE', e.value) + "</a>";
			return s;
		}

		function feeView() {
			var selectRow = grid.getSelected();
			var processId = selectRow.processid;
			var url = "/default/bps/wfclient/task/processinstView.jsp";
			var title = "流程图查看";
			var width = 1000;
			nui.open({
				url : url,
				title : title,
				width : width,
				height : 550,
				onload : function() {
					var iframe = this.getIFrameEl();
					if (iframe.contentWindow.initData) {
						iframe.contentWindow.initData({
							"processInstID" : processId
						});
					}
				},
				ondestroy : function(action) {
				}
			});
		}

		function zhContractType(e) {
			return nui.getDictText("ZH_CONTRACT_TYPE", e.value);
		}

		function zhFlowType(e) {
			return nui.getDictText("ZH_FLOW_TYPE", e.value);
		}

		function zhProjectType(e) {
			return nui.getDictText("ZH_PROJECT_TYPE", e.value);
		}

		function zhInvoiceNameType(e) {
			return nui.getDictText("ZH_INVOICE_NAME_TYPE", e.value);
		}

		function zhExecuteStatus(e) {
			return nui.getDictText("ZH_EXECUTESTATUS", e.value);
		}
		function zhInvoiceGroup(e) {
			return nui.getDictText("ZH_GROUP", e.value);
		}

		function zhMajorType(e) {
			return nui.getDictText("ZH_MAJOR_TYPE", e.value);
		}

		function zhIsSupagreement(e) {
			return nui.getDictText("ZH_ISSUPAGREEMENT", e.value);
		}

		function EXECUTE_STATUS(e) {
			return nui.getDictText("EXECUTE_STATUS", e.value);
		}

		function PAYER(e) {
			return nui.getDictText("PAYER", e.value);
		}

		function CONTRACT_SECRET_LEVEL(e) {
			return nui.getDictText("CONTRACT_SECRET_LEVEL", e.value);
		}

		function PROJECT_SECRET_LEVEL(e) {
			return nui.getDictText("PROJECT_SECRET_LEVEL", e.value);
		}

		function ABF_YESORNO(e) {
			return nui.getDictText("ABF_YESORNO", e.value);
		}

		function ZH_MAJOR_TYPE(e) {
			return nui.getDictText("ZH_MAJOR_TYPE", e.value);
		}

		function ZH_PROJECT_TYPE(e) {
			return nui.getDictText("ZH_PROJECT_TYPE", e.value);
		}

		function CONTRACT_MODEL(e) {
			return nui.getDictText("CONTRACT_MODEL", e.value);
		}

		function ZH_GROUP(e) {
			return nui.getDictText("ZH_GROUP", e.value);
		}

		function ZH_PROCUREMENT_TYPE(e) {
			return nui.getDictText("ZH_PROCUREMENT_TYPE", e.value);
		}

		function improt() {
			nui.open({
				url : "<%=request.getContextPath()%>/contractPact/chargeContract/improtChargeContract.jsp",
				title : "选择导入文件",
				width : 350,
				height : 50,
				allowResize : false,
				ondestroy : function(action) {
					search();
				}
			});
		}

		function alteration() {
			var row = grid.getSelecteds();
			if (row.length > 1 || row.length == 0) {
				showTips("只能选中一条项目记录发起补充协议签订", "danger");
				return;
			}
			var data = row[0];
			if (data.appStatus == "2") {
				if (data.issupagreement != "y") {
					nui.open({
						url : "/default/contractPact/chargeContract/chargeContractAlteration.jsp",
						width : '100%',
						height : '100%',
						title : "收费合同签订申请 - 补充协议",
						onload : function() {
							var iframe = this.getIFrameEl();
							iframe.contentWindow.setEditData(data);
						},
						ondestroy : function(action) {
							search();
						}
					})
				} else {
					showTips("不能对补充协议的合同，再次发起补充协议签订请求", "danger");
				}
			} else {
				showTips("只能对审批状态为【审批通过】的项目发起补充协议签订", "danger");
			}
		}

		//导出
		function exportExcel() {
			if (!confirm("是否确认导出？")) {
				return;
			}
			var form = new nui.Form("#form1");
			var data = form.getData(); //获取表单JS对象数据
			var json = nui.encode(data);
			nui.ajax({
				url : "com.zhonghe.ame.chargeContract.chargeContract.exportChargeContractExcel.biz.ext",
				type : "post",
				data : json,
				cache : false,
				contentType : 'text/json',
				success : function(o) {
					var filePath = o.downloadFile;
					var fileName = "收费合同";
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
		
		function expandColumn(e) {
			if (e.record.isChargePlan == "0") {
				return "";
			} else {
				return "<div class='mini-grid-cell-inner  mini-grid-cell-nowrap' style=''><a class='mini-grid-ecIcon' href='javascript:#' onclick='return false'></a></div>"
			}
		}
		
		function onShowRowDetail(e) {
			var chargePlan = e.sender;
			var row = e.record;
			var td = chargePlan.getRowDetailCellEl(row);
			td.appendChild(chargePlanInfo);
			chargePlanInfo.style.display = "block";
			var data = {
				'chargeId' : row.id
			};
			chargePlanGrid.sortBy("years", "desc");
			chargePlanGrid.load(data);
		}				
		
		function help() {
			executeUrl = "<%= request.getContextPath() %>/contractPact/chargeContract/chargeContractFlowDesgin.jsp";
			window.open(executeUrl);
		}		
		
	</script>

</body>
</html>