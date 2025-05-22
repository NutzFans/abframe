<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<head>
<title>小额采购及立项申请</title>
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
			<legend> 小额采购及立项申请 </legend>
			<form id="form1" method="post">
				<input name="files" id="fileids" class="nui-hidden" />
				<input name="id" id="id" class="nui-hidden" />
				<div style="padding: 5px;">
					<table style="table-layout: fixed;">
						<tr>
							<td align="right" style="width: 140px">小额采购名称：</td>
							<td colspan="2">
								<input name="purchaseName" id="purchaseName" class="nui-textbox" required="true" style="width: 400px" required="true" enabled="false" />
							</td>
							<td align="right" style="width: 140px">采购单位：</td>
							<td>
								<input name="createdOrgname" id="createdOrgname" class="nui-textbox" required="true" style="width: 200px;" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 140px">
								合同名称
								<span style="color: red;">(若有)</span>
								：
							</td>
							<td colspan="2">
								<input name="contract" id="contract" class="nui-textbox" style="width: 100%;" enabled="false" />
							</td>
							<td align="right" style="width: 140px">总金额(万元)：</td>
							<td>
								<input name="totalAmount" id="totalAmount" style="width: 100%" class="nui-textbox" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 140px">供方/乙方/承包人全称：</td>
							<td colspan="2">
								<input name="contractor" id="contractor" class="nui-textbox" required="true" style="width: 100%;" enabled="false" />
							</td>
							<td align="right" style="width: 140px">预计采购时间：</td>
							<td>
								<input name="purchaseDate" id="purchaseDate" class="nui-datepicker" style="width: 100%" required="true" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 140px">是否为科研项目：</td>
							<td colspan="2">
								<input name="keYanProject" id="keYanProject" class="nui-dictcombobox" dictTypeId="ZH_YN" style="width: 100%;" required="true" enabled="false" />
							</td>
							<td align="right" style="width: 140px">是否有采购计划：</td>
							<td>
								<input name="isPlan" id="isPlan" class="nui-dictcombobox" dictTypeId="ZH_YN" style="width: 200px" required="true" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 170px">一体化平台采购需求计划编码：</td>
							<td colspan="5">
								<input name="ydhptXqjhCode" id="ydhptXqjhCode" class="nui-textbox" style="width: 100%;" required="true" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 140px">申请原因、市场调研情况或比价情况：</td>
							<td colspan="5">
								<input style="width: 100%; height: 120px;" name="applyReason" class="nui-textarea" id="remark" required="true" enabled="false" />
							</td>
						</tr>
					</table>
				</div>
			</form>
		</fieldset>

		<fieldset id="field3" style="border: solid 1px #aaa;">
			<legend> 明细 </legend>
			<div id="grid_traveldetail" class="nui-datagrid" style="width: 100%; height: auto;" allowCellSelect="true" showPager="false" allowCellEdit="false" multiSelect="true" dataField="purZeroItem"
				url="com.zhonghe.ame.purchase.purchaseItems.queryPurZeroItem.biz.ext">
				<div property="columns">
					<div field="ythptWlCode" width="130" align="center" headerAlign="center" vtype="required">
						物料编码
						<input id="ythptWlCode" name="ythptWlCode" property="editor" class="nui-textbox" required="true" style="width: 100%" />
					</div>
					<div field="itemName" width="130" align="center" headerAlign="center">
						采购物项名称
						<input id="itemName" name="itemName" property="editor" class="nui-textbox" enabled="false" style="width: 100%" />
					</div>
					<div field="brandSpec" width="130" align="center" headerAlign="center">
						品牌/型号/规格
						<input id="brandSpec" name="brandSpec" property="editor" class="nui-textbox" enabled="false" style="width: 100%" />
					</div>
					<div field="unit" displayField="unit" width="130" align="center" headerAlign="center">
						单位
						<input name="unit" property="editor" class="nui-textbox" enabled="false" style="width: 100%" />
					</div>
					<div field="onePrice" width="130" align="center" headerAlign="center">
						单价(万元)
						<input id="onePrice" name="onePrice" property="editor" class="nui-spinner" minValue="0" maxValue="999999999" enabled="false" style="width: 100%" />
					</div>
					<div field="num" width="130" align="center" headerAlign="center">
						数量
						<input id="num" name="num" property="editor" class="nui-spinner" minValue="0" maxValue="999999999" enabled="false" style="width: 100%" />
					</div>
					<div field="totalPrice" width="130" align="center" headerAlign="center">
						总价(万元)
						<input id="totalPrice" name="totalPrice" property="editor" class="nui-textbox" enabled="false" style="width: 100%" />
					</div>
				</div>
			</div>
		</fieldset>

		<fieldset id="field2" style="border: solid 1px #aaa;">
			<legend>附件</legend>
			<jsp:include page="/ame_common/detailFile.jsp" />
		</fieldset>

	</div>

	<script type="text/javascript">
		nui.parse();
		var form = new nui.Form("#form1");
		var grid_traveldetail = nui.get("grid_traveldetail");
		var processid = <%=request.getParameter("processid")%>;
		if (processid == null) {
			processid = <%=request.getParameter("processInstID")%>;
		}
		
		init();
		
		function init() {
			var json = nui.encode({
				"processid" : processid
			});
			nui.ajax({
				url : "com.zhonghe.ame.purchase.purchaseItems.queryPurZeroDetail.biz.ext",
				type : 'POST',
				data : json,
				success : function(o) {
					form.setData(o.purZero);
					form.setEnabled(false);

					// 查询明细
					var jsonData = {
						"zeroId" : o.purZero.id
					}
					grid_traveldetail.load(jsonData);

					// 查询附件
					var grid_0 = nui.get("grid_0");
					grid_0.load({
						"groupid" : "purchaseZero",
						"relationid" : o.purZero.id
					});
					grid_0.sortBy("fileTime", "desc");
				}
			});
		}
	</script>

</body>
</html>