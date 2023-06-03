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
</style>
<head>
<title>付款管理</title>
</head>
<body>
	<div style="width: auto; height: 99%; padding: 5px;">
		<div id="form1">
			<input class="nui-hidden" name="critria._entity" value="com.zhonghe.ame.payment.payMent.ZhPaymentEntity" />
			<div class="nui-toolbar" style="border-bottom: 0; padding: 5px;">
				<table>
					<tr>
						<td style="width: 60px; text-align: right;">经办人:</td>
						<td style="width: 155px">
							<input name="critria._expr[1].createUsername" class="nui-textbox" id="createUsername" style="width: 150px" />
							<input class="nui-hidden" name="critria._expr[1]._op" value="like" id="createUsernameOp" />
							<input name="critria._expr[0].createUserid" class="nui-hidden" id="createUserid" />
						</td>
						<td style="width: 90px; text-align: right;">合同承办部门:</td>
						<td style="width: 155px">
							<input id="orgid2" name="critria._ref[0]._expr[0]._value" class="nui-combobox" textField="orgname" valueField="orgseq" dataField="orgs" showNullItem="true" allowInput="true"
								style="width: 150px" valueFromSelect="true" />
							<input class="nui-hidden" name="critria._expr[2]._property" value="implementOrg" id="implementOrgProp" />
							<input class="nui-hidden" name="critria._expr[2]._op" value="in" id="implementOrgOp" />
							<input class="nui-hidden" name="critria._expr[2]._ref" value="1" id="implementOrgRef" />
							<input class="nui-hidden" name="critria._ref[0]._id" value="1" />
							<input class="nui-hidden" name="critria._ref[0]._entity" value="org.gocom.abframe.dataset.organization.OmOrganization" />
							<input class="nui-hidden" name="critria._ref[0]._select._field[0]" value="orgid" />
							<input class="nui-hidden" name="critria._ref[0]._expr[0]._property" value="orgseq" />
							<input class="nui-hidden" name="critria._ref[0]._expr[0]._op" value="like" />
							<input class="nui-hidden" name="critria._ref[0]._expr[0]._likeRule" value="end" />
							<input class="nui-hidden" name="critria._expr[3]._property" value="implementOrg" id="implementOrgProp2" />
							<input class="nui-hidden" name="critria._expr[3]._op" value="in" id="implementOrgOp2" />
							<input class="nui-hidden" name="critria._expr[3]._value" id="orgids2" />
						</td>
						<td style="width: 60px; text-align: right;">合同编号:</td>
						<td style="width: 155px">
							<input name="critria._expr[10]._value" class="nui-textbox" style="width: 150px" />
							<input class="nui-hidden" name="critria._expr[10]._property" value="contractNo" />
							<input class="nui-hidden" name="critria._expr[10]._op" value="like" />
						</td>
						<td style="width: 60px; text-align: right;">合同名称:</td>
						<td style="width: 155px">
							<input name="critria._expr[6]._value" class="nui-textbox" style="width: 150px" />
							<input class="nui-hidden" name="critria._expr[6]._property" value="contractName" />
							<input class="nui-hidden" name="critria._expr[6]._op" value="like" />
						</td>
						<td style="width: 60px; text-align: right;">审批状态:</td>
						<td style="width: 155px">
							<input name="critria._expr[12].appStatus" class="nui-dictcombobox" dictTypeId="ZH_FLOW_TYPE" showNullItem="true" nullItemText="全部" style="width: 150px" />
						</td>
						<td style="width: 60px; text-align: right;">付款日期:</td>
						<td style="width: 245px">
							<input class="nui-hidden" name="critria._expr[21]._op" value="between" />
							<input class="nui-hidden" name="critria._expr[21]._pattern" value="yyyy-MM-dd" />
							<input class="nui-hidden" name="critria._expr[21]._property" value="endTime" />
							<input class="nui-datepicker" name="critria._expr[21]._min" style="width: 110px" />
							<span>至</span>
							<input class="nui-datepicker" name="critria._expr[21]._max" style="width: 110px" />
						</td>
					</tr>
					<tr>
						<td style="width: 60px; text-align: right;">发票类型:</td>
						<td style="width: 155px">
							<input name="critria._expr[22].invoiceType" class="nui-dictcombobox" dictTypeId="MIS_MA_INVOICETYPE" showNullItem="true" nullItemText="全部" style="width: 150px" />
						</td>
						<td style="width: 60px; text-align: right;">付款进度:</td>
						<td style="width: 155px">
							<input name="critria._expr[23].payType" class="nui-dictcombobox" dictTypeId="payType" showNullItem="true" nullItemText="全部" style="width: 150px" />
						</td>
						<td style="width: 60px; text-align: right;">合同性质:</td>
						<td style="width: 155px">
							<input name="critria._expr[24].contractNature" class="nui-dictcombobox" dictTypeId="CONTRACT_NATURE" showNullItem="true" nullItemText="全部" style="width: 150px" />
						</td>
						<td style="width: 60px; text-align: right;">合同类型:</td>
						<td style="width: 155px">
							<input name="critria._expr[25].contractType" class="nui-dictcombobox" dictTypeId="ZH_CONTRACT_TYPE" showNullItem="true" nullItemText="全部" style="width: 150px" />
						</td>
						<td style="width: 60px; text-align: right;">付款方:</td>
						<td style="width: 155px">
							<input name="critria._expr[26].payer" class="nui-dictcombobox" dictTypeId="ZH_INVOICE_NAME_TYPE" showNullItem="true" nullItemText="全部" style="width: 150px" />
						</td>
						<td style="width: 60px; text-align: right;">收款单位:</td>
						<td style="width: 245px">
							<input name="critria._expr[27]._value" class="nui-combobox" valueField="custname" url="com.primeton.eos.ame_pur.PurSupplier.queryPurSuppliersIsqualified.biz.ext" filterType="like"
								textField="custname" dataField="pursuppliers" valueFromSelect="true" allowInput="true" style="width: 240px" />
							<input class="nui-hidden" name="critria._expr[27]._property" value="signatoryName" />
							<input class="nui-hidden" name="critria._expr[27]._op" value="like" />
						</td>
					</tr>
				</table>
			</div>

			<div class="nui-toolbar" style="border-bottom: 0; padding: 1px;">
				<table style="width: 100%; text-align: center;">
					<tr>
						<td>
							<a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查询</a>
							<a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset()">重置</a>
						</td>
					</tr>
				</table>
			</div>
		</div>

		<div class="nui-toolbar" style="border-bottom: 0; padding: 5px;">
			<table style="width: 100%;">
				<tr>
					<td>
						<a class="nui-button" id="add" iconCls="icon-add" onclick="add()">新增</a>
						<a class="nui-button" id="edit" iconCls="icon-edit" onclick="zc_edit()">编辑</a>
						<a class="nui-button" id="del" iconCls="icon-remove" onclick="deleteInfo()">删除</a>
						<a class="nui-button" id="fklblist_wh" iconCls="icon-edit" onclick="wh_edit()">维护</a>
						<a class="nui-button" id="fklblist_zf" iconCls="icon-edit" onclick="zf_edit()">作废</a>
						<a class="nui-button" id="fklblist_bgjbr" iconCls="icon-edit" onclick="bgjbr_edit()">变更经办人</a>
						<a class="nui-button" id="checkview" iconCls="icon-print" onclick="printBtn()">打印</a>
						<a class="nui-button" id="export" iconCls="icon-download" onclick="exportExcel()">导出</a>
					</td>
				</tr>
			</table>
		</div>

		<div class="nui-fit">
			<div id="datagrid1" sizeList="[1000]" showPager="true" dataField="data" showSummaryRow="true" pageSize="1000" class="nui-datagrid" style="width: 100%; height: 100%;"
				url="com.zhonghe.ame.invoice.invoice.queryinvoiceAll.biz.ext" allowSortColumn=true frozenStartColumn="0" frozenEndColumn="9" showSummaryRow="true" virtualScroll="true" virtualColumns="true">
				<div property="columns">
					<div type="checkcolumn">○</div>
					<div field="invoiceType" width="80" align="center" headerAlign="center" allowSort="true" renderer="MIS_MA_INVOICETYPE">发票类型</div>
					<div field="endTime" dateFormat="yyyy-MM-dd" width="80" align="center" headerAlign="center" allowSort="true">付款日期</div>
					<div field="createUsername" width="60" align="center" headerAlign="center" allowSort="true">经办人</div>
					<div field="implementOrgname" width="180" align="center" headerAlign="center" allowSort="true">合同承办部门</div>
					<div field="contractNo" width="180" align="center" headerAlign="center" allowSort="true">合同编号</div>
					<div field="contractName" width="200" align="center" headerAlign="center" allowSort="true" renderer="lookInfo">合同名称</div>
					<div field="signatoryName" width="180" align="center" headerAlign="center" allowSort="true">收款单位</div>
					<div field="appStatus" align="center" headerAlign="center" allowSort="true" renderer="onActionRenderer">审批状态</div>
					<div field="applyPayContractSum" width="130" align="center" headerAlign="center" allowSort="true" summaryType="sum" dataType="currency">本次申请金额（元）</div>
					<div field="paidContractSum" width="140" align="center" headerAlign="center" allowSort="true" summaryType="sum" dataType="currency">累计已支付金额（元）</div>
					<div field="contractSum" width="120" align="center" headerAlign="center" allowSort="true" summaryType="sum" dataType="currency">合同金额（元）</div>
					<div field="payType" align="center" headerAlign="center" allowSort="true" renderer="payType">本次付款进度</div>
					<div field="payer" align="center" headerAlign="center" allowSort="true" renderer="ZH_INVOICE_NAME_TYPE">付款方</div>
					<div field="contractType" width="140" align="center" headerAlign="center" allowSort="true" renderer="ZH_CONTRACT_TYPE">合同类型</div>
					<div field="contractNature" width="140" align="center" headerAlign="center" allowSort="true" renderer="CONTRACT_NATURE">合同性质</div>
				</div>
			</div>
		</div>
	</div>
	
	<form name="exprotExcelFlow" id="exprotExcelFlow" action="com.primeton.eos.ame_common.ameExportCommon.flow" method="post">
		<input type="hidden" name="_eosFlowAction" value="action0" filter="false" />
		<input type="hidden" name="downloadFile" filter="false" />
		<input type="hidden" name="fileName" filter="false" />
	</form>	

	<script type="text/javascript">
		nui.parse();
		var form = new nui.Form("#form1");
		var grid = nui.get("datagrid1");
		var type = <%=request.getParameter("type")%>;
		var reve_grid = nui.get("reve_grid");
		var json=nui.encode({"iden": "1","expseq": null,"feeseq": null,"parentfeetypeid": null});
		var authOrg;
		
		init();
		
		function init() {
			// 按钮权限
			if (userId != 'sysadmin') {
				// 维护按钮 - fklblist_wh，变更经办人按钮 - fklblist_bgjbr，作废按钮 - fklblist_zf
				getOpeatorButtonAuth("fklblist_wh,fklblist_bgjbr,fklblist_zf");
			}

			//code:对应功能编码，map：对于机构的查询条件
			var json = {
				"code" : "fklblist",
				"map" : {
					"property" : "status",
					"op" : "=",
					"value" : "running"
				}
			};
			nui.ajax({
				url : "com.primeton.eos.ame_auth.ame_auth.getownorg1.biz.ext",
				data : json,
				type : 'POST',
				contentType : 'text/json',
				success : function(text) {
					if(text.errcode == "没有有权的机构"){
						nui.get("createUserid").setValue(userId);
						nui.get("createUsername").setValue(userName);
						nui.get("createUsername").setReadOnly(true);
						authOrg = false;						
					}else{
						nui.get("createUsername").setName("critria._or[0]._and[0]._expr[1].createUsername");
						nui.get("createUsernameOp").setName("critria._or[0]._and[0]._expr[1]._op");
						nui.get("createUserid").setName("critria._or[0]._and[0]._expr[0].createUserid");
						nui.get("createUserid").setValue(userId);
						nui.get("implementOrgProp").setName("critria._or[0]._and[1]._expr[2]._property");
						nui.get("implementOrgOp").setName("critria._or[0]._and[1]._expr[2]._op");
						nui.get("implementOrgRef").setName("critria._or[0]._and[1]._expr[2]._ref");
						nui.get("orgid2").setData(text.orgs);
						nui.get("implementOrgProp2").setName("critria._or[0]._and[1]._expr[3]._property");
						nui.get("implementOrgOp2").setName("critria._or[0]._and[1]._expr[3]._op");
						nui.get("orgids2").setName("critria._or[0]._and[1]._expr[3]._value");
						nui.get("orgids2").setValue(text.orgids);
						authOrg = true;
					}
					search();
				}
			});
		}
		
		function search() {
			if(authOrg){
				if(nui.get("createUsername").getValue() != "" || nui.get("orgid2").getValue() != ""){
					if(nui.get("createUsername").getValue() == userName){
						nui.get("createUsername").setName("critria._expr[1].createUsername");
						nui.get("createUsernameOp").setName("critria._expr[1]._op");
						nui.get("createUserid").setName("critria._expr[0].createUserid");
						nui.get("createUserid").setValue(userId);
						nui.get("implementOrgProp").setName("critria._expr[2]._property");
						nui.get("implementOrgOp").setName("critria._expr[2]._op");
						nui.get("implementOrgRef").setName("critria._expr[2]._ref");
						nui.get("implementOrgProp2").setName("critria._expr[3]._property");
						nui.get("implementOrgOp2").setName("critria._expr[3]._op");
						nui.get("orgids2").setName("critria._expr[3]._value");
						nui.get("orgid2").setValue("");
						nui.get("orgids2").setValue("");						
					}else{
						nui.get("createUsername").setName("critria._expr[1].createUsername");
						nui.get("createUsernameOp").setName("critria._expr[1]._op");
						nui.get("createUserid").setName("critria._expr[0].createUserid");
						nui.get("createUserid").setValue("");
						nui.get("implementOrgProp").setName("critria._expr[2]._property");
						nui.get("implementOrgOp").setName("critria._expr[2]._op");
						nui.get("implementOrgRef").setName("critria._expr[2]._ref");
						nui.get("implementOrgProp2").setName("critria._expr[3]._property");
						nui.get("implementOrgOp2").setName("critria._expr[3]._op");
						nui.get("orgids2").setName("critria._expr[3]._value");						
					}
				}
			}
			var data = form.getData();
			grid.sortBy("endTime", "desc");
			grid.load(data);
		}
		
		function reset() {
			form.reset();
			init();
		}
		
		function onActionRenderer(e) {
			var record = e.record;
			var processId = record.processid;
			var s = "<a  href='javascript:void(0)' onclick='feeView();' >" + nui.getDictText('ZH_FLOW_TYPE', e.value) + "</a>";
			return s;
		}
		
		function printBtn() {
			var row = grid.getSelected();
			if (row) {
				executeUrl = "<%= request.getContextPath() %>/contractPact/print/payMentListPrint.jsp?id=" + row.id;
				window.open(executeUrl);
			} else {
				showTips("请选中一条记录", "danger");
			}
		}		
		
		function feeView() {
			var selectRow = grid.getSelected();
			var processId = selectRow.processid;
			var url = "/default/bps/wfclient/task/processinstView.jsp";
			var title = "流程图查看";
			var width = 1000;
			nui.open({
				url : url,
				title : title,
				width : width,
				height : 550,
				onload : function() {
					var iframe = this.getIFrameEl();
					if (iframe.contentWindow.initData) {
						iframe.contentWindow.initData({
							"processInstID" : processId
						});
					}
				},
				ondestroy : function(action) {
				}
			});
		}
		
		function lookInfo(e) {
			return "<a href='javascript:void(0)' onclick='doView();' title='点击查看'>" + e.value + "</a>";
		}

		function doView() {
			var row = grid.getSelected();
			if (row) {
				executeUrl = "<%=request.getContextPath()%>/contractPact/print/payMentListPrint.jsp?id=" + row.id;
				window.open(executeUrl);
			} else {
				showTips("请选中一条记录", "danger");
			}
		}

		function add() {
			nui.open({
				url : "/default/contractPact/payment/payMentAdd.jsp",
				width : '100%',
				height : '100%',
				title : "付费管理",
				onload : function() {
					var iframe = this.getIFrameEl();
				},
				ondestroy : function(action) {
					search();
				}
			})
		}

		function wh_edit() {
			var row = grid.getSelecteds();
			if (row.length > 1 || row.length == 0) {
				showTips("只能选中一条项目记录进行维护", "danger");
				return;
			}
			var data = row[0];
			if (data.appStatus == '2') {
				nui.open({
					url : "/default/contractPact/payment/payMentUpdate.jsp",
					width : '100%',
					height : '100%',
					title : "付款信息维护",
					onload : function() {
						var iframe = this.getIFrameEl();
						iframe.contentWindow.setEditData(data);
					},
					ondestroy : function(action) {
						if (action == "ok") {
							grid.reload();
						}
						search();
					}
				})
			} else {
				showTips("只能维护审批状态为【审批通过】的数据", "danger");
			}
		}

		// 暂存编辑
		function zc_edit() {
			var row = grid.getSelecteds();
			if (row.length > 1 || row.length == 0) {
				showTips("只能选中一条项目记录进行编辑", "danger");
				return;
			}
			var data = row[0];
			if (data.appStatus == '0') {
				var json = {
					"processID" : data.processid
				};
				ajaxCommon({
					url : "com.zhonghe.ame.payment.payMent.getWorkItemByProcessInstID.biz.ext",
					data : json,
					success : function(result) {
						if (JSON.stringify(result) !== '{}') {
							nui.open({
								url : "/default/bps/wfclient/task/dispatchTaskExecute.jsp?workItemID=" + result.workItemID,
								width : '100%',
								height : '100%',
								ondestroy : function(action) {
									grid.reload();
									search();
								}
							})
						}
					}
				});
			} else {
				showTips("只能编辑审批状态为【草稿】的数据", "danger");
			}
		}

		function deleteInfo() {
			var row = grid.getSelecteds();
			if (row.length > 1 || row.length == 0) {
				showTips("只能选中一条项目记录进行删除", "danger");
				return;
			} else {
				var row = row[0];
				if (row.appStatus == '4') {
					if (!confirm("是否删除？")) {
						return;
					} else {
						if (row) {
							var json = nui.encode({
								'data' : row
							});
							nui.ajax({
								url : "com.zhonghe.ame.payment.payMent.deletePayMentById.biz.ext",
								type : 'POST',
								data : json,
								contentType : 'text/json',
								success : function(o) {
									if (o.result == 1) {
										showTips("删除成功");
										grid.reload();
									} else {
										showTips("删除失败，请联系信息技术部人员！", "danger");
									}
								}
							});

						} else {
							showTips("只能选中一条项目记录进行删除", "danger");
						}
					}
				} else {
					showTips("只能删除审批状态为【作废】的数据", "danger");
				}
			}
		}
		
		function zf_edit() {
			var row = grid.getSelecteds();
			if (row.length > 1 || row.length == 0) {
				showTips("只能选中一条项目记录进行作废", "danger");
				return;
			} else {
				var row = row[0];
				if (row.appStatus == '2') {
					if (!confirm("是否作废？")) {
						return;
					} else {
						if (row) {
							var json = nui.encode({
								'data' : row
							});
							nui.ajax({
								url : "com.zhonghe.ame.payment.payMent.zfPayMentById.biz.ext",
								type : 'POST',
								data : json,
								contentType : 'text/json',
								success : function(o) {
									if (o.result == 1) {
										showTips("作废成功");
										grid.reload();
									} else {
										showTips("作废失败，请联系信息技术部人员！", "danger");
									}
								}
							});
						} else {
							showTips("只能选中一条项目记录进行作废", "danger");
						}
					}
				} else {
					showTips("只能作废审批状态为【审批通过】的数据", "danger");
				}
			}
		}
		
		function bgjbr_edit() {
			var row = grid.getSelecteds();
			if (row.length > 1 || row.length == 0) {
				showTips("只能选中一条项目记录进行经办人变更", "danger");
				return;
			} else {
				var row = row[0];
				if (row.appStatus == '2') {
					nui.open({
						url : "/default/contractPact/payment/selectTransactor.jsp?id=" + row.id,
						title : "付款管理 - 变更经办人",
						width : 500,
						height : 350,
						ondestroy : function(action) {
							if (action == "ok") {
								grid.reload();
							}
						}
					});
				} else {
					showTips("只能对审批状态为【审批通过】的数据进行经办人变更", "danger");
				}
			}
		}
		
		//导出
		function exportExcel() {
			if (!confirm("是否确认导出？")) {
				return;
			}
			var form = new nui.Form("#form1");
			var data = form.getData(); //获取表单JS对象数据
			var json = nui.encode(data);
			nui.ajax({
				url : "com.zhonghe.ame.payment.payMent.exportPayMentExcel.biz.ext",
				type : "post",
				data : json,
				cache : false,
				contentType : 'text/json',
				success : function(o) {
					var filePath = o.downloadFile;
					var fileName = "付款信息";
					var myDate = new Date();
					var year = myDate.getFullYear();
					var month = myDate.getMonth() + 1;
					var day = myDate.getDate();
					var hours = myDate.getHours();
					var minutes = myDate.getMinutes();
					var seconds = myDate.getSeconds();
					var curDateTime = year;
					if (month > 9) {
						curDateTime = curDateTime + "" + month;
					} else {
						curDateTime = curDateTime + "0" + month;
					}
					if (day > 9) {
						curDateTime = curDateTime + day;
					} else {
						curDateTime = curDateTime + "0" + day;
					}
					if (hours > 9) {
						curDateTime = curDateTime + hours;
					} else {
						curDateTime = curDateTime + "0" + hours;
					}
					if (minutes > 9) {
						curDateTime = curDateTime + minutes;
					} else {
						curDateTime = curDateTime + "0" + minutes;
					}
					if (seconds > 9) {
						curDateTime = curDateTime + seconds;
					} else {
						curDateTime = curDateTime + "0" + seconds;
					}
					fileName = fileName + "_" + curDateTime + ".xls";
					var frm = document.getElementById("exprotExcelFlow");
					frm.elements["downloadFile"].value = filePath;
					frm.elements["fileName"].value = fileName;
					frm.submit();
				},
				error : function() {
					showTips("导出数据异常，请联系管理员！", "danger");
				}
			});
		}						

		function payType(e) {
			return nui.getDictText("payType", e.value);
		}

		function ZH_INVOICE_NAME_TYPE(e) {
			return nui.getDictText("ZH_INVOICE_NAME_TYPE", e.value);
		}

		function MIS_MA_INVOICETYPE(e) {
			return nui.getDictText("MIS_MA_INVOICETYPE", e.value);
		}

		function CONTRACT_NATURE(e) {
			return nui.getDictText("CONTRACT_NATURE", e.value);
		}

		function ZH_CONTRACT_TYPE(e) {
			return nui.getDictText("ZH_CONTRACT_TYPE", e.value);
		}
	</script>

</body>
</html>