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
	<div class="nui-fit">
		<fieldset id="field1" style="border: solid 1px #aaa; padding: 1px; width: 99%;">
			<legend>评审结果信息</legend>
			<form id="form1" method="post">
				<input name="files" id="fileids" class="nui-hidden" />
				<input name="files1" id="fileids1" class="nui-hidden" />
				<input class="nui-hidden" name="id" />
				<input class="nui-hidden" name="purchasMode" id="purchasMode" />
				<input class="nui-hidden" id="addType" />
				<div style="padding: 1px;">
					<table style="table-layout: fixed; width: 100%;">
						<tr>
							<td align="right" style="width: 135px">立项编号：</td>
							<td>
								<input name="proappId" id="proappId" onbuttonclick="onButtonEdit" allowInput="false" class="nui-buttonedit" style="width: 100%" required="true" />
							</td>
							<td align="right" style="width: 120px">采购需求单位：</td>
							<td>
								<input name="orgUnits" id="orgUnits" class="nui-textboxlist" dataField="orgUnits" url="com.zhonghe.ame.purchase.common.queryOrgByName.biz.ext" valueField="orgcode" textField="orgname"
									inputMode="false" style="width: 705px" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 100px">立项名称：</td>
							<td>
								<input name="proAppName" id="proAppName" class="nui-textbox" style="width: 100%;" required="true" readonly="readonly" />
							</td>
							<td align="right" style="width: 100px;">评审结果名称：</td>
							<td>
								<input name="type" id="type" class="nui-hidden" />
								<span data-placement="left" data-tooltip="默认使用立项名称,可自行修改">
									<input name="reportName" id="reportName" class="nui-textbox" style="width: 100%" required="true" />
								</span>
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 100px">立项金额：</td>
							<td>
								<input name="proAppApplyPrice" id="proAppApplyPrice" class="nui-textbox" style="width: 100%;" required="true" readonly="readonly" />
							</td>
							<td class="form_label" align="right" style="width: 120px;">归口部门：</td>
							<td>
								<input id="putunder" name="putunder" class="nui-dictcombobox" dictTypeId="ZH_PUTUNDER" readonly="readonly" style="width: 100%;" required="true" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 135px;">评审结果说明：</td>
							<td colspan="3">
								<input style="width: 100%; height: 120px;" name="remark" id="remark" class="nui-textarea" required="true" />
							</td>
						</tr>
					</table>
				</div>
			</form>
		</fieldset>
		<fieldset style="border: solid 1px #aaa; padding: 1px; width: 99%">
			<legend>采购计划明细</legend>
			<div class="fieldset-body" style="width: 100%; margin: 0px auto">
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
			</div>
		</fieldset>
		<fieldset id="field2" style="border: solid 1px #aaa; padding: 3px;">
			<legend>附件(采购文件、评审报告、合同及会议纪要（若有）)</legend>
			<jsp:include page="/ame_common/reviewReportFiles.jsp" />
		</fieldset>
	</div>
	<div class="nui-toolbar" style="text-align: center; padding-top: 8px; padding-bottom: 8px;">
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
		var id =<%=request.getParameter("id")%>;
		var istype;
		var form = new nui.Form("#form1");
		var gridDtl = nui.get("grid_detail");

		$("#orgUnits > tbody > tr > td").attr("style", "background: #FFFFE6");

		function initData(data) {
			nui.get("addType").setValue(data.addType);
			if (data.addType == "add_zxcg") {
				nui.get("putunder").set({
					required : false
				});
			}
		}

		function onOk(e) {
			istype = e;
			if (istype == 0) {
				title = "暂存";
			} else if (istype == 1) {
				title = "提交";
				if (nui.get("purchasMode").getValue() == null) {
					nui.alert("采购类型为空请联系管理员处理!");
					return;
				}
				if (!form.validate()) {
					showTips("请检查表单的完整性!", "danger");
					return;
				}
				//定义变量接受form表单数据
				var data = form.getData();
				document.getElementById("fileCatalog").value = "purReviewReport";
				var filePaths = document.getElementsByName("uploadfile").length;
				if (filePaths == 0) {
					showTips("附件不可以为空", "danger");
					return;
				} else {
					for (var j = 0; j < filePaths; j++) {
						var a = document.getElementsByName("remarkList")[j].value;
						if (a == null || a == "") {
							showTips("附件不可以为空", "danger");
							return;
						}
					}
				}
				//文件大小不能超过100MB
				var sum = 0;
				for (var j = 0; j < filePaths; j++) {
					var size = document.getElementsByName("uploadfile")[j].files[0].size;
					if (size == null || size == "") {
						var name = size = document.getElementsByName("uploadfile")[j].files[0].name
						showTips(name + "附件大小不可以为空", "danger");
						return;
					} else {
						sum += size;
					}
				}
				if (sum > 104857600) {
					showTips("上次文件大小不能超过100MB", "danger");
					return;
				}
			}
			form2.submit();
		}

		function SaveData() {
			var form = new nui.Form("#form1");
			var data = form.getData();
			data.proAppOrgId = nui.get('orgUnits').getValue();
			data.proAppOrgName = nui.get('orgUnits').getText();
			data.judge = getJudge();
			data.files = nui.get("fileids").getValue();
			data.istype = istype;
			if (istype == "0") {
				data.status = '0';
			}
			var json = nui.encode({
				'reviewReport' : data,
				"misOpinion" : {
					"auditstatus" : 3
				}
			});
			if (!confirm("是否提交？")) {
				return;
			} else {
				var msgBoxId = form.loading("正在处理...", "请稍后");
				nui.ajax({
					url : "com.zhonghe.ame.purchase.purchaseReviewReport.addReviewReport.biz.ext",
					data : json,
					type : 'POST',
					success : function(text) {
						nui.hideMessageBox(msgBoxId);
						if (text.result == "1") {
							showTips("提交成功");
							closeOk();
						} else {
							nui.hideMessageBox(msgBoxId);
							nui.alert("提交失败")
						}
					}
				});
			}
		}

		function onButtonEdit(e) {
			var btnEdit = this;
			var addType = nui.get("addType").getValue();
			mini.open({
				url : "/default/purchase/project/procurementProAppList.jsp?addType=" + addType,
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

						}
					}

				}
			});
		}
	</script>
</body>
</html>