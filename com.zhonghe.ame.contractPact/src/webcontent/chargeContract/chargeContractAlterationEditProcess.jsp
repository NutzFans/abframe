<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<head>
<title>收费合同补充协议申请</title>
<style type="text/css">
	body {
		margin: 0;padding: 0;border: 0;width: 100%;height: 100%;overflow: hidden;
	}
</style>
</head>
<body>
	<%
		long workItemID = (Long) request.getAttribute("workItemID");
	%>
	<div class="nui-fit" style="padding: 5px;">
		<fieldset id="field1" style="border: solid 1px #aaa;">
			<legend>原 - 收费合同信息</legend>
			<form>
				<div style="padding: 5px;">
					<table style="table-layout: fixed;">
						<tr>
							<td align="right" style="width: 130px">合同名称：</td>
							<td colspan="3">
								<input id="historyContractName" enabled="false" class="nui-textbox" style="width: 100%" />
							</td>
							<td align="right" style="width: 130px">经办人：</td>
							<td>
								<input id="historyCreateUsername" class="nui-textbox" enabled="false" style="width: 200px" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 130px">申请日期：</td>
							<td>
								<input id="historyCreateTime" enabled="false" class="nui-textbox" style="width: 200px" />
							</td>
							<td align="right" style="width: 130px">合同承办单位：</td>
							<td>
								<input id="historySecondaryOrgname" class="nui-textbox" enabled="false" style="width: 200px" />
							</td>
							<td align="right" style="width: 130px">合同承办部门：</td>
							<td>
								<input id="historyImplementOrgname" class="nui-textbox" enabled="false" style="width: 200px" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 130px">签约方：</td>
							<td colspan="5">
								<span class="mini-buttonedit-border" style="padding-left: 0px; padding-right: 0px">
									<input name="historyCustInfo" id="historyCustInfo" class="nui-textboxlist" style="width: 855px" dataField="custinfos" url="com.zhonghe.ame.marketInfo.marketinfo.khxx.bid.queryCustByNameInfo.biz.ext"
										valueField="custid" textField="custname" allowInput="false" enabled="false" />
									<span class="mini-buttonedit-buttons">
										<span class="mini-buttonedit-close"></span>
										<span class="mini-buttonedit-button" onmouseover="mini.addClass(this, 'mini-buttonedit-button-hover');" onmouseout="mini.removeClass(this, 'mini-buttonedit-button-hover');">
											<span class="mini-buttonedit-icon"></span>
										</span>
									</span>
								</span>
							</td>						
						</tr>
						<tr>
							<td align="right" style="width: 130px">合同签约主体：</td>
							<td>
								<input id="historyContractSubject" class="nui-dictcombobox" dictTypeId="ZH_INVOICE_NAME_TYPE" style="width: 200px" enabled="false" />
							</td>
							<td align="right" style="width: 130px">收款方：</td>
							<td>
								<input id="historyPayee" class="nui-dictcombobox" dictTypeId="PAYER" style="width: 200px" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 130px">合同金额(元)：</td>
							<td>
								<input id="historyContractSum" class="nui-textbox" style="width: 200px" enabled="false" />
							</td>
							<td align="right" style="width: 130px">合同编号：</td>
							<td>
								<input id="historyContractNo" enabled="false" class="nui-textbox" style="width: 200px" />
							</td>
							<td align="right" style="width: 130px">签订日期：</td>
							<td>
								<input id="historySigningDate" class="nui-textbox" style="width: 200px" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 130px">备注：</td>
							<td colspan="6">
								<input id="historyRemark" class="nui-textarea" style="width: 100%; height: 235px" enabled="false" />
							</td>
						</tr>
					</table>
				</div>
			</form>
		</fieldset>
		
		<fieldset id="field2" style="border: solid 1px #aaa;">
			<legend>补充协议 - 收费合同信息</legend>
			<form id="form1" method="post">
				<input name="files" id="fileids" class="nui-hidden" />
				<input name="id" id="id" class="nui-hidden" />
				<div style="padding: 5px;">
					<table style="table-layout: fixed;">
						<tr>
							<td align="right" style="width: 130px">补充协议名称：</td>
							<td colspan="3">
								<input id="contractName" name="contractName" class="nui-textbox" style="width: 100%" required="true" />
							</td>
							<td align="right" style="width: 130px">经办人：</td>
							<td>
								<input name="createUserid" id="createUserid" class="nui-hidden"/>
								<input id="createUsername" name="createUsername" class="nui-textbox" enabled="false" style="width: 200px" required="true" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 130px">申请日期：</td>
							<td>
								<input id="createTime" name="createTime" class="nui-datepicker" style="width: 200px" required="true" enabled="false" />
							</td>
							<td align="right" style="width: 130px">合同承办单位：</td>
							<td>
								<input name="secondaryOrg" id="secondaryOrg" class="nui-hidden" style="width: 200px;" />
								<input name="secondaryOrgname" id="secondaryOrgname" class="nui-textbox" enabled="false" style="width: 200px" required="true" />
							</td>
							<td align="right" style="width: 130px">合同承办部门：</td>
							<td>
								<input name="implementOrg" id="implementOrg" class="nui-hidden" style="width: 300px;" />
								<input name="implementOrgname" id="implementOrgname" class="nui-textbox" enabled="false" style="width: 200px" required="true"/>
							</td>

						</tr>
						<tr>
							<td align="right" style="width: 130px">签约方：</td>
							<td colspan="5">
								<span class="mini-buttonedit-border" style="padding-left: 0px; padding-right: 0px">
									<input name="custInfo" id="custInfo" class="nui-textboxlist" style="width: 855px" dataField="custinfos" url="com.zhonghe.ame.marketInfo.marketinfo.khxx.bid.queryCustByNameInfo.biz.ext"
										valueField="custid" textField="custname" allowInput="false" />
									<span class="mini-buttonedit-buttons">
										<span class="mini-buttonedit-close"></span>
										<span class="mini-buttonedit-button" onclick="selectCustInfo()" onmouseover="mini.addClass(this, 'mini-buttonedit-button-hover');"
											onmouseout="mini.removeClass(this, 'mini-buttonedit-button-hover');">
											<span class="mini-buttonedit-icon"></span>
										</span>
									</span>
								</span>
							</td>						
						</tr>
						<tr>
							<td align="right" style="width: 130px">合同签约主体：</td>
							<td>
								<input id="contractSubject" name="contractSubject" class="nui-dictcombobox" dictTypeId="ZH_INVOICE_NAME_TYPE" style="width: 200px" required="true" />
							</td>
							<td align="right" style="width: 130px">收款方：</td>
							<td>
								<input id="payee" name="payee" class="nui-dictcombobox" dictTypeId="PAYER" style="width: 200px" required="true" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 130px">变更金额(元)：</td>
							<td>
								<input name="contractSum" id="contractSum" class="nui-textbox" vtype="float" style="width: 200px" required="true" onvaluechanged="editContractSum" emptyText="增加正数，减少负数，无变化0" />
							</td>
							<td align="right" style="width: 130px">不含税金额(元)：</td>
							<td>
								<input name="noTaxSum" id="noTaxSum" class="nui-textbox" vtype="float" style="width: 200px" required="true" onvaluechanged="editNoTaxSum" emptyText="增加正数，减少负数，无变化0" />
							</td>
							<td align="right" style="width: 130px">税额(元)：</td>
							<td>
								<input name="payTax" id="payTax" class="nui-textbox" vtype="float" style="width: 200px" required="true" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 130px">补充协议说明：</td>
							<td colspan="5">
								<input name="remark" class="nui-textarea" style="width: 100%; height: 235px" required="true" />
							</td>
						</tr>
					</table>
				</div>
			</form>
		</fieldset>
		
		<fieldset id="field3" style="border: solid 1px #aaa;">
			<legend>原 - 收费合同附件</legend>
			<jsp:include page="/ame_common/detailFile.jsp" />
		</fieldset>
		
		<fieldset id="field4" style="border: solid 1px #aaa;">
			<legend>补充协议 - 上传附件</legend>
			<jsp:include page="/ame_common/inputFileExpand.jsp" />
		</fieldset>
		
		<jsp:include page="/ame_common/misOpinion.jsp" />
	</div>
	
	<div style="text-align: center; padding: 10px; border-width: 1px 0px 0px 0px;" class="nui-toolbar">
		<a class="nui-button" onclick="onOk(0)" id="saveReimb" iconCls="icon-save" style="width: 80px; margin-right: 20px;">保存</a>
		<a class="nui-button" onclick="onOk(1)" id="creatReimbProcess" iconCls="icon-ok" style="width: 80px; margin-right: 20px;">提交</a>
		<a class="nui-button" onclick="onOk(2)" id="zzReimb" iconCls="icon-split" style="width: 80px; margin-right: 20px;">中止</a>
		<a class="nui-button" onclick="closeCancel()" id="saveReimbProcess" iconCls="icon-close" style="width: 80px; margin-right: 0px">关闭</a>
	</div>
	
	<script type="text/javascript">
		nui.parse();
		var form = new nui.Form("#form1");
		var type;

		$("input[name='historyCustInfo']").parent("td").attr("style", "border: 0px; background: #f0f0f0;")
		$("input[name='custInfo']").parent("td").attr("style", "border: 0px; background: #FFFFE6;")
		
		init();
		
		function init() {
			var data={workItemID:<%=workItemID %>};
			var json = nui.encode(data);
			nui.ajax({
				url : "com.zhonghe.ame.chargeContract.chargeContract.getChargeContract.biz.ext",
				type : "post",
				data : json,
				contentType : 'text/json',
				success : function(o) {
					form.setData(o.chargeContract);
					nui.get("custInfo").setValue(o.chargeContract.signatory);
					nui.get("custInfo").setText(o.chargeContract.signatoryName);
					queryHistory(o.chargeContract.relateCont);
					var inputFileExpandGrid = nui.get("inputFileExpandGrid");
					inputFileExpandGrid.load({
						"groupid" : "CHARGE_CONTRACT",
						"relationid" : o.chargeContract.id
					});
					inputFileExpandGrid.sortBy("fileTime", "desc");
					//设置审核意见基本信息
					nui.get("processinstid").setValue(o.workitem.processInstID);
					nui.get("processinstname").setValue(o.workitem.processInstName);
					nui.get("activitydefid").setValue(o.workitem.activityDefID);
					nui.get("workitemname").setValue(o.workitem.workItemName);
					nui.get("workitemid").setValue(<%=workItemID %>);
					nui.get("isshow").setValue("1");
					nui.get("auditstatus").setValue("4");
					document.getElementById("salesEdit").style.display = "none";
					nui.get("auditopinion").setValue("");
					//查询审核意见
					var misOpinionGrid = nui.get("datagrid1");
					if (o.workitem.processInstID != null || o.workitem.processInstID != "") {
						misOpinionGrid.load({
							processInstID : o.workitem.processInstID
						});
						misOpinionGrid.sortBy("time", "desc");
					}				
				}
			});
		}
		
		function queryHistory(str) {
			var json = {"id": str};
			nui.ajax({
				url : "com.zhonghe.ame.chargeContract.chargeContract.queryChargeContractById.biz.ext",
				type : "post",
				contentType : 'text/json',
				data : json,
				success : function(result) {
					var data = result.data;
					nui.get("historyCreateUsername").setValue(data.createUsername);
					nui.get("historySecondaryOrgname").setValue(data.secondaryOrgname);
					nui.get("historyImplementOrgname").setValue(data.implementOrgname);
					nui.get("historyCreateTime").setValue(data.createTime);
					nui.get("historyContractNo").setValue(data.contractNo);
					nui.get("historyContractName").setValue(data.contractName);
					nui.get("historyContractSum").setValue(data.contractSum);
					nui.get("historySigningDate").setValue(data.signingDate);
					nui.get("historyCustInfo").setValue(data.signatory);
					nui.get("historyCustInfo").setText(data.signatoryName);
					nui.get("historyContractSubject").setValue(data.contractSubject);
					nui.get("historyPayee").setValue(data.payee);
					nui.get("historyRemark").setValue(data.remark);
					var grid_0 = nui.get("grid_0");
					grid_0.load({
						"groupid" : "CHARGE_CONTRACT",
						"relationid" : data.id
					});
					grid_0.sortBy("fileTime", "desc");
				}
			})
		}
		
		function selectCustInfo() {
			mini.open({
				url : "/default/marketInfo/bid/selectCustInfo.jsp",
				title : "选择签约方（请先查找客户，如不存在再新增）",
				width : '500',
				height : '530',
				ondestroy : function(action) {
					if (action == "ok") {
						var iframe = this.getIFrameEl();
						var data = iframe.contentWindow.GetData();
						data = mini.clone(data); //必须
						var custid = nui.get("custInfo").getValue();
						var custname = nui.get("custInfo").getText();
						if (custid != "" && custname != "") {
							custid = custid + "," + data.custid;
							custname = custname + "," + data.custname;
						} else {
							custid = data.custid;
							custname = data.custname;
						}
						nui.get("custInfo").setValue(""+custid+"");
						nui.get("custInfo").setText(""+custname+"");
					}
				}
			});
		}
		
		function editContractSum() {
			var contractSum = nui.get("contractSum").getValue();
			var noTaxSum = contractSum / 1.06;
			abs = function(val) {
				var str = (val).toFixed(2) + '';
				var intSum = str.substring(0, str.indexOf(".")).replace(/\B(?=(?:\d{3})+$)/g, '');
				var dot = str.substring(str.length, str.indexOf("."))
				var ret = intSum + dot;
				return ret;
			}
			nui.get("noTaxSum").setValue(abs(noTaxSum));
			nui.get("payTax").setValue(abs(contractSum - noTaxSum));
		}
		
		function editNoTaxSum() {
			var contractSum = nui.get("contractSum").getValue();
			var noTaxSum = nui.get("noTaxSum").getValue();
			abs = function(val) {
				var str = (val).toFixed(2) + '';
				var intSum = str.substring(0, str.indexOf(".")).replace(/\B(?=(?:\d{3})+$)/g, '');
				var dot = str.substring(str.length, str.indexOf("."))
				var ret = intSum + dot;
				return ret;
			}
			nui.get("payTax").setValue(abs(contractSum - noTaxSum));
		}		
		
		function onOk(e) {
			type = e;
			if (type == 1) {
				title = "提交";
				if (!form.validate()) {
					showTips("请检查表单的完整性!", "danger");
					return;
				}
				// 已上传的文件数量
				var gridFileCount = nui.get("inputFileExpandGrid").getData().length;
				if(gridFileCount == 0){
					// 刚新增(未上传)的文件数量
					var newFileCount = document.getElementsByName("uploadfile").length;
					if(newFileCount == 0){
						showTips("请上传补充协议相关附件", "danger");
						return;
					}
				}
			}
			nui.get("saveReimb").disable();
			nui.get("creatReimbProcess").disable();
			nui.get("zzReimb").disable();
			document.getElementById("fileCatalog").value = "chargeContractinfo";
			inputFileExpandForm.submit();
		}
		
		function SaveData() {
			var data = form.getData();
			data.signatory = nui.get("custInfo").getValue();
			data.signatoryName = nui.get("custInfo").getText();
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
				nui.get("saveReimb").enable();
				nui.get("creatReimbProcess").enable();
				nui.get("zzReimb").enable();
				nui.get("auditstatus").setValue("4");
				return;
			}else{
				ajaxCommon({
					"url" : "com.zhonghe.ame.chargeContract.chargeContract.editChargeAlterationInfo.biz.ext",
					"data" : json,
					"success" : function(data) {
						if (data.result == "1") {
							if (type == 1) {
								showTips("收费合同补充协议提交成功")
								closeOk();
							} else if (type == 0) {
								showTips("收费合同补充协议暂时保存成功")
								closeOk();
							} else {
								showTips("中止成功")
								closeOk();
							}
						} else {
							nui.get("saveReimb").enable();
							nui.get("creatReimbProcess").enable();
							nui.get("zzReimb").enable();
						}
					}
				});
			}
		}										
		
	</script>
</body>
</html>