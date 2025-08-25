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
<title>四、总部管理费分摊 - 配置</title>
</head>
<body>
	<div class="nui-fit" style="padding: 5px;">
		<fieldset id="field1" style="border: solid 1px #aaa;">
			<legend>总部管理费分摊 - 比例设置</legend>
			<form id="configForm" method="post">
				<input id="allocatId" name="id" class="nui-hidden" />
				<div style="padding: 5px;">
					<table style="table-layout: fixed;">
						<tr>
							<td align="right" style="width: 90px">分摊比例(%)：</td>
							<td>
								<input id="shareProportion" name="share_proportion" class="mini-spinner" style="width: 150px" required="true" />
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
		var form = new nui.Form("configForm");

		function initData(data) {
			console.log(data);
			if (data.viewStatus) {
				nui.get("shareProportion").setEnabled(false);
				$("#saveBtn").hide();
			}
			nui.get("allocatId").setValue(data.id);
			nui.get("shareProportion").setValue(data.share_proportion);
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
					var formData = form.getData();
					formData.update_name = userName;
					var json = nui.encode({
						"feeAllocation" : formData
					});
					ajaxCommon({
						"url" : "com.zhonghe.ame.finance.budgetFilling.saveManagementFeeAllocation.biz.ext",
						data : json,
						contentType : 'text/json',
						success : function(text) {
							nui.unmask(document.body);
							if (text.result == "1") {
								showTips("保存成功");
								closeOk();
							} else {
								nui.get("saveBtn").enable();
								nui.get("closeBtn").enable();
							}
						}
					});
				}
			});
		}
	</script>

</body>
</html>