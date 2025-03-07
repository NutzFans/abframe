<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<head>
<title>付费合同补充协议编辑</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%=request.getContextPath()%>/common/nui/nui.js" type="text/javascript"></script>
<style type="text/css">
	body {
		 margin: 0;padding: 0;border: 0;width: 100%;height: 100%;overflow: hidden;	
	}
</style>
</head>
<body>
	<div class="nui-fit" style="padding: 5px;">
		<fieldset id="field1" style="border: solid 1px #aaa;">
			<legend>原 - 付费合同信息</legend>
			<form>
				<input id="historyFinalSum" name="historyFinalSum" class="nui-hidden" />
				<input id="historyContractBalance" name="historyContractBalance" class="nui-hidden" />
				<div style="padding: 5px;">
					<table style="table-layout: fixed;">
						<tr>
							<td align="right" style="width: 130px">合同名称：</td>
							<td colspan="3">
								<input id="historyContractName" enabled="false" class="nui-textbox" style="width: 100%" />
							</td>
							<td align="right" style="width: 130px">申请日期：</td>
							<td>
								<input id="historyCreateTime" enabled="false" class="nui-textbox" style="width: 200px" />
							</td>						
						</tr>
						<tr>
							<td align="right" style="width: 130px">申请人：</td>
							<td>
								<input id="historyCreateUsername" class="nui-textbox" enabled="false" style="width: 200px" />
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
							<td colspan="3">
								<span class="mini-buttonedit-border" style="padding-left: 0px; padding-right: 0px">
									<input name="historyCustInfo" id="historyCustInfo" class="nui-textboxlist" style="width: 515px" dataField="purSuppliers" url="com.zhonghe.ame.payContract.payContract.queryPurSuppliersByNameInfo.biz.ext"
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
							<td align="right" style="width: 130px">付款方：</td>
							<td>
								<input id="historyPayer" class="nui-dictcombobox" dictTypeId="ZH_INVOICE_NAME_TYPE" style="width: 200px" enabled="false" />
							</td>						
						</tr>
						<tr>
							<td align="right" style="width: 130px">合同编号：</td>
							<td>
								<input id="historyContractNo" enabled="false" class="nui-textbox" style="width: 200px" />
							</td>
							<td align="right" style="width: 130px">合同金额(元)：</td>
							<td>
								<input id="historyContractSum" class="nui-textbox" style="width: 200px" enabled="false" />
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
			<legend>补充协议 - 付费合同信息</legend>
			<form id="form1" method="post">
				<input name="files" id="fileids" class="nui-hidden" />
				<input name="id" id="id" class="nui-hidden" />
				<input name="relateCont" id="relateCont" class="nui-hidden" />
				<input name="actContractSum" id="actContractSum" class="nui-hidden">
				<div style="padding: 5px;">
					<table style="table-layout: fixed;">
						<tr>
							<td align="right" style="width: 130px">补充协议名称：</td>
							<td colspan="3">
								<input id="contractName" name="contractName" class="nui-textbox" style="width: 100%" required="true" />
							</td>
							<td align="right" style="width: 130px">申请日期：</td>
							<td>
								<input id="createTime" name="createTime" class="nui-datepicker" style="width: 200px" required="true" enabled="false" />
							</td>						
						</tr>
						<tr>
							<td align="right" style="width: 130px">申请人：</td>
							<td>
								<input name="createUserid" id="createUserid" class="nui-hidden"/>
								<input id="createUsername" name="createUsername" class="nui-textbox" enabled="false" style="width: 200px" required="true" />
							</td>
							<td align="right" style="width: 120px">合同承办单位:</td>
							<td>
								<input name="secondaryOrg" id="secondaryOrg" class="nui-hidden" style="width: 300px;" />
								<input name="secondaryOrgname" id="secondaryOrgname" class="nui-textbox" enabled="false" style="width: 200px" required="true" />
							</td>
							<td align="right" style="width: 130px">合同承办部门：</td>
							<td>
								<input name="implementOrg" id="implementOrg" class="nui-hidden" style="width: 300px;" />
								<input name="implementOrgname" id="implementOrgname" class="nui-textbox" enabled="false" style="width: 200px" required="true" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 130px">签约方：</td>
							<td colspan="3">
								<span class="mini-buttonedit-border" style="padding-left: 0px; padding-right: 0px">
									<input name="custInfo" id="custInfo" class="nui-textboxlist" style="width: 515px" dataField="purSuppliers" url="com.zhonghe.ame.payContract.payContract.queryPurSuppliersByNameInfo.biz.ext"
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
							<td align="right" style="width: 130px">付款方：</td>
							<td>
								<input id="payer" name="payer" class="nui-dictcombobox" dictTypeId="ZH_INVOICE_NAME_TYPE" style="width: 200px" required="true" />
							</td>						
						</tr>
						<tr>
							<td align="right" style="width: 130px">变更金额(元)：</td>
							<td>
								<input id="contractSum" name="contractSum" class="nui-textbox" vtype="float" style="width: 200px" required="true" emptyText="增加正数，减少负数，无变化0" onvaluechanged="onvaluechanged" />
							</td>
							<td align="right" style="width: 130px">不含税金额(元)：</td>
							<td>
								<input name="noTaxSum" id="noTaxSum" class="nui-textbox" vtype="float" style="width: 200px" required="true" emptyText="增加正数，减少负数，无变化0" onvaluechanged="onvaluechanged"/>
							</td>
							<td align="right" style="width: 130px">税额(元):</td>
							<td>
								<input name="payTax" id="payTax" class="nui-textbox" vtype="float" style="width: 200px" required="true" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 100px">合同编号：</td>
							<td>
								<input id="contractNo" name="contractNo" class="nui-textbox" style="width: 200px" required="true" />
							</td>
							<td align="right" style="width: 100px">签订日期：</td>
							<td>
								<input id="signingDate" name="signingDate" class="nui-datepicker" style="width: 200px" required="true" />
							</td>
							<td align="right" style="width: 100px">执行状态:</td>
							<td>
								<input id="executeStatus" name="executeStatus" class="nui-dictcombobox" dictTypeId="EXECUTE_STATUS" style="width: 200px" required="true"  />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 100px">合同文本密级:</td>
							<td>
								<input id="contractSecretLevel" name="contractSecretLevel" class="nui-dictcombobox" dictTypeId="CONTRACT_SECRET_LEVEL" style="width: 100%" required="true" />
							</td>
							<td align="right" style="width: 100px">项目密级:</td>
							<td>
								<input id="projectSecretLevel" name="projectSecretLevel" class="nui-dictcombobox" dictTypeId="PROJECT_SECRET_LEVEL" style="width: 100%" required="true" />
							</td>
							<td align="right" style="width: 100px">是否为采购合同:</td>
							<td>
								<input id="contractNature" name="contractNature" class="nui-dictcombobox" dictTypeId="CONTRACT_NATURE" style="width: 100%" required="true" onvaluechanged="contractNatureChanged" />
							</td>													
						</tr>
						<tr>
							<td align="right" style="width: 100px">完成日期:</td>
							<td>
								<input id="finishTime" name="finishTime" class="nui-datepicker" style="width: 200px"/>
							</td>						
						</tr>
						<tr>
							<td align="right" style="width: 130px">补充协议说明：</td>
							<td colspan="6">
								<input id="remark" name="remark" class="nui-textarea" style="width: 100%; height: 235px" required="true" />
							</td>
						</tr>
					</table>
				</div>
			</form>
		</fieldset>		
		
		<fieldset id="field3" style="border: solid 1px #aaa;">
			<legend>原 - 付费合同附件</legend>
			<jsp:include page="/ame_common/detailFile.jsp" />
		</fieldset>

		<fieldset id="field4" style="border: solid 1px #aaa;">
			<legend>补充协议 - 上传附件</legend>
			<jsp:include page="/ame_common/inputFileExpand.jsp" />
		</fieldset>
	</div>
	
	<div style="text-align: center; position: relative; bottom: 10px" class="nui-toolbar">
		<a class="nui-button" onclick="onOk()" id="creatReimbProcess" style="width: 80px; margin-right: 20px;" iconCls="icon-save">保存</a>
		<a class="nui-button" onclick="onCancel" id="saveReimbProcess" style="width: 80px; margin-right: 140px;" iconCls="icon-close">关闭</a>
	</div>
	
	<script type="text/javascript">
		nui.parse();
		var form = new nui.Form("#form1");
		
		$("input[name='historyCustInfo']").parent("td").attr("style", "border: 0px; background: #f0f0f0;")
		$("input[name='custInfo']").parent("td").attr("style", "border: 0px; background: #FFFFE6;")		
		
		function setEditData(data) {
			form.setData(data);
			nui.get("custInfo").setValue(data.signatory);
			nui.get("custInfo").setText(data.signatoryname);
			queryHistory(data.relateCont);
			var inputFileExpandGrid = nui.get("inputFileExpandGrid");
				inputFileExpandGrid.load({
					"groupid" : "PAY_CONTRACT",
					"relationid" : data.id
				});
			inputFileExpandGrid.sortBy("fileTime", "desc");
		}
		
		function queryHistory(str) {
			var json = {"id": str};
			nui.ajax({
				url : "com.zhonghe.ame.payContract.payContract.queryPayContractById.biz.ext",
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
					nui.get("historyFinalSum").setValue(data.finalSum);
					nui.get("historyContractBalance").setValue(data.contractBalance);
					nui.get("historySigningDate").setValue(data.signingDate);
					nui.get("historyCustInfo").setValue(data.signatory);
					nui.get("historyCustInfo").setText(data.signatoryname);
					nui.get("historyPayer").setValue(data.payer);
					nui.get("historyRemark").setValue(data.remark);
					var grid_0 = nui.get("grid_0");
					grid_0.load({
						"groupid" : "PAY_CONTRACT",
						"relationid" : data.id
					});
					grid_0.sortBy("fileTime", "desc");
				}
			})
		}
		
		function onOk() {
			form.validate();
			if (form.isValid() == false) {
				showTips("请检查表单的完整性!", "danger");
				return;
			}
			document.getElementById("fileCatalog").value = "payContractinfo";
			inputFileExpandForm.submit();
		}
		
		function SaveData() {
			var data = form.getData();
			data.signatory = nui.get("custInfo").getValue();
			data.signatoryName = nui.get("custInfo").getText();
			var historyFinalSum = nui.get("historyFinalSum").getValue() * 1;
			var historyContractBalance = nui.get("historyContractBalance").getValue() * 1;
			var actContractSum = nui.get("actContractSum").getValue() * 1;
			var contractSum = nui.get("contractSum").getValue() * 1;
			var finalSum = (historyFinalSum-actContractSum+contractSum).toFixed(2);
			var contractBalance = (historyContractBalance-actContractSum+contractSum).toFixed(2);
			data.finalSum = finalSum;
			data.contractBalance = contractBalance;
			var json = nui.encode({
				'data' : data
			});
			if (!confirm("是否保存？")) {
				return;
			}else{
				nui.ajax({
					url : "com.zhonghe.ame.payContract.payContract.updatePayContractAlteration.biz.ext",
					data : json,
					type : 'POST',
					cache : false,
					contentType : 'text/json',
					success : function(text) {
						if (text.result == 1) {
							showTips("维护成功");
							window.CloseOwnerWindow("save");
						} else {
							showTips("维护失败", "danger");
						}

					},
					error : function(jqXHR, textStatus, errorThrown) {
						alert(jqXHR.responseText);
					}
				});				
			}
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
		
		function onvaluechanged() {
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
		
		function selectCustInfo() {
			mini.open({
				url : "/default/contractPact/payContract/selectPurSupplierInfo.jsp",
				title : "选择签约方",
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
						nui.get("custInfo").setValue("" + custid + "");
						nui.get("custInfo").setText("" + custname + "");
					}
				}
			});
		}		
		
	</script>	
	
</body>
</html>