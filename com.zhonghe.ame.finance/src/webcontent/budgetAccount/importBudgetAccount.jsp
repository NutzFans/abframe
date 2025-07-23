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
<title>预算主体 - 导入</title>
</head>
<body>
	<div class="nui-fit" style="padding: 5px;">
		<fieldset style="border: solid 1px #aaa;">
			<legend>&nbsp;选中Excel文件导入&nbsp;</legend>
			<form id="importForm" method="post" enctype="multipart/form-data">
				<div style="padding: 5px;">
					<table style="table-layout: fixed;">
						<tr>
							<td align="right" style="width: 100px">选择Excel文件：</td>
							<td>
								<input name="excelFile" class="nui-htmlfile" style="width: 250px" required="true" limitType="*.xls;*.xlsx" />
							</td>
						</tr>
					</table>
				</div>
			</form>
		</fieldset>
	</div>

	<div style="text-align: center; padding: 5px; margin-bottom: 1px" class="nui-toolbar">
		<a id="importBtn" class="nui-button" onclick="updateImport()" style="width: 60px; margin-right: 20px;" iconCls="icon-upload">导入</a>
		<a id="closeBtn" class="nui-button" onclick="closeCancel()" style="width: 60px;" iconCls="icon-close">关闭</a>
	</div>

	<script type="text/javascript">
		nui.parse();		
		var contextPath = "<%=request.getContextPath()%>";
		var form = new nui.Form("importForm");

		function updateImport() {
			if (!form.validate()) {
				showTips("请选择Excel格式文件!", "danger");
				return;
			}
			document.getElementById('importForm').action = contextPath + '/com.zhonghe.ame.finance.importBudgetAccount.flow';
			document.getElementById('importForm').submit();
		}
	</script>

</body>
</html>