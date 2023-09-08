<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<head>
<title>开具发票信息</title>
<style type="text/css">
	body {
		margin: 0;padding: 0;border: 0;width: 100%;height: 100%;overflow: hidden;
	}
</style>
</head>
<body>
	<div class="nui-fit">
		<fieldset id="field1" style="border: solid 1px #aaa; padding: 1px; width: 97%;">
			<legend>开具发票信息</legend>
			<form id="form1" method="post">
				<input name="files" id="fileids" class="nui-hidden" />
				<input class="nui-hidden" name="id" />
				<div style="padding: 5px;">
					<table style="table-layout: fixed;">
						<tr>
							<td class="form_label" align="right">申请人</td>
							<td>
								<input name="createUserid" id="createUserid" class="nui-hidden" style="width: 300px" />
								<input id="createUsername" name="createUsername" class="nui-textbox" enabled="false" style="width: 300px" required="true" />
							</td>
							<td align="right" style="width: 160px">申请单位：</td>
							<td>
								<input name="createdOrgid" id="createdOrgid" shownullItem=ture class="nui-treeselect" textField="orgname" valueField="orgid" parentField="omOrganization.orgid" dataField="orgs"
									showTreeIcon="true" valueFromSelect="true" style="width: 100%;" url="com.zhonghe.ame.imptask.keytask.getAllRunOrgsforzdrw.biz.ext" allowInput="true" required="true"
									onvaluechanged="changeOrgForm(e)" multiSelect="false" checkRecursive="false" expandOnLoad="0" showFolderCheckBox="true" enabled="false" //>
								<input name="implementOrgname" id="implementOrgname" class="nui-hidden" readonly="readonly" />
							</td>
							<td align="right" style="width: 160px">申请日期：</td>
							<td>
								<input id="createTime" name="createTime" class="nui-datepicker" style="width: 300px" enabled="false" required="true" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 160px">合同编号：</td>
							<td>
								<input id="contractNo" name="contractNo" class="nui-buttonedit" onbuttonclick="onButtonEdit" style="width: 300px" required="true" allowInput="false" emptyText="必填项，数据来源于收费合同"/>
							</td>
							<td align="right" style="width: 160px">合同名称：</td>
							<td colspan="6">
								<input id="contractName" name="contractName" class="nui-textbox" style="width: 100%" required="true"/>
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 100px">专业类别：</td>
							<td>
								<input id="major" name="major" class="nui-dictcombobox" dictTypeId="ZH_MAJOR_TYPE" style="width: 300px" required="true"/>
							</td>
							<td align="right" style="width: 160px">工程类别：</td>
							<td>
								<input id="projectType" name="projectType" class="nui-dictcombobox" dictTypeId="ZH_PROJECT_TYPE" style="width: 300px" required="true"/>
							</td>
							<td align="right" style="width: 160px">集团内外：</td>
							<td>
								<input id="headquarterGroup" name="headquarterGroup" class="nui-dictcombobox" dictTypeId="ZH_GROUP" style="width: 300px" required="true"/>
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 160px">发票抬头：</td>
							<td>
								<input name="invoiceNameType" id="invoiceNameType" class="nui-dictcombobox" dictTypeId="ZH_INVOICE_NAME_TYPE" style="width: 300px" required="true"/>
							</td>
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
								<input name="invoiceUsed" class="nui-dictcombobox" dictTypeId="INVOICE_USED" style="width: 300px" required="true" />
							</td>
							<td align="right" style="width: 160px">本次收款进度：</td>
							<td>
								<input id="payType" name="payType" class="nui-dictcombobox" dictTypeId="payType" style="width: 300px" required="true"/>
							</td>
							<td align="right" style="width: 160px">合同金额（元）：</td>
							<td>
								<input id="invoiceSumCapital" name="invoiceSumCapital" class="nui-textbox" vtype="float" required="true" style="width: 300px"/>
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 160px">开票金额（元）：</td>
							<td>
								<input id="invoiceSum" name="invoiceSum" class="nui-textbox" vtype="float" style="width: 300px" required="true" onvaluechanged="editContractSum" />
							</td>
							<td align="right" style="width: 160px">账面收入（元）：</td>
							<td>
								<input id="bookIncome" name="bookIncome" class="nui-textbox" style="width: 300px" required="true" enabled="false"/>
							</td>
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
								<input name="taxpayerNumber" class="nui-textbox" style="width: 100%" required="true" />
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
								<input name="invoiceRemark" class="nui-textbox" style="width: 100%" required="false" />
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
							<td align="right" style="width: 160px">备注：</td>
							<td colspan="8">
								<input name="remark" class="nui-textarea" style="width: 100%; height: 235px" required="false" />
							</td>
						</tr>
					</table>
				</div>
			</form>
			<jsp:include page="/ame_common/inputFile.jsp" />
		</fieldset>
	</div>

	<div style="text-align: center; padding: 5px;" class="nui-toolbar">
		<a class="nui-button" onclick="onOk(0)" id="saveFeame" iconCls="icon-save" style="width: 80px; margin-right: 20px;">暂存</a>
		<a class="nui-button" onclick="onOk(1)" id="creatFeame" iconCls="icon-ok" style="width: 80px; margin-right: 20px;">提交</a>
		<a class="nui-button" onclick="closeCancel" id="saveReimbProcess" iconCls="icon-close" style="width: 80px; margin-right: 0px;">关闭</a>
	</div>
	
	<script type="text/javascript">
		nui.parse();
		var form = new nui.Form("form1");
		var type;
		
		init();
		
		function init() {
			nui.get("createUserid").setValue(userId);
			nui.get("createUsername").setValue(userName);
			nui.get("createTime").setValue(new Date());
			nui.get("createdOrgid").setValue(userOrgId);
			nui.get("implementOrgname").setValue(userOrgName);
		}
		
		function invoiceType() {
			if (nui.get("invoiceType").getValue() == 1) {
				nui.get("account").enable();
				nui.get("account").setRequired(true);
				nui.get("unitAddress").enable();
				nui.get("unitAddress").setRequired(true);
			} else {
				nui.get("account").setRequired(false);
				nui.get("account").disable();
				nui.get("account").setValue("");
				nui.get("unitAddress").setRequired(false);
				nui.get("unitAddress").disable();
				nui.get("unitAddress").setValue("");
			}
		}
		
		function setAttribute() {
			if (nui.get("postFlag").getValue() == 1) {
				nui.get("invoiceUser").enable();
				nui.get("invoiceUser").setRequired(true);
				nui.get("mailName").setRequired(false);
				nui.get("mailName").disable();
				nui.get("mailName").setValue("");
				nui.get("mailPhone").setRequired(false);
				nui.get("mailPhone").disable();
				nui.get("mailPhone").setValue("");
				nui.get("mailAddress").setRequired(false);
				nui.get("mailAddress").disable();
				nui.get("mailAddress").setValue("");
			} else {
				nui.get("invoiceUser").setRequired(false);
				nui.get("invoiceUser").disable();
				nui.get("invoiceUser").setValue("");
				nui.get("mailName").enable();
				nui.get("mailName").setRequired(true);
				nui.get("mailPhone").enable();
				nui.get("mailPhone").setRequired(true);
				nui.get("mailAddress").enable();
				nui.get("mailAddress").setRequired(true);
			}
		}
		
		function onOk(e) {
			type = e;
			if (type == 0) {
				title = "暂存";
				var contractNo =  nui.get("contractNo").getValue();
				var contractName = nui.get("contractName").getValue();
				if(isStrEmpty(contractNo)){
					showTips("请填写合同编号并保证其正确性！", "danger");
					return;
				}
				if(isStrEmpty(contractName)){
					showTips("请填写合同名称并保证其正确性！", "danger");
					return;
				}
			} else if (type == 1) {
				title = "提交";
				form.validate();
				if (form.isValid() == false) {
					showTips("请检查表单的完整性!", "danger");
					return;
				}
			}
			var filePaths = document.getElementsByName("uploadfile").length;
			for (var j = 0; j < filePaths; j++) {
				var a = document.getElementsByName("remarkList")[j].value;
				if (a == null || a == "") {
					showTips("新增附件不可以为空", "danger");
					return;
				}
			}
			nui.get("saveFeame").disable();
			nui.get("creatFeame").disable();
			var data = form.getData();
			document.getElementById("fileCatalog").value = "invoiceinfo";
			form2.submit();
		}
		
		function SaveData() {
			var form = new nui.Form("#form1");
			var data = form.getData();
			var info = "";
			data.type = type;
			if (type == 1) {
				info = "是否提交？"
			} else {
				info = "是否暂时保存？"
			}
			data.implementOrg = nui.get("createdOrgid").getValue();
			data.implementOrgName = nui.get("implementOrgname").getValue();
			data.files = nui.get("fileids").getValue();
			delete data.criteria;
			var json = nui.encode({
				'cpData' : data
			});
			if (!confirm(info)) {
				nui.get("saveFeame").enable();
				nui.get("creatFeame").enable();
				return;
			} else {
				ajaxCommon({
					url : "com.zhonghe.ame.invoice.invoice.addinvoice.biz.ext",
					data : json,
					success : function(text) {
						if (text.result == 1) {
							if (type == 1) {
								showTips("开票申请流程提交成功");
								closeOk();
							} else {
								showTips("开票申请流程暂时保存成功");
								closeOk();
							}
						} else {
							showTips("提交失败！");
							nui.get("saveFeame").enable();
							nui.get("creatFeame").enable();
						}
					}
				});
			}
		}
		
		function getOrgs() {
			var a2 = [];
			for ( var p in orglist) {
				a2[p] = orglist[p];
			}
			nui.get("implementOrg").setData(a2);
		}
		
		function setEditData(data) {
			form.setData(data);
			if (null != data.signatoryname) {
				nui.get("payerName").setValue(data.signatoryname);
			}
			nui.get("implementOrg").setValue(data.implementOrg);
			nui.get("implementOrg").setText(data.implementOrgname);
		}
		
		function onButtonEdit(e) {
			var btnEdit = this;
			mini.open({
				url : "/default/contractPact/invoice/invoiceContracList.jsp",
				title : "选择合同 - 收费合同信息",
				width : '1200',
				height : '610',
				ondestroy : function(action) {
					if (action == "ok") {
						var iframe = this.getIFrameEl();
						var data = iframe.contentWindow.GetData();
						data = mini.clone(data); //必须
						console.log(data);
						if (data) {
							btnEdit.setValue(data.contractNo);
							btnEdit.setText(data.contractNo);
							nui.get("contractName").setValue(data.contractName);
							nui.get("major").setValue(data.major);
							nui.get("projectType").setValue(data.projectType);
							nui.get("headquarterGroup").setValue(data.headquarterGroup);
							nui.get("payerName").setValue(data.signatoryName);
							nui.get("invoiceNameType").setValue(data.payee);
							nui.get("invoiceSumCapital").setValue(data.contractSum);
							btnEdit.doValueChanged();
						}
					}

				}
			});
		}
		
		function editContractSum() {
			var rate = nui.get("invoiceRate").getValue();
			var invoiceSum = nui.get("invoiceSum").getValue();
			var c = rate / 100;
			var s = 1 + c;
			var bookIncome = invoiceSum / s;
			abs = function(val) {
				var str = (val).toFixed(2) + '';
				var intSum = str.substring(0, str.indexOf(".")).replace(/\B(?=(?:\d{3})+$)/g, '');
				var dot = str.substring(str.length, str.indexOf("."))
				var ret = intSum + dot;
				return ret;
			}
			nui.get("bookIncome").setValue(abs(bookIncome));
			nui.get("invoiceTax").setValue(abs(invoiceSum - abs(bookIncome)));
			nui.get("invoiceSumChinese").setValue(functiondigitUppercase(invoiceSum));
		}
		
		function functiondigitUppercase(price) {
			debugger
			var fraction = ["角", "分"];
			var digit = ["零", "壹", "贰", "叁", "肆", "伍", "陆", "柒", "捌", "玖"];
			var unit = [["元", "万", "亿"],["", "拾", "佰", "仟"],];
			var num = Math.abs(price);
			var s = "";
			for(var i = 0; i < fraction.length; i++){
				s += (digit[Math.floor(num * (10 * Math.pow(10, i))) % 10] + fraction[i]).replace(/零./,"");
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
		
		function isStrEmpty(obj) {
			if (typeof obj == "undefined" || obj == null || obj == "") {
				return true;
			} else {
				return false;
			}
		}		
						
	</script>
</body>
</html>