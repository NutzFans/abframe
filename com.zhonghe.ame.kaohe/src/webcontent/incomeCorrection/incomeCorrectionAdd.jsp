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

.mini-grid-cell-nowrap {
	white-space: nowrap;
}
</style>
<head>
<title>考核收入修正 - 新增</title>
</head>
<body>
	<div class="nui-fit" style="padding: 5px;">
		<fieldset id="field1" style="border: solid 1px #aaa;">
			<legend>考核收入修正 - 新增</legend>
			<form id="addForm" method="post">
				<div style="padding: 5px;">
					<table style="table-layout: fixed;">
						<tr>
							<td align="right" style="width: 100px">扣减年份：</td>
							<td>
								<input id="years" name="years" class="nui-combobox" style="width: 260px" required="true" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 100px">扣减单位：</td>
							<td>
								<input id="secondaryOrg" name="secondaryOrg" class="nui-combobox" textField="secOrgname" valueField="secOrg" style="width: 260px" required="true" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 100px">修正类型：</td>
							<td>
								<input name="correctionType" class="nui-dictcombobox" dictTypeId="correction_type" style="width: 260px" required="true" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 100px">集团内外：</td>
							<td>
								<input name="headquarterGroup" class="nui-dictcombobox" dictTypeId="ZH_GROUP" style="width: 260px" required="true" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 100px">修正金额(元)：</td>
							<td>
								<input name="amount" class="nui-textbox" style="width: 260px" required="true" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 100px">备注：</td>
							<td>
								<input id="remark" name="remark" class="nui-textarea" style="width: 260px; height: 50px" />
							</td>
						</tr>
					</table>
				</div>
			</form>
		</fieldset>
	</div>

	<div style="text-align: center; padding: 5px; margin-bottom: 1px" class="nui-toolbar">
		<a id="saveBtn" class="nui-button" onclick="save()" style="width: 60px; margin-right: 20px;" iconCls="icon-save">保存</a>
		<a id="closeBtn" class="nui-button" onclick="closeCancel()" style="width: 60px;" iconCls="icon-close">关闭</a>
	</div>

	<script type="text/javascript">
		nui.parse();
		var form = new nui.Form("addForm");

		init();

		function init() {
			initYearCombobox();
			initSecOrgCombobox();
		}

		function initYearCombobox() {
			var year = new Date().getFullYear();
			var yeariterm = [];
			for (var i = -2; i < 5; i++) {
				yeariterm.push({
					"id" : year + i,
					"text" : year + i
				});
			}
			nui.get("years").setData(yeariterm);
		}

		function initSecOrgCombobox() {
			ajaxCommon({
				"url" : "com.zhonghe.ame.kaohe.common.getBusSecOrgList.biz.ext",
				contentType : 'text/json',
				success : function(result) {
					var datas = result.secOrgList;
					nui.get("secondaryOrg").setData(datas);
				}
			});
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
							"incomeCorrection" : formData
						});
						ajaxCommon({
							"url" : "com.zhonghe.ame.kaohe.incomeCorrection.addIncomeCorrection.biz.ext",
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