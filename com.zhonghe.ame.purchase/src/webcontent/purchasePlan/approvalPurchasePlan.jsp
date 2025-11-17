<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<head>
<title>采购 - 年度计划</title>
<style type="text/css">
body {
	font-size: 12px;
	padding: 0;
	margin: 0;
	border: 0;
	height: 100%;
	overflow: hidden;
	width: 100%;
}

/* 强制长单词/字符自动断行 */
.mini-grid-cell-inner {
	word-wrap: break-word !important; /* 英文单词内断行 */
	word-break: break-all !important; /* 中文/英文强制断行 */
}

</style>
</head>
<body>
	<%
		long workitemid = (Long) request.getAttribute("workItemID");
	%>
	<div class="nui-fit" style="padding: 5px;">
		<fieldset id="field1" style="border: solid 1px #aaa;">
			<legend>采购 - 年度计划</legend>
			<form id="form1" method="post">
				<input name="files" id="fileids" class="nui-hidden" />
				<input id="id" name="id" class="nui-hidden" />
				<input class="nui-hidden" name="processid" />
				<div style="padding: 5px;">
					<table style="table-layout: fixed;">
						<tr>
							<td align="right" style="width: 120px;">采购计划(年度)名称：</td>
							<td colspan="5">
								<input id="name" name="name" class="nui-textbox" style="width: 100%;" readonly="readonly" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 100px;">提报人姓名：</td>
							<td>
								<input class="nui-textbox" name="infomantUser" id="infomantUser" style="width: 100%;" readonly="readonly" />
							</td>
							<td align="right" style="width: 100px;">采购单位：</td>
							<td colspan="3">
								<input id="needOrgName" name="needOrgName" class="nui-textbox" style="width: 100%;" readonly="readonly" />
								<input id="needOrgId" name="needOrgId" class="nui-hidden" style="width: 100%;" readonly="readonly" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 120px;">计划年度：</td>
							<td>
								<input id="year" name="year" style="width: 100%;" class="nui-textbox" style="width:100%;" readonly="readonly" //>
							</td>
							<td align="right" style="width: 100px;">采购类型：</td>
							<td>
								<input class="nui-dictcombobox" name="type" id="type" dictTypeId="ZH_PURCHASE_NEW" readonly="readonly" style="width: 100%;" />
							</td>
							<td align="right" style="width: 120px;">计划总金额(万元)：</td>
							<td>
								<input id="budgetAmount" name="budgetAmount" class="nui-textbox" readonly="readonly" style="width: 100%;" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 160px;">本年度预计使用金额(万元)：</td>
							<td>
								<input id="yearBudgetAmount" name="yearBudgetAmount" class="nui-textbox" readonly="readonly" style="width: 100%;" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 120px;">物项归口部门：</td>
							<td colspan="5">
								<input id="putunder" name="putunder" class="nui-dictcombobox" dictTypeId="ZH_PUTUNDER" multiSelect="true" readonly="readonly" style="width: 100%;" />
							</td>
						</tr>
						<tr>
							<td style="width: 120px;" align="right">备注：</td>
							<td colspan="5">
								<input style="width: 100%; height: 120px;" name="remark" class="nui-textarea" id="remark" readonly="readonly" />
							</td>
						</tr>
					</table>
				</div>
			</form>
		</fieldset>

		<fieldset style="border: solid 1px #aaa;">
			<legend>计划明细</legend>
			<div id="grid_traveldetail" class="nui-datagrid" style="width: 100%; height: auto;" allowCellSelect="true" showPager="false" allowCellEdit="false" multiSelect="true" dataField="purPlanItem"
				url="com.zhonghe.ame.purchase.purchaseItems.queryPurPlanItem.biz.ext" allowCellWrap="true">
				<div property="columns">
					<div type="checkcolumn"></div>
					<div type="indexcolumn" align="center" headerAlign="center">序号</div>
					<div field="code" width="110" align="left" headerAlign="center">计划编号</div>
					<div field="purchaseFirstCode" width="110" align="left" headerAlign="center" visible="false">物项大类编码</div>
					<div field=purchaseFirstName width="100" align="left" headerAlign="center">物项大类名称</div>
					<div field="purchaseTwoCode" width="110" align="left" headerAlign="center" visible="false">中类编码</div>
					<div field="purchaseTwoName" width="110" align="left" headerAlign="center">中类名称</div>
					<div field="materialName" width="110" align="left" headerAlign="center" vtype="required" headerStyle="color:red">
						采购物项名称
						<input property="editor" class="nui-textbox" name="materialName" width="100%" height="100%" required="true" />
					</div>
					<div field="unit" width="60" align="center" headerAlign="center" renderer="unitValue">
						单位
						<input property="editor" class="nui-dictcombobox" width="100%" dictTypeId="ZH_UNIT" name="unit" />
					</div>
					<div field="onePrice" width="100" align="center" headerAlign="center" vtype="required" headerStyle="color:red">
						单价(万元)
						<input id="supplierName" name="onePrice" width="100%" property="editor" class="nui-textbox" />
					</div>
					<div field="number" width="100" align="center" headerAlign="center" vtype="required" headerStyle="color:red">
						数量
						<input id="number" name="onePrice" property="editor" width="100%" class="nui-textbox" />
					</div>
					<div field="budgetAmount" width="100" align="center" headerAlign="center" headerStyle="color:red" vtype="required">
						预算金额(万元)
						<input property="editor" class="nui-spinner" minValue="0" width="100%" maxValue="999999999" name="budgetAmount" readonly="readonly" />
					</div>
					<div field="yearBudgetAmount" width="125" align="center" headerAlign="center" headerStyle="color:red" vtype="required">
						本年预计使用金额(万元)
						<input name="yearBudgetAmount" property="editor" width="100%" class="nui-spinner" minValue="0" maxValue="999999999" readonly="readonly" />
					</div>
					<div field="budgetAccount" name="budgetAccount" width="100" align="left" headerAlign="center" headerStyle="color:red">
						财务预算主体
						<input property="editor" class="mini-combobox" style="width: 100%;" valueField="id" textField="name" readonly="readonly" />
					</div>
					<div field="ledgerCategory" name="ledgerCategory" width="100" align="left" headerAlign="center" headerStyle="color:red">
						财务科目分类
						<input property="editor" class="mini-combobox" style="width: 100%;" valueField="id" textField="name" readonly="readonly" />
					</div>
					<div field="ledgerName" name="ledgerName" width="100" align="left" headerAlign="center" headerStyle="color:red">
						财务科目名称
						<input property="editor" class="mini-combobox" style="width: 100%;" valueField="id" textField="name" readonly="readonly" />
					</div>
					<div field="itemPlanType" width="100" align="left" headerAlign="center" headerStyle="color:red" vtype="required" renderer="ITEM_PLAN_TYPE">
						计划类型
						<input property="editor" class="nui-dictcombobox" width="100%" dictTypeId="ITEM_PLAN_TYPE" required="true" />
					</div>						
					<div field="remark" width="100" align="center" headerAlign="center">
						备注
						<input property="editor" class="nui-textarea" name="remark" width="100%" />
					</div>
					<div field="centralizedDept" width="100" align="center" headerAlign="center" renderer="zhPutUnder">物项归口部门</div>
				</div>
			</div>
		</fieldset>

		<fieldset id="field2" style="border: solid 1px #aaa;">
			<legend> 相关附件 </legend>
			<jsp:include page="/ame_common/detailFile.jsp" />
		</fieldset>

		<jsp:include page="/ame_common/misOpinion_Freeflow.jsp" />
	</div>

	<div style="text-align: center; position: relative; bottom: 10px" class="nui-toolbar">
		<a class="nui-button" onclick="countersign()" id="countersign" iconCls="icon-user" style="width: 80px; margin-right: 20px;">加签</a>
		<a class="nui-button" onclick="submit()" id="creatReimbProcess" iconCls="icon-ok" style="width: 60px; margin-right: 20px;">提交</a>
		<a class="nui-button" onclick="closeCancel" iconCls="icon-close" style="width: 60px;">关闭</a>
	</div>

	<script type="text/javascript">
		nui.parse();
		var workItemID =<%=request.getParameter("workItemID")%>;
		var form = new nui.Form("#form1");
		var grid = nui.get("grid_traveldetail");
		var opioionform = new nui.Form("opioionform");
		var purType, orgid;
		var istype, titleText;
		var countersignUsers;
		var budgetAccountDatas, ledgerCategoryDatas, ledgerNameDatas;
		
		init();
		
		function init() {
			var data = {workitemid :<%=workitemid%>};
			var json = nui.encode(data);
			ajaxCommon({
				url : "com.zhonghe.ame.purchase.purchaseplan.findLedgerCategoryList.biz.ext",
				async : false,
				success : function(result) {
					ledgerCategoryDatas = result.ledgerCategoryList;			
				}
			});
			ajaxCommon({
				url : "com.zhonghe.ame.purchase.purchaseplan.findLedgerNameList.biz.ext",
				async : false,
				success : function(result) {
					ledgerNameDatas = result.ledgerNameList;			
				}
			});
			nui.ajax({
				url : "com.zhonghe.ame.purchase.purchaseItems.queryPurPlanDetail.biz.ext",
				type : 'POST',
				data : json,
				success : function(o) {
					form.setData(o.purPlan);
					if(o.purPlan.needOrgId == "1111"){
						grid.hideColumn("budgetAccount");
						grid.hideColumn("ledgerCategory");
						grid.hideColumn("ledgerName");
					}
					var json = nui.encode({'secOrg' : o.purPlan.needOrgId});
					ajaxCommon({
						url : "com.zhonghe.ame.purchase.purchaseplan.findBudgetAccountList.biz.ext",
						data : json,
						async : false,
						success : function(result) {
							budgetAccountDatas = result.budgetAccountList;
						}
					});
					nui.get("backTo").setData(o.purPlan.backList);

					var grid_0 = nui.get("grid_0");
					grid_0.load({
						"groupid" : "PurchasePlan",
						"relationid" : o.purPlan.id
					});
					grid_0.sortBy("fileTime", "desc");

					var grid1 = nui.get("datagrid1");
					grid1.load({
						processInstID : o.purPlan.processid
					});
					grid1.sortBy("time", "desc");
					//初始化处理意见
					initMisOpinion({
						auditstatus : "1"
					});
					var jsonData = {
						"planId" : o.purPlan.id
					}
					grid.load(jsonData);
				}
			});
		}
		
		function countersign() {
			selectOmEmployee();
		}
		
       	function selectOmEmployee(){
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
		
		function unitValue(e) {
			return nui.getDictText("ZH_UNIT", e.value);
		}
		function onYn(e) {
			return nui.getDictText("MIS_YN", e.value);
		}

		function zhPutUnder(e) {
			return nui.getDictText('ZH_PUTUNDER', e.value);
		}
		
		function ITEM_PLAN_TYPE(e) {
			return nui.getDictText("ITEM_PLAN_TYPE", e.value);
		}		
		
		function submit() {
			var auditstatus = nui.get("auditstatus").getValue();
			if (auditstatus == "2") { //终止流程
				titleText = "终止";
			} else if (auditstatus == "0") { //退回流程
				if (!nui.get("backTo").getValue()) {
					showTips("退回环节不能为空！");
					return;
				}
				titleText = "退回";
			} else if (auditstatus == "1") { //提交流程
				titleText = "提交";
			}
			submitProcess(titleText);
		}
		
		function submitProcess(title) {
			nui.confirm("确定" + titleText + "流程吗？", "操作提示", function(action) {
				if (action == "ok") {
					nui.get("countersign").disable();
					nui.get("creatReimbProcess").disable();
					nui.mask({el: document.body,cls: 'mini-mask-loading',html: '表单提交中...'});
					saveData();
				}
			});
		}		
		
		function saveData() {
			setTimeout(function() {
				nui.unmask(document.body);
				var formData = form.getData();
				formData.files = nui.get("fileids").getValue();
				var misOpinion = opioionform.getData().misOpinion;
				var json = {
					"purPlan" : formData,
					"misOpinion" : misOpinion,
					"workItemID" :<%=workitemid%>,
					"countersignUsers" : countersignUsers
				};
				ajaxCommon({
					url : "com.zhonghe.ame.purchase.purchaseItems.approvalPurPlan.biz.ext",
					data : json,
					contentType : 'text/json',
					success : function(o) {
						if (o.result == "1") {
							showTips("提交成功");
							CloseWindow("ok");
						} else {
							nui.get("countersign").enable();
							nui.get("creatReimbProcess").enable();
						}
					}
				});				
			}, 2000);
		}
		
        function getTextByValue(data, value, defaultValue, idField, textField) {
            if (!idField) idField = "id";
            if (!textField) textField = "text";
            for (var i = 0, l = data.length; i < l; i++) {
                var o = data[i];
                if (o[idField] == value) {
                    return o[textField];
                }
            }
            return defaultValue;
        }
        
        grid.on("drawcell", function (e) {
            if (e.field == "budgetAccount") {
                e.cellHtml = getTextByValue(budgetAccountDatas, e.value, null, "id", "name");
            }
            if (e.field == "ledgerCategory") {
                e.cellHtml = getTextByValue(ledgerCategoryDatas, e.value, null, "id", "name");
            }
            if (e.field == "ledgerName") {
                e.cellHtml = getTextByValue(ledgerNameDatas, e.value, null, "id", "name");
            }                         
        });        		
		
	</script>

</body>
</html>