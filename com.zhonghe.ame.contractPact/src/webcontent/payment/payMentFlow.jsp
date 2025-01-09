<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<head>
<title>付款流程审批</title>
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
		<fieldset id="field1" style="border: solid 1px #aaa; padding: 3px; width: 97%;">
			<legend>付款流程审批信息</legend>
			<form id="form1" method="post">
				<input class="nui-hidden" name="id" />
				<input class="nui-hidden" name="processid" />
				<div style="padding: 5px;">
					<table style="table-layout: fixed;">
						<tr>
							<td class="form_label" align="right">经办人：</td>
							<td>
								<input name="createUserid" id="createUserid" class="nui-hidden" style="width: 300px" />
								<input id="createUsername" name="createUsername" class="nui-textbox" enabled="false" style="width: 300px" required="true" />
							</td>
							<td align="right" style="width: 160px">合同承办部门：</td>
							<td>
								<input name="createdOrgid" id="createdOrgid" class="nui-hidden" style="width: 300px;" />
								<input name="implementOrgname" id="implementOrgname" class="nui-textbox" enabled="false" style="width: 300px" required="true" />
							</td>
							<td align="right" style="width: 160px">申请日期：</td>
							<td>
								<input id="createTime" name="createTime" class="nui-datepicker" style="width: 300px" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 160px">合同编号：</td>
							<td>
								<input id="contractId" name="contractId" class="nui-buttonedit" onbuttonclick="onButtonEdit" style="width: 300px" required="true" enabled="false" />
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
								<input id="applyPayContractSum" name="applyPayContractSum" onvaluechanged="editApplyPayContractSum" class="nui-textbox" style="width: 300px" required="true" enabled="false" />
							</td>

						</tr>
						<tr>
							<td align="right" style="width: 160px">发票类型：</td>
							<td>
								<input id="invoiceType" name="invoiceType" class="nui-dictcombobox" dictTypeId="MIS_MA_INVOICETYPE" style="width: 300px" required="true" enabled="false" />
							</td>
							<td align="right" style="width: 160px">本次付款进度：</td>
							<td>
								<input id="payType" name="payType" class="nui-dictcombobox" dictTypeId="payType" style="width: 300px" required="true" enabled="false" />
							</td>
							<td align="right" style="width: 160px">最晚付款日期：</td>
							<td>
								<input id="endTime" name="endTime" class="nui-datepicker" style="width: 300px" required="true" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right">收款单位：</td>
							<td colspan="8">
								<input name="signatory" id="signatory" class="nui-hidden" style="width: 300px" />
								<input id="signatoryName" name="signatoryName" class="nui-textbox" style="width: 100%" required="true" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right">收款单位开户行名称：</td>
							<td colspan="8">
								<input id="accountName" name="accountName" class="nui-textbox" style="width: 100%" required="true" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right">收款单位开户行账号：</td>
							<td colspan="8">
								<input id="account" name="account" class="nui-textbox" style="width: 100%" required="true" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right">支付依据及情况说明：</td>
							<td colspan="8">
								<input id="remark" name="remark" class="nui-textarea" style="width: 100%; height: 235px" required="true" enabled="false" />
							</td>
						</tr>
					</table>
				</div>
			</form>
			<fieldset id="field2" style="border: solid 1px #aaa; padding: 3px;">
				<legend>相关附件</legend>
				<jsp:include page="/ame_common/detailFile.jsp" />
			</fieldset>
			<jsp:include page="/ame_common/misOpinion_Freeflow.jsp" />
		</fieldset>
	</div>

	<div style="text-align: center; padding: 5px;" class="nui-toolbar">
		<a class="nui-button" onclick="countersign()" id="countersign" iconCls="icon-user" style="width: 80px; margin-right: 20px;">加签</a>
		<a class="nui-button" onclick="submit()" id="creatReimbProcess" iconCls="icon-ok" style="width: 80px; margin-right: 20px;">提交</a>
		<a class="nui-button" onclick="closeCancel" id="saveReimbProcess" iconCls="icon-close" style="width: 80px;">关闭</a>
	</div>

	<script type="text/javascript">
		nui.parse();
		<%
			long workitemid = (Long) request.getAttribute("workItemID");
		%>
    	var projectid = <%=request.getParameter("projectid")%>;
    	var workItemID = <%=request.getParameter("workItemID")%>;
    	var opioionform = new nui.Form("#opioionform");
    	var form = new nui.Form("form1");
    	var titleText,countersignUsers;
		init();
		
		function init() {
			var data = {workitemid:<%=workitemid%>};
			var json = nui.encode(data);
			nui.ajax({
				url : "com.zhonghe.ame.payment.payMent.queryPayMentInfo.biz.ext",
				type : "post",
				data : json,
				contentType : 'text/json',
				success : function(o) {
					form.setData(o.data);
					nui.get("contractId").setValue(o.data.contractNo);
					nui.get("contractId").setText(o.data.contractNo);
					nui.get("backTo").setData(o.data.backList);
					//查询并加载附件
					var grid_0 = nui.get("grid_0");
					grid_0.load({
						"groupid" : "PAY_MENT",
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
					}, 100);
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
			} else if (auditstatus == "0") { //退回流程
				if (!nui.get("backTo").getValue()) {
					nui.alert("退回环节不能为空！");
					return;
				}
				titleText = "退回";
			} else if (auditstatus == "1") { //提交流程
				titleText = "提交";
			}
			saveData();
		}
		
		// 提交 
		function saveData() {
			nui.confirm("确定" + titleText + "流程吗？", "操作提示", function(action) {
				if (action == "ok") {
					var data = form.getData();
					var misOpinion = opioionform.getData().misOpinion;//审核意见
					nui.get("creatReimbProcess").setEnabled(false);
					var json = {
						"cpData" : data,
						"misOpinion" : misOpinion,
						"workItemID": <%=workitemid%>,
						"countersignUsers" : countersignUsers
					};
					ajaxCommon({
						url : "com.zhonghe.ame.payment.payMent.payMentReview.biz.ext",
						data : json,
						success : function(o) {
							if (o.result == "success") {
								showTips(titleText + "成功", "系统提示")
								closeOk();
							} else {
								showTips("提交失败，请联系信息技术部人员！")
								closeOk();
							}
						}
					})
				}
			});
		}
		
		function countersign() {
			selectOmEmployee();
		}
		
		function selectOmEmployee() {
			var btnEdit = this;
			nui.open({
				url: "<%=request.getContextPath()%>/contractPact/selectUsers.jsp",
				title : "立项单位经办人",
				width : 430,
				height : 400,
				ondestroy : function(action) {
					countersignUsers = [];
					var user, users = "【";
					if (action == "ok") {
						var iframe = this.getIFrameEl();
						var data = iframe.contentWindow.GetData();
						data = nui.clone(data); //必须
						if (data) {
							for (var i = 0; i < data.length; i++) {
								user = {};
								user.id = data[i].userid
								user.name = data[i].empname
								user.typeCode = "person"
								countersignUsers.push(user);
								if (i == 0) {
									users = users + data[i].empname;
								} else {

									users = users + "," + data[i].empname;
								}
							}
							users = users + "】";
							titleText = "增加审批人员" + users + "并提交";
							saveData();
						}
					}
				}
			});
		}
	</script>

</body>

</html>