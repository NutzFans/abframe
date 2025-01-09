<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<style type="text/css">
	body {
		margin: 0;padding: 0;border: 0;width: 100%;height: 100%;overflow: hidden;
	}
</style>
<head>
<title>收费合同补充协议申请</title>
</head>
<body>
	<div class="nui-fit" style="padding: 5px;">
		<fieldset id="field1" style="border: solid 1px #aaa;">
			<legend>原 - 收费合同信息</legend>
			<form>
				<div style="padding: 5px;">
					<table style="table-layout: fixed;">
						<tr>
							<td align="right" style="width: 130px">合同名称：</td>
							<td colspan="5">
								<input id="historyContractName" enabled="false" class="nui-textbox" style="width: 100%" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 130px">经办人：</td>
							<td>
								<input id="historyCreateUsername" class="nui-textbox" enabled="false" style="width: 200px" />
							</td>
							<td align="right" style="width: 130px">合同承办部门：</td>
							<td>
								<input id="historyImplementOrgname" class="nui-textbox" enabled="false" style="width: 200px" />
							</td>
							<td align="right" style="width: 130px">申请日期：</td>
							<td>
								<input id="historyCreateTime" enabled="false" class="nui-textbox" style="width: 200px" />
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
				<input name="relateCont" id="relateCont" class="nui-hidden" />
				<div style="padding: 5px;">
					<table style="table-layout: fixed;">
						<tr>
							<td align="right" style="width: 130px">补充协议名称：</td>
							<td colspan="5">
								<input id="contractName" name="contractName" class="nui-textbox" style="width: 100%" required="true" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 130px">经办人：</td>
							<td>
								<input name="createUserid" id="createUserid" class="nui-hidden"/>
								<input id="createUsername" name="createUsername" class="nui-textbox" enabled="false" style="width: 200px" required="true" />
							</td>
							<td align="right" style="width: 130px">合同承办部门：</td>
							<td>
								<input name="implementOrg" id="implementOrg" class="nui-hidden" style="width: 200px;" />
								<input name="implementOrgname" id="implementOrgname" class="nui-textbox" enabled="false" style="width: 200px" required="true"/>
							</td>
							<td align="right" style="width: 130px">申请日期：</td>
							<td>
								<input id="createTime" name="createTime" class="nui-datepicker" style="width: 200px" required="true" enabled="false" />
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
		
		<form id="opioionform" method="post" style="display: none">
			<div style="padding: 5px;" id="opinionHide">
				<table style="table-layout: fixed;">
					<tr id="salesEdit">
						<td style="width: 150px;" align="right">审核结果：</td>
						<td style="width: 250px;">
							<input name="misOpinion.auditstatus" id="auditstatus" class="nui-dictradiogroup" style="width: 250px;" required="true" dictTypeId="MIS_AUDITSTATUS" onvaluechanged="show()" value="1" />
						</td>
					</tr>
					<tr>
						<td colspan="3">
							<input name="misOpinion.auditopinion" id="auditopinion" class="nui-hidden" style="width: 600px; height: 40px;" value="" />
						</td>
					</tr>
				</table>
			</div>
		</form>						
	</div>
	
	<div style="text-align: center; position: relative; bottom: 10px" class="nui-toolbar">
		<a class="nui-button" onclick="onOk(0)" id="saveReimb" iconCls="icon-save" style="width: 80px; margin-right: 20px;">保存</a>
		<a class="nui-button" onclick="onOk(1)" id="creatReimbProcess" iconCls="icon-ok" style="width: 80px; margin-right: 20px;">提交</a>
		<a class="nui-button" onclick="closeCancel()" id="saveReimbProcess" iconCls="icon-close" style="width: 80px; margin-right: 140px;">关闭</a>
	</div>	
	
	<script type="text/javascript">
		nui.parse();
		var form = new nui.Form("#form1");
		var opioionform = new nui.Form("#opioionform");
		var type;
		
		$("input[name='historyCustInfo']").parent("td").attr("style", "border: 0px; background: #f0f0f0;")
		$("input[name='custInfo']").parent("td").attr("style", "border: 0px; background: #FFFFE6;")
		
		function setEditData(data) {
			nui.get("historyCreateUsername").setValue(data.createUsername);
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
			
			nui.get("relateCont").setValue(data.id);
			nui.get("createUserid").setValue(userId);
			nui.get("createUsername").setValue(userName);
			nui.get("implementOrg").setValue(userOrgId);
			nui.get("implementOrgname").setValue(userOrgName);		
			nui.get("createTime").setValue(new Date());
			nui.get("contractSubject").setValue(data.contractSubject);
			nui.get("payee").setValue(data.payee);
			nui.get("custInfo").setValue(data.signatory);
			nui.get("custInfo").setText(data.signatoryName);	
			nui.get("auditstatus").setValue(3);//1：通过,0：退回，2：终止流程，3:发起
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
			if (type == 0) {
				var contractName = nui.get("contractName").getValue();
				if (isStrEmpty(contractName)) {
					showTips("请填写补充协议名称并确保其正确性！", "danger");
					return;
				}
			}
			nui.get("saveReimb").disable();
			nui.get("creatReimbProcess").disable();
			document.getElementById("fileCatalog").value = "chargeContractinfo";
			inputFileExpandForm.submit();
		}
		
		function SaveData() {
			var data = form.getData();
			data.signatory = nui.get("custInfo").getValue();
			data.signatoryName = nui.get("custInfo").getText();
			var data_opioion = opioionform.getData();
			data.type = type;
			var info = "";
			if (type == 1) {
				info = "是否提交？"
			} else {
				info = "是否暂时保存？"
			}
			data.files = nui.get("fileids").getValue();
			delete data.criteria;
			data.issupagreement = "y";
			var json = nui.encode({
				'cpData' : data,
				"misOpinion" : data_opioion.misOpinion
			});
			if (!confirm(info)) {
				nui.get("saveReimb").enable();
				nui.get("creatReimbProcess").enable();
				return;
			} else {
				ajaxCommon({
					"url" : "com.zhonghe.ame.chargeContract.chargeContract.addChargeAlterationInfoNew.biz.ext",
					"data" : json,
					"success" : function(data) {
						if (data.result == "1") {
							if (type == 1) {
								showTips("收费合同补充协议提交成功");
								closeOk();
							} else {
								showTips("收费合同补充协议保存成功");
								closeOk();
							}
						} else {
							showTips("收费合同提交失败！", "danger");
							nui.get("saveReimb").enable();
							nui.get("creatReimbProcess").enable();
						}
					}
				});
			}
		}
		
		function isStrEmpty(obj) {
			if (typeof obj == "undefined" || obj == null || obj == "") {
				return true;
			} else {
				return false;
			}
		}										
				
	</script>
	
</body>
</html>