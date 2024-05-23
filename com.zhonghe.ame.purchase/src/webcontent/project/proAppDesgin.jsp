<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>采购立项 - 流程节点配置说明</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" href="../../common/layuimini/lib/layui-v2.6.3/css/layui.css" media="all">
</head>
<body>
	<div style="background-image: url('/default/common/flow/purProjectApproval.png'); width: 1338px; height: 629px; position: relative;">														

		<!-- 采购需求单位主要负责人审核 -->
		<div id="div1" style="position: absolute; left: 253px; top: 201px; width: 75px; height: 50px; cursor: pointer;"></div>
		
		<!-- 采购需求单位分管领导审核 -->
		<div id="div2" style="position: absolute; left: 741px; top: 202px; width: 75px; height: 50px; cursor: pointer;"></div>
		
		<!-- 分管采购公司领导审批 -->
		<div id="div3" style="position: absolute; left: 1078px; top: 91px; width: 75px; height: 50px; cursor: pointer;"></div>
		
		<!-- 集采中心负责人审核 -->
		<div id="div4" style="position: absolute; left: 72px; top: 346px; width: 75px; height: 50px; cursor: pointer;"></div>
		
		<!-- 采购需求单位主要负责人确认 -->
		<div id="div5" style="position: absolute; left: 253px; top: 346px; width: 75px; height: 50px; cursor: pointer;"></div>
		
		<!-- 公司物项归口部门经办人审核 -->
		<div id="div6" style="position: absolute; left: 433px; top: 346px; width: 75px; height: 50px; cursor: pointer;"></div>
		
		<!-- 公司物项归口部门负责人审核 -->
		<div id="div7" style="position: absolute; left: 614px; top: 346px; width: 75px; height: 50px; cursor: pointer;"></div>
		
		<!-- 集采中心分管领导审核 -->
		<div id="div8" style="position: absolute; left: 854px; top: 346px; width: 75px; height: 50px; cursor: pointer;"></div>
		
		<!-- 分管采购公司领导审批 -->
		<div id="div9" style="position: absolute; left: 1079px; top: 346px; width: 75px; height: 50px; cursor: pointer;"></div>																

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
			
			// 采购需求单位分管领导审核
			$('#div2').click(function() {
				layer.open({
					title : '采购需求单位分管领导审核 - 调整审批人',
					content : '需求单位为公司本部 - 通过【机构人员管理】模块修改发起人部门的【分管领导】字段；需求单位为分公司、事业部 - 通过【业务字典管理】模块修改类型代码为【ZH_PURCHASE_PLAN_LEADER】的字典项数据，修改后【刷新缓存】',
					btn : []
				});
			});
			
			// 分管采购公司领导审批
			$('#div3').click(function() {
				layer.open({
					title : '分管采购公司领导审批 - 调整审批人',
					content : '通过【角色管理】模块修改角色编号为【purchaseManage】的角色数据',
					btn : []
				});
			});
			
			// 集采中心负责人审核
			$('#div4').click(function() {
				layer.open({
					title : '集采中心负责人审核 - 调整审批人',
					content : '通过修改【集采中心】机构对应的【机构主管人员】字段',
					btn : []
				});
			});
			
			// 采购需求单位主要负责人确认
			$('#div5').click(function() {
				layer.open({
					title : '采购需求单位主要负责人确认 - 调整审批人',
					content : '通过修改需求单位机构对应的【机构主管人员】字段',
					btn : []
				});
			});
			
			// 公司物项归口部门经办人审核
			$('#div6').click(function() {
				layer.open({
					title : '公司物项归口部门经办人审核 - 调整审批人',
					content : '通过【角色管理】模块修改角色编号为【purchaseGkAgent】的角色数据',
					btn : []
				});
			});
			
			// 公司物项归口部门负责人审核
			$('#div7').click(function() {
				layer.open({
					title : '公司物项归口部门负责人审核 - 调整审批人',
					content : '通过【机构人员管理】模块修改归口部门的【机构主管人员】字段',
					btn : []
				});
			});
			
			// 集采中心分管领导审核
			$('#div8').click(function() {
				layer.open({
					title : '集采中心分管领导审核 - 调整审批人',
					content : '由于 “集采中心” 归属到 “河北分公司” ，因此需要通过修改业务字典中【ZH_PURCHASE_PLAN_LEADER】字典项进行配置',
					btn : []
				});
			});
			
			// 分管采购公司领导审批
			$('#div9').click(function() {
				layer.open({
					title : '分管采购公司领导审批 - 调整审批人',
					content : '通过【角色管理】模块修改角色编号为【purchaseManage】的角色数据',
					btn : []
				});
			});																		
																													
		});
	</script>

</body>
</html>