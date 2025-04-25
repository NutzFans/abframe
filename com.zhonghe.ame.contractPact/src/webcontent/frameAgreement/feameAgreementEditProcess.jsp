<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<head>
<title>框架协议签订编辑</title>
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
	<div class="nui-fit">
		<fieldset id="field1" style="border: solid 1px #aaa; width: 95%;">
			<form id="form1" method="post">
				<input name="files" id="fileids" class="nui-hidden" />
				<input class="nui-hidden" name="id" />
				<input class="nui-hidden" name="processid" />
				<div style="padding: 1px;">
					<table style="table-layout: fixed;">
						<tr>
							<td class="form_label" align="right" style="width: 140px">经办人：</td>
							<td style="width: 20%">
								<input name="createUserid" id="createUserid" class="nui-hidden" />
								<input id="empname" name="empname" class="nui-textbox" enabled="false" style="width: 100%" required="true" />
							</td>
							<td align="right" style="width: 140px">经办部门：</td>

							<td>
								<input name="implementOrg" id="implementOrg" class="nui-hidden" style="width: 300px" />
								<input name="implementOrgname" id="implementOrgname" class="nui-textbox" enabled="false" style="width: 300px" required="true" />
							</td>
							<td align="right" style="width: 100px">申请日期：</td>
							<td style="width: 20%">
								<input id="createTime" name="createTime" class="nui-datepicker" style="width: 100%" required="true" />
							</td>

						</tr>
						<tr>
							<td align="right" style="width: 120px">合同名称：</td>
							<td>
								<input name="contractName" class="nui-textbox" style="width: 100%" required="true" />
							</td>
							<td align="right" style="width: 100px">协议金额(元)：</td>
							<td>
								<input name="contractSum" class="nui-textbox" style="width: 100%" />
							</td>
							<td align="right" style="width: 10%">签约方：</td>
							<td>
								<input name="signatory" class="nui-combobox" required="true" url="com.zhonghe.ame.chargeContract.chargeContract.queryCusts.biz.ext" filterType="like" textField="custname" valueField="custid"
									dataField="custs" valueFromSelect="true" allowInput="true" style="width: 100%;" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 100px">合同签约主体：</td>
							<td>
								<input id="contractSubject" name="contractSubject" class="nui-dictcombobox" dictTypeId="ZH_INVOICE_NAME_TYPE" style="width: 100%" required="true" />
							</td>
							<td align="right" style="width: 100px">签署地点：</td>
							<td>
								<input name="projectLocal" class="nui-textbox" style="width: 100%" required="true" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 100px">协议落实部门：</td>
							<td colspan="5">
								<input id="bidUnits" name="bidUnits" class="nui-dictcombobox" dictTypeId="ZH_FEAME_AGREEMENT_ORG" style="width: 100%" required="true" multiSelect="true" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 100px">协议内容：</td>
							<td colspan="5">
								<input id="projectSize" name="projectSize" class="nui-textarea" style="width: 100%; height: 120px" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 160px">备注：</td>
							<td colspan="5">
								<input name="remark" class="nui-textarea" style="width: 100%; height: 120px" required="false" />
							</td>
						</tr>
					</table>
				</div>
			</form>
		</fieldset>
		<fieldset id="field2" style="border: solid 1px #aaa; padding: 3px;">
			<jsp:include page="/ame_common/inputFile.jsp" />
		</fieldset>
		<jsp:include page="/ame_common/misOpinion.jsp" />
	</div>
	<div style="text-align: center; padding: 10px;" class="nui-toolbar">
		<a class="nui-button" onclick="onOk(0)" id="saveFeame" style="width: 80px; margin-right: 20px;" iconCls="icon-save">保存</a>
		<a class="nui-button" onclick="onOk(1)" id="creatFeame" style="width: 80px; margin-right: 20px;" iconCls="icon-ok">提交</a>
		<a class="nui-button" onclick="onOk(2)" id="zzFeame" style="width: 80px; margin-right: 20px;" iconCls="icon-split">中止</a>
		<a class="nui-button" onclick="closeCancel" id="saveReimbProcess" style="width: 80px; margin-right: 140px;" iconCls="icon-close">关闭</a>
	</div>

	<script type="text/javascript">
		nui.parse();
		//工作项id
		<%
			long workItemID = (Long) request.getAttribute("workItemID");
		%>
		var form = new nui.Form("#form1");
		var id = "";
		var type;//暂存还是发起

		function onOk(e) {
			//定义变量接受form表单数据
			type = e;
			if (type == 1) {
				if (!form.validate()) {
					showTips("请检查表单的完整性!", "danger");
					return;
				}
				// 已上传的文件数量
				var gridFileCount = nui.get("grid_0").getData().length;
				if(gridFileCount == 0){
					// 刚新增(未上传)的文件数量
					var newFileCount = document.getElementsByName("uploadfile").length;
					if(newFileCount == 0){
						showTips("请上传相关附件", "danger");
						return;
					}
				}				
			}
			nui.get("saveFeame").disable();
			nui.get("creatFeame").disable();
			nui.get("zzFeame").disable();
			document.getElementById("fileCatalog").value = "feameAgreementinfo";
			form2.submit();
		}

		function SaveData() {
			var form = new nui.Form("#form1");
			var data = form.getData();
			data.bidUnitsCode = nui.get("bidUnits").getValue();
			data.bidUnitsName = nui.get("bidUnits").getText();
			var info = "";
			data.type = type;
			if (type == 1) {
				info = "是否提交？"
			} else if (type == 0) {
				info = "是否暂时保存？"
			} else {
				info = "是否中止流程？"
				nui.get("auditstatus").setValue(2);
			}
			var data_opioion = opioionform.getData();
			data.files = nui.get("fileids").getValue();
			var json = nui.encode({
				"cpData" : data,
				"misOpinion" : data_opioion.misOpinion,
				"type" : type
			});
			if (!confirm(info)) {
				nui.get("saveFeame").enable();
				nui.get("creatFeame").enable();
				nui.get("zzFeame").enable();
				nui.get("auditstatus").setValue(4);
				return;
			} else {
				ajaxCommon({
					url : "com.zhonghe.ame.contractPact.frameAgreement.editframeAgreement.biz.ext",
					data : json,
					success : function(text) {
						if (text.result == "1") {
							if (type == 1) {
								showTips("框架协议提交成功")
								closeOk();
							} else if (type == 0) {
								showTips("框架协议暂时保存成功")
								closeOk();
							} else {
								showTips("中止成功")
								closeOk();
							}
						} else {
							nui.get("saveFeame").enable();
							nui.get("creatFeame").enable();
							nui.get("zzFeame").enable();
						}
					}
				});
			}
		}

		function opinion(data) {
			//合同承办部门
			$('#undertakeOrg').val();
			var undertakeOrg = nui.get("undertakeOrg").value;
			if (undertakeOrg) {
				data.undertakeOrg = undertakeOrg;
			}
			//会签部门
			$('#countersignOrg').val();
			var countersignOrg = nui.get("countersignOrg").value;
			if (countersignOrg) {
				data.countersignOrg = countersignOrg;
			}
			//经营计划部
			$('#manageOrg').val();
			var manageOrg = nui.get("manageOrg").value;
			if (manageOrg) {
				data.manageOrg = manageOrg;
			}
			//审计法务部
			$('#auditOrg').val();
			var auditOrg = nui.get("auditOrg").value;
			if (auditOrg) {
				data.auditOrg = auditOrg;
			}
			//总经理
			$('#generalManager').val();
			var generalManager = nui.get("generalManager").value;
			if (generalManager) {
				data.generalManager = generalManager;
			}
			//法人
			$('#legalPerson').val();
			var legalPerson = nui.get("legalPerson").value;
			if (legalPerson) {
				data.legalPerson = legalPerson;
			}
		}

		loadData();

		function loadData() {
			//流程提示信息
			var data = {workItemID :<%=workItemID%>};
			var json = nui.encode(data);
			nui.ajax({
				url : "com.zhonghe.ame.contractPact.frameAgreement.getFrameAgreement.biz.ext",
				type : "post",
				data : json,
				contentType : "text/json",
				success : function(o) {
					//付款申请基本信息
					form.setData(o.agreement);
					nui.get('bidUnits').setValue(o.agreement.bidUnitsCode);
					nui.get('bidUnits').setText(o.agreement.bidUnitsName);
					//附件查询
					var grid_0 = nui.get("grid_0");
					grid_0.load({
						"groupid" : "ZH_CONTRACTFEAME",
						"relationid" : o.agreement.id
					});
					grid_0.sortBy("fileTime", "desc");
					//设置审核意见基本信息
					nui.get("processinstid").setValue(o.workitem.processInstID);
					nui.get("processinstname").setValue(o.workitem.processInstName);
					nui.get("activitydefid").setValue(o.workitem.activityDefID);
					nui.get("workitemname").setValue(o.workitem.workItemName);
					nui.get("workitemid").setValue(<%=workItemID%>);
					nui.get("isshow").setValue("1");
					nui.get("auditstatus").setValue("4");
					document.getElementById("salesEdit").style.display = "none";
					nui.get("auditopinion").setValue("");
					//查询审核意见
					var grid = nui.get("datagrid1");
					if (o.workitem.processInstID != null || o.workitem.processInstID != "") {
						grid.load({
							processInstID : o.workitem.processInstID
						});
						grid.sortBy("time", "desc");
					}

				},
				error : function() {
				}
			});
		}
	</script>
</body>
</html>
