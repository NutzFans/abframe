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
	
	<div title="付费合同补充协议打印" style="height: auto;">
		<div id="pipi" class="nui-panel" style="font-size: 13px; width: 840px; height: 30px; margin: 0 auto; text-align: center;" align="left"></div>
		<div class="" style="width: 788px;margin: 0 auto;font-size: 14px;border:1px solid #999999;">
			<div class="base_div">付费合同基本信息 - 补充协议</div>
			<div style="padding: 1px;">
				<fieldset id="field1" style="border: solid 1px #aaa;">
					<legend>原 - 付费合同信息</legend>
					<form>
						<input name="historyId" id="historyId" class="nui-hidden" />
						<input id="historyContractNature" class="nui-hidden"/>
						<input id="historyPurchasePlan" class="nui-hidden"/>
						<div>
							<table style="table-layout: fixed;">
								<tr>
									<td align="right" style="width: 130px">合同名称：</td>
									<td colspan="3">
										<input id="historyContractName" enabled="false" class="nui-textbox" style="width: 100%" />
									</td>
								</tr>
								<tr>
									<td align="right" style="width: 130px">经办人：</td>
									<td>
										<input id="historyCreateUsername" class="nui-textbox" enabled="false" style="width: 100%" />
									</td>
									<td align="right" style="width: 130px">合同承办部门：</td>
									<td>
										<input id="historyImplementOrgname" class="nui-textbox" enabled="false" style="width: 100%" />
									</td>
								</tr>
								<tr>
									<td align="right" style="width: 130px">合同编号：</td>
									<td>
										<input id="historyContractNo" enabled="false" class="nui-textbox" style="width: 100%" />
									</td>
									<td align="right" style="width: 130px">合同金额(元)：</td>
									<td>
										<input id="historyContractSum" class="nui-textbox" style="width: 100%" enabled="false" />
									</td>
								</tr>
								<tr>
									<td align="right" style="width: 130px">申请日期：</td>
									<td>
										<input id="historyCreateTime" enabled="false" class="nui-textbox" style="width: 100%" />
									</td>
									<td align="right" style="width: 130px">签订日期：</td>
									<td>
										<input id="historySigningDate" class="nui-textbox" style="width: 100%" enabled="false" />
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
								</tr>
								<tr>
									<td align="right" style="width: 130px">付款方：</td>
									<td>
										<input id="historyPayer" class="nui-dictcombobox" dictTypeId="ZH_INVOICE_NAME_TYPE" style="width: 100%" enabled="false" />
									</td>								
								</tr>
								<tr>
									<td align="right" style="width: 130px">备注：</td>
									<td colspan="3">
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
						<div style="padding: 5px;">
							<table style="table-layout: fixed;">
								<tr>
									<td align="right" style="width: 130px">补充协议名称：</td>
									<td colspan="3">
										<input id="contractName" name="contractName" class="nui-textbox" style="width: 100%" required="true" enabled="false" />
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
										<input name="implementOrgname" id="implementOrgname" class="nui-textbox" enabled="false" style="width: 200px"/>
									</td>									
								</tr>
								<tr>
									<td align="right" style="width: 130px">申请日期：</td>
									<td>
										<input id="createTime" name="createTime" class="nui-datepicker" style="width: 200px" required="true" enabled="false" />
									</td>								
								</tr>
								<tr>
									<td align="right" style="width: 130px">签约方：</td>
									<td colspan="3">
										<span class="mini-buttonedit-border" style="padding-left: 0px; padding-right: 0px">
											<input name="custInfo" id="custInfo" class="nui-textboxlist" style="width: 515px" dataField="purSuppliers" url="com.zhonghe.ame.payContract.payContract.queryPurSuppliersByNameInfo.biz.ext"
												valueField="custid" textField="custname" allowInput="false" enabled="false"/>
											<span class="mini-buttonedit-buttons">
												<span class="mini-buttonedit-close"></span>
												<span class="mini-buttonedit-button" onmouseover="mini.addClass(this, 'mini-buttonedit-button-hover');"
													onmouseout="mini.removeClass(this, 'mini-buttonedit-button-hover');">
													<span class="mini-buttonedit-icon"></span>
												</span>
											</span>
										</span>
									</td>								
								</tr>
								<tr>
									<td align="right" style="width: 130px">付款方：</td>
									<td>
										<input id="payer" name="payer" class="nui-dictcombobox" dictTypeId="ZH_INVOICE_NAME_TYPE" style="width: 200px" required="true" enabled="false" />
									</td>
									<td align="right" style="width: 130px">变更金额(元)：</td>
									<td>
										<input id="contractSum" name="contractSum" class="nui-textbox" vtype="float" style="width: 200px" required="true" enabled="false" />
									</td>								
								</tr>
								<tr>
									<td align="right" style="width: 130px">不含税金额(元)：</td>
									<td>
										<input name="noTaxSum" id="noTaxSum" class="nui-textbox" vtype="float" style="width: 200px" required="true" enabled="false"/>
									</td>
									<td align="right" style="width: 130px">税额(元):</td>
									<td>
										<input name="payTax" id="payTax" class="nui-textbox" vtype="float" style="width: 200px" required="true" enabled="false" />
									</td>								
								</tr>
								<tr>
									<td align="right" style="width: 130px">补充协议说明：</td>
									<td colspan="3">
										<input id="remark" name="remark" class="nui-textarea" style="width: 100%; height: 235px" required="true" enabled="false" />
									</td>
								</tr>
								<tr id="purchaseInfo" style="display: none;">
									<td colspan="4" style="padding-left: 138px">
										<a href='javascript:void(0)' onclick='doProAppPrintView();' title='点击查看'>采购立项详情</a>&nbsp;&nbsp;&nbsp;&nbsp;
										<a href='javascript:void(0)' onclick='doPurProgrammeDetailView();' title='点击查看'>采购文件详情</a>&nbsp;&nbsp;&nbsp;&nbsp;
										<a href='javascript:void(0)' onclick='doReviewReportDetailView();' title='点击查看'>评审结果详情</a>
									</td>
								</tr>
							</table>
						</div>
					</form>
				</fieldset>				
				
				<fieldset id="field3" style="border: solid 1px #aaa;">
					<legend style="color: red;">补充合同信息（协议）</legend>
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
				
				<fieldset id="field4" style="border: solid 1px #aaa;">
					<legend>原 - 付费合同附件</legend>
					<jsp:include page="/ame_common/detailFile.jsp">
						<jsp:param name="downloadZip" value="true"/>
					</jsp:include>
				</fieldset>
				
				<fieldset id="field5" style="border: solid 1px #aaa;">
					<legend>补充协议 - 相关附件</legend>
					<jsp:include page="/ame_common/detailFileExpand.jsp">
						<jsp:param name="downloadZipExpand" value="true"/>
					</jsp:include>
				</fieldset>

				<fieldset id="field6" style="border: solid 1px #aaa;">
					<legend>审批意见列表</legend>
					<div id="datagrid5" class="nui-datagrid" style="height: auto;" dataField="misOpinions" url="com.primeton.eos.ame_pur.purContractProcess.queryAuditOpinions.biz.ext" idField="id"
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
		var grid5 = nui.get("datagrid5");
		var id =<%=request.getParameter("id")%>;
		
		$("input[name='historyCustInfo']").parent("td").attr("style", "border: 0px; background: #f0f0f0;")
		$("input[name='custInfo']").parent("td").attr("style", "border: 0px; background: #f0f0f0;")
		
		setData();
		
		function setData(){
			var json = nui.encode({"id" : id});
			nui.ajax({
				url : "com.zhonghe.ame.payContract.payContract.getPayContractById.biz.ext",
				type : 'POST',
				data : json,
				contentType : 'text/json',
				success : function(o) {
					var data = o.data[0];
					form.setData(data);
					nui.get("custInfo").setValue(data.signatory);
					nui.get("custInfo").setText(data.signatoryname);
					queryHistory(data.relateCont);
					nui.get("contractNo").setValue(data.contractNo);
					nui.get("signingDate").setValue(data.signingDate);
					document.getElementById("pipi").innerHTML = "【" + data.createUsername + "发起的" + data.contractName + "付费合同】";
					var detailFileExpandGrid = nui.get("detailFileExpandGrid");
					detailFileExpandGrid.load({
						"groupid" : "PAY_CONTRACT",
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
			var json = {"id": str};
			nui.ajax({
				url : "com.zhonghe.ame.payContract.payContract.queryPayContractById.biz.ext",
				type : "post",
				contentType : 'text/json',
				data : json,
				success : function(result) {
					var data = result.data;
					nui.get("historyId").setValue(data.id);
					nui.get("historyContractNature").setValue(data.contractNature);
					nui.get("historyPurchasePlan").setValue(data.purchasePlan);
					nui.get("historyCreateUsername").setValue(data.createUsername);
					nui.get("historyImplementOrgname").setValue(data.implementOrgname);
					nui.get("historyCreateTime").setValue(data.createTime);
					nui.get("historyContractNo").setValue(data.contractNo);
					nui.get("historyContractName").setValue(data.contractName);
					nui.get("historyContractSum").setValue(data.contractSum);
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
					if(data.contractNature=='1' || data.contractNature=='4'){
						if(isNotBank(data.purchasePlan)){
							$('#purchaseInfo').toggle();
						}
					}
				}
			})
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
		
		function isNotBank(param){
			if (param != null && param != "" && param != "null" && param != "undefined" && param) {
				return true;
			}else{
				return false;
			}
		}
		
		function doProAppPrintView(){
			var json = nui.encode({"code" : nui.get('historyPurchasePlan').getValue()});
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
			var json = nui.encode({"appCode" : nui.get('historyPurchasePlan').getValue()});
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
			var json = nui.encode({"appCode" : nui.get('historyPurchasePlan').getValue()});
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
		
		function downloadZipFile() {
			if (!confirm("是否确认打包下载？")) {
				return;
			}
			var relationId = nui.get('historyId').getValue();
			var fileCatalog = 'payContractinfo';
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
						var fileName = "付费合同_" + nui.get('contractName').getValue() + "_(原)附件.zip";
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
			var fileCatalog = 'payContractinfo';
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
						var fileName = "付费合同_" + nui.get('contractName').getValue() + "_(补充协议)附件.zip";
						var frm = document.getElementById("exprotZipFileFlow");
						frm.elements["downloadFile"].value = filePath;
						frm.elements["fileName"].value = fileName;
						frm.submit();
					}
				}
			})
		}
		
		setWatermark('<%=userName%>')								
		
	</script>
	
</body>
</html>