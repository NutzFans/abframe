<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<head>
<title>付费合同签订申请</title>
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
	<%
		long workitemid = (Long) request.getAttribute("workItemID");
	%>

	<div class="nui-fit" style="padding: 5px">
		<fieldset id="field1" style="border: solid 1px #aaa;">
			<legend>付费合同信息</legend>
			<form id="form1" method="post">
				<input name="files" id="fileids1" class="nui-hidden" />
				<input name="id" id="id" class="nui-hidden" />
				<input name="processid" id="processid" class="nui-hidden" />
				<div style="padding: 5px;">
					<table style="table-layout: fixed;">
						<tr>
							<td align="right" style="width: 120px">合同名称:</td>
							<td colspan="7">
								<input name="contractName" id="contractName" class="nui-textbox" style="width: 100%" required="true" enabled="false" />
							</td>
						</tr>
						<tr>
							<td class="form_label" align="right">经办人:</td>
							<td>
								<input name="createUserid" id="createUserid" class="nui-hidden" style="width: 100%" />
								<input id="createUsername" name="createUsername" class="nui-textbox" enabled="false" style="width: 100%" required="true" />
							</td>
							<td align="right" style="width: 120px">合同承办部门:</td>
							<td>
								<input name="implementOrg" id="implementOrg" class="nui-hidden" style="width: 300px;" />
								<input name="implementOrgname" id="implementOrgname" class="nui-textbox" style="width: 100%" required="true" enabled="false" />
							</td>
							<td align="right" style="width: 120px">申请日期:</td>
							<td>
								<input id="createTime" name="createTime" class="nui-datepicker" style="width: 100%" required="true" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 120px">合同类型:</td>
							<td>
								<input name="contractType" id="contractType" class="nui-dictcombobox" dictTypeId="ZH_CONTRACT_TYPE" enabled="false" style="width: 100%" required="true" />
							</td>
							<td align="right" style="width: 100px">标的规模:</td>
							<td>
								<input name="projectSize" id="projectSize" class="nui-textbox" style="width: 100%" required="true" enabled="false" />
							</td>
							<td align="right" style="width: 100px">实施地点:</td>
							<td>
								<input name="projectLocal" id="projectLocal" class="nui-textbox" style="width: 100%" required="true" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 120px">合同金额(元):</td>
							<td>
								<input name="contractSum" id="contractSum" class="nui-textbox" vtype="float" style="width: 100%" enabled="false" required="true" onvaluechanged="onvaluechanged" />
							</td>
							<td align="right" style="width: 120px">合同不含税金额(元):</td>
							<td>
								<input name="noTaxSum" id="noTaxSum" class="nui-textbox" vtype="float" style="width: 100%" enabled="false" required="true" onvaluechanged="onvaluechanged" />
							</td>
							<td align="right" style="width: 120px">税额(元):</td>
							<td>
								<input name="payTax" id="payTax" class="nui-textbox" vtype="float" style="width: 100%" enabled="false" required="true" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 130px">签约方：</td>
							<td colspan="3">
								<span class="mini-buttonedit-border" style="padding-left: 0px; padding-right: 0px">
									<input name="custInfo" id="custInfo" class="nui-textboxlist" style="width: 515px" dataField="purSuppliers" url="com.zhonghe.ame.payContract.payContract.queryPurSuppliersByNameInfo.biz.ext"
										valueField="custid" textField="custname" allowInput="false" enabled="false" />
									<span class="mini-buttonedit-buttons">
										<span class="mini-buttonedit-close"></span>
										<span class="mini-buttonedit-button" onmouseover="mini.addClass(this, 'mini-buttonedit-button-hover');"
											onmouseout="mini.removeClass(this, 'mini-buttonedit-button-hover');">
											<span class="mini-buttonedit-icon"></span>
										</span>
									</span>
								</span>
							</td>
							<td align="right" style="width: 100px">合同签约主体:</td>
							<td>
								<input id="contractSubject" name="contractSubject" class="nui-dictcombobox" dictTypeId="ZH_INVOICE_NAME_TYPE" enabled="false" style="width: 100%" required="true" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 100px">付款方:</td>
							<td>
								<input id="payer" name="payer" class="nui-dictcombobox" enabled="false" dictTypeId="ZH_INVOICE_NAME_TYPE" style="width: 100%" required="true" />
							</td>
							<td align="right" style="width: 100px">合同文本密级:</td>
							<td>
								<input id="contractSecretLevel" name="contractSecretLevel" class="nui-dictcombobox" dictTypeId="CONTRACT_SECRET_LEVEL" style="width: 100%" required="true" enabled="false" />
							</td>
							<td align="right" style="width: 100px">项目密级:</td>
							<td>
								<input id="projectSecretLevel" name="projectSecretLevel" class="nui-dictcombobox" dictTypeId="PROJECT_SECRET_LEVEL" style="width: 100%" required="true" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 100px">是否为SM协作配套:</td>
							<td>
								<input id="issm" name="issm" class="nui-dictcombobox" dictTypeId="ABF_YESORNO" style="width: 100%" required="true" enabled="false" />
							</td>
							<td align="right" style="width: 100px">合同价款形式:</td>
							<td>
								<input id="contractPrice" name="contractPrice" class="nui-dictcombobox" dictTypeId="CONTRACT_PRICE" style="width: 100%" required="true" enabled="false" />
							</td>
							<td align="right" style="width: 100px">完成日期:</td>
							<td>
								<input id="finishTime" name="finishTime" class="nui-datepicker" style="width: 100%" required="true" emptyText="合同执行完成日期（预估）" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 100px">是否为采购合同:</td>
							<td>
								<input id="contractNature" name="contractNature" class="nui-dictcombobox" dictTypeId="CONTRACT_NATURE" style="width: 100%" required="true" enabled="false" />
							</td>
							<td align="right" style="width: 100px" id="purchasePlanLable">采购立项编号:</td>
							<td>
								<input name="purchasePlan" id="purchasePlan" class="nui-textbox" style="width: 100%" required="false" enabled="false" />
							</td>
							<td align="right" style="width: 100px">采购方式:</td>
							<td>
								<input id="procurementType" name="procurementType" class="nui-dictcombobox" dictTypeId="ZH_CGFS" style="width: 100%" required="false" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 100px">采购计划年份:</td>
							<td>
								<input id="planYear" name="planYear" class="nui-textbox" style="width: 100%" required="false" enabled="false" />
							</td>
							<td align="right" style="width: 120px" id="budgetSumLable">立项金额(元):</td>
							<td>
								<input name="budgetSum" id="budgetSum" class="nui-textbox" vtype="float" style="width: 100%" required="false" enabled="false"/>
							</td>
							<td align="right" style="width: 120px">定标金额(元):</td>
							<td>
								<input name="scalingSum" id="scalingSum" class="nui-textbox" vtype="float" style="width: 100%" required="false" enabled="false"/>
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 120px">备注:</td>
							<td colspan="5">
								<input name="remark" class="nui-textarea" enabled="false" style="width: 100%; height: 235px" />
							</td>
						</tr>
					</table>
				</div>
				<fieldset id="field6" style="border: solid 1px #aaa;">
					<legend style="color: red;">请补充合同信息</legend>
					<div style="padding: 5px; padding-left: 25px;">
						<table style="table-layout: fixed;">
							<tr>
								<td align="right" style="width: 100px">合同编号：</td>
								<td>
									<input id="contractNo" name="contractNo" class="nui-textbox" style="width: 200px" required="true" />
								</td>
								<td align="right" style="width: 100px">签订日期：</td>
								<td>
									<input id="signingDate" name="signingDate" class="nui-datepicker" style="width: 200px" required="true" />
								</td>
							</tr>
						</table>
					</div>
				</fieldset>
			</form>
		</fieldset>
		<fieldset id="field3"style="border: solid 1px #aaa;">
			<legend>未来年度付款计划</legend>
			<div id="datagrid2" class="nui-datagrid" style="width: 100%; height: 200px;" allowResize="true" showSummaryRow="true" datafield="data" allowCellEdit="true" allowCellSelect="true" multiSelect="true"
				allowSortColumn="false" showPager="false">
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
		<fieldset id="field2" style="border: solid 1px #aaa;">
			<legend>相关附件</legend>
			<jsp:include page="/ame_common/detailFile.jsp" />
		</fieldset>
		<fieldset id="field4" style="border: solid 1px #aaa;">
			<legend style="color: red;">请上传签字盖章版合同</legend>
			<jsp:include page="/ame_common/addFiles1.jsp" />
			<div style="color: red; font-size: 14px;">此项为必填项</div>
		</fieldset>
		<jsp:include page="/ame_common/misOpinion.jsp" />
	</div>

	<div style="text-align: center; padding: 10px;" class="nui-toolbar">
		<a class="nui-button" onclick="submit()" id="creatReimbProcess" iconCls="icon-ok" style="width: 80px; margin-right: 20px;">提交</a>
		<a class="nui-button" onclick="closeCancel()" id="saveReimbProcess" iconCls="icon-close" style="width: 80px; margin-right: 0px;">关闭</a>
	</div>
	
	<script type="text/javascript">
		nui.parse();
		var form = new nui.Form("form1");
		var projectid = <%=request.getParameter("projectid")%>;
		var workItemID = <%=request.getParameter("workItemID")%>;
		var opioionform = new nui.Form("opioionform");
		var payContractId = "";
		isViewDelete=false;
		var grid2 = nui.get("datagrid2");
		
		$("input[name='custInfo']").parent("td").attr("style", "border: 0px; background: #f0f0f0;")
		
		init();
		
		function init() {
			var data = {workitemid:<%=workitemid%>};
			var json = nui.encode(data);
			nui.ajax({
				url : "com.zhonghe.ame.payContract.payContract.queryPayContractInfo.biz.ext",
				type : "post",
				data : json,
				contentType : 'text/json',
				success : function(o) {
					if(o.data.budgetSum==0){
						o.data.budgetSum = "";
					}
					form.setData(o.data);
					nui.get("custInfo").setValue(o.data.signatory);
					nui.get("custInfo").setText(o.data.signatoryname);
					payContractId = o.data.id;
					queryPlan(o.data.id);
					nui.get("backTo").setData(o.data.backList);
					if (nui.get("contractNature").getValue() == 3) {
						$("#purchasePlanLable").html("零星采购编号:");
						$("#budgetSumLable").html("零采金额(元):");
					}
					//查询并加载附件
					var grid_0 = nui.get("grid_0");
					grid_0.load({
						"groupid" : "PAY_CONTRACT",
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
			form.validate();
			if (form.isValid() == false) {
				showTips("请检查表单的完整性!", "danger");
				return;
			}
			var filePaths = document.getElementsByName("uploadfile1").length;
			if (filePaths == 0) {
				showTips("请上传'签字盖章版合同'", "danger");
				return;
			} else {
				for (var j = 0; j < filePaths; j++) {
					var a = document.getElementsByName("remarkList1")[j].value;
					if (a == null || a == "") {
						showTips("请上传'签字盖章版合同'", "danger");
						return;
					}
				}
			}
			var auditstatus = nui.get("auditstatus").getValue();
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
				document.getElementById("fileCatalog1").value = "payContractinfo";
				titleText = "提交";
				submitProcess("提交");
			}
		}
		
		function submitProcess(title) {
			nui.confirm("确定" + title + "流程吗？", "操作提示", function(action) {
				if (action == "ok") {
					document.getElementById("fileCatalog1").value = "payContractinfo";
					form4.submit();
				}
			});
		}
		
		function SaveData1() {
			var misOpinion = opioionform.getData().misOpinion;//审核意见
			var data = form.getData();
			debugger;
			var json = {
				"cpData" : data,
				"misOpinion" : misOpinion,
				"workItemID" : <%=workitemid%>
			};
			ajaxCommon({
				url : "com.zhonghe.ame.payContract.payContract.payContractReview.biz.ext",
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
				showTips("请填写基本信息", "danger");
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
			ajaxCommon({
				url : "com.zhonghe.ame.payContract.payContract.updatePayContract.biz.ext",
				data : nui.encode({
					'data' : payMentObject
				}),
				success : function(o) {
				}
			});
		}
		
		function queryPlan(str) {
			nui.ajax({
				url : "com.zhonghe.ame.chargeContract.chargeContract.queryPlan.biz.ext",
				type : "post",
				contentType : 'text/json',
				data : {
					"payId" : str
				},
				success : function(data) {
					grid2.setData(data.data);
				}
			})
		}
		
		grid2.on("cellbeginedit", function(e) {
			e.cancel = "true";
		})
	</script>
</body>
</html>