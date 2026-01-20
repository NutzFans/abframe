<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<style type="text/css">
html,body {
	margin: 0;
	padding: 0;
	border: 0;
	width: 100%;
	height: 100%;
	overflow: hidden;
}
</style>
<head>
<title>客户信息审核</title>
</head>
<body>
	<%
		long workItemId = (Long) request.getAttribute("workItemID");
	%>
	<div class="nui-fit" style="padding: 5px;">
		<fieldset id="field1" style="border: solid 1px #aaa;">
			<legend>客户信息</legend>
			<form id="flowForm" method="post">
				<input name="custid" class="nui-hidden" />
				<input name="processid" class="nui-hidden" />
				<div style="padding: 5px;">
					<table style="table-layout: fixed;">
						<tr>
							<td align="right" style="width: 70px">创建人：</td>
							<td>
								<input name="custmanager" class="nui-textbox" style="width: 200px" readonly="readonly" />
							</td>
							<td align="right" style="width: 70px">创建单位：</td>
							<td>
								<input name="accoutname" class="nui-textbox" style="width: 200px" readonly="readonly" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 70px">客户名称：</td>
							<td colspan="3">
								<input name="custname" class="nui-textbox" style="width: 100%" readonly="readonly" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 70px">客户类型：</td>
							<td colspan="3">
								<input name="custtype" class="nui-dictcombobox" dictTypeId="CUSTOMER_TYPE" style="width: 100%" readonly="readonly" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 110px">统一社会信用代码：</td>
							<td colspan="3">
								<input name="custnum" class="nui-textbox" style="width: 100%" readonly="readonly" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 70px">所属省份：</td>
							<td colspan="3">
								<input name="provinces" class="nui-dictcombobox" dictTypeId="AME_PROVINCE" style="width: 100%" readonly="readonly" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 70px">集团内/外：</td>
							<td colspan="3">
								<input name="outsideGroup" class="nui-dictcombobox" dictTypeId="ZH_GROUP_NEW" style="width: 100%" readonly="readonly" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 70px">境内/外：</td>
							<td colspan="3">
								<input name="overseasCustomer" class="nui-dictcombobox" dictTypeId="ZH_OVERSEAS" style="width: 100%" readonly="readonly" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 70px">备注：</td>
							<td colspan="3">
								<input name="remarks" class="nui-textarea" style="width: 100%; height: 100px" readonly="readonly" />
							</td>
						</tr>
					</table>
				</div>
			</form>
		</fieldset>
		<p>
			<jsp:include page="/ame_common/misOpinion_Freeflow.jsp" />
	</div>
	
	<div style="text-align: center; padding: 5px; margin-bottom: 1px" class="nui-toolbar">
		<a class="nui-button" onclick="countersign()" id="countersign" iconCls="icon-user" style="width: 60px; margin-right: 20px;">加签</a>
		<a class="nui-button" onclick="submit()" id="creatReimbProcess" iconCls="icon-ok" style="width: 60px; margin-right: 20px;">提交</a>
		<a class="nui-button" onclick="closeCancel" iconCls="icon-close" style="width: 60px;">关闭</a>
	</div>	

	<script type="text/javascript">
		nui.parse();
		var workItemId = <%=workItemId%>;
		var flowForm = new nui.Form("#flowForm");
		var opioionForm = new nui.Form("opioionform");
		var opioionGrid = nui.get("datagrid1");
		var countersignUsers, titleText;

		init();

		function init() {
			var data = {
				"workItemId" : workItemId
			};
			var json = nui.encode(data);
			ajaxCommon({
				url : "com.zhonghe.ame.marketInfo.marketinfo.khxx.newCustomers.queryCustInfoById.biz.ext",
				data : json,
				success : function(result) {
					flowForm.setData(result.mainData);
					nui.get("backTo").setData(result.mainData.backList);
					opioionGrid.load({
						processInstID : result.mainData.processid
					});
					opioionGrid.sortBy("time", "desc");
					initMisOpinion({
						auditstatus : "1"
					});
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
				title : "加签人员选择",
				width : 430,
				height : 400,
				ondestroy : function(action) {
					console.log(action)
					var user, users = "【";
					countersignUsers = [];
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
							submitProcess(titleText);
						}
					}

				}
			});
		}
		
		function submit() {
			var auditstatus = nui.get("auditstatus").getValue();
			if (auditstatus == "2") { //终止流程
				titleText = "终止";
			} else if (auditstatus == "0") { //退回流程
				if (!nui.get("backTo").getValue()) {
					showTips("退回环节不能为空！");
					return;
				}
				titleText = "退回";
			} else if (auditstatus == "1") { //提交流程
				titleText = "提交";
			}
			submitProcess(titleText);
		}
		
		function submitProcess(title) {
			nui.confirm("确定" + titleText + "流程吗？", "操作提示", function(action) {
				if (action == "ok") {
					nui.get("countersign").disable();
					nui.get("creatReimbProcess").disable();
					nui.mask({
						el : document.body,
						cls : 'mini-mask-loading',
						html : '表单提交中...'
					});
					saveData();
				}
			});
		}
		
		function saveData() {
			var formData = flowForm.getData();
			var misOpinion = opioionForm.getData().misOpinion;
			var json = {
				"custData" : formData,
				"misOpinion" : misOpinion,
				"workItemId" : workItemId,
				"countersignUsers" : countersignUsers
			};
			ajaxCommon({
				url : "com.zhonghe.ame.marketInfo.marketinfo.khxx.newCustomers.flowNewCustInfo.biz.ext",
				data : json,
				contentType : 'text/json',
				success : function(o) {
					nui.unmask(document.body);
					if (o.result == "1") {
						showTips("提交成功");
						CloseWindow("ok");
					} else {
						nui.get("countersign").enable();
						nui.get("creatReimbProcess").enable();
					}
				}
			});
		}				
		
	</script>

</body>
</html>