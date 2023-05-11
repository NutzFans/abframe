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
<script src="<%= request.getContextPath() %>/common/nui/warterMark.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/common/nui/nui.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/ame_common/js/jquery.qrcode.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/ame_common/js/JsBarcode.all.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/ame_common/js/jquery-barcode.js"></script>
<% 
	UserObject user = (UserObject)session.getAttribute("userObject");
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
	
	<div title="收费合同打印" style="height: auto">
		<div id="pipi" class="nui-panel" style="font-size: 13px; width: 840px; height: 30px; margin: 0 auto; text-align: center;" align="left"></div>
		<div class="" style="width: 788px;margin: 0 auto;font-size: 14px;border:1px solid #999999;">
			<div class="base_div">收费合同签订申请信息</div>
			<form id="form1" method="post">
				<input name="files" id="fileids" class="nui-hidden" />
				<input class="nui-hidden" name="id" />
				<div style="padding: 5px;">
					<table style="table-layout: fixed;">
						<tr>
							<td align="right" style="width: 130px">合同名称：</td>
							<td colspan="3">
								<input id="contractName" name="contractName" enabled="false" class="nui-textbox" style="width: 100%" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 130px">申请人：</td>
							<td>
								<input name="createUserid" id="createUserid" class="nui-hidden" />
								<input id="createUsername" name="createUsername" class="nui-textbox" enabled="false" required="true" style="width: 200px" />
							</td>
							<td align="right" style="width: 130px">合同实施部门：</td>
							<td>
								<input name="implementOrg" id="implementOrg" shownullItem=ture class="nui-treeselect" textField="orgname" valueField="orgid" parentField="omOrganization.orgid" dataField="orgs"
									showTreeIcon="true" valueFromSelect="true" style="width: 200px" url="com.zhonghe.ame.imptask.keytask.getAllRunOrgsforzdrw.biz.ext" allowInput="true" required="true" multiSelect="false"
									checkRecursive="false" expandOnLoad="0" showFolderCheckBox="true" enabled="false" />
								<input name="implementOrgname" id="implementOrgname" class="nui-hidden" readonly="readonly" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 130px">申请日期：</td>
							<td>
								<input id="createTime" name="createTime" class="nui-datepicker" style="width: 200px" required="true" enabled="false" />
							</td>
							<td align="right" style="width: 130px">是否委托函：</td>
							<td>
								<input id="cachet" name="cachet" class="nui-dictcombobox" dictTypeId="ABF_YESORNO" style="width: 200px" enabled="false" required="false" />
							</td>							
						</tr>
						<tr>
							<td align="right" style="width: 130px">投标记录：</td>
							<td colspan="3">
								<input id="tenderId" name="tenderId" class="nui-buttonedit" style="width: 100%" required="false" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 130px">专业类别：</td>
							<td>
								<input id="major" name="major" class="nui-dictcombobox" dictTypeId="ZH_MAJOR_TYPE" style="width: 200px" required="true" enabled="false" />
							</td>
							<td align="right" style="width: 130px">工程类别：</td>
							<td>
								<input id="projectType" name="projectType" class="nui-dictcombobox" dictTypeId="ZH_PROJECT_TYPE" style="width: 200px" enabled="false" required="true" />
							</td>							
						</tr>
						<tr>
							<td align="right" style="width: 130px">合同价格模式：</td>
							<td>
								<input id="contractModel" name="contractModel" class="nui-dictcombobox" dictTypeId="CONTRACT_MODEL" style="width: 200px" required="true" enabled="false" />
							</td>
							<td align="right" style="width: 130px">招标人采购方式:</td>
							<td>
								<input id="procurementType" name="procurementType" class="nui-dictcombobox" dictTypeId="ZH_PROCUREMENT_TYPE" style="width: 200px" required="true" enabled="false" />
							</td>						
						</tr>
						<tr>
							<td align="right" style="width: 130px">集团内外：</td>
							<td>
								<input id="headquarterGroup" name="headquarterGroup" class="nui-dictcombobox" dictTypeId="ZH_GROUP" style="width: 200px" required="true" enabled="false" />
							</td>
							<td align="right" style="width: 130px">合同文本密级:</td>
							<td>
								<input id="contractSecretLevel" name="contractSecretLevel" class="nui-dictcombobox" dictTypeId="CONTRACT_SECRET_LEVEL" style="width: 200px" required="true" enabled="false" />
							</td>							
						</tr>
						<tr>
							<td align="right" style="width: 130px">项目密级:</td>
							<td>
								<input id="projectSecretLevel" name="projectSecretLevel" class="nui-dictcombobox" dictTypeId="PROJECT_SECRET_LEVEL" style="width: 200px" required="true" enabled="false" />
							</td>
							<td align="right" style="width: 130px">是否计划对外分包:</td>
							<td>
								<input id="isfb" name="isfb" class="nui-dictcombobox" dictTypeId="ABF_YESORNO" style="width: 200px" required="true" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 130px">合同签约主体：</td>
							<td>
								<input id="contractSubject" name="contractSubject" class="nui-dictcombobox" dictTypeId="ZH_INVOICE_NAME_TYPE" style="width: 200px" required="true" enabled="false" />
							</td>
							<td align="right" style="width: 130px">收款方：</td>
							<td>
								<input id="payee" name="payee" class="nui-dictcombobox" dictTypeId="PAYER" style="width: 200px" required="true" enabled="false" />
							</td>						
						</tr>
						<tr>
							<td align="right" style="width: 130px">签约方：</td>
							<td colspan="3">
								<span class="mini-buttonedit-border" style="padding-left: 0px; padding-right: 0px">
									<input name="custInfo" id="custInfo" class="nui-textboxlist" style="width: 520px" dataField="custinfos" url="com.zhonghe.ame.marketInfo.marketinfo.khxx.bid.queryCustByNameInfo.biz.ext"
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
							<td align="right" style="width: 130px">合同金额(元)：</td>
							<td>
								<input name="contractSum" id="contractSum" class="nui-textbox" vtype="float" style="width: 200px" required="true" enabled="false" />
							</td>
							<td align="right" style="width: 130px">合同不含税金额(元)：</td>
							<td>
								<input name="noTaxSum" id="noTaxSum" class="nui-textbox" vtype="float" style="width: 200px" required="true" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 130px">税额(元)：</td>
							<td>
								<input name="payTax" id="payTax" class="nui-textbox" vtype="float" style="width: 200px" required="true" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 130px">备注：</td>
							<td colspan="3">
								<input name="remark" class="nui-textarea" style="width: 100%; height: 235px" required="false" enabled="false" />
							</td>
						</tr>
					</table>
				</div>
				<div class="link-top"></div>
				<p style="color: red; font-weight: bold;">补充合同信息:</p>
				<div style="padding: 5px;">
					<table style="table-layout: fixed;">
						<tr>
							<td align="right" style="width: 130px">合同编号：</td>
							<td>
								<input id="contractNo" name="contractNo" class="nui-textbox" style="width: 200px" enabled="false" required="true" />
							</td>
							<td align="right" style="width: 130px">签订日期：</td>
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
				<div id="datagrid5" class="nui-datagrid" style="width: 100%; height: auto;" dataField="misOpinions" url="com.primeton.eos.ame_pur.purContractProcess.queryAuditOpinions.biz.ext" idField="id"
					allowResize="true" allowAlternating="true" multiSelect="true" showPager="false" allowCellWrap="true">
					<div property="columns">
						<div type="indexcolumn" headerAlign="center" width="30">编号</div>
						<div field="operatorname" width="50" headerAlign="center" align="center">处理人</div>
						<div field="workitemname" width="80" align="center" headerAlign="center">处理环节</div>
						<div field="auditstatus" renderer="onCheckRenderer" width="60" align="center" headerAlign="center">处理结果</div>
						<div field="auditopinion" width="150" headerAlign="center">处理意见</div>
						<div field="time" width="100" headerAlign="center" align="center" dateFormat="yyyy-MM-dd HH:mm:ss">处理时间</div>
						<div field="orgname" width="110" align="center" headerAlign="center">处理人所在机构</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
		nui.parse();
		var form = new nui.Form("#form1");
		var grid5 = nui.get("datagrid5");
		var id;
		
		$("input[name='custInfo']").parent("td").attr("style", "border: 0px; background: #f0f0f0;")
		
		setData();
		
		function setData() {
			id = <%= request.getParameter("id") %> ;
			var json = nui.encode({"id": id});
			nui.ajax({
				url : "com.zhonghe.ame.chargeContract.chargeContract.getChargeContractById.biz.ext",
				type : 'POST',
				data : json,
				contentType : 'text/json',
				success : function(result) {
					var data = result.data;
					form.setData(data);
					nui.get("tenderId").setValue(data.tenderId);
					nui.get("tenderId").setText(data.tenderName);
					nui.get("custInfo").setValue(data.signatory);
					nui.get("custInfo").setText(data.signatoryName);
					document.getElementById("pipi").innerHTML = "【" + data.createUsername + "发起的" + data.contractName + "收费合同】";
					var grid_0 = nui.get("grid_0");
					grid_0.load({
						"groupid" : "CHARGE_CONTRACT",
						"relationid" : id
					});
					grid_0.sortBy("fileTime", "desc");
					var processInstID = data.processid;
					grid5.sortBy("time", "desc");
					grid5.load({
						processInstID : processInstID
					});
				}
			});
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
		
		// 设置水印用户
		setWatermark('<%=userName %>')
		function printBtn() {
			document.getElementById('checkview').style.display = "none";
			print();
			document.getElementById('checkview').style.display = "";
		}		
				
	</script>
	
</body>
</html>