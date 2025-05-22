<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>小额采购 - 流程节点配置说明</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" href="../../common/layuimini/lib/layui-v2.6.3/css/layui.css" media="all">
</head>
<body>
	<div style="background-image: url('/default/common/flow/zeroPurchaseFlow.png'); width: 1463px; height: 1155px; position: relative;">

		<!-- 分公司部门负责人审核 -->
		<div id="div1" style="position: absolute; left: 163px; top: 198px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 分公司经营计划部审核、备案统计 -->
		<div id="div2" style="position: absolute; left: 163px; top: 334px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 中核供应链负责人审核 -->
		<div id="div3" style="position: absolute; left: 1038px; top: 218px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 部门负责人审核 -->
		<div id="div4" style="position: absolute; left: 556px; top: 334px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 公司本部设备监理经营主管 -->
		<div id="div5" style="position: absolute; left: 802px; top: 334px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 科技信息部审批 -->
		<div id="div7" style="position: absolute; left: 802px; top: 692px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 企业发展部审批 -->
		<div id="div8" style="position: absolute; left: 558px; top: 814px; width: 75px; height: 50px; cursor: pointer;"></div>

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

			// 分公司经营计划部审核、备案统计
			$('#div2').click(function() {
				layer.open({
					title : '分公司经营计划部审核、备案统计 - 调整审批人',
					content : '通过【角色管理】模块修改角色编号为【branchMangerAgent】的角色数据',
					btn : []
				});
			});

			// 中核供应链负责人审核
			$('#div3').click(function() {
				layer.open({
					title : '中核供应链负责人审核 - 调整审批人',
					content : '通过【角色管理】模块修改角色编号为【zh_gyl_fzr_lc】的角色数据',
					btn : []
				});
			});

			// 部门负责人审核
			$('#div4').click(function() {
				layer.open({
					title : '部门负责人审核 - 调整审批人',
					content : '通过【机构人员管理】模块修改发起人部门的【机构主管人员】字段',
					btn : []
				});
			});

			// 公司本部设备监理经营主管
			$('#div5').click(function() {
				layer.open({
					title : '公司本部设备监理经营主管 - 调整审批人',
					content : '通过【角色管理】模块修改角色编号为【manage13】的角色数据',
					btn : []
				});
			});

			// 科技信息部审批
			$('#div7').click(function() {
				layer.open({
					title : '科技信息部审批 - 调整审批人',
					content : '通过【角色管理】模块修改角色编号为【lxcg_kj_sp】的角色数据',
					btn : []
				});
			});

			// 企业发展部审批
			$('#div8').click(function() {
				layer.open({
					title : '企业发展部审批 - 调整审批人',
					content : '通过【角色管理】模块修改角色编号为【cg_sm_am_qf】的角色数据',
					btn : []
				});
			});			

		});
	</script>

</body>
</html>