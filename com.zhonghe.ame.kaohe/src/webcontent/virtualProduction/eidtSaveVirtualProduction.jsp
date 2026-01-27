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
<title>虚拟产值申报</title>
</head>
<body>
	<div class="nui-fit" style="padding: 5px;">
		<fieldset id="field1" style="border: solid 1px #aaa; padding: 5px;">
			<legend>基本信息</legend>
			<div style="width: 99%">
				<form id="addForm" method="post">
					<input name="id" class="nui-hidden" />
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
				<span style="color: red">&nbsp;&nbsp;最终确认 - 确认最终的【申报金额计算方式】及【申报金额】，默认自动填充【基本信息】中填写的值&nbsp;&nbsp;</span>
			</legend>
			<div style="width: 99%">
				<form id="endForm" method="post">
					<table style="table-layout: fixed;">
						<tr>
							<td align="right" style="width: 110px">申报金额计算方式：</td>
							<td style="width: 260px">
								<input id="confirmCalcMethod" name="confirmCalcMethod" class="nui-dictcombobox" dictTypeId="ZH_SBJE_JSFS" style="width: 250px" required="true" onvaluechanged="changeConfirmCalcMethod" />
							</td>
							<td align="right" style="width: 100px">确认金额(元)：</td>
							<td style="width: 260px">
								<input id="confirmAmount" name="confirmAmount" class="nui-textbox" style="width: 250px" required="true" readonly="readonly" emptyText="无需填写，根据明细自动计算" />
							</td>
						</tr>
					</table>
				</form>
			</div>
		</fieldset>
		<br>
		<fieldset id="field4" style="border: solid 1px #aaa; padding: 5px;">
			<legend>
				<span style="color: red">&nbsp;&nbsp;最终申报金额及计算过程 - 默认自动填充【拟申报金额及计算过程】中填写的值&nbsp;&nbsp;</span>
			</legend>
			<div id="rydjDivQR" style="width: 99%; margin: 0 auto; display: none;">
				<div class="nui-toolbar" style="border-bottom: 0; padding: 0px;">
					<table>
						<tr>
							<td>
								<a class="nui-button" iconCls="icon-add" onclick="rydjQRAddRow()">新增</a>
								<a class="nui-button" iconCls="icon-remove" onclick="rydjQRRemoveRow()">删除</a>
							</td>
						</tr>
					</table>
				</div>
				<div id="rydjGridQR" class="nui-datagrid" style="height: 250px;" showPager="false" showSummaryRow="true" frozenStartColumn="0" frozenEndColumn="2" allowCellEdit="true" allowCellSelect="true"
					oncellendedit="rydjGridQRCellEndEdit" oncellvalidation="rydjGridQRCellValidation">
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

			<div id="xmdjDivQR" style="width: 99%; margin: 0 auto; display: none;">
				<div class="nui-toolbar" style="border-bottom: 0; padding: 0px;">
					<table>
						<tr>
							<td>
								<a class="nui-button" iconCls="icon-add" onclick="xmdjQRAddRow()">新增</a>
								<a class="nui-button" iconCls="icon-remove" onclick="xmdjQRRemoveRow()">删除</a>
							</td>
						</tr>
					</table>
				</div>
				<div id="xmdjGridQR" class="nui-datagrid" style="height: 250px;" showPager="false" showSummaryRow="true" allowCellEdit="true" allowCellSelect="true" oncellendedit="xmdjGridQRCellEndEdit"
					oncellvalidation="xmdjGridQRCellValidation">
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

			<div id="gdzjDivQR" style="width: 99%; margin: 0 auto; display: none;">
				<div class="nui-toolbar" style="border-bottom: 0; padding: 0px;">
					<table>
						<tr>
							<td>
								<a class="nui-button" iconCls="icon-add" onclick="gdzjQRAddRow()">新增</a>
								<a class="nui-button" iconCls="icon-remove" onclick="gdzjQRRemoveRow()">删除</a>
							</td>
						</tr>
					</table>
				</div>
				<div id="gdzjGridQR" class="nui-datagrid" style="height: 250px;" showPager="false" showSummaryRow="true" allowCellEdit="true" allowCellSelect="true" oncellendedit="gdzjGridQRCellEndEdit"
					oncellvalidation="gdzjGridQRCellValidation">
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
		<fieldset id="field5" style="border: solid 1px #aaa; padding: 5px;">
			<legend>
				上传附件 -
				<span style="color: red">相关证明材料</span>
			</legend>
			<div style="width: 99%; margin: 0 auto;">
				<jsp:include page="/ame_common/inputFile.jsp" />
			</div>
		</fieldset>
	</div>

	<div style="text-align: center; position: relative; bottom: 10px" class="nui-toolbar">
		<a class="nui-button" onclick="onOk()" id="saveReimb" iconCls="icon-save" style="width: 80px; margin-right: 20px;">保存</a>
		<a class="nui-button" onclick="closeCancel" id="saveReimbProcess" iconCls="icon-close" style="width: 80px; margin-right: 140px;">关闭</a>
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

		function setData(data) {
			initSecOrgCombobox();
			addForm.setData(data);
			endForm.setData(data);
			nui.get("declareMatter").setValue(data.declareMatter);
			nui.get("declareMatter").setText(data.declareMatter);
			nui.get("custName").setValue(data.custName);
			nui.get("custName").setText(data.custName);
			nui.get("entrustDept").setValue(data.entrustDept);
			nui.get("entrustDept").setText(data.entrustDept);
			setUI(data);
			setPlanGridData(data);
			setResultGridData(data);
			setFileData(data);
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
		
		function setFileData(mainData) {
			var fileGrid = nui.get("grid_0");
			fileGrid.load({
				"groupid" : "virtualProduction",
				"relationid" : mainData.id
			});
			fileGrid.sortBy("fileTime", "desc");
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
		
		function changeConfirmCalcMethod(){
			var confirmCalcMethod = nui.get("confirmCalcMethod").getValue();
			if(confirmCalcMethod == "1"){
				rydjGridQR.setData(null);
				$("#rydjDivQR").css("display", "block");
				$("#xmdjDivQR").css("display", "none");
				$("#gdzjDivQR").css("display", "none");
				nui.parse();
				rydjGridQR.setFrozenStartColumn(0);
				rydjGridQR.setFrozenEndColumn(2);
			}else if(confirmCalcMethod == "2"){
				xmdjGridQR.setData(null);
				$("#rydjDivQR").css("display", "none");
				$("#xmdjDivQR").css("display", "block");
				$("#gdzjDivQR").css("display", "none");
				nui.parse();				
			}else if(confirmCalcMethod == "3"){
				gdzjGridQR.setData(null);
				$("#rydjDivQR").css("display", "none");
				$("#xmdjDivQR").css("display", "none");
				$("#gdzjDivQR").css("display", "block");
				nui.parse();				
			}
		}
		
		function rydjQRAddRow() {
			var newRow = {};
			var index = rydjGridQR.getData().length;
			rydjGridQR.addRow(newRow, index + 1);
			rydjGridQR.beginEditRow(newRow);
		}

		function rydjQRRemoveRow() {
			var rows = rydjGridQR.getSelecteds();
			if (rows.length > 0) {
				rydjGridQR.removeRows(rows, false);
				updateConfirmAmountFormData(rydjGridQR);
			}
		}

		function rydjGridQRCellEndEdit(e) {
			var record = e.record;
			var personDayTotal = multiplyMoney(record.personDay, record.personDayPrice);
			var costTotal = sumMoney(record.conferenceRoomCost,record.expertConsultationCost,record.expertTravelCost,record.expertStayCost,record.foodCost,record.otherCost);
			var manageRatioSum = addMoney(1, record.manageRatio);
			var profitRatioSum = addMoney(1, record.profitRatio);
			var personDayAndCostTotal = addMoney(personDayTotal, costTotal);
			var declaredTotal = multiplyMoneyBatch(personDayAndCostTotal,manageRatioSum,profitRatioSum);
			rydjGridQR.updateRow(e.row, {
				'personDayTotal' : personDayTotal,
				'costTotal' : costTotal,
				'declaredTotal' : declaredTotal
			});
			updateConfirmAmountFormData(rydjGridQR);	
		}
		
		function xmdjQRAddRow() {
			var newRow = {};
			var index = xmdjGridQR.getData().length;
			xmdjGridQR.addRow(newRow, index + 1);
			xmdjGridQR.beginEditRow(newRow);
		}

		function xmdjQRRemoveRow() {
			var rows = xmdjGridQR.getSelecteds();
			if (rows.length > 0) {
				xmdjGridQR.removeRows(rows, false);
				updateConfirmAmountFormData(xmdjGridQR);
			}
		}
		
		function xmdjGridQRCellEndEdit(e) {
			var record = e.record;
			var declaredTotal = multiplyMoney(record.projectNum,record.projectPrice);
			xmdjGridQR.updateRow(e.row, {
				'declaredTotal' : declaredTotal
			});
			updateConfirmAmountFormData(xmdjGridQR);	
		}
		
		function gdzjQRAddRow() {
			var newRow = {};
			var index = gdzjGridQR.getData().length;
			gdzjGridQR.addRow(newRow, index + 1);
			gdzjGridQR.beginEditRow(newRow);
		}

		function gdzjQRRemoveRow() {
			var rows = gdzjGridQR.getSelecteds();
			if (rows.length > 0) {
				gdzjGridQR.removeRows(rows, false);
				updateConfirmAmountFormData(gdzjGridQR);
			}
		}
		
		function gdzjGridQRCellEndEdit(e) {
			updateConfirmAmountFormData(gdzjGridQR);	
		}								
		
		function updateConfirmAmountFormData(grid){
			var rows = grid.getData();
			var declareAmount = 0;
			for (var row of rows) {
				declareAmount = addMoney(declareAmount,row.declaredTotal);
			}
			nui.get("confirmAmount").setValue(declareAmount);
		}
		
		function rydjGridQRCellValidation(e){
			if(e.field == "declaredTotal"){
				if(e.value != 0){
					e.isValid = true;
				}else{
					e.isValid = false;
					e.errorText = "[拟申报金额（元）]必填，该值可通过填写其他数据自动汇总";
				}
			}
		}
		
		function xmdjGridQRCellValidation(e){
			if(e.field == "declaredTotal"){
				if(e.value != 0){
					e.isValid = true;
				}else{
					e.isValid = false;
					e.errorText = "[合计（元）]必填，该值可通过填写其他数据自动汇总";
				}
			}
		}
		
		function gdzjGridQRCellValidation(e){
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
		
		function onOk() {
			addForm.validate();
			if (addForm.isValid() == false) {
				showTips("请检查表单的完整性!", "danger");
				return;
			}
			endForm.validate();
			if (endForm.isValid() == false) {
				showTips("请检查表单的完整性!", "danger");
				return;
			}
			var calcMethod = nui.get("calcMethod").getValue();
			if (calcMethod == "1") {
			    rydjGrid.validate();
			    if (rydjGrid.isValid() == false) {
			        var error = rydjGrid.getCellErrors()[0];
			        rydjGrid.beginEditCell(error.record, error.column);
			        showTips("按人员单价计算数据有错误，请检查!", "danger");
			        return;
			    }
			}
			if (calcMethod == "2") {
			    xmdjGrid.validate();
			    if (xmdjGrid.isValid() == false) {
			        var error = xmdjGrid.getCellErrors()[0];
			        xmdjGrid.beginEditCell(error.record, error.column);
			        showTips("按项目单价计算数据有错误，请检查!", "danger");
			        return;
			    }
			}
			if (calcMethod == "3") {
			    gdzjGrid.validate();
			    if (gdzjGrid.isValid() == false) {
			        var error = gdzjGrid.getCellErrors()[0];
			        gdzjGrid.beginEditCell(error.record, error.column);
			        showTips("按固定总价计算数据有错误，请检查!", "danger");
			        return;
			    }
			}
			var confirmCalcMethod = nui.get("confirmCalcMethod").getValue();
			if (confirmCalcMethod == "1") {
			    rydjGridQR.validate();
			    if (rydjGridQR.isValid() == false) {
			        var error = rydjGridQR.getCellErrors()[0];
			        rydjGridQR.beginEditCell(error.record, error.column);
			        showTips("按人员单价计算数据有错误，请检查!", "danger");
			        return;
			    }
			}
			if (confirmCalcMethod == "2") {
			    xmdjGridQR.validate();
			    if (xmdjGridQR.isValid() == false) {
			        var error = xmdjGridQR.getCellErrors()[0];
			        xmdjGridQR.beginEditCell(error.record, error.column);
			        showTips("按项目单价计算数据有错误，请检查!", "danger");
			        return;
			    }
			}
			if (confirmCalcMethod == "3") {
			    gdzjGridQR.validate();
			    if (gdzjGridQR.isValid() == false) {
			        var error = gdzjGridQR.getCellErrors()[0];
			        gdzjGridQR.beginEditCell(error.record, error.column);
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
			document.getElementById("fileCatalog").value = "virtualProduction";
			nui.confirm("确定保存数据吗?", "系统提示", function (action) {
			    if (action == "ok") {
			        nui.get("saveReimb").disable();
			        nui.mask({ el: document.body, cls: 'mini-mask-loading', html: '表单提交中...' });
			        form2.submit();
			    }
			});																
		}
		
		function SaveData() {
			var endData = endForm.getData();
			var data = addForm.getData();
			data.files = nui.get("fileids").getValue();
			data.confirmCalcMethod = endData.confirmCalcMethod;
			data.confirmAmount = endData.confirmAmount;
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
			var confirmCalcMethod = nui.get("confirmCalcMethod").getValue();
			var resultDataGrid;
			if(confirmCalcMethod == "1"){
				resultDataGrid = rydjGridQR.getData();
			}
			if(confirmCalcMethod == "2"){
				resultDataGrid = xmdjGridQR.getData();
			}
			if(confirmCalcMethod == "3"){
				resultDataGrid = gdzjGridQR.getData();
			}
		    var json = nui.encode({
		        "virtualProduction": data,
		        "planDataGrid": planDataGrid,
		        "resultDataGrid": resultDataGrid
		    });
		    ajaxCommon({
		        "url": "com.zhonghe.ame.kaohe.virtualProduction.editSaveVirtualProduction.biz.ext",
		        data: json,
		        contentType: 'text/json',
		        success: function (text) {
		            nui.unmask(document.body);
		            if (text.result == "1") {
		                showTips("操作成功");
		                closeOk();
		            } else {
		                nui.get("saveReimb").enable();
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