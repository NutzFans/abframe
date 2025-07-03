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
		<div id=businessSituationForm>
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
						<a class="nui-button" id="jyqkts_del" iconCls="icon-remove" onclick="del()">删除</a>
					</td>
				</tr>
			</table>
		</div>

		<div class="nui-fit">
			<div id="businessSituationGrid" sizeList="[50,100,500]" showPager="true" multiSelect="true" dataField="businessSituationList" pageSize="50" class="nui-datagrid" style="width: 100%; height: 100%;"
				url="com.zhonghe.ame.kaohe.businessSituation.queryBusinessSituationList.biz.ext">
				<div property="columns">
					<div type="checkcolumn"></div>
					<div field="pushStatus" width="100" headerAlign="center" allowSort="true" align="center" renderer="FONT_COLOR">是否推送</div>
					<div field="years" width="80" headerAlign="center" allowSort="true" align="center">考核年份</div>
					<div field="months" width="80" headerAlign="center" allowSort="true" align="center">考核月份</div>
					<div field="chartName" width="100" headerAlign="center" align="center" renderer="companyLeadershipChartPushDisplay">统计图表名称</div>
					<div field="chartMethod" width="100" headerAlign="center" allowSort="true" align="center">生成方式</div>
					<div field="createBy" width="100" headerAlign="center" allowSort="true" align="center">生成人员</div>
					<div field="createTime" width="100" headerAlign="center" allowSort="true" align="center">生成时间</div>
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

		function FONT_COLOR(e) {
			if (e.value == '未推送') {
				e.cellStyle = "color: red";
			} else {
				e.cellStyle = "color: green";
			}
			return e.value;
		}
	</script>

</body>
</html>