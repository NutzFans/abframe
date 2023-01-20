<%@page import="com.eos.data.datacontext.UserObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<head>
<title>开票管理</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%=request.getContextPath()%>/common/nui/nui.js" type="text/javascript"></script>
<style type="text/css">
html,body {
	margin: 0;
	padding: 0;
	border: 0;
	width: 100%;
	height: 100%;
	overflow: hidden;
}

.nui-radiobuttonlist-item {
	float: left;
	margin-left: 200px;
	color: pink;
}
</style>
</head>
<body>
	<div class="nui-panel" title="开票管理" style="width: 100%; height: 100%">
		<div id="form1">
			<input class="nui-hidden" name="critria._entity" value="com.zhonghe.ame.invoice.ZhInvoice.ZhInvoiceEntity" />
			<div class="nui-toolbar" style="border-bottom: 0; padding: 0px;">
				<table align="center" border="0" width="100%" class="form_table">
					<tr>
						<td class="form_label" align="right">申请人:</td>
						<td colspan="1">
							<input name="critria._expr[1]._value" class="nui-textbox" style="width: 65%;" id="createname" />
							<input class="nui-hidden" name="critria._expr[1]._property" value="empname" />
							<input class="nui-hidden" name="critria._expr[1]._op" value="like" />
							<input name="critria._expr[2]._value" class="nui-hidden" id="createUserid" />
							<input class="nui-hidden" name="critria._expr[2]._property" value="createUserid" />
						</td>
						<td class="form_label" align="right">合同编号:</td>
						<td colspan="1">
							<input name="critria._expr[3]._value" class="nui-textbox" style="width: 65%;" />
							<input class="nui-hidden" name="critria._expr[3]._property" value="contractNo" />
							<input class="nui-hidden" name="critria._expr[3]._op" value="like" />
						</td>
						<td class="form_label" align="right">合同名称:</td>
						<td colspan="1">
							<input name="critria._expr[4]._value" class="nui-textbox" style="width: 65%;" />
							<input class="nui-hidden" name="critria._expr[4]._property" value="contractName" />
							<input class="nui-hidden" name="critria._expr[4]._op" value="like" />
						</td>
						<td class="form_label" align="right">审批状态:</td>
						<td colspan="1">
							<input name="critria._expr[20].appStatus" class="nui-dictcombobox" dictTypeId="ZH_FLOW_TYPE" style="width: 65%;" showNullItem="true" nullItemText="全部" />
						</td>
					</tr>
					<tr>
						<td class="form_label" align="right">(收费)合同实施部门:</td>
						<td colspan="1">
							<input id="orgid2" name="critria._ref[0]._expr[0]._value" style="width: 65%;" class="nui-combobox" textField="orgname" valueField="orgseq" dataField="orgs" showNullItem="true" allowInput="true" />
							<input class="nui-hidden" name="critria._expr[6]._property" value="implementOrg" />
							<input class="nui-hidden" name="critria._expr[6]._op" value="in" id="tempCond1" />
							<input class="nui-hidden" name="critria._expr[6]._ref" value="1" id="tempCond2" />
							<input class="nui-hidden" name="critria._ref[0]._id" value="1" />
							<input class="nui-hidden" name="critria._ref[0]._entity" value="org.gocom.abframe.dataset.organization.OmOrganization" />
							<input class="nui-hidden" name="critria._ref[0]._select._field[0]" value="orgid" />
							<input class="nui-hidden" name="critria._ref[0]._expr[0]._property" value="orgseq" />
							<input class="nui-hidden" name="critria._ref[0]._expr[0]._op" value="like" />
							<input class="nui-hidden" name="critria._ref[0]._expr[0]._likeRule" value="end" />
							<input class="nui-hidden" name="critria._expr[7]._property" value="implementOrg" />
							<input class="nui-hidden" name="critria._expr[7]._op" value="in" />
							<input class="nui-hidden" name="critria._expr[7]._value" id="orgids2" />
						</td>
						<td class="form_label" align="right">发票抬头:</td>
						<td colspan="1">
							<input name="critria._expr[8]._value" class="nui-dictcombobox" style="width: 65%;" dictTypeId="ZH_INVOICE_NAME_TYPE" nullItemText="全部" showNullItem="true" />
							<input class="nui-hidden" name="critria._expr[8]._property" value="invoiceNameType" />
							<input class="nui-hidden" name="critria._expr[8]._op" value="=" />
						</td>

						<td class="form_label" align="right">付款单位:</td>
						<td colspan="1">
							<input name="critria._expr[9]._value" class="nui-textbox" style="width: 65%;" />
							<input class="nui-hidden" name="critria._expr[9]._property" value="payerName" />
							<input class="nui-hidden" name="critria._expr[9]._op" value="like" />
						</td>
						<td class="form_label" align="right">专业类别:</td>
						<td colspan="1">
							<input name="critria._expr[13]._value" class="nui-dictcombobox" style="width: 65%;" dictTypeId="ZH_MAJOR_TYPE" nullItemText="全部" showNullItem="true" />
							<input class="nui-hidden" name="critria._expr[13]._property" value="major" />
							<input class="nui-hidden" name="critria._expr[13]._op" value="=" />
						</td>
						<td class="form_label" align="right">申请日期:</td>
						<td colspan="1">
							<input class="nui-hidden" name="critria._expr[5]._op" value="between" />
							<input class="nui-hidden" name="critria._expr[5]._pattern" value="yyyy-MM-dd" />
							<input class="nui-hidden" name="critria._expr[5]._property" value="createTime" />
							<input class="nui-datepicker" name="critria._expr[5]._min" />
							<span style="border-spacing: 0px; padding-left: 0.2em; padding-right: 0.2em;">至</span>
							<input class="nui-datepicker" name="critria._expr[5]._max" />
						</td>
					</tr>
					<tr>
						<td class="form_label" align="right">工程类别:</td>
						<td colspan="1">
							<input name="critria._expr[15]._value" class="nui-dictcombobox" style="width: 65%;" dictTypeId="ZH_PROJECT_TYPE" nullItemText="全部" showNullItem="true" />
							<input class="nui-hidden" name="critria._expr[15]._property" value="projectType" />
							<input class="nui-hidden" name="critria._expr[15]._op" value="=" />
						</td>
						<td class="form_label" align="right">集团内/外:</td>
						<td colspan="1">
							<input name="critria._expr[16]._value" class="nui-dictcombobox" style="width: 65%;" dictTypeId="ZH_GROUP" nullItemText="全部" showNullItem="true" />
							<input class="nui-hidden" name="critria._expr[16]._property" value="headquarterGroup" />
							<input class="nui-hidden" name="critria._expr[16]._op" value="=" />
						</td>
						<td class="form_label" align="right">用途:</td>
						<td colspan="1">
							<input name="critria._expr[17]._value" class="nui-dictcombobox" style="width: 65%;" dictTypeId="INVOICE_USED" nullItemText="全部" showNullItem="true" />
							<input class="nui-hidden" name="critria._expr[17]._property" value="invoiceUsed" />
							<input class="nui-hidden" name="critria._expr[17]._op" value="=" />
						</td>
						<td class="form_label" align="right">发票类型:</td>
						<td colspan="1">
							<input name="critria._expr[18]._value" class="nui-dictcombobox" style="width: 65%;" dictTypeId="MIS_MA_INVOICETYPE" nullItemText="全部" showNullItem="true" />
							<input class="nui-hidden" name="critria._expr[18]._property" value="invoiceType" />
							<input class="nui-hidden" name="critria._expr[18]._op" value="=" />
						</td>
						<td class="form_label" align="right">回款日期:</td>
						<td colspan="1">
							<input class="nui-hidden" name="critria._expr[14]._op" value="between" />
							<input class="nui-hidden" name="critria._expr[14]._pattern" value="yyyy-MM-dd" />
							<input class="nui-hidden" name="critria._expr[14]._property" value="receivableData" />
							<input class="nui-datepicker" name="critria._expr[14]._min" />
							<span style="border-spacing: 0px; padding-left: 0.2em; padding-right: 0.2em;">至</span>
							<input class="nui-datepicker" name="critria._expr[14]._max" />
						</td>
					</tr>
					<tr>
						<td colspan="9" align="center">
							<a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查询</a>
							<a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset()">重置</a>
						</td>
					</tr>
				</table>
			</div>
		</div>
		<div class="nui-toolbar" style="border-bottom: 0; padding: 0px;">
			<table style="width: 100%;">
				<tr>
					<td style="width: 20%;">
						<a class="nui-button" id="add" iconCls="icon-add" onclick="add()">新增</a>
						<a class="nui-button" id="edit" iconCls="icon-edit" onclick="zc_edit()">编辑</a>
						<a class="nui-button" id="del" iconCls="icon-remove" onclick="deleteInfo()">删除</a>
						<a class="nui-button" id="kjfplist_wh" iconCls="icon-edit" onclick="wh_edit()">维护</a>
						<a class="nui-button" id="checkview" iconCls="icon-print" onclick="printBtn()">打印</a>
						<a class="nui-button" id="export" iconCls="icon-download" onclick="exportExcel()">导出</a>
					</td>
				</tr>
			</table>
		</div>
		<div class="nui-fit">
			<div id="datagrid1" frozenStartColumn="0" sizeList="[10,20,50,100]" showPager="true" dataField="data" showSummaryRow="true" sortMode="client" ondrawsummarycell="onDrawSummaryCell"
				class="nui-datagrid" style="width: 100%; height: 90%;" url="com.zhonghe.ame.invoice.invoice.queryinvoiceAll.biz.ext" multiSelect="false" allowSortColumn=true ondrawcell="setBackGroundColor"
				showSummaryRow="true" frozenStartColumn="0" frozenEndColumn="9">
				<div property="columns">
					<div type="checkcolumn"></div>
					<div type="indexcolumn" width="70" align="center" headerAlign="center">序号</div>
					<div field="invoiceNameType" align="center" headerAlign="center" allowSort="true" renderer="zhInvoiceNameType">发票抬头</div>
					<div field="createTime" dateFormat="yyyy-MM-dd" width="80" align="center" headerAlign="center" allowSort="true">开票日期</div>
					<div field="empname" width="70" align="center" headerAlign="center" allowSort="true">经办人</div>
					<div field="orgname" width="200" align="center" headerAlign="center" allowSort="true">承办部门</div>
					<div field="contractNo" width="180" align="center" headerAlign="center" allowSort="true">合同编号</div>
					<div field="contractName" width="150" align="center" headerAlign="center" allowSort="true" renderer="lookInfo">合同名称</div>
					<div field="payerName" width="180" align="center" headerAlign="center" allowSort="true">付款单位</div>
					<div field="appStatus" align="center" headerAlign="center" allowSort="true" renderer="onActionRenderer">审批状态</div>
					<div field="invoiceSum" width="100" align="center" headerAlign="center" allowSort="true" summaryType="sum">开票金额（元）</div>
					<div field="bookIncome" width="100" align="center" headerAlign="center" allowSort="true" summaryType="sum">账面收入（元）</div>
					<div field="invoiceTax" width="100" align="center" headerAlign="center" allowSort="true" summaryType="sum">税额（元）</div>
					<div field="receivableSum" width="100" align="center" headerAlign="center" allowSort="true" summaryType="sum">回款金额（元）</div>
					<div field="balanceSum" width="100" align="center" headerAlign="center" allowSort="true" summaryType="sum">余额（元）</div>
					<div field="receivableData" dateFormat="yyyy-MM-dd" width="80" align="center" headerAlign="center">回款时间</div>
					<div field="major" align="center" headerAlign="center" allowSort="true" renderer="ZH_MAJOR_TYPE">专业类别</div>
					<div field="projectType" align="center" headerAlign="center" allowSort="true" renderer="ZH_PROJECT_TYPE">工程类别</div>
					<div field="headquarterGroup" align="center" headerAlign="center" allowSort="true" renderer="ZH_GROUP">集团内/外</div>
					<div field="invoiceUsed" align="center" headerAlign="center" allowSort="true" renderer="INVOICE_USED">用途</div>
					<div field="invoiceType" align="center" headerAlign="center" allowSort="true" renderer="MIS_MA_INVOICETYPE">发票类型</div>
					<div field="verification" width="100" align="center" headerAlign="center" allowSort="true" summaryType="sum">核查（元）</div>
				</div>
			</div>
		</div>
	</div>
	
	<form name="exprotExcelFlow" id="exprotExcelFlow" action="com.primeton.eos.ame_common.ameExportCommon.flow" method="post">
		<input type="hidden" name="_eosFlowAction" value="action0" filter="false"/>
		<input type="hidden" name="downloadFile" filter="false"/>
		<input type="hidden" name="fileName" filter="false"/>
	</form>
	
	<script type="text/javascript">
		nui.parse();
		var form = new nui.Form("#form1");
		var grid = nui.get("datagrid1");
		var type = <%=request.getParameter("type")%>;
		var reve_grid = nui.get("reve_grid");
		var json=nui.encode({"iden": "1","expseq": null,"feeseq": null,"parentfeetypeid": null});
		
		init();
		
		function init(){
			// 按钮权限
			if(userId !='sysadmin'){
				// 维护按钮 - kjfplist_wh
				getOpeatorButtonAuth("kjfplist_wh");
			}

			//code:对应功能编码，map：对于机构的查询条件
			var json = {"code":"kjfplist","map":{"property":"status","op":"=","value":"running"}};
			nui.ajax({
				url:"com.primeton.eos.ame_auth.ame_auth.getownorg1.biz.ext",
				data:json,
				type:'POST',
				contentType:'text/json',
				success : function(text) {
					if (text.orgs) {
						var orgids = text.orgids;
						if (text.orgs.length == 0) {
							//当没有有权的机构时将申请人设置为登陆人
							nui.get("createUserid").setValue(userId);
							nui.get("createname").setValue(userName);
							nui.get("createname").setReadOnly(true);
						}
						nui.get("orgid2").setData(text.orgs);
						if (orgids != null) {
							orgids = orgids.split(",");
							if (!isStr(orgids, "1")) {
								//根据情况选择一种
								nui.get("orgids2").setValue(text.orgids);
							}
						}
					} else {
						//当没有有权的机构时将申请人设置为登陆人
						nui.get("createUserid").setValue(userId);
						nui.get("createname").setValue(userName);
						nui.get("createname").setReadOnly(true);
					}
					search();
				}
			});
		}
		
		function isStr(str, val) {
			if (str.indexOf(val) != -1) {
				return true
			} else {
				return false
			}
		}

		function search() {
			var form = new nui.Form("#form1");
			var data = form.getData(); //获取表单JS对象数据
			grid.sortBy("createTime", "desc");
			grid.load(data); //datagrid加载数据
		}

		function lookInfo(e) {
			return "<a href='javascript:void(0)' onclick='doView();' title='点击查看'>" + e.value + "</a>";
		}

		function doView() {
			var selectRow = grid.getSelected();
			var url = "<%=request.getContextPath()%>/contractPact/print/invoiceListPrint.jsp";
			var myWindow = window.open(url);
			myWindow.onload = function() {
				myWindow.document.title = "发票信息查看";
				myWindow.setViewData(selectRow);
			};
		}
		
		function printBtn() {
			var selectRow = grid.getSelected();
			if (selectRow) {
				var url = "<%=request.getContextPath()%>/contractPact/print/invoiceListPrint.jsp?id=" + selectRow.id;
				var myWindow = window.open(url);
				myWindow.onload = function() {
					myWindow.document.title = "打印页面";
					myWindow.setViewData(selectRow);
				};
			} else {
				showTips("请选中一条记录", "danger");
			}
		}
		
		function reset() {
			var form = new nui.Form("#form1");
			form.reset();
			grid.load();
			search()
		}
		
		function onOk() {
			search();
		}
		
		function wh_edit() {
			var row = grid.getSelecteds();
			var row = grid.getSelecteds();
			if (row.length > 1 || row.length == 0) {
				showTips("只能选中一条项目记录进行维护", "danger");
				return;
			}
			var data = row[0];
			if (data.appStatus == "2") {
				nui.open({
					url : "/default/contractPact/invoice/invoiceUpdate.jsp",
					width : '100%',
					height : '100%',
					title : "开票信息维护",
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
			
			}else{
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
					url : "com.zhonghe.ame.invoice.invoice.getWorkItemByProcessInstID.biz.ext",
					data : json,
					success : function(result) {
						if(JSON.stringify(result) !== '{}'){
							nui.open({
								url : "/default/bps/wfclient/task/dispatchTaskExecute.jsp?workItemID="+ result.workItemID,
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
			}else{
				showTips("只能编辑审批状态为【草稿】的数据", "danger");
			}
		}		
		
		function setBackGroundColor(e) {
			var record = e.record;
			if (record.appStatus == "0") {
				e.rowStyle = "background-color: #FFFF99";
			} else if (record.appStatus == "1") {
				e.rowStyle = "background-color: #FF99CC";
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
								url : "com.zhonghe.ame.invoice.invoice.deleteInvoiceById.biz.ext",
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
				}else{
					showTips("只能删除审批状态为【作废】的数据", "danger");
				}
			}
		}
		
		function onShowRowDetail(e) {
			var grid = e.sender;
			var row = e.record;
			var td = grid.getRowDetailCellEl(row);
			td.appendChild(detailGrid_Form);
			detailGrid_Form.style.display = "block";
			reve_grid.load({
				id : row.id
			});
		}
		
		function onKeyEnter() {
			search();
		}
		
		function onActionRenderer(e) {
			var record = e.record;
			var processId = record.processid;
			var s = "<a  href='javascript:void(0)' onclick='feeView();' >" + nui.getDictText('ZH_FLOW_TYPE', e.value) + "</a>";
			return s;
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
		
		function ondealdate(e) {
			if (e.value) {
				var now = e.value;
				var year = now.getFullYear();
				var month = now.getMonth() + 1;
				var day = now.getDate();
				var hours = now.getHours();
				var minutes = now.getMinutes();
				var seconds = now.getSeconds();
				var curDateTime = year;
				if (month > 9) {
					curDateTime = curDateTime + "-" + month;
				} else {
					curDateTime = curDateTime + "-" + "0" + month;
				}
				if (day > 9) {
					curDateTime = curDateTime + "-" + day;
				} else {
					curDateTime = curDateTime + "-" + "0" + day;
				}
				if (hours > 9) {
					curDateTime = curDateTime + "   " + hours;
				} else {
					curDateTime = curDateTime + "   " + "0" + hours;
				}
				if (minutes > 9) {
					curDateTime = curDateTime + ":" + minutes;
				} else {
					curDateTime = curDateTime + ":" + "0" + minutes;
				}
				if (seconds > 9) {
					curDateTime = curDateTime + ":" + seconds;
				} else {
					curDateTime = curDateTime + ":" + "0" + seconds;
				}
				return curDateTime;
			}
		}
		
		function add() {
			nui.open({
				url : "/default/contractPact/invoice/invoiceAdd.jsp",
				width : '100%',
				height : '100%',
				title : "开票申请",
				onload : function() {
					var iframe = this.getIFrameEl();
				},
				ondestroy : function(action) {
					search();
				}
			})
		}
		
		function lookInfo(e) {
			return "<a href='javascript:void(0)' onclick='doView();' title='点击查看'>" + e.value + "</a>";
		}
		
		function doView() {
			var row = grid.getSelected();
			if (row) {
				executeUrl = "<%= request.getContextPath() %>/contractPact/print/invoiceListPrint.jsp?id=" + row.id;
				window.open(executeUrl);
			} else {
				showTips("请选中一条记录", "danger");
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
				url : "com.zhonghe.ame.invoice.invoice.exportInvoiceExcel.biz.ext",
				type : "post",
				data : json,
				cache : false,
				contentType : 'text/json',
				success : function(o) {
			     		var filePath = o.downloadFile;
			        	var fileName = "开票信息";
			        	var myDate = new Date();
			        	var year = myDate.getFullYear();
			        	var month = myDate.getMonth()+1;
			        	var day = myDate.getDate();
			        	var hours = myDate.getHours();
			        	var minutes = myDate.getMinutes();
			        	var seconds = myDate.getSeconds();
			        	var curDateTime = year;
		        		if(month>9){
						curDateTime = curDateTime + "" + month;
					}else{
						curDateTime = curDateTime + "0" + month;
					}
		        		if(day>9){
						curDateTime = curDateTime + day;
					}else{
						curDateTime = curDateTime + "0" + day;
					}
					if(hours>9){
						curDateTime = curDateTime + hours;
					}else{
						curDateTime = curDateTime + "0" + hours;
					}
					if(minutes>9){
						curDateTime = curDateTime + minutes;
					}else{
						curDateTime = curDateTime + "0" + minutes;
					}
					if(seconds>9){
						curDateTime = curDateTime + seconds;
					}else{
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

		function onDrawSummaryCell(e) {
			var result = e.result;
			var grid = e.sender;
		}

		function zhFlowType(e) {
			return nui.getDictText("ZH_FLOW_TYPE", e.value);
		}

		function zhContractType(e) {
			return nui.getDictText("ZH_CONTRACT_TYPE", e.value);
		}

		function zhInvoiceContent(e) {
			return nui.getDictText("ZH_INVOICE_CONTENT", e.value);
		}

		function zhInvoiceType(e) {
			return nui.getDictText("MIS_MA_INVOICETYPE", e.value);
		}

		function zhInvoiceNameType(e) {
			return nui.getDictText("ZH_INVOICE_NAME_TYPE", e.value);
		}

		function PAYER(e) {
			return nui.getDictText("PAYER", e.value);
		}

		function ZH_MAJOR_TYPE(e) {
			return nui.getDictText("ZH_MAJOR_TYPE", e.value);
		}

		function ZH_PROJECT_TYPE(e) {
			return nui.getDictText("ZH_PROJECT_TYPE", e.value);
		}

		function ZH_GROUP(e) {
			return nui.getDictText("ZH_GROUP", e.value);
		}

		function INVOICE_USED(e) {
			return nui.getDictText("INVOICE_USED", e.value);
		}

		function MIS_MA_INVOICETYPE(e) {
			return nui.getDictText("MIS_MA_INVOICETYPE", e.value);
		}
	</script>
</body>
</html>