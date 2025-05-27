<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<head>
<title>年度采购计划</title>
<style type="text/css">
html,body {
	font-size: 12px;
	padding: 0;
	margin: 0;
	border: 0;
	height: 100%;
	overflow: hidden;
	width: 100%;
}
</style>
</head>
<body>
	<%
		long workitemid = (Long) request.getAttribute("workItemID");
	%>
	<div class="nui-fit" style="padding: 5px;">
		<fieldset id="field1" style="border: solid 1px #aaa;">
			<legend>采购计划</legend>
			<form id="form1" method="post">
				<input name="files" id="fileids" class="nui-hidden" />
				<input id="id" name="id" class="nui-hidden" readonly="readonly" />
				<div style="padding: 5px;">
					<table style="table-layout: fixed;">
						<tr>
							<td colspan="1" class="form_label" align="right" style="width: 120px;">年度采购计划名称：</td>
							<td colspan="3">
								<input id="name" name="name" class="nui-textbox" readonly="readonly" style="width: 100%;" />
							</td>
							<td colspan="1" class="form_label" align="right" style="width: 120px;">提报人姓名：</td>
							<td colspan="1">
								<input class="nui-textbox" name="infomantUser" id="infomantUser" readonly="readonly" style="width: 100%;" />
							</td>
							<td colspan="1" class="form_label" align="right" style="width: 120px;">采购单位：</td>
							<td colspan="1">
								<input id="needOrgName" name="needOrgName" class="nui-textbox" readonly="readonly" style="width: 100%;" />
							</td>
						</tr>
						<tr>
							<td class="form_label" align="right" style="width: 120px;">计划年度：</td>
							<td colspan="1">
								<input id="year" name="year" style="width: 100%;" class="nui-textbox" style="width:100%;" readonly="readonly" />
							</td>
							<td class="form_label" align="right" style="width: 100px;">采购类型：</td>
							<td colspan="1">
								<input class="nui-dictcombobox" name="type" id="type" dictTypeId="ZH_PURCHASE" readonly="readonly" style="width: 100%;" />
							</td>
							<td colspan="1" class="form_label" align="right" style="width: 130px;">变更前总金额(万元)：</td>
							<td colspan="1">
								<input id="budgetAmount" name="budgetAmount" class="nui-textbox" readonly="readonly" style="width: 100%;" />
							</td>
							<td class="form_label" align="right" style="width: 120px;">财务年度预算科目：</td>
							<td colspan="1">
								<input id="SUBJECT" name="subject" class="nui-textbox" style="width: 100%;" />
							</td>
						</tr>
						<tr>
							<td class="form_label" align="right" style="width: 120px;">物项归口部门：</td>
							<td colspan="3">
								<input id="putunder" name="putunder" class="nui-dictcombobox" dictTypeId="ZH_PUTUNDER" readonly="readonly" style="width: 100%;" />
							</td>

							<td class="form_label" align="right" style="width: 120px; color: red;">变更后总金额(万元)：</td>
							<td colspan="1">
								<input id="newBudgetAmount" name="newBudgetAmount" class="nui-textbox" readonly="readonly" style="width: 100%;" />
							</td>
							<td class="form_label" align="right" style="width: 120px; color: red;">变更金额(万元)：</td>
							<td colspan="1">
								<input id="changeAmount" class="nui-textbox" readonly="readonly" style="width: 100%;" />
							</td>
						</tr>
						<tr>
							<td class="form_label" style="width: 120px;" align="right">备注：</td>
							<td colspan="7">
								<input style="width: 100%; height: 120px;" name="remark" class="nui-textarea" id="remark" readonly="readonly" />
							</td>
						</tr>
						<tr>
							<td class="form_label" style="width: 120px;" align="right">调整原因：</td>
							<td colspan="7">
								<input style="width: 100%; height: 120px;" name="changeReason" class="nui-textarea" id="changeReason" readonly="readonly" />
							</td>
						</tr>
					</table>
				</div>
			</form>
		</fieldset>

		<fieldset style="border: solid 1px #aaa;">
			<legend>计划明细</legend>
			<div id="grid_traveldetail" class="nui-datagrid" style="width: 100%; height: auto;" allowCellSelect="true" allowCellwrap="true" showPager="false" allowCellEdit="false" multiSelect="true"
				dataField="purPlanItem" url="com.zhonghe.ame.purchase.purchaseItems.queryPurPlanItem.biz.ext">
				<div property="columns">
					<div type="checkcolumn"></div>
					<div field="code" width="110" align="center" headerAlign="center" visible="false">计划编号</div>
					<div field=purchaseFirstName width="110" align="center" headerAlign="center" readOnly="true">大类名称</div>
					<div field="purchaseTwoName" width="110" align="center" headerAlign="center" readOnly="true">中类名称</div>
					<div field="materialName" width="110" align="center" headerAlign="center" vtype="required">采购物项名称</div>
					<div field="onePrice" width="70" align="center" headerAlign="center">单价(万元)</div>
					<div header="调整前" headerAlign="center">
						<div property="columns">
							<div field="unit" width="40" align="center" headerAlign="center" renderer="unitValue">单位</div>
							<div field="number" width="50" align="center" headerAlign="center">数量</div>
							<div field="budgetAmount" width="80" align="center" headerAlign="center">预算金额(万元)</div>
						</div>
					</div>
					<div header="调整后" headerAlign="center">
						<div property="columns">

							<div field="newUnit" width="40" align="center" headerAlign="center" renderer="unitValue">
								<span style="color: red;">单位</span>
							</div>
							<div field="newNumber" width="40" align="center" headerAlign="center">
								<span style="color: red;">数量</span>
							</div>
							<div field="newBudgetAmount" width="70" align="center" headerAlign="center">
								<span style="color: red;">预算金额(万元)</span>
								</span>
							</div>
						</div>
					</div>

					<div field="remark" width="100" align="center" headerAlign="center">调整原因</div>
				</div>
			</div>
		</fieldset>

		<fieldset id="field2" style="border: solid 1px #aaa;">
			<legend> 相关附件 </legend>
			<jsp:include page="/ame_common/inputFile.jsp" />
		</fieldset>

		<jsp:include page="/ame_common/misOpinion_Freeflow.jsp" />
	</div>

	<div style="text-align: center; position: relative; bottom: 10px" class="nui-toolbar">
		<a class="nui-button" onclick="countersign()" id="countersign" iconCls="icon-user" style="width: 80px; margin-right: 20px;">加签</a>
		<a class="nui-button" onclick="submit()" iconCls="icon-ok" style="width: 60px; margin-right: 20px;">提交</a>
		<a class="nui-button" onclick="closeCancel" iconCls="icon-close" style="width: 60px;">关闭</a>
	</div>

	<script type="text/javascript">
		nui.parse();
		var workItemID = <%=request.getParameter("workItemID")%>;
		var form = new nui.Form("#form1");
		var grid = nui.get("grid_traveldetail");
		var opioionform = new nui.Form("opioionform");
		var purType, orgid;
		var istype, titleText;
		var countersignUsers;
		
		init();
		
		function init() {
			var data = {workitemid :<%=workitemid%>};
			var json = nui.encode(data);
			nui.ajax({
				url : "com.zhonghe.ame.purchase.purchaseItems.queryPurPlanDetail.biz.ext",
				type : 'POST',
				data : json,
				success : function(o) {
					form.setData(o.purPlan);
					nui.get("backTo").setData(o.purPlan.backList);
					var grid_0 = nui.get("grid_0");
					grid_0.load({
						"groupid" : "PurchasePlan",
						"relationid" : o.purPlan.id
					});
					grid_0.sortBy("fileTime", "desc");
					var grid1 = nui.get("datagrid1");
					grid1.load({
						processInstID : o.purPlan.processid
					});
					grid1.sortBy("time", "desc");
					initMisOpinion({
						auditstatus : "1"
					});
					var jsonData = {
						"planId" : o.purPlan.id
					}
					grid.load(jsonData);
					isChangeExcess();
				}
			});
		}
		
		function countersign() {
			selectOmEmployee();
		}
		
       	function selectOmEmployee(){
	    	var btnEdit = this;
	        nui.open({
	            url: "<%=request.getContextPath()%>/contractPact/selectUsers.jsp",
				title : "立项单位经办人",
				width : 430,
				height : 400,
				ondestroy : function(action) {
					console.log(action)
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
							form2.submit();
						}
					}

				}
			});
		}
		

		function isChangeExcess() {
			var newBudgetAmount = nui.get("newBudgetAmount").getValue();
			var budgetAmount = nui.get("budgetAmount").getValue();
			if (budgetAmount != null && newBudgetAmount != null) {
				var excess = math.subtract(newBudgetAmount, budgetAmount)
				nui.get("changeAmount").setValue(excess.toFixed(2));
			}
		}
	
		function unitValue(e) {
			return nui.getDictText("ZH_UNIT", e.value);
		}

		function onYn(e) {
			return nui.getDictText("MIS_YN", e.value);
		}
		
		function submit() {
			var auditstatus = nui.get("auditstatus").getValue();
			if (auditstatus == "2") {
				titleText = "终止";
			} else if (auditstatus == "0") {
				if (!nui.get("backTo").getValue()) {
					showTips("退回环节不能为空！");
					return;
				}
				titleText = "退回";
			} else if (auditstatus == "1") {
				titleText = "提交";
			}
			form2.submit();
		}
		
	    function SaveData(){
	    	saveData();
	    }
	    
		function saveData() {
			nui.confirm("确定" + titleText + "流程吗？", "操作提示", function(action) {
				if (action == "ok") {
					var formData = form.getData();
					formData.files = nui.get("fileids").getValue();
					var misOpinion = opioionform.getData().misOpinion;
					var json = {
						"purPlan" : formData,
						"misOpinion" : misOpinion,
						"workItemID" :<%=workitemid%>,
						"countersignUsers" : countersignUsers
					};
					var msgBoxId = form.loading("正在处理...", "请稍后");
					ajaxCommon({
						url : "com.zhonghe.ame.purchase.purchaseItems.approvalPurPlan.biz.ext",
						data : json,
						success : function(o) {
							nui.unmask(document.body);
							if (o.result == "success") {
								showTips(titleText + "成功", "系统提示")
								closeOk();
							} else {
								showTips("提交失败，请联系信息技术部人员！", "danger")
								closeOk();
							}
						}
					})
				}
			});
		}
	</script>

</body>
</html>