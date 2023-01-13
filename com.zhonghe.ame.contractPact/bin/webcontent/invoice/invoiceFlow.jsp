<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<head>
<title>开票申请</title>
<style type="text/css">
	body {
		margin: 0;padding: 0;border: 0;width: 100%;height: 100%;overflow: hidden;
	}
</style>
</head>
<body>
	<div class="nui-fit">
		<fieldset id="field1" style="border: solid 1px #aaa; padding: 3px; width: 97%;">
			<legend>开票申请信息</legend>
			<form id="form1" method="post">
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
								<input name="invoiceType" id="invoiceType" class="nui-dictcombobox" dictTypeId="MIS_MA_INVOICETYPE" style="width: 300px" required="true" enabled="false" onvaluechanged="invoiceType" />
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
								<input id="invoiceSumCapital" name="invoiceSumCapital" class="nui-textbox" vtype="float" style="width: 300px" required="true" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 160px">开票金额（元）：</td>
							<td>
								<input id="invoiceSum" name="invoiceSum" id="invoiceSum" class="nui-textbox" vtype="float" style="width: 300px" required="true" onvaluechanged="editContractSum" enabled="false" />
							</td>
							<td align="right" style="width: 160px">开票金额账面收入（元）：</td>
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
							<td align="right" style="width: 160px">备注：</td>
							<td colspan="8">
								<input name="remark" class="nui-textarea" style="width: 100%; height: 50px" required="false" />
							</td>
						</tr>
					</table>
				</div>
			</form>
		</fieldset>
		<fieldset id="field2" style="border: solid 1px #aaa; padding: 3px;">
			<legend>相关附件</legend>
			<jsp:include page="/ame_common/detailFile.jsp" />
		</fieldset>
		<jsp:include page="/ame_common/misOpinion_Freeflow.jsp" />
	</div>

	<div style="text-align: center; padding: 10px;" class="nui-toolbar">
		<a class="nui-button" onclick="submit()" id="creatReimbProcess" iconCls="icon-ok" style="width: 80px; margin-right: 20px;">提交</a>
		<a class="nui-button" onclick="closeCancel" id="saveReimbProcess" iconCls="icon-close" style="width: 80px;">关闭</a>
	</div>

	<script type="text/javascript">
		nui.parse();
		var form = new nui.Form("form1");
		<%
			long workitemid = (Long)request.getAttribute("workItemID");
		%> 
		var projectid = <%=request.getParameter("projectid")%>;
		var workItemID = <%=request.getParameter("workItemID")%>;
		var opioionform = new nui.Form("#opioionform");
		
		init();
		
		function init() {
			var data = {workitemid:<%=workitemid%>};
			var json = nui.encode(data);
			nui.ajax({
				url : "com.zhonghe.ame.invoice.invoice.queryInvoiceInfo.biz.ext",
				type : "post",
				data : json,
				contentType : 'text/json',
				success : function(o) {
					form.setData(o.data)
					nui.get("backTo").setData(o.data.backList);
					nui.get("contractNo").setText(o.data.contractNo);
					nui.ajax({
						url : "com.zhonghe.ame.invoice.invoice.queryInvoiceById.biz.ext",
						type : "post",
						data : nui.encode({
							'id' : o.data.id
						}),
						contentType : 'text/json',
						success : function(o) {
							nui.get("createUsername").setValue(o.data.empname);
						}
					});
					//查询并加载附件
					var grid_0 = nui.get("grid_0");
					grid_0.load({
						"groupid" : "INVOICE",
						"relationid" : o.data.id
					});
					grid_0.sortBy("fileTime", "desc");
					var grid = nui.get("datagrid1");
					grid.load({
						processInstID : o.data.processid
					});
					grid.sortBy("time", "desc");
					setTimeout(function() {
						//注销掉删除操作
						$(".Delete_Button").hide();
					}, 300);
					//初始化处理意见
					initMisOpinion({
						auditstatus : "1"
					});

				}
			});
		}
		
		function submit() {
			var auditstatus = nui.get("auditstatus").getValue();
			if (auditstatus == "2") { //终止流程
				titleText = "终止";
				submitProcess("终止");
			} else if (auditstatus == "0") { //退回流程
				if (!nui.get("backTo").getValue()) {
					nui.alert("退回环节不能为空！");
					return;
				}
				titleText = "退回";
				submitProcess("退回");
			} else if (auditstatus == "1") { //提交流程
				titleText = "提交";
				submitProcess("提交");
			}
		}
		
		function submitProcess(title) {
			nui.confirm("确定" + title + "流程吗？", "操作提示", function(action) {
				if (action == "ok") {
					var misOpinion = opioionform.getData().misOpinion;//审核意见
					nui.get("creatReimbProcess").setEnabled(false);
					var json = {
						misOpinion : misOpinion,
						workItemID : <%=workitemid%>
					};
					saveData(json);
				}
			});
		}
		
		function saveData(json) {
			ajaxCommon({
				url : "com.zhonghe.ame.invoice.invoice.invoiceReview.biz.ext",
				data : json,
				success : function(o) {
					if (o.result == "success") {
						showTips(titleText + "成功", "系统提示")
						closeOk();
					} else {
						showTips("提交失败，请联系信息技术部人员！")
					}
				}
			})
		}
	</script>

</body>
</html>