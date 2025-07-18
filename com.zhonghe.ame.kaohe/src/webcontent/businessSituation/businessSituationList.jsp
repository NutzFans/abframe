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
<title>经营情况推送</title>
</head>
<body>
	<div style="width: auto; height: 99%; padding: 5px;">
		<div id="businessSituationForm">
			<div class="nui-toolbar" style="border-bottom: 0; padding: 5px;">
				<table>
					<tr>
						<td style="width: 60px; text-align: right;">考核年份:</td>
						<td>
							<input id="years" name="criteria._expr[1].years" class="nui-textbox" style="width: 100px" />
						</td>
						<td style="width: 60px; text-align: right;">考核月份:</td>
						<td>
							<input id="months" name="criteria._expr[2].months" class="nui-textbox" style="width: 100px" />
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
						<a class="nui-button" id="jyqkts_tstjtb" iconCls="icon-upload" onclick="tstjtb()">推送统计图表</a>
						<a class="nui-button" id="jyqkts_sctjtb" iconCls="icon-add" onclick="sctjtb()">生成统计图表</a>
						<a class="nui-button" id="jyqkts_del" iconCls="icon-remove" onclick="jyqkts_del()">删除</a>
					</td>
				</tr>
			</table>
		</div>

		<div class="nui-fit">
			<div id="businessSituationGrid" sizeList="[50,100,500]" showPager="true" dataField="businessSituationList" pageSize="50" class="nui-datagrid" style="width: 100%; height: 100%;"
				url="com.zhonghe.ame.kaohe.businessSituation.queryBusinessSituationList.biz.ext">
				<div property="columns">
					<div type="checkcolumn"></div>
					<div field="pushStatus" width="50" headerAlign="center" allowSort="true" align="center" renderer="FONT_COLOR">是否推送</div>
					<div field="years" width="60" headerAlign="center" allowSort="true" align="center">考核年份</div>
					<div field="months" width="60" headerAlign="center" allowSort="true" align="center">考核月份</div>
					<div field="chartName" width="100" headerAlign="center" align="center" renderer="companyLeadershipChartPushDisplay">统计图表名称</div>
					<div field="chartMethod" width="80" headerAlign="center" allowSort="true" align="center">生成方式</div>
					<div field="createBy" width="80" headerAlign="center" allowSort="true" align="center">生成人员</div>
					<div field="createTime" width="80" headerAlign="center" allowSort="true" align="center">生成时间</div>
					<div width="60" headerAlign="center" align="center" renderer="push_render">推送反馈</div>
				</div>
			</div>
		</div>

	</div>

	<script type="text/javascript">
		nui.parse();
		var businessSituationForm = new nui.Form("#businessSituationForm");
		var businessSituationGrid = nui.get("businessSituationGrid");

		init();

		function init() {
			// 按钮权限
			if (userId != 'sysadmin') {
				getOpeatorButtonAuth("jyqkts_tstjtb,jyqkts_sctjtb,jyqkts_del");
			}
			search();
		}

		function search() {
			var data = businessSituationForm.getData();
			businessSituationGrid.sortBy("createTime", "desc");
			businessSituationGrid.load(data);
		}

		function tstjtb() {
			var row = businessSituationGrid.getSelected();
			if (row) {
				if (row.pushStatus == "已推送" || row.pushStatus == "已推送(部分成功)") {
					showTips("已推送的无法再次推送，部分成功情况通过推送反馈详情处理！", "danger");
				} else {
					if (!confirm("确定要推送数据吗？")) {
						return;
					} else {
						nui.mask({
							el : document.body,
							cls : 'mini-mask-loading',
							html : '统计图表推送中...'
						});
						var json = nui.encode({
							'id' : row.id
						});
						nui.ajax({
							url : "com.zhonghe.ame.kaohe.businessSituation.sendTodo.biz.ext",
							type : 'POST',
							data : json,
							contentType : 'text/json',
							success : function(o) {
								nui.unmask(document.body);
								if (o.result == "1") {
									showTips("推送成功");
									businessSituationGrid.reload();
								} else {
									showTips(o.result, "danger");
									businessSituationGrid.reload();
								}
							}
						});
					}
				}
			} else {
				showTips("请选中需要删除的数据记录", "danger");
			}
		}

		function sctjtb() {
			nui.open({
				url : "/default/kaohe/businessSituation/artificialGenerateChart.jsp",
				width : "450",
				height : "276",
				allowResize : false,
				title : "经营情况推送 - 生成统计图表",
				onload : function() {
					var iframe = this.getIFrameEl();
				},
				ondestroy : function(action) {
					search();
				}
			});
		}

		function companyLeadershipChartPushDisplay(e) {
			var record = e.record;
			var s = "<a  href='javascript:void(0)' onclick='companyLeadershipChartPushDisplayView();' >" + record.chartName + "</a>";
			return s;
		}

		function companyLeadershipChartPushDisplayView() {
			var row = businessSituationGrid.getSelected();
			executeUrl = "/default/kaohe/incomeChartPush/companyLeadershipChartPushDisplay.jsp?id=" + row.id;
			window.open(executeUrl);
		}

		function jyqkts_del() {
			var row = businessSituationGrid.getSelected();
			if (row) {
				if (!confirm("如果推送状态为【已推送】，删除后会影响OA待办，确定要删除吗？")) {
					return;
				} else {
					var json = nui.encode({
						'year' : row.years,
						'month' : row.months
					});
					nui.ajax({
						url : "com.zhonghe.ame.kaohe.businessSituation.deleteBusinessSituation.biz.ext",
						type : 'POST',
						data : json,
						contentType : 'text/json',
						success : function(o) {
							if (o.result == "1") {
								showTips("删除成功");
								businessSituationGrid.reload();
							} else {
								showTips("删除失败，请联系信息技术部人员！", "danger");
							}
						}
					});
				}
			} else {
				showTips("请选中需要删除的数据记录", "danger");
			}
		}

		function FONT_COLOR(e) {
			if (e.value == '未推送') {
				e.cellStyle = "color: red";
			} else if (e.value == '已推送(部分成功)') {
				e.cellStyle = "color: #ffaf40";
			} else {
				e.cellStyle = "color: green";
			}
			return e.value;
		}

		function push_render(e) {
			var record = e.record;
			if (record.pushStatus == "已推送" || record.pushStatus == "已推送(部分成功)") {
				return "<a  href='javascript:void(0)' onclick='pushInfoView();' >详情</a>"
			} else {
				return;
			}
		}

		function pushInfoView() {
			var row = businessSituationGrid.getSelected();
			nui.open({
				url : "/default/kaohe/businessSituation/pushInfoList.jsp",
				width : '540',
				height : '540',
				title : "统计图表 - 推送反馈",
				onload : function() {
					var iframe = this.getIFrameEl();
					iframe.contentWindow.setData(row);
				},
				ondestroy : function(action) {
					if (action == "ok") {
						grid.reload();
					}
					search();
				}
			})			
		}
	</script>

</body>
</html>