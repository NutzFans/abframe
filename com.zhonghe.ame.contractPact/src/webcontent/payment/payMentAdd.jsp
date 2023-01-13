<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<head>
<title>发起付款流程</title>
<style type="text/css">
	body {
		margin: 0;padding: 0;border: 0;width: 100%;height: 100%;overflow: hidden;
	}
</style>
</head>
<body>
	<div class="nui-fit">
		<fieldset id="field1" style="border: solid 1px #aaa; padding: 3px; width: 98%;">
			<legend>发起付款流程信息</legend>
			<form id="form1" method="post">
				<input name="files" id="fileids" class="nui-hidden" />
				<input name="implementOrg" id="implementOrg" class="nui-hidden" />
				<div style="padding: 5px;">
					<table style="table-layout: fixed;">
						<tr>
							<td class="form_label" align="right">申请人</td>
							<td>
								<input name="createUserid" id="createUserid" class="nui-hidden" style="width: 300px" />
								<input id="createUsername" name="createUsername" class="nui-textbox" enabled="false" style="width: 300px" required="true" />
							</td>

							<td align="right" style="width: 160px">申请部门：</td>
							<td>
								<input name="createdOrgid" id="createdOrgid" shownullItem=ture class="nui-treeselect" textField="orgname" valueField="orgid" parentField="omOrganization.orgid" dataField="orgs"
									showTreeIcon="true" valueFromSelect="true" style="width: 100%;" url="com.zhonghe.ame.imptask.keytask.getAllRunOrgsforzdrw.biz.ext" allowInput="true" required="true"
									onvaluechanged="changeOrgForm(e)" multiSelect="false" checkRecursive="false" expandOnLoad="0" showFolderCheckBox="true" enabled="false" //>
								<input name="implementOrgname" id="implementOrgname" class="nui-hidden" readonly="readonly" style="width: 100%" />
							</td>
							<td align="right" style="width: 160px">申请日期：</td>
							<td>
								<input id="createTime" name="createTime" class="nui-datepicker" style="width: 300px" readonly="readonly" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 160px">合同编号：</td>
							<td>
								<input id="contractId" name="contractId" class="nui-buttonedit" onbuttonclick="onButtonEdit" style="width: 300px" required="true" enabled="true" />
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
								<input id="paidContractSum" name="paidContractSum" class="nui-textbox" onvaluechanged="editPaidContractSum" style="width: 300px" required="false" enabled="false" />
							</td>
							<td align="right" style="width: 160px">本次支付金额(元)：</td>
							<td>
								<input id="applyPayContractSum" name="applyPayContractSum" onvaluechanged="editApplyPayContractSum" class="nui-textbox" style="width: 300px" required="true" />
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
								<input name="signatory" id="signatory" class="nui-hidden" style="width: 300px" />
								<input id="signatoryname" name="signatoryname" class="nui-textbox" style="width: 100%" required="true" enabled="false" />
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
	</div>

	<div style="text-align: center; padding: 8px;" class="nui-toolbar">
		<a class="nui-button" onclick="onOk(0)" id="saveFeame" iconCls="icon-save" style="width: 80px; margin-right: 20px;">保存</a>
		<a class="nui-button" onclick="onOk(1)" id="creatFeame" iconCls="icon-ok" style="width: 80px; margin-right: 20px;">提交</a>
		<a class="nui-button" onclick="closeCancel" iconCls="icon-close" style="width: 80px; margin-right: 140px;">关闭</a>
	</div>

	<script type="text/javascript">
		nui.parse();
		var form = new nui.Form("form1");
		var type;
		var result;
		init();
		
		function init() {
			nui.get("createUserid").setValue(userId);
			nui.get("createUsername").setValue(userName);
			nui.get("createTime").setValue(new Date());
			nui.get("createdOrgid").setValue(userOrgId);
			nui.get("implementOrgname").setValue(userOrgName);
		}
		
		function onOk(e) {
			//定义变量接受form表单数据
			var form = new nui.Form("#form1");
			type = e;
			if (type == 1) {
				title = "提交";
				if (!form.validate()) {
					showTips("请检查表单的完整性!", "danger");
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
			var data = form.getData();
			document.getElementById("fileCatalog").value = "payMentinfo";
			form2.submit();
		}
		
		function SaveData() {
			var form = new nui.Form("#form1");
			var data = form.getData();
			var info = "";
			data.type = type;
			JY();
			if (result == "false") {
				nui.alert("付款金额已超出本季度合同付款计划！");
				return;
			}
			if (type == 1) {
				info = "是否提交？"
			} else {
				info = "是否暂时保存？"
			}
			data.files = nui.get("fileids").getValue();
			var json = nui.encode({
				'cpData' : data
			});
			if (!confirm(info)) {
				nui.get("saveFeame").enable();
				nui.get("creatFeame").enable();
				return;
			} else {
				ajaxCommon({
					url : "com.zhonghe.ame.payment.payMent.addPayMent.biz.ext",
					data : json,
					success : function(text) {
						if (text.result == 1) {
							if (type == 1) {
								showTips("付款流程提交成功")
								closeOk();
							} else {
								showTips("付款流程暂时保存成功")
								closeOk();
							}
						} else {
							showTips("提交失败！", "danger");
							nui.get("saveFeame").enable();
							nui.get("creatFeame").enable();
						}

					}
				});
			}
		}
		
		function setViewData(data) {
			var form = new nui.Form("#form1");
			form.setData(data)
			init();
			if (null != data.signatoryname) {
				nui.get("signatoryname").setValue(data.signatoryname);
				nui.get("signatory").setValue(data.signatory);
			}
			if (null != data.contractName) {
				nui.get("contractName").setValue(data.contractName);
			}
			if (null != data.contractNo) {
				nui.get("contractId").setValue(data.contractNo);
			}
			if (null != data.contractSum) {
				nui.get("actContractSum").setValue(data.contractSum);
				nui.get("actContractSumCapital").setValue(numberParseChina(data.contractSum));
			}
			if (null != data.id) {
				var json = nui.encode({
					'contractId' : data.contractNo
				});
				var payAll = 0.00;
				nui.ajax({
					url : "com.zhonghe.ame.payment.payMent.queryPaymentByContractId.biz.ext",
					data : json,
					type : 'POST',
					cache : false,
					contentType : 'text/json',
					success : function(text) {
						for (var i = 0; i < text.data.length; i++) {
							payAll = payAll + parseFloat(text.data[i].applyPayContractSum);
						}
						nui.get("paidContractSum").setValue(payAll.toFixed(2));
						nui.get("paidContractSumCapital").setValue(numberParseChina(payAll.toFixed(2)));
						if (isNaN(payAll.toFixed(2)) || payAll.toFixed(2) == 0.00) {
							nui.get("paidContractSum").setValue(0.00);
							nui.get("paidContractSumCapital").setValue("零元整");
						}
					},
					error : function(jqXHR, textStatus, errorThrown) {
						alert(jqXHR.responseText);
					}
				});
			}
			if (null != data.id) {
				var json = nui.encode({
					'id' : data.id
				});
				nui.ajax({
					url : "com.zhonghe.ame.payment.payMent.queryPayContractByContractId.biz.ext",
					data : json,
					type : 'POST',
					cache : false,
					contentType : 'text/json',
					success : function(text) {
						nui.get("payer").setValue(text.data[0].payer);
						nui.get("implementOrg").setValue(text.data[0].implementOrg);
					},
					error : function(jqXHR, textStatus, errorThrown) {
						alert(jqXHR.responseText);
					}
				});
			}
		}
		
		function onCancel(e) {
			CloseWindow("cancel");
		}
		
		function CloseWindow(action) {
			if (window.CloseOwnerWindow)
				return window.CloseOwnerWindow(action);
			else
				window.close();
		}
		
		function selectOmEmployee() {
			var btnEdit = this;
			nui.open({
				url : "/default/machine/SelectEmployee.jsp",
				title : "选择经办人",
				width : 530,
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
				title : "付款合同信息",
				width : '90%',
				height : '90%',
				ondestroy : function(action) {
					if (action == "ok") {
						var iframe = this.getIFrameEl();
						var data = iframe.contentWindow.GetData();
						data = mini.clone(data); //必须
						if (data) {
							console.log(data);
							btnEdit.setValue(data.contractNo);
							btnEdit.setText(data.contractNo);
							nui.get("contractName").setValue(data.contractName);
							nui.get("contractSum").setValue(data.contractSum);
							nui.get("signatoryname").setValue(data.signatoryname);
							nui.get("signatory").setValue(data.signatory);
							nui.get("contractType").setValue(data.contractType);
							nui.get("contractNature").setValue(data.contractNature);
							nui.get("payer").setValue(data.payer);
							queryPaid(data.contractNo);
							btnEdit.doValueChanged();
						}
					}

				}
			});
		}
		
		function queryPaid(str) {
			nui.ajax({
				url : "com.zhonghe.ame.payment.payMent.queryPaid.biz.ext",
				type : "post",
				contentType : 'text/json',
				data : {
					"contractNo" : str
				},
				success : function(text) {
					nui.get("paidContractSum").setValue(text.paidSum);
				}
			})
		}
		
		function JY() {
			var contractId = nui.get("contractId").getValue();
			var applyPayContractSum = nui.get("applyPayContractSum").getValue();
			var json = nui.encode({
				"contractId" : contractId,
				"applyPayContractSum" : applyPayContractSum
			});
			nui.ajax({
				url : "com.zhonghe.ame.payment.payMent.checkPayPaid.biz.ext",
				data : json,
				type : "post",
				async : false,
				contentType : 'text/json',
				success : function(text) {
					result = text.result;
				}
			})
		}

		function zhInvoiceNameType(e) {
			return nui.getDictText("ZH_INVOICE_NAME_TYPE", e.value);
		}
	</script>

</body>
</html>