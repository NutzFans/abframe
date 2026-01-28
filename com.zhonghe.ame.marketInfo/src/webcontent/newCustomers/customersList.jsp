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
<title>公司客户信息</title>
</head>
<body>
	<div style="width: auto; height: 99%; padding: 5px;">
		<div id="searchForm">
			<div class="nui-toolbar" style="border-bottom: 0; padding: 5px;">
				<table>
					<tr>
						<td style="width: 60px; text-align: right;">客户名称：</td>
						<td style="width: 205px">
							<input name="criteria._expr[1]._value" class="nui-textbox" style="width: 200px" />
							<input name="criteria._expr[1]._property" value="custname" class="nui-hidden" />
							<input name="criteria._expr[1]._op" value="like" class="nui-hidden" />
						</td>
						<td style="width: 110px; text-align: right;">统一社会信用代码：</td>
						<td style="width: 205px">
							<input name="criteria._expr[2]._value" class="nui-textbox" style="width: 200px" />
							<input name="criteria._expr[2]._property" value="custnum" class="nui-hidden" />
							<input name="criteria._expr[2]._op" value="like" class="nui-hidden" />
						</td>
						<td style="width: 100px; text-align: right;">集团内/外：</td>
						<td>
							<input name="criteria._expr[5].outsideGroup" class="nui-dictcombobox" dictTypeId="ZH_GROUP_NEW" showNullItem="true" nullItemText="全部" style="width: 100px" />
						</td>
						<td style="width: 90px; text-align: right;">境内/外：</td>
						<td>
							<input name="criteria._expr[6].overseasCustomer" class="nui-dictcombobox" dictTypeId="ZH_OVERSEAS" showNullItem="true" nullItemText="全部" style="width: 100px" />
						</td>
					</tr>
					<tr>
						<td style="width: 60px; text-align: right;">客户类型：</td>
						<td style="width: 205px">
							<input name="criteria._expr[3]._value" class="nui-dictcombobox" dictTypeId="CUSTOMER_TYPE" showNullItem="true" nullItemText="全部" multiSelect="true" style="width: 200px" />
							<input name="criteria._expr[3]._property" value="custtype" class="nui-hidden" />
							<input name="criteria._expr[3]._op" value="in" class="nui-hidden" />
						</td>
						<td style="width: 60px; text-align: right;">所属省份：</td>
						<td style="width: 155px">
							<input name="criteria._expr[4]._value" class="nui-dictcombobox" dictTypeId="AME_PROVINCE" showNullItem="true" nullItemText="全部" multiSelect="true" style="width: 200px" />
							<input name="criteria._expr[4]._property" value="provinces" class="nui-hidden" />
							<input name="criteria._expr[4]._op" value="in" class="nui-hidden" />
						</td>
						<td style="width: 60px; text-align: right;">审批状态：</td>
						<td>
							<input name="criteria._expr[7].appStatus" class="nui-dictcombobox" dictTypeId="ZH_FLOW_TYPE" showNullItem="true" nullItemText="全部" style="width: 100px" />
						</td>
						<td colspan="2">
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
						<a class="nui-button" id="khxx_add" iconCls="icon-add" onclick="add()">新增</a>
						<a class="nui-button" id="khxx_edit" iconCls="icon-edit" onclick="edit()">维护</a>
						<a class="nui-button" id="khxx_del" iconCls="icon-remove" onclick="del()">删除</a>
						<a class="nui-button" id="khxx_zf" iconCls="icon-edit" onclick="zf_edit()">作废</a>
						<a class="nui-button" id="khxx_export" iconCls="icon-download" onclick="khExcel()">导出</a>
					</td>
				</tr>
			</table>
		</div>

		<div class="nui-fit">
			<div id="dataGrid" sizeList="[25,50,100]" showPager="true" dataField="dataList" pageSize="25" class="nui-datagrid" style="width: 100%; height: 100%;" multiSelect="true"
				url="com.zhonghe.ame.marketInfo.marketinfo.khxx.newCustomers.queryNewCustomersList.biz.ext" frozenStartColumn="0" frozenEndColumn="3">
				<div property="columns">
					<div type="checkcolumn"></div>
					<div field="custname" width="300" headerAlign="center" allowSort="true" align="left">客户名称</div>
					<div field="custnum" width="200" headerAlign="center" allowSort="true" align="left">统一社会信用代码</div>
					<div field="custtype" width="200" headerAlign="center" allowSort="true" align="center" renderer="CUSTOMER_TYPE">客户类型</div>
					<div field="provinces" width="150" headerAlign="center" allowSort="true" align="center" renderer="AME_PROVINCE">所属省份</div>
					<div field="outsideGroup" width="100" headerAlign="center" allowSort="true" align="center" renderer="ZH_GROUP_NEW">集团内/外</div>
					<div field="overseasCustomer" width="100" headerAlign="center" allowSort="true" align="center" renderer="ZH_OVERSEAS">境内/外</div>
					<div field="custmanager" width="100" headerAlign="center" allowSort="true" align="center">创建人</div>
					<div field="createDate" width="100" headerAlign="center" allowSort="true" align="center">创建时间</div>
					<div field="accoutname" width="100" headerAlign="center" allowSort="true" align="center">创建单位</div>
					<div field="appStatus" width="100" headerAlign="center" allowSort="true" align="center" renderer="onActionRenderer">审核状态</div>
					<div field="remark" width="300" headerAlign="center" allowSort="true" align="center">备注</div>
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
		var searchForm = new nui.Form("#searchForm");
		var dataGrid = nui.get("dataGrid");

		init();

		function init() {
			// 按钮权限
			if (userId != 'sysadmin') {
				getOpeatorButtonAuth("khxx_edit,khxx_del,khxx_zf,khxx_export");
			}
			search();
		}

		function search() {
			var data = searchForm.getData();
			dataGrid.sortBy("createDate", "desc");
			dataGrid.load(data);
		}

		function reset() {
			searchForm.reset();
			init();
		}

		function add() {
			nui.open({
				url : "/default/marketInfo/newCustomers/addCustomers.jsp",
				width : "600",
				height : "500",
				allowResize : false,
				title : "客户信息 - 新增",
				onload : function() {
					var iframe = this.getIFrameEl();
				},
				ondestroy : function(action) {
					search();
				}
			});
		}

		function CUSTOMER_TYPE(e) {
			return nui.getDictText("CUSTOMER_TYPE", e.value);
		}

		function AME_PROVINCE(e) {
			return nui.getDictText("AME_PROVINCE", e.value);
		}

		function ZH_GROUP_NEW(e) {
			return nui.getDictText("ZH_GROUP_NEW", e.value);
		}
		
		function ZH_OVERSEAS(e) {
			return nui.getDictText("ZH_OVERSEAS", e.value);
		}		

		function onActionRenderer(e) {
			var record = e.record;
			var s = "<a  href='javascript:void(0)' onclick='feeView();' >" + nui.getDictText('ZH_FLOW_TYPE', e.value) + "</a>";
			return s;
		}

		function feeView() {
			var selectRow = dataGrid.getSelected();
			var processId = selectRow.processid;
			var url = "/default/bps/wfclient/task/processinstView.jsp";
			var title = "流程图查看";
			var width = "100%";
			nui.open({
				url : url,
				title : title,
				width : width,
				height : "100%",
				onload : function() {
					var iframe = this.getIFrameEl();
					if (iframe.contentWindow.initData) {
						iframe.contentWindow.initData({
							"processInstID" : processId
						});
					}
				}
			});
		}

		function zf_edit() {
			var row = dataGrid.getSelecteds();
			if (row.length > 1 || row.length == 0) {
				showTips("只能选中一条客户信息进行作废", "danger");
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
								url : "com.zhonghe.ame.marketInfo.marketinfo.khxx.newCustomers.zfNewCustInfo.biz.ext",
								type : 'POST',
								data : json,
								contentType : 'text/json',
								success : function(o) {
									if (o.result == 1) {
										showTips("作废成功");
										dataGrid.reload();
									} else {
										showTips("作废失败，请联系信息技术部人员！", "danger");
									}
								}
							});
						} else {
							showTips("只能选中一条客户信息进行作废", "danger");
						}
					}
				} else {
					showTips("只能作废审批状态为【审批通过】的数据", "danger");
				}
			}
		}
		
		function del() {
			var rows = dataGrid.getSelecteds();
			if (rows.length == 0) {
				showTips("请选中需要删除的客户信息", "danger");
			}else{
				var status = rows.every(item => item.appStatus == '4');
				if(status){
					if (!confirm("是否删除？")) {
						return;
					}else{
						var datas = rows.map(row => ({ custid: row.custid }));
						var json = nui.encode({
							'datas' : datas
						});
						nui.ajax({
							url : "com.zhonghe.ame.marketInfo.marketinfo.khxx.newCustomers.deleteNewCustInfo.biz.ext",
							type : 'POST',
							data : json,
							contentType : 'text/json',
							success : function(o) {
								if (o.result == 1) {
									showTips("删除成功");
									dataGrid.reload();
								} else {
									showTips("删除失败，请联系信息技术部人员！", "danger");
								}
							}
						});
					}				
				}else{
					showTips("只能删除审批状态为【作废】的数据", "danger");
				}
			}
		}
		
		function edit() {
			var row = dataGrid.getSelecteds();
			if (row.length > 1 || row.length == 0) {
				showTips("只能选中一条客户信息维护", "danger");
				return;
			}
			var data = row[0];
			if (data.appStatus == "2") {
				nui.open({
					url : "/default/marketInfo/newCustomers/editCustomers.jsp",
					width : "600",
					height : "450",
					allowResize : false,
					title : "客户信息 - 维护",
					onload : function() {
						var iframe = this.getIFrameEl();
						iframe.contentWindow.setEditData(data);
					},
					ondestroy : function(action) {
						if (action == "ok") {
							dataGrid.reload();
						}
						search();
					}
				});				
			} else {
				showTips("只能维护审批状态为【审批通过】的数据", "danger");
			}
		}
		
		function khExcel(){
			var rows = dataGrid.getSelecteds();
			var json;
			if(rows.length == 0){
				if (!confirm("是否确认导出？")) {
					return;
				}
				var data = searchForm.getData(); //获取表单JS对象数据
				json = nui.encode(data);				
			}else{
				if (!confirm("确定要导出选中数据(如需导出查询结果数据，请取消选中)？")) {
					return;
				}
				var ids = rows.map(row => row.custid).join(',');
				json = nui.encode({
						"criteria":{
							"_expr": [{
								"_property": "custid",
								"_op": "in",
								"_value": ids
							}]
						}
					}
				);								
			}
			nui.ajax({
				url : "com.zhonghe.ame.marketInfo.marketinfo.khxx.newCustomers.exportNewCustInfo.biz.ext",
				type : "post",
				data : json,
				cache : false,
				contentType : 'text/json',
				success : function(o) {
					var filePath = o.downloadFile;
					var fileName = "客户信息";
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
		
	</script>

</body>
</html>