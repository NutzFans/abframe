<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp" %>
<html>
<head>
	<title>采购文件</title>
	<style type="text/css">
		body {
			margin: 0;padding: 0;border: 0;width: 100%;height: 100%;overflow: hidden;
		}
	</style>
</head>
<body>
	<div class="nui-fit">
		<div class="mini-panel" showHeader="false" style="width: 99%;">
			<fieldset id="field1" style="border: solid 1px #aaa;padding: 1px;width: 99%;">
				<legend>采购文件信息</legend>
				<form id="form1" method="post">
					<input name="files" id="fileids" class="nui-hidden" />
					<input name="files1" id="fileids1" class="nui-hidden" />
					<input class="nui-hidden" name="id" />
					<div style="padding: 1px;">
						<table style="table-layout: fixed;width: 100%;">
							<tr>
								<td width="100" align="right">采购项目名称：</td>
								<td colspan="3">
									<input name="type" id="type" class="nui-hidden" />
									<input name="programmeName" id="programmeName" class="nui-textbox"
										style="width: 100%" required="true" />
								</td>
								<td align="right" style="width: 80px">申请单位：</td>
								<td colspan="3">
									<input name="createdOrgname" value="<%=userOrgName %>" class="nui-textbox"
										style="width: 100%" required="true" />
									<input name="createdOrgid" value="<%=userOrgId %>" class="nui-hidden"
										style="width: 100%" required="true" />
								</td>
							</tr>
							<tr>
								<td align="right" style="width:100px">立项编号：</td>
								<td colspan="3">
									<input name="proappId" id="proappId" onbuttonclick="onButtonEdit"
										allowInput="false" class="nui-buttonedit" style="width: 100%"
										required="true" />
								</td>
								<td align="right" style="width: 100px">立项名称：</td>
								<td colspan="3">
									<input name="proAppName" id="proAppName" class="nui-textbox"
										style="width: 100%;" readonly="readonly" />
								</td>
							</tr>
							<tr>
								<td align="right" style="width: 80px">申请人：</td>
								<td colspan="1">
									<input name="createdByName" value="<%=userName %>" class="nui-textbox"
										style="width: 100%" required="true" />
								</td>
								<td align="right" style="width: 100px">立项金额：</td>
								<td colspan="1">
									<input name="proAppApplyPrice" id="proAppApplyPrice" class="nui-textbox"
										style="width: 100%;" readonly="readonly" />
								</td>
								<td class="form_label" align="right" style="width:120px;">归口部门：</td>
								<td colspan="3">
									<input id="putunder" name="putunder" class="nui-dictcombobox"
										dictTypeId="ZH_PUTUNDER" readonly="readonly" style="width:100%;" />
								</td>
							</tr>
							<tr>
								<td class="form_label" align="right" style="width:140px;">采购文件主要内容简述：</td>
								<td colspan="5">
									<input style="width:100%;height: 40px;" name="remark" id="remark"
										class="nui-textarea" required="true" />
								</td>
							</tr>
						</table>
					</div>
				</form>
			</fieldset>
			<fieldset style="height:80%; border:solid 1px #aaa;padding:1px;width: 99%">
				<legend>采购计划明细</legend>
				<div class="fieldset-body" style="width:100%; height:100%; margin: 0px auto">
					<div id="grid_detail" class="nui-datagrid" style="width: 100%;height: auto;"
						allowCellSelect="true"
						url="com.zhonghe.ame.purchase.dao.projectApproval.queryProAppDtl.biz.ext"
						dataField="datas" showPager="false" multiSelect="true">
						<div property="columns">
							<div type="indexcolumn" align="center" headerAlign="center" visible="false"></div>
							<div field="planName" width="110" align="center" headerAlign="center">计划名称</div>
							<div field="code" width="100" align="center" headerAlign="center">计划编号</div>
							<div field="materialName" width="110" align="center" headerAlign="center">采购物项名称
							</div>
							<div field="budgetAmount" width="100" align="center" headerAlign="center">预算金额(万元)
							</div>
							<div field="amount" width="100" align="center" headerAlign="center">立项金额(万元)</div>
							<div field="sumamount" width="110" align="center" headerAlign="center"
								vtype="required">剩余可立项金额(万元)</div>
							<div field="needOrgName" width="80" align="left" headerAlign="center">采购单位</div>
						</div>
					</div>
				</div>
			</fieldset>
			<fieldset id="field2" style="border:solid 1px #aaa;padding:1px;width: 99%">
				<legend>附件（请上传技术规格书、采购文件）</legend>
				<jsp:include page="/ame_common/addFiles.jsp" />
			</fieldset>
		</div>
	</div>
	<div class="nui-toolbar" style="text-align:center;padding-top:8px;padding-bottom:8px;">
		<a class="nui-button" onclick="onOk(0)" id="saveReimb" iconCls="icon-save"
			style="width: 80px;margin-right: 20px;">暂存</a>
		<a class="nui-button" onclick="onOk(1)" id="creatReimbProcess" iconCls="icon-ok"
			style="width: 80px;margin-right: 20px;">提交</a>
		<a class="nui-button" onclick="closeCancel" id="saveReimbProcess" iconCls="icon-close"
			style="width: 80px;margin-right: 140px;">关闭</a>
	</div>
	<script type="text/javascript">
		nui.parse();
		var form = new nui.Form("#form1");
		var istype;
		var gridDtl = nui.get("grid_detail");
		function onOk(e) {
			istype = e;
			if (istype == 0) {
				title = "暂存";
			}else if (istype == 1) {
				title = "提交";
				if (!form.validate()) {
					showTips("请检查表单完整性","danger");
					return;
				}
				//定义变量接受form表单数据
				var data = form.getData();
				document.getElementById("fileCatalog").value = "purProgramme";
				var filePaths = document.getElementsByName("uploadfile").length;
				if (filePaths == 0) {
					showTips("附件不可以为空","danger");
					return;
				} else {
					for (var j = 0; j < filePaths; j++) {
						var a = document.getElementsByName("remarkList")[j].value;
						if (a == null || a == "") {
							showTips("附件不可以为空","danger");
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
						showTips(name + "采购方案附件大小不可以为空", "danger");
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
			data.judge = getJudge();
			data.files = nui.get("fileids").getValue();
			data.istype = istype;
			if (istype == "0") {
				data.status = '0';
			}
			var json = nui.encode({ 'purProgramme': data,"misOpinion":{"auditstatus":3}});
			if (!confirm("是否提交？")) {
				return;
			} else {
				var msgBoxId = nui.loading("正在处理...", "请稍后");
				nui.ajax({
					url: "com.zhonghe.ame.purchase.purchaseProgramme.addPurProgramme.biz.ext",
					type: 'POST',
					data: json,
					success: function (text) {
						if (text.result == "1") {
							showTips("提交成功")
							closeOk();
						} else {
							nui.hideMessageBox(msgBoxId);
							showTips("提交失败")
						}
					}
				});
			}
		}

		function onButtonEdit(e) {
			var btnEdit = this;
			mini.open({
				url: "/default/purchase/project/procurementProAppList.jsp",
				title: "采购立项列表",
				width: '73%',
				height: 450,
				ondestroy: function (action) {
					if (action == "ok") {
						var iframe = this.getIFrameEl();
						var data = iframe.contentWindow.GetData();
						data = mini.clone(data);    //必须
						if (data) {
							btnEdit.setValue(data.id);
							btnEdit.setText(data.proAppCode);
							nui.get("proAppName").setValue(data.proAppName);
							nui.get("proAppApplyPrice").setValue(data.proAppApplyPrice);
							nui.get("putunder").setValue(data.putunder);
							nui.get("type").setValue(data.type);
							btnEdit.doValueChanged();
							gridDtl.load({ "pid": data.id })

						}
					}

				}
			});
		}

	</script>
</body>
</html>