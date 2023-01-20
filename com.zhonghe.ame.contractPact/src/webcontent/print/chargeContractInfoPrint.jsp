<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="commonj.sdo.DataObject"%>
<%@page import="java.util.Map"%>
<html>
<head>
<title>打印页面</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/ame_common/js/jquery.qrcode.min.js"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/ame_common/js/JsBarcode.all.js"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/ame_common/js/jquery-barcode.js"></script>
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
<body style="overflow-y:scroll;">
	<div align="right" style="width: 400px;">
		<div align="right">
			<a class="nui-button" id="checkview" iconCls="icon-print" onclick="printBtn()">打印</a>
		</div>
	</div>

	<div title="收费合同打印" style="height: auto">
		<div id="pipi" class="nui-panel" style="font-size: 13px; width: 840px; height: 30px; margin: 0 auto; text-align: center;" align="left"></div>
		<div class="" style="width: 788px;margin: 0 auto;font-size: 14px;border:1px solid #999999;<!--height: 700px-->">
			<div class="base_div">收费合同签订申请信息</div>
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
							<td class="form_label" align="right">申请人：</td>
							<td>
								<input name="createUserid" id="createUserid" class="nui-hidden" style="width: 200px" />
								<input id="createUsername" name="createUsername" class="nui-textbox" enabled="false" style="width: 200px" required="true" />
							</td>
							<td align="right" style="width: 160px">合同实施部门：</td>
							<td>
								<input name="implementOrg" id="implementOrg" class="nui-hidden" style="width: 200px;" />
								<input id="implementOrgname" name="implementOrgname" class="nui-textbox" style="width: 200px" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 160px">申请日期：</td>
							<td>
								<input id="createTime" name="createTime" enabled="false" class="nui-textbox" style="width: 200px" />
							</td>
							<td align="right" style="width: 160px">投标记录：</td>
							<td>
								<input id="tenderId" name="tenderId" enabled="false" class="nui-textbox" style="width: 200px" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 160px">专业类别：</td>
							<td>
								<input id="major" name="major" class="nui-dictcombobox" dictTypeId="ZH_MAJOR_TYPE" style="width: 200px" enabled="false" />
							</td>
							<td align="right" style="width: 100px">工程类别：</td>
							<td>
								<input id="projectType" name="projectType" enabled="false" class="nui-dictcombobox" dictTypeId="ZH_PROJECT_TYPE" style="width: 200px" required="true" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 160px">合同价格模式：</td>
							<td>
								<input id="contractModel" name="contractModel" class="nui-dictcombobox" dictTypeId="CONTRACT_MODEL" style="width: 200px" enabled="false" />
							</td>
							<td align="right" style="width: 160px">招标人采购方式:</td>
							<td>
								<input id="procurementType" name="procurementType" class="nui-dictcombobox" dictTypeId="ZH_PROCUREMENT_TYPE" style="width: 200px" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 160px">集团内外：</td>
							<td>
								<input id="headquarterGroup" name="headquarterGroup" class="nui-dictcombobox" dictTypeId="ZH_GROUP" style="width: 200px" enabled="false" />
							</td>
							<td align="right" style="width: 160px">合同金额（元）：</td>
							<td>
								<input id="contractSum" name="contractSum" enabled="false" class="nui-textbox" style="width: 200px" required="true" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 160px">合同不含税金额(元)：</td>
							<td>
								<input id="noTaxSum" name="noTaxSum" enabled="false" class="nui-textbox" style="width: 200px" required="true" />
							</td>
							<td align="right" style="width: 160px">税额(元)：</td>
							<td>
								<input id="payTax" name="payTax" enabled="false" class="nui-textbox" style="width: 200px" required="true" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 160px">签约方：</td>
							<td>
								<input id="signatoryname" name="signatoryname" enabled="false" class="nui-textbox" style="width: 200px" />
							</td>
							<td align="right" style="width: 100px">合同签约主体：</td>
							<td>
								<input id="contractSubject" name="contractSubject" class="nui-dictcombobox" dictTypeId="ZH_INVOICE_NAME_TYPE" enabled="false" style="width: 200px" required="true" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 100px">收款方：</td>
							<td>
								<input id="payee" name="payee" class="nui-dictcombobox" dictTypeId="PAYER" enabled="false" style="width: 200px" />
							</td>
							<td align="right" style="width: 160px">合同文本密级:</td>
							<td>
								<input id="contractSecretLevel" name="contractSecretLevel" class="nui-dictcombobox" dictTypeId="CONTRACT_SECRET_LEVEL" style="width: 200px" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 160px">项目密级：</td>
							<td>
								<input id="projectSecretLevel" name="projectSecretLevel" class="nui-dictcombobox" dictTypeId="PROJECT_SECRET_LEVEL" style="width: 200px" enabled="false" />
							</td>
							<td align="right" style="width: 160px">是否计划对外分包：</td>
							<td>
								<input id="isfb" name="isfb" class="nui-dictcombobox" dictTypeId="ABF_YESORNO" style="width: 200px" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 160px">备注：</td>
							<td colspan="5">
								<input name="remark" class="nui-textarea" style="width: 100%" required="false" />
							</td>
						</tr>
					</table>
				</div>
				<div class="link-top"></div>
				<p style="color: red; font-weight: bold;">补充合同信息:</p>
				<div style="padding: 5px;">
					<table style="table-layout: fixed;">
						<tr>
							<td align="right" style="width: 160px">合同编号：</td>
							<td>
								<input id="contractNo" name="contractNo" class="nui-textbox" style="width: 200px" required="true" />
							</td>
							<td align="right" style="width: 100px">签订日期：</td>
							<td>
								<input id="signingDate" name="signingDate" class="nui-textbox" style="width: 200px" required="true" />
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
						<div field="auditstatus" renderer="onCheckRenderer" width="80" align="center" headerAlign="center">处理结果</div>
						<div field="auditopinion" width="150" headerAlign="center">处理意见</div>
						<div field="time" width="100" headerAlign="center" align="center" dateFormat="yyyy-MM-dd HH:mm:ss">处理时间</div>
						<div field="orgname" width="100" align="center" headerAlign="center">处理人所在机构</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
		nui.parse();
		var form = new nui.Form("#form1");
		var grid5 = nui.get("datagrid5");
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
		
		function onCheckRenderer(e) {
			return nui.getDictText('MIS_AUDITSTATUS', e.value);
		}
		
		function setData() {
			id = <%= request.getParameter("id") %> ;
			var json = nui.encode({"id": id});
			nui.ajax({
				url : "com.zhonghe.ame.chargeContract.chargeContract.getChargeContractById.biz.ext",
				type : 'POST',
				data : json,
				contentType : 'text/json',
				success : function(o) {
					var data = o.data[0];
					var createUsername;
					form.setData(data)
					nui.get("contractSum").setValue(data.contractSum);
					$("#remark").html(data.remark);
					nui.get("createUsername").setValue(data.createUsername);

					if (data.createUsername != null) {
						createUsername = data.createUsername
					} else {
						createUsername = "";
					}
					document.getElementById("pipi").innerHTML = "【" + createUsername + "发起的" + data.contractName + "收费合同】";
					form.setEnabled(false);

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
		
		function setViewData(data) {
			form.setData(data)
			var grid_0 = nui.get("grid_0");
			grid_0.load({
				"groupid" : "CHARGE_CONTRACT",
				"relationid" : data.id
			});
			grid_0.sortBy("fileTime", "desc");
			var grid5 = nui.get("datagrid5");
			grid5.load({
				processInstID : data.processid
			});
			grid5.sortBy("time", "desc");
			setTimeout(function() {
				//注销掉删除操作
				$(".Delete_Button").hide();
			}, 300);
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
		
		function printBtn() {
			document.getElementById('checkview').style.display = "none";
			print();
			document.getElementById('checkview').style.display = "";
		};
		
		function preview() {
			document.getElementById('checkview').style.display = "none";
			print();
			document.getElementById('checkview').style.display = "";
		};
	</script>
</body>
</html>