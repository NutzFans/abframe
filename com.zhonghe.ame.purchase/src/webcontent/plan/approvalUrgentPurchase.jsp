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

.mini-grid-summaryCell {
	text-align: center;
}
</style>
<head>
</head>
<body>
	<%
		long workitemid = (Long) request.getAttribute("workItemID");
	%>
	<div class="nui-fit">
		<div class="mini-panel" title="" style="width: 100%;">
			<fieldset id="field1" style="border: solid 1px #aaa; padding: 3px; width: 99%;">
				<legend>紧急采购信息</legend>
				<form id="form1" method="post">
					<div style="padding: 5px; margin-left: 5%;">
						<table style="table-layout: fixed;" id="table_file">
							<tr>
								<td align="right" style="width: 100px">紧急采购名称：</td>
								<td>
									<input id="purchaseName" name="purchaseName" class="nui-textbox" required="true" style="width: 200px;" />
								</td>
								<td align="right" style="width: 100px">紧急采购编号：</td>
								<td>
									<input id="purchaseCode" name="purchaseCode" class="nui-textbox" required="true" style="width: 200px;" />
								</td>
							</tr>
							<tr>
								<td align="right" style="width: 60px">采购单位：</td>
								<td>
									<input id="createdOrgname" class="nui-textbox" required="true" style="width: 200px;" readonly="readonly" />
								</td>
								<td align="right" style="width: 100px">合同发包方式：</td>
								<td>
									<input id="contrctType" name="contrctType" class="nui-dictcombobox" dictTypeId="ZH_CGFS" required="true" style="width: 200px;" />
								</td>
							</tr>
							<tr>
								<td align="right" style="width: 100px">申请原因：</td>
								<td colspan="6">
									<input style="width: 815px; height: 120px;" name="applyReason" class="nui-textarea" id="remark" required="true" />
								</td>
							</tr>
						</table>
					</div>
				</form>

				<fieldset style="height: 100%; border: solid 1px #aaa; padding: 3px; width: 99%;">
					<div class="fieldset-body" style="width: 100%; height: 100%; margin: 0px auto">
						<div id="grid_traveldetail" class="nui-datagrid" style="width: 99%; height: auto;" allowCellSelect="true" showPager="false" allowCellEdit="true" multiSelect="true" dataField="purUrgentItem"
							url="com.zhonghe.ame.purchase.purchaseItems.queryPurUrgentItem.biz.ext">
							<div property="columns">
								<div field="firstitemvalue" width="100" align="center" headerAlign="center">
									采购物项大类名称
									<input id="firstItemName" name="firstItemName" property="editor" class="nui-textbox" vtype="maxLength:100" enabled="false" />
								</div>
								<div field="seconditemvalue" width="100" align="center" headerAlign="center" renderer="onViewL">
									采购物项中类名称
									<input property="editor" id="secondItemName" name="secondItemName" class="nui-textbox" vtype="maxLength:100" enabled="false" />
								</div>
								<div field="threeitemvalue" id="threeItemName" width="100" align="center" headerAlign="center" renderer="onViewL">
									采购物项小类名称
									<input property="editor" class="nui-textbox" id="threeItemName" name="threeItemName" enabled="false" />
								</div>
								<div field="brandSpec" width="130" align="center" headerAlign="center">
									规格
									<input id="brandSpec" name="brandSpec" property="editor" class="nui-textbox" />
								</div>
								<div field="onePrice" width="130" align="center" headerAlign="center">
									单价(元)
									<input id="supplierName" name="supplierName" property="editor" class="nui-textbox" />
								</div>
								<div field="number" width="130" align="center" headerAlign="center">
									数量
									<input id="onePrice" name="onePrice" property="editor" class="nui-textbox" />
								</div>
								<div field="totalPrice" width="130" align="center" headerAlign="center">
									总价(元)
									<input id="totalPrice" name="totalPrice" property="editor" class="nui-textbox" />
								</div>
								<div field="remark" width="130" align="center" headerAlign="center">
									备注
									<input id="remark" name="remark" property="editor" class="nui-textbox" />
								</div>
							</div>
						</div>
					</div>
				</fieldset>
				<jsp:include page="/ame_common/misOpinion.jsp" />
				<div style="visibility: hidden; display: none;">
					<jsp:include page="/ame_common/inputFile.jsp" />
				</div>
			</fieldset>
		</div>
	</div>

	<div style="text-align: center; padding: 10px; border-width: 1px 0px 0px 0px;" class="nui-toolbar">
		<a class="nui-button" onclick="countersign()" id="countersign" iconCls="icon-user" style="width: 80px; margin-right: 20px;">加签</a>
		<a class="nui-button" onclick="submit" style="width: 60px; margin-right: 20px;">提交</a>
		<a class="nui-button" onclick="onCancel" style="width: 60px;">关闭</a>
	</div>

	<script type="text/javascript">
		nui.parse();
		var form = new nui.Form("#form1");
		var grid_traveldetail = nui.get("grid_traveldetail");
	   	var workItemID = <%=request.getParameter("workItemID")%>;
	   	var countersignUsers,titleText;
		form.setEnabled(false);

		init();

		function init() {
			var data = {workitemid :<%=workitemid%>};
			var json = nui.encode(data);
			nui.ajax({
				url : "com.zhonghe.ame.purchase.purchaseItems.queryPurUrgentDetail.biz.ext",
				type : 'POST',
				data : json,
				success : function(o) {
					form.setData(o.purUrgent);
					nui.get("createdOrgname").setValue(o.purUrgent.orgname);
					nui.get("backTo").setData(o.purUrgent.backList);
					var grid = nui.get("datagrid1");
					grid.load({
						processInstID : o.purUrgent.processid
					});
					grid.sortBy("time", "desc");
					//初始化处理意见
					initMisOpinion({
						auditstatus : "1"
					});
					var jsonData = {
						"urgentId" : o.purUrgent.id
					}
					console.log(jsonData);
					grid_traveldetail.load(jsonData);
				},
				error : function(jqXHR, textStatus, errorThrown) {
					alert(jqXHR.responseText);
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
				title : "立项单位经办人",
				width : 430,
				height : 400,
				ondestroy : function(action) {
					console.log(action)
					var user, users = "【";
					countersignUsers = [];
					if (action == "ok") {
						var iframe = this.getIFrameEl();
						var data = iframe.contentWindow.GetData();
						data = nui.clone(data); //必须
						if (data) {
							console.log(data)
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
							form2.submit();
						}
					}

				}
			});
		}
		

		function onCancel() {
			CloseWindow("cancel");
		}
		
		function CloseWindow(action) {
			if (window.CloseOwnerWindow)
				return window.CloseOwnerWindow(action);
			else
				window.close();
		}
		
		function submit() {
			var auditstatus = nui.get("auditstatus").getValue();
			if (auditstatus == "2") { //终止流程
				titleText = "终止";
			} else if (auditstatus == "0") { //退回流程
				if (!nui.get("backTo").getValue()) {
					nui.alert("退回环节不能为空！");
					return;
				}
				titleText = "退回";
			} else if (auditstatus == "1") { //提交流程
				titleText = "提交";
			}
			form2.submit();
		}
		
    	function SaveData(){
	    	saveData();
	    }		
		
		function saveData(json) {
			nui.confirm("确定" + titleText + "流程吗？", "操作提示", function(action) {
				if (action == "ok") {
					var misOpinion = opioionform.getData().misOpinion;//审核意见
					var json = {
						misOpinion : misOpinion,
						workItemID :<%=workitemid%>,
						"countersignUsers" : countersignUsers
					};
					mini.mask({
						el : document.body,
						cls : 'mini-mask-loading',
						html : titleText + '中...'
					});
					nui.ajax({
						url : "com.zhonghe.ame.purchase.purchaseItems.approvalPurUrgent.biz.ext",
						type : "post",
						data : json,
						contentType : "text/json",
						success : function(o) {
							nui.unmask(document.body);
							if (o.result == "success") {
								nui.alert(titleText + "成功", "系统提示", function() {
									CloseWindow("ok");
								});
							} else {
								nui.alert("提交失败，请联系信息技术部人员！", "系统提示", function(action) {
									CloseWindow("ok");
								});
							}
						},
						error : function(jqXHR, textStatus, errorThrown) {
							alert(jqXHR.responseText);
						}
					})
					saveData(json);
				}
			});
		}
	</script>

</body>
</html>