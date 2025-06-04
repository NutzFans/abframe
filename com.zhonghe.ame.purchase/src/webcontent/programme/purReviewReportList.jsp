<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<head>
<title>评审结果</title>
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
	<div style="width: auto; height: 99%; padding: 5px;">
		<div id="form1">
			<div class="nui-toolbar" style="border-bottom: 0; padding: 5px;">
				<table>
					<tr>
						<td style="width: 90px; text-align: right;">评审结果名称:</td>
						<td style="width: 245px">
							<input name="critria._expr[1].reportName" class="nui-textbox" style="width: 240px;" />
							<input class="nui-hidden" name="critria._expr[1]._op" value="like" />
						</td>
						<td style="width: 60px; text-align: right;">申请单位:</td>
						<td style="width: 245px">
							<input id="orgid2" name="critria._ref[0]._expr[0]._value" class="nui-combobox" textField="orgname" valueField="orgseq" dataField="orgs" showNullItem="true" allowInput="true"
								style="width: 150px" valueFromSelect="true" />
							<input class="nui-hidden" name="critria._expr[2]._property" value="proAppOrgId" id="implementOrgProp" />
							<input class="nui-hidden" name="critria._expr[2]._op" value="in" id="implementOrgOp" />
							<input class="nui-hidden" name="critria._expr[2]._ref" value="1" id="implementOrgRef" />
							<input class="nui-hidden" name="critria._ref[0]._id" value="1" />
							<input class="nui-hidden" name="critria._ref[0]._entity" value="org.gocom.abframe.dataset.organization.OmOrganization" />
							<input class="nui-hidden" name="critria._ref[0]._select._field[0]" value="orgid" />
							<input class="nui-hidden" name="critria._ref[0]._expr[0]._property" value="orgseq" />
							<input class="nui-hidden" name="critria._ref[0]._expr[0]._op" value="like" />
							<input class="nui-hidden" name="critria._ref[0]._expr[0]._likeRule" value="end" />
							<input class="nui-hidden" name="critria._expr[3]._property" value="proAppOrgId" id="implementOrgProp2" />
							<input class="nui-hidden" name="critria._expr[3]._op" value="in" id="implementOrgOp2" />
							<input class="nui-hidden" name="critria._expr[3]._value" id="orgids2" />
							<input class="nui-hidden" name="critria._expr[4]._property" value="createdOrgid" id="implementOrgProp3" />
							<input class="nui-hidden" name="critria._expr[4]._op" value="in" id="implementOrgOp3" />
							<input class="nui-hidden" name="critria._expr[4]._value" id="orgids3" />
							<input class="nui-hidden" name="critria._expr[6].createdBy" id="createUserid" />
						</td>
						<td style="width: 90px; text-align: right;">评审结果编号:</td>
						<td style="width: 205px">
							<input name="critria._expr[0].code" class="nui-textbox" style="width: 200px" />
							<input class="nui-hidden" name="critria._expr[0]._op" value="like" />
						</td>
						<td style="width: 90px; text-align: right;">采购立项编号:</td>
						<td style="width: 205px">
							<input name="critria._expr[10].proAppCode" class="nui-textbox" style="width: 200px" />
							<input class="nui-hidden" name="critria._expr[10]._op" value="like" />
						</td>
					</tr>
					<tr>
						<td style="width: 60px; text-align: right;">申请日期:</td>
						<td style="width: 245px">
							<input class="nui-hidden" name="critria._expr[22]._op" value="between" />
							<input class="nui-hidden" name="critria._expr[22]._pattern" value="yyyy-MM-dd" />
							<input class="nui-hidden" name="critria._expr[22]._property" value="createdTime" />
							<input class="nui-datepicker" name="critria._expr[22]._min" style="width: 110px" />
							<span>至</span>
							<input class="nui-datepicker" name="critria._expr[22]._max" style="width: 110px" />
						</td>
						<td style="width: 60px; text-align: right;">审批状态:</td>
						<td style="width: 245px">
							<input name="critria._expr[23].status" class="nui-dictcombobox" dictTypeId="ZH_FLOW_TYPE" showNullItem="true" nullItemText="全部" style="width: 240px" />
						</td>
						<td style="width: 60px; text-align: right;">最终采购方式:</td>
						<td style="width: 205px">
							<input name="critria._expr[24].finalPurchasMode" class="nui-dictcombobox" dictTypeId="ZH_CGFS_NEW" showNullItem="true" nullItemText="全部" style="width: 200px" />
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
						<a class="nui-button" id="psbg_add" iconCls="icon-add" onclick="add()">新增(集采中心)</a>
						<a class="nui-button" id="edit" iconCls="icon-edit" onclick="zc_edit()">编辑</a>
						<a class="nui-button" id="del" iconCls="icon-remove" onclick="deleteInfo()">删除</a>
						<a class="nui-button" id="psbg_wh" iconCls="icon-edit" onclick="wh_edit()">维护</a>
						<a class="nui-button" id="psbg_zf" iconCls="icon-edit" onclick="zf_edit()">作废</a>
						<a class="nui-button" iconCls="icon-print" onclick="print()">打印</a>
						<a class="nui-button" id="psbg_exportExcel" iconCls="icon-download" onclick="onExportExcel()">导出</a>
						<a class="nui-button" id="psbg_help" iconCls="icon-help" onclick="help()">帮助</a>
					</td>
				</tr>
			</table>
		</div>

		<div class="nui-fit">
			<div id="datagrid1" sizeList="[25,50,100]" pageSize="25" showPager="true" dataField="reviewReport" multiSelect="true" class="nui-datagrid" style="width: 100%; height: 100%;"
				url="com.zhonghe.ame.purchase.purchaseReviewReport.queryReviewReport.biz.ext">
				<div property="columns">
					<div type="checkcolumn"></div>
					<div type="indexcolumn" align="center" headerAlign="center">序号</div>
					<div field="createdByName" width="50" headerAlign="center" align="center">经办人</div>
					<div field="proAppOrgName" width="150" align="center" headerAlign="center">采购需求单位</div>
					<div field="createdTime" align="center" headerAlign="center" allowSort="true">申请日期</div>
					<div field="code" width="110" align="center" headerAlign="center">评审结果编号</div>
					<div field="proAppCode" width="110" align="center" headerAlign="center">采购立项编号</div>
					<div field="reportName" width="200" align="center" headerAlign="center" renderer="lookInfo">评审结果名称</div>
					<div field="type" width="60" align="center" headerAlign="center" renderer="ZH_PURCHASE">集采类型</div>
					<div field="finalPurchasMode" width="60" align="center" headerAlign="center" renderer="ZH_CGFS_NEW">最终采购方式</div>
					<div width="60" field="status" align="center" renderer="onActionRenderer" headerAlign="center">审批状态</div>
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
			getOpeatorButtonAuth("psbg_add,psbg_wh,psbg_zf,psbg_exportExcel,psbg_help"); //操作按钮权限初始化
			//code:对应功能编码，map：对于机构的查询条件
			var json = {
				"code" : "psbg"
			};
			nui.ajax({
				"url" : "com.primeton.eos.ame_auth.ame_auth.getownorg1.biz.ext",
				"data" : json,
				type : 'POST',
				"success" : function(text) {
					if(text.errcode == "没有有权的机构"){
						nui.get("createUserid").setValue(userId);
						authOrg = false;						
					}else{
						nui.get("createUserid").setName("critria._or[0]._and[0]._expr[0].createdBy");
						nui.get("createUserid").setValue(userId);
						nui.get("implementOrgProp").setName("critria._or[0]._and[1]._expr[2]._property");
						nui.get("implementOrgOp").setName("critria._or[0]._and[1]._expr[2]._op");
						nui.get("implementOrgRef").setName("critria._or[0]._and[1]._expr[2]._ref");
						nui.get("orgid2").setData(text.orgs);
						nui.get("implementOrgProp2").setName("critria._or[0]._and[1]._expr[3]._property");
						nui.get("implementOrgOp2").setName("critria._or[0]._and[1]._expr[3]._op");
						nui.get("orgids2").setName("critria._or[0]._and[1]._expr[3]._value");
						nui.get("orgids2").setValue(text.orgids);
						nui.get("implementOrgProp3").setName("critria._or[0]._and[2]._expr[4]._property");
						nui.get("implementOrgOp3").setName("critria._or[0]._and[2]._expr[4]._op");
						nui.get("orgids3").setName("critria._or[0]._and[2]._expr[4]._value");
						nui.get("orgids3").setValue(text.orgids);
						authOrg = true;
					}
					search();
				}
			});
		}
		
		function search() {
			if(authOrg){
				if(nui.get("orgid2").getValue() != ""){
					nui.get("createUserid").setName("critria._expr[0].createdBy");
					nui.get("createUserid").setValue("");
					nui.get("implementOrgProp").setName("critria._expr[2]._property");
					nui.get("implementOrgOp").setName("critria._expr[2]._op");
					nui.get("implementOrgRef").setName("critria._expr[2]._ref");
					nui.get("implementOrgProp2").setName("critria._expr[3]._property");
					nui.get("implementOrgOp2").setName("critria._expr[3]._op");
					nui.get("orgids2").setName("critria._expr[3]._value");
					nui.get("implementOrgProp3").setName("implementOrgProp3");
					nui.get("implementOrgOp3").setName("implementOrgOp3");
					nui.get("orgids3").setName("orgids3");
				}
			}
			var data = form.getData(); //获取表单JS对象数据
			grid.sortBy('createdTime', 'desc');
			grid.load(data); //datagrid加载数据
		}

		function reset() {
			var form = new nui.Form("#form1");
			form.reset();
			init();
		}
		
		function print() {
			var row = grid.getSelected();
			if (row) {
				executeUrl = "<%=request.getContextPath()%>/purchase/programme/reviewReportDetail.jsp?id=" + row.id;
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
		
		function lookInfo(e) {
			var id = e.row.id;
			if (id == 0 || id == null) {
				nui.alert("查询信息有误");
			} else {
				return "<a href='javascript:void(0)' onclick='doView(" + id + ");' title='点击查看'>" + e.value + "</a>";
			}
		}
		
		function doView(id) {
			var executeUrl = "<%=request.getContextPath()%>/purchase/programme/reviewReportDetail.jsp?id=" + id;
			window.open(executeUrl);
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
							url : "com.zhonghe.ame.purchase.purchaseReviewReport.delReviewReport.biz.ext",
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
				url : "/default/purchase/programme/addReviewReport.jsp",
				width : "100%",
				height : "100%",
				title : "评审结果 - 集采中心",
				ondestroy : function(action) {
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
					url : "/default/purchase/programme/updateApprovalReviewReport.jsp",
					width : '100%',
					height : '100%',
					title : "评审结果维护",
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
		
		function onExportExcel() {
			var data = form.getData();
			exportExcel({
				"data" : data,
				"url" : "com.zhonghe.ame.purchase.purchaseReviewReport.exportReviewReport.biz.ext",
				"fileName" : "评审结果表"
			})
		}				
		
		function ZH_PURCHASE(e) {
			return nui.getDictText("ZH_PURCHASE", e.value);
		}
		
		function ZH_CGFS_NEW(e){
			return nui.getDictText("ZH_CGFS_NEW", e.value);
		}
		
		function help() {
			executeUrl = "<%=request.getContextPath()%>/purchase/programme/purReviewReportDesgin.jsp";
			window.open(executeUrl);
		}		
				
	</script>
</body>
</html>
