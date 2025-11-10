<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<head>
<title>小额采购</title>
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
						<td style="width: 90px; text-align: right;">小额采购名称:</td>
						<td style="width: 245px">
							<input name="criteria._expr[1]._value" class="nui-textbox" style="width: 240px;" />
							<input class="nui-hidden" name="criteria._expr[1]._property" value="purchaseName" />
							<input class="nui-hidden" name="criteria._expr[1]._op" value="like" />
						</td>
						<td style="width: 60px; text-align: right;">采购单位:</td>
						<td style="width: 245px">
							<input id="orgid2" name="criteria._ref[0]._expr[0]._value" style="width: 240px" class="nui-combobox" textField="orgname" valueField="orgseq" dataField="orgs" showNullItem="true"
								allowInput="true" />
							<input class="nui-hidden" name="criteria._expr[5]._property" value="secondaryOrg" />
							<input class="nui-hidden" name="criteria._expr[5]._op" value="in" id="tempCond1" />
							<input class="nui-hidden" name="criteria._expr[5]._ref" value="" id="tempCond2" />
							<input class="nui-hidden" name="criteria._ref[0]._id" value="1" />
							<input class="nui-hidden" name="criteria._ref[0]._entity" value="org.gocom.abframe.dataset.organization.OmOrganization" />
							<input class="nui-hidden" name="criteria._ref[0]._select._field[0]" value="orgid" />
							<input class="nui-hidden" name="criteria._ref[0]._expr[0]._property" value="orgseq" />
							<input class="nui-hidden" name="criteria._ref[0]._expr[0]._op" value="like" />
							<input class="nui-hidden" name="criteria._ref[0]._expr[0]._likeRule" value="end" />
							<input class="nui-hidden" name="criteria._or[1]._expr[2]._property" value="secondaryOrg" />
							<input class="nui-hidden" name="criteria._or[1]._expr[2]._op" value="in" />
							<input class="nui-hidden" name="criteria._or[1]._expr[2]._value" id="orgids2" />
							<input class="nui-hidden" name="criteria._expr[6].createUser" id="createdBy" />
							<input class="nui-hidden" name="criteria._expr[6]._op" value="=" />
							<input class="nui-hidden" name="criteria._or[1]._expr[1].createUser" id="createdBy1" />
							<input class="nui-hidden" name="criteria._or[1]._expr[1]._op" value="=" />
						</td>
						<td style="width: 90px; text-align: right;">小额采购编号:</td>
						<td style="width: 205px">
							<input name="criteria._expr[2]._value" class="nui-textbox" style="width: 200px;" />
							<input class="nui-hidden" name="criteria._expr[2]._property" value="purchaseCode" />
							<input class="nui-hidden" name="criteria._expr[2]._op" value="like" />
						</td>
						<td style="width: 60px; text-align: right;">申请日期:</td>
						<td style="width: 245px">
							<input class="nui-hidden" name="criteria._expr[22]._op" value="between" />
							<input class="nui-hidden" name="criteria._expr[22]._pattern" value="yyyy-MM-dd" />
							<input class="nui-hidden" name="criteria._expr[22]._property" value="createTime" />
							<input class="nui-datepicker" name="criteria._expr[22]._min" style="width: 110px" />
							<span>至</span>
							<input class="nui-datepicker" name="criteria._expr[22]._max" style="width: 110px" />
						</td>
						<td style="width: 60px; text-align: right;">审批状态:</td>
						<td style="width: 155px">
							<input name="criteria._expr[23].appStatus" class="nui-dictcombobox" dictTypeId="ZH_FLOW_TYPE" showNullItem="true" nullItemText="全部" style="width: 150px" />
						</td>
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
						<a class="nui-button" iconCls="icon-add" onclick="add()">新增</a>
						<a class="nui-button" id="del" iconCls="icon-remove" onclick="deleteInfo()">删除</a>
						<a class="nui-button" id="xejgqr_zf" iconCls="icon-edit" onclick="zf_edit()">作废</a>
						<a class="nui-button" id="checkview" iconCls="icon-print" onclick="print()">打印</a>
						<a class="nui-button" id="xejgqr_help" iconCls="icon-help" onclick="help()">帮助</a>
					</td>
				</tr>
			</table>
		</div>		
		
		<div class="nui-fit">
			<div id="datagrid1" frozenStartColumn="0" sizeList="[25,50,100]" showPager="true" dataField="smallResultList" class="nui-datagrid" style="width: 100%; height: 100%;" pageSize="25"
				url="com.zhonghe.ame.purchase.small.querySmallResultList.biz.ext" multiSelect="true">
				<div property="columns">
					<div name="temp123" type="checkcolumn"></div>
					<div type="indexcolumn" align="center" headerAlign="center">序号</div>
					<div field="purchaseName" width="100" align="left" headerAlign="center" renderer="lookInfo">小额采购名称</div>
					<div field="purchaseCode" width="100" align="left" headerAlign="center">小额采购编号</div>
					<div field="secondaryOrgname" width="100" align="left" headerAlign="center">采购单位</div>
					<div field="totalAmount" width="100" align="left" headerAlign="center">立项金额（万元）</div>
					<div field="finalAmount" width="100" align="left" headerAlign="center">最终成交金额（万元）</div>
					<div field="appStatus" width="80" align="center" headerAlign="center" renderer="onActionRenderer">状态</div>
					<div field="createName" width="100" align="center" headerAlign="center">申请人</div>
					<div field="createTime" width="100" align="center" headerAlign="center" dateFormat="yyyy-MM-dd" allowSort="true">申请日期</div>
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
		
		init();
		
		function init() {
			//按钮权限的控制
			getOpeatorButtonAuth("xejgqr_zf,xejgqr_export,xejgqr_help"); //操作按钮权限初始化
			//code:对应功能编码，map：对于机构的查询条件
			var json = {
				"code" : "xejgqr"
			};
			nui.ajax({
				"url" : "com.primeton.eos.ame_auth.ame_auth.getownorg1.biz.ext",
				"data" : json,
				type : 'POST',
				"success" : function(data) {
					if (data.orgs) {
						if (data.orgs.length == 0) {
							//当没有有权的机构时将申请人设置为登陆人
							nui.get("createdBy").setValue(userId);
							nui.get("createdBy1").setValue(userId);
						}
						//根据情况选择一种
						nui.get("orgid2").setData(data.orgs);
						nui.get("orgids2").setValue(data.orgids);
						nui.get("createdBy1").setValue(userId);
					} else {
						//当没有有权的机构时将申请人设置为登陆人
						nui.get("createdBy").setValue(userId);
					}
					search();
				}
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
			var executeUrl = "<%=request.getContextPath()%>/purchase/small/smallResultPrint.jsp?id=" + id;
			window.open(executeUrl);
		}

		function search() {
			if (nui.get("orgid2").getValue() == "") {
				nui.get("tempCond1").setValue("=");
				nui.get("tempCond2").setValue("");
			} else {
				nui.get("tempCond1").setValue("in");
				nui.get("tempCond2").setValue("1");
			}
			var form = new nui.Form("#form1");
			var data = form.getData(); //获取表单JS对象数据
			grid.sortBy('createTime', 'desc');
			grid.load(data); //datagrid加载数据
		}

		function reset() {
			var form = new nui.Form("#form1");
			form.reset();
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
						ajaxCommon({
							"url" : "com.zhonghe.ame.purchase.purchaseItems.deleteLxcg.biz.ext",
							"data" : json,
							"success" : function(data) {
								if (o.result == 1) {
									showTips("删除成功")
									grid.reload();
								} else {
									showTips("删除失败，请联系信息技术部人员！")
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

		function onActionRenderer(e) {
			var record = e.record;
			var processId = record.processid;
			var s = "<a  href='javascript:void(0)' onclick='feeView();' >" + nui.getDictText('ZH_FLOW_TYPE', e.value) + "</a>";
			return s;
		}

		function feeView() {
			var selectRow = grid.getSelected();
			var processId = selectRow.processId;
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
		
		function add() {
			nui.open({
				url : "/default/purchase/small/addSmallResult.jsp",
				width : "100%",
				height : "100%",
				title : "&nbsp;",
				onload : function() {
					var iframe = this.getIFrameEl();
				},
				ondestroy : function(action) {
					reset();
				}
			})
		}
		
		function print() {
			var row = grid.getSelected();
			if (row) {
				executeUrl = "<%=request.getContextPath()%>/purchase/small/smallResultPrint.jsp?id=" + row.id;
				window.open(executeUrl);
			} else {
				showTips("请选中一条记录");
			}
		}
	
		function onExportExcel(){
			var data = form.getData();
			exportExcel({"data":data,"url": "com.zhonghe.ame.purchase.purzero.exportPurZero.biz.ext","fileName":"小额采购明细"});
		}				
		
		function zf_edit() {
			var row = grid.getSelecteds();
			if (row.length > 1 || row.length == 0) {
				showTips("只能选中一条数据记录进行作废", "danger");
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
								url : "com.zhonghe.ame.purchase.small.zfSmallResultById.biz.ext",
								type : 'POST',
								data : json,
								contentType : 'text/json',
								success : function(o) {
									if (o.result == 1) {
										showTips("作废成功");
										grid.reload();
									} else if (o.result == 2) {
										showTips("有付费合同关联了该小额采购无法作废！", "danger");
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
		
		function deleteInfo() {
			var rows = grid.getSelecteds();
			if (rows.length == 0) {
				showTips("请选中需要删除的数据记录", "danger");
			}else{
				var status = rows.every(item => item.appStatus === 4);
				if(status){
					if (!confirm("是否删除？")) {
						return;
					}else{
						var datas = rows.map(row => ({ id: row.id }));
						var json = nui.encode({
							'datas' : datas
						});
						nui.ajax({
							url : "com.zhonghe.ame.purchase.small.deleteSmallResult.biz.ext",
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
		
		function help() {
			executeUrl = "<%= request.getContextPath() %>/purchase/small/smallResultDesgin.jsp";
			window.open(executeUrl);
		}					
				
	</script>	
	
</body>
</html>