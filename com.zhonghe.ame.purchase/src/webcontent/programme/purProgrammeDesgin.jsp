<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>采购文件 - 流程节点配置说明</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" href="../../common/layuimini/lib/layui-v2.6.3/css/layui.css" media="all">
</head>
<body>
	<div style="background-image: url('/default/common/flow/purchaseProgrameeFlow.png'); width: 1338px; height: 629px; position: relative;">

		<!-- 采购需求单位主要负责人审核 -->
		<div id="div1" style="position: absolute; left: 246px; top: 299px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 公司企业发展部(采购管理支持中心) - 备案 -->
		<div id="div2" style="position: absolute; left: 891px; top: 178px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 集采代理机构负责人审核 -->
		<div id="div3" style="position: absolute; left: 45px; top: 465px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 采购需求单位主要负责人确认 -->
		<div id="div4" style="position: absolute; left: 246px; top: 466px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 公司物项归口部门经办人审核 -->
		<div id="div5" style="position: absolute; left: 441px; top: 466px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 公司物项归口部门负责人审核 -->
		<div id="div6" style="position: absolute; left: 634px; top: 467px; width: 75px; height: 50px; cursor: pointer;"></div>

		<!-- 公司企业发展部(采购管理支持中心) - 审批 -->
		<div id="div7" style="position: absolute; left: 893px; top: 387px; width: 75px; height: 50px; cursor: pointer;"></div>

	</div>

	<script src="/default/common/layuimini/lib/layui-v2.6.3/layui.js" charset="utf-8"></script>
	<script type="text/javascript">
		layui.use([ 'jquery', 'layer' ], function() {
			$ = layui.jquery;
			layer = layui.layer;

			// 采购需求单位主要负责人审核
			$('#div1').click(function() {
				layer.open({
					title : '采购需求单位主要负责人审核 - 调整审批人',
					content : '通过【机构人员管理】模块修改发起人部门的【机构主管人员】字段',
					btn : []
				});
			});

			// 公司企业发展部(采购管理支持中心) - 备案
			$('#div2').click(function() {
				layer.open({
					title : '公司企业发展部(采购管理支持中心) - 备案 - 调整审批人',
					content : '通过【角色管理】模块修改角色编号为【purchaseFz】的角色数据',
					btn : []
				});
			});

			// 集采代理机构负责人审核
			$('#div3').click(function() {
				layer.open({
					title : '集采代理机构负责人 - 调整审批人',
					content : '通过修改【集采中心】机构对应的【机构主管人员】字段',
					btn : []
				});
			});

			// 采购需求单位主要负责人确认
			$('#div4').click(function() {
				layer.open({
					title : '采购需求单位主要负责人确认 - 调整审批人',
					content : '通过修改需求单位机构对应的【机构主管人员】字段',
					btn : []
				});
			});

			// 公司物项归口部门经办人审核
			$('#div5').click(function() {
				layer.open({
					title : '公司物项归口部门经办人审核 - 调整审批人',
					content : '通过【角色管理】模块修改角色编号为【purchaseGkAgent】的角色数据',
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

			// 公司企业发展部(采购管理支持中心) - 审批
			$('#div7').click(function() {
				layer.open({
					title : '公司企业发展部(采购管理支持中心) - 审批 - 调整审批人',
					content : '通过【角色管理】模块修改角色编号为【purchaseFz】的角色数据',
					btn : []
				});
			});

		});
	</script>

</body>
</html>