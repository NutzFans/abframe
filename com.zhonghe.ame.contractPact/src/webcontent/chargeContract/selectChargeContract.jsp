<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<head>
<title>收费合同签订申请信息</title>
<style type="text/css">
	body {
		margin: 0;padding: 0;border: 0;width: 100%;height: 100%;overflow: hidden;	
	}
</style>
</head>
<body>


	<div class="nui-fit" style="padding: 5px">
		<fieldset id="field1" style="border: solid 1px #aaa;">
			<legend>收费合同签订申请信息</legend>
			<form id="form1" method="post">
				<input name="files" id="fileids" class="nui-hidden" />
				<input name="id" id="id" class="nui-hidden" />
				<div style="padding: 5px;">
					<table style="table-layout: fixed;">
						<tr>
							<td align="right" style="width: 120px">合同名称:</td>
							<td colspan="7">
								<input name="contractName" id="contractName" class="nui-textbox" style="width: 100%" required="true" enabled="false" />
							</td>
						</tr>
						<tr>
							<td class="form_label" align="right">申请人:</td>
							<td>
								<input name="createUserid" id="createUserid" class="nui-hidden" style="width: 100%" />
								<input id="createUsername" name="createUsername" class="nui-textbox" enabled="false" style="width: 100%" required="true" />
							</td>
							<td align="right" style="width: 120px">合同实施部门:</td>
							<td>
								<input name="implementOrg" id="implementOrg" shownullItem=ture class="nui-treeselect" textField="orgname" valueField="orgid" parentField="omOrganization.orgid" dataField="orgs"
									showTreeIcon="true" valueFromSelect="true" style="width: 100%;" url="com.zhonghe.ame.imptask.keytask.getAllRunOrgsforzdrw.biz.ext" allowInput="true" required="true"
									onvaluechanged="changeOrgForm(e)" multiSelect="false" checkRecursive="false" expandOnLoad="0" enabled="false" showFolderCheckBox="true" />
								<input name="implementOrgname" id="implementOrgname" class="nui-hidden" readonly="readonly" style="width: 100%" />
							</td>
							<td align="right" style="width: 120px">申请日期:</td>
							<td>
								<input id="createTime" name="createTime" class="nui-datepicker" style="width: 100%" required="true" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 120px">投标记录:</td>
							<td colspan="3">
								<input name="tenderId" id="tenderId" class="nui-dictcombobox" dictTypeId="ZH_CONTRACT_TYPE" enabled="false" style="width: 100%" required="true" />
							</td>
							<td align="right" style="width: 100px">专业类别:</td>
							<td>
								<input name="major" id="major" class="nui-dictcombobox" dictTypeId="ZH_MAJOR_TYPE" style="width: 100%" required="true" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 120px">工程类别:</td>
							<td>
								<input name="projectType" id="projectType" class="nui-dictcombobox" dictTypeId="ZH_PROJECT_TYPE" style="width: 100%" enabled="false" required="true"/>
							</td>
							<td align="right" style="width: 120px">合同价格模式:</td>
							<td>
								<input name="contractModel" id="contractModel" class="nui-dictcombobox" dictTypeId="CONTRACT_MODEL"  style="width: 100%" enabled="false" required="true"  />
							</td>
							<td align="right" style="width: 120px">招标人采购方式:</td>
							<td>
								<input name="procurementType" id="procurementType" class="nui-dictcombobox"  dictTypeId="ZH_PROCUREMENT_TYPE" style="width: 100%" enabled="false" required="true" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 120px">集团内外:</td>
							<td>
								<input name="headquarterGroup" id="headquarterGroup" class="nui-dictcombobox" dictTypeId="ZH_GROUP" style="width: 100%" enabled="false" required="true" />
							</td>
							<td align="right" style="width: 120px">合同文本密级:</td>
							<td>
								<input name="contractSecretLevel" id="contractSecretLevel" class="nui-dictcombobox" dictTypeId="CONTRACT_SECRET_LEVEL" style="width: 100%" enabled="false" required="true"  />
							</td>
							<td align="right" style="width: 120px">项目密级:</td>
							<td>
								<input name="projectSecretLevel" id="projectSecretLevel" class="nui-dictcombobox" dictTypeId="PROJECT_SECRET_LEVEL" style="width: 100%" enabled="false" required="true" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 120px">是否计划对外分包:</td>
							<td>
								<input name="isfb" id="isfb" class="nui-dictcombobox" dictTypeId="ABF_YESORNO"  style="width: 100%" enabled="false" required="true"  />
							</td>
							<td align="right" style="width: 100px">合同签约主体:</td>
							<td>
								<input id="contractSubject" name="contractSubject" class="nui-dictcombobox" dictTypeId="ZH_INVOICE_NAME_TYPE" enabled="false" style="width: 100%" required="true" />
							</td>
							<td align="right" style="width: 100px">收款方:</td>
							<td>
								<input id="payee" name="payee" class="nui-dictcombobox" enabled="false" dictTypeId="PAYER" style="width: 100%" required="true" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 120px"><nobr>签约方:</nobr></td>
							<td colspan="5">
								<span class="mini-buttonedit-border" style="padding-left: 0px; padding-right: 0px">
									<input name="custInfo" id="custInfo" class="nui-textboxlist" style="width: 100%" dataField="custinfos" url="com.zhonghe.ame.marketInfo.marketinfo.khxx.bid.queryCustByNameInfo.biz.ext"
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
							<td align="right" style="width: 100px">合同金额(元):</td>
							<td>
								<input id="contractSum" name="contractSum" class="nui-textbox" dictTypeId="CONTRACT_PRICE" style="width: 100%" required="true" enabled="false" />
							</td>

							<td align="right" style="width: 100px">合同不含税金额(元):</td>
							<td>
								<input id="noTaxSum" name="noTaxSum" class="nui-textbox" dictTypeId="CONTRACT_NATURE" style="width: 100%" required="true" enabled="false" />
							</td>
							<td align="right" style="width: 100px">税额(元):</td>
							<td>
								<input id="payTax" name="payTax" class="nui-textbox" dictTypeId="CONTRACT_NATURE" style="width: 100%" required="true" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 120px">备注:</td>
							<td colspan="5">
								<input name="remark" class="nui-textarea" enabled="false" style="width: 100%" />
							</td>
						</tr>
					</table>
				</div>
			</form>
		</fieldset>
		
		<fieldset id="field2" style="border: solid 1px #aaa;">
			<legend>补充合同信息</legend>
			<form>
				<div>
					<table style="table-layout: fixed;">
						<tr>
							<td align="right" style="width: 130px">合同编号：</td>
							<td>
								<input id="contractNo" name="contractNo" class="nui-textbox" style="width: 200px" required="true" enabled="false" />
							</td>
							<td align="right" style="width: 130px">签订日期：</td>
							<td>
								<input id="signingDate" name="signingDate" class="nui-datepicker" style="width: 200px" required="true" enabled="false" />
							</td>
						</tr>
					</table>
				</div>
			</form>
		</fieldset>	
		
		<fieldset id="field3" style="border: solid 1px #aaa;">
			<legend>未来年度收款计划</legend>
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
			<legend>附件</legend>
			<jsp:include page="/ame_common/detailFile.jsp" />
		</fieldset>
		
	</div>


	
	<script type="text/javascript">
		nui.parse();
    	var form = new nui.Form("#form1");
    	var grid2 = nui.get("datagrid2");
    	var processid = <%=request.getParameter("processInstID")%>;
		setData();
		form.setEnabled(false);
		
		function setData() {
			var json = nui.encode({processid:processid});
        	nui.ajax({
	            url: "com.zhonghe.ame.chargeContract.chargeContract.getChargeContractMessage.biz.ext",
				type: 'POST',
				data: json,	
				contentType: 'text/json',
	            success: function (o) {
	            	o = nui.decode(o);
	            	form.setData(o.chargeContract)
	            	
	            	// 签约方
	            	nui.get("custInfo").setValue(""+o.chargeContract.signatory+"");
					nui.get("custInfo").setText(""+o.chargeContract.signatoryName+"");
	            	
	            	// 投保记录
	            	nui.get("tenderId").setValue(o.chargeContract.tenderId);
					nui.get("tenderId").setText(o.chargeContract.tenderName);
					
					// 补充合同信息
					nui.get("contractNo").setValue(o.chargeContract.contractNo);
					nui.get("signingDate").setValue(o.chargeContract.signingDate);
	            	
	            	queryPlan(o.chargeContract.id);
					var grid_0 = nui.get("grid_0");
    				grid_0.load({"groupid":"CHARGE_CONTRACT","relationid":o.chargeContract.id});
					grid_0.sortBy("fileTime","desc");
				},
				error: function (jqXHR, textStatus, errorThrown) {
				        alert(jqXHR.responseText);
			    }
			});
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

	</script>
</body>
</html>