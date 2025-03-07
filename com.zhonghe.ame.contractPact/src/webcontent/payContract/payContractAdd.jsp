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
				<input name="organizer" id="organizer" class="nui-hidden" value="0">
				<div style="padding: 5px;">
					<table style="table-layout: fixed;">
						<tr>
							<td align="right" style="width: 120px">合同名称:</td>
							<td colspan="3">
								<input name="contractName" id="contractName" class="nui-textbox" style="width: 100%" required="true"/>
							</td>
							<td align="right" style="width: 120px">申请日期:</td>
							<td>
								<input id="createTime" name="createTime" class="nui-datepicker" style="width: 100%" required="true" enabled="false" />
							</td>
						</tr>
						<tr>
							<td class="form_label" align="right">经办人:</td>
							<td>
								<input name="createUserid" id="createUserid" class="nui-hidden" style="width: 100%" />
								<input id="createUsername" name="createUsername" class="nui-textbox" enabled="false" style="width: 100%" required="true" />
							</td>
							<td align="right" style="width: 120px">合同承办单位:</td>
							<td>
								<input name="secondaryOrg" id="secondaryOrg" class="nui-hidden" style="width: 300px;" />
								<input name="secondaryOrgname" id="secondaryOrgname" class="nui-textbox" enabled="false" style="width: 100%" required="true" />
							</td>
							<td align="right" style="width: 120px">合同承办部门:</td>
							<td>
								<input name="implementOrg" id="implementOrg" class="nui-hidden" style="width: 300px;" />
								<input name="implementOrgname" id="implementOrgname" class="nui-textbox" enabled="false" style="width: 100%" required="true" />
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
							<td align="right" style="width: 130px">签约方：</td>
							<td colspan="3">
								<span class="mini-buttonedit-border" style="padding-left: 0px; padding-right: 0px">
									<input name="custInfo" id="custInfo" class="nui-textboxlist" style="width: 515px" dataField="purSuppliers" url="com.zhonghe.ame.payContract.payContract.queryPurSuppliersByNameInfo.biz.ext"
										valueField="custid" textField="custname" allowInput="false" />
									<span class="mini-buttonedit-buttons">
										<span class="mini-buttonedit-close"></span>
										<span class="mini-buttonedit-button" onclick="selectCustInfo()" onmouseover="mini.addClass(this, 'mini-buttonedit-button-hover');"
											onmouseout="mini.removeClass(this, 'mini-buttonedit-button-hover');">
											<span class="mini-buttonedit-icon"></span>
										</span>
									</span>
								</span>
							</td>
							<td align="right" style="width: 100px">合同签约主体:</td>
							<td>
								<input id="contractSubject" name="contractSubject" class="nui-dictcombobox" dictTypeId="ZH_INVOICE_NAME_TYPE" style="width: 100%" required="true" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 100px">付款方:</td>
							<td>
								<input id="payer" name="payer" class="nui-dictcombobox" dictTypeId="ZH_INVOICE_NAME_TYPE" style="width: 100%" required="true" />
							</td>
							<td align="right" style="width: 100px">合同文本密级:</td>
							<td>
								<input id="contractSecretLevel" name="contractSecretLevel" class="nui-dictcombobox" dictTypeId="CONTRACT_SECRET_LEVEL" style="width: 100%" required="true" />
							</td>

							<td align="right" style="width: 100px">项目密级:</td>
							<td>
								<input id="projectSecretLevel" name="projectSecretLevel" class="nui-dictcombobox" dictTypeId="PROJECT_SECRET_LEVEL" style="width: 100%" required="true" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 100px">是否为SM协作配套:</td>
							<td>
								<input id="issm" name="issm" class="nui-dictcombobox" dictTypeId="ABF_YESORNO" style="width: 100%" required="true" />
							</td>
							<td align="right" style="width: 100px">合同价款形式:</td>
							<td>
								<input id="contractPrice" name="contractPrice" class="nui-dictcombobox" dictTypeId="CONTRACT_PRICE" style="width: 100%" required="true" />
							</td>
							<td align="right" style="width: 100px">完成日期:</td>
							<td>
								<input id="finishTime" name="finishTime" class="nui-datepicker" style="width: 100%" required="true" emptyText="合同执行完成日期（预估）" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 100px">是否为采购合同:</td>
							<td>
								<input id="contractNature" name="contractNature" class="nui-dictcombobox" dictTypeId="CONTRACT_NATURE" style="width: 100%" required="true" onvaluechanged="contractNatureChanged" />
							</td>
							<td align="right" style="width: 100px" id="purchasePlanLable">采购立项编号:</td>
							<td>
								<input name="purchasePlan" id="purchasePlan" class="nui-buttonedit" onbuttonclick="onButtonEdit" style="width: 100%" onvaluechanged="onvaluechanged1" required="false" enabled="false" allowInput="false" />
							</td>
							<td align="right" style="width: 100px">采购方式:</td>
							<td>
								<input id="procurementType" name="procurementType" class="nui-dictcombobox" dictTypeId="ZH_CGFS" style="width: 100%" required="false" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 100px">采购计划年份:</td>
							<td>
								<input id="planYear" name="planYear" class="nui-textbox" style="width: 100%" vtype="int" emptyText="数字格式年份，格式：YYYY" required="false" enabled="false" />
							</td>
							<td align="right" style="width: 120px" id="budgetSumLable">立项金额(元):</td>
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
		
		$("input[name='custInfo']").parent("td").attr("style", "border: 0px; background: #FFFFE6;")
		
		init();
		
		function init() {
			getSecOrg(userOrgId);
			nui.get("createUserid").setValue(userId);
			nui.get("createUsername").setValue(userName);
			nui.get("implementOrg").setValue(userOrgId);
			nui.get("implementOrgname").setValue(userOrgName);
			nui.get("createTime").setValue(new Date());
			//初始化审核意见
			nui.get("auditstatus").setValue(3);//1：通过,0：退回，2：终止流程，3:发起
			document.getElementById("salesEdit").style.display = "none";
		}
		
		function getSecOrg(userOrgId){
			var json = nui.encode({'userOrgId' : userOrgId});
			ajaxCommon({
				url : "com.primeton.eos.common.orgUtils.getSecOrg.biz.ext",
				data : json,
				success : function(result) {
					var data = result.data;
					nui.get("secondaryOrg").setValue(data.ORGID);
					nui.get("secondaryOrgname").setValue(data.ORGNAME);
				}
			});
		}		
						
		function onOk(e) {
			type = e;
			var procurementType = nui.get("procurementType").getValue();
			var contractSum = nui.get("contractSum").getValue();
			var budgetSum = nui.get("budgetSum").getValue();
			var scalingSum = nui.get("scalingSum").getValue();
			var custId = nui.get("custInfo").getValue();
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
						if (isNotNum(payPlansJson[i].years)) {
							showTips("请填写未来年度付款计划中的 ‘年份’ 字段（格式为数字）", "danger");
							return;
						}
						if (isNotNum(payPlansJson[i].jan) || isNotNum(payPlansJson[i].feb) || isNotNum(payPlansJson[i].mar) || isNotNum(payPlansJson[i].apr)
								|| isNotNum(payPlansJson[i].may) || isNotNum(payPlansJson[i].jun) || isNotNum(payPlansJson[i].jul)
								|| isNotNum(payPlansJson[i].aug) || isNotNum(payPlansJson[i].sep) || isNotNum(payPlansJson[i].oct)
								|| isNotNum(payPlansJson[i].nov) || isNotNum(payPlansJson[i].dec)) {
							mini.alert("付款计划中各月份付款值必须为数字且不允许为空（月份无收款请填充数字0）");
							return;
						}
					}
					var years = [...new Set(payPlansJson.map(item => item.years))];
					if (years.length !== payPlansJson.length) {
						showTips("未来年度付款计划年份重复，一个年份一行数据", "danger");
						return;
					}
				} else {
					showTips("请填写未来年度付款计划!", "danger");
					return;
				}
				// 已上传的文件数量
				var gridFileCount = nui.get("grid_0").getData().length;
				if(gridFileCount == 0){
					// 刚新增(未上传)的文件数量
					var newFileCount = document.getElementsByName("uploadfile").length;
					if(newFileCount == 0){
						showTips("请上传相关附件", "danger");
						return;
					}
				}				
			}
			if (type == 0) {
				var contractName = nui.get("contractName").getValue();
				if (isStrEmpty(contractName)) {
					showTips("请填写合同名称并确保其正确性！", "danger");
					return;
				}
			}
			nui.get("saveReimb").disable();
			nui.get("creatReimbProcess").disable();
			document.getElementById("fileCatalog").value = "payContractinfo";
			form2.submit();
		}

		function SaveData() {
			var form = new nui.Form("#form1");
			var opioionform = new nui.Form("#opioionform");
			var grid2 = nui.get("datagrid2");
			var payPlans = grid2.getData();
			var data = form.getData();
			data.signatory = nui.get("custInfo").getValue();
			data.signatoryName = nui.get("custInfo").getText();
			var data_opioion = opioionform.getData();
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
			nui.get("organizer").setValue("0");
			if (nui.get("contractNature").getValue() == 1 || nui.get("contractNature").getValue() == 4) {
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
								if(data.type ==="2"){
									nui.get("organizer").setValue("1");
								}
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
										},{"status": "2", "_op": "="}]
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
			var jan = "0";
			var feb = "0";
			var mar = "0";
			var apr = "0";
			var may = "0";
			var jun = "0";
			var jul = "0";
			var aug = "0";
			var sep = "0";
			var oct = "0";
			var nov = "0";
			var dec = "0";
			var sum = "0";
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
			var jan = Number(row.jan);
			var feb = Number(row.feb);
			var mar = Number(row.mar);
			var apr = Number(row.apr);
			var may = Number(row.may);
			var jun = Number(row.jun);
			var jul = Number(row.jul);
			var aug = Number(row.aug);
			var sep = Number(row.sep);
			var oct = Number(row.oct);
			var nov = Number(row.nov);
			var dec = Number(row.dec);
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
			nui.get("organizer").setValue("0");
			if (nui.get("contractNature").getValue() == 1) {
				$("#purchasePlanLable").html("采购立项编号:");
				$("#budgetSumLable").html("立项金额(元):");
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
				$("#budgetSumLable").html("立项金额(元):");
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
				$("#budgetSumLable").html("零采金额(元):");
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
				nui.get("budgetSum").setRequired(false);
				nui.get("budgetSum").setValue("");
				nui.get("scalingSum").setRequired(false);
				nui.get("scalingSum").setValue("");
			} else if (nui.get("contractNature").getValue() == 4) {
				$("#purchasePlanLable").html("采购立项编号:");
				$("#budgetSumLable").html("立项金额(元):");
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
				nui.get("scalingSum").setRequired(false);
				nui.get("scalingSum").setValue("");
			}
		}
		
		function isNotNum(data) {
			if (data == "") {
				return true;
			}
			var num = Number(data);
			var numStr = num + "";
			console.log(numStr)
			if (numStr == "NaN") {
				return true;
			} else {
				return false;
			}
		}

		function isStrEmpty(obj) {
			if (typeof obj == "undefined" || obj == null || obj == "") {
				return true;
			} else {
				return false;
			}
		}
		
		function selectCustInfo() {
			mini.open({
				url : "/default/contractPact/payContract/selectPurSupplierInfo.jsp",
				title : "选择签约方",
				width : '500',
				height : '530',
				ondestroy : function(action) {
					if (action == "ok") {
						var iframe = this.getIFrameEl();
						var data = iframe.contentWindow.GetData();
						data = mini.clone(data); //必须
						var custid = nui.get("custInfo").getValue();
						var custname = nui.get("custInfo").getText();
						if (custid != "" && custname != "") {
							custid = custid + "," + data.custid;
							custname = custname + "," + data.custname;
						} else {
							custid = data.custid;
							custname = data.custname;
						}
						nui.get("custInfo").setValue("" + custid + "");
						nui.get("custInfo").setText("" + custname + "");
					}
				}
			});
		}				
		
	</script>
</body>
</html>