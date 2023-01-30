<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<head>
<title>框架协议签订申请"</title>
<style type="text/css">
	body {
		margin: 0;padding: 0;border: 0;width: 100%;height: 100%;overflow: hidden;
	}
</style>
</head>
<body>
	<div class="nui-fit">
		<fieldset id="field1" style="border: solid 1px #aaa; padding: 3px; width: 99%;">
			<form id="form1" method="post">
				<input name="files" id="fileids" class="nui-hidden" />
				<input class="nui-hidden" name="id" />
				<div style="padding: 5px;">
					<table style="table-layout: fixed;">
						<tr>
							<td class="form_label" align="right">申请人：</td>
							<td>
								<input name="createUserid" id="createUserid" class="nui-hidden" style="width: 300px" />
								<input id="createUsername" class="nui-textbox" enabled="false" style="width: 300px" required="true" />
							</td>
							<td align="right" style="width: 120px">协议实施部门：</td>

							<td style="width: 20%;">
								<input name="implementOrg" id="implementOrg" class="nui-combobox" valueField="orgid" textField="orgname" style="width: 300px" shownullitem="false" allowinput="true" required="true" enabled="false"/>
							</td>
							<td align="right" style="width: 160px">申请日期：</td>
							<td>
								<input id="createTime" name="createTime" class="nui-datepicker" style="width: 300px" required="true" />
							</td>

						</tr>
						<tr>
							<td align="right" style="width: 120px">协议名称：</td>
							<td>
								<input name="contractName" class="nui-textbox" style="width: 300px" required="true" />
							</td>
							<td align="right" style="width: 100px">协议金额（元）：</td>
							<td>
								<input id="contractSum" name="contractSum" class="nui-textbox" style="width: 300px" onvaluechanged="isNum()" />
							</td>
							<td align="right" style="width: 130px">签约方：</td>
							<td>
								<input name="signatory" class="nui-combobox" required="true" url="com.zhonghe.ame.chargeContract.chargeContract.queryCusts.biz.ext" filterType="like" textField="custname" valueField="custid"
									dataField="custs" valueFromSelect="true" allowInput="true" style="width: 300px;" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 100px">协议签约主体：</td>
							<td>
								<input id="contractSubject" name="contractSubject" class="nui-dictcombobox" dictTypeId="ZH_INVOICE_NAME_TYPE" style="width: 300px" required="true" />
							</td>
							<td align="right" style="width: 100px">实施地点：</td>
							<td>
								<input name="projectLocal" class="nui-textbox" style="width: 300px" required="true" />
							</td>
							<td align="right" style="width: 100px">标的规模：</td>
							<td>
								<input name="projectSize" class="nui-textbox" style="width: 300px" required="true" />
							</td>

						</tr>
						<tr>
							<td align="right" style="width: 100px">分公司会签部门领导：</td>
							<td style="width: 20%;">
								<input name="fDeptCountersignId" id="userLookup_multiple" width="100%" class="nui-lookup" textField="empname" valueField="empid" popupWidth="auto" popup="#userPanel_lookup_multiple"
									grid="#userDatagrid_lookup_multiple" emptyText="请选择.." multiSelect="true" onvaluechanged="onFUseridsValueChanged" />
								<input name="fDeptCountersignName" id="fDeptCountersignName" class="nui-hidden" />
							</td>
							<td align="right" style="width: 100px">本部会签部门领导：</td>
							<td style="width: 20%;">
								<input name="zDeptCountersignId" id="userLookup_multiple1" width="100%" class="nui-lookup" textField="empname" valueField="empid" popupWidth="auto" popup="#userPanel_lookup_multiple1"
									grid="#userDatagrid_lookup_multiple1" emptyText="请选择.." multiSelect="true" onvaluechanged="onZUseridsValueChanged" />
								<input name="zDeptCountersignName" id="zDeptCountersignName" class="nui-hidden">
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
			</form>
		</fieldset>
		<fieldset id="field2" style="border: solid 1px #aaa; padding: 3px;">
			<jsp:include page="/ame_common/inputFile.jsp" />
		</fieldset>
	</div>

	<div style="text-align: center; padding: 10px;" class="nui-toolbar">
		<a class="nui-button" onclick="onOk(0)" id="saveFeame" style="width: 80px; margin-right: 20px;">保存</a>
		<a class="nui-button" onclick="onOk(1)" id="creatFeame" style="width: 80px; margin-right: 20px;">提交</a>
		<a class="nui-button" onclick="closeCancel" style="width: 80px; margin-right: 140px;">关闭</a>
	</div>

	<%@include file="/contractPact/common/userLookup1.jsp"%>
	<script type="text/javascript">
		nui.parse();
		var form = new nui.Form("form1");
		var type ;//暂存还是发起
		
		 init();
		 
		 getOrgs();
		 
		function init() {
			nui.get("createUserid").setValue(userId);
			nui.get("createUsername").setValue(userName);
			nui.get("implementOrg").setValue(userOrgId);
			nui.get("implementOrg").setText(userOrgName);
			nui.get("createTime").setValue(new Date());
		}
		
		function getOrgs() {
			var a2 = [];
			for ( var p in orglist) {
				a2[p] = orglist[p];
			}
			nui.get("implementOrg").setData(a2);
		}

		//判断是否是数字
		function isNum() {
			var value = nui.get("contractSum").value + '';
			if (!isNaN(value)) {
			} else {
				showTips("请输入数字！", "danger");
				nui.get("contractSum").setValue("");
			}
		}
		
		function onOk(e) {
			type = e;
			//定义变量接受form表单数据
			var form = new nui.Form("#form1");
			if (type == 1) {
				form.validate();
				if (form.isValid() == false) {
					showTips("请检查必填项！", "danger");
					return;
				}
			}
			var filePaths = document.getElementsByName("uploadfile").length;
			for (var j = 0; j < filePaths; j++) {
				var a = document.getElementsByName("remarkList")[j].value;
				if (a == null || a == "") {
					showTips("新增附件不可以为空！", "danger");
					return;
				}
			}
			nui.get("saveFeame").disable();
			nui.get("creatFeame").disable();
			var data = form.getData();
			document.getElementById("fileCatalog").value = "feameAgreementinfo";
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
			data.files = nui.get("fileids").getValue();
			var json = nui.encode({
				'cpData' : data
			});
			if (!confirm(info)) {
				nui.get("saveFeame").enable();
				nui.get("creatFeame").enable();
				return;
			} else {
				ajaxCommon({
					url : "com.zhonghe.ame.contractPact.frameAgreement.addframeAgreement.biz.ext",
					data : json,
					success : function(text) {
						if (text.result == "1") {
							if (type == 1) {
								showTips("框架协议提交成功");
								closeOk();
							} else {
								showTips("框架协议暂时保存成功")
								closeOk();
							}
						} else {
							showTips("提交失败！", "danger");
							nui.get("saveFeame").enable();
							nui.get("creatFeame").enable();
						}

					}
				});
			}
		}

		//值改变的时候
		function onFUseridsValueChanged() {
			nui.get("fDeptCountersignName").setValue(nui.get("userLookup_multiple").getText());
		}
		//值改变的时候
		function onZUseridsValueChanged() {
			nui.get("zDeptCountersignName").setValue(nui.get("userLookup_multiple1").getText());
		}
	</script>
</body>
</html>