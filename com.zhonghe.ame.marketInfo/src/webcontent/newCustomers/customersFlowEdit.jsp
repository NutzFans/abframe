<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<style type="text/css">
html,body {
	margin: 0;
	padding: 0;
	border: 0;
	width: 100%;
	height: 100%;
	overflow: hidden;
}
</style>
<head>
<title>客户信息审核</title>
</head>
<body>
	<%
		long workItemId = (Long) request.getAttribute("workItemID");
	%>
	<div class="nui-fit" style="padding: 5px;">
		<fieldset id="field1" style="border: solid 1px #aaa;">
			<legend>客户信息</legend>
			<form id="flowForm" method="post">
				<input id="custid" name="custid" class="nui-hidden" />
				<input name="processid" class="nui-hidden" />
				<div style="padding: 5px;">
					<table style="table-layout: fixed;">
						<tr>
							<td align="right" style="width: 70px">创建人：</td>
							<td>
								<input name="custmanager" class="nui-textbox" style="width: 200px" readonly="readonly" />
							</td>
							<td align="right" style="width: 70px">创建单位：</td>
							<td>
								<input name="accoutname" class="nui-textbox" style="width: 200px" readonly="readonly" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 70px">客户名称：</td>
							<td colspan="3">
								<input id="custname" name="custname" class="nui-textbox" style="width: 100%" required="true" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 70px">客户类型：</td>
							<td colspan="3">
								<input id="custtype" name="custtype" class="nui-dictcombobox" dictTypeId="CUSTOMER_TYPE" style="width: 100%" required="true" onvaluechanged="changeCustType" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 110px">统一社会信用代码：</td>
							<td colspan="3">
								<input id="custnum" name="custnum" class="nui-textbox" style="width: 100%" required="true" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 70px">所属省份：</td>
							<td colspan="3">
								<input name="provinces" class="nui-dictcombobox" dictTypeId="AME_PROVINCE" style="width: 100%" required="true" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 70px">集团内/外：</td>
							<td colspan="3">
								<input name="outsideGroup" class="nui-dictcombobox" dictTypeId="ZH_GROUP_NEW" style="width: 100%" required="true" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 70px">境内/外：</td>
							<td colspan="3">
								<input name="overseasCustomer" class="nui-dictcombobox" dictTypeId="ZH_OVERSEAS" style="width: 100%" required="true" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 70px">备注：</td>
							<td colspan="3">
								<input name="remarks" class="nui-textarea" style="width: 100%; height: 100px" />
							</td>
						</tr>
					</table>
				</div>
			</form>
		</fieldset>
		<p>
			<jsp:include page="/ame_common/misOpinion.jsp" />
	</div>

	<div style="text-align: center; padding: 5px; margin-bottom: 1px" class="nui-toolbar">
		<a id="okBtn" class="nui-button" onclick="save(1)" style="width: 60px; margin-right: 20px;" iconCls="icon-ok">提交</a>
		<a id="zzFeame" class="nui-button" onclick="save(2)" style="width: 60px; margin-right: 20px;" iconCls="icon-split">终止</a>
		<a id="closeBtn" class="nui-button" onclick="closeCancel()" style="width: 60px;" iconCls="icon-close">关闭</a>
	</div>

	<script type="text/javascript">
		nui.parse();
		var workItemId = <%=workItemId%>;
		var flowForm = new nui.Form("#flowForm");
		var opioionForm = new nui.Form("opioionform");
		var opioionGrid = nui.get("datagrid1");
		var saveType, confirmInfo;

		init();

		function init() {
			var data = {
				"workItemId" : workItemId
			};
			var json = nui.encode(data);
			ajaxCommon({
				url : "com.zhonghe.ame.marketInfo.marketinfo.khxx.newCustomers.queryCustInfoById.biz.ext",
				data : json,
				success : function(result) {
					var workItemInfo = result.workItemInfo;
					flowForm.setData(result.mainData);
					changeCustType();
					//设置审核意见基本信息
					nui.get("processinstid").setValue(workItemInfo.processInstID);
					nui.get("processinstname").setValue(workItemInfo.processInstName);
					nui.get("activitydefid").setValue(workItemInfo.activityDefID);
					nui.get("workitemname").setValue(workItemInfo.workItemName);
					nui.get("workitemid").setValue(workItemId);
					nui.get("isshow").setValue("1");
					nui.get("auditstatus").setValue(4);
					document.getElementById("salesEdit").style.display = "none";
					nui.get("auditopinion").setValue("");
					//查询审核意见
					if (workItemInfo.processInstID != null || workItemInfo.processInstID != "") {
						opioionGrid.load({
							"processInstID" : workItemInfo.processInstID
						});
						opioionGrid.sortBy("time", "desc");
					}
				}
			});
		}

		function changeCustType() {
			var custtype = nui.get("custtype").getValue();
			if (custtype == "11" || custtype == "12" || custtype == "13" || custtype == "14") {
				nui.get("custnum").setRequired(false);
			} else {
				nui.get("custnum").setRequired(true);
			}
		}

		function save(e) {
			saveType = e;
			nui.get("auditstatus").setValue("4");
			if (saveType == 1) {
				if (!flowForm.validate()) {
					showTips("请检查表单的完整性!", "danger");
					return;
				}
				var custnum = nui.get("custnum").getValue();
				if (checkCustNum(custnum) == false) {
					showTips("您录入的【统一社会信用代码】已被使用，可能该客户已被录入！", "danger");
					return;
				}
				var custName = nui.get("custname").getValue();
				if (checkCustName(custName) == false) {
					showTips("您录入的【客户名称】已被使用！", "danger");
					return;
				}
				confirmInfo = "提交流程表单？";
			} else {
				nui.get("auditstatus").setValue("2");
				confirmInfo = "终止流程表单？";
			}
			nui.confirm("确定" + confirmInfo, "系统提示", function(action) {
				if (action == "ok") {
					nui.get("okBtn").disable();
					nui.get("zzFeame").disable();
					nui.mask({
						el : document.body,
						cls : 'mini-mask-loading',
						html : '表单提交中...'
					});
					var formData = flowForm.getData();
					formData.custname = nui.get("custname").getValue().trim();
					formData.custnum = nui.get("custnum").getValue().trim();
					formData.saveType = saveType;
					var opioionData = opioionForm.getData();
					var json = nui.encode({
						"custData" : formData,
						"misOpinion" : opioionData.misOpinion
					});
					ajaxCommon({
						"url" : "com.zhonghe.ame.marketInfo.marketinfo.khxx.newCustomers.flowNewCustInfoEdit.biz.ext",
						data : json,
						contentType : 'text/json',
						success : function(text) {
							nui.unmask(document.body);
							if (text.result == "1") {
								showTips("操作成功");
								closeOk();
							} else {
								nui.get("okBtn").enable();
								nui.get("zzFeame").enable();
							}
						}
					});
				}
			});
		}

		function checkCustNum(custnum) {
			var result = true;
			var custid = nui.get("custid").getValue();
			if (isStrEmpty(custnum)) {
				return result;
			} else {
				var json = nui.encode({
					'custnum' : custnum.trim(),
					'custid' : custid
				});
				ajaxCommon({
					url : "com.zhonghe.ame.marketInfo.marketinfo.khxx.newCustomers.checkCustNumById.biz.ext",
					data : json,
					async : false,
					success : function(data) {
						result = data.result;
					}
				});
				return result;
			}
		}

		function checkCustName(custName) {
			var result = true;
			var custid = nui.get("custid").getValue();
			if (isStrEmpty(custName)) {
				return result;
			} else {
				var json = nui.encode({
					'custName' : custName.trim(),
					'custid' : custid
				});
				ajaxCommon({
					url : "com.zhonghe.ame.marketInfo.marketinfo.khxx.newCustomers.checkCustNameById.biz.ext",
					data : json,
					async : false,
					success : function(data) {
						result = data.result;
					}
				});
				return result;
			}
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