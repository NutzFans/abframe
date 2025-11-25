<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>年度采购计划(补充/变更) - 流程节点配置说明</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" href="../../common/layuimini/lib/layui-v2.6.3/css/layui.css" media="all">
</head>
<body>
	<div style="background-image: url('/default/common/flow/purchasePlanChangeFlow.png'); width: 1463px; height: 1053px; position: relative;">

		<!-- 分公司部门负责人审核 -->
		<div id="div1" style="position: absolute; left: 296px; top: 181px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 部门负责人审核 -->
		<div id="div2" style="position: absolute; left: 464px; top: 283px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 中核供应链负责人审核 -->
		<div id="div3" style="position: absolute; left: 644px; top: 183px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 分公司领导审核 -->
		<div id="div4" style="position: absolute; left: 118px; top: 181px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 公司物项归口部门经办人审核 -->
		<div id="div5" style="position: absolute; left: 465px; top: 382px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 公司物项归口部门负责人审核 -->
		<div id="div6" style="position: absolute; left: 464px; top: 463px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 公司企业发展部审核 -->
		<div id="div7" style="position: absolute; left: 465px; top: 565px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 公司企业发展部领导审核 -->
		<div id="div8" style="position: absolute; left: 466px; top: 670px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 采购需求单位分管领导审核 -->
		<div id="div9" style="position: absolute; left: 466px; top: 765px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 采购领导小组会&公司总经理办公会 -->
		<div id="div10" style="position: absolute; left: 644px; top: 894px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 分管采购公司领导审批 -->
		<div id="div11" style="position: absolute; left: 297px; top: 893px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 协管领导审批 -->
		<div id="div12" style="position: absolute; left: 297px; top: 765px; width: 75px; height: 50px; cursor: pointer;"></div>

	</div>

	<script src="/default/common/layuimini/lib/layui-v2.6.3/layui.js" charset="utf-8"></script>
	<script type="text/javascript">
		layui.use([ 'jquery', 'layer' ], function() {
			$ = layui.jquery;
			layer = layui.layer;

			// 分公司部门负责人审核
			$('#div1').click(function() {
				layer.open({
					title : '分公司部门负责人审核 - 调整审批人',
					content : '通过【机构人员管理】模块修改发起人部门的【机构主管人员】字段',
					btn : []
				});
			});

			// 部门负责人审核
			$('#div2').click(function() {
				layer.open({
					title : '部门负责人审核 - 调整审批人',
					content : '通过【机构人员管理】模块修改发起人部门的【机构主管人员】字段',
					btn : []
				});
			});

			// 中核供应链负责人审核
			$('#div3').click(function() {
				layer.open({
					title : '中核供应链负责人审核 - 调整审批人',
					content : '通过【角色管理】模块修改角色编号为【zh_gyl_fzr_jh】的角色数据',
					btn : []
				});
			});

			// 分公司领导审核
			$('#div4').click(function() {
				layer.open({
					title : '分公司领导审核 - 调整审批人',
					content : '通过【机构人员管理】模块修改发起部门对应所属分公司的【机构主管人员】字段',
					btn : []
				});
			});

			// 公司物项归口部门经办人审核
			$('#div5').click(function() {
				layer.open({
					title : '公司物项归口部门经办人审核 - 调整审批人',
					content : '通过【业务字典管理】模块修改类型代码为【purchaseGkAgent】的字典项数据，修改后【刷新缓存】',
					btn : []
				});
			});

			// 公司物项归口部门负责人审核
			$('#div6').click(function() {
				layer.open({
					title : '公司物项归口部门负责人审核 - 调整审批人',
					content : '通过【机构人员管理】模块修改归口部门的【机构主管人员】字段',
					btn : []
				});
			});

			// 公司企业发展部审核
			$('#div7').click(function() {
				layer.open({
					title : '公司企业发展部审核 - 调整审批人',
					content : '通过【角色管理】模块修改角色编号为【cg_plan_qf】的角色数据',
					btn : []
				});
			});

			// 公司企业发展部领导审核
			$('#div8').click(function() {
				layer.open({
					title : '公司企业发展部领导审核 - 调整审批人',
					content : '通过【角色管理】模块修改角色编号为【ZH_QFBFGLD】的角色数据',
					btn : []
				});
			});

			// 采购需求单位分管领导审核
			$('#div9').click(function() {
				layer.open({
					title : '采购需求单位分管领导审核 - 调整审批人',
					content : '需求单位为公司本部 - 通过【机构人员管理】模块修改发起人部门的【分管领导】字段；需求单位为分公司、事业部、中核供应链 - 通过【业务字典管理】模块修改类型代码为【ZH_PURCHASE_PLAN_LEADER】的字典项数据，修改后【刷新缓存】',
					btn : []
				});
			});

			// 采购领导小组会&公司总经理办公会
			$('#div10').click(function() {
				layer.open({
					title : '采购领导小组会&公司总经理办公会 - 调整审批人',
					content : '通过【角色管理】模块修改角色编号为【cg_plan_qf】的角色数据',
					btn : []
				});
			});

			// 分管采购公司领导审批
			$('#div11').click(function() {
				layer.open({
					title : '分管采购公司领导审批 - 调整审批人',
					content : '通过【角色管理】模块修改角色编号为【purchaseManage】的角色数据',
					btn : []
				});
			});
			
			// 协管领导审批
			$('#div12').click(function() {
				layer.open({
					title : '协管领导审批 - 调整审批人',
					content : '通过【业务字典管理】模块修改类型代码为【HT_XG_LD】的字典项数据，修改后【刷新缓存】',
					btn : []
				});
			});			

		});
	</script>

</body>
</html>