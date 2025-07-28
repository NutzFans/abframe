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

.Edit_Button {
	color: #1B3F91;
}
</style>
<head>
<title>年度预算 - 填报数据</title>
</head>
<body>
	<div style="width: auto; height: 99%; padding: 5px;">
		<div class="nui-toolbar" style="border-bottom: 0; padding: 5px; background: #f1f2f6;">
			<span id="ysnd" style="font-size: 14px; margin-left: 10px; font-weight: bold;">预算年度：2025</span>
			<span id="yszt" style="font-size: 14px; margin-left: 20px; font-weight: bold;">预算主体：系统工程事业部</span>
		</div>
		<div class="mini-panel" title="第一部分：财务报表" showCollapseButton="true" expanded="true" style="width: 100%; height: 700px;">
			<div id="cwbbTreeGrid" class="mini-treegrid" showTreeIcon="false" treeColumn="name" idField="id" parentField="parent" resultAsTree="false" allowMoveColumn="false" allowResizeColumn="false"
				allowResize="false" style="width: 100%; height: 657px">
				<div property="columns">
					<div name="name" field="name" width="140" headerAlign="center" align="left">填报项</div>
					<div field="total_amount" width="80" headerAlign="center" align="center">合计</div>
					<div field="jan_amount" width="80" headerAlign="center" align="center">1月</div>
					<div field="feb_amount" width="80" headerAlign="center" align="center">2月</div>
					<div field="mar_amount" width="80" headerAlign="center" align="center">3月</div>
					<div field="apr_amount" width="80" headerAlign="center" align="center">4月</div>
					<div field="may_amount" width="80" headerAlign="center" align="center">5月</div>
					<div field="jun_amount" width="80" headerAlign="center" align="center">6月</div>
					<div field="jul_amount" width="80" headerAlign="center" align="center">7月</div>
					<div field="aug_amount" width="80" headerAlign="center" align="center">8月</div>
					<div field="sep_amount" width="80" headerAlign="center" align="center">9月</div>
					<div field="oct_amount" width="80" headerAlign="center" align="center">10月</div>
					<div field="nov_amount" width="80" headerAlign="center" align="center">11月</div>
					<div field="dec_amount" width="80" headerAlign="center" align="center">12月</div>
					<div width="30" headerAlign="center" align="center" renderer="onActionRenderer" cellStyle="padding:0;">操作</div>
				</div>
			</div>
		</div>
		<div class="mini-panel" title="第二部分：人员及人均情况" showCollapseButton="true" expanded="false" style="width: 100%;"></div>
		<div class="mini-panel" title="第三部分：劳动生产率" showCollapseButton="true" expanded="false" style="width: 100%;"></div>
		<div class="mini-panel" title="第四部分：人工成本-全口径" showCollapseButton="true" expanded="false" style="width: 100%;"></div>
	</div>

	<script type="text/javascript">
		nui.parse();
		var cwbbTreeGrid = nui.get("#cwbbTreeGrid");

		function setEditData(data) {
			$("#ysnd").text("预算年度：" + data.budgetYear);
			$("#yszt").text("预算主体：" + data.budgetAccountName);
			var json = nui.encode({
				'id' : data.id
			});
			ajaxCommon({
				url : "com.zhonghe.ame.finance.budgetFilling.queryFillingDatas.biz.ext",
				contentType : 'text/json',
				async : false,
				data : json,
				success : function(result) {
					var datas = result.fillingDatas;
					cwbbTreeGrid.loadList(datas, "id", "parent");
				}
			});
		}

		function onActionRenderer(e) {
			if (e.record.editable == "1") {
				return '<a href="javascript:void(0)" onclick="editYstb();">填报</a>';
			} else {
				return "";
			}
		}
	</script>

</body>
</html>