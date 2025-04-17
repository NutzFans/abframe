<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
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
<head>
<title>编辑收款/开票计划</title>
</head>
<body>
	<div class="nui-fit" style="padding: 5px">
		<form id="form1" method="post">
			<input id="id" class="nui-hidden" name="id" />
			<fieldset id="field1" style="border: solid 1px #aaa;">
				<legend>收款/开票计划</legend>
				<div style="padding: 5px;">
					<table style="table-layout: fixed;">
						<tr>
							<td align="right" style="width: 130px">经办人：</td>
							<td>
								<input name="createUserid" id="createUserid" class="nui-hidden" />
								<input id="createUsername" name="createUsername" class="nui-textbox" enabled="false" style="width: 250px" required="true" />
							</td>
							<td align="right" style="width: 130px">承办部门：</td>
							<td>
								<input name="secondaryOrg" id="secondaryOrg" class="nui-hidden" />
								<input id="secondaryOrgname" name="secondaryOrgname" class="nui-textbox" enabled="false" style="width: 250px" required="true" />
							</td>
							<td align="right" style="width: 130px">填报日期：</td>
							<td>
								<input id="createTime" name="createTime" class="nui-datepicker" style="width: 250px" required="true" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 130px">合同/项目名称：</td>
							<td colspan="3">
								<input name="contractName" id="contractName" class="nui-textbox" style="width: 100%" required="true" emptyText="如无具体项目请写 “潜在项目” " />
							</td>
							<td align="right" style="width: 130px">合同/项目状态：</td>
							<td>
								<input name="contractStauts" id="contractStauts" class="nui-dictcombobox" dictTypeId="ZH_CONTRACT_STATUS_SEL" style="width: 250px" required="true" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 130px">付款单位：</td>
							<td colspan="3">
								<span class="mini-buttonedit-border" style="padding-left: 0px; padding-right: 0px">
									<input name="custInfo" id="custInfo" class="nui-textboxlist" style="width: 615px" dataField="custinfos" url="com.zhonghe.ame.marketInfo.marketinfo.khxx.bid.queryCustByNameInfo.biz.ext"
										valueField="custid" textField="custname" allowInput="false" />
									<span id="custInfoButton" class="mini-buttonedit-buttons">
										<span class="mini-buttonedit-close"></span>
										<span class="mini-buttonedit-button" onclick="selectCustInfo()" onmouseover="mini.addClass(this, 'mini-buttonedit-button-hover');"
											onmouseout="mini.removeClass(this, 'mini-buttonedit-button-hover');">
											<span class="mini-buttonedit-icon"></span>
										</span>
									</span>
								</span>
							</td>
							<td align="right" style="width: 130px">收款方：</td>
							<td>
								<input id="payee" name="payee" class="nui-dictcombobox" dictTypeId="PAYER" style="width: 250px" required="true" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 130px">专业类别：</td>
							<td>
								<input id="major" name="major" class="nui-dictcombobox" dictTypeId="ZH_MAJOR_TYPE" style="width: 250px" required="true" enabled="true" />
							</td>
							<td align="right" style="width: 130px">工程类别：</td>
							<td>
								<input id="projectType" name="projectType" class="nui-dictcombobox" dictTypeId="ZH_PROJECT_TYPE" style="width: 250px" enabled="true" required="true" />
							</td>
							<td align="right" style="width: 130px">集团内外：</td>
							<td>
								<input id="headquarterGroup" name="headquarterGroup" class="nui-dictcombobox" dictTypeId="ZH_GROUP" style="width: 250px" required="true" enabled="true" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 130px">风险等级：</td>
							<td>
								<input id="riskLevel" name="riskLevel" class="nui-dictcombobox" dictTypeId="RISK_LEVEL" style="width: 250px" required="true" />
							</td>
							<td align="right" style="width: 130px">预计签署日期：</td>
							<td>
								<input id="estimatedDate" name="estimatedDate" class="nui-datepicker" style="width: 250px" required="true" />
							</td>
						</tr>
					</table>
				</div>
			</fieldset>

			<fieldset id="field2" style="border: solid 1px #aaa;">
				<legend>计划明细</legend>
				<div style="padding: 5px;">
					<table style="table-layout: fixed;">
						<tr>
							<td align="right" style="width: 130px">合同/项目金额(元)：</td>
							<td>
								<input name="contractSum" id="contractSum" class="nui-textbox" vtype="float" style="width: 250px" required="true" />
							</td>
							<td align="right" style="width: 130px">收款/开票年份：</td>
							<td>
								<input name="years" id="years" class="nui-textbox" vtype="int" style="width: 250px" required="true" />
							</td>
							<td align="right" style="width: 130px">收款/开票金额(元)：</td>
							<td>
								<input name="sum" id="sum" class="nui-textbox" vtype="float" style="width: 250px" required="true" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 130px">1月份金额(元)：</td>
							<td>
								<input name="jan" id="jan" class="nui-textbox" vtype="float" style="width: 250px" required="true" onvaluechanged="editSum" />
							</td>
							<td align="right" style="width: 130px">2月份金额(元)：</td>
							<td>
								<input name="feb" id="feb" class="nui-textbox" vtype="float" style="width: 250px" required="true" onvaluechanged="editSum" />
							</td>
							<td align="right" style="width: 130px">3月份金额(元)：</td>
							<td>
								<input name="mar" id="mar" class="nui-textbox" vtype="float" style="width: 250px" required="true" onvaluechanged="editSum" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 130px">4月份金额(元)：</td>
							<td>
								<input name="apr" id="apr" class="nui-textbox" vtype="float" style="width: 250px" required="true" onvaluechanged="editSum" />
							</td>
							<td align="right" style="width: 130px">5月份金额(元)：</td>
							<td>
								<input name="may" id="may" class="nui-textbox" vtype="float" style="width: 250px" required="true" onvaluechanged="editSum" />
							</td>
							<td align="right" style="width: 130px">6月份金额(元)：</td>
							<td>
								<input name="jun" id="jun" class="nui-textbox" vtype="float" style="width: 250px" required="true" onvaluechanged="editSum" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 130px">7月份金额(元)：</td>
							<td>
								<input name="jul" id="jul" class="nui-textbox" vtype="float" style="width: 250px" required="true" onvaluechanged="editSum" />
							</td>
							<td align="right" style="width: 130px">8月份金额(元)：</td>
							<td>
								<input name="aug" id="aug" class="nui-textbox" vtype="float" style="width: 250px" required="true" onvaluechanged="editSum" />
							</td>
							<td align="right" style="width: 130px">9月份金额(元)：</td>
							<td>
								<input name="sep" id="sep" class="nui-textbox" vtype="float" style="width: 250px" required="true" onvaluechanged="editSum" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 130px">10月份金额(元)：</td>
							<td>
								<input name="oct" id="oct" class="nui-textbox" vtype="float" style="width: 250px" required="true" onvaluechanged="editSum" />
							</td>
							<td align="right" style="width: 130px">11月份金额(元)：</td>
							<td>
								<input name="nov" id="nov" class="nui-textbox" vtype="float" style="width: 250px" required="true" onvaluechanged="editSum" />
							</td>
							<td align="right" style="width: 130px">12月份金额(元)：</td>
							<td>
								<input name="dec" id="dec" class="nui-textbox" vtype="float" style="width: 250px" required="true" onvaluechanged="editSum" />
							</td>
						</tr>
					</table>
				</div>
			</fieldset>
		</form>
	</div>

	<div style="text-align: center; position: relative; bottom: 10px" class="nui-toolbar">
		<a class="nui-button" onclick="onOk()" id="creatReimbProcess" style="width: 80px; margin-right: 20px;" iconCls="icon-save">保存</a>
		<a class="nui-button" onclick="closeCancel()" id="saveReimbProcess" style="width: 80px; margin-right: 140px;" iconCls="icon-close">关闭</a>
	</div>

	<script type="text/javascript">
		nui.parse();
		var form = new nui.Form("#form1");

		$("input[name='custInfo']").parent("td").attr("style", "border: 0px; background: #FFFFFF;")

		function setEditData(data) {
			if (!isStrEmpty(data.contractNo)) {
				nui.get("contractName").setEnabled(false);
				nui.get("contractStauts").setEnabled(false);
				nui.get("custInfo").setEnabled(false);
				$("#custInfoButton").css("display", "none");
				nui.get("payee").setEnabled(false);
				nui.get("major").setEnabled(false);
				nui.get("projectType").setEnabled(false);
				nui.get("headquarterGroup").setEnabled(false);
				nui.get("riskLevel").setEnabled(false);
				nui.get("estimatedDate").setEnabled(false);
			}
			form.setData(data);
			nui.get("custInfo").setValue(data.signatory);
			nui.get("custInfo").setText(data.signatoryName);
		}

		function selectCustInfo() {
			mini.open({
				url : "/default/marketInfo/bid/selectCustInfo.jsp",
				title : "选择付款单位（请先查找客户，如不存在再新增）",
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

		function editSum() {
			var jan = nui.get("jan").getValue() * 1;
			var feb = nui.get("feb").getValue() * 1;
			var mar = nui.get("mar").getValue() * 1;
			var apr = nui.get("apr").getValue() * 1;
			var may = nui.get("may").getValue() * 1;
			var jun = nui.get("jun").getValue() * 1;
			var jul = nui.get("jul").getValue() * 1;
			var aug = nui.get("aug").getValue() * 1;
			var sep = nui.get("sep").getValue() * 1;
			var oct = nui.get("oct").getValue() * 1;
			var nov = nui.get("nov").getValue() * 1;
			var dec = nui.get("dec").getValue() * 1;
			abs = function(val) {
				var str = (val).toFixed(2) + '';
				var intSum = str.substring(0, str.indexOf(".")).replace(/\B(?=(?:\d{3})+$)/g, '');
				var dot = str.substring(str.length, str.indexOf("."))
				var ret = intSum + dot;
				return ret;
			}
			var sum = jan + feb + mar + apr + may + jun + jul + aug + sep + oct + nov + dec;
			nui.get("sum").setValue(abs(sum));
		}

		function onOk() {
			if (!form.validate()) {
				showTips("请检查表单的完整性!", "danger");
				return;
			}
			var data = form.getData();
			data.signatory = nui.get("custInfo").getValue();
			data.signatoryName = nui.get("custInfo").getText();
			var json = nui.encode({
				'annualChargePlan' : data
			});
			ajaxCommon({
				"url" : "com.zhonghe.ame.annualPlan.annualPlan.editAnnualChargePlan.biz.ext",
				"data" : json,
				"success" : function(data) {
					if (data.result == "1") {
						showTips("编辑收款/开票计划信息成功");
						closeOk();
					} else {
						showTips("编辑收款/开票计划信息失败，请联系管理员！", "danger");
					}
				}
			});
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