<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>

<head>
<title>评审结果</title>
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
	<div class="nui-fit" style="padding: 5px;">
		<fieldset id="field1" style="border: solid 1px #aaa;">
			<legend>评审结果</legend>
			<form id="form1" method="post">
				<input name="files" id="fileids" class="nui-hidden" />
				<input class="nui-hidden" name="id" />
				<input class="nui-hidden" name="processid" />
				<input name="type" id="type" class="nui-hidden" />
				<input class="nui-hidden" name="purchasMode" id="purchasMode" />
				<input class="nui-hidden" name="proAppUserId" id="proAppUserId" />
				<input class="nui-hidden" name="proAppUserName" id="proAppUserName" />
				<div style="padding: 5px;">
					<table style="table-layout: fixed;">
						<tr>
							<td align="right" style="width: 90px">立项编号：</td>
							<td>
								<input name="proappId" id="proappId" onbuttonclick="onButtonEdit" allowInput="false" class="nui-buttonedit" style="width: 350px" required="true" />
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
								<input name="proAppName" id="proAppName" class="nui-textbox" style="width: 100%;" required="true" readonly="readonly" />
							</td>
							<td align="right" style="width: 90px;">评审结果名称：</td>
							<td>
								<input name="type" id="type" class="nui-hidden" />
								<span data-placement="left" data-tooltip="默认使用立项名称,可自行修改">
									<input name="reportName" id="reportName" class="nui-textbox" style="width: 100%" required="true" />
								</span>
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 90px">立项金额：</td>
							<td>
								<input name="proAppApplyPrice" id="proAppApplyPrice" class="nui-textbox" style="width: 100%;" required="true" readonly="readonly" />
							</td>
							<td class="form_label" align="right" style="width: 120px;">归口部门：</td>
							<td>
								<input id="putunder" name="putunder" class="nui-dictcombobox" dictTypeId="ZH_PUTUNDER" readonly="readonly" style="width: 100%;" required="true" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 90px">最终采购方式：</td>
							<td>
								<input id="finalPurchasMode" name="finalPurchasMode" class="nui-dictcombobox" dictTypeId="ZH_CGFS_NEW" required="true" style="width: 100%;"/>
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 90px;">评审结果说明：</td>
							<td colspan="3">
								<input style="width: 100%; height: 120px;" name="remark" id="remark" class="nui-textarea" required="true" />
							</td>
						</tr>
					</table>
				</div>
			</form>
		</fieldset>

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
			<jsp:include page="/ame_common/inputFileExpand.jsp" />
		</fieldset>

		<fieldset id="field2" style="border: solid 1px #aaa;">
			<legend>审批信息</legend>
			<jsp:include page="/ame_common/misOpinion.jsp" />
		</fieldset>
	</div>

	<div style="text-align: center; position: relative; bottom: 10px" class="nui-toolbar">
		<a class="nui-button" onclick="onOk(0)" id="saveReimb" iconCls="icon-save" style="width: 80px; margin-right: 20px;">暂存</a>
		<a class="nui-button" onclick="onOk(1)" id="creatReimbProcess" iconCls="icon-ok" style="width: 80px; margin-right: 20px;">提交</a>
		<a class="nui-button" onclick="onOk(2)" id="zzFeame" iconCls="icon-split" style="width: 80px; margin-right: 20px;">终止</a>
		<a class="nui-button" onclick="closeCancel()" id="saveReimbProcess" iconCls="icon-close" style="width: 80px; margin-right: 140px;">关闭</a>
	</div>

	<script type="text/javascript">
		nui.parse();
		var form = new nui.Form("#form1");
		var gridDtl = nui.get("grid_detail");
		var id = <%=request.getParameter("id")%>;

		init();

		function init() {
			var json = nui.encode({"workitemid" :<%=workitemid%>});
			nui.ajax({
				url : "com.zhonghe.ame.purchase.purchaseReviewReport.queryReviewReport.biz.ext",
				data : json,
				type : 'POST',
				cache : false,
				contentType : 'text/json',
				success : function(o) {
					var result = o.reviewReport[0];
					form.setData(result);
					queryProAppByCode(result.proAppCode);
					nui.get('orgUnits').setValue(result.proAppOrgId);
					nui.get('orgUnits').setText(result.proAppOrgName);
					nui.get("proappId").setValue(result.proappId);
					nui.get("proappId").setText(result.proAppCode);
					nui.get("purchasMode").setValue(result.purchasMode);
					var grid_0 = nui.get("grid_0");
					grid_0.load({
						"groupid" : "proAppCost",
						"relationid" : result.proappId
					});
					grid_0.sortBy("fileTime", "desc");

					gridDtl.load({
						"pid" : result.proappId
					})

					var inputFileExpandGrid = nui.get("inputFileExpandGrid");
					inputFileExpandGrid.load({
						"groupid" : "purReviewReport",
						"relationid" : result.id
					});
					inputFileExpandGrid.sortBy("fileTime", "desc");

					var grid = nui.get("datagrid1");
					grid.load({
						processInstID : result.processid
					});
					grid.sortBy("time", "desc");
					//设置审核意见基本信息
					nui.get("processinstid").setValue(o.workitem.processInstID);
					nui.get("processinstname").setValue(o.workitem.processInstName);
					nui.get("activitydefid").setValue(o.workitem.activityDefID);
					nui.get("workitemname").setValue(o.workitem.workItemName);
					nui.get("workitemid").setValue(<%=workitemid%>);
					nui.get("isshow").setValue("1");
					nui.get("auditstatus").setValue("4");
					document.getElementById("salesEdit").style.display = "none";
					nui.get("auditopinion").setValue("");
				}
			});
		}
		

		function queryProAppByCode(code) {
			var json = nui.encode({
				"code" : code
			});
			nui.ajax({
				url : "com.zhonghe.ame.purchase.purchaseProApp.queryProAppByCode.biz.ext",
				data : json,
				type : 'POST',
				cache : false,
				contentType : 'text/json',
				success : function(result) {
					var data = result.data;
					nui.get("proAppUserId").setValue(data.createdBy);
					nui.get("proAppUserName").setValue(data.createdUsername);
				}
			});
		}

		function onOk(e) {
			istype = e;
			var info;
			nui.get("auditstatus").setValue("4");
			if (istype == 1) {
				if (!form.validate()) {
					showTips("请检查表单完整性", "danger");
					return;
				}
				// 已上传的文件数量
				var gridFileCount = nui.get("inputFileExpandGrid").getData().length;
				if (gridFileCount == 0) {
					// 刚新增(未上传)的文件数量
					var newFileCount = document.getElementsByName("uploadfile").length;
					if (newFileCount == 0) {
						showTips("请上传相关附件", "danger");
						return;
					}
				}
				info = "提交流程表单？"
			} else if (istype == 0) {
				info = "暂存流程表单？"
			} else {
				info = "终止流程表单？"
				nui.get("auditstatus").setValue(2);
			}

			document.getElementById("fileCatalog").value = "purReviewReport";

			nui.confirm("确定" + info, "系统提示", function(action) {
				if (action == "ok") {
					nui.get("saveReimb").disable();
					nui.get("creatReimbProcess").disable();
					nui.get("zzFeame").disable();
					nui.mask({el: document.body,cls: 'mini-mask-loading',html: '流程表单提交中...'});
					inputFileExpandForm.submit();
				}
			})
		}

		function SaveData() {
			setTimeout(function() {
				nui.unmask(document.body);
				var data = form.getData();
				data.istype = istype;
				data.proAppOrgId = nui.get('orgUnits').getValue();
				data.proAppOrgName = nui.get('orgUnits').getText();
				data.files = nui.get("fileids").getValue();
				var data_opioion = opioionform.getData();
				var json = nui.encode({
					'reviewReport' : data,
					"misOpinion" : data_opioion.misOpinion
				});
				ajaxCommon({
					url : "com.zhonghe.ame.purchase.purchaseReviewReport.editReviewReport.biz.ext",
					data : json,
					contentType : 'text/json',
					success : function(text) {
						if (text.result == "1") {
							showTips("提交成功")
							closeOk();
						} else {
							nui.get("saveReimb").enable();
							nui.get("creatReimbProcess").enable();
							nui.get("zzFeame").enable();
						}
					}
				});				
			}, 2000);
		}

		function onButtonEdit(e) {
			var btnEdit = this;
			mini.open({
				url : "/default/purchase/project/procurementProAppList.jsp",
				title : "采购立项列表",
				width : '80%',
				height : '80%',
				ondestroy : function(action) {
					if (action == "ok") {
						var iframe = this.getIFrameEl();
						var data = iframe.contentWindow.GetData();
						data = mini.clone(data); //必须
						if (data) {
							btnEdit.setValue(data.id);
							btnEdit.setText(data.proAppCode);
							nui.get("proAppUserId").setValue(data.createdBy);
							nui.get("proAppUserName").setValue(data.createdUsername);
							nui.get("proAppName").setValue(data.proAppName);
							nui.get('reportName').setValue(data.proAppName);
							nui.get('orgUnits').setValue(data.proAppOrgId);
							nui.get('orgUnits').setText(data.proAppOrgName);
							nui.get("proAppApplyPrice").setValue(data.proAppApplyPrice);
							nui.get("putunder").setValue(data.putunder);
							nui.get("purchasMode").setValue(data.purchasMode);
							nui.get("type").setValue(data.type);
							btnEdit.doValueChanged();
							gridDtl.load({
								"pid" : data.id
							})

						}
					}
				}
			});
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