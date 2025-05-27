<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<head>
<title>评审结果</title>
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
	<div class="nui-fit" style="padding: 5px;">
		<form id="form1" method="post">
			<fieldset id="field1" style="border: solid 1px #aaa;">
			<legend>评审结果</legend>
				<input name="files" id="fileids" class="nui-hidden" />
				<input class="nui-hidden" name="id" />
				<input class="nui-hidden" name="proappId" />
				<input class="nui-hidden" name="processid" />
				<div style="padding: 5px;">
					<table style="table-layout: fixed;">
						<tr>
							<td align="right" style="width: 90px">立项编号：</td>
							<td>
								<input name="proappId" id="proappId" allowInput="false" class="nui-buttonedit" style="width: 350px" readonly="readonly" />
							</td>
							<td align="right" style="width: 90px">采购需求单位：</td>
							<td>
								<input name="orgUnits" id="orgUnits" class="nui-textboxlist" dataField="orgUnits" url="com.zhonghe.ame.purchase.common.queryOrgByName.biz.ext" valueField="orgcode" textField="orgname"
									inputMode="false" style="width: 700px" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 90px">立项名称：</td>
							<td>
								<input name="proAppName" id="proAppName" class="nui-textbox" style="width: 100%;" readonly="readonly" />
							</td>
							<td align="right" style="width: 90px;">评审结果名称：</td>
							<td>
								<input name="type" id="type" class="nui-hidden" />
								<span data-placement="left" data-tooltip="默认使用立项名称,可自行修改">
									<input name="reportName" id="reportName" class="nui-textbox" style="width: 100%" readonly="readonly" />
								</span>
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 90px">立项金额：</td>
							<td>
								<input name="proAppApplyPrice" id="proAppApplyPrice" class="nui-textbox" style="width: 100%;" readonly="readonly" />
							</td>
							<td class="form_label" align="right" style="width: 90px;">归口部门：</td>
							<td>
								<input id="putunder" name="putunder" class="nui-dictcombobox" dictTypeId="ZH_PUTUNDER" readonly="readonly" style="width: 100%;" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 90px">最终采购方式：</td>
							<td>
								<input id="finalPurchasMode" name="finalPurchasMode" class="nui-dictcombobox" dictTypeId="ZH_CGFS_NEW" readonly="readonly" style="width: 100%;"/>
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 90px;">评审结果说明：</td>
							<td colspan="3">
								<input style="width: 100%; height: 120px;" name="remark" id="remark" class="nui-textarea" readonly="readonly" />
							</td>
						</tr>
					</table>
				</div>
			</fieldset>
		</form>	

		<fieldset style="border: solid 1px #aaa;">
			<legend>采购立项明细</legend>
			<div id="grid_detail" class="nui-datagrid" style="width: 100%; height: auto;" dataField="datas" showPager="false" multiSelect="true"
				url="com.zhonghe.ame.purchase.dao.projectApproval.queryProAppDtl.biz.ext">
				<div property="columns">
					<div type="indexcolumn" align="center" headerAlign="center" visible="false"></div>
					<div field="planName" width="110" align="center" headerAlign="center">计划名称</div>
					<div field="code" width="100" align="center" headerAlign="center">计划编号</div>
					<div field="materialName" width="110" align="center" headerAlign="center">采购物项名称</div>
					<div field="budgetAmount" width="100" align="center" headerAlign="center">预算金额(万元)</div>
					<div field="amount" width="100" align="center" headerAlign="center">立项金额(万元)</div>
					<div field="sumamount" width="110" align="center" headerAlign="center" vtype="required">剩余可立项金额(万元)</div>
					<div field="needOrgName" width="80" align="left" headerAlign="center">采购单位</div>
				</div>
			</div>
		</fieldset>

		<fieldset id="field3" style="border: solid 1px #aaa;">
			<legend>采购立项 - 附件</legend>
			<jsp:include page="/ame_common/detailFile.jsp" />
		</fieldset>

		<fieldset id="field4" style="border: solid 1px #aaa;">
			<legend>评审结果 - 附件</legend>
			<jsp:include page="/ame_common/detailFileExpand.jsp" />
		</fieldset>

		<fieldset style="border: solid 1px #aaa;">
			<legend>审批信息</legend>
			<jsp:include page="/ame_common/misOpinion_Freeflow.jsp" />
		</fieldset>
	</div>

	<div style="text-align: center; position: relative; bottom: 10px" class="nui-toolbar">
		<a class="nui-button" onclick="countersign()" id="countersign" iconCls="icon-user" style="width: 80px; margin-right: 20px;">加签</a>
		<a class="nui-button" onclick="onOk()" id="creatReimbProcess" style="width: 80px; margin-right: 20px;">提交</a>
		<a class="nui-button" onclick="onCancel" id="saveReimbProcess" style="width: 80px; margin-right: 140px;">关闭</a>
	</div>

	<script type="text/javascript">
		nui.parse();
		var id = <%=request.getParameter("id")%>;
		var form = new nui.Form("#form1");
		var countersignUsers, titleText;
		var gridDtl = nui.get("grid_detail");

		init();

		function init() {
			var data = {workitemid :<%=workitemid%>};
			var json = nui.encode(data);
			nui.ajax({
				url : "com.zhonghe.ame.purchase.purchaseReviewReport.queryReviewReport.biz.ext",
				data : json,
				type : 'POST',
				cache : false,
				contentType : 'text/json',
				success : function(o) {
					var result = o.reviewReport[0];
					form.setData(result);
					nui.get('orgUnits').setValue(result.proAppOrgId);
					nui.get('orgUnits').setText(result.proAppOrgName);
					nui.get("proappId").setValue(result.proappId);
					nui.get("proappId").setText(result.proAppCode);
					gridDtl.load({
						"pid" : result.proappId
					})
					nui.get("backTo").setData(result.backList);
					var grid_0 = nui.get("grid_0");
					grid_0.load({
						"groupid" : "proAppCost",
						"relationid" : result.proappId
					});
					grid_0.sortBy("fileTime", "desc");
					var detailFileExpandGrid = nui.get("detailFileExpandGrid");
					detailFileExpandGrid.load({
						"groupid" : "purReviewReport",
						"relationid" : result.id
					});
					detailFileExpandGrid.sortBy("fileTime", "desc");
					var grid = nui.get("datagrid1");
					grid.load({
						processInstID : result.processid
					});
					grid.sortBy("time", "desc");
					initMisOpinion({
						auditstatus : "1"
					});
				}
			});
		}
		
		function countersign() {
			selectOmEmployee2();
		}
		
		function selectOmEmployee2() {
			var btnEdit = this;
			nui.open({
				url : "<%=request.getContextPath()%>/contractPact/selectUsers.jsp",
				title : "立项单位经办人",
				width : 430,
				height : 400,
				ondestroy : function(action) {
					var user, users = "【";
					countersignUsers = [];
					if (action == "ok") {
						var iframe = this.getIFrameEl();
						var data = iframe.contentWindow.GetData();
						data = nui.clone(data); //必须
						if (data) {
							console.log(data)
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
		
		function onOk() {
			var auditstatus = nui.get("auditstatus").getValue();
			if (auditstatus == "2") { //终止流程
				titleText = "终止";
				submitProcess(titleText);
			} else if (auditstatus == "0") { //退回流程
				if (!nui.get("backTo").getValue()) {
					nui.alert("退回环节不能为空！");
					return;
				}
				titleText = "退回";
				submitProcess(titleText);
			} else if (auditstatus == "1") { //提交流程
				titleText = "提交";
				submitProcess(titleText);
			}

		}
		
		function submitProcess(title) {
			nui.confirm("确定" + titleText + "流程吗？", "操作提示", function(action) {
				if (action == "ok") {
					nui.get("countersign").disable();
					nui.get("creatReimbProcess").disable();
					nui.mask({el: document.body,cls: 'mini-mask-loading',html: '表单提交中...'});
					saveData();
				}
			});
		}
		
		function saveData() {
			setTimeout(function() {
				nui.unmask(document.body);
				var data = form.getData();
				data.files = nui.get("fileids").getValue();
				var misOpinion = opioionform.getData().misOpinion;//审核意见
				var json = {
					'reviewReport' : data,
					'misOpinion' : misOpinion,
					'workItemID' :<%=workitemid%>,
					"countersignUsers" : countersignUsers
				};
				ajaxCommon({
					url : "com.zhonghe.ame.purchase.purchaseReviewReport.purReviewReportApproval.biz.ext",
					data : json,
					contentType : 'text/json',
					success : function(o) {
						if (o.result == "1") {
							showTips("提交成功");
							CloseWindow("ok");
						} else {
							nui.get("countersign").enable();
							nui.get("creatReimbProcess").enable();
						}
					}
				});				
			}, 2000);
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
	</script>

</body>
</html>