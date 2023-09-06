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
<title>付费合同 - 累计已支付调整</title>
</head>
<body>
	<div class="nui-fit" style="padding: 5px;">
		<fieldset id="field1" style="border: solid 1px #aaa;">
			<legend>合同最终金额 - 合同余额 = 累计已支付</legend>
			<form id="form1" method="post">
				<input id="id" class="nui-hidden" name="id" />
				<table style="table-layout: fixed;">
					<tr>
						<td align="right" style="width: 130px">合同最终金额（元）：</td>
						<td>
							<input id="finalSum" name="finalSum" class="nui-textbox" vtype="float" required="true" />
						</td>
					</tr>
					<tr>
						<td align="right" style="width: 130px">合同余额（元）：</td>
						<td>
							<input id="contractBalance" name="contractBalance" class="nui-textbox" vtype="float" required="true" />
						</td>
					</tr>
				</table>
			</form>
		</fieldset>

		<div style="padding: 5px; border: solid 1px #aaa; text-align: center; margin: 2px" class="nui-toolbar">
			<a class="nui-button" onclick="onOk()" id="creatReimbProcess" style="width: 80px;" iconCls="icon-ok">确定</a>
			<a class="nui-button" onclick="onCancel()" id="saveReimbProcess" style="width: 80px; margin-left: 56px" iconCls="icon-close">关闭</a>
		</div>

	</div>

	<script type="text/javascript">
		nui.parse();
		var form1 = new nui.Form("form1");

		function setEditData(data) {
			nui.get("id").setValue(data.id);
			nui.get("finalSum").setValue(data.finalSum);
			nui.get("contractBalance").setValue(data.contractBalance);
		}

		function onCancel(e) {
			CloseWindow("cancel");
		}

		//标准方法接口定义
		function CloseWindow(action) {
			if (window.CloseOwnerWindow) {
				return window.CloseOwnerWindow(action);
			} else {
				window.close();
			}
		}

		function onOk() {
			if (!form1.validate()) {
				showTips("请检查表单的完整性!", "danger");
				return;
			}
			var data = form1.getData();
			var json = nui.encode(data);
			nui.ajax({
				url : "com.zhonghe.ame.chargeContract.chargeContract.ljyzfPayContractSave.biz.ext",
				type : 'POST',
				data : json,
				contentType : 'text/json',
				success : function(o) {
					if (o.result == 1) {
						showTips("累计已支付调整成功");
						CloseWindow("ok");
					} else {
						showTips("累计已支付调整失败，请联系信息技术部人员！", "danger");
					}
				}
			});
		}
	</script>

</body>
</html>