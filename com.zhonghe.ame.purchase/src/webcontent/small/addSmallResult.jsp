<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<head>
<title>小额采购结果确认申请</title>
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
</head>
<body>
	<div class="nui-fit" style="padding: 5px;">
		<fieldset id="field1" style="border: solid 1px #aaa;">
			<legend>小额采购 - 结果确认申请</legend>
			<form id="form1" method="post">
				<input name="zeroId" id="zeroId" class="nui-hidden" />
				<input name="files" id="fileids" class="nui-hidden" />
				<div style="padding: 5px;">
					<table style="table-layout: fixed;">
						<tr>
							<td align="right" style="width: 140px">小额采购编号：</td>
							<td colspan="2">
								<input id="purchaseCode" name="purchaseCode" class="nui-buttonedit" onbuttonclick="onButtonEdit" style="width: 400px" required="true" enabled="true" allowInput="false"
									emptyText="点击右侧按钮，通过弹出框选择" />
							</td>
							<td align="right" style="width: 140px">采购单位：</td>
							<td>
								<input name="secondaryOrg" id="secondaryOrg" class="nui-hidden" />
								<input name="secondaryOrgname" id="secondaryOrgname" class="nui-textbox" style="width: 200px;" readonly="readonly" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 140px">小额采购名称：</td>
							<td colspan="2">
								<input name="purchaseName" id="purchaseName" class="nui-textbox" style="width: 100%;" readonly="readonly" />
							</td>
							<td align="right" style="width: 140px">立项金额(万元)：</td>
							<td>
								<input name="totalAmount" id="totalAmount" style="width: 100%" class="nui-textbox" readonly="readonly" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 140px">供方/乙方/承包人全称：</td>
							<td colspan="2">
								<input name="contractor" id="contractor" class="nui-textbox" style="width: 100%;" readonly="readonly" />
							</td>
							<td align="right" style="width: 140px">预计采购时间：</td>
							<td>
								<input name="purchaseDate" id="purchaseDate" class="nui-datepicker" style="width: 100%" readonly="readonly" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 140px">是否为科研项目：</td>
							<td colspan="2">
								<input name="keYanProject" id="keYanProject" class="nui-dictcombobox" dictTypeId="ZH_YN" style="width: 100%;" readonly="readonly" />
							</td>
							<td align="right" style="width: 140px">是否已有年度采购计划：</td>
							<td>
								<input name="isPlan" id="isPlan" class="nui-dictcombobox" dictTypeId="ZH_YN" style="width: 200px" readonly="readonly" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 140px">一体化平台计划编码：</td>
							<td colspan="2">
								<input name="ydhptXqjhCode" id="ydhptXqjhCode" class="nui-textbox" style="width: 100%;" readonly="readonly" />
							</td>
							<td align="right" style="width: 140px">最终成交金额(万元)：</td>
							<td>
								<input name="finalAmount" id="finalAmount" style="width: 100%" class="nui-textbox" required="true"/>
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 140px">申请原因、市场调研情况或比价情况：</td>
							<td colspan="5">
								<input style="width: 100%; height: 120px;" id="applyReason" name="applyReason" class="nui-textarea" id="remark" readonly="readonly" />
							</td>
						</tr>
					</table>
				</div>
			</form>
		</fieldset>

		<fieldset id="field3" style="border: solid 1px #aaa;">
			<legend>立项明细</legend>
			<div id="grid_traveldetail" class="nui-datagrid" style="width: 100%; height: auto;" allowCellSelect="true" showPager="false" allowCellEdit="false" multiSelect="true" dataField="purZeroItem"
				url="com.zhonghe.ame.purchase.purchaseItems.queryPurZeroItem.biz.ext">
				<div property="columns">
					<div field="ythptWlCode" width="130" align="center" headerAlign="center" vtype="required">
						物料编码
						<input id="ythptWlCode" name="ythptWlCode" property="editor" class="nui-textbox" enabled="false" />
					</div>
					<div field="itemName" width="130" align="center" headerAlign="center" vtype="required">
						采购物项名称
						<input id="itemName" name="itemName" property="editor" class="nui-textbox" enabled="false" />
					</div>
					<div field="brandSpec" width="130" align="center" headerAlign="center">
						品牌/型号/规格
						<input id="brandSpec" name="brandSpec" property="editor" class="nui-textbox" enabled="false" />
					</div>
					<div field="unit" displayField="unit" width="130" align="center" headerAlign="center">
						单位
						<input name="unit" property="editor" class="nui-textbox" enabled="false" />
					</div>
					<div field="onePrice" width="130" align="center" headerAlign="center" vtype="required">
						单价(万元)
						<input id="onePrice" name="onePrice" property="editor" class="nui-spinner" minValue="0" maxValue="999999999" enabled="false" />
					</div>
					<div field="num" width="130" align="center" headerAlign="center" vtype="required">
						数量
						<input id="num" name="num" property="editor" class="nui-spinner" minValue="0" maxValue="999999999" enabled="false" />
					</div>
					<div field="totalPrice" width="130" align="center" headerAlign="center">
						总价(万元)
						<input id="totalPrice" name="totalPrice" property="editor" class="nui-textbox" enabled="false" />
					</div>
				</div>
			</div>
		</fieldset>

		<fieldset id="field2" style="border: solid 1px #aaa;">
			<legend>立项附件</legend>
			<jsp:include page="/ame_common/detailFile.jsp" />
		</fieldset>
		
		<fieldset id="field4" style="border: solid 1px #aaa;">
			<legend>结果确认 - 上传附件</legend>
			<jsp:include page="/ame_common/inputFileExpand.jsp" />
		</fieldset>

	</div>

	<div style="text-align: center; position: relative; bottom: 10px" class="nui-toolbar">
		<a class="nui-button" onclick="onOk()" id="creatReimbProcess" iconCls="icon-ok" style="width: 80px; margin-right: 20px;">提交</a>
		<a class="nui-button" onclick="closeCancel" id="saveReimbProcess" iconCls="icon-close" style="width: 80px; margin-right: 140px;">关闭</a>
	</div>

	<script type="text/javascript">
		nui.parse();
		var form = new nui.Form("#form1");
		var grid_traveldetail = nui.get("grid_traveldetail");

		init();

		function init() {
			getSecOrg(userOrgId);
		}

		function getSecOrg(userOrgId) {
			var json = nui.encode({
				'userOrgId' : userOrgId
			});
			ajaxCommon({
				url : "com.primeton.eos.common.orgUtils.getSecOrg.biz.ext",
				data : json,
				success : function(result) {
					var data = result.data;
					nui.get("secondaryOrg").setValue(data.ORGID);
					nui.get("secondaryOrgname").setValue(data.ORGNAME);
				}
			});
		}

		function onButtonEdit(e) {
			var btnEdit = this;
			mini.open({
				url : "/default/purchase/small/zeroPurchaseList.jsp",
				title : "选择小额采购 - 小额采购信息",
				width : '1200',
				height : '610',
				ondestroy : function(action) {
					if (action == "ok") {
						var iframe = this.getIFrameEl();
						var data = iframe.contentWindow.GetData();
						data = mini.clone(data); //必须
						if (data) {
							btnEdit.setValue(data.purchaseCode);
							btnEdit.setText(data.purchaseCode);
							nui.get("zeroId").setValue(data.id);
							nui.get("purchaseName").setValue(data.purchaseName);
							nui.get("totalAmount").setValue(data.totalAmount);
							nui.get("contractor").setValue(data.contractor);
							nui.get("purchaseDate").setValue(data.purchaseDate);
							nui.get("keYanProject").setValue(data.keYanProject);
							nui.get("isPlan").setValue(data.isPlan);
							nui.get("ydhptXqjhCode").setValue(data.ydhptXqjhCode);
							nui.get("applyReason").setValue(data.applyReason);
							var jsonData = {
								"zeroId" : data.id
							}
							grid_traveldetail.load(jsonData);
							// 查询附件
							var grid_0 = nui.get("grid_0");
							grid_0.load({
								"groupid" : "purchaseZero",
								"relationid" : data.id
							});
							grid_0.sortBy("fileTime", "desc");
						}
					}
				}
			});
		}

		function onOk(e) {
			if (!form.validate()) {
				showTips("请检查表单的完整性!", "danger");
				return;
			}
				// 已上传的文件数量
				var gridFileCount = nui.get("inputFileExpandGrid").getData().length;
				if(gridFileCount == 0){
					// 刚新增(未上传)的文件数量
					var newFileCount = document.getElementsByName("uploadfile").length;
					if(newFileCount == 0){
						showTips("请上传相关附件", "danger");
						return;
					}
				}			
			nui.confirm("确定提交流程表单？", "系统提示", function(action) {
				if (action == "ok") {
					nui.get("creatReimbProcess").disable();
					nui.mask({
						el : document.body,
						cls : 'mini-mask-loading',
						html : '表单提交中...'
					});
					document.getElementById("fileCatalog").value = "smallResult";
					inputFileExpandForm.submit();
				}
			});
		}
		
		function SaveData() {
					var formData = form.getData();
					formData.files = nui.get("fileids").getValue();
					var json = nui.encode({
						"smallResult" : formData
					});
					ajaxCommon({
						"url" : "com.zhonghe.ame.purchase.small.addSmallResult.biz.ext",
						data : json,
						contentType : 'text/json',
						success : function(text) {
							nui.unmask(document.body);
							if (text.result == "1") {
								showTips("操作成功");
								closeOk();
							} else {
								nui.get("creatReimbProcess").enable();
							}
						}
					});
		}		
		
	</script>

</body>
</html>