<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<head>
<title>采购立项列表</title>
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
</head>
<body>
	<div style="width: auto; height: 99%; padding: 5px;">
		<div id="form1">
			<div class="nui-toolbar" style="border-bottom: 0; padding: 5px;">
				<table>
					<tr>
						<td style="width: 60px; text-align: right;">经办人:</td>
						<td style="width: 155px">
							<input name="criteria._expr[50].createdUsername" class="nui-textbox" id="createUsername" style="width: 150px" />
							<input class="nui-hidden" name="criteria._expr[50]._op" value="like" id="createUsernameOp" />
							<input class="nui-hidden" name="criteria._expr[6].createdBy" id="createdBy" />
							<input class="nui-hidden" name="criteria._expr[6]._op" value="=" />
						</td>
						<td style="width: 90px; text-align: right;">采购需求单位:</td>
						<td style="width: 155px">
							<input id="orgseq" class="nui-combobox" textField="orgname" valueField="orgseq" dataField="orgs" showNullItem="true" allowInput="true" style="width: 150px" valueFromSelect="true" />
							<input class="nui-hidden" name="criteria._expr[10]._property" value="id" id="IdByOrgProp" />
							<input class="nui-hidden" name="criteria._expr[10]._op" value="in" id="IdByOrgOp" />
							<input class="nui-hidden" name="criteria._expr[10]._ref" value="1" id="IdByOrgRef" />
							<input class="nui-hidden" name="criteria._ref[0]._id" value="1" />
							<input class="nui-hidden" name="criteria._ref[0]._entity" value="com.zhonghe.ame.purchase.purchase.queryProAppIds" />
							<input class="nui-hidden" name="criteria._ref[0]._select._field[0]" value="ids" />
							<input class="nui-hidden" name="criteria._ref[0]._expr[0]._property" value="newOrgId" />
							<input class="nui-hidden" name="criteria._ref[0]._expr[0]._op" value="in" />
							<input class="nui-hidden" name="criteria._ref[0]._expr[0]._value" id="orgids" />
						</td>
						<td style="width: 60px; text-align: right;">立项名称:</td>
						<td style="width: 155px">
							<input name="criteria._expr[1]._value" class="nui-textbox" style="width: 150px" />
							<input class="nui-hidden" name="criteria._expr[1]._property" value="proAppName" />
							<input class="nui-hidden" name="criteria._expr[1]._op" value="like" />
						</td>
						<td style="width: 60px; text-align: right;">立项编号:</td>
						<td style="width: 155px">
							<input name="criteria._expr[2]._value" class="nui-textbox" style="width: 150px" />
							<input class="nui-hidden" name="criteria._expr[2]._property" value="proAppCode" />
							<input class="nui-hidden" name="criteria._expr[2]._op" value="like" />
						</td>
						<td style="width: 90px; text-align: right;">采购计划编号:</td>
						<td style="width: 155px">
							<input name="criteria._expr[3]._value" class="nui-textbox" style="width: 150px" />
							<input class="nui-hidden" name="criteria._expr[3]._property" value="purchaseNumber" />
							<input class="nui-hidden" name="criteria._expr[3]._op" value="like" />
							<input class="nui-hidden" id="ischange" name="criteria._expr[4].ischange" value="1" />
							<input class="nui-hidden" name="criteria._expr[4]._op" value="=" />
						</td>
						<td style="width: 90px; text-align: right;">立项申请金额:</td>
						<td style="width: 245px">
							<input class="nui-hidden" name="criteria._expr[21]._op" value="between" />
							<input class="nui-hidden" name="criteria._expr[21]._property" value="proAppApplyPriceDecimal" />
							<input class="nui-textbox" name="criteria._expr[21]._min" style="width: 110px" emptyText="万元" />
							<span>至</span>
							<input class="nui-textbox" name="criteria._expr[21]._max" style="width: 110px" emptyText="万元" />
						</td>
					</tr>
					<tr>
						<td style="width: 60px; text-align: right;">集采类型:</td>
						<td style="width: 155px">
							<input name="criteria._expr[51].type" class="nui-dictcombobox" dictTypeId="ZH_PURCHASE_NEW" showNullItem="true" nullItemText="全部" style="width: 150px" />
						</td>
						<td style="width: 60px; text-align: right;">采购方式:</td>
						<td style="width: 155px">
							<input name="criteria._expr[52].purchasMode" class="nui-dictcombobox" dictTypeId="ZH_CGFS" showNullItem="true" nullItemText="全部" style="width: 150px" />
						</td>
						<td style="width: 60px; text-align: right;">物项类别:</td>
						<td style="width: 155px">
							<input name="criteria._expr[53].proAppObjType" class="nui-dictcombobox" dictTypeId="MIS_APPOBJTYPE" showNullItem="true" nullItemText="全部" style="width: 150px" />
						</td>
						<td style="width: 60px; text-align: right;">审批状态:</td>
						<td style="width: 155px">
							<input name="criteria._expr[23].status" class="nui-dictcombobox" dictTypeId="ZH_FLOW_TYPE" showNullItem="true" nullItemText="全部" style="width: 150px" />
						</td>
						<td style="width: 60px; text-align: right;">申请日期:</td>
						<td style="width: 245px">
							<input class="nui-hidden" name="criteria._expr[22]._op" value="between" />
							<input class="nui-hidden" name="criteria._expr[22]._pattern" value="yyyy-MM-dd" />
							<input class="nui-hidden" name="criteria._expr[22]._property" value="createdTime" />
							<input class="nui-datepicker" name="criteria._expr[22]._min" style="width: 110px" />
							<span>至</span>
							<input class="nui-datepicker" name="criteria._expr[22]._max" style="width: 110px" />
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
						<a class="nui-button" id="add" iconCls="icon-add" onclick="add()">新增</a>
						<a class="nui-button" id="edit" iconCls="icon-edit" onclick="zc_edit()">编辑</a>
						<a class="nui-button" id="del" iconCls="icon-remove" onclick="deleteInfo()">删除</a>
						<a class="nui-button" id="cglx_wh" iconCls="icon-edit" onclick="wh_edit()">维护</a>
						<a class="nui-button" id="cglx_zf" iconCls="icon-edit" onclick="zf_edit()">作废</a>
						<a class="nui-button" id="checkview" iconCls="icon-print" onclick="print()">打印</a>
						<a class="nui-button" id="cglx_exportExcel" iconCls="icon-download" onclick="onExportExcel()">导出</a>
						<a class="nui-button" id="cglx_help" iconCls="icon-help" onclick="help()">帮助</a>
					</td>
				</tr>
			</table>
		</div>

		<div class="nui-fit">
			<div id="datagrid1" frozenStartColumn="0" sizeList="[25,50,100]" pageSize="25" showPager="true" dataField="proApp" class="nui-datagrid" style="width: 100%; height: 100%;"
				url="com.zhonghe.ame.purchase.purchaseProApp.queryProApp.biz.ext" multiSelect="true" allowSortColumn="true">
				<div property="columns">
					<div name="temp123" type="checkcolumn"></div>
					<div type="indexcolumn" align="center" headerAlign="center">序号</div>
					<div field="createdUsername" width="50" headerAlign="center" align="center">经办人</div>
					<div field="proAppOrgName" width="150" align="center" headerAlign="center">采购需求单位</div>
					<div field="createdTime" width="60" dateFormat="yyyy-MM-dd" align="center" headerAlign="center" allowSort="true">申请日期</div>
					<div field="proAppCode" width="110" align="center" headerAlign="center" renderer="lookInfo">立项编号</div>
					<div field="proAppName" width="200" align="center" headerAlign="center">立项名称</div>
					<div field="status" width="60" align="center" renderer="onActionRenderer" headerAlign="center">审批状态</div>
					<div field="proAppApplyPrice" width="80" align="center" headerAlign="center">立项申请金额(万元)</div>
					<div field="type" width="60" align="center" headerAlign="center" renderer="ZH_PURCHASE">集采类型</div>
					<div field="purchasMode" width="60" align="center" headerAlign="center" renderer="ZH_CGFS">采购方式</div>
					<div field="proAppObjType" width="60" align="center" headerAlign="center" renderer="MIS_APPOBJTYPE">物项类别</div>
					<div field="projectId" align="center" headerAlign="center">所属项目名称</div>
				</div>
			</div>
		</div>
	</div>

	<form name="viewlist1" id="viewlist1" action="com.primeton.eos.ame_common.ameExportCommon.flow" method="post">
		<input type="hidden" name="_eosFlowAction" value="action0" filter="false" />
		<input type="hidden" name="downloadFile" filter="false" />
		<input type="hidden" name="fileName" filter="false" />
	</form>

	<script type="text/javascript">
		nui.parse();
		var form = new nui.Form("#form1");
		var grid = nui.get("datagrid1");
		var authOrg;

		init();

		function init() {
			//按钮权限的控制
			getOpeatorButtonAuth("cglx_wh,cglx_exportExcel,cglx_zf,cglx_help");
			//code:对应功能编码，map：对于机构的查询条件
			var json = {
				"code" : "cglx"
			};
			nui.ajax({
				url : "com.primeton.eos.ame_auth.ame_auth.getownorg1.biz.ext",
				data : json,
				type : 'POST',
				contentType : 'text/json',
				success : function(text) {
					if(text.errcode == "没有有权的机构"){
						nui.get("createdBy").setValue(userId);
						nui.get("createUsername").setValue(userName);
						nui.get("createUsername").setReadOnly(true);
						authOrg = false;						
					}else{
						nui.get("createUsername").setName("criteria._or[0]._and[0]._expr[1].createdUsername");
						nui.get("createUsernameOp").setName("criteria._or[0]._and[0]._expr[1]._op");
						nui.get("createdBy").setName("criteria._or[0]._and[0]._expr[0].createdBy");
						nui.get("createdBy").setValue(userId);
						nui.get("orgseq").setData(text.orgs);
						nui.get("IdByOrgProp").setName("criteria._or[0]._expr[1]._property");
						nui.get("IdByOrgOp").setName("criteria._or[0]._expr[1]._op");
						nui.get("IdByOrgRef").setName("criteria._or[0]._expr[1]._ref");
						nui.get("orgids").setValue(text.orgids);
						authOrg = true;
					}
					search();  
				}
			});
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
				},
				ondestroy : function(action) {
				}
			});
		}

		function getStatus(e) {
			if (e.value == 1) {
				return "审核中"
			}
		}

		function check(e) {
			if (e.value == 1) {
				return "是";
			} else {
				return "否";
			}
		}

		function lookInfo(e) {
			var id = e.row.id;
			if (id == 0 || id == null) {
				nui.alert("查询信息有误");
			} else {
				return "<a href='javascript:void(0)' onclick='doView(" + id + ");' title='点击查看'>" + e.value + "</a>";
			}
		}

		function changeInfo() {
			var row = grid.getSelected();
			if (row) {
				if (row.status != 2) {
					showTips("审批通过状态才允许变更")
				} else {
					nui.open({
						url : "/default/purchase/project/proAppChange.jsp?id=" + row.id,
						width : '100%',
						height : '100%',
						onload : function() {
							var iframe = this.getIFrameEl();
						},
						ondestroy : function(action) {
							grid.reload();
						}
					})
				}
			} else {
				showTips("请选中一条记录", "提示");
			}

		}
		
		function doView(id) {
			var executeUrl = "<%=request.getContextPath()%>/purchase/print/proAppPrint.jsp?id=" + id;
			window.open(executeUrl);
		}

		function search() {
			if(authOrg){
				if(nui.get("createUsername").getValue() != "" || nui.get("orgseq").getValue() != ""){
					if(nui.get("createUsername").getValue() == userName){
						var json = nui.encode({orgseq : nui.get("orgseq").getValue()});
						nui.ajax({
							url : "com.zhonghe.ame.purchase.common.getOrgByOrgseq.biz.ext",
							data : json,
							async: false,
							type : 'POST',
							contentType : 'text/json',
							success : function(data) {
								nui.get("createUsername").setName("criteria._expr[50].createdUsername");
								nui.get("createUsernameOp").setName("criteria._expr[50]._op");
								nui.get("createdBy").setName("criteria._expr[6].createdBy");
								nui.get("createdBy").setValue(userId);
								nui.get("IdByOrgProp").setName("criteria._expr[10]._property");
								nui.get("IdByOrgOp").setName("criteria._expr[10]._op");
								nui.get("IdByOrgRef").setName("criteria._expr[10]._ref");
								nui.get("orgids").setValue(data.orgids);
							}
						});
					}else{
						var json = nui.encode({orgseq : nui.get("orgseq").getValue()});
						nui.ajax({
							url : "com.zhonghe.ame.purchase.common.getOrgByOrgseq.biz.ext",
							data : json,
							async: false,
							type : 'POST',
							contentType : 'text/json',
							success : function(data) {
								nui.get("createUsername").setName("criteria._expr[50].createdUsername");
								nui.get("createUsernameOp").setName("criteria._expr[50]._op");
								nui.get("createdBy").setName("criteria._expr[6].createdBy");
								nui.get("createdBy").setValue("");
								nui.get("IdByOrgProp").setName("criteria._expr[10]._property");
								nui.get("IdByOrgOp").setName("criteria._expr[10]._op");
								nui.get("IdByOrgRef").setName("criteria._expr[10]._ref");
								nui.get("orgids").setValue(data.orgids);
							}
						});						
					}
				}
			}
			var data = form.getData();
			grid.sortBy("createdTime", "desc");
			grid.load(data);
		}

		function reset() {
			form.reset();
			init();
		}
		
		function deleteInfo() {
			var rows = grid.getSelecteds();
			if (rows.length == 0) {
				showTips("请选中需要删除的数据记录", "danger");
			}else{
				var status = rows.every(item => item.status === '4');
				if(status){
					if (!confirm("是否删除？")) {
						return;
					}else{
						var datas = rows.map(row => ({ id: row.id }));
						var json = nui.encode({
							'datas' : datas
						});
						nui.ajax({
							url : "com.zhonghe.ame.purchase.purchaseProApp.deleteProApp.biz.ext",
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
					}
				}else{
					showTips("只能删除审批状态为【作废】的数据", "danger");
				}
			}
		}

		function add() {
			nui.open({
				url : "/default/purchase/project/addProApp.jsp",
				width : '100%',
				height : '100%',
				title : "采购立项申请",
				onload : function() {
					var iframe = this.getIFrameEl();
				},
				ondestroy : function(action) {
					search();
				}
			})
		}		
		
		function onExportExcel() {
			var form = new nui.Form("#form1");
			var data = form.getData();
			exportExcel({
				"data" : data,
				"url" : "com.zhonghe.ame.purchase.exportExcel.exportaProApp.biz.ext",
				"fileName" : "采购立项表"
			})
		}
		
		function print() {
			var row = grid.getSelected();
			if (row) {
				executeUrl = "<%=request.getContextPath()%>/purchase/print/proAppPrint.jsp?id=" + row.id;
				window.open(executeUrl);
			} else {
				showTips("请选中一条记录");
			}
		}
		
		// 暂存编辑
		function zc_edit() {
			var row = grid.getSelecteds();
			if (row.length > 1 || row.length == 0) {
				showTips("只能选中一条数据记录进行编辑", "danger");
				return;
			}
			var data = row[0];
			if (data.status == '0') {
				var json = {
					"processID" : data.processid
				};
				ajaxCommon({
					url : "com.zhonghe.ame.purchase.purchaseProApp.getWorkItemByProcessInstID.biz.ext",
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
		
		function zf_edit() {
			var row = grid.getSelecteds();
			if (row.length > 1 || row.length == 0) {
				showTips("只能选中一条项目记录进行作废", "danger");
				return;
			} else {
				var row = row[0];
				if (row.status == '2') {
					if (!confirm("是否作废？")) {
						return;
					} else {
						if (row) {
							var json = nui.encode({
								'data' : row
							});
							nui.ajax({
								url : "com.zhonghe.ame.purchase.purchaseItems.zfProAppById.biz.ext",
								type : 'POST',
								data : json,
								contentType : 'text/json',
								success : function(o) {
									if (o.result == 1) {
										showTips("作废成功");
										grid.reload();
									} else if (o.result == 2) {
										showTips("有采购文件或评审结果关联了该立项无法作废！", "danger");
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
		
		function wh_edit() {
			var row = grid.getSelecteds();
			if (row.length > 1 || row.length == 0) {
				showTips("只能选中一条数据记录进行维护", "danger");
				return;
			}
			var data = row[0];
			if (data.status == "2") {
				nui.open({
					url : "/default/purchase/project/updateProApp.jsp",
					width : '100%',
					height : '100%',
					title : "采购立项维护",
					onload : function() {
						var iframe = this.getIFrameEl();
						iframe.contentWindow.setData(data);
					},
					ondestroy : function(action) {
						if (action == "ok") {
							grid.reload();
						}
						search();
					}
				});
			} else {
				showTips("只能维护审批状态为【审批通过】的数据", "danger");
			}
		}		

		function ZH_PURCHASE(e) {
			return nui.getDictText("ZH_PURCHASE", e.value);
		}
		
		function help() {
			executeUrl = "<%=request.getContextPath()%>/purchase/project/proAppDesgin.jsp";
			window.open(executeUrl);
		}

		function ZH_CGFS(e) {
			return nui.getDictText("ZH_CGFS", e.value);
		}

		function MIS_APPOBJTYPE(e) {
			return nui.getDictText("MIS_APPOBJTYPE", e.value);
		}
	</script>
</body>
</html>