<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<head>
<title>付费合同签订申请</title>
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
	<div class="nui-fit" style="padding: 5px">
		<fieldset id="field1" style="border: solid 1px #aaa;">
			<legend>原 - 付费合同信息</legend>
			<form id="form1" method="post">
				<input name="files" id="fileids" class="nui-hidden" />
				<input name="id" id="id" class="nui-hidden" />
				<div style="padding: 5px;">
					<table style="table-layout: fixed;">
						<tr>
							<td align="right" style="width: 130px">合同名称：</td>
							<td colspan="3">
								<input id="contractName" name="contractName" enabled="false" class="nui-textbox" style="width: 100%" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 130px">经办人：</td>
							<td>
								<input id="createUsername" name="createUsername" class="nui-textbox" enabled="false" style="width: 200px" />
							</td>
							<td align="right" style="width: 130px">合同承办单位：</td>
							<td>
								<input id="secondaryOrgname" name="secondaryOrgname" class="nui-textbox" enabled="false" style="width: 200px" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 130px">合同承办部门：</td>
							<td>
								<input id="implementOrgname" name="implementOrgname" class="nui-textbox" enabled="false" style="width: 200px" />
							</td>
							<td align="right" style="width: 130px">合同编号：</td>
							<td>
								<input id="contractNo" name="contractNo" enabled="false" class="nui-textbox" style="width: 200px" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 130px">合同金额(元)：</td>
							<td>
								<input id="contractSum" name="contractSum" class="nui-textbox" style="width: 200px" enabled="false" />
							</td>
							<td align="right" style="width: 130px">申请日期：</td>
							<td>
								<input id="createTime" name="createTime" enabled="false" class="nui-textbox" style="width: 200px" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 130px">签订日期：</td>
							<td>
								<input id="signingDate" name="signingDate" class="nui-textbox" style="width: 200px" enabled="false" />
							</td>
							<td align="right" style="width: 130px">付款方：</td>
							<td>
								<input id="payer" name="payer" class="nui-dictcombobox" dictTypeId="ZH_INVOICE_NAME_TYPE" style="width: 200px" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 130px">签约方：</td>
							<td colspan="3">
								<input id="signatoryname" name="signatoryname" class="nui-textbox" style="width: 100%" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 130px">备注：</td>
							<td colspan="3">
								<input id="remark" name="remark" class="nui-textarea" style="width: 100%; height: 235px" enabled="false" />
							</td>
						</tr>
					</table>
				</div>
			</form>
		</fieldset>

		<fieldset id="field2" style="border: solid 1px #aaa;">
			<legend>补充协议 - 付费合同信息</legend>
			<form id="form2" method="post">
				<div style="padding: 5px;">
					<table style="table-layout: fixed;">
						<tr>
							<td align="right" style="width: 130px">补充协议名称：</td>
							<td colspan="3">
								<input id="contractName" name="contractName" class="nui-textbox" style="width: 100%" required="true" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 130px">经办人：</td>
							<td>
								<input name="createUserid" id="createUserid" class="nui-hidden" />
								<input id="createUsername" name="createUsername" class="nui-textbox" enabled="false" style="width: 200px" required="true" />
							</td>
							<td align="right" style="width: 130px">合同承办单位：</td>
							<td>
								<input id="secondaryOrgname" name="secondaryOrgname" class="nui-textbox" enabled="false" style="width: 200px" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 130px">合同承办部门：</td>
							<td>
								<input name="implementOrgname" id="implementOrgname" class="nui-textbox" enabled="false" style="width: 200px" />
							</td>
							<td align="right" style="width: 130px">申请日期：</td>
							<td>
								<input id="createTime" name="createTime" class="nui-datepicker" style="width: 200px" required="true" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 130px">签约方：</td>
							<td colspan="3">
								<input name="signatory" id="custId" class="nui-combobox" required="true" valueField="custid" url="com.primeton.eos.ame_pur.PurSupplier.queryPurSuppliersIsqualified.biz.ext" filterType="like"
									textField="custname" dataField="pursuppliers" valueFromSelect="true" allowInput="true" style="width: 100%" enabled="false" />
							</td>						
						</tr>
						<tr>
							<td align="right" style="width: 130px">付款方：</td>
							<td>
								<input id="payer" name="payer" class="nui-dictcombobox" dictTypeId="ZH_INVOICE_NAME_TYPE" style="width: 200px" required="true" enabled="false" />
							</td>
							<td align="right" style="width: 130px">变更金额(元)：</td>
							<td>
								<input id="contractSum" name="contractSum" class="nui-textbox" vtype="float" style="width: 200px" required="true" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 130px">不含税金额(元)：</td>
							<td>
								<input name="noTaxSum" id="noTaxSum" class="nui-textbox" vtype="float" style="width: 200px" required="true" enabled="false" />
							</td>
							<td align="right" style="width: 130px">税额(元):</td>
							<td>
								<input name="payTax" id="payTax" class="nui-textbox" vtype="float" style="width: 200px" required="true" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 130px">补充协议说明：</td>
							<td colspan="3">
								<input id="remark" name="remark" class="nui-textarea" style="width: 100%; height: 235px" required="true" enabled="false" />
							</td>
						</tr>
					</table>
				</div>
			</form>
		</fieldset>

		<fieldset id="field3" style="border: solid 1px #aaa;">
			<legend style="color: red;">补充合同信息（协议）</legend>
			<form>
				<div>
					<table style="table-layout: fixed;">
						<tr>
							<td align="right" style="width: 130px">合同编号：</td>
							<td>
								<input id="contractNo" name="contractNo" class="nui-textbox" style="width: 200px" required="true" enabled="false" />
							</td>
							<td align="right" style="width: 130px">签订日期：</td>
							<td>
								<input id="signingDate" name="signingDate" class="nui-datepicker" style="width: 200px" required="true" enabled="false" />
							</td>
						</tr>
					</table>
				</div>
			</form>
		</fieldset>

		<fieldset id="field5" style="border: solid 1px #aaa;">
			<legend>原 - 付费合同附件</legend>
			<jsp:include page="/ame_common/detailFile.jsp" />
		</fieldset>

		<fieldset id="field6" style="border: solid 1px #aaa;">
			<legend>补充协议 - 相关附件</legend>
			<jsp:include page="/ame_common/detailFileExpand.jsp" />
		</fieldset>

	</div>



	<script type="text/javascript">
		nui.parse();
		var form1 = new nui.Form("form1");
		var form2 = new nui.Form("form2");
		var processId =<%=request.getParameter("processInstID")%>;
		var workItemID =<%=request.getParameter("workItemID")%>;
		var grid2 = nui.get("datagrid2");
		
		init();

		function init() {
			var data = {
				"workitemid" : workItemID,
				"processId" : processId
			};
			var json = nui.encode(data);
			nui.ajax({
				url : "com.zhonghe.ame.payContract.payContract.queryPayContractInfo.biz.ext",
				type : "post",
				data : json,
				contentType : 'text/json',
				success : function(o) {
					form2.setData(o.data);
					// 原合同数据
					queryHistory(o.data.relateCont);
					// 补充合同信息（协议）
					nui.get("contractNo").setValue(o.data.contractNo);
					nui.get("signingDate").setValue(o.data.signingDate);
					//查询补充协议附件
					var detailFileExpandGrid = nui.get("detailFileExpandGrid");
					detailFileExpandGrid.load({
						"groupid" : "PAY_CONTRACT",
						"relationid" : o.data.id
					});
					detailFileExpandGrid.sortBy("fileTime", "desc");
				}
			});
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

		grid2.on("cellbeginedit", function(e) {
			e.cancel = "true";
		})

		function queryHistory(str) {
			var json = {
				"id" : str
			};
			nui.ajax({
				url : "com.zhonghe.ame.payContract.payContract.queryPayContractById.biz.ext",
				type : "post",
				contentType : 'text/json',
				data : json,
				success : function(result) {
					var data = result.data;
					form1.setData(data);
					//查询原合同附件
					var grid_0 = nui.get("grid_0");
					grid_0.load({
						"groupid" : "PAY_CONTRACT",
						"relationid" : data.id
					});
					grid_0.sortBy("fileTime", "desc");
				}
			})
		}
	</script>
</body>
</html>