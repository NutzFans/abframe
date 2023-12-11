<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<head>
<title>收费合同签订申请</title>
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
			<legend>收费合同签订申请</legend>
			<form id="form1" method="post">
				<input name="processid" id="processid" class="nui-hidden" />
				<input name="files" id="fileids" class="nui-hidden" />
				<input class="nui-hidden" name="id" />
				<div style="padding: 5px;">
					<table style="table-layout: fixed;">
						<tr>
							<td align="right" style="width: 130px">合同名称：</td>
							<td colspan="5">
								<input name="contractName" class="nui-textbox" style="width: 100%" required="true" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 130px">申请人：</td>
							<td>
								<input name="createUserid" id="createUserid" class="nui-hidden" />
								<input id="createUsername" name="createUsername" class="nui-textbox" enabled="false" required="true" style="width: 200px" />
							</td>
							<td align="right" style="width: 130px">合同实施部门：</td>
							<td>
								<input name="implementOrg" id="implementOrg" shownullItem=ture class="nui-treeselect" textField="orgname" valueField="orgid" parentField="omOrganization.orgid" dataField="orgs"
									showTreeIcon="true" valueFromSelect="true" style="width: 200px" url="com.zhonghe.ame.imptask.keytask.getAllRunOrgsforzdrw.biz.ext" allowInput="true" required="true" multiSelect="false"
									checkRecursive="false" expandOnLoad="0" showFolderCheckBox="true" enabled="false" />
								<input name="implementOrgname" id="implementOrgname" class="nui-hidden" readonly="readonly" />
							</td>
							<td align="right" style="width: 130px">申请日期：</td>
							<td>
								<input id="createTime" name="createTime" class="nui-datepicker" style="width: 200px" required="true" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 130px">是否签订合同：</td>
							<td>
								<input id="cachet" name="cachet" class="nui-dictcombobox" dictTypeId="ABF_YESORNO" style="width: 200px" enabled="false" required="true" />
							</td>
							<td align="right" style="width: 130px">投标记录：</td>
							<td>
								<input id="tenderId" name="tenderId" class="nui-buttonedit" onbuttonclick="bidInfoSelect" style="width: 200px" required="true" enabled="true" allowInput="false" emptyText="必填项，数据来源于市场经营信息" />
							</td>
							<td align="right" style="width: 130px">投资额(万元)：</td>
							<td>
								<input name="investAmount" id="investAmount" class="nui-textbox" style="width: 200px" required="true" emptyText="投标记录关联带出" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 130px">服务范围：</td>
							<td>
								<input name="bidService" id="bidService" class="nui-dictcombobox" dictTypeId="ZH_BID_SERVICE" style="width: 200px" required="true" />
							</td>
							<td align="right" style="width: 130px">专业类别：</td>
							<td>
								<input id="major" name="major" class="nui-dictcombobox" dictTypeId="ZH_MAJOR_TYPE" style="width: 200px" required="true" enabled="true" />
							</td>
							<td align="right" style="width: 130px">工程类别：</td>
							<td>
								<input id="projectType" name="projectType" class="nui-dictcombobox" dictTypeId="ZH_PROJECT_TYPE" style="width: 200px" enabled="true" required="true" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 130px">合同价格模式：</td>
							<td>
								<input id="contractModel" name="contractModel" class="nui-dictcombobox" dictTypeId="CONTRACT_MODEL" style="width: 200px" required="true" enabled="true" />
							</td>
							<td align="right" style="width: 130px">招标人采购方式:</td>
							<td>
								<input id="procurementType" name="procurementType" class="nui-dictcombobox" dictTypeId="ZH_PROCUREMENT_TYPE" style="width: 200px" required="true" enabled="true" />
							</td>
							<td align="right" style="width: 130px">集团内外：</td>
							<td>
								<input id="headquarterGroup" name="headquarterGroup" class="nui-dictcombobox" dictTypeId="ZH_GROUP" style="width: 200px" required="true" enabled="true" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 130px">合同文本密级:</td>
							<td>
								<input id="contractSecretLevel" name="contractSecretLevel" class="nui-dictcombobox" dictTypeId="CONTRACT_SECRET_LEVEL" style="width: 200px" required="true" />
							</td>
							<td align="right" style="width: 130px">项目密级:</td>
							<td>
								<input id="projectSecretLevel" name="projectSecretLevel" class="nui-dictcombobox" dictTypeId="PROJECT_SECRET_LEVEL" style="width: 200px" required="true" />
							</td>
							<td align="right" style="width: 130px">是否计划对外分包:</td>
							<td>
								<input id="isfb" name="isfb" class="nui-dictcombobox" dictTypeId="ABF_YESORNO" style="width: 200px" required="true" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 130px">合同签约主体：</td>
							<td>
								<input id="contractSubject" name="contractSubject" class="nui-dictcombobox" dictTypeId="ZH_INVOICE_NAME_TYPE" style="width: 200px" required="true" />
							</td>
							<td align="right" style="width: 130px">收款方：</td>
							<td>
								<input id="payee" name="payee" class="nui-dictcombobox" dictTypeId="PAYER" style="width: 200px" required="true" />
							</td>
							<td align="right" style="width: 130px">完成日期:</td>
							<td>
								<input id="finishTime" name="finishTime" class="nui-datepicker" style="width: 200px" required="true" emptyText="合同执行完成日期（预估）" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 130px">签约方：</td>
							<td colspan="3">
								<span class="mini-buttonedit-border" style="padding-left: 0px; padding-right: 0px">
									<input name="custInfo" id="custInfo" class="nui-textboxlist" style="width: 515px" dataField="custinfos" url="com.zhonghe.ame.marketInfo.marketinfo.khxx.bid.queryCustByNameInfo.biz.ext"
										valueField="custid" textField="custname" allowInput="false" />
									<span class="mini-buttonedit-buttons">
										<span class="mini-buttonedit-close"></span>
										<span class="mini-buttonedit-button" onclick="selectCustInfo()" onmouseover="mini.addClass(this, 'mini-buttonedit-button-hover');"
											onmouseout="mini.removeClass(this, 'mini-buttonedit-button-hover');">
											<span class="mini-buttonedit-icon"></span>
										</span>
									</span>
								</span>
							</td>
							<td align="right" style="width: 130px">集团或二级单位：</td>
							<td>
								<input name="twoOrg" id="twoOrg" class="nui-dictcombobox" dictTypeId="ZH_BID_TWO_ORG" style="width: 200px" emptyText="投标记录关联带出" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 130px">合同金额(元)：</td>
							<td>
								<input name="contractSum" id="contractSum" class="nui-textbox" vtype="float" style="width: 200px" required="true" onvaluechanged="editContractSum" />
							</td>
							<td align="right" style="width: 130px">合同不含税金额(元)：</td>
							<td>
								<input name="noTaxSum" id="noTaxSum" class="nui-textbox" vtype="float" style="width: 200px" required="true" onvaluechanged="editNoTaxSum" />
							</td>
							<td align="right" style="width: 130px">税额(元)：</td>
							<td>
								<input name="payTax" id="payTax" class="nui-textbox" vtype="float" style="width: 200px" required="true" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 130px">备注：</td>
							<td colspan="5">
								<input name="remark" class="nui-textarea" style="width: 100%; height: 235px" required="false" />
							</td>
						</tr>
					</table>
				</div>
			</form>
		</fieldset>

		<fieldset id="field3" style="border: solid 1px #aaa;">
			<legend>未来年度收款计划<span style="color: red">（金额单位：元）</span></legend>
			<div>
				<div class="nui-toolbar" style="border-bottom: 0; padding: 0px;">
					<table style="width: 100%;">
						<tr>
							<td style="width: 100%;">
								<a class="nui-button" iconCls="icon-add" onclick="addRow()" plain="true">增加</a>
								<a class="nui-button" iconCls="icon-remove" onclick="removeRow()" plain="true">删除</a>
								<span style="color: red">总计应与合同金额一致</span>
							</td>
						</tr>
					</table>
				</div>
			</div>
			<div id="datagrid2" class="nui-datagrid" style="width: 100%; height: 200px;" allowResize="true" showSummaryRow="true" allowCellEdit="true" allowCellSelect="true" multiSelect="true"
				allowSortColumn="false" showPager="false">
				<div property="columns">
					<div type="checkcolumn"></div>
					<div field="years" width="80" headerAlign="center" allowSort="true">
						年份
						<input property="editor" class="nui-textbox" style="width: 100%;" />
					</div>
					<div field="jan" width="120" headerAlign="center" allowSort="true">
						一月
						<input property="editor" class="nui-textbox" id="jan" style="width: 100%;" />
					</div>
					<div field="feb" width="120" headerAlign="center" allowSort="true">
						二月
						<input property="editor" class="nui-textbox" style="width: 100%;" />
					</div>
					<div field="mar" width="120" headerAlign="center" allowSort="true">
						三月
						<input property="editor" class="nui-textbox" style="width: 100%;" />
					</div>
					<div field="apr" width="120" headerAlign="center" allowSort="true">
						四月
						<input property="editor" class="nui-textbox" style="width: 100%;" />
					</div>
					<div field="may" width="120" headerAlign="center" allowSort="true">
						五月
						<input property="editor" class="nui-textbox" style="width: 100%;" />
					</div>
					<div field="jun" width="120" headerAlign="center" allowSort="true">
						六月
						<input property="editor" class="nui-textbox" style="width: 100%;" />
					</div>
					<div field="jul" width="120" headerAlign="center" allowSort="true">
						七月
						<input property="editor" class="nui-textbox" style="width: 100%;" />
					</div>
					<div field="aug" width="120" headerAlign="center" allowSort="true">
						八月
						<input property="editor" class="nui-textbox" style="width: 100%;" />
					</div>
					<div field="sep" width="120" headerAlign="center" allowSort="true">
						九月
						<input property="editor" class="nui-textbox" style="width: 100%;" />
					</div>
					<div field="oct" width="120" headerAlign="center" allowSort="true">
						十月
						<input property="editor" class="nui-textbox" style="width: 100%;" />
					</div>
					<div field="nov" width="120" headerAlign="center" allowSort="true">
						十一月
						<input property="editor" class="nui-textbox" style="width: 100%;" />
					</div>
					<div field="dec" width="120" headerAlign="center" allowSort="true">
						十二月
						<input property="editor" class="nui-textbox" style="width: 100%;" />
					</div>
					<div field="sum" width="120" headerAlign="center" allowSort="true" summaryType="sum">
						总计
						<input property="editor" class="nui-textbox" style="width: 100%;" />
					</div>

				</div>
			</div>
		</fieldset>

		<fieldset id="field2" style="border: solid 1px #aaa;">
			<legend>上传附件</legend>
			<jsp:include page="/ame_common/inputFile.jsp" />
		</fieldset>
		<jsp:include page="/ame_common/misOpinion.jsp" />
	</div>

	<div style="text-align: center; padding: 5px;" class="nui-toolbar">
		<a class="nui-button" onclick="onOk(0)" id="creatReimb" iconCls="icon-save" style="width: 80px; margin-right: 20px;">保存</a>
		<a class="nui-button" onclick="onOk(1)" id="creatReimbProcess" iconCls="icon-ok" style="width: 80px; margin-right: 20px;">提交</a>
		<a class="nui-button" onclick="onOk(2)" id="zzReimb" iconCls="icon-split" style="width: 80px; margin-right: 20px;">中止</a>
		<a class="nui-button" onclick="closeCancel" id="saveReimbProcess" iconCls="icon-close" style="width: 80px; margin-right: 0px;">关闭</a>
	</div>

	<script type="text/javascript">
		nui.parse();
		<%long workItemID = (Long) request.getAttribute("workItemID");%>
		var form = new nui.Form("form1");
		var grid2 = nui.get("datagrid2");
		var type; //暂存还是发起

		$("input[name='custInfo']").parent("td").attr("style", "border: 0px; background: #FFFFE6;")

		loadData();

		function loadData() {
			var data = {
				workItemID :<%=workItemID%>
			};
			var json = nui.encode(data);
			nui.ajax({
				url : "com.zhonghe.ame.chargeContract.chargeContract.getChargeContract.biz.ext",
				type : "post",
				data : json,
				contentType : "text/json",
				success : function(o) {
					//收款申请基本信息
					form.setData(o.chargeContract);
					nui.get("tenderId").setValue(o.chargeContract.tenderId);
					nui.get("tenderId").setText(o.chargeContract.tenderName);
					nui.get("custInfo").setValue(o.chargeContract.signatory);
					nui.get("custInfo").setText(o.chargeContract.signatoryName);
					queryPlan(o.chargeContract.id);
					var grid_0 = nui.get("grid_0");
					grid_0.load({
						"groupid" : "CHARGE_CONTRACT",
						"relationid" : o.chargeContract.id
					});
					grid_0.sortBy("fileTime", "desc");
					//设置审核意见基本信息
					nui.get("processinstid").setValue(o.workitem.processInstID);
					nui.get("processinstname").setValue(o.workitem.processInstName);
					nui.get("activitydefid").setValue(o.workitem.activityDefID);
					nui.get("workitemname").setValue(o.workitem.workItemName);
					nui.get("workitemid").setValue(<%=workItemID%>);
					nui.get("isshow").setValue("1");
					nui.get("auditstatus").setValue(4);
					document.getElementById("salesEdit").style.display = "none";
					nui.get("auditopinion").setValue("");
					//查询审核意见
					var grid = nui.get("datagrid1");
					if (o.workitem.processInstID != null || o.workitem.processInstID != "") {
						grid.load({
							processInstID : o.workitem.processInstID
						});
						grid.sortBy("time", "desc");
					}
				},
				error : function() {
				}
			});
		}

		function queryPlan(str) {
			nui.ajax({
				url : "com.zhonghe.ame.chargeContract.chargeContract.queryPlan.biz.ext",
				type : "post",
				contentType : 'text/json',
				data : {
					"chargeId" : str
				},
				success : function(data) {
					grid2.setData(data.data);
				}
			})
		}

		function bidInfoSelect() {
			mini.open({
				url : "/default/contractPact/chargeContract/selectBidInfo.jsp",
				title : "选择投标记录 - 市场经营信息",
				width : '1200',
				height : '610',
				ondestroy : function(action) {
					if (action == "ok") {
						var iframe = this.getIFrameEl();
						var data = iframe.contentWindow.GetData();
						data = mini.clone(data); //必须
						if (data) {
							nui.get("investAmount").setValue(data.investAmount);
							nui.get("bidService").setValue(data.bidService);
							nui.get("tenderId").setValue(data.id);
							nui.get("tenderId").setText(data.projectName);
							nui.get("major").setValue(data.majorType);
							nui.get("projectType").setValue(data.projectType);
							nui.get("contractModel").setValue(data.contractModel);
							nui.get("procurementType").setValue(data.procurementType);
							nui.get("headquarterGroup").setValue(data.headquarterGroup);
							nui.get("custInfo").setValue(data.custId);
							nui.get("custInfo").setText(data.custName);
							nui.get("twoOrg").setValue(data.twoOrg);
						}
					}
				}
			});
		}

		function selectCustInfo() {
			mini.open({
				url : "/default/marketInfo/bid/selectCustInfo.jsp",
				title : "选择签约方（请先查找客户，如不存在再新增）",
				width : '500',
				height : '530',
				ondestroy : function(action) {
					if (action == "ok") {
						var iframe = this.getIFrameEl();
						var data = iframe.contentWindow.GetData();
						data = mini.clone(data); //必须
						var custid = nui.get("custInfo").getValue();
						var custname = nui.get("custInfo").getText();
						if (custid != "" && custname != "") {
							custid = custid + "," + data.custid;
							custname = custname + "," + data.custname;
						} else {
							custid = data.custid;
							custname = data.custname;
						}
						nui.get("custInfo").setValue("" + custid + "");
						nui.get("custInfo").setText("" + custname + "");
					}
				}
			});
		}

		function editContractSum() {
			var contractSum = nui.get("contractSum").getValue();
			var noTaxSum = contractSum / 1.06;
			abs = function(val) {
				var str = (val).toFixed(2) + '';
				var intSum = str.substring(0, str.indexOf(".")).replace(/\B(?=(?:\d{3})+$)/g, '');
				var dot = str.substring(str.length, str.indexOf("."))
				var ret = intSum + dot;
				return ret;
			}
			nui.get("noTaxSum").setValue(abs(noTaxSum));
			nui.get("payTax").setValue(abs(contractSum - noTaxSum));
		}

		function editNoTaxSum() {
			var contractSum = nui.get("contractSum").getValue();
			var noTaxSum = nui.get("noTaxSum").getValue();
			abs = function(val) {
				var str = (val).toFixed(2) + '';
				var intSum = str.substring(0, str.indexOf(".")).replace(/\B(?=(?:\d{3})+$)/g, '');
				var dot = str.substring(str.length, str.indexOf("."))
				var ret = intSum + dot;
				return ret;
			}
			nui.get("payTax").setValue(abs(contractSum - noTaxSum));
		}

		function addRow() {
			var newRow = {
				name : "New Row"
			};
			var jan = "0";
			var feb = "0";
			var mar = "0";
			var apr = "0";
			var may = "0";
			var jun = "0";
			var jul = "0";
			var aug = "0";
			var sep = "0";
			var oct = "0";
			var nov = "0";
			var dec = "0";
			var sum = "0";
			newRow = {
				jan : jan,
				feb : feb,
				mar : mar,
				apr : apr,
				may : may,
				jun : jun,
				jul : jul,
				aug : aug,
				sep : sep,
				oct : oct,
				nov : nov,
				dec : dec,
				sum : sum
			};
			var l = grid2.getData().length;
			grid2.addRow(newRow, l + 1);
		}

		function removeRow() {
			var rows = grid2.getSelecteds();
			if (rows.length > 0) {
				grid2.removeRows(rows, true);
			}
		}

		grid2.on("cellendedit", function(e) {
			var row = e.row;
			var jan = Number(row.jan);
			var feb = Number(row.feb);
			var mar = Number(row.mar);
			var apr = Number(row.apr);
			var may = Number(row.may);
			var jun = Number(row.jun);
			var jul = Number(row.jul);
			var aug = Number(row.aug);
			var sep = Number(row.sep);
			var oct = Number(row.oct);
			var nov = Number(row.nov);
			var dec = Number(row.dec);
			var sum = (jan + feb + mar + apr + may + jun + jul + aug + sep + oct + nov + dec).toFixed(2);
			grid2.updateRow(row, {
				sum : sum
			});
		});

		grid2.on("cellbeginedit", function(e) {
			if (e.field == "sum") {
				e.cancel = "true";
			}
		});

		function onOk(e) {
			type = e;
			if (type == 1) {
				var chargePlans = grid2.getData();
				if (!form.validate()) {
					showTips("请检查表单的完整性!", "danger");
					return;
				}
				if (chargePlans.length > 0) {
					var chargePlansStr = JSON.stringify(chargePlans);
					var chargePlansJson = JSON.parse(chargePlansStr);
					for (var i = 0; i < chargePlansJson.length; i++) {
						if (isNotNum(chargePlansJson[i].years)) {
							showTips("请填写未来年度收款计划中的 ‘年份’ 字段（格式为数字）", "danger");
							return;
						}
						if (isNotNum(chargePlansJson[i].jan) || isNotNum(chargePlansJson[i].feb) || isNotNum(chargePlansJson[i].mar) || isNotNum(chargePlansJson[i].apr)
								|| isNotNum(chargePlansJson[i].may) || isNotNum(chargePlansJson[i].jun) || isNotNum(chargePlansJson[i].jul)
								|| isNotNum(chargePlansJson[i].aug) || isNotNum(chargePlansJson[i].sep) || isNotNum(chargePlansJson[i].oct)
								|| isNotNum(chargePlansJson[i].nov) || isNotNum(chargePlansJson[i].dec)) {
							mini.alert("收款计划中各月份收款值必须为数字且不允许为空（月份无收款请填充数字0）");
							return;
						}
					}
				} else {
					showTips("请填写未来年度收款计划!", "danger");
					return;
				}
			}
			var data = form.getData();
			document.getElementById("fileCatalog").value = "chargeContractinfo";
			var filePaths = document.getElementsByName("uploadfile").length;
			for (var j = 0; j < filePaths; j++) {
				var a = document.getElementsByName("remarkList")[j].value;
				if (a == null || a == "") {
					showTips("新增附件不可以为空", "danger");
					return;
				}
			}
			form2.submit();
		}

		function SaveData() {
			var form = new nui.Form("#form1");
			var data = form.getData();
			data.signatory = nui.get("custInfo").getValue();
			data.signatoryName = nui.get("custInfo").getText();
			var grid2 = nui.get("datagrid2");
			var chargePlans = grid2.getData();
			var info = "";
			data.type = type;
			if (type == 1) {
				info = "是否提交？"
			} else if (type == 0) {
				info = "是否暂时保存？"
			} else {
				info = "是否中止流程？"
				nui.get("auditstatus").setValue(2);
			}
			var data_opioion = opioionform.getData();
			data.files = nui.get("fileids").getValue();
			var json = nui.encode({
				'cpData' : data,
				"misOpinion" : data_opioion.misOpinion,
				"type" : type,
				"chargePlans" : chargePlans
			});
			if (!confirm(info)) {
				nui.get("creatReimb").enable();
				nui.get("creatReimbProcess").enable();
				nui.get("zzReimb").enable();
				nui.get("auditstatus").setValue(4);
				return;
			} else {
				ajaxCommon({
					"url" : "com.zhonghe.ame.chargeContract.chargeContract.editChargeContract.biz.ext",
					"data" : json,
					"success" : function(data) {
						if (data.result == "1") {
							if (type == 1) {
								showTips("收费合同提交成功")
								closeOk();
							} else if (type == 0) {
								showTips("收费合同暂时保存成功")
								closeOk();
							} else {
								showTips("中止成功")
								closeOk();
							}
						} else {
							showTips("收费合同提交失败！", "danger");
							nui.get("creatReimb").enable();
							nui.get("creatReimbProcess").enable();
							nui.get("zzReimb").enable();
						}
					}
				});
			}
		}

		function isNotNum(data) {
			if (data == "") {
				return true;
			}
			var num = Number(data);
			var numStr = num + "";
			console.log(numStr)
			if (numStr == "NaN") {
				return true;
			} else {
				return false;
			}
		}
	</script>
</body>
</html>