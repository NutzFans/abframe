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
<title></title>
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

body .mini-textboxlist {
	border-collapse: collapse;
}
</style>
</head>
<body>
	<%
		long workitemid = (Long) request.getAttribute("workItemID");
	%>
	<div class="nui-fit">
		<div class="mini-panel" title="框架协议签订申请" style="width: 100%;">
			<fieldset id="field1" style="border: solid 1px #aaa; padding: 3px; width: 97%;">
				<form id="form1" method="post">
					<input name="files" id="fileids" class="nui-hidden" />
					<input class="nui-hidden" id="id" name="id" />
					<input name="processid" id="processid" class="nui-hidden" />
					<div style="padding: 5px;">
						<table style="table-layout: fixed;">
							<tr>
								<td class="form_label" align="right">经办人：</td>
								<td>
									<input name="createUserid" id="createUserid" class="nui-hidden" style="width: 300px" />
									<input id="createUsername" class="nui-textbox" enabled="false" style="width: 300px" required="true" />
								</td>
								<td align="right" style="width: 160px">经办部门：</td>
								<td>
									<input name="implementOrg" id="implementOrg" class="nui-hidden" style="width: 300px;" />
									<input id="implementOrgname" name="implementOrgname" class="nui-textbox" enabled="false" style="width: 300px" required="true" />
								</td>
								<td align="right" style="width: 160px">申请日期：</td>
								<td>
									<input id="createTime" name="createTime" class="nui-datepicker" enabled="false" style="width: 300px" />
								</td>
							</tr>
							<tr>
								<td align="right" style="width: 160px">协议名称：</td>
								<td>
									<input id="contractName" name="contractName" enabled="false" class="nui-textbox" style="width: 300px" />
								</td>
								<td align="right" style="width: 100px">协议金额（元）：</td>
								<td>
									<input id="contractSum" name="contractSum" enabled="false" class="nui-textbox" style="width: 300px" />
								</td>
								<td align="right" style="width: 160px">签约方：</td>
								<td>
									<input id="signatoryname" name="signatoryname" enabled="false" class="nui-textbox" style="width: 300px" />
								</td>
							</tr>
							<tr>
								<td align="right" style="width: 160px">协议签约主体：</td>
								<td>
									<input name="contractSubject" id="contractSubject" class="nui-dictcombobox" dictTypeId="ZH_INVOICE_NAME_TYPE" enabled="false" style="width: 300px;" />
								</td>
								<td align="right" style="width: 160px">签署地点：</td>
								<td>
									<input id="projectLocal" name="projectLocal" enabled="false" class="nui-textbox" style="width: 300px" />
								</td>
							</tr>
							<tr>
								<td align="right" style="width: 100px">协议落实部门：</td>
								<td colspan="5">
									<input id="bidUnits" name="bidUnits" class="nui-dictcombobox" dictTypeId="ZH_FEAME_AGREEMENT_ORG" style="width: 100%" required="true" multiSelect="true" enabled="false" />
								</td>
							</tr>
							<tr>
								<td align="right" style="width: 100px">协议内容：</td>
								<td colspan="5">
									<input id="projectSize" name="projectSize" class="nui-textarea" style="width: 100%; height: 120px" required="false" enabled="false" />
								</td>
							</tr>
							<tr>
								<td align="right" style="width: 160px">备注：</td>
								<td colspan="5">
									<input id="remark" name="remark" class="nui-textarea" style="width: 100%; height: 120px" enabled="false" required="false" />
								</td>
							</tr>
						</table>
					</div>
				</form>
				<p style="color: red; padding-left: 50px">补充协议信息:</p>
				<form id="form3" method="post">
					<div style="padding: 5px;">
						<table style="table-layout: fixed;">
							<tr>
								<td align="right" style="width: 160px">协议编号：</td>
								<td>
									<input id="contractNo" name="contractNo" class="nui-textbox" style="width: 300px" required="true" />
								</td>
								<td align="right" style="width: 160px">签订日期：</td>
								<td>
									<input id="signingDate" name="signingDate" class="nui-datepicker" style="width: 300px" required="true" />
								</td>
								<td align="right" style="width: 100px">协议期限：</td>
								<td>
									<input id="contractPeriod" name="contractPeriod" class="nui-textbox" style="width: 300px" required="true" />
								</td>
							</tr>
							<tr>
								<td align="right" style="width: 160px">协议起始日期：</td>
								<td>
									<input name="startTime" class="nui-datepicker" style="width: 300px" required="true">
								</td>
								<td align="right" style="width: 160px">协议结束日期：</td>
								<td>
									<input name="endTime" class="nui-datepicker" style="width: 300px" required="true" />
								</td>
							</tr>
							<tr>
								<td align="right" style="width: 160px">备注：</td>
								<td colspan="5">
									<input name="remark1" class="nui-textarea" style="width: 100%; height: 120px" required="false" />
								</td>
							</tr>
						</table>
					</div>
				</form>

				<fieldset id="field2" style="border: solid 1px #aaa; padding: 3px;">
					<legend>相关附件</legend>
					<jsp:include page="/ame_common/detailFile.jsp" />
				</fieldset>
				<fieldset id="field3" style="border: solid 1px #aaa; padding: 3px;">
					<legend>上传签字盖章版合同</legend>
					<jsp:include page="/ame_common/addFiles.jsp" />
					<div style="color: red; font-size: 14px;">此项为必填项</div>
				</fieldset>
				<jsp:include page="/ame_common/misOpinion.jsp" />
			</fieldset>
		</div>
	</div>
	<div style="text-align: center; padding: 10px;" class="nui-toolbar">
		<a class="nui-button" onclick="submit()" id="creatReimbProcess" style="width: 80px; margin-right: 20px;" iconCls="icon-ok">提交</a>
		<a class="nui-button" onclick="onCancel" id="saveReimbProcess" style="width: 80px; margin-right: 140px;" iconCls="icon-close">关闭</a>
	</div>

	<script type="text/javascript">
		nui.parse();
		var form = new nui.Form("#form1");
		var form3 = new nui.Form("#form3");
		var projectid =<%=request.getParameter("projectid")%>;
		var workItemID =<%=request.getParameter("workItemID")%>;
		var opioionform = new nui.Form("#opioionform");
		var payContractId = "";
		isViewDelete = false;

		init();

		function init() {
			var data = {workitemid :<%=workitemid%>};
			var json = nui.encode(data);
			nui.ajax({
				url : "com.zhonghe.ame.contractPact.frameAgreement.queryFrameAgreementInfo.biz.ext",
				type : "post",
				data : json,
				contentType : 'text/json',
				success : function(o) {
					form.setData(o.data);
					nui.get('bidUnits').setValue(o.data.bidUnitsCode);
					nui.get('bidUnits').setText(o.data.bidUnitsName);
					form3.setData(o.data);
					payContractId = o.data.id;
					nui.ajax({
						url : "com.zhonghe.ame.contractPact.frameAgreement.queryframeAgreementById.biz.ext",
						type : "post",
						data : nui.encode({
							'id' : o.data.id
						}),
						contentType : 'text/json',
						success : function(o) {
							nui.get("createUsername").setValue(o.data.empname);
							nui.get("implementOrgname").setValue(o.data.orgname);
						}
					});
					nui.get("backTo").setData(o.data.backList);
					var grid_0 = nui.get("grid_0");
					grid_0.load({
						"groupid" : "ZH_CONTRACTFEAME",
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
			if (!form3.validate()) {
				showTips("请检查表单的完整性!", "danger");
				return;
			}
			var tb = document.getElementById("filetable0");
			var rows = tb.rows;
			if (rows.length < 2 || rows.length == null) {
				showTips("请上传签字盖章版合同附件", "danger");
				return;
			}
			var auditstatus = nui.get("auditstatus").getValue();
			console.log(auditstatus);
			if (auditstatus == "2") { //终止流程
				titleText = "终止";
				submitProcess("终止");
			} else if (auditstatus == "0") { //退回流程
				if (!nui.get("backTo").getValue()) {
					showTips("退回环节不能为空！", "danger");
					return;
				}
				titleText = "退回";
				submitProcess("退回");
			} else if (auditstatus == "1") { //提交流程
				titleText = "提交";
				submitProcess("提交");
			}
		}

		// 提交 
		function submitProcess(title) {
			nui.confirm("确定" + title + "流程吗？", "操作提示", function(action) {
				if (action == "ok") {
					document.getElementById("fileCatalog").value = "frameAgreementInfo";
					form2.submit();
				}
			});
		}

		function SaveData() {
			var form3 = new nui.Form("form3");
			var data = form3.getData();
			data.id = nui.get("id").getValue();
			data.remark = nui.get("remark").getValue();
			data.files = nui.get("fileids").getValue();
			var misOpinion = opioionform.getData().misOpinion;//审核意见
			nui.get("creatReimbProcess").setEnabled(false);
			var json = {
				'cpData' : data,
				misOpinion : misOpinion,
				workItemID :<%=workitemid%>};
			mini.mask({
				el : document.body,
				cls : 'mini-mask-loading',
				html : titleText + '中...'
			});
			nui.ajax({
				url : "com.zhonghe.ame.contractPact.frameAgreement.AgreementReview.biz.ext",
				type : "post",
				data : json,
				contentType : "text/json",
				success : function(o) {
					nui.unmask(document.body);
					if (o.result == "success") {
						showTips(titleText + "框架协议成功");
						CloseWindow("ok");
					} else {
						showTips("提交失败，请联系信息技术部人员！", "danger");
					}
				},
				error : function(jqXHR, textStatus, errorThrown) {
					alert(jqXHR.responseText);
				}
			})
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
		
 		// 提示框
		function showTips(content, state) {
			//  state  default|success|info|warning|danger
			if(state) {
				nui.showTips({content: content, state: state, x: "center", y: "center",timeout: 3500.});
			}
			else {
				nui.showTips({content: content, state: "success", x: "center", y: "center",timeout: 3500.});
			}
		}		
		
	</script>
</body>
</html>
