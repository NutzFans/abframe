<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.util.List"%>
<%@page import="commonj.sdo.DataObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@ page import="java.util.Map"%>
<%
	String contextPath = request.getContextPath();
%>
<html>
<head>
<title>收费合同签订维护</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
<style type="text/css">
	body {
		margin: 0;padding: 0;border: 0;width: 100%;height: 100%;overflow: hidden;
	}
</style>
</head>
<body>
	<div class="nui-fit" style="padding: 5px;">
		<fieldset id="field1" style="border: solid 1px #aaa;">
			<legend>收费合同签订信息</legend>
			<form id="form1" method="post">
				<input name="files" id="fileids" class="nui-hidden" />
				<input id="id" class="nui-hidden" name="id" />
				<input name="actContractSum" id="actContractSum" class="nui-hidden">
				<input id="finContractSum" name="finContractSum" class="nui-hidden" />
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
								<input id="createUsername" name="createUsername" class="nui-textbox" enabled="false" required="true" style="width: 200px"/>
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
							<td align="right" style="width: 130px">投标记录：</td>
							<td colspan="3">
								<input id="tenderId" name="tenderId" class="nui-buttonedit" onbuttonclick="bidInfoSelect" style="width: 100%" required="false" enabled="true" />
							</td>
							<td align="right" style="width: 130px">专业类别：</td>
							<td>
								<input id="major" name="major" class="nui-dictcombobox" dictTypeId="ZH_MAJOR_TYPE" style="width: 200px" required="true" enabled="true" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 130px">工程类别：</td>
							<td>
								<input id="projectType" name="projectType" class="nui-dictcombobox" dictTypeId="ZH_PROJECT_TYPE" style="width: 200px" enabled="true" required="true" />
							</td>
							<td align="right" style="width: 130px">合同价格模式：</td>
							<td>
								<input id="contractModel" name="contractModel" class="nui-dictcombobox" dictTypeId="CONTRACT_MODEL" style="width: 200px" required="true" enabled="true" />
							</td>
							<td align="right" style="width: 130px">招标人采购方式:</td>
							<td>
								<input id="procurementType" name="procurementType" class="nui-dictcombobox" dictTypeId="ZH_PROCUREMENT_TYPE" style="width: 200px" required="true" enabled="true" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 130px">集团内外：</td>
							<td>
								<input id="headquarterGroup" name="headquarterGroup" class="nui-dictcombobox" dictTypeId="ZH_GROUP" style="width: 200px" required="true" enabled="true" />
							</td>
							<td align="right" style="width: 130px">合同文本密级:</td>
							<td>
								<input id="contractSecretLevel" name="contractSecretLevel" class="nui-dictcombobox" dictTypeId="CONTRACT_SECRET_LEVEL" style="width: 200px" required="true" />
							</td>
							<td align="right" style="width: 130px">项目密级:</td>
							<td>
								<input id="projectSecretLevel" name="projectSecretLevel" class="nui-dictcombobox" dictTypeId="PROJECT_SECRET_LEVEL" style="width: 200px" required="true" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 130px">是否计划对外分包:</td>
							<td>
								<input id="isfb" name="isfb" class="nui-dictcombobox" dictTypeId="ABF_YESORNO" style="width: 200px" required="true" />
							</td>
							<td align="right" style="width: 130px">合同签约主体：</td>
							<td>
								<input id="contractSubject" name="contractSubject" class="nui-dictcombobox" dictTypeId="ZH_INVOICE_NAME_TYPE" style="width: 200px" required="true" />
							</td>
							<td align="right" style="width: 130px">收款方：</td>
							<td>
								<input id="payee" name="payee" class="nui-dictcombobox" dictTypeId="PAYER" style="width: 200px" required="true" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 130px">签约方：</td>
							<td colspan="5">
								<span class="mini-buttonedit-border" style="padding-left: 0px; padding-right: 0px">
									<input name="custInfo" id="custInfo" class="nui-textboxlist" style="width: 855px" dataField="custinfos" url="com.zhonghe.ame.marketInfo.marketinfo.khxx.bid.queryCustByNameInfo.biz.ext"
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
						</tr>
						<tr>
							<td align="right" style="width: 130px">合同金额(元)：</td>
							<td>
								<input name="contractSum" id="contractSum" class="nui-textbox" vtype="float" style="width: 200px" required="true" onvaluechanged="editContractSum" />
							</td>
							<td align="right" style="width: 130px">合同不含税金额(元)：</td>
							<td>
								<input name="noTaxSum" id="noTaxSum" class="nui-textbox" vtype="float" style="width: 200px" required="true" onvaluechanged="editContractSum" />
							</td>
							<td align="right" style="width: 130px">税额(元)：</td>
							<td>
								<input name="payTax" id="payTax" class="nui-textbox" vtype="float" style="width: 200px" required="true" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 130px">合同编号：</td>
							<td>
								<input id="contractNo" name="contractNo" class="nui-textbox" style="width: 200px" required="true" />
							</td>
							<td align="right" style="width: 130px">签订日期：</td>
							<td>
								<input id="signingDate" name="signingDate" class="nui-datepicker" style="width: 200px" required="true" />
							</td>
							<td align="right" style="width: 130px">合同余额(元)：</td>
							<td>
								<input name="contractBalance" id="contractBalance" class="nui-textbox" vtype="float" style="width: 200px" required="true" enabled="true" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 130px">执行状态：</td>
							<td>
								<input id="executeStatus" name="executeStatus" class="nui-dictcombobox" dictTypeId="EXECUTE_STATUS" style="width: 200px" required="true" enabled="true" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 130px">备注：</td>
							<td colspan="5">
								<input name="remark" class="nui-textarea" style="width: 100%; height: 68px" required="false" />
							</td>
						</tr>
					</table>
				</div>
			</form>
		</fieldset>
		
		<fieldset id="field3" style="border: solid 1px #aaa;">
			<legend>未来年度收款计划</legend>
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
	</div>
	
	<div style="text-align: center; position: relative; bottom: 10px" class="nui-toolbar">
		<a class="nui-button" onclick="onOk()" id="creatReimbProcess" style="width: 80px; margin-right: 20px;" iconCls="icon-save">保存</a>
		<a class="nui-button" onclick="onCancel" id="saveReimbProcess" style="width: 80px; margin-right: 140px;" iconCls="icon-close">关闭</a>
	</div>
	
	<script type="text/javascript">
		nui.parse();
		var form = new nui.Form("form1");
		var grid2 = nui.get("datagrid2");
		
		$("input[name='custInfo']").parent("td").attr("style", "border: 0px; background: #FFFFE6;")

		function setEditData(data) {
			form.setData(data);
			nui.get("tenderId").setValue(data.tenderId);
			nui.get("tenderId").setText(data.tenderName);
			nui.get("custInfo").setValue(data.signatory);
			nui.get("custInfo").setText(data.signatoryName);
			queryPlan(data.id);
			var grid_0 = nui.get("grid_0");
			grid_0.load({
				"groupid" : "CHARGE_CONTRACT",
				"relationid" : data.id
			});
			grid_0.sortBy("fileTime", "desc");
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
		
		function onCancel(e) {
			CloseWindow("cancel");
		}
		
		function CloseWindow(action) {
			if (window.CloseOwnerWindow)
				return window.CloseOwnerWindow(action);
			else
				window.close();
		}
		
		// 提示框
		function showTips(content, state) {
			//  state  default|success|info|warning|danger
			if (state) {
				nui.showTips({
					content : content,
					state : state,
					x : "center",
					y : "center",
					timeout : 3500.
				});
			} else {
				nui.showTips({
					content : content,
					state : "success",
					x : "center",
					y : "center",
					timeout : 3500.
				});
			}
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
							nui.get("tenderId").setValue(data.id);
							nui.get("tenderId").setText(data.projectName);
							nui.get("major").setValue(data.majorType);
							nui.get("projectType").setValue(data.projectType);
							nui.get("contractModel").setValue(data.contractModel);
							nui.get("procurementType").setValue(data.procurementType);
							nui.get("headquarterGroup").setValue(data.headquarterGroup);
							nui.get("custInfo").setValue(data.custId);
							nui.get("custInfo").setText(data.custName);
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
						nui.get("custInfo").setValue(""+custid+"");
						nui.get("custInfo").setText(""+custname+"");
					}
				}
			});
		}
		
		function editContractSum() {
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
			var jan = 0;
			var feb = 0;
			var mar = 0;
			var apr = 0;
			var may = 0;
			var jun = 0;
			var jul = 0;
			var aug = 0;
			var sep = 0;
			var oct = 0;
			var nov = 0;
			var dec = 0;
			var sum = 0;
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
			var jan = row.jan * 1;
			var feb = row.feb * 1;
			var mar = row.mar * 1;
			var apr = row.apr * 1;
			var may = row.may * 1;
			var jun = row.jun * 1;
			var jul = row.jul * 1;
			var aug = row.aug * 1;
			var sep = row.sep * 1;
			var oct = row.oct * 1;
			var nov = row.nov * 1;
			var dec = row.dec * 1;
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
		
		function onOk() {
			//定义变量接受form表单数据
			var form = new nui.Form("#form1");
			form.validate();
			if (form.isValid() == false) {
				showTips("请检查表单的完整性!", "danger");
				return;
			}
			document.getElementById("fileCatalog").value = "chargeContractinfo";
			form2.submit();
		}																		
		
		function SaveData() {
			var data = form.getData();
			var grid2 = nui.get("datagrid2");
			var chargePlans = grid2.getData();
			data.signatory = nui.get("custInfo").getValue();
			data.signatoryName = nui.get("custInfo").getText();
			data.files = nui.get("fileids").getValue();
			var finContractSum = nui.get("finContractSum").getValue() * 1;
			var actContractSum = nui.get("actContractSum").getValue() * 1;
			var contractSum = nui.get("contractSum").getValue() * 1;
			finContractSum = (finContractSum-actContractSum+contractSum).toFixed(2);
			data.finContractSum = finContractSum;
			var json = nui.encode({
				'data' : data,
				"chargePlans" : chargePlans
			});
			if (!confirm("是否保存？")) {
				return;
			} else {
				nui.ajax({
					url : "com.zhonghe.ame.chargeContract.chargeContract.updateChargeContract.biz.ext",
					data : json,
					type : 'POST',
					cache : false,
					contentType : 'text/json',
					success : function(text) {
						if (text.result == 1) {
							showTips("维护成功");
							window.CloseOwnerWindow("save");
						} else {
							showTips("维护失败", "danger");
						}

					},
					error : function(jqXHR, textStatus, errorThrown) {
						alert(jqXHR.responseText);
					}
				});
			}
		}		
		
	</script>	
	
</body>
</html>