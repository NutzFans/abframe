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
<title>新增单位年度目标值及门槛值</title>
</head>
<body>
	<div class="nui-fit" style="padding: 5px">
		<form id="form" method="post">
			<div style="padding: 5px;">
				<table style="table-layout: fixed;">
					<tr>
						<td align="right" style="width: 130px">年份：</td>
						<td>
							<input name="years" id="years" class="nui-textbox" vtype="int" style="width: 250px" required="true" emptyText="格式：YYYY" />
						</td>
					</tr>
					<tr>
						<td align="right" style="width: 130px">单位：</td>
						<td>
							<input name="secOrg" id="secOrg" class="nui-dictcombobox" dictTypeId="ZH_OPERATION_INCOME_ORG" style="width: 250px" required="true" />
						</td>
					</tr>
					<tr>
						<td align="right" style="width: 130px">目标值（集团内）：</td>
						<td>
							<input name="nTargetValue" id="nTargetValue" class="nui-textbox" vtype="float" style="width: 250px" required="true" />
						</td>
					</tr>
					<tr>
						<td align="right" style="width: 130px">门槛值（集团内）：</td>
						<td>
							<input name="nThresholdValue" id="nThresholdValue" class="nui-textbox" vtype="float" style="width: 250px" required="true" />
						</td>
					</tr>
					<tr>
						<td align="right" style="width: 130px">目标值（集团外）：</td>
						<td>
							<input name="wTargetValue" id="wTargetValue" class="nui-textbox" vtype="float" style="width: 250px" required="true" />
						</td>
					</tr>
					<tr>
						<td align="right" style="width: 130px">门槛值（集团外）：</td>
						<td>
							<input name="wThresholdValue" id="wThresholdValue" class="nui-textbox" vtype="float" style="width: 250px" required="true" />
						</td>
					</tr>
				</table>
			</div>
		</form>
	</div>

	<div style="text-align: center; position: relative; bottom: 0px" class="nui-toolbar">
		<a class="nui-button" onclick="onOk()" id="creatReimbProcess" style="width: 80px;" iconCls="icon-save">保存</a>
		<a class="nui-button" onclick="closeCancel()" id="saveReimbProcess" style="width: 80px;" iconCls="icon-close">关闭</a>
	</div>

	<script type="text/javascript">
		nui.parse();
		var form = new nui.Form("#form");

		function onOk() {
			var data = form.getData();
			var json = nui.encode(data);
			if (!form.validate()) {
				showTips("请检查表单的完整性!", "danger");
				return;
			}
			ajaxCommon({
				"url" : "com.zhonghe.ame.contractPact.statisticalReport.addOrgDimThreshold.biz.ext",
				"data" : json,
				"success" : function(data) {
					if (data.result == "0") {
						showTips("新增成功");
						closeOk();
					} else if (data.result == "1") {
						showTips("该单位在该年度已配置目标值及门槛值！", "danger");
					} else {
						showTips("新增失败，请联系管理员！", "danger");
					}
				}
			});
		}
	</script>

</body>
</html>