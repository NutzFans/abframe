<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<head>
<title>收费合同签订申请</title>
<style type="text/css">
	body {
		margin: 0;padding: 0;border: 0;width: 100%;height: 100%;overflow: hidden;
	}
</style>
</head>
<body>
	<div class="nui-fit">
		<div class="mini-panel" title="" style="width: 100%;">
			<fieldset id="field1" style="border: solid 1px #aaa; padding: 3px; width: 100%;">
				<legend>收费合同签订信息</legend>
				<form id="form1" method="post">
					<input name="files" id="fileids1" class="nui-hidden" />
					<input name="id" id="id" class="nui-hidden" />
					<input name="processid" id="processid" class="nui-hidden" />
					<div style="padding: 5px;">
						<table style="table-layout: fixed;">
							<tr>
								<td align="right" style="width: 120px">合同名称：</td>
								<td colspan="7">
									<input name="contractName" id="contractName" class="nui-textbox" style="width: 100%" required="true" enabled="false" />
								</td>
							</tr>
							<tr>
								<td class="form_label" align="right">申请人：</td>
								<td>
									<input name="createUserid" id="createUserid" class="nui-hidden" style="width: 300px" />
									<input id="createUsername" name="createUsername" class="nui-textbox" enabled="false" style="width: 300px" required="true" />
								</td>
								<td align="right" style="width: 120px">合同实施部门：</td>
								<td>
									<input name="implementOrg" id="implementOrg" shownullItem=ture class="nui-treeselect" textField="orgname" valueField="orgid" parentField="omOrganization.orgid" dataField="orgs"
										showTreeIcon="true" valueFromSelect="true" style="width: 100%;" url="com.zhonghe.ame.imptask.keytask.getAllRunOrgsforzdrw.biz.ext" allowInput="true" required="true"
										onvaluechanged="changeOrgForm(e)" multiSelect="false" checkRecursive="false" expandOnLoad="0" showFolderCheckBox="true" enabled="false" />
									<input name="implementOrgname" id="implementOrgname" class="nui-hidden" readonly="readonly" style="width: 100%" />
								</td>
							</tr>
							<tr>
								<td align="right" style="width: 160px">申请日期：</td>
								<td>
									<input id="createTime" name="createTime" class="nui-datepicker" style="width: 300px" required="true" enabled="false" />
								</td>
								<td align="right" style="width: 160px">投标记录：</td>
								<td>
									<input id="tenderId" name="tenderId" class="nui-buttonedit" onbuttonclick="onButtonEdit" style="width: 300px" required="false" enabled="false" />
								</td>
							</tr>
							<tr>
								<td align="right" style="width: 100px">专业类别：</td>
								<td>
									<input id="major" name="major" class="nui-dictcombobox" dictTypeId="ZH_MAJOR_TYPE" style="width: 300px" required="true" enabled="false" />
								</td>
								<td align="right" style="width: 100px">工程类别：</td>
								<td>
									<input id="projectType" name="projectType" class="nui-dictcombobox" dictTypeId="ZH_PROJECT_TYPE" style="width: 300px" required="true" enabled="false" />
								</td>
							</tr>
							<tr>
								<td align="right" style="width: 100px">合同价格模式：</td>
								<td>
									<input id="contractModel" name="contractModel" class="nui-dictcombobox" dictTypeId="CONTRACT_MODEL" style="width: 300px" required="true" enabled="false" />
								</td>
								<td align="right" style="width: 100px">招标人采购方式:</td>
								<td>
									<input id="procurementType" name="procurementType" class="nui-dictcombobox" dictTypeId="ZH_PROCUREMENT_TYPE" style="width: 100%" required="true" enabled="false" />
								</td>
							</tr>
							<tr>
								<td align="right" style="width: 100px">集团内外：</td>
								<td>
									<input id="headquarterGroup" name="headquarterGroup" class="nui-dictcombobox" dictTypeId="ZH_GROUP" style="width: 300px" required="true" enabled="false" />
								</td>
								<td align="right" style="width: 120px">合同金额(元)：</td>
								<td>
									<input name="contractSum" id="contractSum" class="nui-textbox" vtype="float" style="width: 300px" required="true" onvaluechanged="editContractSum" enabled="false" />
								</td>
							</tr>
							<tr>

								<td align="right" style="width: 120px">合同不含税金额(元)：</td>
								<td>
									<input name="noTaxSum" id="noTaxSum" class="nui-textbox" vtype="float" style="width: 300px" required="true" onvaluechanged="editContractSum" enabled="false" />
								</td>
								<td align="right" style="width: 120px">税额(元)：</td>
								<td>
									<input name="payTax" id="payTax" class="nui-textbox" vtype="float" style="width: 300px" required="true" enabled="false" />
								</td>
							</tr>
							<tr>
								<td align="right" style="width: 130px">
									<nobr>签约方：</nobr>
								</td>
								<td>
									<input name="signatory" id="custId" class="nui-combobox" required="true" url="com.zhonghe.ame.chargeContract.chargeContract.queryCusts.biz.ext" filterType="like" textField="custname"
										valueField="custid" dataField="custs" valueFromSelect="true" allowInput="true" pinyinField="custtype" style="width: 100%;" enabled="false" />
								</td>
								<td align="right" style="width: 100px">合同签约主体：</td>
								<td>
									<input id="contractSubject" name="contractSubject" class="nui-dictcombobox" dictTypeId="ZH_INVOICE_NAME_TYPE" enabled="false" style="width: 300px" required="true" />
								</td>
							</tr>
							<tr>
								<td align="right" style="width: 100px">收款方:</td>
								<td>
									<input id="payee" name="payee" class="nui-dictcombobox" dictTypeId="PAYER" style="width: 100%" required="true" enabled="false" />
								</td>
								<td align="right" style="width: 100px">合同文本密级:</td>
								<td>
									<input id="contractSecretLevel" name="contractSecretLevel" class="nui-dictcombobox" dictTypeId="CONTRACT_SECRET_LEVEL" style="width: 100%" required="true" enabled="false" />
								</td>
							</tr>
							<tr>
								<td align="right" style="width: 100px">项目密级:</td>
								<td>
									<input id="projectSecretLevel" name="projectSecretLevel" class="nui-dictcombobox" dictTypeId="PROJECT_SECRET_LEVEL" style="width: 100%" required="true" enabled="false" />
								</td>
								<td align="right" style="width: 100px">是否计划对外分包:</td>
								<td>
									<input id="isfb" name="isfb" class="nui-dictcombobox" dictTypeId="ABF_YESORNO" style="width: 100%" required="true" enabled="false" />
								</td>
							</tr>
							<tr>
								<td align="right" style="width: 160px">备注：</td>
								<td colspan="5">
									<input name="remark" class="nui-textarea" style="width: 100%" required="false" enabled="false" />
								</td>
							</tr>
						</table>
					</div>
					<p style="color: red;">补充合同信息:</p>
					<div style="padding: 5px;">
						<table style="table-layout: fixed;">
							<tr>
								<td align="right" style="width: 160px">合同编号：</td>
								<td>
									<input id="contractNo" name="contractNo" class="nui-textbox" style="width: 200px" required="true" />
								</td>
								<td align="right" style="width: 100px">签订日期：</td>
								<td>
									<input id="signingDate" name="signingDate" class="nui-datepicker" style="width: 200px" required="true" />
								</td>
						</table>
					</div>
				</form>
				<fieldset id="field3" style="border: solid 1px #aaa; padding: 3px;">
					<legend>未来年度收款计划</legend>
					<div id="datagrid2" class="nui-datagrid" style="width: 100%; height: 200px;" allowResize="true" showSummaryRow="true" datafield="data" allowCellEdit="true" allowCellSelect="true"
						multiSelect="true" allowSortColumn="false" showPager="false">
						<div property="columns">
							<div field="years" width="80" headerAlign="center" allowSort="true">
								年份
								<input property="editor" class="nui-textbox" style="width: 100%;" />
							</div>
							<div field="jan" width="80" headerAlign="center" allowSort="true">
								一月
								<input property="editor" class="nui-textbox" id="jan" style="width: 100%;" />
							</div>
							<div field="feb" width="80" headerAlign="center" allowSort="true">
								二月
								<input property="editor" class="nui-textbox" style="width: 100%;" />
							</div>
							<div field="mar" width="80" headerAlign="center" allowSort="true">
								三月
								<input property="editor" class="nui-textbox" style="width: 100%;" />
							</div>
							<div field="apr" width="80" headerAlign="center" allowSort="true">
								四月
								<input property="editor" class="nui-textbox" style="width: 100%;" />
							</div>
							<div field="may" width="80" headerAlign="center" allowSort="true">
								五月
								<input property="editor" class="nui-textbox" style="width: 100%;" />
							</div>
							<div field="jun" width="80" headerAlign="center" allowSort="true">
								六月
								<input property="editor" class="nui-textbox" style="width: 100%;" />
							</div>
							<div field="jul" width="80" headerAlign="center" allowSort="true">
								七月
								<input property="editor" class="nui-textbox" style="width: 100%;" />
							</div>
							<div field="aug" width="80" headerAlign="center" allowSort="true">
								八月
								<input property="editor" class="nui-textbox" style="width: 100%;" />
							</div>
							<div field="sep" width="80" headerAlign="center" allowSort="true">
								九月
								<input property="editor" class="nui-textbox" style="width: 100%;" />
							</div>
							<div field="oct" width="80" headerAlign="center" allowSort="true">
								十月
								<input property="editor" class="nui-textbox" style="width: 100%;" />
							</div>
							<div field="nov" width="80" headerAlign="center" allowSort="true">
								十一月
								<input property="editor" class="nui-textbox" style="width: 100%;" />
							</div>
							<div field="dec" width="80" headerAlign="center" allowSort="true">
								十二月
								<input property="editor" class="nui-textbox" style="width: 100%;" />
							</div>
							<div field="sum" width="120" headerAlign="center" allowSort="true" summaryType="sum">
								总计
								<input property="editor" class="nui-textbox" style="width: 100%;" />
							</div>

						</div>
					</div>
				</fieldset>
				<fieldset id="field2" style="border: solid 1px #aaa; padding: 3px;">
					<legend>相关附件</legend>
					<jsp:include page="/ame_common/detailFile.jsp" />
				</fieldset>
				<fieldset id="field3" style="border: solid 1px #aaa; padding: 3px;">
					<legend>上传签字盖章版合同</legend>
					<jsp:include page="/ame_common/addFiles1.jsp" />
					<div style="color: red; font-size: 14px;">此项为必填项</div>
				</fieldset>
				<jsp:include page="/ame_common/misOpinion.jsp" />
			</fieldset>
		</div>
	</div>

	<div style="text-align: center; padding: 8px;" class="nui-toolbar">
		<a class="nui-button" onclick="submit()" id="creatReimbProcess" iconCls="icon-ok" style="width: 80px; margin-right: 20px;">提交</a>
		<a class="nui-button" onclick="onCancel" id="saveReimbProcess" iconCls="icon-close" style="width: 80px; margin-right: 0px;">关闭</a>
	</div>

	<script type="text/javascript">
		nui.parse();
		var form = new nui.Form("form1");
		<%
			long workitemid = (Long) request.getAttribute("workItemID");
		%>
		var projectid = <%=request.getParameter("projectid")%>;
		var workItemID = <%=request.getParameter("workItemID")%>;
		var opioionform = new nui.Form("#opioionform");
		var payContractId = "", titleText;
		isViewDelete = false;
		var grid2 = nui.get("datagrid2");
		
		init();
		
		function init() {
			var data = {workitemid:<%=workitemid%>};
			var json = nui.encode(data);
			nui.ajax({
				url : "com.zhonghe.ame.chargeContract.chargeContract.queryChargeContractInfo.biz.ext",
				type : "post",
				data : json,
				contentType : 'text/json',
				success : function(o) {
					form.setData(o.data);
					queryPlan(o.data.id);
					if (null != o.data.startTime) {
						nui.get("startTime").setValue(o.data.startTime);
					}
					if (null != o.data.endTime) {
						nui.get("endTime").setValue(o.data.endTime);
					}
					if (null != o.data.contractNo) {
						nui.get("contractNo").setValue(o.data.contractNo);
					}
					payContractId = o.data.id;
					nui.get("backTo").setData(o.data.backList);
					//查询并加载附件
					var grid_0 = nui.get("grid_0");
					grid_0.load({
						"groupid" : "CHARGE_CONTRACT",
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
					//初始化审核意见
					nui.get("auditstatus").setValue(1);//1：通过,0：退回，2：终止流程，3:发起
					document.getElementById("salesEdit").style.display = "none";
				}
			});
		}
		
		function submit() {
			var auditstatus = nui.get("auditstatus").getValue();
			if (auditstatus == 1) {
				form = new nui.Form("#form1");
				form.validate();
				if (form.isValid() == false) {
					showTips("请检查必填项");
					return;
				}
				var filePaths = document.getElementsByName("uploadfile1").length;
				if (filePaths == 0) {
					showTips("请上传签字盖章版合同");
					return;
				} else {
					for (var j = 0; j < filePaths; j++) {
						var a = document.getElementsByName("remarkList1")[j].value;
						if (a == null || a == "") {
							showTips("请上传签字盖章版合同");
							return;
						}
					}
				}
				var filePaths = document.getElementsByName("uploadfile1").length;
				for (var j = 0; j < filePaths; j++) {
					var a = document.getElementsByName("remarkList1")[j].value;
					if (a == null || a == "") {
						showTips("新增附件不可以为空");
						return;
					}
				}
			}
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
			nui.confirm("确定" + title + "流程吗？", "操作提示", function(action) {
				if (action == "ok") {
					document.getElementById("fileCatalog1").value = "chargeContractInfo";
					form4.submit();
					nui.get("creatReimbProcess").setEnabled(false);
				}
			});
		}

		function SaveData1() {
			var misOpinion = opioionform.getData().misOpinion;//审核意见
			var data = form.getData();
			var json = {
				"cpData" : data,
				"misOpinion" : misOpinion,
				"workItemID" : <%=workitemid%>
			};
			ajaxCommon({
				url : "com.zhonghe.ame.chargeContract.chargeContract.chargeContractReview.biz.ext",
				data : json,
				success : function(o) {
					if (o.result == "success") {
						showTips(titleText + "成功")
						closeOk();
					} else {
						showTips("提交失败，请联系信息技术部人员！", "danger")
						closeOk();
					}
				}
			})
		}
		
		function saveRow() {
			var contractNo = nui.get("contractNo").value;
			var startTime = nui.get("startTime").value;
			var endTime = nui.get("endTime").value;
			if (contractNo == undefined || startTime == undefined || endTime == undefined) {
				nui.alert("请填写基本信息");
				return;
			}
			var form1 = new nui.Form("form1");
			var json = form1.getData();
			var payMentObject = {
				'id' : payContractId,
				'contractNo' : contractNo,
				'startTime' : startTime,
				'endTime' : endTime
			}
			nui.ajax({
				url : "com.zhonghe.ame.chargeContract.chargeContract.updateChargeContract.biz.ext",
				type : "post",
				data : nui.encode({
					'data' : payMentObject
				}),
				success : function(o) {
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
		
		function queryPlan(str) {
			nui.ajax({
				url : "com.zhonghe.ame.chargeContract.chargeContract.queryPlan.biz.ext",
				type : "post",
				contentType : 'text/json',
				data : {
					"chargeId" : str
				},
				success : function(data) {
					grid2.setData(data.data);
				}
			})
		}
		
		grid2.on("cellbeginedit", function(e) {
			e.cancel = "true";
		});
	</script>
</body>
</html>