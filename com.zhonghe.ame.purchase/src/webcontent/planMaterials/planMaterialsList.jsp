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
<title>交流拜访信息</title>
</head>
<body>
	<div style="width: auto; height: 99%; padding: 5px;">
		<div class="nui-splitter" style="width: 100%; height: 100%">
			<div size="25%">
				<div class="nui-toolbar" style="border-left: 0px; border-right: 0px; border-top: 0px; padding: 5px;">客户</div>
				<div class="nui-toolbar" style="border-left: 0px; border-right: 0px; border-top: 0px; padding: 5px;">
					<div id="form1">
						<input class="nui-hidden" name="criteria._entity" value="com.zhonghe.ame.marketInfo.customerInfo.MisCustinfoNew" />
						<table>
							<td style="width: 60px; text-align: right;">客户名称:</td>
							<td style="width: 205px">
								<input name="criteria._expr[0]._value" class="nui-combobox" valueField="custname" url="com.zhonghe.ame.marketInfo.marketinfo.khxx.commpetior.queryCustInfoLike.biz.ext" filterType="like"
									textField="custname" dataField="custinfos" valueFromSelect="true" allowInput="true" style="width: 200px" onvaluechanged="triggerSearch" />
								<input class="nui-hidden" name="criteria._expr[0]._property" value="custname" />
								<input class="nui-hidden" name="criteria._expr[0]._op" value="like" />
							</td>
							<td>
								<a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查询</a>
								<a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset()">重置</a>
							</td>
						</table>
					</div>
				</div>
				<div class="nui-toolbar" style="border-left: 0px; border-right: 0px; border-top: 0px; padding: 5px;">
					<table>
						<tr>
							<td>
								<a class="nui-button" id="add" iconCls="icon-add" onclick="add()">新增</a>
								<a class="nui-button" id="edit" iconCls="icon-edit" onclick="edit()">编辑</a>
								<a class="nui-button" id="del" iconCls="icon-remove" onclick="deleteInfo()">删除</a>
							</td>
						</tr>
					</table>
				</div>
				<div class="nui-fit" style="padding: 2px">
					<div id="datagrid1" class="nui-datagrid" style="width: 100%; height: 100%;" url="com.zhonghe.ame.marketInfo.marketinfo.khxx.commpetior.queryCustInfo.biz.ext" dataField="custinfos"
						sizeList="[23,30,50,100]" pageSize="23" allowAlternating="true" onselectionchanged="onSelectionChanged">
						<div property="columns">
							<div type="checkcolumn" width="10"></div>
							<div field="custid" visible="false">客户主键</div>
							<div field="custname" align="left" headerAlign="center">客户名称</div>
						</div>
					</div>
				</div>
			</div>
			<div size="75%">
				<div class="nui-toolbar" style="border-left: 0px; border-right: 0px; border-top: 0px; padding: 5px;">交流拜访记录</div>
				<div class="nui-toolbar" style="border-left: 0px; border-right: 0px; border-top: 0px; padding: 5px;">
					<div id="formVis">
						<table>
							<td style="width: 60px; text-align: right;">客户名称:</td>
							<td style="width: 205px">
								<input name="criteria._expr[0]._value" class="nui-combobox" valueField="custid" url="com.zhonghe.ame.marketInfo.marketinfo.khxx.commpetior.queryCustInfoLike.biz.ext" filterType="like"
									textField="custname" dataField="custinfos" valueFromSelect="true" allowInput="true" style="width: 200px" />
								<input class="nui-hidden" name="criteria._expr[0]._property" value="custinfoId" />
								<input class="nui-hidden" name="criteria._expr[0]._op" />
							</td>
							<td style="width: 60px; text-align: right;">接洽日期:</td>
							<td colspan="2" style="width: 245px">
								<input class="nui-hidden" name="criteria._expr[1]._op" value="between" />
								<input class="nui-hidden" name="criteria._expr[1]._pattern" value="yyyy-MM-dd" />
								<input class="nui-hidden" name="criteria._expr[1]._property" value="visitDate" />
								<input class="mini-datepicker" name="criteria._expr[1]._min" style="width: 110px" />
								<span>至</span>
								<input class="mini-datepicker" name="criteria._expr[1]._max" style="width: 110px" />
							</td>
							<td style="width: 60px; text-align: right;">填报部门:</td>
							<td style="width: 155px">
								<input id="orgid2" name="criteria._ref[0]._expr[0]._value" class="nui-combobox" textField="orgname" valueField="orgseq" dataField="orgs" showNullItem="true" allowInput="true"
									style="width: 150px" valueFromSelect="true" />
								<input class="nui-hidden" name="criteria._expr[2]._property" value="orgid" />
								<input class="nui-hidden" name="criteria._expr[2]._op" value="in" />
								<input class="nui-hidden" name="criteria._expr[2]._ref" value="1" />
								<input class="nui-hidden" name="criteria._ref[0]._id" value="1" />
								<input class="nui-hidden" name="criteria._ref[0]._entity" value="org.gocom.abframe.dataset.organization.OmOrganization" />
								<input class="nui-hidden" name="criteria._ref[0]._select._field[0]" value="orgid" />
								<input class="nui-hidden" name="criteria._ref[0]._expr[0]._property" value="orgseq" />
								<input class="nui-hidden" name="criteria._ref[0]._expr[0]._op" value="like" />
								<input class="nui-hidden" name="criteria._ref[0]._expr[0]._likeRule" value="end" />
								<input class="nui-hidden" name="criteria._expr[3]._property" value="orgid" />
								<input class="nui-hidden" name="criteria._expr[3]._op" value="in" />
								<input class="nui-hidden" name="criteria._expr[3]._value" id="orgids2" />
							</td>
							<td>
								<a class="nui-button" id="searchVis" iconCls="icon-search" onclick="searchVis()">查询</a>
								<a class="nui-button" id="resetVis" iconCls="icon-reload" onclick="resetVis()">重置</a>
							</td>
						</table>
					</div>
				</div>
				<div class="nui-toolbar" style="border-left: 0px; border-right: 0px; border-top: 0px; padding: 5px;">
					<table>
						<tr>
							<td>
								<a class="nui-button" id="addVisit" iconCls="icon-add" onclick="addVisit()">新增</a>
								<a class="nui-button" id="editVisit" iconCls="icon-edit" onclick="editVisit()">编辑</a>
								<a class="nui-button" id="delVisit" iconCls="icon-remove" onclick="deleteVisit()">删除</a>
								<a class="nui-button" id="export" iconCls="icon-download" onclick="exportExcel()">导出</a>
							</td>
						</tr>
					</table>
				</div>
				<div class="nui-fit" style="padding: 2px">
					<div id="visitgrid1" class="nui-datagrid" style="width: 100%; height: 100%;" url="com.zhonghe.ame.marketInfo.marketinfo.khxx.commpetior.queryCustVisit.biz.ext" dataField="custVisits"
						sizeList="[25,30,50,100]" pageSize="25" allowAlternating="true" onrowdblclick="doView" onpreload="isIncludeFile">
						<div property="columns">
							<div type="checkcolumn" width="15"></div>
							<div field="id" visible="false">主键</div>
							<div field="custinfoId" visible="false">客户主键</div>
							<div field="orgid" visible="false">组织主键</div>
							<div field="orgname" visible="false">组织名称</div>
							<div field="createUserid" visible="false">填报人主键</div>
							<div field="empname" visible="false">填报人名称</div>
							<div field="visitDate" dateFormat="yyyy-MM-dd" align="center" headerAlign="center" width="30" allowSort="true" renderer="lookInfo">接洽时间</div>
							<div field="custname">客户名称</div>
							<div field="visitAddress" headerAlign="center">接洽地点</div>
							<div field="visitResult" headerAlign="center">主要议题及成果</div>
							<div field="visitMeetingPerson" headerAlign="center">主要参会人员</div>
							<div align="center" headerAlign="center" renderer="onActionRenderer" width="30">填报人/部门</div>
							<div field="isIncludeFile" align="center" headerAlign="center" width="20">含附件</div>
						</div>
					</div>
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
		var formVis = new nui.Form("#formVis");
		var grid = nui.get("datagrid1");
		var visitGrid = nui.get("visitgrid1");
		var currentSelRow = null;

		init();

		function init() {
			//code:对应功能编码，map：对于机构的查询条件
			var json = {
				"code" : "khxxgl"
			};
			nui.ajax({
				url : "com.primeton.eos.ame_auth.ame_auth.getownorg1.biz.ext",
				data : json,
				type : 'POST',
				contentType : 'text/json',
				success : function(text) {
					nui.get("orgid2").setData(text.orgs);
					nui.get("orgids2").setValue(text.orgids);
				}
			});
			currentSelRow = null;
			grid.sortBy("createDate", "desc");
			grid.load();
			visitGrid.sortBy("visitDate", "desc");
			visitGrid.load();
		}

		function search() {
			currentSelRow = null;
			var data = form.getData();
			grid.sortBy("createDate", "desc");
			grid.load(data);
			visitGrid.clearRows();
		}

		function reset() {
			form.reset();
			formVis.reset();
			init();
		}

		function searchVis() {
			var data = nui.decode(formVis.getData(), true);
			visitGrid.sortBy("visitDate", "desc");
			visitGrid.load(data);
		}

		function resetVis() {
			form.reset();
			formVis.reset();
			init();
		}

		function add() {
			nui.open({
				url : "/default/marketInfo/customer/addCustomerInfo.jsp",
				width : '580',
				height : '150',
				title : "新增客户信息",
				onload : function() {
					var iframe = this.getIFrameEl();
				},
				ondestroy : function(action) {
					search();
				}
			})
		}

		function edit() {
			var row = grid.getSelecteds();
			if (row.length > 1 || row.length == 0) {
				showTips("只能选中一条记录进行编辑", "danger");
				return;
			} else {
				var data = row[0];
				var json = nui.encode({
					'loginUserId' : userId,
					'createUserId' : data.createUserid
				});
				nui.ajax({
					url : "com.zhonghe.ame.marketInfo.marketinfo.khxx.auth.queryCustVisitAuth.biz.ext",
					type : 'POST',
					data : json,
					contentType : 'text/json',
					success : function(o) {
						if (o.result == "1") {
							nui.open({
								url : "/default/marketInfo/customer/editCustomerInfo.jsp",
								width : '580',
								height : '150',
								title : "编辑客户信息",
								onload : function() {
									var iframe = this.getIFrameEl();
									iframe.contentWindow.setEditData(data);
								},
								ondestroy : function(action) {
									search();
								}
							})
						} else {
							showTips("您没有编辑权限，只有创建者及指定用户可以编辑！", "danger");
							return;
						}
					}
				});
			}
		}

		function deleteInfo() {
			var row = grid.getSelecteds();
			if (row.length > 1 || row.length == 0) {
				showTips("只能选中一条记录进行删除", "danger");
				return;
			} else {
				var row = row[0];
				var json = nui.encode({
					'loginUserId' : userId,
					'createUserId' : row.createUserid
				});
				nui.ajax({
					url : "com.zhonghe.ame.marketInfo.marketinfo.khxx.auth.queryCustVisitAuth.biz.ext",
					type : 'POST',
					data : json,
					contentType : 'text/json',
					success : function(o) {
						if (o.result == "1") {
							if (!confirm("是否删除？")) {
								return;
							} else {
								var json = nui.encode({
									'data' : row
								});
								nui.ajax({
									url : "com.zhonghe.ame.marketInfo.marketinfo.khxx.commpetior.deleteCustInfo.biz.ext",
									type : 'POST',
									data : json,
									contentType : 'text/json',
									success : function(o) {
										if (o.result == 1) {
											showTips("删除成功");
											currentSelRow = null;
											var data = form.getData();
											grid.sortBy("createDate", "desc");
											grid.load(data);
											visitGrid.clearRows();
										} else {
											showTips("删除失败，请联系管理员！", "danger");
										}
									}
								});
							}
						} else {
							showTips("您没有删除权限，只有创建者及指定用户可以删除！", "danger");
							return;
						}
					}
				});
			}
		}

		function onActionRenderer(e) {
			var record = e.record;
			var s = record.empname + "/" + record.orgname
			return s;
		}

		function onSelectionChanged() {
			currentSelRow = null;
			var row = grid.getSelected();
			currentSelRow = row;
			var json = {
				"criteria" : {
					"_expr" : [ {
						"custinfoId" : currentSelRow.custid
					} ]
				}
			};
			var data = nui.decode(json, true);
			visitGrid.sortBy("visitDate", "desc");
			visitGrid.load(data);
		}

		function addVisit() {
			if (currentSelRow == null) {
				showTips("请先在左侧选中一个客户，再新增交流拜访信息", "danger");
				return;
			} else {
				nui.open({
					url : "/default/marketInfo/customer/addCustomerVisit.jsp",
					width : '880',
					height : '750',
					title : "新增交流拜访信息",
					onload : function() {
						var iframe = this.getIFrameEl();
						iframe.contentWindow.setInitData(currentSelRow);
					},
					ondestroy : function(action) {
						var json = {
							"criteria" : {
								"_expr" : [ {
									"custinfoId" : currentSelRow.custid
								} ]
							}
						};
						var data = nui.decode(json, true);
						visitGrid.sortBy("visitDate", "desc");
						visitGrid.load(data);
					}
				})
			}
		}

		function editVisit() {
			var row = visitGrid.getSelecteds();
			if (row.length > 1 || row.length == 0) {
				showTips("只能选中一条记录进行编辑", "danger");
				return;
			} else {
				var data = row[0];
				var json = nui.encode({
					'loginUserId' : userId,
					'createUserId' : data.createUserid
				});
				nui.ajax({
					url : "com.zhonghe.ame.marketInfo.marketinfo.khxx.auth.queryCustVisitAuth.biz.ext",
					type : 'POST',
					data : json,
					contentType : 'text/json',
					success : function(o) {
						if (o.result == "1") {
							nui.open({
								url : "/default/marketInfo/customer/editCustomerVisit.jsp",
								width : '880',
								height : '750',
								title : "编辑交流拜访信息",
								onload : function() {
									var iframe = this.getIFrameEl();
									iframe.contentWindow.setEditData(data);
								},
								ondestroy : function(action) {
									if (currentSelRow == null) {
										visitGrid.sortBy("createDate", "desc");
										visitGrid.load();
									} else {
										var json = {
											"criteria" : {
												"_expr" : [ {
													"custinfoId" : currentSelRow.custid
												} ]
											}
										};
										var data = nui.decode(json, true);
										visitGrid.sortBy("visitDate", "desc");
										visitGrid.load(data);
									}
								}
							})
						} else {
							showTips("您没有编辑权限，只有创建者及指定用户可以编辑！", "danger");
							return;
						}
					}
				});
			}
		}

		function deleteVisit() {
			var row = visitGrid.getSelecteds();
			if (row.length > 1 || row.length == 0) {
				showTips("只能选中一条记录进行删除", "danger");
				return;
			} else {
				var row = row[0];
				var json = nui.encode({
					'loginUserId' : userId,
					'createUserId' : row.createUserid
				});
				nui.ajax({
					url : "com.zhonghe.ame.marketInfo.marketinfo.khxx.auth.queryCustVisitAuth.biz.ext",
					type : 'POST',
					data : json,
					contentType : 'text/json',
					success : function(o) {
						if (o.result == "1") {
							if (!confirm("是否删除？")) {
								return;
							} else {
								var json = nui.encode({
									'data' : row
								});
								nui.ajax({
									url : "com.zhonghe.ame.marketInfo.marketinfo.khxx.commpetior.deleteCustVisit.biz.ext",
									type : 'POST',
									data : json,
									contentType : 'text/json',
									success : function(o) {
										if (o.result == 1) {
											showTips("删除成功");
											if (currentSelRow == null) {
												visitGrid.sortBy("createDate", "desc");
												visitGrid.load();
											} else {
												var json = {
													"criteria" : {
														"_expr" : [ {
															"custinfoId" : currentSelRow.custid
														} ]
													}
												};
												var data = nui.decode(json, true);
												visitGrid.sortBy("visitDate", "desc");
												visitGrid.load(data);
											}
										} else {
											showTips("删除失败，请联系管理员！", "danger");
										}
									}
								});
							}
						} else {
							showTips("您没有删除权限，只有创建者及指定用户可以删除！", "danger");
							return;
						}
					}
				});
			}
		}

		function lookInfo(e) {
			return "<a href='javascript:void(0)' onclick='doView();' title='查看详情'>" + nui.formatDate(e.value, 'yyyy-MM-dd') + "</a>";
		}

		function doView() {
			var row = visitGrid.getSelecteds();
			if (row.length > 1 || row.length == 0) {
				showTips("需要选中一条记录", "danger");
				return;
			} else {
				var data = row[0];
				nui.open({
					url : "/default/marketInfo/customer/customerVisit.jsp",
					width : '880',
					height : '700',
					title : "交流拜访信息 - 详情",
					onload : function() {
						var iframe = this.getIFrameEl();
						iframe.contentWindow.setViewData(data);
					}
				})
			}
		}

		function triggerSearch() {
			search();
		}

		function isIncludeFile(e) {
			for (i = 0; i < e.result.custVisits.length; i++) {
				var json = nui.encode({
					'relationId' : e.result.custVisits[i].id,
					'groupId' : 'CUST_VISIT',
					'fileCatalog' : 'customerVisit'
				});
				nui.ajax({
					url : "com.zhonghe.ame.marketInfo.marketinfo.khxx.commpetior.isIncludeFile.biz.ext",
					async : false,
					type : 'POST',
					data : json,
					contentType : 'text/json',
					success : function(o) {
						if (o.result == "1") {
							e.result.custVisits[i].isIncludeFile = "有";
						} else {
							e.result.custVisits[i].isIncludeFile = "无";
						}
					}
				});
			}
		}
		
		//导出
		function exportExcel() {
			if (!confirm("是否确认导出？")) {
				return;
			}
			var formVis = new nui.Form("#formVis");
			var data = formVis.getData();
			data.sortField = "visitDate";
			data.sortOrder = "desc";
			var json = nui.encode(data);
			nui.ajax({
				url : "com.zhonghe.ame.marketInfo.marketinfo.khxx.commpetior.exportCustVisitExcel.biz.ext",
				type : "post",
				data : json,
				cache : false,
				contentType : 'text/json',
				success : function(o) {
					var filePath = o.downloadFile;
					var fileName = "拜访信息";
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