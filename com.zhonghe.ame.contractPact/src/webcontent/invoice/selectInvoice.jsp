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
<title>开票信息维护</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%=request.getContextPath()%>/common/nui/nui.js" type="text/javascript"></script>
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
		<div class="mini-panel" title="" style="width: 100%;">
			<fieldset id="field1" style="border: solid 1px #aaa; padding: 3px; width: 100%;">
				<legend>开票信息</legend>
				<form id="form1" method="post">
					<input name="files" id="fileids" class="nui-hidden" />
					<input class="nui-hidden" name="id" />
					<input class="nui-hidden" name="historyInvoiceSum" id="historyInvoiceSum" />
					<div style="padding: 5px;">
						<table style="table-layout: fixed;">
							<tr>
								<td class="form_label" align="right">申请人</td>
								<td>
									<input name="createUserid" id="createUserid" class="nui-hidden" style="width: 300px" />
									<input id="createUsername" name="createUsername" class="nui-textbox" enabled="false" style="width: 300px" required="true" />
								</td>
								<td align="right" style="width: 160px">合同实施部门：</td>
								<td>
									<input name="implementOrg" id="implementOrg" shownullItem=ture class="nui-treeselect" textField="orgname" valueField="orgid" parentField="omOrganization.orgid" dataField="orgs"
										showTreeIcon="true" valueFromSelect="true" style="width: 100%;" url="com.zhonghe.ame.imptask.keytask.getAllRunOrgsforzdrw.biz.ext" allowInput="true" required="true" multiSelect="false"
										checkRecursive="false" expandOnLoad="0" enabled="false" showFolderCheckBox="true" />
									<input name="implementOrgname" id="implementOrgname" class="nui-hidden" readonly="readonly" />
								</td>
								<td align="right" style="width: 160px">申请日期：</td>
								<td>
									<input id="createTime" name="createTime" enabled="false" class="nui-datepicker" style="width: 300px" required="true" />
								</td>
							</tr>
							<tr>
								<td align="right" style="width: 160px">合同编号：</td>
								<td>
									<input id="contractNo" name="contractNo" onbuttonclick="onButtonEdit" class="nui-buttonedit" style="width: 300px" required="true" enabled="false" />
								</td>
								<td align="right" style="width: 160px">合同名称：</td>
								<td colspan="6">
									<input id="contractName" name="contractName" class="nui-textbox" style="width: 100%" required="true" enabled="false" />
								</td>
							</tr>
							<tr>
								<td align="right" style="width: 100px">专业类别：</td>
								<td>
									<input id="major" name="major" class="nui-dictcombobox" dictTypeId="ZH_MAJOR_TYPE" style="width: 300px" required="true" enabled="false" />
								</td>
								<td align="right" style="width: 160px">工程类别：</td>
								<td>
									<input id="projectType" name="projectType" class="nui-dictcombobox" dictTypeId="ZH_PROJECT_TYPE" style="width: 300px" required="true" enabled="false" />
								</td>
								<td align="right" style="width: 160px">集团内外：</td>
								<td>
									<input id="headquarterGroup" name="headquarterGroup" class="nui-dictcombobox" dictTypeId="ZH_GROUP" style="width: 300px" required="true" enabled="false" />
								</td>
							</tr>
							<tr>
								<td align="right" style="width: 160px">发票抬头类别：</td>
								<td>
									<input name="invoiceNameType" id="invoiceNameType" class="nui-dictcombobox" dictTypeId="ZH_INVOICE_NAME_TYPE" style="width: 300px" required="true" enabled="false" />
								</td>
								<td align="right" style="width: 160px">发票类型：</td>
								<td>
									<input name="invoiceType" id="invoiceType" class="nui-dictcombobox" dictTypeId="MIS_MA_INVOICETYPE" style="width: 300px" required="true" onvaluechanged="invoiceType" enabled="false" />
								</td>
								<td align="right" style="width: 160px">税率（%）：</td>
								<td>
									<input name="invoiceRate" id="invoiceRate" class="nui-textbox" style="width: 300px" required="true" onvaluechanged="editContractSum" value="6" enabled="false" />
								</td>
							</tr>
							<tr>
								<td align="right" style="width: 160px">用途：</td>
								<td colspan="3">
									<input name="invoiceUsed" id="invoiceUsed" class="nui-dictcombobox" dictTypeId="INVOICE_USED" style="width: 100%" required="true" enabled="false" />
								</td>
								<td align="right" style="width: 160px">合同金额（元）：</td>
								<td>
									<input id="invoiceSumCapital" name="invoiceSumCapital" class="nui-textbox" vtype="float" style="width: 300px" enabled="false" />
								</td>
							</tr>
							<tr>
								<td align="right" style="width: 160px">开票金额（元）：</td>
								<td>
									<input id="invoiceSum" name="invoiceSum" class="nui-textbox" vtype="float" style="width: 300px" required="true" onvaluechanged="editContractSum" enabled="false" />
								</td>
								<td align="right" style="width: 160px">账面收入（元）：</td>
								<td>
									<input id="bookIncome" name="bookIncome" class="nui-textbox" style="width: 300px" required="true" enabled="false" />
								</td>
								<td align="right" style="width: 160px">税额：</td>
								<td>
									<input name="invoiceTax" id="invoiceTax" class="nui-textbox" style="width: 300px" required="true" enabled="false" />
								</td>
							</tr>
							<tr>
								<td align="right" style="width: 160px">名称：</td>
								<td colspan="8">
									<input name="payerName" id="payerName" class="nui-textbox" style="width: 100%" required="true" enabled="false" />
								</td>
							</tr>
							<tr>
								<td align="right" style="width: 160px">纳税人识别号：</td>
								<td colspan="8">
									<input name="taxpayerNumber" id="taxpayerNumber" class="nui-textbox" style="width: 100%" required="true" enabled="false" />
								</td>
							</tr>
							<tr>
								<td align="right" style="width: 160px">地址、电话：</td>
								<td colspan="8">
									<input name="unitAddress" id="unitAddress" class="nui-textbox" style="width: 100%" required="true" enabled="false" />
								</td>
							</tr>
							<tr>
								<td align="right" style="width: 160px">开户行及账号：</td>
								<td colspan="8">
									<input name="account" id="account" class="nui-textbox" style="width: 100%" required="true" enabled="false" />
								</td>
							</tr>
							<tr>
								<td align="right" style="width: 160px">发票备注：</td>
								<td colspan="8">
									<input name="invoiceRemark" id="invoiceRemark" class="nui-textbox" style="width: 100%" required="false" enabled="false" />
								</td>
							</tr>
							<tr>
								<td align="right" style="width: 160px">开票是否邮寄：</td>
								<td>
									<input id="postFlag" name="postFlag" class="nui-dictcombobox" onvaluechanged="setAttribute" dictTypeId="ZH_POST" style="width: 300px" required="true" enabled="false" />
								</td>
								<td align="right" style="width: 160px">发票领取人：</td>
								<td colspan="6">
									<input name="invoiceUser" id="invoiceUser" class="nui-textbox" style="width: 100%" required="true" enabled="false" />
								</td>
							</tr>
							<tr>
								<td align="right" style="width: 160px">邮寄姓名：</td>
								<td>
									<input name="mailName" id="mailName" class="nui-textbox" style="width: 300px" required="true" enabled="false" />
								</td>
								<td align="right" style="width: 160px">邮寄电话：</td>
								<td>
									<input name="mailPhone" id="mailPhone" class="nui-textbox" style="width: 300px" required="true" enabled="false" />
								</td>

							</tr>
							<tr>
								<td align="right" style="width: 160px">邮寄地址：</td>
								<td colspan="8">
									<input name="mailAddress" id="mailAddress" class="nui-textbox" style="width: 100%" required="true" enabled="false" />
								</td>
							</tr>
							<tr>
								<td align="right" style="width: 160px">回款金额（元）：</td>
								<td>
									<input id="receivableSum" name="receivableSum" class="nui-textbox" vtype="float" style="width: 300px" onvaluechanged="receivableSum" enabled="false" />
								</td>
								<td align="right" style="width: 160px">余额（元）：</td>
								<td>
									<input id="balanceSum" name="balanceSum" class="nui-textbox" style="width: 300px" enabled="false" />
								</td>
								<td align="right" style="width: 160px">回款时间：</td>
								<td>
									<input id="receivableData" name="receivableData" class="nui-datepicker" style="width: 300px" enabled="false" />
								</td>
							</tr>
							<tr>
								<td align="right" style="width: 160px">核查（元）：</td>
								<td>
									<input id="verification" name="verification" class="nui-textbox" style="width: 300px" enabled="false" />
								</td>
							</tr>
							<tr>
								<td align="right" style="width: 160px">备注：</td>
								<td colspan="8">
									<input name="remark" class="nui-textarea" style="width: 100%; height: 235px" required="false" enabled="false" />
								</td>
							</tr>
						</table>
					</div>
				</form>
			</fieldset>
			<fieldset id="field2" style="border: solid 1px #aaa; padding: 3px;">
				<legend>上传附件</legend>
				<jsp:include page="/ame_common/detailFile.jsp" />
			</fieldset>
		</div>
	</div>

	<script type="text/javascript">
		nui.parse();
		var form = new nui.Form("form1");
		var processid =<%=request.getParameter("processInstID")%>;
		
		setData();

		function setData() {
			var json = nui.encode({
				"processid" : processid
			});
			nui.ajax({
				url : "com.zhonghe.ame.purchase.purchaseProApp.queryInvoiceByProcessId.biz.ext",
				type : 'POST',
				data : json,
				contentType : 'text/json',
				success : function(o) {
					var data = o.proApp[0];
					form.setData(data);
					nui.get("contractNo").setText(data.contractNo);
					form.setEnabled(false);
					var grid_0 = nui.get("grid_0");
					grid_0.load({
						"groupid" : "INVOICE",
						"relationid" : data.id
					});
					grid_0.sortBy("fileTime", "desc");
				}
			});
		}
		
	</script>

</body>
</html>