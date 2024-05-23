<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<head>
<title>紧急采购</title>
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
						<td style="width: 90px; text-align: right;">紧急采购名称:</td>
						<td style="width: 245px">
							<input name="criteria._expr[1].purchaseName" class="nui-textbox" style="width: 240px;" />
							<input class="nui-hidden" name="criteria._expr[1]._op" value="like" />
						</td>
						<td style="width: 60px; text-align: right;">采购单位:</td>
						<td style="width: 245px">
							<input id="orgid2" name="criteria._ref[0]._expr[0]._value" style="width: 240px" class="nui-combobox" textField="orgname" valueField="orgseq" dataField="orgs" showNullItem="true"
								allowInput="true" />
							<input class="nui-hidden" name="criteria._expr[5]._property" value="orgId" />
							<input class="nui-hidden" name="criteria._expr[5]._op" value="in" id="tempCond1" />
							<input class="nui-hidden" name="criteria._expr[5]._ref" value="" id="tempCond2" />
							<input class="nui-hidden" name="criteria._ref[0]._id" value="1" />
							<input class="nui-hidden" name="criteria._ref[0]._entity" value="org.gocom.abframe.dataset.organization.OmOrganization" />
							<input class="nui-hidden" name="criteria._ref[0]._select._field[0]" value="orgid" />
							<input class="nui-hidden" name="criteria._ref[0]._expr[0]._property" value="orgseq" />
							<input class="nui-hidden" name="criteria._ref[0]._expr[0]._op" value="like" />
							<input class="nui-hidden" name="criteria._ref[0]._expr[0]._likeRule" value="end" />
							<input class="nui-hidden" name="criteria._or[1]._expr[2]._property" value="orgId" />
							<input class="nui-hidden" name="criteria._or[1]._expr[2]._op" value="in" />
							<input class="nui-hidden" name="criteria._or[1]._expr[2]._value" id="orgids2" />
							<input class="nui-hidden" name="criteria._expr[6].createdBy" id="createdBy" />
							<input class="nui-hidden" name="criteria._expr[6]._op" value="=" />
							<input class="nui-hidden" name="criteria._or[1]._expr[1].createdBy" id="createdBy1" />
							<input class="nui-hidden" name="criteria._or[1]._expr[1]._op" value="=" />
						</td>
						<td style="width: 90px; text-align: right;">紧急采购编号:</td>
						<td style="width: 205px">
							<input name="criteria._expr[2].purchaseCode" class="nui-textbox" style="width: 200px;" />
							<input class="nui-hidden" name="criteria._expr[2]._op" value="like" />
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
						<td style="width: 60px; text-align: right;">审批状态:</td>
						<td style="width: 155px">
							<input name="criteria._expr[23].status" class="nui-dictcombobox" dictTypeId="ZH_FLOW_TYPE" showNullItem="true" nullItemText="全部" style="width: 150px" />
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
						<a class="nui-button" id="jjcg_zf" iconCls="icon-edit" onclick="zf_edit()">作废</a>
						<a class="nui-button" iconCls="icon-print" onclick="print()">打印</a>
						<a class="nui-button" id="jjcg_help" iconCls="icon-help" onclick="help()">帮助</a>
					</td>
				</tr>
			</table>
		</div>

		<div class="nui-fit">
			<div id="datagrid1" pageSize="25" sizeList="[25,50,100]" showPager="true" dataField="purUrgentList" class="nui-datagrid" style="width: 100%; height: 100%;"
				url="com.zhonghe.ame.purchase.purchaseItems.queryPurUrgentList.biz.ext" multiSelect="false" allowSortColumn=true onshowrowdetail="onShowRowDetail">
				<div property="columns">
					<div name="temp123" type="checkcolumn"></div>
					<div type="indexcolumn" align="center" headerAlign="center">序号</div>
					<div field="purchaseName" width="100" align="center" headerAlign="center" renderer="lookInfo">紧急采购名称</div>
					<div field="purchaseCode" width="100" align="center" headerAlign="center">紧急采购编号</div>
					<div field="orgname" width="100" align="center" headerAlign="center">采购单位</div>
					<div field="contrctType" width="100" align="center" headerAlign="center" renderer="onContrctType">合同发包方式</div>
					<div field="status" width="80" align="center" headerAlign="center" aRproAppListllowSort="true" renderer="onActionRenderer">状态</div>
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
				getOpeatorButtonAuth("jjcg_zf,jjcg_help"); //操作按钮权限初始化
				//code:对应功能编码，map：对于机构的查询条件
				var json = {
					"code" : "jjcg"
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
				var s = "<a  href='javascript:void(0)' onclick='feeView(" + processId + ");' >" + nui.getDictText('ZH_FLOW_TYPE', e.value) + "</a>";
				return s;
			}
			
			function feeView(processId) {
				var url = "<%=request.getContextPath()%>/bps/wfclient/task/processinstView.jsp";
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

			function onContrctType(e) {

				return nui.getDictText('ZH_CGFS', e.value);//设置业务字典值
			}

			function getStatus(e) {
				return nui.getDictText('ZH_FLOW_TYPE', e.value);//设置业务字典值
			}
			
			function check(e) {
				if (e.value == 1) {
					return "是";
				} else {
					return "否";
				}
			}
			
			function detail() {
				var row = grid.getSelecteds();
				if (row.length == 1) {
					var mngJsonData = row[0];
					//获取当前客户的其他信息
					var json = nui.encode({
						id : mngJsonData.id,
						createUserid : mngJsonData.createUserid
					});
					nui.open({
						url : "/default/imptask/keyTaskVote/voteTaskRank.jsp?id=" + mngJsonData.id,
						width : 1000,
						height : 353,
						onload : function() {
							var iframe = this.getIFrameEl();
						},
						ondestroy : function(action) {
							reset();
						}
					})

				} else {
					nui.alert("请选中一条记录", "提示");
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
				var executeUrl = "<%=request.getContextPath()%>/purchase/print/urgentPurPrint.jsp?id=" + id;
				window.open(executeUrl);
			}

			function dictGetType(e) {
				return nui.getDictText('EXP_EXPTYPE', e.value);
			}

			function dictGetStatus(e) {
				return nui.getDictText('EXP_CHECKFLAG', e.value);
			}
			
			function onOk() {
				search();
			}
			
			function editTaskMng() {
				var row = grid.getSelecteds();
				if (row.length > 1) {
					nui.alert("只能选中一条项目记录进行编辑");
				} else {
					var row = row[0];
					console.log(row);
					if (row) {
						nui.open({
							url : "/default/imptask/selfevaluate/editSelfValuate.jsp?id=" + row.id + "&keytaskId=" + row.keytaskId,
							width : 1000,
							height : 550,
							onload : function() {
								var iframe = this.getIFrameEl();
							},
							ondestroy : function(action) {
								if (action == "ok") {
									grid.reload();
								}
							}
						})

					} else {
						nui.alert("请选中一条记录", "提示");
					}

				}
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
						console.log(row);
						if (row) {
							var json = nui.encode({
								id : row.id
							});
							nui.ajax({
								url : "com.zhonghe.ame.purchase.purchaseItems.deletePurUrgent.biz.ext",
								type : 'POST',
								data : json,
								contentType : 'text/json',
								success : function(o) {
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
						} else {
							nui.alert("请选中一条记录", "提示");
						}
					}
				}
			}
			
			function onKeyEnter() {
				search();
			}
			
			function add() {
				nui.open({
					url : "/default/purchase/plan/addUrgentPurchase.jsp",
					width : 1200,
					height : 600,
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
					executeUrl = "<%=request.getContextPath()%>/purchase/print/urgentPurPrint.jsp?id=" + row.id;
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
									url : "com.zhonghe.ame.purchase.purchaseItems.zfPurUrgentById.biz.ext",
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
			
		function help() {
			executeUrl = "<%= request.getContextPath() %>/purchase/plan/purUrgentDesgin.jsp";
			window.open(executeUrl);
		}			
			
		</script>
	</div>
</body>
</html>