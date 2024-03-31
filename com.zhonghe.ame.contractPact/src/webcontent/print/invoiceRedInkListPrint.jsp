<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="commonj.sdo.DataObject"%>
<%@page import="java.util.Map"%>
<%@include file="/common/common.jsp"%>
<html>
<head>
<title>打印页面</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<script src="<%=request.getContextPath()%>/common/nui/warterMark.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/common/nui/nui.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/ame_common/js/jquery.qrcode.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/ame_common/js/JsBarcode.all.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/ame_common/js/jquery-barcode.js"></script>
<%
	UserObject user = (UserObject) session.getAttribute("userObject");
	String userName = user.getUserName();
%>
<style type="text/css">
.link-top {
	width: 100%;
	height: 5px;
	border-bottom: solid #ACC0D8 5px;
}

.base_div {
	text-align: left;
	font-size: 14px;
	font-weight: bold;
	background: #F6F6F6;
	padding: 8px;
	border-bottom: 1px solid #999;
}

body {
	-webkit-print-color-adjust: exact;
}

table tr {
	height: 28px;
}

table,table tr td {
	font-size: 12px;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
</head>
<body style="overflow-y: scroll;">
	<div align="right" style="width: 400px;">
		<div align="right">
			<a class="nui-button" id="checkview" iconCls="icon-print" onclick="printBtn()">打印</a>
		</div>
	</div>

	<div title="开票信息打印 - 红冲/作废" style="height: auto">
		<div id="pipi" class="nui-panel" style="font-size: 13px; width: 840px; height: 30px; margin: 0 auto; text-align: center;" align="left"></div>
		<div class="" style="width: 798px; margin: 0 auto; font-size: 14px; border: 1px solid #999999;">
			<div class="base_div">开票基本信息 - 红冲/作废</div>
			<div style="padding: 1px;">
				<fieldset id="field1" style="border: solid 1px #aaa;">
					<legend>原 - 开票信息信息</legend>
					<form>
						<div>
							<table style="table-layout: fixed;">
								<tr>
									<td align="right" style="width: 140px">合同名称：</td>
									<td colspan="3">
										<input id="historyContractName" enabled="false" class="nui-textbox" style="width: 100%" />
									</td>
								</tr>
								<tr>
									<td align="right">申请人：</td>
									<td>
										<input id="historyCreateUsername" class="nui-textbox" enabled="false" style="width: 300px" />
									</td>
									<td align="right" style="width: 160px">合同实施部门：</td>
									<td>
										<input id="historyImplementOrg" shownullItem=ture class="nui-treeselect" textField="orgname" valueField="orgid" parentField="omOrganization.orgid" dataField="orgs" showTreeIcon="true"
											valueFromSelect="true" style="width: 100%;" url="com.zhonghe.ame.imptask.keytask.getAllRunOrgsforzdrw.biz.ext" allowInput="true" required="true" multiSelect="false" checkRecursive="false"
											expandOnLoad="0" enabled="false" showFolderCheckBox="true" />
									</td>
								</tr>
								<tr>
									<td align="right" style="width: 160px">申请日期：</td>
									<td>
										<input id="historyCreateTime" enabled="false" class="nui-datepicker" style="width: 300px" required="true" />
									</td>
									<td align="right" style="width: 160px">合同编号：</td>
									<td>
										<input id="historyContractNo" onbuttonclick="onButtonEdit" class="nui-buttonedit" style="width: 300px" required="true" enabled="false" />
									</td>
								</tr>
								<tr>
									<td align="right" style="width: 100px">专业类别：</td>
									<td>
										<input id="historyMajor" class="nui-dictcombobox" dictTypeId="ZH_MAJOR_TYPE" style="width: 300px" required="true" enabled="false" />
									</td>
									<td align="right" style="width: 160px">工程类别：</td>
									<td>
										<input id="historyProjectType" class="nui-dictcombobox" dictTypeId="ZH_PROJECT_TYPE" style="width: 300px" required="true" enabled="false" />
									</td>
								</tr>
								<tr>
									<td align="right" style="width: 160px">集团内外：</td>
									<td>
										<input id="historyHeadquarterGroup" class="nui-dictcombobox" dictTypeId="ZH_GROUP" style="width: 300px" required="true" enabled="false" />
									</td>
									<td align="right" style="width: 160px">发票抬头类别：</td>
									<td>
										<input id="historyInvoiceNameType" class="nui-dictcombobox" dictTypeId="ZH_INVOICE_NAME_TYPE" style="width: 300px" required="true" enabled="false" />
									</td>
								</tr>
								<tr>
									<td align="right" style="width: 160px">发票类型：</td>
									<td>
										<input id="historyInvoiceType" class="nui-dictcombobox" dictTypeId="MIS_MA_INVOICETYPE" style="width: 300px" required="true" onvaluechanged="invoiceType" enabled="false" />
									</td>
									<td align="right" style="width: 160px">税率（%）：</td>
									<td>
										<input id="historyInvoiceRate" class="nui-textbox" style="width: 300px" required="true" onvaluechanged="editContractSum" value="6" enabled="false" />
									</td>
								</tr>
								<tr>
									<td align="right" style="width: 160px">用途：</td>
									<td>
										<input id="historyInvoiceUsed" class="nui-dictcombobox" dictTypeId="INVOICE_USED" style="width: 100%" required="true" enabled="false" />
									</td>
									<td align="right" style="width: 180px">合同金额（元）：</td>
									<td>
										<input id="historyInvoiceSumCapital" class="nui-textbox" vtype="float" style="width: 300px" required="true" enabled="false" />
									</td>
								</tr>
								<tr>
									<td align="right" style="width: 160px">开票金额（元）：</td>
									<td>
										<input id="historyInvoiceSum" class="nui-textbox" vtype="float" style="width: 300px" required="true" onvaluechanged="editContractSum" enabled="false" />
									</td>
									<td align="right" style="width: 160px">账面收入（元）：</td>
									<td>
										<input id="historyBookIncome" class="nui-textbox" style="width: 300px" required="true" enabled="false" />
									</td>
								</tr>
								<tr>
									<td align="right" style="width: 160px">税额：</td>
									<td>
										<input id="historyInvoiceTax" class="nui-textbox" style="width: 300px" required="true" enabled="false" />
									</td>
									<td align="right" style="width: 160px">收款进度：</td>
									<td>
										<input id="historyPayType" class="nui-dictcombobox" dictTypeId="payType" style="width: 300px" required="true" enabled="false" />
									</td>
								</tr>
								<tr>
									<td align="right" style="width: 160px">开票金额大写：</td>
									<td colspan="3">
										<input id="historyInvoiceSumChinese" class="nui-textbox" style="width: 100%" required="true" enabled="false" />
									</td>
								</tr>
								<tr>
									<td align="right" style="width: 160px">名称：</td>
									<td colspan="3">
										<input id="historyPayerName" class="nui-textbox" style="width: 100%" required="true" enabled="false" />
									</td>
								</tr>
								<tr>
									<td align="right" style="width: 160px">纳税人识别号：</td>
									<td colspan="3">
										<input id="historyTaxpayerNumber" class="nui-textbox" style="width: 100%" required="true" enabled="false" />
									</td>
								</tr>
								<tr>
									<td align="right" style="width: 160px">地址、电话：</td>
									<td colspan="3">
										<input id="historyUnitAddress" class="nui-textbox" style="width: 100%" required="true" enabled="false" />
									</td>
								</tr>
								<tr>
									<td align="right" style="width: 160px">开户行及账号：</td>
									<td colspan="3">
										<input id="historyAccount" class="nui-textbox" style="width: 100%" required="true" enabled="false" />
									</td>
								</tr>
								<tr>
									<td align="right" style="width: 160px">发票备注：</td>
									<td colspan="8">
										<input id="historyInvoiceRemark" class="nui-textbox" style="width: 100%" required="false" enabled="false" />
									</td>
								</tr>
								<tr>
									<td align="right" style="width: 160px">开票是否邮寄：</td>
									<td>
										<input id="historyPostFlag" class="nui-dictcombobox" onvaluechanged="setAttribute" dictTypeId="ZH_POST" style="width: 300px" required="true" enabled="false" />
									</td>
									<td align="right" style="width: 160px">发票领取人：</td>
									<td>
										<input id="historyInvoiceUser" class="nui-textbox" style="width: 100%" required="true" enabled="false" />
									</td>
								</tr>
								<tr>
									<td align="right" style="width: 160px">邮寄姓名：</td>
									<td>
										<input id="historyMailName" class="nui-textbox" style="width: 300px" required="true" enabled="false" />
									</td>
									<td align="right" style="width: 160px">邮寄电话：</td>
									<td>
										<input id="historyMailPhone" class="nui-textbox" style="width: 300px" required="true" enabled="false" />
									</td>
								</tr>
								<tr>
									<td align="right" style="width: 160px">邮寄地址：</td>
									<td colspan="3">
										<input id="historyMailAddress" class="nui-textbox" style="width: 100%" required="true" enabled="false" />
									</td>
								</tr>
								<tr>
									<td align="right" style="width: 160px">回款金额（元）：</td>
									<td>
										<input id="historyReceivableSum" class="nui-textbox" vtype="float" style="width: 300px" required="true" onvaluechanged="receivableSum" enabled="false" />
									</td>
									<td align="right" style="width: 160px">余额（元）：</td>
									<td>
										<input id="historyBalanceSum" class="nui-textbox" style="width: 300px" required="true" enabled="false" />
									</td>
								</tr>
								<tr>
									<td align="right" style="width: 160px">回款时间：</td>
									<td>
										<input id="historyReceivableData" enabled="false" class="nui-datepicker" style="width: 300px" required="true" />
									</td>
									<td align="right" style="width: 160px">核查（元）：</td>
									<td>
										<input id="historyVerification" class="nui-textbox" style="width: 300px" required="true" enabled="false" />
									</td>
								</tr>
								<tr>
									<td align="right" style="width: 160px">备注：</td>
									<td colspan="3">
										<input id="historyRemark" class="nui-textarea" style="width: 100%; height: 235px" required="false" enabled="false" />
									</td>
								</tr>
							</table>
						</div>
					</form>
				</fieldset>

				<fieldset id="field2" style="border: solid 1px #aaa;">
					<legend>红冲/作废 - 开票信息</legend>
					<form id="form1">
						<div>
							<table style="table-layout: fixed;">
								<tr>
									<td align="right">申请人</td>
									<td>
										<input id="createUsername" name="createUsername" class="nui-textbox" enabled="false" style="width: 300px" required="true" />
									</td>
									<td align="right" style="width: 160px">申请单位：</td>
									<td>
										<input id="implementOrg" name="implementOrg" shownullItem=ture class="nui-treeselect" textField="orgname" valueField="orgid" parentField="omOrganization.orgid" dataField="orgs" showTreeIcon="true"
											valueFromSelect="true" style="width: 100%;" url="com.zhonghe.ame.imptask.keytask.getAllRunOrgsforzdrw.biz.ext" allowInput="true" required="true" multiSelect="false" checkRecursive="false"
											expandOnLoad="0" enabled="false" showFolderCheckBox="true" />
									</td>
								</tr>
								<tr>
									<td align="right" style="width: 160px">申请日期：</td>
									<td>
										<input id="createTime" name="createTime" class="nui-datepicker" style="width: 300px" enabled="false" required="true" />
									</td>
									<td align="right" style="width: 160px">合同编号：</td>
									<td>
										<input id="contractNo" name="contractNo" onbuttonclick="onButtonEdit" class="nui-buttonedit" style="width: 300px" required="true" enabled="false" />
									</td>
								</tr>
								<tr>
									<td align="right" style="width: 160px">合同名称：</td>
									<td colspan="3">
										<input id="contractName" name="contractName" class="nui-textbox" style="width: 100%" required="true" enabled="false" />
									</td>
								</tr>
								<tr>
									<td align="right" style="width: 100px">申请红冲/作废：</td>
									<td>
										<input id="redInkType" name="redInkType" class="nui-dictcombobox" dictTypeId="ZH_RED_INK_TYPE" style="width: 300px" required="true" enabled="false" />
									</td>
									<td align="right" style="width: 160px">红冲/作废金额（元）：</td>
									<td>
										<input id="invoiceSum" name="invoiceSum" class="nui-textbox" vtype="float" style="width: 300px" required="true" onvaluechanged="editContractSum" enabled="false" />
									</td>
								</tr>
								<tr>
									<td align="right" style="width: 160px">红冲/作废金额大写：</td>
									<td colspan="3">
										<input id="invoiceSumChinese" class="nui-textbox" style="width: 100%" required="true" enabled="false" />
									</td>
								</tr>
								<tr>
									<td align="right" style="width: 160px">账面收入（元）：</td>
									<td>
										<input id="bookIncome" name="bookIncome" class="nui-textbox" style="width: 300px" required="true" enabled="false" />
									</td>
									<td align="right" style="width: 160px">税额：</td>
									<td>
										<input name="invoiceTax" id="invoiceTax" class="nui-textbox" style="width: 300px" required="true" enabled="false" />
									</td>
								</tr>
								<tr>
									<td align="right" style="width: 160px">红冲/作废原因：</td>
									<td colspan="3">
										<input name="remark" class="nui-textarea" style="width: 100%; height: 200px" required="true" enabled="false" />
									</td>
								</tr>
							</table>
						</div>
					</form>
				</fieldset>

				<fieldset id="field4" style="border: solid 1px #aaa;">
					<legend>原 - 开票信息附件</legend>
					<jsp:include page="/ame_common/detailFile.jsp" />
				</fieldset>

				<fieldset id="field5" style="border: solid 1px #aaa;">
					<legend>红冲/作废 - 相关附件</legend>
					<jsp:include page="/ame_common/detailFileExpand.jsp" />
				</fieldset>

				<fieldset id="field6" style="border: solid 1px #aaa;">
					<legend>审批意见列表</legend>
					<div id="datagrid5" class="nui-datagrid" style="height: auto;" dataField="misOpinions" url="com.primeton.eos.ame_pur.purContractProcess.queryAuditOpinions.biz.ext" idField="id" allowResize="true"
						allowAlternating="true" multiSelect="true" showPager="false" allowCellWrap="true">
						<div property="columns">
							<div type="indexcolumn" headerAlign="center" width="30">编号</div>
							<div field="operatorname" width="50" headerAlign="center" align="center">处理人</div>
							<div field="workitemname" width="80" align="center" headerAlign="center">处理环节</div>
							<div field="auditstatus" renderer="onCheckRenderer" width="80" align="center" headerAlign="center">处理结果</div>
							<div field="auditopinion" width="150" headerAlign="center">处理意见</div>
							<div field="time" width="100" headerAlign="center" align="center" dateFormat="yyyy-MM-dd HH:mm:ss">处理时间</div>
							<div field="orgname" width="100" align="center" headerAlign="center">处理人所在机构</div>
							<div field="files" renderer="onFileRenderer" width="100" hight="100" align="center" headerAlign="center">附件</div>
						</div>
					</div>
				</fieldset>

			</div>
		</div>
	</div>

	<script type="text/javascript">
		nui.parse();
		var form = new nui.Form("#form1");
		var grid5 = nui.get("datagrid5");
		var id =<%=request.getParameter("id")%>;

		setData();

		function setData() {
			var json = nui.encode({
				"id" : id
			});
			nui.ajax({
				url : "com.zhonghe.ame.purchase.purchaseProApp.queryProAppByInvoice.biz.ext",
				type : 'POST',
				data : json,
				contentType : 'text/json',
				success : function(result) {
					var data = result.proApp[0];
					form.setData(data);
					queryHistory(data.relateCont);
					nui.get("contractNo").setText(data.contractNo);
					nui.get("invoiceSumChinese").setValue(functiondigitUppercase(nui.get("invoiceSum").getValue()));
					document.getElementById("pipi").innerHTML = "【" + data.createUsername + "发起的" + data.contractName + "开票申请】";
					form.setEnabled(false);
					var detailFileExpandGrid = nui.get("detailFileExpandGrid");
					detailFileExpandGrid.load({
						"groupid" : "INVOICE",
						"relationid" : data.id
					});
					detailFileExpandGrid.sortBy("fileTime", "desc");
					grid5.load({
						processInstID : data.processid
					});
					grid5.sortBy("time", "desc");
				}
			});
		}

		function queryHistory(str) {
			var json = {
				"id" : str
			};
			nui.ajax({
				url : "com.zhonghe.ame.purchase.purchaseProApp.queryProAppByInvoice.biz.ext",
				type : "post",
				contentType : 'text/json',
				data : json,
				success : function(result) {
					var data = result.proApp[0];
					nui.get("historyCreateUsername").setValue(data.createUsername);
					nui.get("historyImplementOrg").setValue(data.implementOrg);
					nui.get("historyCreateTime").setValue(data.createTime);
					nui.get("historyContractNo").setText(data.contractNo);
					nui.get("historyContractName").setValue(data.contractName);
					nui.get("historyMajor").setValue(data.major);
					nui.get("historyProjectType").setValue(data.projectType);
					nui.get("historyHeadquarterGroup").setValue(data.headquarterGroup);
					nui.get("historyInvoiceNameType").setValue(data.invoiceNameType);
					nui.get("historyInvoiceType").setValue(data.invoiceType);
					nui.get("historyInvoiceRate").setValue(data.invoiceRate);
					nui.get("historyInvoiceUsed").setValue(data.invoiceUsed);
					nui.get("historyPayType").setValue(data.payType);
					nui.get("historyInvoiceSumCapital").setValue(data.invoiceSumCapital);
					nui.get("historyInvoiceSum").setValue(data.invoiceSum);
					nui.get("historyBookIncome").setValue(data.bookIncome);
					nui.get("historyInvoiceTax").setValue(data.invoiceTax);
					nui.get("historyPayerName").setValue(data.payerName);
					nui.get("historyTaxpayerNumber").setValue(data.taxpayerNumber);
					nui.get("historyUnitAddress").setValue(data.unitAddress);
					nui.get("historyAccount").setValue(data.account);
					nui.get("historyInvoiceRemark").setValue(data.invoiceRemark);
					nui.get("historyPostFlag").setValue(data.postFlag);
					nui.get("historyInvoiceUser").setValue(data.invoiceUser);
					nui.get("historyMailName").setValue(data.mailName);
					nui.get("historyMailPhone").setValue(data.mailPhone);
					nui.get("historyMailAddress").setValue(data.mailAddress);
					nui.get("historyRemark").setValue(data.remark);
					nui.get("historyInvoiceSumChinese").setValue(functiondigitUppercase(nui.get("historyInvoiceSum").getValue()));

					var grid_0 = nui.get("grid_0");
					grid_0.load({
						"groupid" : "INVOICE",
						"relationid" : data.id
					});
					grid_0.sortBy("fileTime", "desc");
				}
			})
		}

		function functiondigitUppercase(price) {
			if (price.substr(0, 1) == "-") {
				price = price.slice(1);
			}
			price = price * 1.0;
			if (price === 0) {
				return "零";
			}
			var unit = "仟佰拾亿仟佰拾万仟佰拾元角分", str = "";
			price += "00";
			var point = price.indexOf('.');
			if (point >= 0) {
				price = price.substring(0, point) + price.substr(point + 1, 2);
			}
			unit = unit.substr(unit.length - price.length);
			for (var i = 0; i < price.length; i++) {
				str += '零壹贰叁肆伍陆柒捌玖'.charAt(price.charAt(i)) + unit.charAt(i);
			}
			var result = str.replace(/零(仟|佰|拾|角)/g, "零").replace(/(零)+/g, "零").replace(/零(万|亿|元)/g, "$1").replace(/(亿)万/g, "$1$2").replace(/^元零?|零分/g, "").replace(/元$/g, "元整");
			return result;
		}
		
		function initMisOpinion(data) {
			//初始化处理意见
			var dataStatus = [ {
				"dictID" : 1,
				"dictName" : "通过"
			}, {
				"dictID" : 0,
				"dictName" : "退回"
			}, {
				"dictID" : 2,
				"dictName" : "终止流程"
			} ];
			nui.get("auditstatus").setData(dataStatus);
			nui.get("auditstatus").setValue(data.auditstatus);
		}
		
		//处理结果业务字典显示
		function onCheckRenderer(e) {
			return nui.getDictText('MIS_AUDITSTATUS', e.value);
		}
		
		function printBtn() {
			document.getElementById('checkview').style.display = "none";
			print();
			document.getElementById('checkview').style.display = "";
		}
		
		// 设置水印用户
		setWatermark('<%=userName %>')				
		
	</script>

</body>
</html>