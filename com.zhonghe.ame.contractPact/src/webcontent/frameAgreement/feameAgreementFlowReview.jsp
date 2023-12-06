<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<head>
<title>框架协议签订审批</title>
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
	<%long workitemid = (Long)request.getAttribute("workItemID");%>
	<div class="nui-fit">
		<div class="mini-panel" title="框架协议签订申请" style="width: 100%;">
			<fieldset id="field1" style="border: solid 1px #aaa; padding: 3px; width: 97%;">
				<form id="form1" method="post">
					<input name="files" id="fileids" class="nui-hidden" />
					<input name="id" id="id" class="nui-hidden" />
					<div style="padding: 5px;">
						<table style="table-layout: fixed;">
							<tr>
								<td class="form_label" align="right">申请人</td>
								<td>
									<input name="createUserid" id="createUserid" class="nui-hidden" style="width: 200px" />
									<input id="createUsername" class="nui-textbox" enabled="false" style="width: 200px" required="true" />
								</td>
								<td align="right" style="width: 140px">合同实施部门：</td>
								<td>
									<input name="implementOrg" id="implementOrg" class="nui-hidden" style="width: 200px;" />
									<input id="implementOrgname" name="implementOrgname" class="nui-textbox" enabled="false" style="width: 200px" required="true" />
								</td>
								<td align="right" style="width: 140px">申请日期：</td>
								<td>
									<input id="createTime" name="createTime" class="nui-datepicker" enabled="false" style="width: 200px" />
								</td>
							</tr>
							<tr>
								<td align="right" style="width: 140px">合同名称：</td>
								<td>
									<input id="contractName" name="contractName" enabled="false" class="nui-textbox" style="width: 200px" />
								</td>
								<td align="right" style="width: 100px">协议金额（元）：</td>
								<td>
									<input id="contractSum" name="contractSum" enabled="false" class="nui-textbox" style="width: 200px" />
								</td>
								<td align="right" style="width: 140px">签署地点：</td>
								<td>
									<input id="projectLocal" name="projectLocal" enabled="false" class="nui-textbox" style="width: 200px" />
								</td>
							</tr>
							<tr>
								<td align="right" style="width: 140px">签约方：</td>
								<td>
									<input id="signatoryname" name="signatoryname" enabled="false" class="nui-textbox" style="width: 200px" />
								</td>
								<td align="right" style="width: 140px">合同签约主体：</td>
								<td>
									<input name="contractSubject" id="contractSubject" class="nui-dictcombobox" dictTypeId="ZH_INVOICE_NAME_TYPE" enabled="false" style="width: 200px;" />
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
							<!-- 20230404 此两个字段在审批过程中不显示  -->
							<tr class="nui-hidden">
								<td align="right" style="width: 140px">合同起始日期：</td>
								<td>
									<input id="startTime" name="startTime" enabled="false" class="nui-datepicker" style="width: 200px" />
								</td>
								<td align="right" style="width: 140px">合同结束日期：</td>
								<td>
									<input id="endTime" name="endTime" enabled="false" class="nui-datepicker" style="width: 200px" />
								</td>
							</tr>
							<tr>
								<td align="right" style="width: 160px">备注：</td>
								<td colspan="5">
									<input name="remark" class="nui-textarea" style="width: 100%; height: 120px" required="false"/>
								</td>
							</tr>
						</table>
					</div>
				</form>
				<jsp:include page="/ame_common/inputFile.jsp" />
				<jsp:include page="/ame_common/misOpinion_Freeflow.jsp" />
			</fieldset>
		</div>
	</div>
	<div style="text-align: center; padding: 5px;" class="nui-toolbar">
		<a class="nui-button" onclick="countersign()" id="countersign" iconCls="icon-user" style="width: 80px; margin-right: 20px;">加签</a>
		<a class="nui-button" onclick="submit()" id="creatReimbProcess" iconCls="icon-ok" style="width: 80px; margin-right: 20px;">提交</a>
		<a class="nui-button" onclick="closeCancel()" id="saveReimbProcess" iconCls="icon-close" style="width: 80px; margin-right: 0px;">关闭</a>
	</div>

	<script type="text/javascript">
		nui.parse();
		var form = new nui.Form("form1");
		var projectid =<%=request.getParameter("projectid")%>;
		var workItemID =<%=request.getParameter("workItemID")%>;
		var opioionform = new nui.Form("#opioionform");
		var titleText, countersignUsers;
		isViewDelete = false;
		
		init();
		
		function init() {
			var data = {
				workitemid :<%=workitemid%>
			};
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
					if (null != o.data.contractSum) {
						nui.get("contractSum").setValue(o.data.contractSum);
					}
					if (null != o.data.contractSubject) {
						nui.get("contractSubject").setValue(o.data.contractSubject);
					}

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
					//查询并加载附件
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

		function countersign() {
			selectOmEmployee();
		}

		function selectOmEmployee() {
			var btnEdit = this;
			nui.open({
				url : "<%=request.getContextPath() %>/contractPact/selectUsers.jsp",
				title : "选择人员",
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
							form2.submit();
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
					nui.alert("退回环节不能为空！");
					return;
				}
				titleText = "退回";
			} else if (auditstatus == "1") { //提交流程
				titleText = "提交";
			}
			form2.submit();
		}
		
		// 提交 
		function SaveData() {
			saveData();
		}

		function saveData(json) {
			nui.confirm("确定" + titleText + "流程吗？", "操作提示", function(action) {
				if (action == "ok") {
					var data = form.getData();
					data.bidUnitsCode = nui.get("bidUnits").getValue();
					data.bidUnitsName = nui.get("bidUnits").getText();
					var misOpinion = opioionform.getData().misOpinion;//审核意见
					data.files = nui.get("fileids").getValue();
					var json = {
						'cpData' : data,
						misOpinion : misOpinion,
						workItemID :<%=workitemid %>,
						"countersignUsers" : countersignUsers
					};
					ajaxCommon({
						url : "com.zhonghe.ame.contractPact.frameAgreement.AgreementReview.biz.ext",
						data : json,
						success : function(o) {
							if (o.result == "success") {
								showTips("提交成功", "系统提示")
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
	</script>
</body>
</html>
