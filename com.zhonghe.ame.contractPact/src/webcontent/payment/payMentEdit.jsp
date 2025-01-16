<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<head>
<title>发起付款流程</title>
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
	<div class="nui-fit">
		<fieldset id="field1" style="border: solid 1px #aaa; padding: 3px; width: 98%;">
			<legend>发起付款流程信息</legend>
			<form id="form1" method="post">
				<input name="files" id="fileids" class="nui-hidden" />
				<input id="payMentId" class="nui-hidden" name="id" />
				<input class="nui-hidden" name="processid" />
				<input id="payId" name="payId" class="nui-hidden" />
				<div style="padding: 1px;">
					<table style="table-layout: fixed;">
						<tr>
							<td class="form_label" align="right">申请人</td>
							<td>
								<input name="createUserid" id="createUserid" class="nui-hidden" />
								<input id="createUsername" name="createUsername" class="nui-textbox" enabled="false" style="width: 300px" required="true" />
							</td>
							<td align="right" style="width: 160px">申请部门：</td>
							<td>
								<input name="createdOrgid" id="createdOrgid" class="nui-hidden" style="width: 300px;" />
								<input name="implementOrgname" id="implementOrgname" class="nui-textbox" enabled="false" style="width: 300px" required="true" />
							</td>
							<td align="right" style="width: 160px">申请日期：</td>
							<td>
								<input id="createTime" name="createTime" class="nui-datepicker" style="width: 300px" enabled="false"/>
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 160px">合同编号：</td>
							<td>
								<input id="contractId" name="contractId" class="nui-buttonedit" onbuttonclick="onButtonEdit" style="width: 300px" required="true" enabled="true" allowInput="false" />
							</td>
							<td align="right" style="width: 160px">合同名称：</td>
							<td colspan="6">
								<input id="contractName" name="contractName" class="nui-textbox" style="width: 100%" required="true" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 160px">合同性质：</td>
							<td>
								<input id="contractNature" name="contractNature" class="nui-dictcombobox" dictTypeId="CONTRACT_NATURE" style="width: 100%" required="true" enabled="false" />
							</td>

							<td align="right" style="width: 160px">合同类型：</td>
							<td>
								<input id="contractType" name="contractType" class="nui-dictcombobox" dictTypeId="ZH_CONTRACT_TYPE" style="width: 100%" required="true" enabled="false" />
							</td>

							<td align="right" style="width: 160px">付款方：</td>
							<td>
								<input id="payer" name="payer" class="nui-dictcombobox" dictTypeId="ZH_INVOICE_NAME_TYPE" style="width: 100%" required="true" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 160px">合同金额(元)：</td>
							<td>
								<input id="contractSum" name="contractSum" class="nui-textbox" style="width: 300px" required="true" enabled="false" />
							</td>
							<td align="right" style="width: 160px">累计已付金额(元)：</td>
							<td>
								<input id="paidContractSum" name="paidContractSum" class="nui-textbox" style="width: 300px" required="false" enabled="false" />
							</td>
							<td align="right" style="width: 160px">本次支付金额(元)：</td>
							<td>
								<input id="applyPayContractSum" name="applyPayContractSum" class="nui-textbox" style="width: 300px" required="true" />
							</td>

						</tr>
						<tr>
							<td align="right" style="width: 160px">发票类型：</td>
							<td>
								<input id="invoiceType" name="invoiceType" class="nui-dictcombobox" dictTypeId="MIS_MA_INVOICETYPE" style="width: 300px" required="true" enabled="true" />
							</td>
							<td align="right" style="width: 160px">本次付款进度：</td>
							<td>
								<input id="payType" name="payType" class="nui-dictcombobox" dictTypeId="payType" style="width: 300px" required="true" enabled="true" />
							</td>
							<td align="right" style="width: 160px">最晚付款日期：</td>
							<td>
								<input id="endTime" name="endTime" class="nui-datepicker" style="width: 300px" required="true" />
							</td>
						</tr>
						<tr>
							<td align="right">收款单位：</td>
							<td colspan="8">
								<input name="signatory" id="signatory" class="nui-combobox" required="true" valueField="custid" url="com.primeton.eos.ame_pur.PurSupplier.queryPurSuppliersIsqualified.biz.ext"
									filterType="like" textField="custname" dataField="pursuppliers" valueFromSelect="true" allowInput="true" style="width: 100%;" />
							</td>
						</tr>
						<tr>
							<td align="right">收款单位开户行名称：</td>
							<td colspan="8">
								<input id="accountName" name="accountName" class="nui-textbox" style="width: 100%" required="true" />
							</td>
						</tr>
						<tr>
							<td align="right">收款单位开户行账号：</td>
							<td colspan="8">
								<input id="account" name="account" class="nui-textbox" style="width: 100%" required="true" />
							</td>
						</tr>
						<tr>
							<td align="right">支付依据及情况说明：</td>
							<td colspan="8">
								<input id="remark" name="remark" class="nui-textarea" style="width: 100%; height: 150px" required="true" />
							</td>
						</tr>
					</table>
				</div>
			</form>
		</fieldset>
		<fieldset id="field2" style="border: solid 1px #aaa; padding: 3px;">
			<legend>上传附件</legend>
			<jsp:include page="/ame_common/inputFile.jsp" />
		</fieldset>
		<jsp:include page="/ame_common/misOpinion.jsp" />
	</div>

	<div style="text-align: center; padding: 10px;" class="nui-toolbar">
		<a class="nui-button" onclick="onOk(0)" id="saveFeame" iconCls="icon-save" style="width: 80px; margin-right: 20px;">保存</a>
		<a class="nui-button" onclick="onOk(1)" id="creatFeame" iconCls="icon-ok" style="width: 80px; margin-right: 20px;">提交</a>
		<a class="nui-button" onclick="onOk(2)" id="zzFeame" iconCls="icon-split" style="width: 80px; margin-right: 20px;">中止</a>
		<a class="nui-button" onclick="closeCancel" iconCls="icon-close" style="width: 80px;">关闭</a>
	</div>

	<script type="text/javascript">
		nui.parse();
		<%
			long workItemID = (Long) request.getAttribute("workItemID");
		%>
		var form = new nui.Form("form1");
		var type;

		init();

		function onOk(e) {
			debugger;
			//定义变量接受form表单数据
			var form = new nui.Form("#form1");
			type = e;
			var checkPayPaid = "";
			if (type == 1) {
				form.validate();
				if (form.isValid() == false) {
					showTips("请检查必填项");
					return;
				}
				ajaxCommon({
					"async" : false,
					"url" : "com.zhonghe.ame.payment.payMent.checkPayPaid.biz.ext",
					"data" : nui.encode({
						"id": nui.get("payMentId").getValue(),
						"payId" : nui.get("payId").getValue(),
						"contractNo": nui.get("contractId").getValue(),
						"applyPayContractSum" : nui.get("applyPayContractSum").getValue()
					}),
					"success" : function(data) {
						checkPayPaid = data.result;
					}
				});
				if (checkPayPaid == "2") {
					alert("本年累计已付金额+当前付款金额已【超过】关联付费合同付款计划里本年累计到本季度应付款总额！");
					return;
				}
				if (checkPayPaid == "3") {
					alert("关联的付费合同中未设置付款计划，无法提交付款流程！");
					return;
				}
				if (checkPayPaid == "4") {
					alert("检查本次支付金额合法性异常，请联系管理员！");
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
			nui.get("saveFeame").disable();
			nui.get("creatFeame").disable();
			nui.get("zzFeame").disable();
			document.getElementById("fileCatalog").value = "payMentinfo";
			form2.submit();
		}

		function SaveData() {
			var form = new nui.Form("#form1");
			var data = form.getData();
			data.signatoryName = nui.get("signatory").getText();
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
				'cpData' : data,
				"misOpinion" : data_opioion.misOpinion
			});
			if (!confirm(info)) {
				nui.get("saveFeame").enable();
				nui.get("creatFeame").enable();
				nui.get("zzFeame").enable();
				nui.get("auditstatus").setValue("4");
				return;
			} else {
				ajaxCommon({
					url : "com.zhonghe.ame.payment.payMent.editPayMent.biz.ext",
					data : json,
					type : 'POST',
					cache : false,
					contentType : 'text/json',
					success : function(text) {
						if (text.result == "1") {
							if (type == 1) {
								showTips("付款流程提交成功");
								closeOk();
							} else if (type == 0) {
								showTips("付款流程暂时保存成功");
								closeOk();
							} else {
								showTips("中止成功");
								closeOk();
							}
						} else {
							showTips("提交失败！");
							nui.get("saveFeame").enable();
							nui.get("creatFeame").enable();
							nui.get("zzFeame").enable();
						}

					}
				});
			}
		}

		function init() {
			var data = {workItemID :<%=workItemID%>};
			var json = nui.encode(data);
			nui.ajax({
				url : "com.zhonghe.ame.payment.payMent.getPayMentProcess.biz.ext",
				data : json,
				type : 'POST',
				cache : false,
				contentType : 'text/json',
				success : function(o) {
					form.setData(o.payment);
					nui.get("contractId").setText(o.payment.contractId);
					nui.get("contractId").setValue(o.payment.contractId);
					//附件查询
					var grid_0 = nui.get("grid_0");
					grid_0.load({
						"groupid" : "PAY_MENT",
						"relationid" : o.payment.id
					});
					grid_0.sortBy("fileTime", "desc");
					//设置审核意见基本信息
					nui.get("processinstid").setValue(o.workitem.processInstID);
					nui.get("processinstname").setValue(o.workitem.processInstName);
					nui.get("activitydefid").setValue(o.workitem.activityDefID);
					nui.get("workitemname").setValue(o.workitem.workItemName);
					nui.get("workitemid").setValue(<%=workItemID%>);
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
				error : function(jqXHR, textStatus, errorThrown) {
					alert(jqXHR.responseText);
				}
			});
		}

		function selectOmEmployee() {
			var btnEdit = this;
			nui.open({
				url : "/default/machine/SelectEmployee.jsp",
				title : "选择经办人",
				width : 430,
				height : 400,
				ondestroy : function(action) {
					if (action == "ok") {
						var iframe = this.getIFrameEl();
						var data = iframe.contentWindow.GetData();
						data = nui.clone(data); //必须
						if (data) {
							btnEdit.setValue(data.userid);
							btnEdit.setText(data.empname);
						}
					}

				}
			});
		}

		function onButtonEdit(e) {
			var btnEdit = this;
			mini.open({
				url : "/default/contractPact/payment/payMentContracList.jsp",
				title : "选择合同 - 付费合同信息",
				width : '1200',
				height : '610',
				ondestroy : function(action) {
					if (action == "ok") {
						var iframe = this.getIFrameEl();
						var data = iframe.contentWindow.GetData();
						data = mini.clone(data); //必须
						if (data) {
							btnEdit.setValue(data.contractNo);
							btnEdit.setText(data.contractNo);
							nui.get("contractName").setValue(data.contractName);
							nui.get("contractSum").setValue(data.finalSum);
							nui.get("signatory").setValue(data.signatory);
							nui.get("contractType").setValue(data.contractType);
							nui.get("contractNature").setValue(data.contractNature);
							nui.get("payer").setValue(data.payer);
							nui.get("payId").setValue(data.id);
							setPaidContractSum(data.finalSum, data.contractBalance);
							btnEdit.doValueChanged();
						}
					}

				}
			});
		}

		function setPaidContractSum(finalSum, contractBalance) {
			abs = function(val) {
				var str = (val).toFixed(2) + '';
				var intSum = str.substring(0, str.indexOf(".")).replace(/\B(?=(?:\d{3})+$)/g, '');
				var dot = str.substring(str.length, str.indexOf("."))
				var ret = intSum + dot;
				return ret;
			}
			nui.get("paidContractSum").setValue(abs(finalSum - contractBalance));
		}
	</script>
</body>
</html>