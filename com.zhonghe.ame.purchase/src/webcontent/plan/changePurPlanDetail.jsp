<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<head>
<title>采购 - 变更计划</title>
<style type="text/css">
body {
	margin: 0;
	padding: 0;
	border: 0;
	width: 100%;
	height: 100%;
	overflow: hidden;
}
</style>
</head>
<body>
	<div class="nui-fit" style="padding: 5px;"> 
		<fieldset id="field1" style="border: solid 1px #aaa;">
			<legend>原 - 采购计划</legend>
			<form>
				<input name="historyId" id="historyId" class="nui-hidden" />
				<div style="padding: 5px;">
					<table style="table-layout: fixed;">
						<tr>
							<td align="right" style="width: 120px;">采购计划(年度)名称：</td>
							<td colspan="3">
								<input id="historyName" name="historyName" class="nui-textbox" enabled="false" style="width: 100%;" />
							</td>
							<td align="right" style="width: 120px;">提报人姓名：</td>
							<td>
								<input class="nui-textbox" name="historyInfomantUser" id="historyInfomantUser" style="width: 100%;" enabled="false" />
							</td>
							<td align="right" style="width: 120px;">采购单位：</td>
							<td>
								<input id="historyNeedOrgName" name="historyNeedOrgName" class="nui-textbox" style="width: 100%;" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 120px;">计划年度：</td>
							<td>
								<input id="historyYear" name="historyYear" style="width: 100%;" class="nui-textbox" style="width:100%;" enabled="false" />
							</td>
							<td align="right" style="width: 100px;">采购类型：</td>
							<td>
								<input class="nui-dictcombobox" name="historyType" id="historyType" dictTypeId="ZH_PURCHASE_NEW" style="width: 100%;" enabled="false" />
							</td>
							<td align="right" style="width: 120px;">财务年度预算科目：</td>
							<td>
								<input id="historySubject" name="historySubject" class="nui-textbox" style="width: 100%;" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 150px;">计划初始总金额(万元)：</td>
							<td>
								<input id="historyBudgetAmount" name="historyBudgetAmount" class="nui-textbox" style="width: 100%;" enabled="false" />
							</td>
							<td align="right" style="width: 150px;">上次变更后总金额(万元)：</td>
							<td>
								<input id="shangCiBudgetAmount" name="shangCiBudgetAmount" class="nui-textbox" style="width: 100%;" enabled="false" />
							</td>
						</tr>
						<tr>
							<td style="width: 120px;" align="right">备注：</td>
							<td colspan="7">
								<input id="historyRemark" name="historyRemark" class="nui-textarea" style="width: 100%; height: 120px;" enabled="false" />
							</td>
						</tr>
					</table>
				</div>
			</form>
		</fieldset>

		<fieldset id="field2" style="border: solid 1px #aaa;">
			<legend>采购 - 计划变更</legend>
			<form id="form1" method="post">
				<input name="files" id="fileids" class="nui-hidden" />
				<input id="SUBJECT" name="subject" class="nui-hidden" />
				<input id="id" name="id" class="nui-hidden" />
				<input class="nui-hidden" name="processid" />
				<input class="nui-hidden" name="oldId" />
				<div style="padding: 5px;">
					<table style="table-layout: fixed;">
						<tr>
							<td align="right" style="width: 150px;">采购计划(变更)名称：</td>
							<td colspan="3">
								<input id="name" name="name" class="nui-textbox" required="true" style="width: 100%;" enabled="false" />
							</td>
							<td align="right" style="width: 120px;">提报人姓名：</td>
							<td>
								<input class="nui-textbox" name="infomantUser" id="infomantUser" style="width: 100%;" enabled="false"/>
							</td>
							<td align="right" style="width: 120px;">采购单位：</td>
							<td>
								<input id="needOrgName" name="needOrgName" class="nui-textbox" style="width: 100%;" enabled="false"/>
								<input id="needOrgId" name="needOrgId" class="nui-hidden" style="width: 100%;" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 120px;">计划年度：</td>
							<td>
								<input id="year" name="year" style="width: 100%;" class="nui-textbox" style="width:100%;" enabled="false"/>
							</td>
							<td align="right" style="width: 100px;">采购类型：</td>
							<td>
								<input class="nui-dictcombobox" name="type" id="type" dictTypeId="ZH_PURCHASE_NEW" style="width: 100%;" enabled="false"/>
							</td>
							<td align="right" style="width: 150px;">本次变更后总金额(万元)：</td>
							<td>
								<input id="newBudgetAmount" name="newBudgetAmount" class="nui-textbox" enabled="false" style="width: 100%;" />
							</td>
							<td align="right" style="width: 120px;">本次变更金额(万元)：</td>
							<td>
								<input id="bgBudget" name="bgBudget" class="nui-textbox" style="width: 100%;" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 120px;">物项归口部门：</td>
							<td colspan="7">
								<input id="putunder" name="putunder" class="nui-dictcombobox" dictTypeId="ZH_PUTUNDER" multiSelect="true" style="width: 100%;" enabled="false"/>
							</td>
						</tr>
						<tr>
							<td style="width: 120px;" align="right">变更原因：</td>
							<td colspan="7">
								<input id="changeReason" name="changeReason" class="nui-textarea" style="width: 100%; height: 120px;" enabled="false"/>
							</td>
						</tr>
					</table>
				</div>
			</form>
		</fieldset>

		<fieldset id="field3" style="border: solid 1px #aaa;">
			<legend>
				变更 - 计划明细
				<span style="color: red">（金额单位：万元）</span>
			</legend>
			<div id="grid_traveldetail" class="nui-datagrid" style="width: 100%; height: auto;" showPager="false" url="com.zhonghe.ame.purchase.purchaseItems.queryPurPlanItem.biz.ext" dataField="purPlanItem">
				<div property="columns">
					<div type="checkcolumn"></div>
					<div field="code" width="110" align="center" headerAlign="center" readOnly="true">
						计划编号
						<input name="code" property="editor" enabled="true" class="nui-textbox" readOnly="true">
					</div>
					<div field="purchaseFirstCode" width="100" align="center" headerAlign="center" visible="false">
						物项大类编码
						<input name="purchaseFirstCode" property="editor" enabled="true" class="nui-textbox" readOnly="true" />
					</div>
					<div field=purchaseFirstName width="110" align="center" headerAlign="center" readOnly="true">
						大类名称
						<input name="purchaseFirstName" property="editor" class="nui-textbox" />
					</div>
					<div field="purchaseTwoCode" width="110" align="center" headerAlign="center" visible="false" readOnly="true">
						中类编码
						<input property="editor" name="purchaseTwoCode" class="nui-textbox" />
					</div>
					<div field="purchaseTwoName" width="110" align="center" headerAlign="center" readOnly="true">
						中类名称
						<input property="editor" name="purchaseTwoName" class="nui-textbox" readOnly="true" />
					</div>
					<div field="materialName" width="110" align="center" headerAlign="center" vtype="required">
						采购物项名称
						<input property="editor" class="nui-textbox" name="materialName" width="100%" required="true" />
					</div>

					<div header="调整前" headerAlign="center">
						<div property="columns">
							<div field="unit" width="40" align="center" headerAlign="center" renderer="unitValue">单位</div>
							<div field="number" width="50" align="center" headerAlign="center" vtype="required">数量</div>
							<div field="budgetAmount" width="80" align="center" headerAlign="center" headerStyle="color:red" vtype="required">预算金额(万元)</div>
						</div>
					</div>
					<div header="调整后" headerAlign="center" headerStyle="color:red;">
						<div property="columns">
							<div field="onePrice" width="70" align="center" headerAlign="center" vtype="required">
								<span style="color: red;">单价(万元)</span>
								<input id="supplierName" name="onePrice" width="100%" property="editor" class="nui-textbox" />
							</div>
							<div field="newUnit" width="40" align="center" headerAlign="center" renderer="unitValue">
								<span style="color: red;">单位</span>
								<input property="editor" width="100%" class="nui-dictcombobox" dictTypeId="ZH_UNIT" name="newUnit" />
							</div>
							<div field="newNumber" width="40" align="center" headerAlign="center" vtype="int">
								<span style="color: red;">数量</span>
								<input property="editor" width="100%" class="nui-spinner" minValue="0" decimalPlaces="0" maxValue="999999999" id="newNumber" name="newNumber" />
							</div>
							<div field="newBudgetAmount" width="70" align="center" headerAlign="center" vtype="required">
								<span style="color: red;">预算金额(万元)</span>
							</div>

						</div>
					</div>
					<div field="changeReason" width="150" align="left" headerAlign="center" vtype="required" headerStyle="color:red">
						调整原因
						<input property="editor" width="100%" class="nui-textarea" name="changeReason" visible="true" />
					</div>
				</div>
			</div>
		</fieldset>

		<fieldset id="field2" style="border: solid 1px #aaa;">
			<legend> 相关附件 </legend>
			<jsp:include page="/ame_common/detailFile.jsp" />
		</fieldset>

	</div>


	<script type="text/javascript">
		nui.parse();
		var processid = <%=request.getParameter("processInstID")%> ;
		var form = new nui.Form("#form1");
		var grid = nui.get("grid_traveldetail");
		
		init();
		
		function init() {
			var data = {"processid" : processid};
			var json = nui.encode(data);
			nui.ajax({
				url : "com.zhonghe.ame.purchase.purchaseItems.queryPurPlanDetail.biz.ext",
				type : 'POST',
				data : json,
				success : function(o) {
					form.setData(o.purPlan);
					var bgBudget = subFloat(o.purPlan.newBudgetAmount, o.purPlan.extend4, 5);
					nui.get("bgBudget").setValue(bgBudget);
					if(o.purPlan.budgetAmount == o.purPlan.extend4){
						nui.get("shangCiBudgetAmount").setValue("/");
					}else{
						nui.get("shangCiBudgetAmount").setValue(o.purPlan.extend4);
					}
					queryHistory(o.purPlan.oldId);	
					var jsonData = {
						"planId" : o.purPlan.id
					}
					grid.load(jsonData);
					var grid_0 = nui.get("grid_0");
					grid_0.load({
						"groupid" : "PurchasePlan",
						"relationid" : o.purPlan.id
					});
					grid_0.sortBy("fileTime", "desc");
				}
			});
		}		
		
		function queryHistory(str) {
			var data = {
				"id" : str
			};
			var json = nui.encode(data);
			ajaxCommon({
				"url" : "com.zhonghe.ame.purchase.purchaseplan.queryPurPlanById.biz.ext",
				"data" : json,
				"success" : function(o) {
					var data = o.data;
					nui.get("historyId").setValue(data.id);
					nui.get("historyName").setValue(data.name);
					nui.get("historyInfomantUser").setValue(data.infomantUser);
					nui.get("historyNeedOrgName").setValue(data.needOrgName);
					nui.get("historyYear").setValue(data.year);
					nui.get("historyType").setValue(data.type);
					nui.get("historyBudgetAmount").setValue(data.budgetAmount);
					nui.get("historySubject").setValue(data.subject);
					nui.get("historyRemark").setValue(data.remark);
				}
			});
		}
									
		function unitValue(e) {
			return nui.getDictText("ZH_UNIT", e.value);
		}
	</script>

</body>
</html>