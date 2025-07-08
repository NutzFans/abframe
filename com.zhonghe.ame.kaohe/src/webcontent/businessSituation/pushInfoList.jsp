<%@page import="com.eos.data.datacontext.UserObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/common/common.jsp"%>
<html>
<head>
<title>统计图表 - 推送反馈</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%=request.getContextPath()%>/common/nui/nui.js" type="text/javascript"></script>
<style type="text/css">
.nui-radiobuttonlist-item {
	float: left;
	margin-left: 200px;
	color: pink;
}

.mini-grid-cell-nowrap {
	white-space: nowrap;
}
</style>
</head>
<body>
	<div style="width: auto; height: 100%; padding: 5px; overflow: hidden;">
		<div class="nui-fit">
			<div id="pushInfoGrid" sizeList="[20,30,50]" pageSize="20" class="nui-datagrid" style="width: 100%; height: 475px;" url="com.zhonghe.ame.kaohe.businessSituation.queryPushInfoList.biz.ext"
				dataField="pushInfoList">
				<div property="columns">
					<div field="userName" width="100" align="center" headerAlign="center">用户名</div>
					<div field="pushTime" width="100" headerAlign="center" align="center">推送时间</div>
					<div field="pushStatus" width=100 " headerAlign=" center" align="center" renderer="pushStatusRender">推送状态</div>
					<div field="readTime" width="100" headerAlign="center" allowSort="true" align="center">已阅时间</div>
					<div field="readStatus" width="100" align="center" headerAlign="center" allowSort="true" renderer="lookInfo">已阅状态</div>
				</div>
			</div>
		</div>

		<div style="text-align: center; padding: 5px; border-top: 0px;" class="nui-toolbar"></div>

	</div>

	<script type="text/javascript">
		nui.parse();
		var pushInfoGrid = nui.get("pushInfoGrid");
		var chartId;

		function setData(data) {
			chartId = data.id;
			search();
		}

		function search() {
			pushInfoGrid.sortBy("pushTime", "desc");
			pushInfoGrid.load({
				"chartId" : chartId
			});
		}

		function pushStatusRender(e) {
			if (e.value == '失败') {
				return "<a  href='javascript:void(0)' onclick='pushChart();' style='color: red;' >" + e.value + "</a>"
			} else {
				return e.value;
			}
		}

		function pushChart() {
			var row = pushInfoGrid.getSelected();
			if (row) {
				if (!confirm("确定要重新推送这条失败的数据吗？")) {
					return;
				} else {
					nui.mask({
						el : document.body,
						cls : 'mini-mask-loading',
						html : '统计图表推送中...'
					});
					var json = nui.encode({
						'pushInfoId' : row.id
					});
					nui.ajax({
						url : "com.zhonghe.ame.kaohe.businessSituation.sendTodoByPushInfo.biz.ext",
						type : 'POST',
						data : json,
						contentType : 'text/json',
						success : function(o) {
							nui.unmask(document.body);
							if (o.result == "1") {
								showTips("推送成功");
								pushInfoGrid.reload();
							} else {
								showTips("推送失败！请联系管理员", "danger");
							}
						}
					});
				}
			} else {
				showTips("请选中要推送的数据", "danger");
			}
		}
	</script>

</body>
</html>