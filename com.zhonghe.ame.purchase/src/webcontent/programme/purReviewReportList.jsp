<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<head>
<title>评审结果报告</title>
<style type="text/css">
body {
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
		<input class="nui-hidden" name="critria._entity" value="com.zhonghe.ame.contractPact.frameAgreement.ZhAgreementEntity" />
		<div class="nui-toolbar" style="border-bottom: 0; padding: 0px;">
			<table align="center" border="0" width="100%" class="form_table">
				<tr>
					<td colspan="1">
						<input class="nui-hidden" name="critria._expr[5]._property" value="orgId" />
						<input class="nui-hidden" name="critria._expr[5]._op" value="in" id="tempCond1" />
						<input class="nui-hidden" name="critria._expr[5]._ref" value="" id="tempCond2" />
						<input class="nui-hidden" name="critria._ref[0]._id" value="1" />
						<input class="nui-hidden" name="critria._ref[0]._entity" value="org.gocom.abframe.dataset.organization.OmOrganization" />
						<input class="nui-hidden" name="critria._ref[0]._select._field[0]" value="orgid" />
						<input class="nui-hidden" name="critria._ref[0]._expr[0]._property" value="orgseq" />
						<input class="nui-hidden" name="critria._ref[0]._expr[0]._op" value="like" />
						<input class="nui-hidden" name="critria._ref[0]._expr[0]._likeRule" value="end" />
						<input class="nui-hidden" name="critria._expr[3]._property" value="orgId" />
						<input class="nui-hidden" name="critria._expr[3]._op" value="in" />
						<input class="nui-hidden" name="critria._expr[3]._value" id="orgids2" />

						<input class="nui-hidden" name="critria._expr[2].createdBy" id="createdBy" />
					</td>

					<td class="form_label" align="right">评审结果编号:</td>
					<td colspan="1">
						<input name="critria._expr[0].code" class="nui-textbox" style="width: 65%;" />
						<input class="nui-hidden" name="critria._expr[0]._op" value="like" />
					</td>
					<td class="form_label" align="right">采购立项编号:</td>
					<td colspan="1">
						<input name="critria._expr[1].proAppCode" class="nui-textbox" style="width: 65%;" />
						<input class="nui-hidden" name="critria._expr[1]._op" value="like" />
					</td>
					<td class="form_label" align="right">状态</td>
					<td colspan="1">
						<input name="critria._expr[8].status" class="nui-dictcombobox" dictTypeId="ZH_FLOW_TYPE" shownullItem="true" style="width: 150px;" />
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
					<a class="nui-button" id="checkview" iconCls="icon-add" onclick="add()">新增</a>
					<a class="nui-button" id="psbg_zf" iconCls="icon-edit" onclick="zf_edit()">作废</a>
					<a class="nui-button" id="checkview" iconCls="icon-print" onclick="print()">打印</a>
				</td>
			</tr>
		</table>
	</div>

	<div class="nui-fit">
		<div id="datagrid1" sizeList="[25,50,100]" pageSize="25" showPager="true" dataField="reviewReport" multiSelect="false" class="nui-datagrid" style="width: 100%; height: 100%;"
			url="com.zhonghe.ame.purchase.purchaseReviewReport.queryReviewReport.biz.ext">

			<div property="columns">
				<div type="checkcolumn"></div>
				<div type="indexcolumn" align="center" headerAlign="center">序号</div>
				<div field="code" width="80" align="center" headerAlign="center">评审结果编号</div>
				<div field="reportName" width="200" align="center" headerAlign="center" renderer="lookInfo">评审结果名称</div>
				<div field="proAppCode" width="80" align="center" headerAlign="center">采购立项编号</div>
				<div field="status" align="center" renderer="onActionRenderer" headerAlign="center">状态</div>
				<div field="createdTime" align="center" headerAlign="center" allowSort="true">申请日期</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		nui.parse();
		var form = new nui.Form("#form1");
		var grid = nui.get("datagrid1");
		
		init();
		
		function init() {
			//按钮权限的控制
			getOpeatorButtonAuth("psbg_zf"); //操作按钮权限初始化
			//code:对应功能编码，map：对于机构的查询条件
			var json = { "code": "psbg", "map": { "property": "status", "op": "=", "value": "running" } };
			ajaxCommon({
				"url": "com.primeton.eos.ame_auth.ame_auth.getownorg1.biz.ext",
				"data": json,
				"success": function(data) {
					if (data.orgs) {
						if (data.orgs.length == 0) {
							//当没有有权的机构时将申请人设置为登陆人
							nui.get("createdBy").setValue(userId);
						}
						nui.get("orgids2").setValue(data.orgids);
					} else {
						//当没有有权的机构时将申请人设置为登陆人
						nui.get("createdBy").setValue(userId);
					}
					search();
				}
			});
		}
		
		function print() {
			var row = grid.getSelected();
			if (row) {
				executeUrl = "<%= request.getContextPath() %>/purchase/programme/reviewReportDetail.jsp?id=" + row.id;
				window.open(executeUrl);
			} else {
				showTips("请选中一条记录");
			}
		}
		
		function onActionRenderer(e) {
			var record = e.record;
			var processId = record.processid;
			console.log(e.value);
			var s = "<a  href='javascript:void(0)' onclick='feeView();' >" + nui.getDictText('ZH_FLOW_TYPE', e.value) + "</a>";
			return s;
		}
		
		function feeView() {
			var selectRow = grid.getSelected();
			var processId = selectRow.processid;
			var url = "/default/bps/wfclient/task/processinstView.jsp";
			var title = "流程图查看";
			nui.open({
				url: url,
				title: title,
				width: "100%",
				height: "100%",
				onload: function() {
					var iframe = this.getIFrameEl();
					if (iframe.contentWindow.initData) {
						iframe.contentWindow.initData({ "processInstID": processId });
					}
				},
				ondestroy: function(action) {}
			});
		}					
		
		function getStatus(e) {
			if (e.value == 1) {
				return "审核中"
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
		
		function doView(id) {
			var executeUrl = "<%= request.getContextPath() %>/purchase/programme/reviewReportDetail.jsp?id=" + id;
			window.open(executeUrl);
		}
		
		function search() {
			var form = new nui.Form("#form1");
			var data = form.getData(); //获取表单JS对象数据
			grid.sortBy('createdTime', 'desc');
			grid.load(data); //datagrid加载数据
		}
		function reset() {
			var form = new nui.Form("#form1");
			form.reset();
			search()
		}
		
		function onOk() {
			search();
		}
				
		function edit() {
			debugger;
			var row = grid.getSelecteds();
			var data = row[0];
			if (data) {
				nui.open({
					url: "/default/contractPact/chargeContract/chargeContractEdit.jsp",
					width: "100%",
					height: "100%",
					title: "编辑",
					onload: function() {
						var iframe = this.getIFrameEl();
						iframe.contentWindow.setEditData(data);
					},
					ondestroy: function(action) {
						if (action == "ok") {
							grid.reload();
						}
					}
				})
		
			} else {
				nui.alert("请选中一条记录", "提示");
			}
		}
		
		function deleteInfo() {
			var row = grid.getSelecteds();
			if (row.length > 0) {
				if (!confirm("确定删除吗？")) {
					return;
				} else {
					if (row.length > 1) {
						nui.alert("只能选中一条项目记录进行删除");
					} else {
						var row = row[0];
						console.log(row);
						if (row) {
							var json = nui.encode({ id: row.id });
							nui.ajax({
								url: "com.zhonghe.ame.purchase.purchaseReviewReport.delReviewReport.biz.ext",
								type: 'POST',
								data: json,
								contentType: 'text/json',
								success: function(o) {
									if (o.result == 1) {
										nui.alert("删除成功", "系统提示", function() {
											grid.reload();
										});
									} else {
										nui.alert("删除失败，请联系信息技术部人员！", "系统提示", function(action) {
										});
		
									}
								}
							});
							row.id;
						}
					}
				}
			} else {
				nui.alert("请选中一条记录", "提示");
			}
		}
		
		function add() {
			nui.open({
				url: "/default/purchase/programme/addReviewReport.jsp",
				width: "100%",
				height: "100%",
				title: "评审结果填报",
				onload: function() {
					var iframe = this.getIFrameEl();
				},
				ondestroy: function(action) {
					search();
				}
			})
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
								url : "com.zhonghe.ame.purchase.purchaseItems.zfPurReviewReprotById.biz.ext",
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
		
	</script>

</body>
</html>