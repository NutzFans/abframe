<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<head>
<title>付费合同签订编辑</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%=request.getContextPath()%>/common/nui/nui.js" type="text/javascript"></script>
<style type="text/css">
	body {
		 margin: 0;padding: 0;border: 0;width: 100%;height: 100%;overflow: hidden;	
	}
</style>
</head>
<body>
	<div class="nui-fit" style="padding: 5px">
		<fieldset id="field1" style="border: solid 1px #aaa;">
			<legend>付费合同信息</legend>
			<form id="form1" method="post">
				<input name="processid" id="processid" class="nui-hidden" />
				<input name="files" id="fileids" class="nui-hidden" />
				<input class="nui-hidden" name="id" />
				<input name="proAppId" id="proAppId" class="nui-hidden" />
				<div style="padding: 5px;">
					<table style="table-layout: fixed;">
						<tr>
							<td align="right" style="width: 120px">合同名称:</td>
							<td colspan="7">
								<input name="contractName" id="contractName" class="nui-textbox" style="width: 100%" required="true" />
							</td>
						</tr>
						<tr>
							<td class="form_label" align="right">经办人:</td>
							<td>
								<input name="createUserid" id="createUserid" class="nui-hidden" style="width: 100%" />
								<input id="createUsername" name="createUsername" class="nui-textbox" enabled="false" style="width: 100%" required="true" />
							</td>
							<td align="right" style="width: 120px">合同实施部门:</td>
							<td>
								<input name="implementOrg" id="implementOrg" shownullItem=ture class="nui-treeselect" textField="orgname" valueField="orgid" parentField="omOrganization.orgid" dataField="orgs"
									showTreeIcon="true" valueFromSelect="true" style="width: 100%;" url="com.zhonghe.ame.imptask.keytask.getAllRunOrgsforzdrw.biz.ext" allowInput="true" required="true"
									onvaluechanged="changeOrgForm(e)" multiSelect="false" checkRecursive="false" expandOnLoad="0" showFolderCheckBox="true" enabled="false" />
								<input name="implementOrgname" id="implementOrgname" class="nui-hidden" readonly="readonly" style="width: 100%" />
							</td>
							<td align="right" style="width: 120px">申请日期:</td>
							<td>
								<input id="createTime" name="createTime" class="nui-datepicker" style="width: 100%" required="true" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 120px">合同类型:</td>
							<td>
								<input name="contractType" id="contractType" class="nui-dictcombobox" dictTypeId="ZH_CONTRACT_TYPE" style="width: 100%" required="true" />
							</td>
							<td align="right" style="width: 100px">标的规模:</td>
							<td>
								<input name="projectSize" id="projectSize" class="nui-textbox" style="width: 100%" required="true" />
							</td>
							<td align="right" style="width: 100px">实施地点:</td>
							<td>
								<input name="projectLocal" id="projectLocal" class="nui-textbox" style="width: 100%" required="true" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 120px">合同金额(元):</td>
							<td>
								<input name="contractSum" id="contractSum" class="nui-textbox" vtype="float" style="width: 100%" required="true" onvaluechanged="onvaluechanged" />
							</td>
							<td align="right" style="width: 120px">合同不含税金额(元):</td>
							<td>
								<input name="noTaxSum" id="noTaxSum" class="nui-textbox" vtype="float" style="width: 100%" required="true" onvaluechanged="onvaluechanged" />
							</td>
							<td align="right" style="width: 120px">税额(元):</td>
							<td>
								<input name="payTax" id="payTax" class="nui-textbox" vtype="float" style="width: 100%" required="true" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 100px">
								<nobr>签约方:</nobr>
							</td>
							<td>
								<input name="signatory" id="custId" class="nui-combobox" required="true" valueField="custid" url="com.primeton.eos.ame_pur.PurSupplier.queryPurSuppliersIsqualified.biz.ext" filterType="like"
									textField="custname" dataField="pursuppliers" valueFromSelect="true" allowInput="true" style="width: 300px;" />
							</td>
							<td align="right" style="width: 100px">合同签约主体:</td>
							<td>
								<input id="contractSubject" name="contractSubject" class="nui-dictcombobox" dictTypeId="ZH_INVOICE_NAME_TYPE" style="width: 100%" required="true" />
							</td>
							<td align="right" style="width: 100px">付款方:</td>
							<td>
								<input id="payer" name="payer" class="nui-dictcombobox" dictTypeId="ZH_INVOICE_NAME_TYPE" style="width: 100%" required="true" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 100px">合同文本密级:</td>
							<td>
								<input id="contractSecretLevel" name="contractSecretLevel" class="nui-dictcombobox" dictTypeId="CONTRACT_SECRET_LEVEL" style="width: 100%" required="true" />
							</td>

							<td align="right" style="width: 100px">项目密级:</td>
							<td>
								<input id="projectSecretLevel" name="projectSecretLevel" class="nui-dictcombobox" dictTypeId="PROJECT_SECRET_LEVEL" style="width: 100%" required="true" />
							</td>
							<td align="right" style="width: 100px">是否为SM协作配套:</td>
							<td>
								<input id="issm" name="issm" class="nui-dictcombobox" dictTypeId="ABF_YESORNO" style="width: 100%" required="true" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 100px">合同价款形式:</td>
							<td>
								<input id="contractPrice" name="contractPrice" class="nui-dictcombobox" dictTypeId="CONTRACT_PRICE" style="width: 100%" required="true" />
							</td>

							<td align="right" style="width: 100px">是否为采购合同:</td>
							<td>
								<input id="contractNature" name="contractNature" class="nui-dictcombobox" dictTypeId="CONTRACT_NATURE" style="width: 100%" required="true" onvaluechanged="contractNatureChanged" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 100px" id="purchasePlanLable">采购立项编号:</td>
							<td>
								<input name="purchasePlan" id="purchasePlan" class="nui-buttonedit" onbuttonclick="onButtonEdit" style="width: 100%" onvaluechanged="onvaluechanged1" required="false" enabled="false" />
							</td>
							<td align="right" style="width: 100px">采购方式:</td>
							<td>
								<input id="procurementType" name="procurementType" class="nui-dictcombobox" dictTypeId="ZH_CGFS" style="width: 100%" required="false" enabled="false" />
							</td>
							<td align="right" style="width: 100px">采购计划年份:</td>
							<td>
								<input id="planYear" name="planYear" class="nui-textbox" style="width: 100%" emptyText="数字格式年份" required="false" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 120px">立项金额(元):</td>
							<td>
								<input name="budgetSum" id="budgetSum" class="nui-textbox" vtype="float" style="width: 100%" required="false" enabled="false"/>
							</td>
							<td align="right" style="width: 120px">定标金额(元):</td>
							<td>
								<input name="scalingSum" id="scalingSum" class="nui-textbox" vtype="float" style="width: 100%" required="false" enabled="false"/>
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 120px">备注:</td>
							<td colspan="5">
								<input name="remark" class="nui-textarea" style="width: 100%" />
							</td>
						</tr>
					</table>
				</div>
			</form>
		</fieldset>
		<fieldset id="field3" style="border: solid 1px #aaa;">
			<legend>未来年度付款计划</legend>
			<div>
				<div class="nui-toolbar" style="border-bottom: 0; padding: 0px;">
					<table style="width: 100%;">
						<tr>
							<td style="width: 100%;">
								<a class="nui-button" iconCls="icon-add" onclick="addRow()" plain="true">增加</a>
								<a class="nui-button" iconCls="icon-remove" onclick="removeRow()" plain="true">删除</a>
								<span style="color: red">(总计应与合同金额一致)</span>
							</td>
						</tr>
					</table>
				</div>
			</div>
			<div id="datagrid2" class="nui-datagrid" style="width: 100%; height: 200px;" allowResize="true" showSummaryRow="true" datafield="data" allowCellEdit="true" allowCellSelect="true" multiSelect="true"
				allowSortColumn="false" showPager="false">
				<div property="columns">
					<div type="checkcolumn"></div>
					<div field="years" width="80" headerAlign="center" allowSort="true">
						年份
						<input property="editor" class="nui-textbox" style="width: 100%;" />
					</div>
					<div field="jan" width="80" headerAlign="center" allowSort="true">
						一月
						<input property="editor" class="nui-textbox" id="jan" style="width: 100%;" />
					</div>
					<div field="feb" width="80" headerAlign="center" allowSort="true">
						二月
						<input property="editor" class="nui-textbox" style="width: 100%;" />
					</div>
					<div field="mar" width="80" headerAlign="center" allowSort="true">
						三月
						<input property="editor" class="nui-textbox" style="width: 100%;" />
					</div>
					<div field="apr" width="80" headerAlign="center" allowSort="true">
						四月
						<input property="editor" class="nui-textbox" style="width: 100%;" />
					</div>
					<div field="may" width="80" headerAlign="center" allowSort="true">
						五月
						<input property="editor" class="nui-textbox" style="width: 100%;" />
					</div>
					<div field="jun" width="80" headerAlign="center" allowSort="true">
						六月
						<input property="editor" class="nui-textbox" style="width: 100%;" />
					</div>
					<div field="jul" width="80" headerAlign="center" allowSort="true">
						七月
						<input property="editor" class="nui-textbox" style="width: 100%;" />
					</div>
					<div field="aug" width="80" headerAlign="center" allowSort="true">
						八月
						<input property="editor" class="nui-textbox" style="width: 100%;" />
					</div>
					<div field="sep" width="80" headerAlign="center" allowSort="true">
						九月
						<input property="editor" class="nui-textbox" style="width: 100%;" />
					</div>
					<div field="oct" width="80" headerAlign="center" allowSort="true">
						十月
						<input property="editor" class="nui-textbox" style="width: 100%;" />
					</div>
					<div field="nov" width="80" headerAlign="center" allowSort="true">
						十一月
						<input property="editor" class="nui-textbox" style="width: 100%;" />
					</div>
					<div field="dec" width="80" headerAlign="center" allowSort="true">
						十二月
						<input property="editor" class="nui-textbox" style="width: 100%;" />
					</div>
					<div field="sum" width="120" headerAlign="center" allowSort="true" summaryType="sum">
						总计
						<input property="editor" class="nui-textbox" style="width: 100%;" />
					</div>

				</div>
			</div>
		</fieldset>
		<fieldset id="field2" style="border: solid 1px #aaa;">
			<legend>上传附件</legend>
			<jsp:include page="/ame_common/inputFile.jsp" />
		</fieldset>
		<jsp:include page="/ame_common/misOpinion.jsp" />
	</div>

	<div style="text-align: center; padding: 10px; border-width: 1px 0px 0px 0px;" class="nui-toolbar">
		<a class="nui-button" onclick="onOk(0)" id="saveReimb" iconCls="icon-save" style="width: 80px; margin-right: 20px;">保存</a>
		<a class="nui-button" onclick="onOk(1)" id="creatReimbProcess" iconCls="icon-ok" style="width: 80px; margin-right: 20px;">提交</a>
		<a class="nui-button" onclick="onOk(2)" id="zzReimb" iconCls="icon-split" style="width: 80px; margin-right: 20px;">中止</a>
		<a class="nui-button" onclick="closeCancel()" id="saveReimbProcess" iconCls="icon-close" style="width: 80px; margin-right: 0px">关闭</a>
	</div>
	
	<script type="text/javascript">
		nui.parse();	
		<%
			long workItemID = (Long) request.getAttribute("workItemID");
		%>
		var form = new nui.Form("form1");
		var grid2 = nui.get("datagrid2");
		var type;
		
		function onOk(e) {
			type = e;
			//定义变量接受form表单数据
			var form = new nui.Form("#form1");
			if (type == 1) {
				var grid2 = nui.get("datagrid2");
				var payPlans = grid2.getData();
				title = "提交";
				if (!form.validate()) {
					showTips("请检查表单的完整性!", "danger");
					return;
				}
				if (nui.get("contractNature").getValue() == 1) {
					var procurementType = nui.get("procurementType").getValue();
					if (procurementType == null || procurementType == "") {
						alert(" '采购方式' 字段为必填项，数据来源于对应的采购立项");
						return;
					} else {
						var budgetSum = nui.get("budgetSum").getValue();
						if (budgetSum == null || budgetSum == "") {
							alert(" '立项金额' 字段为必填项，数据来源于对应的采购立项");
							return;
						}
						var scalingSum = nui.get("scalingSum").getValue();
						if (scalingSum == null || scalingSum == "") {
							alert(" '定标金额' 字段为必填项，数据来源于对应的采购立项评审结果");
							return;
						}
						var contractSum = nui.get("contractSum").getValue();
						abs = function(val) {
							var str = (val).toFixed(2) + '';
							var intSum = str.substring(0, str.indexOf(".")).replace(/\B(?=(?:\d{3})+$)/g, '');
							var dot = str.substring(str.length, str.indexOf("."))
							var ret = intSum + dot;
							return ret;
						}
						var contractSumAbs = abs(contractSum * 1);
						var scalingSumAbs = abs(scalingSum * 1);
						if (procurementType == "公开招标") {
							if (contractSumAbs != scalingSumAbs) {
								alert("采购方式是招标，合同金额等于定标金额才能提交");
								return;
							}
						} else {
							if (parseInt(contractSumAbs) > parseInt(scalingSumAbs)) {
								alert("采购方式是招标以外的，合同金额应小于等于定标金额才能提交");
								return;
							}
						}
					}
				}
				if (nui.get("contractNature").getValue() == 3) {
					var budgetSum = nui.get("budgetSum").getValue();
					if (budgetSum == null || budgetSum == "") {
						alert(" '立项金额' 字段为必填项，数据来源于对应的零星采购");
						return;
					}
				}
				if (payPlans.length > 0) {
					var payPlansStr = JSON.stringify(payPlans);
					var payPlansJson = JSON.parse(payPlansStr);
					for (var i = 0; i < payPlansJson.length; i++) {
						if (payPlansJson[i].years == undefined) {
							showTips("请填写未来年度付款计划中的 '年份' 字段!", "danger");
							return;
						}
					}
				} else {
					showTips("请填写未来年度付款计划!", "danger");
					return;
				}
			}
			var filePaths = document.getElementsByName("uploadfile").length;
			for (var j = 0; j < filePaths; j++) {
				var a = document.getElementsByName("remarkList")[j].value;
				if (a == null || a == "") {
					showTips("新增附件不可以为空", "danger");
					return;
				}
			}
			nui.get("saveReimb").disable();
			nui.get("creatReimbProcess").disable();
			nui.get("zzReimb").disable();
			var data = form.getData();
			document.getElementById("fileCatalog").value = "payContractinfo";
			form2.submit();
		}

		function SaveData() {
			var form = new nui.Form("#form1");
			var data = form.getData();
			var grid2 = nui.get("datagrid2");
			var payPlans = grid2.getData();
			var info = "";
			data.type = type;
			if (type == 1) {
				info = "是否提交？"
			} else if (type == 0) {
				info = "是否暂时保存？"
			} else {
				info = "是否中止流程？"
				nui.get("auditstatus").setValue(2);
			}
			var data_opioion = opioionform.getData();
			data.files = nui.get("fileids").getValue();
			var json = nui.encode({
				"cpData" : data,
				"misOpinion" : data_opioion.misOpinion,
				"type" : type,
				"payPlans" : payPlans
			});
			if (!confirm(info)) {
				nui.get("saveReimb").enable();
				nui.get("creatReimbProcess").enable();
				nui.get("zzReimb").enable();
				nui.get("auditstatus").setValue("4");
				return;
			} else {
				ajaxCommon({
					"url" : "com.zhonghe.ame.payContract.payContract.editPayContract.biz.ext",
					"data" : json,
					"success" : function(data) {
						if (data.result == "1") {
							if (type == 1) {
								showTips("付费合同提交成功")
								closeOk();
							} else if (type == 0) {
								showTips("付费合同暂时保存成功")
								closeOk();
							} else {
								showTips("中止成功")
								closeOk();
							}
						} else {
							showTips("付费合同提交失败")
							nui.get("saveReimb").enable();
							nui.get("creatReimbProcess").enable();
							nui.get("zzReimb").enable();
						}
					}
				});
			}
		}

		function onButtonEdit(e) {
			var btnEdit = this;
			if (nui.get("contractNature").getValue() == 1) {
				mini.open({
					url : "/default/contractPact/payContract/procurementPlanList.jsp",
					title : "采购立项列表",
					width : '80%',
					height : '80%',
					ondestroy : function(action) {
						if (action == "ok") {
							var iframe = this.getIFrameEl();
							var data = iframe.contentWindow.GetData();
							data = mini.clone(data); //必须
							if (data) {
								btnEdit.setValue(data.proAppCode);
								btnEdit.setText(data.proAppCode);
								var budgetSum = data.proAppApplyPrice;
								abs = function(val) {
									var str = (val).toFixed(2) + '';
									var intSum = str.substring(0, str.indexOf(".")).replace(/\B(?=(?:\d{3})+$)/g, '');
									var dot = str.substring(str.length, str.indexOf("."))
									var ret = intSum + dot;
									return ret;
								}
								nui.get("budgetSum").setValue("");
								if (budgetSum != null && budgetSum != "") {
									nui.get("budgetSum").setValue(abs(budgetSum * 10000));
								}
								nui.get("proAppId").setValue(data.id);
								nui.get("procurementType").setValue("");
								nui.get("procurementType").setValue(data.purchasMode);
								btnEdit.doValueChanged();
								var json = {
									"critria" : {
										"_entity" : "com.zhonghe.ame.contractPact.frameAgreement.ZhAgreementEntity",
										"_expr" : [ {
											"proAppCode" : data.proAppCode,
											"_op" : "like"
										} ]
									}
								}
								ajaxCommon({
									"url" : "com.zhonghe.ame.purchase.purchaseReviewReport.queryReviewReport.biz.ext",
									"data" : json,
									"success" : function(data) {
										if (data.reviewReport.length != 0) {
											var awardAmount = data.reviewReport[0].awardAmount;
											nui.get("scalingSum").setValue("");
											if (awardAmount != null && awardAmount != "") {
												nui.get("scalingSum").setValue(abs(awardAmount * 10000));
											}
										} else {
											console.log("未找到对应的评审结果");
										}
									}
								});
							}
						}
					}
				});
			} else if (nui.get("contractNature").getValue() == 3) {
				mini.open({
					url : "/default/contractPact/payContract/purZeroPlanList.jsp",
					title : "零星采购列表",
					width : '80%',
					height : '80%',
					ondestroy : function(action) {
						if (action == "ok") {
							var iframe = this.getIFrameEl();
							var data = iframe.contentWindow.GetData();
							data = mini.clone(data); //必须
							if (data) {
								btnEdit.setValue(data.purchaseCode);
								btnEdit.setText(data.purchaseCode);
								var budgetSum = data.totalAmount;
								abs = function(val) {
									var str = (val).toFixed(2) + '';
									var intSum = str.substring(0, str.indexOf(".")).replace(/\B(?=(?:\d{3})+$)/g, '');
									var dot = str.substring(str.length, str.indexOf("."))
									var ret = intSum + dot;
									return ret;
								}
								nui.get("budgetSum").setValue("");
								if (budgetSum != null && budgetSum != "") {
									nui.get("budgetSum").setValue(abs(budgetSum * 10000));
								}
								nui.get("proAppId").setValue(data.id);
								nui.get("procurementType").setValue("零星采购");
								btnEdit.doValueChanged();
							}
						}
					}
				});
			}
		}

		loadData();

		function loadData() {
			//流程提示信息
			var data = {workItemID :<%=workItemID %>};
			var json=nui.encode(data);
			nui.ajax({
				url : "com.zhonghe.ame.payContract.payContract.getPayContract.biz.ext",
				type : "post",
				data : json,
				contentType : "text/json",
				success : function(o) {
					//付款申请基本信息
					form.setData(o.payContract);
					queryPlan(o.payContract.id);
					nui.get("purchasePlan").setText(o.payContract.purchasePlan);
					if (nui.get("contractNature").getValue() == 3) {
						$("#purchasePlanLable").html("零星采购编号:");
						nui.get("purchasePlan").setRequired(true);
						nui.get("purchasePlan").enable();
					}else if(nui.get("contractNature").getValue() == 1){
						$("#purchasePlanLable").html("采购立项编号:");
						nui.get("purchasePlan").setRequired(true);
						nui.get("purchasePlan").enable();
						nui.get("planYear").setRequired(true);
						nui.get("planYear").enable();	
					}
					//附件查询
					var grid_0 = nui.get("grid_0");
					grid_0.load({
						"groupid" : "PAY_CONTRACT",
						"relationid" : o.payContract.id
					});
					grid_0.sortBy("fileTime", "desc");
					//设置审核意见基本信息
					nui.get("processinstid").setValue(o.workitem.processInstID);
					nui.get("processinstname").setValue(o.workitem.processInstName);
					nui.get("activitydefid").setValue(o.workitem.activityDefID);
					nui.get("workitemname").setValue(o.workitem.workItemName);
					nui.get("workitemid").setValue(<%=workItemID %>);
					nui.get("isshow").setValue("1");
					nui.get("auditstatus").setValue("4");
					document.getElementById("salesEdit").style.display = "none";
					nui.get("auditopinion").setValue("");
					//查询审核意见
					var grid = nui.get("datagrid1");
					if (o.workitem.processInstID != null || o.workitem.processInstID != "") {
						grid.load({
							processInstID : o.workitem.processInstID
						});
						grid.sortBy("time", "desc");
					}

				},
				error : function() {
				}
			});
		}
		
		function onFgshqbm(e) {
			nui.get("fDeptCountersignName").setValue(e.source.text)
		}
		
		function onZbhqbm(e) {
			nui.get("zDeptCountersignName").setValue(e.source.text)
		}
		
		//值改变的时候
		function onFUseridsValueChanged() {
			nui.get("fDeptCountersignName").setValue(nui.get("fDeptCountersignId").getText());
		}
		
		function queryPlan(str) {
			nui.ajax({
				url : "com.zhonghe.ame.chargeContract.chargeContract.queryPlan.biz.ext",
				type : "post",
				contentType : 'text/json',
				data : {
					"payId" : str
				},
				success : function(data) {
					grid2.setData(data.data);
				}
			})
		}
		
		function addRow() {
			var newRow = {
				name : "New Row"
			};
			var jan = 0;
			var feb = 0;
			var mar = 0;
			var apr = 0;
			var may = 0;
			var jun = 0;
			var jul = 0;
			var aug = 0;
			var sep = 0;
			var oct = 0;
			var nov = 0;
			var dec = 0;
			var sum = 0;
			newRow = {
				jan : jan,
				feb : feb,
				mar : mar,
				apr : apr,
				may : may,
				jun : jun,
				jul : jul,
				aug : aug,
				sep : sep,
				oct : oct,
				nov : nov,
				dec : dec,
				sum : sum
			};
			var l = grid2.getData().length;
			grid2.addRow(newRow, l + 1);
		}
		
		function removeRow() {
			var rows = grid2.getSelecteds();
			if (rows.length > 0) {
				grid2.removeRows(rows, true);
			}
		}
		
		function onvaluechanged() {
			var contractSum = nui.get("contractSum").getValue();
			var noTaxSum = nui.get("noTaxSum").getValue();
			abs = function(val) {
				var str = (val).toFixed(2) + '';
				var intSum = str.substring(0, str.indexOf(".")).replace(/\B(?=(?:\d{3})+$)/g, '');
				var dot = str.substring(str.length, str.indexOf("."))
				var ret = intSum + dot;
				return ret;
			}
			nui.get("payTax").setValue(abs(contractSum - noTaxSum));
		}
		
		grid2.on("cellendedit", function(e) {
			var row = e.row;
			var jan = row.jan * 1;
			var feb = row.feb * 1;
			var mar = row.mar * 1;
			var apr = row.apr * 1;
			var may = row.may * 1;
			var jun = row.jun * 1;
			var jul = row.jul * 1;
			var aug = row.aug * 1;
			var sep = row.sep * 1;
			var oct = row.oct * 1;
			var nov = row.nov * 1;
			var dec = row.dec * 1;
			var sum = (jan + feb + mar + apr + may + jun + jul + aug + sep + oct + nov + dec).toFixed(2);
			grid2.updateRow(row, {
				sum : sum
			});
		})
		
		grid2.on("cellbeginedit", function(e) {
			if (e.field == "sum") {
				e.cancel = "true";
			}
		});
		
		function onvaluechanged1() {
			var purchasePlan = nui.get("purchasePlan").getValue();
			if (purchasePlan == null || purchasePlan == "") {
				nui.get("procurementType").setValue();
				nui.get("budgetSum").setValue();
				nui.get("scalingSum").setValue();
			}
		}
		
		function contractNatureChanged() {
			if (nui.get("contractNature").getValue() == 1) {
				$("#purchasePlanLable").html("采购立项编号:");
				nui.get("purchasePlan").setRequired(true);
				nui.get("purchasePlan").enable();
				nui.get("purchasePlan").setValue("");
				nui.get("purchasePlan").setText("");
				nui.get("proAppId").setValue("");
				nui.get("procurementType").setRequired(true);
				nui.get("procurementType").setValue("");
				nui.get("planYear").setRequired(true);
				nui.get("planYear").enable();
				nui.get("planYear").setValue("");
				nui.get("budgetSum").setRequired(true);
				nui.get("budgetSum").setValue("");
				nui.get("scalingSum").setRequired(true);
				nui.get("scalingSum").setValue("");
			} else if (nui.get("contractNature").getValue() == 2) {
				$("#purchasePlanLable").html("采购立项编号:");
				nui.get("purchasePlan").setRequired(false);
				nui.get("purchasePlan").disable();
				nui.get("purchasePlan").setValue("");
				nui.get("purchasePlan").setText("");
				nui.get("proAppId").setValue("");
				nui.get("procurementType").setRequired(false);
				nui.get("procurementType").setValue("");
				nui.get("planYear").setRequired(false);
				nui.get("planYear").disable();
				nui.get("planYear").setValue("");
				nui.get("budgetSum").setRequired(false);
				nui.get("budgetSum").setValue("");
				nui.get("scalingSum").setRequired(false);
				nui.get("scalingSum").setValue("");
			} else if (nui.get("contractNature").getValue() == 3) {
				$("#purchasePlanLable").html("零星采购编号:");
				nui.get("purchasePlan").setRequired(true);
				nui.get("purchasePlan").enable();
				nui.get("purchasePlan").setValue("");
				nui.get("purchasePlan").setText("");
				nui.get("proAppId").setValue("");
				nui.get("procurementType").setRequired(true);
				nui.get("procurementType").setValue("");
				nui.get("planYear").setRequired(false);
				nui.get("planYear").disable();
				nui.get("planYear").setValue("");
				nui.get("budgetSum").setRequired(true);
				nui.get("budgetSum").setValue("");
				nui.get("scalingSum").setRequired(false);
				nui.get("scalingSum").setValue("");
			}
		}		
	</script>
</body>
</html>