<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<head>
<title>采购文件</title>
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
			<input class="nui-hidden" name="critria._entity" value="com.zhonghe.ame.contractPact.frameAgreement.ZhAgreementEntity" />
			<div class="nui-toolbar" style="border-bottom: 0; padding: 5px;">
				<table>
					<tr>
						<td style="width: 90px; text-align: right;">采购项目名称:</td>
						<td style="width: 245px">
							<input name="critria._expr[1].programmeName" class="nui-textbox" style="width: 240px" />
							<input class="nui-hidden" name="critria._expr[1]._op" value="like" />
						</td>
						<td style="width: 90px; text-align: right;">采购需求单位:</td>
						<td style="width: 245px">
							<input id="orgseq" style="width: 240px" class="nui-combobox" textField="orgname" valueField="orgseq" dataField="orgs" showNullItem="true" allowInput="true" />
							<input class="nui-hidden" name="critria._expr[7]._property" value="proappId" id="IdByOrgProp" />
							<input class="nui-hidden" name="critria._expr[7]._op" value="in" id="IdByOrgOp" />
							<input class="nui-hidden" name="critria._expr[7]._ref" value="1" id="IdByOrgRef" />
							<input class="nui-hidden" name="critria._ref[0]._id" value="1" />
							<input class="nui-hidden" name="critria._ref[0]._entity" value="com.zhonghe.ame.purchase.purchase.queryProAppIds" />
							<input class="nui-hidden" name="critria._ref[0]._select._field[0]" value="ids" />
							<input class="nui-hidden" name="critria._ref[0]._expr[0]._property" value="newOrgId" />
							<input class="nui-hidden" name="critria._ref[0]._expr[0]._op" value="in" />
							<input class="nui-hidden" name="critria._ref[0]._expr[0]._value" id="orgids" />
							<input class="nui-hidden" name="critria._expr[6].createdBy" id="createdBy" />
							<input class="nui-hidden" name="critria._expr[6]._op" value="=" />
						</td>
						<td style="width: 90px; text-align: right;">采购立项编号:</td>
						<td style="width: 205px">
							<input name="critria._expr[2].proAppCode" class="nui-textbox" style="width: 200px" />
							<input class="nui-hidden" name="critria._expr[2]._op" value="like" />
						</td>
						<td style="width: 60px; text-align: right;">申请日期:</td>
						<td style="width: 245px">
							<input class="nui-hidden" name="critria._expr[10]._op" value="between" />
							<input class="nui-hidden" name="critria._expr[10]._pattern" value="yyyy-MM-dd" />
							<input class="nui-hidden" name="critria._expr[10]._property" value="createdTime" />
							<input class="nui-datepicker" name="critria._expr[10]._min" style="width: 110px" />
							<span>至</span>
							<input class="nui-datepicker" name="critria._expr[10]._max" style="width: 110px" />
						</td>
						<td style="width: 60px; text-align: right;">审批状态:</td>
						<td style="width: 155px">
							<input name="critria._expr[11].status" class="nui-dictcombobox" dictTypeId="ZH_FLOW_TYPE" showNullItem="true" nullItemText="全部" style="width: 150px" />
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
						<a class="nui-button" id="cgfa_add" iconCls="icon-add" onclick="add()">新增(集采中心)</a>
						<a class="nui-button" id="cgfa_add_zxcg" iconCls="icon-add" onclick="add_zxcg()">新增(自行采购)</a>
						<a class="nui-button" id="cgfa_zf" iconCls="icon-edit" onclick="zf_edit()">作废</a>
						<a class="nui-button" iconCls="icon-print" onclick="print()">打印</a>
					</td>
				</tr>
			</table>
		</div>

		<div class="nui-fit">
			<div id="datagrid1" sizeList="[25,50,100]" pageSize="25" showPager="true" dataField="purProgrammes" class="nui-datagrid" style="width: 100%; height: 100%;"
				url="com.zhonghe.ame.purchase.purchaseProgramme.queryPurProgramme.biz.ext" multiSelect="false" allowSortColumn=true>
				<div property="columns">
					<div type="checkcolumn"></div>
					<div type="indexcolumn" align="center" headerAlign="center">序号</div>
					<div field="createdByName" width="50" headerAlign="center" align="center">经办人</div>
					<div field="proAppOrgName" width="150" align="center" headerAlign="center">采购需求单位</div>
					<div field="createdTime" align="center" headerAlign="center" allowSort="true">申请日期</div>
					<div field="proAppCode" width="110" align="center" headerAlign="center">采购立项编号</div>
					<div field="programmeName" width="200" align="center" headerAlign="center" renderer="lookInfo">采购项目名称</div>
					<div field="type" width="60" align="center" headerAlign="center" renderer="ZH_PURCHASE">集采类型</div>
					<div width="60" field="status" align="center" renderer="onActionRenderer" headerAlign="center">审批状态</div>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		nui.parse();
		var form = new nui.Form("#form1");
		var grid = nui.get("datagrid1");
		var authOrg;

		init();

		function init() {
			//按钮权限的控制
			getOpeatorButtonAuth("cgfa_add,cgfa_zf"); //操作按钮权限初始化
			//code:对应功能编码，map：对于机构的查询条件
			var json = {
				"code" : "cgfa"
			};
			nui.ajax({
				"url" : "com.primeton.eos.ame_auth.ame_auth.getownorg1.biz.ext",
				"data" : json,
				type : 'POST',
				success : function(text) {
					if(text.errcode == "没有有权的机构"){
						nui.get("createdBy").setValue(userId);
						authOrg = false;						
					}else{
						nui.get("createdBy").setName("critria._or[0]._expr[0].createdBy");
						nui.get("createdBy").setValue(userId);
						nui.get("orgseq").setData(text.orgs);
						nui.get("IdByOrgProp").setName("critria._or[0]._expr[1]._property");
						nui.get("IdByOrgOp").setName("critria._or[0]._expr[1]._op");
						nui.get("IdByOrgRef").setName("critria._or[0]._expr[1]._ref");
						nui.get("orgids").setValue(text.orgids);
						authOrg = true;
					}
					search();
				}
			});
		}

		function search() {
			if(authOrg){
				if(nui.get("orgseq").getValue() != ""){
					var json = nui.encode({orgseq : nui.get("orgseq").getValue()});
					nui.ajax({
						url : "com.zhonghe.ame.purchase.common.getOrgByOrgseq.biz.ext",
						data : json,
						async: false,
						type : 'POST',
						contentType : 'text/json',
						success : function(data) {
							nui.get("createdBy").setName("critria._expr[6].createdBy");
							nui.get("createdBy").setValue("");
							nui.get("IdByOrgProp").setName("critria._expr[7]._property");
							nui.get("IdByOrgOp").setName("critria._expr[7]._op");
							nui.get("IdByOrgRef").setName("critria._expr[7]._ref");
							nui.get("orgids").setValue(data.orgids);
						}
					});	
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

		function lookInfo(e) {
			var id = e.row.id;
			if (id == 0 || id == null) {
				nui.alert("查询信息有误");
			} else {
				return "<a href='javascript:void(0)' onclick='doView(" + id + ");' title='点击查看'>" + e.value + "</a>";
			}
		}
		
		function doView(id) {
			var executeUrl = "<%=request.getContextPath()%>/purchase/programme/purProgrammeDetail.jsp?id=" + id;
			window.open(executeUrl);
		}
		
		function onOk() {
			search();
		}
		
		function deleteInfo() {
			var row = grid.getSelecteds();
			if (row.length > 0) {
				if (!confirm("确定删除吗？")) {
					return;
				} else {

					if (row.length > 1) {
						showTips("只能选中一条项目记录进行删除");
					} else {
						var row = row[0];
						console.log(row);
						if (row) {
							var json = nui.encode({
								id : row.id
							});
							ajaxCommon({
								url : "com.zhonghe.ame.purchase.purchaseProgramme.delPurProgramme.biz.ext",
								data : json,
								success : function(o) {
									if (o.result == 1) {
										showTips("删除成功", "系统提示")
										grid.reload();
									} else {
										showTips("删除失败，请联系信息技术部人员！")
									}
								}
							});
							row.id;
						}
					}
				}
			} else {
				showTips("请选中一条记录", "提示");
			}
		}
		
		function add() {
			nui.open({
				url: "/default/purchase/programme/addPurProgramme.jsp",
				width: '100%',
				height: '100%',
				title: "采购文件申请 - 集采中心",
				onload: function () {
					var iframe = this.getIFrameEl();
					data = {"addType": "add"};
					iframe.contentWindow.initData(data);
				},
				ondestroy: function (action) {
					search();
				}
			})
		}
		
		function add_zxcg() {
			nui.open({
				url: "/default/purchase/programme/addPurProgramme.jsp",
				width: '100%',
				height: '100%',
				title: "采购文件申请 - 自行采购",
				onload: function () {
					var iframe = this.getIFrameEl();
					data = {"addType": "add_zxcg"};
					iframe.contentWindow.initData(data);
				},
				ondestroy: function (action) {
					search();
				}
			})
		}		
		
		function print() {
			var row = grid.getSelected();
			if (row) {
				executeUrl = "<%=request.getContextPath()%>/purchase/print/purProgramPrint.jsp?id=" + row.id;
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
								url : "com.zhonghe.ame.purchase.purchaseItems.zfPurProgrammeById.biz.ext",
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

		function ZH_PURCHASE(e) {
			return nui.getDictText("ZH_PURCHASE", e.value);
		}
	</script>
</body>
</html>