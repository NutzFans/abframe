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

.hidden {
	display: none;
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
						<input name="historyId" id="historyId" class="nui-hidden" />
						<div>
							<table style="width: 100%">
								<tr>
									<td align="right" style="width: 90px">合同名称：</td>
									<td colspan="3">
										<input id="historyContractName" enabled="false" class="nui-textbox" style="width: 100%" />
									</td>
								</tr>
								<tr>
									<td align="right" style="width: 90px">申请人：</td>
									<td>
										<input id="historyCreateUsername" class="nui-textbox" enabled="false" style="width: 100%" />
									</td>
									<td align="right" style="width: 90px">合同实施部门：</td>
									<td>
										<input id=historyImplementOrg class="nui-textbox" enabled="false" style="width: 100%" />
									</td>
								</tr>
								<tr>
									<td align="right" style="width: 90px">申请日期：</td>
									<td>
										<input id="historyCreateTime" enabled="false" class="nui-datepicker" style="width: 100%" required="true" />
									</td>
									<td align="right" style="width: 90px">合同编号：</td>
									<td>
										<input id="historyContractNo" onbuttonclick="onButtonEdit" class="nui-buttonedit" style="width: 100%" required="true" enabled="false" />
									</td>
								</tr>
								<tr>
									<td align="right" style="width: 90px">专业类别：</td>
									<td>
										<input id="historyMajor" class="nui-dictcombobox" dictTypeId="ZH_MAJOR_TYPE" style="width: 100%" required="true" enabled="false" />
									</td>
									<td align="right" style="width: 90px">服务范围：</td>
									<td>
										<input id="historyBidService" class="nui-dictcombobox" dictTypeId="ZH_BID_SERVICE" style="width: 100%" required="true" enabled="false"/>
									</td>
								</tr>
								<tr>
									<td align="right" style="width: 90px">工程类别：</td>
									<td>
										<input id="historyProjectType" class="nui-dictcombobox" dictTypeId="ZH_PROJECT_TYPE" style="width: 100%" required="true" enabled="false" />
									</td>
									<td align="right" style="width: 90px">集团内外：</td>
									<td>
										<input id="historyHeadquarterGroup" class="nui-dictcombobox" dictTypeId="ZH_GROUP" style="width: 100%" required="true" enabled="false" />
									</td>
								</tr>
								<tr>
									<td align="right" style="width: 90px">发票抬头类别：</td>
									<td colspan="3">
										<input id="historyInvoiceNameType" class="nui-dictcombobox" dictTypeId="ZH_INVOICE_NAME_TYPE" style="width: 100%" required="true" enabled="false" />
									</td>
								</tr>
								<tr>
									<td align="right" style="width: 90px">发票类型：</td>
									<td>
										<input id="historyInvoiceType" class="nui-dictcombobox" dictTypeId="MIS_MA_INVOICETYPE" style="width: 100%" required="true" onvaluechanged="invoiceType" enabled="false" />
									</td>
									<td align="right" style="width: 90px">税率(%)：</td>
									<td>
										<input id="historyInvoiceRate" class="nui-textbox" style="width: 100%" required="true" onvaluechanged="editContractSum" value="6" enabled="false" />
									</td>
								</tr>
								<tr>
									<td align="right" style="width: 90px">用途：</td>
									<td>
										<input id="historyInvoiceUsed" class="nui-dictcombobox" dictTypeId="INVOICE_USED" style="width: 100%" required="true" enabled="false" />
									</td>
									<td align="right" style="width: 90px">合同金额(元)：</td>
									<td>
										<input id="historyInvoiceSumCapital" class="nui-textbox" vtype="float" style="width: 100%" required="true" enabled="false" />
									</td>
								</tr>
								<tr>
									<td align="right" style="width: 90px">实际开票金额(元)：</td>
									<td>
										<input id="historyActualInvoiceSum" class="nui-textbox" vtype="float" style="width: 100%" required="true" enabled="false"/>
									</td>
									<td align="right" style="width: 90px">产值分配：</td>
									<td>
										<input id="historyAllotFlag" class="nui-dictcombobox" dictTypeId="ZH_YN" style="width: 100%" required="true" enabled="false"/>
									</td>
								</tr>
								<tr>
									<td align="right" style="width: 90px">开票金额(元)：</td>
									<td>
										<input id="historyInvoiceSum" class="nui-textbox" vtype="float" style="width: 100%" required="true" onvaluechanged="editContractSum" enabled="false" />
									</td>
									<td align="right" style="width: 90px">账面收入(元)：</td>
									<td>
										<input id="historyBookIncome" class="nui-textbox" style="width: 100%" required="true" enabled="false" />
									</td>
								</tr>
								<tr>
									<td align="right" style="width: 90px">税额：</td>
									<td>
										<input id="historyInvoiceTax" class="nui-textbox" style="width: 100%" required="true" enabled="false" />
									</td>
									<td align="right" style="width: 90px">收款进度：</td>
									<td>
										<input id="historyPayType" class="nui-dictcombobox" dictTypeId="payType" style="width: 100%" required="true" enabled="false" />
									</td>
								</tr>
								<tr>
									<td align="right" style="width: 90px">开票金额大写：</td>
									<td colspan="3">
										<input id="historyInvoiceSumChinese" class="nui-textbox" style="width: 100%" required="true" enabled="false" />
									</td>
								</tr>
								<tr>
									<td align="right" style="width: 90px">名称：</td>
									<td colspan="3">
										<input id="historyPayerName" class="nui-textbox" style="width: 100%" required="true" enabled="false" />
									</td>
								</tr>
								<tr>
									<td align="right" style="width: 90px">纳税人识别号：</td>
									<td colspan="3">
										<input id="historyTaxpayerNumber" class="nui-textbox" style="width: 100%" required="true" enabled="false" />
									</td>
								</tr>
								<tr>
									<td align="right" style="width: 90px">发票备注：</td>
									<td colspan="3">
										<input id="historyInvoiceRemark" class="nui-textbox" style="width: 100%" required="false" enabled="false" />
									</td>
								</tr>
								<tr>
									<td align="right" style="width: 120px">数电发票接收人邮箱：</td>
									<td colspan="3">
										<input id="historyInvoiceUserMail" class="nui-textbox" style="width: 100%" required="false" enabled="false" />
									</td>
								</tr>
								<tr>
									<td align="right" style="width: 90px">回款金额(元)：</td>
									<td>
										<input id="historyReceivableSum" class="nui-textbox" vtype="float" style="width: 100%" required="true" onvaluechanged="receivableSum" enabled="false" />
									</td>
									<td align="right" style="width: 90px">余额(元)：</td>
									<td>
										<input id="historyBalanceSum" class="nui-textbox" style="width: 100%" required="true" enabled="false" />
									</td>
								</tr>
								<tr>
									<td align="right" style="width: 90px">回款时间：</td>
									<td>
										<input id="historyReceivableData" enabled="false" class="nui-datepicker" style="width: 100%" required="true" />
									</td>
									<td align="right" style="width: 90px">核查(元)：</td>
									<td>
										<input id="historyVerification" class="nui-textbox" style="width: 100%" required="true" enabled="false" />
									</td>
								</tr>
								<tr>
									<td align="right" style="width: 90px">备注：</td>
									<td colspan="3">
										<input id="historyRemark" class="nui-textarea" style="width: 100%; height: 235px" required="false" enabled="false" />
									</td>
								</tr>
							</table>
						</div>
					</form>
				</fieldset>
				
				<fieldset id="historyAllotFieldset" style="border: solid 1px #aaa;" class="hidden">
					<legend>
						原 - 产值分配
					</legend>
					<div id="historyAllotDataGrid" class="nui-datagrid" style="width: 100%; height: 150px;" showPager="false" allowCellWrap="true">
						<div property="columns">
							<div field="username" headerAlign="center">申请人</div>
							<div field="orgname" headerAlign="center">承办部门</div>
							<div field="invoiceSum" headerAlign="center">开票金额（元）</div>
							<div field="bookIncome" headerAlign="center">账面收入（元）</div>
							<div field="invoiceTax" headerAlign="center">税额（元）</div>
						</div>
					</div>
				</fieldset>

				<fieldset id="field2" style="border: solid 1px #aaa;">
					<legend>红冲/作废 - 开票信息</legend>
					<form id="form1">
						<div>
							<table style="width: 100%">
								<tr>
									<td align="right" style="width: 90px">申请人：</td>
									<td>
										<input id="createUsername" name="createUsername" class="nui-textbox" enabled="false" style="width: 100%" required="true" />
									</td>
									<td align="right" style="width: 90px">申请单位：</td>
									<td>
										<input name="implementOrg" id="implementOrg" class="nui-hidden" style="width: 100%" />
										<input name="implementOrgname" id="implementOrgname" class="nui-textbox" enabled="false" style="width: 100%" required="true" />
									</td>
								</tr>
								<tr>
									<td align="right" style="width: 90px">申请日期：</td>
									<td>
										<input id="createTime" name="createTime" class="nui-datepicker" style="width: 100%" enabled="false" required="true" />
									</td>
									<td align="right" style="width: 90px">合同编号：</td>
									<td>
										<input id="contractNo" name="contractNo" onbuttonclick="onButtonEdit" class="nui-buttonedit" style="width: 100%" required="true" enabled="false" />
									</td>
								</tr>
								<tr>
									<td align="right" style="width: 90px">合同名称：</td>
									<td colspan="3">
										<input id="contractName" name="contractName" class="nui-textbox" style="width: 100%" required="true" enabled="false" />
									</td>
								</tr>
								<tr>
									<td align="right" style="width: 90px">申请红冲/作废：</td>
									<td>
										<input id="redInkType" name="redInkType" class="nui-dictcombobox" dictTypeId="ZH_RED_INK_TYPE" style="width: 100%" required="true" enabled="false" />
									</td>
								</tr>
								<tr>
									<td align="right" style="width: 140px">实际红冲/作废金额(元)：</td>
									<td>
										<input id="actualInvoiceSum" name="actualInvoiceSum" class="nui-textbox" vtype="float" style="width: 100%" required="true" enabled="false" />
									</td>
									<td align="right" style="width: 110px">红冲/作废金额(元)：</td>
									<td>
										<input id="invoiceSum" name="invoiceSum" class="nui-textbox" vtype="float" style="width: 100%" required="true" onvaluechanged="editContractSum" enabled="false" />
									</td>
								</tr>
								<tr>
									<td align="right" style="width: 120px">红冲/作废金额大写：</td>
									<td colspan="3">
										<input id="invoiceSumChinese" class="nui-textbox" style="width: 100%" required="true" enabled="false" />
									</td>
								</tr>
								<tr>
									<td align="right" style="width: 90px">账面收入(元)：</td>
									<td>
										<input id="bookIncome" name="bookIncome" class="nui-textbox" style="width: 100%" required="true" enabled="false" />
									</td>
									<td align="right" style="width: 90px">税额：</td>
									<td>
										<input name="invoiceTax" id="invoiceTax" class="nui-textbox" style="width: 100%" required="true" enabled="false" />
									</td>
								</tr>
								<tr>
									<td align="right" style="width: 120px">数电发票接收人邮箱：</td>
									<td colspan="3">
										<input name="invoiceUserMail" class="nui-textbox" style="width: 100%" required="true" enabled="false" />
									</td>
								</tr>
								<tr>
									<td align="right" style="width: 90px">红冲/作废原因：</td>
									<td colspan="3">
										<input name="remark" class="nui-textarea" style="width: 100%; height: 200px" required="true" enabled="false" />
									</td>
								</tr>
							</table>
						</div>
					</form>
				</fieldset>
				
				<fieldset id="allotFieldset" style="border: solid 1px #aaa;" class="hidden">
					<legend>
						红冲/作废 - 产值分配
					</legend>
					<div id="allotDataGrid" class="nui-datagrid" style="width: 100%; height: 150px;" showPager="false" allowCellWrap="true">
						<div property="columns">
							<div field="username" headerAlign="center">申请人</div>
							<div field="orgname" headerAlign="center">承办部门</div>
							<div field="invoiceSum" headerAlign="center">红冲/作废金额（元）</div>
							<div field="bookIncome" headerAlign="center">账面收入（元）</div>
							<div field="invoiceTax" headerAlign="center">税额（元）</div>
						</div>
					</div>
				</fieldset>				

				<fieldset id="field4" style="border: solid 1px #aaa;">
					<legend>原 - 开票信息附件</legend>
					<jsp:include page="/ame_common/detailFile.jsp">
						<jsp:param name="downloadZip" value="true"/>
					</jsp:include>
				</fieldset>

				<fieldset id="field5" style="border: solid 1px #aaa;">
					<legend>红冲/作废 - 相关附件</legend>
					<jsp:include page="/ame_common/detailFileExpand.jsp">
						<jsp:param name="downloadZipExpand" value="true"/>
					</jsp:include>
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
	
	<form name="exprotZipFileFlow" id="exprotZipFileFlow" action="com.primeton.eos.ame_common.ameExportZip.flow" method="post">
		<input type="hidden" name="_eosFlowAction" value="action0" filter="false" />
		<input type="hidden" name="downloadFile" filter="false" />
		<input type="hidden" name="fileName" filter="false" />
	</form>	

	<script type="text/javascript">
		nui.parse();
		var form = new nui.Form("#form1");
		var historyAllotDataGrid = nui.get("historyAllotDataGrid");
		var allotDataGrid = nui.get("allotDataGrid");
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
					queryAllotDatas(data.id, data.allotFlag);
					nui.get("contractNo").setText(data.contractNo);
					nui.get("invoiceSumChinese").setValue(functiondigitUppercase(nui.get("actualInvoiceSum").getValue()));
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
		
		function queryAllotDatas(invoiceId, allotFlag) {
			nui.ajax({
				url : "com.zhonghe.ame.invoice.invoice.queryAllotDatas.biz.ext",
				type : "post",
				contentType : 'text/json',
				data : {
					"invoiceId" : invoiceId
				},
				success : function(result) {
					if (result.data.length > 0 && allotFlag === '1') {
						$('#allotFieldset').removeClass('hidden');
						nui.parse();
						allotDataGrid.setData(result.data);
					}
				}
			})
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
					nui.get("historyId").setValue(data.id);
					nui.get("historyCreateUsername").setValue(data.createUsername);
					nui.get("historyImplementOrg").setValue(data.implementOrgname);
					nui.get("historyCreateTime").setValue(data.createTime);
					nui.get("historyContractNo").setText(data.contractNo);
					nui.get("historyContractName").setValue(data.contractName);
					nui.get("historyMajor").setValue(data.major);
					nui.get("historyBidService").setValue(data.bidService);
					nui.get("historyProjectType").setValue(data.projectType);
					nui.get("historyHeadquarterGroup").setValue(data.headquarterGroup);
					nui.get("historyInvoiceNameType").setValue(data.invoiceNameType);
					nui.get("historyInvoiceType").setValue(data.invoiceType);
					nui.get("historyInvoiceRate").setValue(data.invoiceRate);
					nui.get("historyInvoiceUsed").setValue(data.invoiceUsed);
					nui.get("historyPayType").setValue(data.payType);
					nui.get("historyInvoiceSumCapital").setValue(data.invoiceSumCapital);
					nui.get("historyActualInvoiceSum").setValue(data.actualInvoiceSum);
					nui.get("historyAllotFlag").setValue(data.allotFlag);					
					nui.get("historyInvoiceSum").setValue(data.invoiceSum);
					nui.get("historyBookIncome").setValue(data.bookIncome);
					nui.get("historyInvoiceTax").setValue(data.invoiceTax);
					nui.get("historyPayerName").setValue(data.payerName);
					nui.get("historyTaxpayerNumber").setValue(data.taxpayerNumber);
					nui.get("historyInvoiceRemark").setValue(data.invoiceRemark);
					nui.get("historyRemark").setValue(data.remark);
					nui.get("historyInvoiceUserMail").setValue(data.invoiceUserMail);
					nui.get("historyInvoiceSumChinese").setValue(functiondigitUppercase(nui.get("historyActualInvoiceSum").getValue()));
					
					queryHistoryAllotDatas(data.id);

					var grid_0 = nui.get("grid_0");
					grid_0.load({
						"groupid" : "INVOICE",
						"relationid" : data.id
					});
					grid_0.sortBy("fileTime", "desc");
				}
			})
		}
		
		function queryHistoryAllotDatas(invoiceId) {
			nui.ajax({
				url : "com.zhonghe.ame.invoice.invoice.queryAllotDatas.biz.ext",
				type : "post",
				contentType : 'text/json',
				data : {
					"invoiceId" : invoiceId
				},
				success : function(result) {
					var allotFlag = nui.get("historyAllotFlag").getValue();
					if (result.data.length > 0 && allotFlag === '1') {
						$('#historyAllotFieldset').removeClass('hidden');
						nui.parse();
						historyAllotDataGrid.setData(result.data);
					}
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
		
		function downloadZipFile() {
			if (!confirm("是否确认打包下载？")) {
				return;
			}
			var relationId = nui.get('historyId').getValue();
			var fileCatalog = 'invoiceinfo';
			var json = nui.encode({
				'relationId' : relationId,
				'fileCatalog' : fileCatalog
			});
			nui.ajax({
				url : "com.primeton.eos.ame_common.file_zip.fileZip.biz.ext",
				type : "post",
				data : json,
				cache : false,
				contentType : 'text/json',
				success : function(o) {
					var filePath = o.downloadFile;
					if (filePath != null && filePath != "") {
						var fileName = "开票管理_" + nui.get('contractName').getValue() + "_(原)附件.zip";
						var frm = document.getElementById("exprotZipFileFlow");
						frm.elements["downloadFile"].value = filePath;
						frm.elements["fileName"].value = fileName;
						frm.submit();
					}
				}
			})
		}
		
		function downloadZipFileExpand() {
			if (!confirm("是否确认打包下载？")) {
				return;
			}
			var relationId = id;
			var fileCatalog = 'invoiceinfo';
			var json = nui.encode({
				'relationId' : relationId,
				'fileCatalog' : fileCatalog
			});
			nui.ajax({
				url : "com.primeton.eos.ame_common.file_zip.fileZip.biz.ext",
				type : "post",
				data : json,
				cache : false,
				contentType : 'text/json',
				success : function(o) {
					var filePath = o.downloadFile;
					if (filePath != null && filePath != "") {
						var fileName = "开票管理_" + nui.get('contractName').getValue() + "_(红冲_作废)附件.zip";
						var frm = document.getElementById("exprotZipFileFlow");
						frm.elements["downloadFile"].value = filePath;
						frm.elements["fileName"].value = fileName;
						frm.submit();
					}
				}
			})
		}								
		
	</script>

</body>
</html>