<%@include file="/common/common.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="commonj.sdo.DataObject"%>
<%@page import="java.util.Map"%>
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

div {
	white-space: normal;
	word-break: break-all;
	word-wrap: break-word;
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

	<div title="付费合同打印" style="height: auto;">
		<div id="pipi" class="nui-panel" style="font-size: 13px; width: 840px; height: 30px; margin: 0 auto; text-align: center;" align="left"></div>
		<div class="" style="width: 788px; margin: 0 auto; font-size: 14px; border: 1px solid #999999;">
			<div class="base_div">付费合同基本信息</div>
			<form id="form1" method="post">
				<input name="files" id="fileids" class="nui-hidden" />
				<input class="nui-hidden" name="id" />
				<div style="padding: 5px;">
					<table style="table-layout: fixed;">
						<tr>
							<td align="right" style="width: 160px">合同名称：</td>
							<td colspan="5">
								<input id="contractName" name="contractName" enabled="false" class="nui-textbox" style="width: 100%" />
							</td>
						</tr>
						<tr>
							<td class="form_label" align="right">经办人：</td>
							<td>
								<input id="createUsername" name="createUsername" class="nui-textbox" enabled="false" style="width: 100%" required="true" />
							</td>
							<td align="right" style="width: 160px">合同承办部门：</td>
							<td>
								<input name="implementOrg" id="implementOrg" class="nui-hidden" style="width: 100%" />
								<input id="implementOrgname" name="implementOrgname" class="nui-textbox" enabled="false" style="width: 100%" required="true" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 160px">申请日期：</td>
							<td>
								<input id="createTime" name="createTime" enabled="false" class="nui-textbox" style="width: 100%" />
							</td>
							<td align="right" style="width: 160px">合同类型：</td>
							<td>
								<input id="contractType" name="contractType" enabled="false" class="nui-dictcombobox" dictTypeId="ZH_CONTRACT_TYPE" style="width: 100%" required="true" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 160px">标的规模：</td>
							<td>
								<input id="projectSize" name="projectSize" enabled="false" class="nui-textbox" style="width: 100%" />
							</td>
							<td align="right" style="width: 160px">实施地点：</td>
							<td>
								<input id="projectLocal" name="projectLocal" enabled="false" class="nui-textbox" style="width: 100%" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 160px">合同金额(元)：</td>
							<td>
								<input id="contractSum" name="contractSum" enabled="false" class="nui-textbox" style="width: 100%" required="true" />
							</td>
							<td align="right" style="width: 120px">合同不含税金额(元):</td>
							<td>
								<input name="noTaxSum" id="noTaxSum" class="nui-textbox" vtype="float" style="width: 100%" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 120px">税额(元):</td>
							<td>
								<input name="payTax" id="payTax" class="nui-textbox" vtype="float" style="width: 100%" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 130px">签约方：</td>
							<td colspan="3">
								<span class="mini-buttonedit-border" style="padding-left: 0px; padding-right: 0px">
									<input name="custInfo" id="custInfo" class="nui-textboxlist" style="width: 585px" dataField="purSuppliers" url="com.zhonghe.ame.payContract.payContract.queryPurSuppliersByNameInfo.biz.ext"
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
							<td align="right" style="width: 160px">合同签约主体：</td>
							<td>
								<input id="contractSubject" name="contractSubject" enabled="false" class="nui-dictcombobox" dictTypeId="ZH_INVOICE_NAME_TYPE" style="width: 100%" required="true" />
							</td>
							<td align="right" style="width: 100px">合同文本密级:</td>
							<td>
								<input id="contractSecretLevel" name="contractSecretLevel" class="nui-dictcombobox" dictTypeId="CONTRACT_SECRET_LEVEL" style="width: 100%" required="true" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 100px">项目密级:</td>
							<td>
								<input id="projectSecretLevel" name="projectSecretLevel" class="nui-dictcombobox" dictTypeId="PROJECT_SECRET_LEVEL" style="width: 100%" required="true" />
							</td>
							<td align="right" style="width: 100px">是否为SM协作配套:</td>
							<td>
								<input id="issm" name="issm" class="nui-dictcombobox" dictTypeId="ABF_YESORNO" style="width: 100%" required="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 100px">合同价款形式:</td>
							<td>
								<input id="contractPrice" name="contractPrice" class="nui-dictcombobox" dictTypeId="CONTRACT_PRICE" style="width: 100%" required="true" />
							</td>

							<td align="right" style="width: 100px">是否为采购合同:</td>
							<td>
								<input id="contractNature" name="contractNature" class="nui-dictcombobox" dictTypeId="CONTRACT_NATURE" style="width: 100%" required="true" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 160px" id="purchasePlanLable">采购立项编号：</td>
							<td>
								<input id="purchasePlan" name="purchasePlan" enabled="false" class="nui-textbox" style="width: 100%" required="true" />
							</td>
							<td align="right" style="width: 100px">采购方式:</td>
							<td>
								<input id="procurementType" name="procurementType" class="nui-dictcombobox" dictTypeId="ZH_CGFS" style="width: 100%" required="false" enabled="true" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 120px" id="budgetSumLable">立项金额(元):</td>
							<td>
								<input name="budgetSum" id="budgetSum" class="nui-textbox" vtype="float" style="width: 100%" required="false" enabled="false" />
							</td>
							<td align="right" style="width: 120px">定标金额(元):</td>
							<td>
								<input name="scalingSum" id="scalingSum" class="nui-textbox" vtype="float" style="width: 100%" required="false" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 160px">备注：</td>
							<td id="remark" colspan="5" style="height: 235px; background: #F0F0F0; border: 1px solid #A5ACB5"></td>
						</tr>
						<tr id="purchaseInfo" style="display: none;">
							<td colspan="6" style="padding-left: 168px">
								<a href='javascript:void(0)' onclick='doProAppPrintView();' title='点击查看'>采购立项详情</a>&nbsp;&nbsp;&nbsp;&nbsp;
								<a href='javascript:void(0)' onclick='doPurProgrammeDetailView();' title='点击查看'>采购文件详情</a>&nbsp;&nbsp;&nbsp;&nbsp;
								<a href='javascript:void(0)' onclick='doReviewReportDetailView();' title='点击查看'>评审结果详情</a>
							</td>
						</tr>
					</table>
				</div>
				<div class="link-top"></div>
				<p style="color: red; font-weight: bold;">补充合同信息:</p>
				<div style="padding: 5px;" align="center">
					<table style="table-layout: fixed;">
						<tr>
							<td align="right" style="width: 100px">合同编号：</td>
							<td>
								<input id="contractNo" name="contractNo" class="nui-textbox" style="width: 200px" enabled="false" required="true" />
							</td>
							<td align="right" style="width: 100px">签订日期：</td>
							<td>
								<input id="signingDate" name="signingDate" enabled="false" class="nui-textbox" style="width: 200px" required="true" />
							</td>
						</tr>
					</table>
				</div>
			</form>
			<div title="相关附件">
				<jsp:include page="/ame_common/detailFile.jsp" />
			</div>
			<div class="nui-panel" id="d3" title="审批意见列表" style="width: 100%; height: auto;">
				<div id="datagrid5" class="nui-datagrid" style="width: 780px; height: auto;" dataField="misOpinions" url="com.primeton.eos.ame_pur.purContractProcess.queryAuditOpinions.biz.ext" idField="id"
					allowResize="true" allowAlternating="true" multiSelect="true" showPager="false" allowCellWrap="true">
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
			</div>
		</div>
	</div>

	<script type="text/javascript">
		nui.parse();
		var form = new nui.Form("#form1");
		var grid5 = nui.get("datagrid5");
		$("input[name='custInfo']").parent("td").attr("style", "border: 0px; background: #f0f0f0;")
		setData();
		var id;
		
		function getV(e) {
			var grid = e.sender;
			var record = e.record;
			var uid = record._uid;
			var rowIndex = e.rowIndex;
			var s = "<a>同意</a>";
			return s;
		}
		
		//处理结果业务字典显示
		function onCheckRenderer(e) {
			return nui.getDictText('MIS_AUDITSTATUS', e.value);
		}
		
		function setData() {
			id =<%=request.getParameter("id")%>;
			var json = nui.encode({"id" : id});
			nui.ajax({
				url : "com.zhonghe.ame.payContract.payContract.getPayContractById.biz.ext",
				type : 'POST',
				data : json,
				contentType : 'text/json',
				success : function(o) {
					var data = o.data[0];
					var createUsername;
					if(data.budgetSum==0){
						data.budgetSum = "";
					}
					form.setData(data);
					console.log(data);
					nui.get("custInfo").setValue(data.signatory);
					nui.get("custInfo").setText(data.signatoryname);
					nui.get("contractSum").setValue(data.contractSum);
					$("#remark").html(data.remark);
					nui.get("createUsername").setValue(data.createUsername);
					if (nui.get("contractNature").getValue() == 3) {
						$("#purchasePlanLable").html("零星采购编号:");
						$("#budgetSumLable").html("零采金额(元):");
					}
					if (data.createUsername != null) {
						createUsername = data.createUsername
					} else {
						createUsername = "";
					}
					document.getElementById("pipi").innerHTML = "【" + createUsername + "发起的" + data.contractName + "付费合同】";
					form.setEnabled(false);
					var grid_0 = nui.get("grid_0");
					if (data.issupagreement == "1") {
						grid_0.load({
							"groupid" : "PAY_CONTRACT",
							"relationid" : data.relateCont
						});
					} else {
						grid_0.load({
							"groupid" : "PAY_CONTRACT",
							"relationid" : id
						});
					}
					grid_0.sortBy("fileTime", "desc");
					var processInstID = data.processid;
					grid5.sortBy("time", "desc");
					grid5.load({
						processInstID : processInstID
					});
					if(data.contractNature=='1' || data.contractNature=='4'){
						if(isNotBank(data.purchasePlan)){
							$('#purchaseInfo').toggle();
						}
					}
				}
			});
		}
		
		function setViewData(data) {
			form.setData(data);
			var grid_0 = nui.get("grid_0");
			grid_0.load({
				"groupid" : "PAY_CONTRACT",
				"relationid" : data.id
			});
			grid_0.sortBy("fileTime", "desc");
			var grid5 = nui.get("datagrid5");
			grid5.load({
				processInstID : data.processid
			});
			grid5.sortBy("time", "desc");
		}
		
		function createEwm(url) {
			$('#qrcode').empty();
			var para = url;
			$('#qrcode').qrcode({
				width : 100,
				height : 100,
				text : para
			});
		}
		
		function onCheckRenderer(e) {
			return nui.getDictText('MIS_AUDITSTATUS', e.value);//设置业务字典值
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
		
		//审核结果触发
		function show() {
			var auditopinion = nui.get("auditopinion").getValue().trim();
			var auditstatus = nui.get("auditstatus").getValue();
			if (auditstatus == '0') {
				if (auditopinion == "同意。") {
					nui.get("auditopinion").setValue("");
				}
				chooselink();
			} else if (auditstatus == '1') {
				if (auditopinion == "") {
					nui.get("auditopinion").setValue("同意。");
				}
				showNone();
			} else if (auditstatus == '2') {
				if (auditopinion == "同意。") {
					nui.get("auditopinion").setValue("");
				}
				showNone();
			}
		}
		
		function showNone() {
			nui.get("backTo").setValue("");
			document.getElementById("choosehide").style.display = "none";
		}
		
		function chooselink() {
			document.getElementById("choosehide").style.display = "";
		}
		
		function dicttic(e) {
			return nui.getDictText('AME_TICTYPE', e.value);//设置业务字典值
		}
		
		// 设置水印用户
		// setWatermark('<%=request.getParameter("userName")%>')
		setWatermark('<%=userName%>')
		function printview() {
			document.getElementById('checkview').style.display = "none";
			print();
			document.getElementById('checkview').style.display = "";
		}

		function printBtn() {
			document.getElementById('checkview').style.display = "none";
			print();
			document.getElementById('checkview').style.display = "";
		}
		
		function isNotBank(param){
			if (param != null && param != "" && param != "null" && param != "undefined" && param) {
				return true;
			}else{
				return false;
			}
		}
		
		function doProAppPrintView(){
			var json = nui.encode({"code" : nui.get('purchasePlan').getValue()});
			nui.ajax({
				url : "com.zhonghe.ame.purchase.purchaseProApp.queryProAppByCode.biz.ext",
				type : 'POST',
				data : json,
				contentType : 'text/json',
				success : function(res) {
					var id  = res.data.id;
					if(isNotBank(id)){
						var executeUrl = "<%=request.getContextPath()%>/purchase/print/proAppPrint.jsp?id=" + id;
						window.open(executeUrl);						
					}else{
						showTips("未关联到相关采购立项信息！", "danger");
					}

				}				
			});
		}
		
		function doPurProgrammeDetailView(){
			var json = nui.encode({"appCode" : nui.get('purchasePlan').getValue()});
			nui.ajax({
				url : "com.zhonghe.ame.purchase.purchaseProgramme.queryPurProgrammeAppCode.biz.ext",
				type : 'POST',
				data : json,
				contentType : 'text/json',
				success : function(res) {
					var id  = res.data.id;
					if(isNotBank(id)){
						var executeUrl = "<%=request.getContextPath()%>/purchase/print/purProgramPrint.jsp?id=" + id;
						window.open(executeUrl);						
					}else{
						showTips("未关联到相关采购文件信息！", "danger");
					}
				}				
			});
		}
		
		function doReviewReportDetailView(){
			var json = nui.encode({"appCode" : nui.get('purchasePlan').getValue()});
			nui.ajax({
				url : "com.zhonghe.ame.purchase.purchaseReviewReport.queryReviewReportByAppCode.biz.ext",
				type : 'POST',
				data : json,
				contentType : 'text/json',
				success : function(res) {
					var id  = res.data.id;
					if(isNotBank(id)){
						var executeUrl = "<%=request.getContextPath()%>/purchase/programme/reviewReportDetail.jsp?id=" + id;
						window.open(executeUrl);
					}else{
						showTips("未关联到相关评审结果信息！", "danger");
					}
				}				
			});			
		}
		
		function showTips(content, state) {
			//  state  default|success|info|warning|danger
			if(state) {
				nui.showTips({content: content, state: state, x: "center", y: "center",timeout: 3500.});
			}
			else {
				nui.showTips({content: content, state: "success", x: "center", y: "center",timeout: 3500.});
			}
		}		

	</script>
</body>
</html>