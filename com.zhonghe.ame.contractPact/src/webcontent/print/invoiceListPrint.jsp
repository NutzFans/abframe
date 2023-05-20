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

	<div title="开票信息打印" style="height: auto">
		<div id="pipi" class="nui-panel" style="font-size: 13px; width: 840px; height: 30px; margin: 0 auto; text-align: center;" align="left"></div>
		<div class="" style="width: 798px; margin: 0 auto; font-size: 14px; border: 1px solid #999999;">
			<div class="base_div">开票基本信息</div>
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
								<input id="createUsername" name="createUsername" class="nui-textbox" enabled="false" style="width: 300px" />
							</td>
							<td align="right" style="width: 160px">合同实施部门：</td>
							<td>
								<input name="implementOrg" id="implementOrg" shownullItem=ture class="nui-treeselect" textField="orgname" valueField="orgid" parentField="omOrganization.orgid" dataField="orgs"
									showTreeIcon="true" valueFromSelect="true" style="width: 100%;" url="com.zhonghe.ame.imptask.keytask.getAllRunOrgsforzdrw.biz.ext" allowInput="true" required="true" multiSelect="false"
									checkRecursive="false" expandOnLoad="0" enabled="false" showFolderCheckBox="true" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 160px">申请日期：</td>
							<td>
								<input id="createTime" name="createTime" enabled="false" class="nui-datepicker" style="width: 300px" required="true" />
							</td>
							<td align="right" style="width: 160px">合同编号：</td>
							<td>
								<input id="contractNo" name="contractNo" onbuttonclick="onButtonEdit" class="nui-buttonedit" style="width: 300px" required="true" enabled="true" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 100px">专业类别：</td>
							<td>
								<input id="major" name="major" class="nui-dictcombobox" dictTypeId="ZH_MAJOR_TYPE" style="width: 300px" required="true" enabled="false" />
							</td>
							<td align="right" style="width: 160px">工程类别：</td>
							<td>
								<input id="projectType" name="projectType" class="nui-dictcombobox" dictTypeId="ZH_PROJECT_TYPE" style="width: 300px" required="true" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 160px">集团内外：</td>
							<td>
								<input id="headquarterGroup" name="headquarterGroup" class="nui-dictcombobox" dictTypeId="ZH_GROUP" style="width: 300px" required="true" enabled="false" />
							</td>
							<td align="right" style="width: 160px">发票抬头类别：</td>
							<td>
								<input name="invoiceNameType" id="invoiceNameType" class="nui-dictcombobox" dictTypeId="ZH_INVOICE_NAME_TYPE" style="width: 300px" required="true" enabled="true" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 160px">发票类型：</td>
							<td>
								<input name="invoiceType" id="invoiceType" class="nui-dictcombobox" dictTypeId="MIS_MA_INVOICETYPE" style="width: 300px" required="true" onvaluechanged="invoiceType" />
							</td>
							<td align="right" style="width: 160px">税率（%）：</td>
							<td>
								<input name="invoiceRate" id="invoiceRate" class="nui-textbox" style="width: 300px" required="true" onvaluechanged="editContractSum" value="6" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 160px">用途：</td>
							<td>
								<input name="invoiceUsed" id="invoiceUsed" class="nui-dictcombobox" dictTypeId="INVOICE_USED" style="width: 100%" required="true" />
							</td>
							<td align="right" style="width: 180px">合同金额（元）：</td>
							<td>
								<input id="invoiceSumCapital" name="invoiceSumCapital" class="nui-textbox" vtype="float" style="width: 300px" required="true" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 160px">开票金额（元）：</td>
							<td>
								<input id="invoiceSum" name="invoiceSum" id="invoiceSum" class="nui-textbox" vtype="float" style="width: 300px" required="true" onvaluechanged="editContractSum" />
							</td>
							<td align="right" style="width: 160px">账面收入（元）：</td>
							<td>
								<input id="bookIncome" name="bookIncome" class="nui-textbox" style="width: 300px" required="true" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 160px">税额：</td>
							<td>
								<input name="invoiceTax" id="invoiceTax" class="nui-textbox" style="width: 300px" required="true" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 160px">开票金额大写：</td>
							<td colspan="8">
								<input id="invoiceSumChinese" class="nui-textbox" style="width: 100%" required="true" enabled="false" />
							</td>							
						</tr>
						<tr>
							<td align="right" style="width: 160px">名称：</td>
							<td colspan="8">
								<input name="payerName" id="payerName" class="nui-textbox" style="width: 100%" required="true" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 160px">纳税人识别号：</td>
							<td colspan="8">
								<input name="taxpayerNumber" id="taxpayerNumber" class="nui-textbox" style="width: 100%" required="true" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 160px">地址、电话：</td>
							<td colspan="8">
								<input name="unitAddress" id="unitAddress" class="nui-textbox" style="width: 100%" required="true" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 160px">开户行及账号：</td>
							<td colspan="8">
								<input name="account" id="account" class="nui-textbox" style="width: 100%" required="true" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 160px">发票备注：</td>
							<td colspan="8">
								<input name="invoiceRemark" id="invoiceRemark" class="nui-textbox" style="width: 100%" required="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 160px">开票是否邮寄：</td>
							<td>
								<input id="postFlag" name="postFlag" class="nui-dictcombobox" onvaluechanged="setAttribute" dictTypeId="ZH_POST" style="width: 300px" required="true" />
							</td>
							<td align="right" style="width: 160px">发票领取人：</td>
							<td colspan="6">
								<input name="invoiceUser" id="invoiceUser" class="nui-textbox" style="width: 100%" required="true" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 160px">邮寄姓名：</td>
							<td>
								<input name="mailName" id="mailName" class="nui-textbox" style="width: 300px" required="true" />
							</td>
							<td align="right" style="width: 160px">邮寄电话：</td>
							<td>
								<input name="mailPhone" id="mailPhone" class="nui-textbox" style="width: 300px" required="true" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 160px">邮寄地址：</td>
							<td colspan="8">
								<input name="mailAddress" id="mailAddress" class="nui-textbox" style="width: 100%" required="true" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 160px">回款金额（元）：</td>
							<td>
								<input id="receivableSum" name="receivableSum" class="nui-textbox" vtype="float" style="width: 300px" required="true" onvaluechanged="receivableSum" />
							</td>
							<td align="right" style="width: 160px">余额（元）：</td>
							<td>
								<input id="balanceSum" name="balanceSum" class="nui-textbox" style="width: 300px" required="true" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 160px">回款时间：</td>
							<td>
								<input id="receivableData" name="receivableData" enabled="true" class="nui-datepicker" style="width: 300px" required="true" />
							</td>
							<td align="right" style="width: 160px">核查（元）：</td>
							<td>
								<input id="verification" name="verification" class="nui-textbox" style="width: 300px" required="true" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 160px">备注：</td>
							<td colspan="8">
								<input name="remark" class="nui-textarea" style="width: 100%; height: 235px" required="false" />
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
			var id = <%= request.getParameter("id") %>;
			var json = nui.encode({"id": id});
			nui.ajax({
				url : "com.zhonghe.ame.purchase.purchaseProApp.queryProAppByInvoice.biz.ext",
				type : 'POST',
				data : json,
				contentType : 'text/json',
				success : function(o) {
					var data = o.proApp[0];
					form.setData(data);
					nui.get("contractNo").setText(data.contractNo);
					nui.get("invoiceSumChinese").setValue(functiondigitUppercase(nui.get("invoiceSum").getValue()));
					document.getElementById("pipi").innerHTML = "【" + data.createUsername + "发起的" + data.contractName + "开票申请】";
					form.setEnabled(false);
					var grid_0 = nui.get("grid_0");
					grid_0.load({
						"groupid" : "INVOICE",
						"relationid" : data.id
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
				"groupid" : "INVOICE",
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
		
		// 设置水印用户
		setWatermark('<%=userName %>')
		//打印按钮
		function preview() {
			document.getElementById('checkview').style.display = "none";
			print();
			document.getElementById('checkview').style.display = "";
		};
		
		function functiondigitUppercase(price) {
			var fraction = ["角", "分"];
			var digit = ["零", "壹", "贰", "叁", "肆", "伍", "陆", "柒", "捌", "玖"];
			var unit = [["元", "万", "亿"],["", "拾", "佰", "仟"],];
			var num = Math.abs(price);
			var s = "";
			for(var i = 0; i < fraction.length; i++){
				s += (digit[Math.floor(num * 10 * Math.pow(10, i)) % 10] + fraction[i]).replace(/零./,"");
			}
			s = s || "整";
			num = Math.floor(num);
			for (var i = 0; i < unit[0].length && num > 0; i += 1) {
				var p = "";
				for (var j = 0; j < unit[1].length && num > 0; j += 1) {
					p = digit[num % 10] + unit[1][j] + p;
					num = Math.floor(num / 10);
				}
				s = p.replace(/(零.)*零$/, "").replace(/^$/, "零") + unit[0][i] + s;
			}
			return s.replace(/(零.)*零元/, "元").replace(/(零.)+/g, "零").replace(/^整$/, "零元整");
		}
	</script>
</body>
</html>