<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<style type="text/css">
body {
	margin: 0;
	padding: 0;
	border: 0;
	width: 100%;
	height: 100%;
	overflow: hidden;
}
</style>
<head>
<title>会计科目 - 编辑</title>
</head>
<body>
	<div class="nui-fit" style="padding: 5px;">
		<form id="editForm" method="post">
			<input name="id" class="nui-hidden" />
			<fieldset style="border: solid 1px #aaa;">
				<legend>&nbsp;基本信息&nbsp;</legend>
				<div style="padding: 5px;">
					<table style="table-layout: fixed;">
						<tr>
							<td align="right" style="width: 100px">科目名称：</td>
							<td>
								<input name="name" class="nui-textbox" style="width: 200px" required="true" />
							</td>
							<td align="right" style="width: 100px">科目排序：</td>
							<td>
								<input name="sorting" class="mini-spinner" style="width: 150px" required="true" minValue="1" />
							</td>
							<td align="right" style="width: 100px">科目分类：</td>
							<td>
								<input name="category" class="nui-dictcombobox" style="width: 150px" required="true" dictTypeId="CW_KM_CLASS" />
							</td>
						<tr>
					</table>
				</div>
			</fieldset>

			<fieldset style="border: solid 1px #aaa;">
				<legend>&nbsp;职能部门&nbsp;</legend>
				<div style="padding: 5px;">
					<table style="table-layout: fixed;">
						<tr>
							<td align="right" style="width: 100px">科目代码：</td>
							<td>
								<input name="znErpCode" class="nui-textbox" style="width: 200px" />
							</td>
							<td align="right" style="width: 130px">ERP预算及会计科目：</td>
							<td>
								<input name="znErpName" class="nui-textbox" style="width: 400px" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 100px">说明：</td>
							<td colspan="3">
								<input name="znErpRemark" class="nui-textarea" style="width: 100%; height: 50px" />
							</td>
						</tr>
					</table>
				</div>
			</fieldset>

			<fieldset style="border: solid 1px #aaa;">
				<legend>&nbsp;项目部&nbsp;</legend>
				<div style="padding: 5px;">
					<table style="table-layout: fixed;">
						<tr>
							<td align="right" style="width: 100px">科目代码：</td>
							<td>
								<input name="xmErpCode" class="nui-textbox" style="width: 200px" />
							</td>
							<td align="right" style="width: 130px">ERP预算及会计科目：</td>
							<td>
								<input name="xmErpName" class="nui-textbox" style="width: 400px" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 100px">说明：</td>
							<td colspan="3">
								<input name="xmErpRemark" class="nui-textarea" style="width: 100%; height: 50px" />
							</td>
						</tr>
					</table>
				</div>
			</fieldset>
		</form>
	</div>

	<div style="text-align: center; padding: 5px; margin-bottom: 1px" class="nui-toolbar">
		<a id="saveBtn" class="nui-button" onclick="save()" style="width: 60px; margin-right: 20px;" iconCls="icon-save">保存</a>
		<a id="closeBtn" class="nui-button" onclick="closeCancel()" style="width: 60px;" iconCls="icon-close">关闭</a>
	</div>

	<script type="text/javascript">
		nui.parse();
		var form = new nui.Form("editForm");

		function setEditData(data) {
			form.setData(data);
		}

		function save() {
			if (!form.validate()) {
				showTips("请检查表单的完整性!", "danger");
				return;
			}
			nui.confirm("确定保存数据吗？", "系统提示", function(action) {
				if (action == "ok") {
					nui.get("saveBtn").disable();
					nui.get("closeBtn").disable();
					nui.mask({
						el : document.body,
						cls : 'mini-mask-loading',
						html : '表单保存中...'
					});
					setTimeout(function() {
						nui.unmask(document.body);
						var formData = form.getData();
						var json = nui.encode({
							"ledgerAccount" : formData
						});
						ajaxCommon({
							"url" : "com.zhonghe.ame.finance.ledgerAccount.editLedgerAccount.biz.ext",
							data : json,
							contentType : 'text/json',
							success : function(text) {
								if (text.result == "1") {
									showTips("保存成功");
									closeOk();
								} else {
									nui.get("saveBtn").enable();
									nui.get("closeBtn").enable();
								}
							}
						});
					}, 2000);
				}
			});
		}
	</script>

</body>
</html>