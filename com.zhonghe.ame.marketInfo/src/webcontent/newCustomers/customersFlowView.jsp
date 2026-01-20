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
<title>客户信息 - 流程查看</title>
</head>
<body>
	<div class="nui-fit" style="padding: 5px;">
		<fieldset id="field1" style="border: solid 1px #aaa;">
			<legend>客户信息</legend>
			<form id="flowForm" method="post">
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
								<input name="custname" class="nui-textbox" style="width: 100%" readonly="readonly" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 70px">客户类型：</td>
							<td colspan="3">
								<input name="custtype" class="nui-dictcombobox" dictTypeId="CUSTOMER_TYPE" style="width: 100%" readonly="readonly" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 110px">统一社会信用代码：</td>
							<td colspan="3">
								<input name="custnum" class="nui-textbox" style="width: 100%" readonly="readonly" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 70px">所属省份：</td>
							<td colspan="3">
								<input name="provinces" class="nui-dictcombobox" dictTypeId="AME_PROVINCE" style="width: 100%" readonly="readonly" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 70px">集团内/外：</td>
							<td colspan="3">
								<input name="outsideGroup" class="nui-dictcombobox" dictTypeId="ZH_GROUP_NEW" style="width: 100%" readonly="readonly" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 70px">境内/外：</td>
							<td colspan="3">
								<input name="overseasCustomer" class="nui-dictcombobox" dictTypeId="ZH_OVERSEAS" style="width: 100%" readonly="readonly" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 70px">备注：</td>
							<td colspan="3">
								<input name="remarks" class="nui-textarea" style="width: 100%; height: 100px" readonly="readonly" />
							</td>
						</tr>
					</table>
				</div>
			</form>
		</fieldset>
	</div>

	<script type="text/javascript">
		nui.parse();
		var flowForm = new nui.Form("#flowForm");
		var processId = <%=request.getParameter("processInstID")%>;

		init();

		function init() {
			var data = {
				"processId" : processId
			};
			var json = nui.encode(data);
			ajaxCommon({
				url : "com.zhonghe.ame.marketInfo.marketinfo.khxx.newCustomers.queryCustInfoById.biz.ext",
				data : json,
				success : function(result) {
					flowForm.setData(result.mainData);
				}
			});
		}				
		
	</script>

</body>
</html>