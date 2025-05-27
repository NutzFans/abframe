<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<head>
<title>评审结果</title>
<style type="text/css">
body {
	margin: 0;
	padding: 0;
	border: 0;
	width: 100%;
	height: 100%;
	overflow: hidden;
}

body .mini-textboxlist {
	border-collapse: collapse;
}
</style>
</head>
<body>
	<div class="nui-fit" style="padding: 5px;">
		<fieldset id="field1" style="border: solid 1px #aaa;">
			<legend>评审结果</legend>
			<form id="form1" method="post">
				<input name="files" id="fileids" class="nui-hidden" />
				<input class="nui-hidden" name="id" />
				<input class="nui-hidden" name="purchasMode" id="purchasMode" />
				<input class="nui-hidden" name="proAppUserId" id="proAppUserId" />
				<input class="nui-hidden" name="proAppUserName" id="proAppUserName" />
				<div style="padding: 5px;">
					<table style="table-layout: fixed;">
						<tr>
							<td align="right" style="width: 90px">立项编号：</td>
							<td>
								<input name="proappId" id="proappId" onbuttonclick="onButtonEdit" allowInput="false" class="nui-buttonedit" style="width: 350px" required="true" />
							</td>
							<td align="right" style="width: 90px">采购需求单位：</td>
							<td>
								<input name="orgUnits" id="orgUnits" class="nui-textboxlist" dataField="orgUnits" url="com.zhonghe.ame.purchase.common.queryOrgByName.biz.ext" valueField="orgcode" textField="orgname"
									inputMode="false" style="width: 700px" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 90px">立项名称：</td>
							<td>
								<input name="proAppName" id="proAppName" class="nui-textbox" style="width: 100%;" required="true" readonly="readonly" />
							</td>
							<td align="right" style="width: 90px;">评审结果名称：</td>
							<td>
								<input name="type" id="type" class="nui-hidden" />
								<span data-placement="left" data-tooltip="默认使用立项名称,可自行修改">
									<input name="reportName" id="reportName" class="nui-textbox" style="width: 100%" required="true" />
								</span>
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 90px">立项金额：</td>
							<td>
								<input name="proAppApplyPrice" id="proAppApplyPrice" class="nui-textbox" style="width: 100%;" required="true" readonly="readonly" />
							</td>
							<td class="form_label" align="right" style="width: 120px;">归口部门：</td>
							<td>
								<input id="putunder" name="putunder" class="nui-dictcombobox" dictTypeId="ZH_PUTUNDER" readonly="readonly" style="width: 100%;" required="true" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 90px">最终采购方式：</td>
							<td>
								<input id="finalPurchasMode" name="finalPurchasMode" class="nui-dictcombobox" dictTypeId="ZH_CGFS_NEW" required="true" style="width: 100%;"/>
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 90px;">评审结果说明：</td>
							<td colspan="3">
								<input style="width: 100%; height: 120px;" name="remark" id="remark" class="nui-textarea" required="true" />
							</td>
						</tr>
					</table>
				</div>
			</form>
		</fieldset>

		<fieldset style="border: solid 1px #aaa;">
			<legend>采购立项明细</legend>
			<div id="grid_detail" class="nui-datagrid" style="width: 100%; height: auto;" dataField="datas" showPager="false" multiSelect="true"
				url="com.zhonghe.ame.purchase.dao.projectApproval.queryProAppDtl.biz.ext">
				<div property="columns">
					<div type="indexcolumn" align="center" headerAlign="center" visible="false"></div>
					<div field="planName" width="110" align="center" headerAlign="center">计划名称</div>
					<div field="code" width="100" align="center" headerAlign="center">计划编号</div>
					<div field="materialName" width="110" align="center" headerAlign="center">采购物项名称</div>
					<div field="budgetAmount" width="100" align="center" headerAlign="center">预算金额(万元)</div>
					<div field="amount" width="100" align="center" headerAlign="center">立项金额(万元)</div>
					<div field="sumamount" width="110" align="center" headerAlign="center" vtype="required">剩余可立项金额(万元)</div>
					<div field="needOrgName" width="80" align="left" headerAlign="center">采购单位</div>
				</div>
			</div>
		</fieldset>

		<fieldset id="field3" style="border: solid 1px #aaa;">
			<legend>采购立项 - 附件</legend>
			<jsp:include page="/ame_common/detailFile.jsp" />
		</fieldset>

		<fieldset id="field4" style="border: solid 1px #aaa;">
			<legend>评审结果 - 附件</legend>
			<jsp:include page="/ame_common/inputFileExpand.jsp" />
		</fieldset>
	</div>

	<div style="text-align: center; position: relative; bottom: 10px" class="nui-toolbar">
		<a class="nui-button" onclick="onOk(0)" id="saveReimb" iconCls="icon-save" style="width: 80px; margin-right: 20px;">暂存</a>
		<a class="nui-button" onclick="onOk(1)" id="creatReimbProcess" iconCls="icon-ok" style="width: 80px; margin-right: 20px;">提交</a>
		<a class="nui-button" onclick="closeCancel" id="saveReimbProcess" iconCls="icon-close" style="width: 80px; margin-right: 140px;">关闭</a>
	</div>

	<script type="text/javascript">
		var tip = new mini.ToolTip();
		tip.set({
			target : document,
			selector : '[data-tooltip], [data-placement]'
		});
		nui.parse();
		var id = <%=request.getParameter("id")%>;
		var istype;
		var form = new nui.Form("#form1");
		var gridDtl = nui.get("grid_detail");

		$("#orgUnits > tbody > tr > td").attr("style", "background: #FFFFE6");

		function onButtonEdit(e) {
			var btnEdit = this;
			mini.open({
				url : "/default/purchase/project/procurementProAppList.jsp",
				title : "采购立项列表",
				width : '80%',
				height : '80%',
				ondestroy : function(action) {
					if (action == "ok") {
						var iframe = this.getIFrameEl();
						var data = iframe.contentWindow.GetData();
						data = mini.clone(data); //必须
						if (data) {
							btnEdit.setValue(data.id);
							btnEdit.setText(data.proAppCode);
							nui.get("proAppUserId").setValue(data.createdBy);
							nui.get("proAppUserName").setValue(data.createdUsername);
							nui.get("proAppName").setValue(data.proAppName);
							nui.get('reportName').setValue(data.proAppName);
							nui.get('orgUnits').setValue(data.proAppOrgId);
							nui.get('orgUnits').setText(data.proAppOrgName);
							nui.get("proAppApplyPrice").setValue(data.proAppApplyPrice);
							nui.get("putunder").setValue(data.putunder);
							nui.get("purchasMode").setValue(data.purchasMode);
							nui.get("type").setValue(data.type);
							btnEdit.doValueChanged();
							gridDtl.load({
								"pid" : data.id
							})
							var grid_0 = nui.get("grid_0");
							grid_0.load({
								"groupid" : "proAppCost",
								"relationid" : data.id
							});
							grid_0.sortBy("fileTime", "desc");
						}
					}

				}
			});
		}
		
		function isStrEmpty(obj) {
			if (typeof obj == "undefined" || obj == null || obj == "") {
				return true;
			} else {
				return false;
			}
		}		

		function onOk(e) {
			istype = e;
			var info;
			if (istype == 0) {
				var proappId = nui.get("proappId").getValue();
				if (isStrEmpty(proappId)) {
					showTips("请选中立项编号并保证其正确性！", "danger");
					return;
				}
				info = "暂存流程表单？"
			} else if (istype == 1) {
				if (nui.get("purchasMode").getValue() == null) {
					nui.alert("采购类型为空请联系管理员处理!");
					return;
				}
				if (!form.validate()) {
					showTips("请检查表单的完整性!", "danger");
					return;
				}
				// 已上传的文件数量
				var gridFileCount = nui.get("inputFileExpandGrid").getData().length;
				if (gridFileCount == 0) {
					// 刚新增(未上传)的文件数量
					var newFileCount = document.getElementsByName("uploadfile").length;
					if (newFileCount == 0) {
						showTips("请上传相关附件", "danger");
						return;
					}
				}
				info = "提交流程表单？"
			}
			document.getElementById("fileCatalog").value = "purReviewReport";
		
			nui.confirm("确定" + info, "系统提示", function(action) {
				if (action == "ok") {
					nui.get("saveReimb").disable();
					nui.get("creatReimbProcess").disable();
					nui.mask({el: document.body,cls: 'mini-mask-loading',html: '表单提交中...'});
					inputFileExpandForm.submit();
				}
			});			
		}

		function SaveData() {
			setTimeout(function() {
				nui.unmask(document.body);
				var data = form.getData();
				data.proAppOrgId = nui.get('orgUnits').getValue();
				data.proAppOrgName = nui.get('orgUnits').getText();
				data.files = nui.get("fileids").getValue();
				data.istype = istype;
				if (istype == "0") {
					data.status = '0';
				}
				var json = nui.encode({
					'reviewReport' : data
				});
				ajaxCommon({
					url : "com.zhonghe.ame.purchase.purchaseReviewReport.addReviewReport.biz.ext",
					data : json,
					contentType : 'text/json',
					success : function(text) {
						if (text.result == "1") {
							showTips("操作成功");
							closeOk();
						} else {
							nui.get("saveReimb").enable();
							nui.get("creatReimbProcess").enable();
						}
					}
				});
			}, 2000);
		}
	</script>

</body>
</html>