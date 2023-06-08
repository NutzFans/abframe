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
	<div id="form1">
		<div class="nui-toolbar" style="border-bottom: 0; padding: 0px;">
			<table align="center" border="0" width="100%" class="form_table">
				<tr>
					<td class="form_label" align="right">立项名称:</td>
					<td colspan="1">
						<input name="criteria._expr[1]._value" class="nui-textbox" style="width: 65%;" />
						<input class="nui-hidden" name="criteria._expr[1]._property" value="proAppName" />
						<input class="nui-hidden" name="criteria._expr[1]._op" value="like" />
					</td>
					<td class="form_label" align="right">立项编号:</td>
					<td colspan="1">
						<input name="criteria._expr[2]._value" class="nui-textbox" style="width: 65%;" />
						<input class="nui-hidden" name="criteria._expr[2]._property" value="proAppCode" />
						<input class="nui-hidden" name="criteria._expr[2]._op" value="like" />
					</td>
					<td class="form_label" align="right">采购计划编号:</td>
					<td colspan="1">
						<input name="criteria._expr[3]._value" class="nui-textbox" style="width: 65%;" />
						<input class="nui-hidden" name="criteria._expr[3]._property" value="purchaseNumber" />
						<input class="nui-hidden" name="criteria._expr[3]._op" value="like" />
						<input class="nui-hidden" id="ischange" name="criteria._expr[4].ischange" value="1" />
						<input class="nui-hidden" name="criteria._expr[4]._op" value="=" />
						<input class="nui-hidden" name="criteria._expr[7]._property" value="createdOrgid" />
						<input class="nui-hidden" name="criteria._expr[7]._op" value="in" />
						<input class="nui-hidden" name="criteria._expr[7]._value" id="orgids2" />
						<input class="nui-hidden" name="criteria._expr[6].createdBy" id="createdBy" />
						<input class="nui-hidden" name="criteria._expr[6]._op" value="=" />
					</td>
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
					<a class="nui-button" id="cglx_add1" iconCls="icon-add" onclick="add()">新增</a>
					<a class="nui-button" id="cglx_zf" iconCls="icon-edit" onclick="zf_edit()">作废</a>
					<a class="nui-button" id="cglx_exportExcel" iconCls="icon-download" onclick="onExportExcel()">导出</a>
					<a class="nui-button" id="checkview" iconCls="icon-print" onclick="print()">打印</a>
				</td>
			</tr>
		</table>
	</div>

	<div class="nui-fit">
		<div id="datagrid1" frozenStartColumn="0" sizeList="[10,20,50,100]" showPager="true" dataField="proApp" class="nui-datagrid" style="width: 100%; height: 100%;"
			url="com.zhonghe.ame.purchase.purchaseProApp.queryProApp.biz.ext" multiSelect="false" allowSortColumn="true">
			<div property="columns">
				<div name="temp123" type="checkcolumn"></div>
				<div type="indexcolumn" align="center" headerAlign="center">序号</div>
				<!-- <div type="expandcolumn" width="20"></div> -->
				<div field="proAppName" width="190" align="left" headerAlign="center">立项名称</div>
				<div field="proAppCode" width="140" align="left" headerAlign="center" renderer="lookInfo">立项编号</div>
				<div field="proAppOrgName" width="150" align="left" headerAlign="center">立项单位</div>
				<div field="projectId" width="150" align="left" headerAlign="center">所属项目名称</div>
				<div field="proAppApplyPrice" width="100" align="center" headerAlign="center">立项申请金额(万元)</div>
				<div field="createdTime" dateFormat="yyyy-MM-dd" width="80" align="center" headerAlign="center" allowSort="true">申请日期</div>
				<!--<div field="proAppImplTime"  dateFormat="yyyy-MM-dd" width="80" align="center" headerAlign="center" >拟实施日期</div> -->
				<div field="status" width="60" align="center" renderer="onActionRenderer" headerAlign="center">状态</div>
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
		
		init();
		
		function init() {
			//按钮权限的控制
			getOpeatorButtonAuth("cglx_exportExcel,cglx_zf");
			//code:对应功能编码，map：对于机构的查询条件
			var json = {
				"code" : "cglx",
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
					if (text.orgs) {
						if (text.orgs.length == 0) {
							//当没有有权的机构时将申请人设置为登陆人
							nui.get("createdBy").setValue(userId);
						}
						//根据情况选择一种
						nui.get("orgids2").setValue(text.orgids);
					} else {
						//当没有有权的机构时将申请人设置为登陆人
						nui.get("createdBy").setValue(userId);
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
			var form = new nui.Form("#form1");
			var data = form.getData(); //获取表单JS对象数据
			grid.sortBy("createdTime", "desc");
			grid.load(data); //datagrid加载数据
		}
		
		function reset() {
			var form = new nui.Form("#form1");
			form.reset();
			grid.sortBy("createdTime", "desc");
			grid.load();
			init();
		}
		
		

		function deleteInfo() {
			if (!confirm("确定删除吗？")) {
				return;
			} else {

				var row = grid.getSelecteds();
				if (row.length > 1) {
					nui.alert("只能选中一条项目记录进行删除");
				} else {
					var row = row[0];
					if (row) {
						var json = nui.encode({
							id : row.id
						});
						nui.ajax({
							url : "com.zhonghe.ame.purchase.purchaseProApp.deleteProApp.biz.ext",
							type : 'POST',
							data : json,
							contentType : 'text/json',
							success : function(o) {
								if (o.result == 1) {
									nui.alert("删除成功", "系统提示", function() {
										//nui.get("sureButton").setEnabled(true);
										/* CloseWindow("ok"); */
										grid.reload();
									});
								} else {
									nui.alert("删除失败，请联系信息技术部人员！", "系统提示", function(action) {
										//nui.get("sureButton").setEnabled(true);
									});

								}
							}
						});
						row.id;

					} else {
						nui.alert("请选中一条记录", "提示");
					}

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
				executeUrl = "<%= request.getContextPath() %>/purchase/print/proAppPrint.jsp?id=" + row.id;
				window.open(executeUrl);
			} else {
				showTips("请选中一条记录");
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
		
	</script>

</body>
</html>