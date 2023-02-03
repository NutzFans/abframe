<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.util.List"%>
<%@page import="commonj.sdo.DataObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@ page import="java.util.Map"%>
<%
	String contextPath = request.getContextPath();
%>
<html>
<head>
	<title>付费合同签订维护 </title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin: 0;padding: 0;border: 0;width: 100%;height: 100%;overflow: hidden;	
	    } 
    </style>
</head>
<body>
	<div class="nui-fit" style="padding: 5px;">
		<fieldset id="field1" style="border: solid 1px #aaa;">
			<legend>付费合同信息</legend>
			<form id="form1" method="post">
				<input name="files" id="fileids" class="nui-hidden" />
				<input class="nui-hidden" name="id" id="payId" />
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
							<td class="form_label" align="right">申请人:</td>
							<td>
								<input name="createUserid" id="createUserid" class="nui-hidden" style="width: 100%" />
								<input id="createUsername" name="createUsername" class="nui-textbox" enabled="false" style="width: 100%" required="true" />
							</td>
							<td align="right" style="width: 120px">合同实施部门:</td>
							<td>
								<input name="implementOrg" id="implementOrg" shownullItem=ture class="nui-treeselect" textField="orgname" valueField="orgid" parentField="omOrganization.orgid" dataField="orgs"
									showTreeIcon="true" valueFromSelect="true" style="width: 100%;" url="com.zhonghe.ame.imptask.keytask.getAllRunOrgsforzdrw.biz.ext" allowInput="true" required="true"
									onvaluechanged="changeOrgForm(e)" multiSelect="false" checkRecursive="false" expandOnLoad="0" showFolderCheckBox="true" />
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
							<td align="right" style="width: 100px" id="purchasePlanLable">采购立项编号:</td>
							<td>
								<input name="purchasePlan" id="purchasePlan" class="nui-buttonedit" onbuttonclick="onButtonEdit" style="width: 100%" allowInput="true" onvaluechanged="onvaluechanged1" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 100px">采购方式:</td>
							<td>
								<input id="procurementType" name="procurementType" class="nui-dictcombobox" dictTypeId="ZH_CGFS" style="width: 100%" required="false" enabled="true" />
							</td>
							<td align="right" style="width: 120px">立项金额(元):</td>
							<td>
								<input name="budgetSum" id="budgetSum" class="nui-textbox" vtype="float" style="width: 100%" required="false" enabled="true" />
							</td>
							<td align="right" style="width: 120px">定标金额(元):</td>
							<td>
								<input name="scalingSum" id="scalingSum" class="nui-textbox" vtype="float" style="width: 100%" required="false" enabled="true" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 120px">合同编号：</td>
							<td>
								<input id="contractNo" name="contractNo" class="nui-textbox" style="width: 100%" required="true" />
							</td>
							<td align="right" style="width: 100px">签订日期：</td>
							<td>
								<input id="signingDate" name="signingDate" class="nui-datepicker" style="width: 100%" required="true" />
							</td>
							</td>
							<td align="right" style="width: 100px">采购计划年份:</td>
							<td>
								<input id="planYear" name="planYear" class="nui-textbox" style="width: 100%" required="false"/>
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 100px">执行状态:</td>
							<td>
								<input id="executeStatus" name="executeStatus" class="nui-dictcombobox" dictTypeId="EXECUTE_STATUS" style="width: 100%" />
							</td>
							<td align="right" style="width: 120px">合同余额(元):</td>
							<td>
								<input name="contractBalance" id="contractBalance" class="nui-textbox" vtype="float" style="width: 100%" />
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

	<div style="text-align: center; position: relative; bottom: 10px" class="nui-toolbar">
		<a class="nui-button" onclick="onOk()" id="creatReimbProcess" style="width: 80px; margin-right: 20px;" iconCls="icon-save">保存</a>
		<a class="nui-button" onclick="onCancel" id="saveReimbProcess" style="width: 80px; margin-right: 140px;" iconCls="icon-close">关闭</a>
	</div>
	
	<script type="text/javascript">
		nui.parse();

		<%
			UserObject user = (UserObject) session.getAttribute("userObject");
			String username = user.getUserName();
			String userno = user.getUserId();
			String userOrgName = user.getUserOrgName();
			String userOrgId = user.getUserOrgId();
			Map<String, Object> a = user.getAttributes();
			String empid = (String) a.get("empid");
			DataObject[] roles = (DataObject[]) a.get("roles");
		%>
		
		var form = new nui.Form("form1");
		var grid2 = nui.get("datagrid2");
		var id = "";
		
		function onOk() {
			//定义变量接受form表单数据
			var form = new nui.Form("#form1");
			form.validate();
			if (form.isValid() == false) {
				showTips("请检查表单的完整性!", "danger");
				return;
			}
			var data = form.getData();
			document.getElementById("fileCatalog").value = "payContractinfo";
			form2.submit();
		}
		
		function SaveData() {
			var form = new nui.Form("#form1");
			var data = form.getData();
			var grid2 = nui.get("datagrid2");
			var payPlans = grid2.getData();
			data.id = nui.get("payId").getValue();
			data.files = nui.get("fileids").getValue();
			var json = nui.encode({
				'data' : data,
				"payPlans" : payPlans
			});
			if (!confirm("是否保存？")) {
				return;
			} else {
				nui.ajax({
					url : "com.zhonghe.ame.payContract.payContract.updatePayContract.biz.ext",
					data : json,
					type : 'POST',
					cache : false,
					contentType : 'text/json',
					success : function(text) {
						if (text.result == 1) {
							showTips("维护成功");
							window.CloseOwnerWindow("save");
						} else {
							showTips("编辑失败", "danger");
						}

					},
					error : function(jqXHR, textStatus, errorThrown) {
						alert(jqXHR.responseText);
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
								nui.ajax({
									"url" : "com.zhonghe.ame.purchase.purchaseReviewReport.queryReviewReport.biz.ext",
									"data" : json,
									"type" : 'POST',
									"cache" : false,
									"contentType" : 'text/json',
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
		
		function setEditData(data) {
			var form = new nui.Form("form1");
			form.setData(data)
			queryPlan(data.id);
			nui.get("implementOrg").setText(data.implementOrgname);
			nui.get("custId").setText(data.signatoryname);
			nui.get("purchasePlan").setText(data.purchasePlan);
			if (nui.get("contractNature").getValue() == 3) {
				$("#purchasePlanLable").html("零星采购编号:");
				nui.get("purchasePlan").setRequired(true);
				nui.get("procurementType").setRequired(true);
				nui.get("budgetSum").setRequired(true);
			}
			if (nui.get("contractNature").getValue() == 1) {
				nui.get("purchasePlan").setRequired(true);
				nui.get("planYear").setRequired(true);
				nui.get("procurementType").setRequired(true);
				nui.get("budgetSum").setRequired(true);
				nui.get("scalingSum").setRequired(true);
			}
			var grid_0 = nui.get("grid_0");
			grid_0.load({
				"groupid" : "PAY_CONTRACT",
				"relationid" : data.id
			});
			grid_0.sortBy("fileTime", "desc");
		}
		
		function onCancel(e) {
			CloseWindow("cancel");
		}
		
		//标准方法接口定义
		function CloseWindow(action) {
			if (window.CloseOwnerWindow)
				return window.CloseOwnerWindow(action);
			else
				window.close();
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
			var sum = jan + feb + mar + apr + may + jun + jul + aug + sep + oct + nov + dec;
			grid2.updateRow(row, {
				sum : sum
			});
		});
		
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
		

		// 提示框
		function showTips(content, state) {
			//  state  default|success|info|warning|danger
			if (state) {
				nui.showTips({
					content : content,
					state : state,
					x : "center",
					y : "center",
					timeout : 3500.
				});
			} else {
				nui.showTips({
					content : content,
					state : "success",
					x : "center",
					y : "center",
					timeout : 3500.
				});
			}
		}
		
		function contractNatureChanged() {
			if (nui.get("contractNature").getValue() == 1) {
				$("#purchasePlanLable").html("采购立项编号:");
				nui.get("purchasePlan").setRequired(true);
				nui.get("purchasePlan").setValue("");
				nui.get("purchasePlan").setText("");
				nui.get("proAppId").setValue("");
				nui.get("procurementType").setRequired(true);
				nui.get("procurementType").setValue("");
				nui.get("planYear").setRequired(true);
				nui.get("planYear").setValue("");
				nui.get("budgetSum").setRequired(true);
				nui.get("budgetSum").setValue("");
				nui.get("scalingSum").setRequired(true);
				nui.get("scalingSum").setValue("");
			} else if (nui.get("contractNature").getValue() == 2) {
				$("#purchasePlanLable").html("采购立项编号:");
				nui.get("purchasePlan").setRequired(false);
				nui.get("purchasePlan").setValue("");
				nui.get("purchasePlan").setText("");
				nui.get("proAppId").setValue("");
				nui.get("procurementType").setRequired(false);
				nui.get("procurementType").setValue("");
				nui.get("planYear").setRequired(false);
				nui.get("planYear").setValue("");
				nui.get("budgetSum").setRequired(false);
				nui.get("budgetSum").setValue("");
				nui.get("scalingSum").setRequired(false);
				nui.get("scalingSum").setValue("");
			} else if (nui.get("contractNature").getValue() == 3) {
				$("#purchasePlanLable").html("零星采购编号:");
				nui.get("purchasePlan").setRequired(true);
				nui.get("purchasePlan").setValue("");
				nui.get("purchasePlan").setText("");
				nui.get("proAppId").setValue("");
				nui.get("procurementType").setRequired(true);
				nui.get("procurementType").setValue("");
				nui.get("planYear").setRequired(false);
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