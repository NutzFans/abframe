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
								<input id="createUsername" name="createUsername" class="nui-textbox" style="width: 250px" readonly="readonly" />
							</td>
							<td align="right" style="width: 60px">申请单位：</td>
							<td style="width: 260px">
								<input id="secondaryOrg" name="secondaryOrg" class="nui-hidden" />
								<input id="secondaryOrgname" name="secondaryOrgname" class="nui-textbox" style="width: 250px" readonly="readonly" />
							</td>
							<td align="right" style="width: 60px">任务来源：</td>
							<td style="width: 260px">
								<input id="taskSource" name="taskSource" class="nui-dictcombobox" dictTypeId="ZH_XNCZ_TASK_SOURCE" style="width: 250px" readonly="readonly" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 60px">申报事项：</td>
							<td colspan="3">
								<input id="declareMatter" name="declareMatter" class="nui-buttonedit" style="width: 618px" allowInput="false" readonly="readonly" />
							</td>
							<td align="right" style="width: 60px">合同编码：</td>
							<td style="width: 260px">
								<input id="contractNo" name="contractNo" class="nui-textbox" style="width: 250px" readonly="readonly" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 90px">任务委托单位：</td>
							<td style="width: 260px">
								<input id="custName" name="custName" class="nui-buttonedit" style="width: 250px" allowInput="false" readonly="readonly" />
							</td>
							<td align="right" style="width: 60px">集团内外：</td>
							<td style="width: 260px">
								<input id="headquarterGroup" name="headquarterGroup" class="nui-dictcombobox" dictTypeId="ZH_GROUP_NEW" style="width: 250px" readonly="readonly" />
							</td>
							<td align="right" style="width: 100px">公司内委托部门：</td>
							<td style="width: 260px">
								<input id="entrustDept" name="entrustDept" class="nui-combobox" textField="secOrgname" valueField="secOrgname" multiSelect="true" style="width: 250px" readonly="readonly" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 110px">申报金额计算方式：</td>
							<td style="width: 260px">
								<input id="calcMethod" name="calcMethod" class="nui-dictcombobox" dictTypeId="ZH_SBJE_JSFS" style="width: 250px" readonly="readonly" />
							</td>
							<td align="right" style="width: 100px">拟申报金额(元)：</td>
							<td style="width: 260px">
								<input id="declareAmount" name="declareAmount" class="nui-textbox" style="width: 250px" readonly="readonly" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 110px">申报背景及原因：</td>
							<td colspan="5">
								<input name="remark" class="nui-textarea" style="width: 986px; height: 100px;" readonly="readonly" />
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
				<div id="rydjGrid" class="nui-datagrid" style="height: 250px;" showPager="false" showSummaryRow="true" frozenStartColumn="0" frozenEndColumn="1">
					<div property="columns">
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
									管理费比率（%）
									<input property="editor" class="mini-spinner" increment="0.01" minValue="0" maxValue="1" format="p0" style="width: 100%" />
								</div>
							</div>
						</div>
						<div header="D - 利润" headerAlign="center" align="center">
							<div property="columns">
								<div field="profitRatio" width="120" headerAlign="center" align="center" dataType="float" numberFormat="p0">
									利润比率（%）
									<input property="editor" class="mini-spinner" increment="0.01" minValue="0" maxValue="1" format="p0" style="width: 100%" />
								</div>
							</div>
						</div>
						<div field="remark" width="300" headerAlign="center" align="left">
							备注
							<input property="editor" class="mini-textbox" style="width: 100%" />
						</div>
					</div>
				</div>
			</div>

			<div id="xmdjDiv" style="width: 99%; margin: 0 auto; display: none;">
				<div id="xmdjGrid" class="nui-datagrid" style="height: 250px;" showPager="false" showSummaryRow="true">
					<div property="columns">
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
						<div field="remark" width="800" headerAlign="center" align="left">
							备注（投资额/规模/取费依据等）
							<input property="editor" class="mini-textbox" style="width: 100%" />
						</div>
					</div>
				</div>
			</div>

			<div id="gdzjDiv" style="width: 99%; margin: 0 auto; display: none;">
				<div id="gdzjGrid" class="nui-datagrid" style="height: 250px;" showPager="false" showSummaryRow="true">
					<div property="columns">
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
						<div field="remark" width="800" headerAlign="center" align="left">
							备注
							<input property="editor" class="mini-textbox" style="width: 100%" />
						</div>
					</div>
				</div>
			</div>
		</fieldset>
		<br>
		<fieldset id="field3" style="border: solid 1px #aaa; padding: 5px;">
			<legend>
				<span style="color: red">&nbsp;&nbsp;最终确认 - 确认最终的【申报金额计算方式】及【申报金额】&nbsp;&nbsp;</span>
			</legend>
			<div style="width: 99%">
				<form id="endForm" method="post">
					<table style="table-layout: fixed;">
						<tr>
							<td align="right" style="width: 110px">申报金额计算方式：</td>
							<td style="width: 260px">
								<input id="confirmCalcMethod" name="confirmCalcMethod" class="nui-dictcombobox" dictTypeId="ZH_SBJE_JSFS" style="width: 250px" readonly="readonly" />
							</td>
							<td align="right" style="width: 100px">确认金额(元)：</td>
							<td style="width: 260px">
								<input id="confirmAmount" name="confirmAmount" class="nui-textbox" style="width: 250px" readonly="readonly" />
							</td>
						</tr>
					</table>
				</form>
			</div>
		</fieldset>
		<br>
		<fieldset id="field4" style="border: solid 1px #aaa; padding: 5px;">
			<legend>
				<span style="color: red">&nbsp;&nbsp;最终申报金额及计算过程&nbsp;&nbsp;</span>
			</legend>
			<div id="rydjDivQR" style="width: 99%; margin: 0 auto; display: none;">
				<div id="rydjGridQR" class="nui-datagrid" style="height: 250px;" showPager="false" showSummaryRow="true" frozenStartColumn="0" frozenEndColumn="1">
					<div property="columns">
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
									管理费比率（%）
									<input property="editor" class="mini-spinner" increment="0.01" minValue="0" maxValue="1" format="p0" style="width: 100%" />
								</div>
							</div>
						</div>
						<div header="D - 利润" headerAlign="center" align="center">
							<div property="columns">
								<div field="profitRatio" width="120" headerAlign="center" align="center" dataType="float" numberFormat="p0">
									利润比率（%）
									<input property="editor" class="mini-spinner" increment="0.01" minValue="0" maxValue="1" format="p0" style="width: 100%" />
								</div>
							</div>
						</div>
						<div field="remark" width="300" headerAlign="center" align="left">
							备注
							<input property="editor" class="mini-textbox" style="width: 100%" />
						</div>
					</div>
				</div>
			</div>

			<div id="xmdjDivQR" style="width: 99%; margin: 0 auto; display: none;">
				<div id="xmdjGridQR" class="nui-datagrid" style="height: 250px;" showPager="false" showSummaryRow="true">
					<div property="columns">
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
						<div field="remark" width="800" headerAlign="center" align="left">
							备注（投资额/规模/取费依据等）
							<input property="editor" class="mini-textbox" style="width: 100%" />
						</div>
					</div>
				</div>
			</div>

			<div id="gdzjDivQR" style="width: 99%; margin: 0 auto; display: none;">
				<div id="gdzjGridQR" class="nui-datagrid" style="height: 250px;" showPager="false" showSummaryRow="true">
					<div property="columns">
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
						<div field="remark" width="800" headerAlign="center" align="left">
							备注
							<input property="editor" class="mini-textbox" style="width: 100%" />
						</div>
					</div>
				</div>
			</div>
		</fieldset>
		<br>
		<fieldset id="field5" style="border: solid 1px #aaa; padding: 5px;">
			<legend>支撑材料</legend>
			<div style="width: 99%; margin: 0 auto;">
				<jsp:include page="/ame_common/detailFile.jsp" />
			</div>
		</fieldset>
		<br>
		<fieldset id="field6" style="border: solid 1px #aaa; padding: 5px;">
			<legend>审批记录</legend>
			<div style="width: 99%; margin: 0 auto;">
				<jsp:include page="/ame_common/misOpinion_Freeflow.jsp" />
			</div>
		</fieldset>
	</div>

	<div style="text-align: center; padding: 10px;" class="nui-toolbar ">
		<a class="nui-button" onclick="countersign()" id="countersign" iconCls="icon-user" style="width: 80px; margin-right: 20px;">加签</a>
		<a class="nui-button" onclick="submit" id="creatReimbProcess" style="width: 80px; margin-right: 20px;">提交</a>
		<a class="nui-button" onclick="closeCancel()" id="saveReimbProcess" style="width: 80px; margin-right: 140px;">关闭</a>
	</div>

	<script type="text/javascript">
		nui.parse();
		var addForm = new nui.Form("#addForm");
		var endForm = new nui.Form("#endForm");
		var rydjGrid = nui.get("rydjGrid");
		var xmdjGrid = nui.get("xmdjGrid");
		var gdzjGrid = nui.get("gdzjGrid");
		var rydjGridQR = nui.get("rydjGridQR");
		var xmdjGridQR = nui.get("xmdjGridQR");
		var gdzjGridQR = nui.get("gdzjGridQR");
		var countersignUsers;
		var info;

		init();

		function init() {
			var json = nui.encode({
				"workItemId" : <%=workItemId%>
			});
			ajaxCommon({
				url : "com.zhonghe.ame.kaohe.virtualProduction.queryVirtualProductionById.biz.ext",
				data : json,
				success : function(result) {
					var mainData = result.mainData;
					addForm.setData(mainData);
					setEndFormData(mainData);
					nui.get("declareMatter").setText(mainData.declareMatter);
					nui.get("custName").setText(mainData.custName);
					nui.get("entrustDept").setText(mainData.entrustDept);
					setPlanGridData(mainData);
					setResultGridData(mainData);
					setWorkItemData(mainData);
					setFileData(mainData);
				}
			});
		}

		function setPlanGridData(mainData) {
			var json = nui.encode({
				"virtualProductionId" : mainData.id
			});
			ajaxCommon({
				url : "com.zhonghe.ame.kaohe.virtualProduction.queryPlanGridDataList.biz.ext",
				data : json,
				async : false,
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

		function setWorkItemData(mainData) {
			var wrokItemGrid = nui.get("datagrid1");
			nui.get("backTo").setData(mainData.backList);
			wrokItemGrid.load({
				"processInstID" : mainData.processId
			});
			wrokItemGrid.sortBy("time", "desc");
			initMisOpinion({
				"auditstatus" : "1"
			});
		}

		function setFileData(mainData) {
			var fileGrid = nui.get("grid_0");
			fileGrid.load({
				"groupid" : "virtualProduction",
				"relationid" : mainData.id
			});
			fileGrid.sortBy("fileTime", "desc");
		}

		function setEndFormData(mainData) {
			if (isStrEmpty(mainData.confirmCalcMethod)) {
				nui.get("confirmCalcMethod").setValue(mainData.calcMethod);
			} else {
				nui.get("confirmCalcMethod").setValue(mainData.confirmCalcMethod);
			}
			if (isStrEmpty(mainData.confirmAmount)) {
				nui.get("confirmAmount").setValue(mainData.declareAmount);
			} else {
				nui.get("confirmAmount").setValue(mainData.confirmAmount);
			}
		}

		function setResultGridData(mainData) {
			var json = nui.encode({
				"virtualProductionId" : mainData.id
			});
			ajaxCommon({
				url : "com.zhonghe.ame.kaohe.virtualProduction.queryResultGridDataList.biz.ext",
				data : json,
				success : function(result) {
					var resultGridData = result.resultGridData;
					var confirmCalcMethod = mainData.confirmCalcMethod;
					if (isStrEmpty(confirmCalcMethod)) {
						confirmCalcMethod = mainData.calcMethod;
					}
					if (confirmCalcMethod == "1") {
						$("#rydjDivQR").css("display", "block");
						nui.parse();
						rydjGridQR.setFrozenStartColumn(0);
						rydjGridQR.setFrozenEndColumn(1);
						if (resultGridData != null && resultGridData.length > 0) {
							rydjGridQR.setData(resultGridData);
						} else {
							rydjGridQR.setData(rydjGrid.getData());
						}
					} else if (confirmCalcMethod == "2") {
						$("#xmdjDivQR").css("display", "block");
						nui.parse();
						if (resultGridData != null && resultGridData.length > 0) {
							xmdjGridQR.setData(resultGridData);
						} else {
							xmdjGridQR.setData(xmdjGrid.getData());
						}
					} else if (confirmCalcMethod == "3") {
						$("#gdzjDivQR").css("display", "block");
						nui.parse();
						if (resultGridData != null && resultGridData.length > 0) {
							gdzjGridQR.setData(resultGridData);
						} else {
							gdzjGridQR.setData(gdzjGrid.getData());
						}
					}
				}
			});
		}
		
		function countersign() {
			selectOmEmployee();
		}
		
		function selectOmEmployee() {
			var btnEdit = this;
			nui.open({
				url : "<%=request.getContextPath()%>/contractPact/selectUsers.jsp",
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
							console.log(data)
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
		
		function submit() {
			var auditstatus = nui.get("auditstatus").getValue();
			if (auditstatus == "2") { //终止流程
				submitProcess("终止");
			} else if (auditstatus == "0") { //退回流程
				if (!nui.get("backTo").getValue()) {
					showTips("退回环节不能为空！");
					return;
				}
				submitProcess("退回");
			} else if (auditstatus == "1") { //提交流程
				submitProcess("提交");
			}
		}

		function submitProcess(title) {
			nui.confirm("确定" + title + "流程吗？", "操作提示", function(action) {
				if (action == "ok") {
					nui.get("countersign").disable();
					nui.get("creatReimbProcess").disable();
					nui.mask({
						el : document.body,
						cls : 'mini-mask-loading',
						html : '表单提交中...'
					});
					saveData();
				}
			});
		}
		
		function saveData() {
			var data = addForm.getData();
			var misOpinion = opioionform.getData().misOpinion;//审核意见
			var json = {
				"mainData" : data,
				"misOpinion" : misOpinion,
				"workItemId" : <%=workItemId%>,
				"countersignUsers" : countersignUsers
			};
			ajaxCommon({
				url : "com.zhonghe.ame.kaohe.virtualProduction.virtualProductionFlowConfirme.biz.ext",
				data : json,
				contentType : 'text/json',
				success : function(o) {
					nui.unmask(document.body);
					if (o.result == "success") {
						showTips("提交成功");
						closeOk();
					} else {
						nui.get("countersign").enable();
						nui.get("creatReimbProcess").enable();
					}
				}
			});
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