<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<head>
<title>采购 - 年度计划</title>
<style type="text/css">
body {
	margin: 0;
	padding: 0;
	border: 0;
	width: 100%;
	height: 100%;
	overflow: hidden;
}

/* 强制长单词/字符自动断行 */
.mini-grid-cell-inner {
	word-wrap: break-word !important; /* 英文单词内断行 */
	word-break: break-all !important; /* 中文/英文强制断行 */
}

.mini-messagebox-content-text{
	text-align: left !important;
	white-space: normal !important;
	word-wrap: break-word !important; /* 英文单词内断行 */
	word-break: break-all !important; /* 中文/英文强制断行 */
}

</style>
</head>
<body>
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
							<td align="right" style="width: 120px;">年度采购计划名称：</td>
							<td colspan="5">
								<input id="name" name="name" class="nui-textbox" required="true" style="width: 100%;" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 120px;">提报人姓名：</td>
							<td>
								<input class="nui-textbox" name="infomantUser" id="infomantUser" required="true" style="width: 100%;" readonly="readonly" />
							</td>
							<td align="right" style="width: 100px;">采购单位：</td>
							<td colspan="3">
								<input id="needOrgName" name="needOrgName" class="nui-textbox" required="true" style="width: 100%;" readonly="readonly" />
								<input id="needOrgId" name="needOrgId" class="nui-hidden" readonly="readonly" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 120px;">计划年度：</td>
							<td>
								<input id="year" name="year" style="width: 100%;" class="nui-combobox" style="width:100%;" required="true" />
							</td>
							<td align="right" style="width: 100px;">采购类型：</td>
							<td>
								<input class="nui-dictcombobox" name="type" id="type" dictTypeId="ZH_PURCHASE_NEW" required="true" onvaluechanged="changeexptype" onbeforeshowpopup="beforechanged" style="width: 100%;" />
							</td>
							<td align="right" style="width: 120px;">计划总金额(万元)：</td>
							<td>
								<input id="budgetAmount" name="budgetAmount" class="nui-textbox" required="true" readOnly="readOnly" style="width: 100%;" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 160px;">本年度预计使用金额(万元)：</td>
							<td>
								<input id="yearBudgetAmount" name="yearBudgetAmount" class="nui-textbox" required="true" readOnly="readOnly" style="width: 100%;" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 120px;">物项归口部门：</td>
							<td colspan="5">
								<input id="putunder" name="putunder" class="nui-dictcombobox" dictTypeId="ZH_PUTUNDER" multiSelect="true" onvaluechanged="putunderChanged" style="width: 100%;" />
							</td>
						</tr>
						<tr>
							<td style="width: 120px;" align="right">归口部门下可采购物项：</td>
							<td colspan="5">
								<input style="width: 100%; height: 120px;" id="items" class="nui-textarea" readonly="readonly" />
							</td>
						</tr>
						<tr>
							<td style="width: 120px;" align="right">备注：</td>
							<td colspan="5">
								<input style="width: 100%; height: 120px;" name="remark" class="nui-textarea" id="remark" />
							</td>
						</tr>
					</table>
				</div>
			</form>
		</fieldset>

		<fieldset style="border: solid 1px #aaa;">
			<legend>计划明细</legend>
			<div>
				<div class="nui-toolbar" style="border-bottom: 0; padding: 0px;">
					<table style="width: 100%;">
						<tr>
							<td style="width: 100%;">
								<a class="nui-button" id="addbtn" iconCls="icon-add" onclick="addTicket()">增加</a>
								<a class="nui-button" id="delbtn" iconCls="icon-remove" onclick="removeTicket()">删除</a>
							</td>
						</tr>
					</table>
				</div>
			</div>
			<div id="grid_traveldetail" class="nui-datagrid" style="width: 100%; height: auto;" allowCellSelect="true" showPager="false" allowCellEdit="true" multiSelect="true" allowCellWrap="true" oncellendedit="getHTZQ">
				<div property="columns">
					<div type="checkcolumn"></div>
					<div type="indexcolumn" align="center" headerAlign="center">序号</div>
					<div field="code" width="110" align="left" headerAlign="center">计划编号</div>
					<div field="purchaseFirstCode" width="100" align="left" headerAlign="center" visible="false">物项大类编码</div>
					<div field=purchaseFirstName width="100" align="left" headerAlign="center">物项大类名称</div>
					<div field="purchaseTwoCode" width="100" align="left" headerAlign="center" visible="false">中类编码</div>
					<div field="purchaseTwoName" width="100" align="left" headerAlign="center" renderer="onViewL">中类名称</div>
					<div field="materialName" width="100" align="left" headerAlign="center" vtype="required" headerStyle="color:red">
						采购物项名称
						<input property="editor" class="nui-textbox" name="materialName" width="100%" height="100%" required="true" />
					</div>
					<div field="unit" width="60" align="center" headerAlign="center" renderer="unitValue">
						单位
						<input property="editor" class="nui-dictcombobox" width="100%" dictTypeId="ZH_UNIT" name="unit" />
					</div>
					<div field="onePrice" width="100" align="center" headerAlign="center" vtype="required" headerStyle="color:red">
						单价(万元)
						<input name="onePrice" property="editor" width="100%" class="nui-spinner" minValue="0" maxValue="999999999" required="true"/>
					</div>
					<div field="number" width="100" align="center" headerAlign="center" vtype="int" headerStyle="color:red">
						数量(整数)
						<input name="number" property="editor" width="100%" class="nui-spinner" decimalPlaces="0" minValue="0" maxValue="999999999" required="true" />
					</div>
					<div field="budgetAmount" width="100" align="center" headerAlign="center" headerStyle="color:red" vtype="required">预算金额(万元)</div>
					<div field="yearBudgetAmount" width="125" align="center" headerAlign="center" headerStyle="color:red" vtype="required">
						本年预计使用金额(万元)
						<input name="yearBudgetAmount" property="editor" width="100%" class="nui-spinner" minValue="0" maxValue="999999999" required="true" />
					</div>
					<div field="budgetAccount" name="budgetAccount" width="100" align="left" headerAlign="center" headerStyle="color:red">
						财务预算主体
						<input property="editor" class="mini-combobox" style="width: 100%;" valueField="id" textField="name" required="true" />
					</div>
					<div field="ledgerCategory" name="ledgerCategory" width="100" align="left" headerAlign="center" headerStyle="color:red">
						财务科目分类
						<input property="editor" class="mini-combobox" style="width: 100%;" valueField="id" textField="name" required="true" />
					</div>
					<div field="ledgerName" name="ledgerName" width="100" align="left" headerAlign="center" headerStyle="color:red">
						财务科目名称
						<input property="editor" class="mini-combobox" style="width: 100%;" valueField="id" textField="name" required="true" />
					</div>
					<div field="itemPlanType" width="100" align="left" headerAlign="center" headerStyle="color:red" vtype="required" renderer="ITEM_PLAN_TYPE">
						计划类型
						<input property="editor" class="nui-dictcombobox" width="100%" dictTypeId="ITEM_PLAN_TYPE" required="true" />
					</div>										
					<div field="remark" width="150" align="center" headerAlign="center">
						备注
						<input property="editor" class="nui-textarea" name="remark" width="100%" />
					</div>
					<div field="centralizedDept" width="100" align="center" headerAlign="center" renderer="zhPutUnder">物项归口部门</div>
				</div>
			</div>
		</fieldset>

		<fieldset id="field2" style="border: solid 1px #aaa;">
			<legend> 上传相关附件 </legend>
			<jsp:include page="/ame_common/inputFile.jsp" />
		</fieldset>

		<jsp:include page="/ame_common/misOpinion.jsp" />
	</div>

	<div style="text-align: center; position: relative; bottom: 10px" class="nui-toolbar">
		<a class="nui-button" onclick="onOk(1)" id="creatReimbProcess" iconCls="icon-ok" style="width: 80px; margin-right: 20px;">提交</a>
		<a class="nui-button" onclick="onOk(2)" id="zzFeame" iconCls="icon-split" style="width: 80px; margin-right: 20px;">中止</a>
		<a class="nui-button" onclick="closeCancel()" id="saveReimbProcess" iconCls="icon-close" style="width: 80px; margin-right: 140px;">关闭</a>
	</div>

	<script type="text/javascript">
		nui.parse();
		<%long workItemID = (Long) request.getAttribute("workItemID");%>
		var form = new nui.Form("#form1");
		var grid = nui.get("grid_traveldetail");
		var opioionform = new nui.Form("opioionform");
		var purType, orgid;
		var istype;
		var budgetAccountDatas, ledgerCategoryDatas, ledgerNameDatas;
		var year = new Date().getFullYear();
		var yeariterm = [];
		for (var i = 0; i < 5; i++) {
			yeariterm.push({
				"id" : year + i,
				"text" : year + i
			});
		}
		nui.get("year").setData(yeariterm);

		loadData();

		function loadData() {
			var data = {workItemID :<%=workItemID%>};
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
			ajaxCommon({
				"url" : "com.zhonghe.ame.purchase.purchaseplan.getPurPlanByWorkitemId.biz.ext",
				"data" : json,
				"success" : function(o) {
					//付款申请基本信息
					form.setData(o.data)
					if(o.data.needOrgId == "1111"){
						grid.hideColumn("budgetAccount");
						grid.hideColumn("ledgerCategory");
						grid.hideColumn("ledgerName");
					}					
					var json = nui.encode({'secOrg' : o.data.needOrgId});
					ajaxCommon({
						url : "com.zhonghe.ame.purchase.purchaseplan.findBudgetAccountList.biz.ext",
						data : json,
						async : false,
						success : function(result) {
							budgetAccountDatas = result.budgetAccountList;
						}
					});
					if (o.data.type == 1 || o.data.type == 2) {
						nui.get("putunder").set({
							required : true
						});
					} else {
						nui.get("putunder").set({
							required : false
						});
					}
					grid.setData(o.datas)
					//设置审核意见基本信息
					nui.get("processinstid").setValue(o.workitem.processInstID);
					nui.get("processinstname").setValue(o.workitem.processInstName);
					nui.get("activitydefid").setValue(o.workitem.activityDefID);
					nui.get("workitemname").setValue(o.workitem.workItemName);
					nui.get("workitemid").setValue(<%=workItemID%>);
					nui.get("isshow").setValue("1");
					nui.get("auditstatus").setValue(3);
					document.getElementById("salesEdit").style.display = "none";
					nui.get("auditopinion").setValue("");

					var grid_0 = nui.get("grid_0");
					grid_0.load({
						"groupid" : "PurchasePlan",
						"relationid" : o.data.id
					});
					grid_0.sortBy("fileTime", "desc");

					nui.get("auditopinion").setValue("");
					//查询审核意见
					var grid1 = nui.get("datagrid1");
					if (o.workitem.processInstID != null || o.workitem.processInstID != "") {
						grid1.load({
							processInstID : o.workitem.processInstID
						});
						grid1.sortBy("time", "desc");
					}
					loadItem();
				}
			});
		}
		
		function loadItem() {
			purType = nui.get("type").getValue();
			orgid = nui.get("putunder").getValue();
			if (purType != "" && orgid != "" && purType != undefined && orgid != undefined) {
				nui.get("addbtn").enable();
				nui.get("delbtn").enable();
				var json = nui.encode({
					param : {
						"orgid" : orgid,
						"purType" : purType
					}
				})
				ajaxCommon({
					"url" : "com.zhonghe.ame.purchase.purchaseplan.getItemsByOrgid.biz.ext",
					"data" : json,
					"success" : function(data) {
						var items;
						var data = data.data;
						if (data.length > 0) {
							items = data.map(function(obj, index) {
								return obj.zlName;
							}).join(",");
						} else {
							items = "无可选采购项"
						}
						nui.get("items").setValue(items);
					}
				});
			} else if (purType == 3) {
				nui.get("addbtn").enable();
				nui.get("delbtn").enable();
				nui.get("items").setValue("");
			} else {
				nui.get("addbtn").disable();
				nui.get("delbtn").disable();
				nui.get("items").setValue("");
			}
		}
		
		function addTicket() {
			if (purType != "" && orgid != "" && purType != undefined && orgid != undefined && purType != 3) {
				mini.open({
					url: "<%=request.getContextPath()%>/purchase/planchange/selectItems.jsp?orgid=" + orgid + "&purType=" + purType,
					showMaxButton : false,
					title : "选择树",
					width : "80%",
					height : "80%",
					ondestroy : function(action) {
						if (action == "ok") {
							var iframe = this.getIFrameEl();
							var data = iframe.contentWindow.GetData();
							data = mini.clone(data);
							for (var i = 0; i < data.length; i++) {
								var row = {
									"name" : "New Row",
									"purchaseFirstName" : data[i].dlName,
									"purchaseFirstCode" : data[i].dlCode,
									"purchaseTwoName" : data[i].zlName,
									"purchaseTwoCode" : data[i].zlCode,
									"purchaseThreeName" : data[i].xlName,
									"purchaseThreeCode" : data[i].xlCode,
									centralizedDept : data[i].org_id
								}
								grid.addRow(row);
							}
						}
					}
				});
			} else if (purType == 3) {
				nui.get("addbtn").enable();
				nui.get("delbtn").enable();
				var rowS = {
					name : "New Row"
				}
				grid.addRow(rowS);
			} else {
				showTips("请先选择采购类型及归口部门")
			}
		}

		var exptypeOld;
		function beforechanged() {
			exptypeOld = nui.get("type").getValue();
		}

		function changeexptype() {
			purType = nui.get("type").getValue();
			var detailRows = grid.getData();

			if (detailRows.length > 0) {
				if (confirm("切换采购类型将会清空已填写物项明细，请确定是否切换吗？")) {
					grid.clearRows();
				} else {
					nui.get("type").setValue(exptypeOld);
					return;
				}
			}
			loadItem();
		}

		function putunderChanged() {
			var putunder = nui.get("putunder").getValue()
			var rowsData = grid.data;

			if (putunder) {
				var putunders = putunder.split(",");
			} else {
				putunders = [];
			}
			if (rowsData.length > 0) {
				for (var i = 0; i < rowsData.length; i++) {
					if (!putunders.includes(rowsData[i].centralizedDept.toString())) {
						putunders.push(rowsData[i].centralizedDept.toString())
					}
				}
				nui.get("putunder").setValue(putunders.toString());
			}
			loadItem();
		}

		function removeTicket() {
			var rows = grid.getSelecteds();
			if (rows.length > 0) {
				grid.removeRows(rows, true);
			} else {
				nui.alert("请至少选中一条记录！");
			}
			totalAmount();
			totalYearAmount();
		}

		function getHTZQ(e) {
			var record = e.record;
			if (e.field == "number" || e.field == "onePrice") {
				if (record.number != null && record.onePrice != null) {
					var budgetAmount1 = mulFloat(record.number, record.onePrice).toString();
					grid.updateRow(e.row, {
						budgetAmount : budgetAmount1
					});
					totalAmount();
				} else {
					grid.updateRow(e.row, {
						totalPrice : ""
					});
				}
			}
			if(e.field == "yearBudgetAmount"){
				totalYearAmount();
			}			
		}

		function totalAmount() {
			var tempData = grid.data;
			var a = tempData.length;
			var b = 0;
			for (var i = 0; i < a; i++) {
				if (!!tempData[i].budgetAmount && tempData[i].budgetAmount > 0) {
					b = addFloat(b, tempData[i].budgetAmount)
				} else {
					var x = 0;
					b = addFloat(b, x)
				}
			}
			nui.get("budgetAmount").setValue(b)
		}
		
		function totalYearAmount() {
			var tempData = grid.data;
			var a = tempData.length;
			var b = 0;
			for (var i = 0; i < a; i++) {
				if (!!tempData[i].yearBudgetAmount && tempData[i].yearBudgetAmount > 0) {
					b = addFloat(b, tempData[i].yearBudgetAmount)
				} else {
					var x = 0;
					b = addFloat(b, x)
				}
			}
			nui.get("yearBudgetAmount").setValue(b)
		}		

		function zhPutUnder(e) {
			return nui.getDictText('ZH_PUTUNDER', e.value);//设置业务字典值
		}

		function unitValue(e) {
			return nui.getDictText("ZH_UNIT", e.value);
		}

		function onYn(e) {
			return nui.getDictText("MIS_YN", e.value);
		}
		
		function ITEM_PLAN_TYPE(e) {
			return nui.getDictText("ITEM_PLAN_TYPE", e.value);
		}		

		function isStrEmpty(obj) {
			if (typeof obj == "undefined" || obj == null || obj == "") {
				return true;
			} else {
				return false;
			}
		}

		function onOk(e) {
			istype = e;
			var info;
			nui.get("auditstatus").setValue("4");
			if (istype == 0) {
				var name = nui.get("name").getValue();
				if (isStrEmpty(name)) {
					showTips("请填写采购计划名称并保证其正确性！", "danger");
					return;
				}
				info = "暂存流程表单？"
			} else if (istype == 1) {
				if (!form.validate()) {
					showTips("请检查表单的完整性!");
					return;
				}
				grid.validate();
				if (grid.isValid() == false) {
					var error = grid.getCellErrors()[0];
					grid.beginEditCell(error.record, error.column);
					showTips("明细数据有错误，请检查!", "danger");
					return;
				}
				var tempData = grid.data;
				var putunder = getUniqueValuesString(tempData,"centralizedDept");
				nui.get("putunder").setValue(putunder);
				// 已上传的文件数量
				var gridFileCount = nui.get("grid_0").getData().length;
				if (gridFileCount == 0) {
					// 刚新增(未上传)的文件数量
					var newFileCount = document.getElementsByName("uploadfile").length;
					if (newFileCount == 0) {
						showTips("请上传相关附件", "danger");
						return;
					}
				}
				info = "提交流程表单？"
			} else {
				info = "终止流程表单？"
				nui.get("auditstatus").setValue(2);
			}
			document.getElementById("fileCatalog").value = "PurchasePlan";
			
			nui.confirm("确定" + info, "系统提示", function(action) {
				if (action == "ok") {
					nui.get("creatReimbProcess").disable();
					nui.get("zzFeame").disable();
					nui.mask({el: document.body,cls: 'mini-mask-loading',html: '流程表单提交中...'});
					form2.submit();
				}
			})
		}

		function SaveData() {
			setTimeout(function() {
				var formData = form.getData();
				var gridData = grid.getChanges();
				var data_opioion = opioionform.getData();
				formData.istype = istype;
				formData.files = nui.get("fileids").getValue();
				var json = nui.encode({
					"purPlan" : formData,
					"purPlanItem" : gridData,
					"misOpinion" : data_opioion.misOpinion
				});
				var validateJson = nui.encode({
					"purPlan" : formData,
					"purPlanItem" : grid.getData()
				});
				if(istype == 1 && formData.needOrgId !="1111" ){
					ajaxCommon({
						"url" : "com.zhonghe.ame.purchase.purchaseplan.budgetValidation.biz.ext",
						data : validateJson,
						contentType : 'text/json',
						success : function(text) {
							nui.unmask(document.body);
							if(text.errorMsg==""){
								ajaxCommon({
									"url" : "com.zhonghe.ame.purchase.purchaseplan.editPurPlan.biz.ext",
									data : json,
									contentType : 'text/json',
									success : function(text) {
										if (text.result == "1") {
											showTips("操作成功");
											closeOk();
										} else {
											nui.get("creatReimbProcess").enable();
											nui.get("zzFeame").enable();
										}
									}
								});							
							}else{
								nui.alert(text.errorMsg);
								nui.get("creatReimbProcess").enable();
								nui.get("zzFeame").enable();
							}
						}
					});					
				}else if (istype == 0 || istype == 2 || formData.needOrgId =="1111") {
					ajaxCommon({
						"url" : "com.zhonghe.ame.purchase.purchaseplan.editPurPlan.biz.ext",
						data : json,
						contentType : 'text/json',
						success : function(text) {
							nui.unmask(document.body);
							if (text.result == "1") {
								showTips("操作成功");
								closeOk();
							} else {
								nui.get("creatReimbProcess").enable();
								nui.get("zzFeame").enable();
							}
						}
					});	
				}
			}, 2000);		
		}
		
		function getUniqueValuesString(arr, key) {
			const uniqueValues = [...new Set(arr.map(obj => obj[key]))];
			return uniqueValues.join(',');
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
        
        function getChildData(data, id) {
            var childData = [];
            for (var i = 0, l = data.length; i < l; i++) {
                var o = data[i];
                if (o.category == id) {
                    childData.push(o);
                }
            }
            return childData;
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
        
		//单元格编辑前，找到对应的下拉数据进行填充
		grid.on("cellbeginedit", function (e) {
			if (e.field == "budgetAccount") {
				e.editor.setData(budgetAccountDatas);
			}
			if (e.field == "ledgerCategory") {
				e.editor.setData(ledgerCategoryDatas);
			}
			if (e.field == "ledgerName") {
				var data = getChildData(ledgerNameDatas, e.record.ledgerCategory);
				e.editor.setData(data);
			}
		})
		
        //在前面列编辑后，清理后面列的数据
        grid.on("cellcommitedit", function (e) {
            var grid = e.sender,record = e.record;
            if (e.field == "ledgerCategory") {
                grid.updateRow(record, { ledgerName: ""});
            }
        });                 		
		
	</script>

</body>
</html>