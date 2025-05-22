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
							<td align="right" style="width: 120px;">计划金额(万元)：</td>
							<td>
								<input id="historyBudgetAmount" name="historyBudgetAmount" class="nui-textbox" style="width: 100%;" enabled="false" />
							</td>
							<td align="right" style="width: 120px;">财务年度预算科目：</td>
							<td>
								<input id="historySubject" name="historySubject" class="nui-textbox" style="width: 100%;" enabled="false" />
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
				<div style="padding: 5px;">
					<table style="table-layout: fixed;">
						<tr>
							<td align="right" style="width: 120px;">采购计划(变更)名称：</td>
							<td colspan="3">
								<input id="name" name="name" class="nui-textbox" required="true" style="width: 100%;" />
							</td>
							<td align="right" style="width: 120px;">提报人姓名：</td>
							<td>
								<input class="nui-textbox" name="infomantUser" id="infomantUser" required="true" style="width: 100%;" readonly="readonly" />
							</td>
							<td align="right" style="width: 120px;">采购单位：</td>
							<td>
								<input id="needOrgName" name="needOrgName" class="nui-textbox" required="true" style="width: 100%;" readonly="readonly" />
								<input id="needOrgId" name="needOrgId" class="nui-hidden" required="true" style="width: 100%;" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 120px;">计划年度：</td>
							<td>
								<input id="year" name="year" style="width: 100%;" class="nui-textbox" style="width:100%;" required="true" readonly="readonly" />
							</td>
							<td align="right" style="width: 100px;">采购类型：</td>
							<td>
								<input class="nui-dictcombobox" name="type" id="type" dictTypeId="ZH_PURCHASE_NEW" required="true" style="width: 100%;" readonly="readonly" />
							</td>
							<td align="right" style="width: 120px;">变更后金额(万元)：</td>
							<td>
								<input id="newBudgetAmount" name="newBudgetAmount" class="nui-textbox" required="true" readOnly="readOnly" style="width: 100%;" />
							</td>
							<td align="right" style="width: 120px;">变更金额(万元)：</td>
							<td>
								<input id="bgBudget" name="bgBudget" class="nui-textbox" style="width: 100%;" required="true" readOnly="readOnly" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 120px;">物项归口部门：</td>
							<td colspan="7">
								<input id="putunder" name="putunder" class="nui-dictcombobox" dictTypeId="ZH_PUTUNDER" multiSelect="true" style="width: 100%;" required="true" readOnly="readOnly" />
							</td>
						</tr>
						<tr>
							<td style="width: 120px;" align="right">变更原因：</td>
							<td colspan="7">
								<input id="changeReason" name="changeReason" class="nui-textarea" style="width: 100%; height: 120px;" required="true" />
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
			<div>
				<div class="nui-toolbar" style="border-bottom: 0; padding: 0px;">
					<table style="width: 100%;">
						<tr>
							<td style="width: 100%;">
								<a class="nui-button" iconCls="icon-add" onclick="selectData()">选择</a>
								<a class="nui-button" iconCls="icon-remove" onclick="removeRow()">删除</a>
							</td>
						</tr>
					</table>
				</div>
			</div>
			<div id="grid_traveldetail" class="nui-datagrid" style="width: 100%; height: auto;" allowCellSelect="true" allowCellwrap="true" showPager="false" allowCellEdit="true" multiSelect="true"
				oncellendedit="getHTZQ" url="com.zhonghe.ame.purchase.purchaseItems.queryPurPlanItem.biz.ext" dataField="purPlanItem">
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
			<legend> 上传相关附件 </legend>
			<jsp:include page="/ame_common/inputFile.jsp" />
		</fieldset>

		<jsp:include page="/ame_common/misOpinion.jsp" />

	</div>

	<div style="text-align: center; position: relative; bottom: 10px" class="nui-toolbar">
		<a class="nui-button" onclick="onOk(0)" id="saveReimb" iconCls="icon-save" style="width: 80px; margin-right: 20px;">保存</a>
		<a class="nui-button" onclick="onOk(1)" id="creatReimbProcess" iconCls="icon-ok" style="width: 80px; margin-right: 20px;">提交</a>
		<a class="nui-button" onclick="onOk(2)" id="zzFeame" iconCls="icon-split" style="width: 80px; margin-right: 20px;">中止</a>
		<a class="nui-button" onclick="closeCancel()" id="saveReimbProcess" iconCls="icon-close" style="width: 80px; margin-right: 140px;">关闭</a>
	</div>

	<script type="text/javascript">
		nui.parse();
		<%long workItemID = (Long) request.getAttribute("workItemID");%>
		var form = new nui.Form("#form1");
		var grid = nui.get("grid_traveldetail");
		var opioionform = new nui.Form("opioionform");
		var istype;

		loadData();

		function loadData() {
			var data = {
				"workItemID" : <%=workItemID%>
			};
			var json = nui.encode(data);
			ajaxCommon({
				"url" : "com.zhonghe.ame.purchase.purchaseplan.getPurPlanByWorkitemId.biz.ext",
				"data" : json,
				"success" : function(o) {
					form.setData(o.data);
					var bgBudget = subFloat(o.data.newBudgetAmount, o.data.budgetAmount);
					nui.get("bgBudget").setValue(bgBudget);
					queryHistory(o.data.oldId);					
					var jsonData = {"planId" : o.data.id};
					grid.load(jsonData);
					//设置审核意见基本信息
					nui.get("processinstid").setValue(o.workitem.processInstID);
					nui.get("processinstname").setValue(o.workitem.processInstName);
					nui.get("activitydefid").setValue(o.workitem.activityDefID);
					nui.get("workitemname").setValue(o.workitem.workItemName);
					nui.get("workitemid").setValue(<%=workItemID%>);
					nui.get("isshow").setValue("1");
					nui.get("auditstatus").setValue(3);
					document.getElementById("salesEdit").style.display = "none";
					nui.get("auditopinion").setValue("");
					
					var grid_0 = nui.get("grid_0");
					grid_0.load({
						"groupid" : "PurchasePlan",
						"relationid" : o.data.id
					});
					grid_0.sortBy("fileTime", "desc");

					nui.get("auditopinion").setValue("");
					//查询审核意见
					var grid1 = nui.get("datagrid1");
					if (o.workitem.processInstID != null || o.workitem.processInstID != "") {
						grid1.load({
							processInstID : o.workitem.processInstID
						});
						grid1.sortBy("time", "desc");
					}
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
		
		function selectData() {
			var planId = nui.get("historyId").getValue();
			mini.open({
				url : "/default/purchase/purchasePlan/selectPlanItem.jsp",
				title : "采购计划 - 物项明细",
				width : '1200',
				height : '610',
				onload : function() { //弹出页面加载完成
					var iframe = this.getIFrameEl();
					var data = {"planId": planId};
					iframe.contentWindow.SetData(data);
				},
				ondestroy : function(action) {
					if (action == "ok") {
						var iframe = this.getIFrameEl();
						var data = iframe.contentWindow.GetData();
						data = mini.clone(data);
						if (data) {
							var tempData = grid.data;
							if(!hasPropertyValue(tempData, "code", data.code)){
								grid.addRow(data);
							}else{
								showTips("变更 - 计划明细中已存在相同数据！", "danger");
							}
						}
					}
				}
			});
		}
		
		function removeRow() {
			var rows = grid.getSelecteds();
			if (rows.length > 0) {
				grid.removeRows(rows, true);
			} else {
				showTips("请至少选中一条记录！", "danger");
			}
			totalAmount();
		}
		
		function getHTZQ(e) {
			var record = e.record;
			if (e.field == "newNumber" || e.field == "onePrice") {
				if (record.newNumber != null && record.onePrice != null) {
					var budgetAmount1 = mulFloat(record.newNumber, record.onePrice).toString();
					grid.updateRow(e.row, {
						newBudgetAmount : budgetAmount1
					});
					totalAmount();
				} else {
					grid.updateRow(e.row, {
						totalPrice : ""
					});
				}
			}
		}
		
		function totalAmount() {
			var tempData = grid.data;
			var a = tempData.length;
			var b = 0;
			var c = 0;
			for (var i = 0; i < a; i++) {
				if (!!tempData[i].newBudgetAmount && tempData[i].newBudgetAmount > 0) {
					b = addFloat(b, tempData[i].newBudgetAmount);
				} else {
					var x = 0;
					b = addFloat(b, x);
				}
				if (!!tempData[i].budgetAmount && tempData[i].budgetAmount > 0) {
					c = addFloat(c, tempData[i].budgetAmount);
				} else {
					var x = 0;
					c = addFloat(c, x);
				}
			}
			var y = subFloat(b, c);
			var historyBudgetAmount = nui.get("historyBudgetAmount").getValue();
			var newBudgetAmount = addFloat(historyBudgetAmount, y);
			var bgBudget = subFloat(newBudgetAmount, historyBudgetAmount);
			nui.get("newBudgetAmount").setValue(newBudgetAmount);
			nui.get("bgBudget").setValue(bgBudget);
			var putunder = getUniqueValuesString(tempData,"centralizedDept");
			nui.get("putunder").setValue(putunder);
		}
		
		function onOk(e) {
			istype = e;
			var info;
			nui.get("auditstatus").setValue("4");
			if (istype == 0) {
				var name = nui.get("name").getValue();
				if (isStrEmpty(name)) {
					showTips("请填写采购计划(变更)名称并保证其正确性！！", "danger");
					return;
				}
				info = "暂存流程表单？"
			} else if (istype == 1) {
				if (!form.validate()) {
					showTips("请检查表单的完整性!", "danger");
					return;
				}
				grid.validate();
				if (grid.isValid() == false) {
					var error = grid.getCellErrors()[0];
					grid.beginEditCell(error.record, error.column);
					showTips("明细数据有错误，请检查!", "danger");
					return;
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
			} else {
				info = "终止流程表单？"
				nui.get("auditstatus").setValue(2);
			}
			document.getElementById("fileCatalog").value = "PurchasePlan";
			
			nui.confirm("确定" + info, "系统提示", function(action) {
				if (action == "ok") {
					nui.get("saveReimb").disable();
					nui.get("creatReimbProcess").disable();
					nui.get("zzFeame").disable();
					nui.mask({el: document.body,cls: 'mini-mask-loading',html: '流程表单提交中...'});
					form2.submit();
				}
			})
		}
		
		function SaveData() {
			setTimeout(function() {
				nui.unmask(document.body);
				var formData = form.getData();
				var gridData = grid.getChanges();
				var data_opioion = opioionform.getData();
				formData.istype = istype;
				formData.files = nui.get("fileids").getValue();
				var json = nui.encode({
					"purPlan" : formData,
					"purPlanItem" : gridData,
					"misOpinion" : data_opioion.misOpinion
				});
				ajaxCommon({
					"url" : "com.zhonghe.ame.purchase.purchaseplan.editPurPlanChange.biz.ext",
					data : json,
					contentType : 'text/json',
					success : function(text) {
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
			}, 2000);		
		}				
		
		function isStrEmpty(obj) {
			if (typeof obj == "undefined" || obj == null || obj == "") {
				return true;
			} else {
				return false;
			}
		}
		
		function getUniqueValuesString(arr, key) {
			const uniqueValues = [...new Set(arr.map(obj => obj[key]))];
			return uniqueValues.join(',');
		}
		
		function hasPropertyValue(arr, key, value) {
		  	return arr.some(obj => obj[key] === value);
		}				

		function unitValue(e) {
			return nui.getDictText("ZH_UNIT", e.value);
		}							
		
	</script>

</body>
</html>