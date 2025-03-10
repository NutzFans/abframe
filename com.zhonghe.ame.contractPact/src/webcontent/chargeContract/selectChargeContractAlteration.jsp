<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<head>
<title>收费合同基本信息 - 补充协议</title>
<style type="text/css">
	body {
		margin: 0;padding: 0;border: 0;width: 100%;height: 100%;overflow: hidden;	
	}
</style>
</head>
<body>
	<div class="nui-fit" style="padding: 5px">
		<fieldset id="field1" style="border: solid 1px #aaa;">
			<legend>原 - 收费合同信息</legend>
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
							<td align="right" style="width: 130px">经办人：</td>
							<td>
								<input id="createUsername" name="createUsername" class="nui-textbox" enabled="false" style="width: 200px" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 130px">申请日期：</td>
							<td>
								<input id="createTime" name="createTime" enabled="false" class="nui-textbox" style="width: 200px" />
							</td>
							<td align="right" style="width: 130px">合同承办单位：</td>
							<td>
								<input id="secondaryOrgname" name="secondaryOrgname" class="nui-textbox" enabled="false" style="width: 200px" />
							</td>
							<td align="right" style="width: 130px">合同承办部门：</td>
							<td>
								<input id="implementOrgname" name="implementOrgname" class="nui-textbox" enabled="false" style="width: 200px" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 130px">签约方：</td>
							<td colspan="5">
								<input id="signatoryName" name="signatoryName" class="nui-textbox" style="width: 100%" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 130px">合同签约主体：</td>
							<td>
								<input id="contractSubject" name="contractSubject" class="nui-dictcombobox" dictTypeId="ZH_INVOICE_NAME_TYPE" enabled="false"  style="width: 200px" />
							</td>
							<td align="right" style="width: 130px">收款方：</td>
							<td>
								<input id="payee" name="payee" class="nui-dictcombobox" dictTypeId="PAYER" style="width: 200px" enabled="false" />
							</td>
							<td align="right" style="width: 130px">签订日期：</td>
							<td>
								<input id="signingDate" name="signingDate" class="nui-textbox" style="width: 200px" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 130px">合同金额(元)：</td>
							<td>
								<input id="contractSum" name="contractSum" class="nui-textbox" style="width: 200px" enabled="false" />
							</td>
							<td align="right" style="width: 130px">合同编号：</td>
							<td>
								<input id="historyContractNo" name="historyContractNo" enabled="false" class="nui-textbox" style="width: 200px" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 130px">备注：</td>
							<td colspan="5">
								<input id="remark" name="remark" class="nui-textarea" style="width: 100%; height: 68px" enabled="false" />
							</td>
						</tr>
					</table>
				</div>
			</form>
		</fieldset>
		
		
		<fieldset id="field2" style="border: solid 1px #aaa;">
			<legend>补充协议 - 收费合同信息</legend>
			<form id="form2" method="post">
				<input name="files" id="fileids" class="nui-hidden" />
				<input name="id" id="id" class="nui-hidden" />
				<div style="padding: 5px;">
					<table style="table-layout: fixed;">
						<tr>
							<td align="right" style="width: 130px">补充协议名称：</td>
							<td colspan="3">
								<input id="contractName" name="contractName" enabled="false" class="nui-textbox" style="width: 100%" />
							</td>
							<td align="right" style="width: 130px">经办人：</td>
							<td>
								<input id="createUsername" name="createUsername" class="nui-textbox" enabled="false" style="width: 200px" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 130px">申请日期：</td>
							<td>
								<input id="createTime" name="createTime" enabled="false" class="nui-textbox" style="width: 200px" />
							</td>
							<td align="right" style="width: 130px">合同承办单位：</td>
							<td>
								<input id="secondaryOrgname" name="secondaryOrgname" class="nui-textbox" enabled="false" style="width: 200px" />
							</td>
							<td align="right" style="width: 130px">合同承办部门：</td>
							<td>
								<input id="implementOrgname" name="implementOrgname" class="nui-textbox" enabled="false" style="width: 200px" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 130px">签约方：</td>
							<td colspan="5">
								<input id="signatoryName" name="signatoryName" class="nui-textbox" style="width: 100%" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 130px">付合同签约主体方：</td>
							<td>
								<input id="contractSubject" name="contractSubject" class="nui-dictcombobox" dictTypeId="ZH_INVOICE_NAME_TYPE" enabled="false"  style="width: 200px" />
							</td>
							<td align="right" style="width: 130px">收款方：</td>
							<td>
								<input id="payee" name="payee" class="nui-dictcombobox" dictTypeId="PAYER" style="width: 200px" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 130px">变更金额(元)：</td>
							<td>
								<input id="contractSum" name="contractSum" class="nui-textbox" style="width: 200px" enabled="false" />
							</td>
							<td align="right" style="width: 130px">不含税金额(元)：</td>
							<td>
								<input id="noTaxSum" name="noTaxSum" enabled="false" class="nui-textbox" style="width: 200px" />
							</td>
							<td align="right" style="width: 130px">税额(元)：</td>
							<td>
								<input id="payTax" name="payTax" class="nui-textbox" style="width: 200px" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 130px">补充协议说明：</td>
							<td colspan="5">
								<input id="remark" name="remark" class="nui-textarea" style="width: 100%; height: 68px" enabled="false" />
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
			<legend>原 - 收费合同附件</legend>
			<jsp:include page="/ame_common/detailFile.jsp" />
		</fieldset>
		
		<fieldset id="field6" style="border: solid 1px #aaa;">
			<legend>补充协议 - 上传附件</legend>
			<jsp:include page="/ame_common/detailFileExpand.jsp" />
		</fieldset>
		
	</div>
	
	<script type="text/javascript">
		nui.parse();
		var form1 = new nui.Form("form1");
		var form2 = new nui.Form("form2");
		var processId = <%=request.getParameter("processInstID")%>;
		var workItemID = <%=request.getParameter("workItemID")%>;
		init();
		
		function init() {
			var data = {"workitemid":workItemID,"processid":processId};
			var json = nui.encode(data);
			nui.ajax({
				url: "com.zhonghe.ame.chargeContract.chargeContract.getChargeContractMessage.biz.ext",
				type : "post",
				data : json,
				contentType : 'text/json',
				success : function(o) {
					form2.setData(o.chargeContract);
					
					// 原合同数据
					queryHistory(o.chargeContract.relateCont);
					
					// 补充合同信息（协议）
					nui.get("contractNo").setValue(o.chargeContract.contractNo);
					nui.get("signingDate").setValue(o.chargeContract.signingDate);
					
					//查询补充协议附件
					var detailFileExpandGrid = nui.get("detailFileExpandGrid");
					detailFileExpandGrid.load({
						"groupid" : "CHARGE_CONTRACT",
						"relationid" : o.chargeContract.id
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
		
		function queryHistory(str) {
			var json = {"id": str};
			nui.ajax({
				url : "com.zhonghe.ame.chargeContract.chargeContract.getChargeContractById.biz.ext",
				type : "post",
				contentType : 'text/json',
				data : json,
				success : function(result) {
					var data = result.data;
					form1.setData(data);
					nui.get("historyContractNo").setValue(data.contractNo);
					var grid_0 = nui.get("grid_0");
					grid_0.load({
						"groupid" : "CHARGE_CONTRACT",
						"relationid" : data.id
					});
					grid_0.sortBy("fileTime", "desc");
				}
			})
		}
	</script>
</body>
</html>