<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="commonj.sdo.DataObject"%>
<%@page import="java.util.Map"%>
<html>
<head>
<title>打印页面</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<script src="<%=request.getContextPath()%>/common/nui/nui.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/ame_common/js/jquery.qrcode.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/ame_common/js/JsBarcode.all.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/ame_common/js/jquery-barcode.js"></script>
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

	<div title="付款列表打印" style="height: auto">
		<div id="pipi" class="nui-panel" style="font-size: 13px; width: 840px; height: 30px; margin: 0 auto; text-align: center;" align="left"></div>
		<div class="" style="width: 798px; margin: 0 auto; font-size: 14px; border: 1px solid #999999;">
			<div class="base_div">付款基本信息</div>
			<form id="form1" method="post">
				<input name="files" id="fileids" class="nui-hidden" />
				<input class="nui-hidden" name="id" />
				<div style="padding: 5px;">
					<table style="table-layout: fixed;">
						<tr>
							<td align="right" style="width: 140px">合同名称：</td>
							<td colspan="7">
								<input id="contractName" name="contractName" enabled="false" class="nui-textbox" style="width: 100%" />
							</td>
						</tr>
						<tr>
							<td class="form_label" align="right">申请人：</td>
							<td>
								<input name="createUserid" id="createUserid" class="nui-hidden" style="width: 230px" />
								<input id="createUsername" class="nui-textbox" enabled="false" style="width: 230px" />
							</td>
							<td align="right" style="width: 140px">申请部门：</td>
							<td>
								<input id="orgname" name="orgname" enabled="false" class="nui-textbox" style="width: 230px" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 130px">申请日期：</td>
							<td>
								<input id="createTime" name="createTime" enabled="false" class="nui-textbox" style="width: 230px" />
							</td>
							<td align="right" style="width: 140px">合同编号：</td>
							<td>
								<input id="contractId" name="contractId" enabled="false" class="nui-textbox" style="width: 230px" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 140px">合同性质：</td>
							<td>
								<input name="contractNature" class="nui-dictcombobox" enabled="false" dictTypeId="CONTRACT_NATURE" style="width: 230px" />
							</td>
							<td align="right" style="width: 140px">合同类型：</td>
							<td>
								<input name="contractType" class="nui-dictcombobox" enabled="false" dictTypeId="ZH_CONTRACT_TYPE" style="width: 230px" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 140px">付款方：</td>
							<td>
								<input id="payer" name="payer" class="nui-dictcombobox" dictTypeId="ZH_INVOICE_NAME_TYPE" style="width: 230px" enabled="false" />
							</td>
							<td align="right" style="width: 160px">合同金额(元)：</td>
							<td>
								<input id="contractSum" name="contractSum" class="nui-textbox" style="width: 230px" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 140px">累计已付金额(元)：</td>
							<td>
								<input id="paidContractSum" name="paidContractSum" class="nui-textbox" style="width: 230px" required="false" enabled="false" />
							</td>
							<td align="right" style="width: 140px">本次支付金额(元)：</td>
							<td>
								<input id="applyPayContractSum" name="applyPayContractSum" class="nui-textbox" style="width: 230px" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 140px">发票类型：</td>
							<td>
								<input id="invoiceType" name="invoiceType" class="nui-dictcombobox" dictTypeId="MIS_MA_INVOICETYPE" style="width: 230px" enabled="false" />
							</td>
							<td align="right" style="width: 140px">本次付款进度：</td>
							<td>
								<input id="payType" name="payType" class="nui-dictcombobox" dictTypeId="payType" style="width: 230px" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 140px">最晚付款日期：</td>
							<td>
								<input id="endTime" name="endTime" class="nui-datepicker" style="width: 230px" enabled="false" />
							</td>
							<td align="right" style="width: 140px">收款单位：</td>
							<td>
								<input id="signatoryname" name="signatoryname" enabled="false" class="nui-textbox" style="width: 230px" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 140px">收款单位开户行名称：</td>
							<td>
								<input id="accountName" name="accountName" enabled="false" class="nui-textbox" style="width: 230px" />
							</td>
							<td align="right" style="width: 140px">收款单位开户行账号：</td>
							<td>
								<input id="account" name="account" enabled="false" class="nui-textbox" style="width: 230px" />
							</td>
						</tr>
						<tr>
							<td align="right">支付依据及情况说明：</td>
							<td colspan="8">
								<input id="remark" name="remark" class="nui-textarea" style="width: 100%; height: 150px" enabled="false" />
							</td>
						</tr>
					</table>
				</div>
			</form>
			<div title="相关附件">
				<jsp:include page="/ame_common/detailFile.jsp" />
			</div>
			<div class="nui-panel" id="d3" title="审批意见列表" style="width: 100%; height: auto;">
				<div id="datagrid4" class="nui-datagrid" style="width: 100%; height: auto;" dataField="misOpinions" url="com.zhonghe.ame.purchase.common.queryPlanApproval.biz.ext" idField="id" allowResize="true"
					allowAlternating="true" multiSelect="true" showPager="false" allowCellWrap="true">
					<div property="columns">
						<div type="indexcolumn" align="center" headerAlign="center">序号</div>
						<div field="operatorname" width="50" headerAlign="center" align="center">处理人</div>
						<div field="workitemname" width="120" align="center" headerAlign="center">处理环节</div>
						<div field="orgname" width="100" align="center" headerAlign="center">处理人所在机构</div>
						<div field="auditstatus" renderer="onCheckRenderer" width="60" align="center" headerAlign="center">处理结果</div>
						<div field="auditopinion" width="20%" headerAlign="center" align="left">审批意见</div>
						<div field="time" width="110" headerAlign="center" align="center" dateFormat="yyyy-MM-dd HH:mm:ss">处理时间</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
		nui.parse();
		var form = new nui.Form("#form1");
		var grid4 = nui.get("datagrid4");
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
				url : "com.zhonghe.ame.payment.payMent.getPayMentById.biz.ext",
				type : 'POST',
				data : json,
				contentType : 'text/json',
				success : function(o) {
					var data = o.data[0];
					var createUsername;
					form.setData(data)
					nui.get("contractSum").setValue(data.contractSum);
					nui.get("createUsername").setValue(data.empname);
					if (data.empname != null) {
						createUsername = data.empname
					} else {
						createUsername = "";
					}
					document.getElementById("pipi").innerHTML = "【" + createUsername + "发起的" + data.contractName + "付款申请】";
					form.setEnabled(false);
					var grid_0 = nui.get("grid_0");
					grid_0.load({
						"groupid" : "PAY_MENT",
						"relationid" : id
					});
					grid_0.sortBy("fileTime", "desc");
					var processInstID = data.processid;
					grid4.sortBy("time", "desc");
					grid4.load({
						processInstID : processInstID
					});
				}
			});
		}
		
		function setViewData(data) {
			return;
			if (null != data.createUserid) {
				nui.get("createUserid").setValue(data.createUserid);
			}
			if (null != data.empname) {
				nui.get("createUsername").setValue(data.empname);
			}
			var form = new nui.Form("#form1");
			form.setData(data);
			var grid_0 = nui.get("grid_0");
			grid_0.load({
				"groupid" : "PAY_MENT",
				"relationid" : data.id
			});
			grid_0.sortBy("fileTime", "desc");
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
		
		//打印按钮
		function preview() {
			document.getElementById('checkview').style.display = "none";
			print();
			document.getElementById('checkview').style.display = "";
		};
	</script>
</body>
</html>