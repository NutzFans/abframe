<%@page pageEncoding="UTF-8"%>
<%@include file="/purchase/common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>采购计划申请查看</title>
<meta name="renderer" content="webkit">
<script src="<%=request.getContextPath()%>/common/nui/warterMark.js" type="text/javascript"></script>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" href="../../common/layuimini/lib/layui-v2.6.3/css/layui.css" media="all">
<style type="text/css">
.layui-table,.layui-table-view {
	margin: 0px;
}

.layui-elem-quote {
	font-weight: bold;
}

.layui-table-cell {
	font-size: 14px;
	padding: 0 5px;
	height: auto;
	overflow: visible;
	text-overflow: inherit;
	white-space: normal;
	word-break: break-all;
}
</style>
</head>
<body>
	<div style="margin: 0 auto; width: 98%; height: auto;">
		<blockquote class="layui-elem-quote" style="margin-top: 10px; margin-bottom: 5px">变更明细(单位万元)</blockquote>
		<table id="grid" class="layui-hide"></table>
	</div>

	<script src="<%=request.getContextPath()%>/common/layuimini/lib/layui-v2.6.3/layui.js" charset="utf-8"></script>

	<script type="text/javascript">
		layui.use([ 'jquery', 'table' ], function() {
			var $ = layui.jquery;
			var table = layui.table;
			id =
	<%=request.getParameter("id")%>
		;
			var gridInt = table.render({
				elem : '#grid',
				url : 'com.zhonghe.ame.purchase.purchaseplan.queryChangeItemView.biz.ext',
				where : {
					"id" : id
				},
				cellMinWidth : 90,
				method : 'post',
				cols : [ [ {
					field : 'name',
					title : '变更计划名称'
				}, {
					field : 'createdUsername',
					title : '经办人'
				}, {
					field : 'needOrgName',
					title : '变更计划单位'
				}, {
					field : 'createdTime',
					title : '变更时间',
					templet: function(d){
						return layui.util.toDateString(d.createdTime,'yyyy-MM-dd');
					}
				}, {
					field : 'code',
					width: 200,
					title : '计划编码'
				}, {
					field : 'purchaseFirstName',
					title : '物项大类'
				}, {
					field : 'purchaseTwoName',
					title : '物项中类'
				}, {
					field : 'materialName',
					title : '物项名称'
				}, {
					field : 'number',
					title : '原预算数量'
				}, {
					field : 'newNumber',
					title : '变更后数量'
				}, {
					field : 'budgetAmount',
					title : '预算金额'
				}, {
					field : 'newBudgetAmount',
					title : '变更后金额'
				}, {
					field : 'changeReason',
					title : '调整原因'
				} ] ],
				parseData : function(res) {
					return {
						"code" : "0",
						"data" : res.datas
					};
				}
			});

		});
	</script>

</body>
</html>