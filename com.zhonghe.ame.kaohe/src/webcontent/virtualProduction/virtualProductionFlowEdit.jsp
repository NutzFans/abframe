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
<title>虚拟产值申报审批</title>
</head>
<body>
	<%
		long workItemId = (Long) request.getAttribute("workItemID");
	%>
	<div class="nui-fit" style="padding: 5px;">
		<fieldset id="field1" style="border: solid 1px #aaa; padding: 5px;">
			<legend>基本信息</legend>
			<div style="width: 99%">
				<form id="addForm" method="post">
					<input name="id" class="nui-hidden" />
					<input name="processId" class="nui-hidden" />
					<input name="files" id="fileids" class="nui-hidden" />
					<table style="table-layout: fixed;">
						<tr>
							<td align="right" style="width: 60px">申请人：</td>
							<td style="width: 260px">
								<input id="createUserid" name="createUserid" class="nui-hidden" />
								<input id="createUsername" name="createUsername" class="nui-textbox" style="width: 250px" required="true" readonly="readonly" />
							</td>
							<td align="right" style="width: 60px">申请单位：</td>
							<td style="width: 260px">
								<input id="secondaryOrg" name="secondaryOrg" class="nui-hidden" />
								<input id="secondaryOrgname" name="secondaryOrgname" class="nui-textbox" style="width: 250px" required="true" readonly="readonly" />
							</td>
							<td align="right" style="width: 60px">任务来源：</td>
							<td style="width: 260px">
								<input id="taskSource" name="taskSource" class="nui-dictcombobox" dictTypeId="ZH_XNCZ_TASK_SOURCE" style="width: 250px" required="true" onvaluechanged="changeTaskSource" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 60px">申报事项：</td>
							<td colspan="3">
								<input id="declareMatter" name="declareMatter" class="nui-buttonedit" style="width: 618px" onbuttonclick="selectChargeContrac" required="true" allowInput="false"
									emptyText="[任务来源] 为 [收费合同] 时选择，其他情况手动输入" />
							</td>
							<td align="right" style="width: 60px">合同编码：</td>
							<td style="width: 260px">
								<input id="contractNo" name="contractNo" class="nui-textbox" style="width: 250px" readonly="readonly" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 90px">任务委托单位：</td>
							<td style="width: 260px">
								<input id="custName" name="custName" class="nui-buttonedit" style="width: 250px" onbuttonclick="selectCustomers" required="true" allowInput="false" />
							</td>
							<td align="right" style="width: 60px">集团内外：</td>
							<td style="width: 260px">
								<input id="headquarterGroup" name="headquarterGroup" class="nui-dictcombobox" dictTypeId="ZH_GROUP_NEW" style="width: 250px" required="true" />
							</td>
							<td align="right" style="width: 100px">公司内委托部门：</td>
							<td style="width: 260px">
								<input id="entrustDept" name="entrustDept" class="nui-combobox" textField="secOrgname" valueField="secOrgname" multiSelect="true" style="width: 250px" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 110px">申报金额计算方式：</td>
							<td style="width: 260px">
								<input id="calcMethod" name="calcMethod" class="nui-dictcombobox" dictTypeId="ZH_SBJE_JSFS" style="width: 250px" required="true" onvaluechanged="changeCalcMethod" />
							</td>
							<td align="right" style="width: 100px">拟申报金额(元)：</td>
							<td style="width: 260px">
								<input id="declareAmount" name="declareAmount" class="nui-textbox" style="width: 250px" required="true" readonly="readonly" emptyText="无需填写，根据明细自动计算" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 110px">申报背景及原因：</td>
							<td colspan="5">
								<input name="remark" class="nui-textarea" style="width: 986px; height: 100px;" required="true" />
							</td>
						</tr>
					</table>
				</form>
			</div>
		</fieldset>
		<br>
		<fieldset id="field2" style="border: solid 1px #aaa; padding: 5px;">
			<legend>
				&nbsp;&nbsp;拟申报金额及计算过程 -
				<span style="color: red">【基本信息】中完成【申报金额计算方式】选择后，会生成不同的计算列表&nbsp;&nbsp;</span>
			</legend>
			<div id="rydjDiv" style="width: 99%; margin: 0 auto; display: none;">
				<div class="nui-toolbar" style="border-bottom: 0; padding: 0px;">
					<table>
						<tr>
							<td>
								<a class="nui-button" iconCls="icon-add" onclick="rydjAddRow()">新增</a>
								<a class="nui-button" iconCls="icon-remove" onclick="rydjRemoveRow()">删除</a>
							</td>
						</tr>
					</table>
				</div>
				<div id="rydjGrid" class="nui-datagrid" style="height: 250px;" showPager="false" showSummaryRow="true" frozenStartColumn="0" frozenEndColumn="2" allowCellEdit="true" allowCellSelect="true"
					oncellendedit="rydjGridCellEndEdit" oncellvalidation="rydjGridCellValidation">
					<div property="columns">
						<div type="checkcolumn"></div>
						<div header="按人员单价计算" headerAlign="center" align="center">
							<div property="columns">
								<div field="itemName" width="300" headerAlign="center" align="left" vtype="required">
									事项名称
									<input property="editor" class="mini-textbox" style="width: 100%" required="true" />
								</div>
							</div>
						</div>
						<div header="(A+B) × (1+C) × (1+D)" headerAlign="center" align="center">
							<div property="columns">
								<div field="declaredTotal" width="150" headerAlign="center" align="center" summaryType="sum" dataType="currency">拟申报金额（元）</div>
							</div>
						</div>
						<div header="A - 人工成本" headerAlign="center" align="center">
							<div property="columns">
								<div field="personDay" width="120" headerAlign="center" align="center" dataType="float" numberFormat="n1">
									拟投入人天（人天）
									<input property="editor" class="mini-spinner" allowLimitValue="false" format="n1" showButton="false" style="width: 100%" />
								</div>
								<div field="personDayPrice" width="120" headerAlign="center" align="center" dataType="currency">
									人员单价（元/人天）
									<input property="editor" class="mini-spinner" allowLimitValue="false" format="n2" showButton="false" style="width: 100%" />
								</div>
								<div field="personDayTotal" width="120" headerAlign="center" align="center" summaryType="sum" dataType="currency">小计（元）</div>
							</div>
						</div>
						<div header="B - 直接费用" headerAlign="center" align="center">
							<div property="columns">
								<div field="conferenceRoomCost" width="120" headerAlign="center" align="center" dataType="currency">
									会议室租赁费（元）
									<input property="editor" class="mini-spinner" allowLimitValue="false" format="n2" showButton="false" style="width: 100%" />
								</div>
								<div field="expertConsultationCost" width="120" headerAlign="center" align="center" dataType="currency">
									专家咨询费（元）
									<input property="editor" class="mini-spinner" allowLimitValue="false" format="n2" showButton="false" style="width: 100%" />
								</div>
								<div field="expertTravelCost" width="120" headerAlign="center" align="center" dataType="currency">
									专家差旅费（元）
									<input property="editor" class="mini-spinner" allowLimitValue="false" format="n2" showButton="false" style="width: 100%" />
								</div>
								<div field="expertStayCost" width="120" headerAlign="center" align="center" dataType="currency">
									专家住宿费（元）
									<input property="editor" class="mini-spinner" allowLimitValue="false" format="n2" showButton="false" style="width: 100%" />
								</div>
								<div field="foodCost" width="120" headerAlign="center" align="center" dataType="currency">
									餐费（元）
									<input property="editor" class="mini-spinner" allowLimitValue="false" format="n2" showButton="false" style="width: 100%" />
								</div>
								<div field="otherCost" width="120" headerAlign="center" align="center" dataType="currency">
									其他费用（元）
									<input property="editor" class="mini-spinner" allowLimitValue="false" format="n2" showButton="false" style="width: 100%" />
								</div>
								<div field="costTotal" width="120" headerAlign="center" align="center" summaryType="sum" dataType="currency">小计（元）</div>
							</div>
						</div>
						<div header="C - 管理费" headerAlign="center" align="center">
							<div property="columns">
								<div field="manageRatio" width="120" headerAlign="center" align="center" dataType="float" numberFormat="p0">
									管理费比率
									<input property="editor" class="mini-spinner" increment="0.01" minValue="0" maxValue="1" format="p0" style="width: 100%" />
								</div>
							</div>
						</div>
						<div header="D - 利润" headerAlign="center" align="center">
							<div property="columns">
								<div field="profitRatio" width="120" headerAlign="center" align="center" dataType="float" numberFormat="p0">
									利润比率
									<input property="editor" class="mini-spinner" increment="0.01" minValue="0" maxValue="1" format="p0" style="width: 100%" />
								</div>
							</div>
						</div>
						<div field="remark" width="300" headerAlign="center" align="left" vtype="required">
							备注
							<input property="editor" class="mini-textbox" style="width: 100%" required="true" />
						</div>
					</div>
				</div>
			</div>

			<div id="xmdjDiv" style="width: 99%; margin: 0 auto; display: none;">
				<div class="nui-toolbar" style="border-bottom: 0; padding: 0px;">
					<table>
						<tr>
							<td>
								<a class="nui-button" iconCls="icon-add" onclick="xmdjAddRow()">新增</a>
								<a class="nui-button" iconCls="icon-remove" onclick="xmdjRemoveRow()">删除</a>
							</td>
						</tr>
					</table>
				</div>
				<div id="xmdjGrid" class="nui-datagrid" style="height: 250px;" showPager="false" showSummaryRow="true" allowCellEdit="true" allowCellSelect="true" oncellendedit="xmdjGridCellEndEdit"
					oncellvalidation="xmdjGridCellValidation">
					<div property="columns">
						<div type="checkcolumn"></div>
						<div header="按项目单价计算" headerAlign="center" align="center">
							<div property="columns">
								<div field="itemName" width="400" headerAlign="center" align="left" vtype="required">
									事项名称
									<input property="editor" class="mini-textbox" style="width: 100%" required="true" />
								</div>
							</div>
						</div>
						<div field="projectNum" width="120" headerAlign="center" align="center" dataType="int" numberFormat="n0">
							项目数量
							<input property="editor" class="mini-spinner" allowLimitValue="false" format="n0" showButton="false" style="width: 100%" />
						</div>
						<div field="projectPrice" width="120" headerAlign="center" align="center" dataType="currency">
							项目单价（元）
							<input property="editor" class="mini-spinner" allowLimitValue="false" format="n2" showButton="false" style="width: 100%" />
						</div>
						<div field="declaredTotal" width="120" headerAlign="center" align="center" summaryType="sum" dataType="currency">合计（元）</div>
						<div field="remark" width="800" headerAlign="center" align="left" vtype="required">
							备注（投资额/规模/取费依据等）
							<input property="editor" class="mini-textbox" style="width: 100%" required="true" />
						</div>
					</div>
				</div>
			</div>

			<div id="gdzjDiv" style="width: 99%; margin: 0 auto; display: none;">
				<div class="nui-toolbar" style="border-bottom: 0; padding: 0px;">
					<table>
						<tr>
							<td>
								<a class="nui-button" iconCls="icon-add" onclick="gdzjAddRow()">新增</a>
								<a class="nui-button" iconCls="icon-remove" onclick="gdzjRemoveRow()">删除</a>
							</td>
						</tr>
					</table>
				</div>
				<div id="gdzjGrid" class="nui-datagrid" style="height: 250px;" showPager="false" showSummaryRow="true" allowCellEdit="true" allowCellSelect="true" oncellendedit="gdzjGridCellEndEdit"
					oncellvalidation="gdzjGridCellValidation">
					<div property="columns">
						<div type="checkcolumn"></div>
						<div header="按固定总价计算" headerAlign="center" align="center">
							<div property="columns">
								<div field="itemName" width="400" headerAlign="center" align="left" vtype="required">
									事项名称
									<input property="editor" class="mini-textbox" style="width: 100%" required="true" />
								</div>
							</div>
						</div>
						<div field="declaredTotal" width="120" headerAlign="center" align="center" summaryType="sum" dataType="currency">
							金额（元）
							<input property="editor" class="mini-spinner" allowLimitValue="false" format="n2" showButton="false" style="width: 100%" />
						</div>
						<div field="remark" width="800" headerAlign="center" align="left" vtype="required">
							备注
							<input property="editor" class="mini-textbox" style="width: 100%" required="true" />
						</div>
					</div>
				</div>
			</div>
		</fieldset>
		<br>
		<fieldset id="field3" style="border: solid 1px #aaa; padding: 5px;">
			<legend>
				上传附件 -
				<span style="color: red">相关证明材料</span>
			</legend>
			<div style="width: 99%; margin: 0 auto;">
				<jsp:include page="/ame_common/inputFile.jsp" />
			</div>
		</fieldset>
		<br>
		<fieldset id="field4" style="border: solid 1px #aaa; padding: 5px;">
			<legend>审批记录</legend>
			<div style="width: 99%; margin: 0 auto;">
				<jsp:include page="/ame_common/misOpinion.jsp" />
			</div>
		</fieldset>
	</div>

	<div style="text-align: center; position: relative; bottom: 10px" class="nui-toolbar">
		<a class="nui-button" onclick="onOk(0)" id="saveReimb" iconCls="icon-save" style="width: 80px; margin-right: 20px;">保存</a>
		<a class="nui-button" onclick="onOk(1)" id="creatReimbProcess" iconCls="icon-ok" style="width: 80px; margin-right: 20px;">提交</a>
		<a class="nui-button" onclick="onOk(2)" id="zzFeame" iconCls="icon-split" style="width: 80px; margin-right: 20px;">中止</a>
		<a class="nui-button" onclick="closeCancel" iconCls="icon-close" style="width: 80px;">关闭</a>
	</div>

	<script type="text/javascript">
		nui.parse();
		var addForm = new nui.Form("#addForm");
		var rydjGrid = nui.get("rydjGrid");
		var xmdjGrid = nui.get("xmdjGrid");
		var gdzjGrid = nui.get("gdzjGrid");
		
		var istype, info;

		init();

		function init() {
			initSecOrgCombobox();
			var json = nui.encode({
				"workItemId" : <%=workItemId%>
			});
			ajaxCommon({
				url : "com.zhonghe.ame.kaohe.virtualProduction.queryVirtualProductionById.biz.ext",
				data : json,
				success : function(result) {
					var mainData = result.mainData;
					var workItemInfo = result.workItemInfo;
					addForm.setData(mainData);
					nui.get("declareMatter").setText(mainData.declareMatter);
					nui.get("custName").setText(mainData.custName);
					nui.get("entrustDept").setText(mainData.entrustDept);
					setUI(mainData);
					setPlanGridData(mainData);
					setWorkItemData(workItemInfo);
					setFileData(mainData);
				}
			});
		}
		
		function setUI(mainData){
			if (mainData.taskSource != "1") {
				nui.get("declareMatter").setAllowInput(true);
			} else {
				nui.get("declareMatter").setAllowInput(false);
			}
			if (mainData.taskSource == "3") {
				nui.get("entrustDept").setRequired(true);				
			}						
		}

		function setPlanGridData(mainData) {
			var json = nui.encode({
				"virtualProductionId" : mainData.id
			});
			ajaxCommon({
				url : "com.zhonghe.ame.kaohe.virtualProduction.queryPlanGridDataList.biz.ext",
				data : json,
				success : function(result) {
					var planGridData = result.planGridData;
					var calcMethod = mainData.calcMethod;
					if (calcMethod == "1") {
						$("#rydjDiv").css("display", "block");
						nui.parse();
						rydjGrid.setFrozenStartColumn(0);
						rydjGrid.setFrozenEndColumn(1);
						rydjGrid.setData(planGridData);
					} else if (calcMethod == "2") {
						$("#xmdjDiv").css("display", "block");
						nui.parse();
						xmdjGrid.setData(planGridData);
					} else if (calcMethod == "3") {
						$("#gdzjDiv").css("display", "block");
						nui.parse();
						gdzjGrid.setData(planGridData);
					}
				}
			});
		}

		function setWorkItemData(workItemInfo) {
			nui.get("processinstid").setValue(workItemInfo.processInstID);
			nui.get("processinstname").setValue(workItemInfo.processInstName);
			nui.get("activitydefid").setValue(workItemInfo.activityDefID);
			nui.get("workitemname").setValue(workItemInfo.workItemName);
			nui.get("workitemid").setValue(<%=workItemId%>);
			nui.get("isshow").setValue("1");
			nui.get("auditstatus").setValue("4");
			document.getElementById("salesEdit").style.display = "none";
			nui.get("auditopinion").setValue("");
			var wrokItemGrid = nui.get("datagrid1");
			if (workItemInfo.processInstID != null || workItemInfo.processInstID != "") {
				wrokItemGrid.load({
					"processInstID" : workItemInfo.processInstID
				});
				wrokItemGrid.sortBy("time", "desc");
			}
		}

		function setFileData(mainData) {
			var fileGrid = nui.get("grid_0");
			fileGrid.load({
				"groupid" : "virtualProduction",
				"relationid" : mainData.id
			});
			fileGrid.sortBy("fileTime", "desc");
		}
		
		function initSecOrgCombobox() {
			ajaxCommon({
				"url" : "com.zhonghe.ame.kaohe.common.getBusSecOrgList.biz.ext",
				contentType : 'text/json',
				success : function(result) {
					var datas = result.secOrgList;
					nui.get("entrustDept").setData(datas);
				}
			});
		}
		
		function changeTaskSource() {
			nui.get("entrustDept").setRequired(false);
			nui.get("declareMatter").setValue(null);
			nui.get("declareMatter").setText(null);
			nui.get("contractNo").setValue(null);
			nui.get("custName").setValue(null);
			nui.get("custName").setText(null);
			nui.get("headquarterGroup").setValue(null);
			nui.get("entrustDept").setValue(null);
			nui.get("entrustDept").setText(null);
			var taskSource = nui.get("taskSource").getValue();
			if (taskSource != "1") {
				nui.get("declareMatter").setAllowInput(true);
			} else {
				nui.get("declareMatter").setAllowInput(false);
			}
			if (taskSource == "3") {
				nui.get("custName").setValue("中核工程咨询有限公司");
				nui.get("custName").setText("中核工程咨询有限公司");
				nui.get("headquarterGroup").setValue("0");
				nui.get("entrustDept").setRequired(true);				
			}
		}
		
		function changeCalcMethod(){
			var calcMethod = nui.get("calcMethod").getValue();
			if(calcMethod == "1"){
				rydjGrid.setData(null);
				$("#rydjDiv").css("display", "block");
				$("#xmdjDiv").css("display", "none");
				$("#gdzjDiv").css("display", "none");
				nui.parse();
				rydjGrid.setFrozenStartColumn(0);
				rydjGrid.setFrozenEndColumn(2);
			}else if(calcMethod == "2"){
				xmdjGrid.setData(null);
				$("#rydjDiv").css("display", "none");
				$("#xmdjDiv").css("display", "block");
				$("#gdzjDiv").css("display", "none");
				nui.parse();				
			}else if(calcMethod == "3"){
				gdzjGrid.setData(null);
				$("#rydjDiv").css("display", "none");
				$("#xmdjDiv").css("display", "none");
				$("#gdzjDiv").css("display", "block");
				nui.parse();				
			}
		}
		
		function rydjAddRow() {
			var newRow = {};
			var index = rydjGrid.getData().length;
			rydjGrid.addRow(newRow, index + 1);
			rydjGrid.beginEditRow(newRow);
		}

		function rydjRemoveRow() {
			var rows = rydjGrid.getSelecteds();
			if (rows.length > 0) {
				rydjGrid.removeRows(rows, false);
				updateDeclareAmountFormData(rydjGrid);
			}
		}
		
		function rydjGridCellEndEdit(e) {
			var record = e.record;
			var personDayTotal = multiplyMoney(record.personDay, record.personDayPrice);
			var costTotal = sumMoney(record.conferenceRoomCost,record.expertConsultationCost,record.expertTravelCost,record.expertStayCost,record.foodCost,record.otherCost);
			var manageRatioSum = addMoney(1, record.manageRatio);
			var profitRatioSum = addMoney(1, record.profitRatio);
			var personDayAndCostTotal = addMoney(personDayTotal, costTotal);
			var declaredTotal = multiplyMoneyBatch(personDayAndCostTotal,manageRatioSum,profitRatioSum);
			rydjGrid.updateRow(e.row, {
				'personDayTotal' : personDayTotal,
				'costTotal' : costTotal,
				'declaredTotal' : declaredTotal
			});
			updateDeclareAmountFormData(rydjGrid);	
		}
		
		function xmdjAddRow() {
			var newRow = {};
			var index = xmdjGrid.getData().length;
			xmdjGrid.addRow(newRow, index + 1);
			xmdjGrid.beginEditRow(newRow);
		}

		function xmdjRemoveRow() {
			var rows = xmdjGrid.getSelecteds();
			if (rows.length > 0) {
				xmdjGrid.removeRows(rows, false);
				updateDeclareAmountFormData(xmdjGrid);
			}
		}
		
		function xmdjGridCellEndEdit(e) {
			var record = e.record;
			var declaredTotal = multiplyMoney(record.projectNum,record.projectPrice);
			xmdjGrid.updateRow(e.row, {
				'declaredTotal' : declaredTotal
			});
			updateDeclareAmountFormData(xmdjGrid);	
		}
		
		function gdzjAddRow() {
			var newRow = {};
			var index = gdzjGrid.getData().length;
			gdzjGrid.addRow(newRow, index + 1);
			gdzjGrid.beginEditRow(newRow);
		}

		function gdzjRemoveRow() {
			var rows = gdzjGrid.getSelecteds();
			if (rows.length > 0) {
				gdzjGrid.removeRows(rows, false);
				updateDeclareAmountFormData(gdzjGrid);
			}
		}
		
		function gdzjGridCellEndEdit(e) {
			updateDeclareAmountFormData(gdzjGrid);	
		}
		
		function updateDeclareAmountFormData(grid){
			var rows = grid.getData();
			var declareAmount = 0;
			for (var row of rows) {
				declareAmount = addMoney(declareAmount,row.declaredTotal);
			}
			nui.get("declareAmount").setValue(declareAmount);
		}
		
		function rydjGridCellValidation(e){
			if(e.field == "declaredTotal"){
				if(e.value != 0){
					e.isValid = true;
				}else{
					e.isValid = false;
					e.errorText = "[拟申报金额（元）]必填，该值可通过填写其他数据自动汇总";
				}
			}
		}
		
		function xmdjGridCellValidation(e){
			if(e.field == "declaredTotal"){
				if(e.value != 0){
					e.isValid = true;
				}else{
					e.isValid = false;
					e.errorText = "[合计（元）]必填，该值可通过填写其他数据自动汇总";
				}
			}
		}
		
		function gdzjGridCellValidation(e){
			if(e.field == "declaredTotal"){
				if(e.value != 0){
					e.isValid = true;
				}else{
					e.isValid = false;
					e.errorText = "[金额（元）]必填，该值可通过填写其他数据自动汇总";
				}
			}
		}
		
		function selectChargeContrac() {
			nui.open({
				url : "/default/contractPact/invoice/invoiceContracList.jsp",
				title : "选择合同 - 收费合同信息",
				width : '1200',
				height : '610',
				allowResize : false,
				ondestroy : function(action) {
					if (action == "ok") {
						var iframe = this.getIFrameEl();
						var data = iframe.contentWindow.GetData();
						data = mini.clone(data); //必须
						nui.get("declareMatter").setValue(data.contractName);
						nui.get("declareMatter").setText(data.contractName);	
						nui.get("contractNo").setValue(data.contractNo);
						nui.get("custName").setValue(data.signatoryName);
						nui.get("custName").setText(data.signatoryName);
						nui.get("headquarterGroup").setValue(data.headquarterGroup);
					}
				}
			});
		}
		
		function selectCustomers() {
			nui.open({
				url : "/default/marketInfo/newCustomers/selectCustomers.jsp",
				title : "选择客户",
				width : '760',
				height : '540',
				allowResize : false,
				ondestroy : function(action) {
					if (action == "ok") {
						var iframe = this.getIFrameEl();
						var data = iframe.contentWindow.GetData();
						data = mini.clone(data); //必须
						nui.get("custName").setValue(data.custname);
						nui.get("custName").setText(data.custname);
						nui.get("headquarterGroup").setValue(data.outsideGroup);
					}
				}
			});
		}
		
		function onOk(e) {
			istype = e;
			var info;
			nui.get("auditstatus").setValue("4");
			if (istype == 0) {
				var declareMatter = nui.get("declareMatter").getValue();
				if (isStrEmpty(declareMatter)) {
					showTips("暂存时，请确保填写申报事项字段！", "danger");
					return;
				}
				info = "暂存流程表单？"
			} else if (istype == 1) {
				addForm.validate();
				if (addForm.isValid() == false) {
					showTips("请检查表单的完整性!", "danger");
					return;
				}
				var calcMethod = nui.get("calcMethod").getValue();
				if(calcMethod == "1"){
					rydjGrid.validate();
					if (rydjGrid.isValid() == false) {
						var error = rydjGrid.getCellErrors()[0];
						rydjGrid.beginEditCell(error.record, error.column);
						showTips("按人员单价计算数据有错误，请检查!", "danger");
						return;
					}
				}
				if(calcMethod == "2"){
					xmdjGrid.validate();
					if (xmdjGrid.isValid() == false) {
						var error = xmdjGrid.getCellErrors()[0];
						xmdjGrid.beginEditCell(error.record, error.column);
						showTips("按项目单价计算数据有错误，请检查!", "danger");
						return;
					}
				}
				if(calcMethod == "3"){
					gdzjGrid.validate();
					if (gdzjGrid.isValid() == false) {
						var error = gdzjGrid.getCellErrors()[0];
						gdzjGrid.beginEditCell(error.record, error.column);
						showTips("按固定总价计算数据有错误，请检查!", "danger");
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
				info = "提交流程表单？"									
			} else if (istype == 2) {
				nui.get("auditstatus").setValue("2");
				info = "终止流程表单？"
			}
			
			document.getElementById("fileCatalog").value = "virtualProduction";
			
			nui.confirm("确定" + info, "系统提示", function(action) {
				if (action == "ok") {
					nui.get("saveReimb").disable();
					nui.get("creatReimbProcess").disable();
					nui.get("zzFeame").disable();
					nui.mask({el: document.body,cls: 'mini-mask-loading',html: '表单提交中...'});
					form2.submit();
				}
			});
		}
		
		function SaveData() {
			var data = addForm.getData();
			data.istype = istype;
			data.files = nui.get("fileids").getValue();
			if(isStrEmpty(data.entrustDept)){
				data.isEntrustDept = "0"
			}else{
				data.isEntrustDept = "1"
			}
			var calcMethod = nui.get("calcMethod").getValue();
			var planDataGrid;
			if(calcMethod == "1"){
				planDataGrid = rydjGrid.getData();
			}
			if(calcMethod == "2"){
				planDataGrid = xmdjGrid.getData();
			}
			if(calcMethod == "3"){
				planDataGrid = gdzjGrid.getData();
			}
			var opioionData = opioionform.getData();
			var json = nui.encode({
				"virtualProduction" : data,
				"planDataGrid" : planDataGrid,
				"misOpinion" : opioionData.misOpinion
			});
			ajaxCommon({
				"url" : "com.zhonghe.ame.kaohe.virtualProduction.virtualProductionFlowEdit.biz.ext",
				data : json,
				contentType : 'text/json',
				success : function(text) {
					nui.unmask(document.body);
					if (text.result == "1") {
						showTips("操作成功");
						closeOk();
					} else {
						nui.get("saveReimb").enable();
						nui.get("creatReimbProcess").enable();
						nui.get("zzFeame").enable();
					}
				}
			});								
		}
		
		function addMoney(num1, num2) {
			// 1. 参数校验：非数字转0
			var n1 = isNaN(Number(num1)) ? 0 : Number(num1);
			var n2 = isNaN(Number(num2)) ? 0 : Number(num2);
			// 2. 解决浮点数精度问题：转成整数计算（乘以100，避免小数运算）
			var int1 = Math.round(n1 * 100);
			var int2 = Math.round(n2 * 100);
			var sumInt = int1 + int2;
			// 3. 转回小数并保留2位（toFixed自动补零，再转数字避免字符串）
			return Number((sumInt / 100).toFixed(2));
		}

		function multiplyMoney(num1, num2) {
			// 1. 参数校验：非数字转0
			var n1 = isNaN(Number(num1)) ? 0 : Number(num1);
			var n2 = isNaN(Number(num2)) ? 0 : Number(num2);
			// 2. 解决浮点数精度问题：转成整数计算
			var int1 = Math.round(n1 * 100);
			var int2 = Math.round(n2 * 100);
			var productInt = int1 * int2;
			// 3. 转回小数（除以10000，因为两个数都乘了100）并保留2位
			return Number((productInt / 10000).toFixed(2));
		}
		
		function sumMoney(...nums) {
		    return nums.reduce((total, num) => addMoney(total, num), 0);
		}
		
		function multiplyMoneyBatch(...nums) {
		    // 1. 边界处理：无参数时返回0（金额场景更合理）
		    if (nums.length === 0) return 0.00;
		    // 2. 遍历参数：非数字转0，转成整数（乘100）避免精度丢失
		    var intList = nums.map(num => {
		        var n = isNaN(Number(num)) ? 0 : Number(num);
		        return Math.round(n * 100);
		    });
		    // 3. 批量相乘：初始值为1（乘法累积初始值）
		    var totalInt = intList.reduce((total, intNum) => total * intNum, 1);
		    // 4. 转回小数：n个数各乘100，需除以 100^n；保留2位小数
		    var divisor = Math.pow(100, nums.length); // 100的n次方
		    return Number((totalInt / divisor).toFixed(2));
		}
		
		function isStrEmpty(obj) {
			if (typeof obj == "undefined" || obj == null || obj == "") {
				return true;
			} else {
				return false;
			}
		}											
												
		
	</script>

</body>
</html>