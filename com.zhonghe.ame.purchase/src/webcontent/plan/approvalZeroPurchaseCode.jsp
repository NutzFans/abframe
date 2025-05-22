<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<%
	long workitemid = (Long) request.getAttribute("workItemID");
%>
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
								<input name="ydhptXqjhCode" id="ydhptXqjhCode" class="nui-textbox" style="width: 100%;" required="true" emptyText="一体化平台采购需求计划编码" />
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
			<legend>
				明细
				<span style="color: red;">(请补充物料编码)</span>
			</legend>
			<div id="grid_traveldetail" class="nui-datagrid" style="width: 100%; height: auto;" allowCellSelect="true" showPager="false" allowCellEdit="true" multiSelect="true" dataField="purZeroItem"
				url="com.zhonghe.ame.purchase.purchaseItems.queryPurZeroItem.biz.ext">
				<div property="columns">
					<div field="ythptWlCode" width="130" align="center" headerAlign="center" vtype="required">
						物料编码
						<input id="ythptWlCode" name="ythptWlCode" property="editor" class="nui-textbox" required="true" style="width: 100%"/>
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

		<jsp:include page="/ame_common/misOpinion_Freeflow.jsp" />

	</div>

	<div style="text-align: center; position: relative; bottom: 10px" class="nui-toolbar">
		<a class="nui-button" onclick="countersign()" id="countersign" iconCls="icon-user" style="width: 80px; margin-right: 20px;">加签</a>
		<a class="nui-button" onclick="submit" id="creatReimbProcess" style="width: 60px; margin-right: 20px;">提交</a>
		<a class="nui-button" onclick="closeCancel" style="width: 60px;">关闭</a>
	</div>

	<script type="text/javascript">
		nui.parse();
		var form = new nui.Form("#form1");
		var opioionform = new nui.Form("opioionform");
		var grid_traveldetail = nui.get("grid_traveldetail");
		var titleText, countersignUsers;

		init();

		function init() {
			var data = {
				workitemid :<%=workitemid%>
			};
			var json = nui.encode(data);
			nui.ajax({
				url : "com.zhonghe.ame.purchase.purchaseItems.queryPurZeroDetail.biz.ext",
				type : 'POST',
				data : json,
				success : function(o) {
					var workItemInfo = o.workitem;
					form.setData(o.purZero);
					var grid = nui.get("datagrid1");
					grid.load({
						processInstID : o.purZero.processid
					});
					grid.sortBy("time", "desc");
					//初始化处理意见
					initMisOpinion({
						auditstatus : "1"
					});
					nui.get("backTo").setData(o.seal.backList);
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
					if (workItemInfo.workItemName == '采购需求单位补充一体化平台采购计划') {
						nui.alert("提交前需知：<br>请在集团一体化平台补充小额采购计划<br>(路径：一体化平台-我的系统-采购计划管理-采购计划需求管理)。<br>本表单中补充采购需求计划编号、物料编码。<br>采购需求单位需在集采委托机构完成一体化平台组包后开展小额采购，<br>开具发票或签订合同后，需将发票或合同发送至企业发展部联系人邮箱，<br>以便集采委托机构完善一体化平台订单信息。");
					}
				}
			});
		}

		function countersign() {
			selectOmEmployee();
		}

		function selectOmEmployee() {
			var btnEdit = this;
			nui.open({
				url: "<%=request.getContextPath()%>/contractPact/selectUsers.jsp",
				title : "选择加签人员",
				width : 430,
				height : 400,
				ondestroy : function(action) {
					var user, users = "【";
					countersignUsers = [];
					if (action == "ok") {
						var iframe = this.getIFrameEl();
						var data = iframe.contentWindow.GetData();
						data = nui.clone(data); //必须
						if (data) {
							for (var i = 0; i < data.length; i++) {
								user = {};
								user.id = data[i].userid
								user.name = data[i].empname
								user.typeCode = "person"
								countersignUsers.push(user);
								if (i == 0) {
									users = users + data[i].empname;
								} else {
									users = users + "," + data[i].empname;
								}
							}
							users = users + "】";
							titleText = "增加审批人员" + users + "并提交";
							submitProcess(titleText);
						}
					}
				}
			});
		}

		function submit() {
			var auditstatus = nui.get("auditstatus").getValue();
			if (auditstatus == "2") { //终止流程
				submitProcess("终止");
			} else if (auditstatus == "0") { //退回流程
				if (!nui.get("backTo").getValue()) {
					showTips("退回环节不能为空！");
					return;
				}
				submitProcess("退回");
			} else if (auditstatus == "1") { //提交流程
				grid_traveldetail.validate();
				if (grid_traveldetail.isValid() == false) {
					var error = grid_traveldetail.getCellErrors()[0];
					grid_traveldetail.beginEditCell(error.record, error.column);
					showTips("请补充物料编码!", "danger");
					return;
				}
				
				var checkWuLiao = false;
				var tempDatas = grid_traveldetail.data;
				if(tempDatas){
					var wuLiaoCodes = tempDatas.map(tempData => tempData.ythptWlCode);
					var json = {"wuLiaoCodes" : wuLiaoCodes}
					ajaxCommon({
						url : "com.zhonghe.ame.purchase.purchaseItems.checkWuLiao.biz.ext",
						async : false,
						data : json,
						contentType : 'text/json',
						success : function(result) {
							if (result.data != "success") {
								showTips(result.data, "danger");
								checkWuLiao = true;
							}
						}
					});
				}
				if(checkWuLiao){
					return;
				}
				
				if (!form.validate()) {
					showTips("请检查表单的完整性!", "danger");
					return;
				}
				submitProcess("提交");
			}
		}
		
		function submitProcess(title) {
			nui.confirm("确定" + title + "流程吗？", "操作提示", function(action) {
				if (action == "ok") {
					nui.get("countersign").disable();
					nui.get("creatReimbProcess").disable();
					nui.mask({
						el : document.body,
						cls : 'mini-mask-loading',
						html : '表单提交中...'
					});
					SaveData();
				}
			});
		}		

		function SaveData() {
			setTimeout(function() {
				nui.unmask(document.body);
				var misOpinion = opioionform.getData().misOpinion;
				var data = form.getData();
				var gridData = grid_traveldetail.getData();
				data.files = nui.get("fileids").getValue();
				var json = {
					"misOpinion" : misOpinion,
					"workItemID" :<%=workitemid%>,
					"countersignUsers" : countersignUsers,
					"purZero" : data,
					"purZeroItem" : gridData
				};
				ajaxCommon({
					url : "com.zhonghe.ame.purchase.purchaseItems.approvalPurZero.biz.ext",
					data : json,
					contentType : 'text/json',
					success : function(o) {
						if (o.result == "success") {
							showTips("提交成功");
							closeOk();
						} else {
							nui.get("countersign").enable();
							nui.get("creatReimbProcess").enable();
						}
					}
				});
			}, 2000);		
		}
	</script>

</body>
</html>