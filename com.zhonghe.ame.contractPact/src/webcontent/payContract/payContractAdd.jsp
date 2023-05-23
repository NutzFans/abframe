<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<style type="text/css">
	body {
		margin: 0;padding: 0;border: 0;width: 100%;height: 100%;overflow: hidden;
	}
</style>
<head>
<title>付费合同签订申请</title>
</head>
<body>
	<div class="nui-fit" style="padding: 5px">
		<fieldset id="field1" style="border: solid 1px #aaa;">
			<legend>付费合同信息</legend>
			<form id="form1" method="post">
				<input name="files" id="fileids" class="nui-hidden" />
				<input class="nui-hidden" name="id" />
				<input name="proAppId" id="proAppId" class="nui-hidden" />
				<div style="padding: 5px;">
					<table style="table-layout: fixed;">
						<tr>
							<td align="right" style="width: 120px">合同名称:</td>
							<td colspan="7">
								<input name="contractName" id="contractName" class="nui-textbox" style="width: 100%" required="true"/>
							</td>
						</tr>
						<tr>
							<td class="form_label" align="right">经办人:</td>
							<td>
								<input name="createUserid" id="createUserid" class="nui-hidden" style="width: 100%" />
								<input id="createUsername" name="createUsername" class="nui-textbox" enabled="false" style="width: 100%" required="true" />
							</td>
							<td align="right" style="width: 120px">合同承办部门:</td>
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
								<input name="signatory" id="custId" class="nui-combobox" required="true" valueField="custid" url="com.zhonghe.ame.payContract.payContract.queryPurSuppliersIsqualified.biz.ext" filterType="like"
									textField="custname" dataField="pursuppliers" valueFromSelect="true" allowInput="true" style="width: 100%;" />
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
								<input name="purchasePlan" id="purchasePlan" class="nui-buttonedit" onbuttonclick="onButtonEdit" style="width: 100%" onvaluechanged="onvaluechanged1" required="false" enabled="false" allowInput="false" />
							</td>
							<td align="right" style="width: 100px">采购方式:</td>
							<td>
								<input id="procurementType" name="procurementType" class="nui-dictcombobox" dictTypeId="ZH_CGFS" style="width: 100%" required="false" enabled="false" />
							</td>
							<td align="right" style="width: 100px">采购计划年份:</td>
							<td>
								<input id="planYear" name="planYear" class="nui-textbox" style="width: 100%" vtype="int" emptyText="数字格式年份，格式：YYYY" required="false" enabled="false" />
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
								<input name="remark" class="nui-textarea" style="width: 100%; height: 235px" />
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
			<div id="datagrid2" class="nui-datagrid" style="width: 100%; height: 200px;" showSummaryRow="true" allowCellEdit="true" allowCellSelect="true" multiSelect="true"
				allowSortColumn="false" showPager="false">
				<div property="columns">
					<div type="checkcolumn"></div>
					<div field="years" width="80" headerAlign="center" allowSort="true">
						年份
						<input property="editor" class="nui-textbox" style="width: 100%;" />
					</div>
					<div field="jan" width="120" headerAlign="center" allowSort="true">
						一月
						<input property="editor" class="nui-textbox" id="jan" style="width: 100%;" />
					</div>
					<div field="feb" width="120" headerAlign="center" allowSort="true">
						二月
						<input property="editor" class="nui-textbox" style="width: 100%;" />
					</div>
					<div field="mar" width="120" headerAlign="center" allowSort="true">
						三月
						<input property="editor" class="nui-textbox" style="width: 100%;" />
					</div>
					<div field="apr" width="120" headerAlign="center" allowSort="true">
						四月
						<input property="editor" class="nui-textbox" style="width: 100%;" />
					</div>
					<div field="may" width="120" headerAlign="center" allowSort="true">
						五月
						<input property="editor" class="nui-textbox" style="width: 100%;" />
					</div>
					<div field="jun" width="120" headerAlign="center" allowSort="true">
						六月
						<input property="editor" class="nui-textbox" style="width: 100%;" />
					</div>
					<div field="jul" width="120" headerAlign="center" allowSort="true">
						七月
						<input property="editor" class="nui-textbox" style="width: 100%;" />
					</div>
					<div field="aug" width="120" headerAlign="center" allowSort="true">
						八月
						<input property="editor" class="nui-textbox" style="width: 100%;" />
					</div>
					<div field="sep" width="120" headerAlign="center" allowSort="true">
						九月
						<input property="editor" class="nui-textbox" style="width: 100%;" />
					</div>
					<div field="oct" width="120" headerAlign="center" allowSort="true">
						十月
						<input property="editor" class="nui-textbox" style="width: 100%;" />
					</div>
					<div field="nov" width="120" headerAlign="center" allowSort="true">
						十一月
						<input property="editor" class="nui-textbox" style="width: 100%;" />
					</div>
					<div field="dec" width="120" headerAlign="center" allowSort="true">
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
	</div>
	
	<form id="opioionform" method="post" style="display: none;">
		<div style="padding: 5px;" id="opinionHide">
			<table style="table-layout: fixed;">
				<tr id="salesEdit">
					<td style="width: 150px;" align="right">审核结果：</td>
					<td style="width: 250px;">
						<input name="misOpinion.auditstatus" id="auditstatus" class="nui-dictradiogroup" style="width: 250px;" required="true" dictTypeId="MIS_AUDITSTATUS" onvaluechanged="show()" value="1" />
					</td>
				</tr>
				<tr>
					<td colspan="3">
						<input name="misOpinion.auditopinion" id="auditopinion" class="nui-hidden" style="width: 600px; height: 40px;" value="" />
					</td>
				</tr>
			</table>
		</div>
	</form>

	<div style="text-align: center; position: relative; bottom: 10px" class="nui-toolbar">
		<a class="nui-button" onclick="onOk(0)" id="saveReimb" iconCls="icon-save" style="width: 80px; margin-right: 20px;">保存</a>
		<a class="nui-button" onclick="onOk(1)" id="creatReimbProcess" iconCls="icon-ok" style="width: 80px; margin-right: 20px;">提交</a>
		<a class="nui-button" onclick="closeCancel()" id="saveReimbProcess" iconCls="icon-close" style="width: 80px; margin-right: 140px;">关闭</a>
	</div>
	
	<script type="text/javascript">
		nui.parse();
		var form = new nui.Form("#form1");
		var grid2 = nui.get("datagrid2");
		var type;
		
		init();
		
		function init() {
			nui.get("createUserid").setValue(userId);
			nui.get("createUsername").setValue(userName);
			nui.get("implementOrg").setValue(userOrgId);
			nui.get("implementOrgname").setValue(userOrgName);
			nui.get("createTime").setValue(new Date());
			//初始化审核意见
			nui.get("auditstatus").setValue(3);//1：通过,0：退回，2：终止流程，3:发起
			document.getElementById("salesEdit").style.display = "none";
		}

		function getOrgs() {
			var a2 = [];
			for ( var p in orglist) {
				a2[p] = orglist[p];
			}
			nui.get("implementOrg").setData(a2);
		}
		
		function changeOrgForm(e) {
			nui.get("implementOrgname").setValue(e.source.text);
		}
						
		function onOk(e) {
			type = e;
			var procurementType = nui.get("procurementType").getValue();
			var contractSum = nui.get("contractSum").getValue();
			var budgetSum = nui.get("budgetSum").getValue();
			var scalingSum = nui.get("scalingSum").getValue();
			var custId = nui.get("custId").getValue();
			var checkResult = "";
			//定义变量接受form表单数据
			if (type == 1) {
				var grid2 = nui.get("datagrid2");
				var payPlans = grid2.getData();
				title = "提交";
				if (!form.validate()) {
					showTips("请检查表单的完整性!", "danger");
					return;
				}
				ajaxCommon({
					"async": false,
					"url" : "com.zhonghe.ame.payContract.payContract.checkCustAndContractSum.biz.ext",
					"data" : nui.encode({'contractSum': contractSum, 'custId': custId}),
					"success" : function(data) {
						checkResult = data.result;
					}
				});
				if(checkResult == "2"){
					alert("当前选择的供货商为四类供货商，根据要求其合同金额不能大于10万");
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
						if(procurementType != "零星采购"){
							var scalingSum = nui.get("scalingSum").getValue();
							if (scalingSum == null || scalingSum == "") {
								alert(" '定标金额' 字段为必填项，数据来源于对应的采购立项评审结果");
								return;
							}
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
						} else if(procurementType != "零星采购"){
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
						if (payPlansJson[i].years == undefined || payPlansJson[i].years == "") {
							showTips("请填写未来年度付款计划中的 '年份' 字段!", "danger");
							return;
						}
					}
				} else {
					showTips("请填写未来年度付款计划!", "danger");
					return;
				}
			}
			nui.get("saveReimb").disable();
			nui.get("creatReimbProcess").disable();
			var data = form.getData();
			document.getElementById("fileCatalog").value = "payContractinfo";
			var filePaths = document.getElementsByName("uploadfile").length;
			for (var j = 0; j < filePaths; j++) {
				var a = document.getElementsByName("remarkList")[j].value;
				if (a == null || a == "") {
					showTips("新增附件不可以为空", "danger");
					nui.get("saveReimb").enable();
					nui.get("creatReimbProcess").enable();
					return;
				}
			}
			form2.submit();
		}

		function SaveData() {
			var form = new nui.Form("#form1");
			var opioionform = new nui.Form("#opioionform");
			var grid2 = nui.get("datagrid2");
			var payPlans = grid2.getData();
			var data = form.getData(), data_opioion = opioionform.getData();
			data.type = type;
			var info = "";
			if (type == 1) {
				info = "是否提交？"
			} else {
				info = "是否暂时保存？"
			}
			data.files = nui.get("fileids").getValue();
			delete data.criteria;
			data.issupagreement = "n";
			var json = nui.encode({
				'cpData' : data,
				"misOpinion" : data_opioion.misOpinion,
				"payPlans" : payPlans
			});
			if (!confirm(info)) {
				nui.get("saveReimb").enable();
				nui.get("creatReimbProcess").enable();
				return;
			} else {
				ajaxCommon({
					"url" : "com.zhonghe.ame.payContract.payContract.addPayContract.biz.ext",
					"data" : json,
					"success" : function(data) {
						if (data.result == "1") {
							if (type == 1) {
								showTips("付费合同提交成功");
								closeOk();
							} else {
								showTips("付费合同保存成功");
								closeOk();
							}
						} else {
							showTips("付费合同提交失败！", "danger");
							nui.get("saveReimb").enable();
							nui.get("creatReimbProcess").enable();
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
											nui.get("scalingSum").setValue(null);
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

		function onFgshqbm(e) {
			nui.get("fDeptCountersignName").setValue(e.source.text)
		}

		function onZbhqbm(e) {
			nui.get("zDeptCountersignName").setValue(e.source.text)
		}

		function onFUseridsValueChanged() {
			nui.get("fDeptCountersignName").setValue(nui.get("fDeptCountersignId").getText());
		}

		function onZUseridsValueChanged() {
			nui.get("zDeptCountersignName").setValue(nui.get("userLookup_multiple1").getText());
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

		function onvaluechanged1() {
			var purchasePlan = nui.get("purchasePlan").getValue();
			if (purchasePlan == null || purchasePlan == "") {
				nui.get("procurementType").setValue();
				nui.get("budgetSum").setValue();
				nui.get("scalingSum").setValue();
			}
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
		});

		grid2.on("cellbeginedit", function(e) {
			if (e.field == "sum") {
				e.cancel = "true";
			}
		});

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